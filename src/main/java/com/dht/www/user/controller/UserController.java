package com.dht.www.user.controller;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dht.www.mypage.model.vo.Files;
import com.dht.www.user.model.service.UserService;
import com.dht.www.user.model.vo.Users;
import com.fasterxml.jackson.databind.JsonNode;

import common.exception.FileException;
import common.util.FileUtil;

@Controller()
@RequestMapping("/user")
public class UserController {
	
	
	@Autowired
	public UserService userService;

	// 로그인페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	// 로그인
	@RequestMapping(value = "/loginimple", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public int loginImpl(Users user, HttpSession session, Model model, HttpServletRequest request) {

		System.out.println(user.getId() + ", " + user.getPw());
		
		//회원 정보 꺼내옴
		Users res = userService.selectUser(user);
		//회원의 프로필 이미지 정보 꺼내옴
		Files pic = userService.selectUserProfile(user);
		
		//루트 컨텍스트
		String root = request.getContextPath();
		
		//회원정보 있음
		if(res != null) {
			
			//계정중지회원 확인
			if(  userService.checkReportedAccount(res) ) {
				System.out.println("계정중지 회원!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				return 3;
			}

			//로그인 성공
			session.setAttribute("logInInfo", res);
			session.setAttribute("logInPic", pic);
			System.out.println("프로필 저장 이미지 확인 : " + session.getAttribute("logInPic"));
			return 1;
		
		}else {//회원정보 없음
			System.out.println("로그인 실패!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return 2;
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		//세션에 저장한 회원정보 삭제
		session.removeAttribute("logInInfo");
		
		System.out.println("여기로 왔냐? 일반 로그아웃");
		
		
		//슬래시가 없으면 상대경로가 된다.
		return "redirect:login";
	}
	
	//카카오계정으로 로그인 
	@RequestMapping(value="/kakaoLogin", produces = "application/json" , method= {RequestMethod.GET,RequestMethod.POST})
	public String kakaoLogin(@RequestParam("code")String code, Model model , HttpSession session) {
		
			//code를 보내고 token을 받아오는 코드 
			JsonNode jsonToken= userService.getAccessToken(code);
			
			//access_token을 받는 코드 
			JsonNode access_token = jsonToken.get("access_token");
			
			System.out.println("access_token : " + access_token);
			
			//userInfo에 대한 정보를 가져오는 코드 
			JsonNode userInfo = userService.getKakaoUserInfo(access_token);
			
			//userInfo로 id가져오기
			String id = userInfo.path("id").asText();
			
			//카카오에서 받은 고유 인증번호 재조합
			String kakaoId = "kakao_" + id;
			
			//카카오 인증코드로 회원정보 조회
			Users res = userService.selectUserByApiId(kakaoId);
			
			if( res != null ) { //회원인 경우
				
				//회원 프로필사진 정보 조회
				Files pic = userService.selectUserProfile(res);
				
				//세션에 저장
				session.setAttribute("logInInfo", res);
				session.setAttribute("logInPic", pic);
				
				//슬래시를 붙이면 컨텍스트 루트(www)로 시작되는 절대경로가 된다.
				return "redirect:/main";
				
			}else { //회원이 아닌 경우
				
				//카카오 아이디 저장 
				model.addAttribute("kakaoId", kakaoId);
				
				//회원가입 페이지로 이동
				return "user/join_api";
				
			}
	}//kakaoLogin end
	
	//카카오 로그아웃
	@RequestMapping(value ="/kakaoLogout", method = RequestMethod.GET)
	public String kakaoLogout(HttpSession session) {
			
	//invalidate를 하면 session에 담긴 모든값이 사라지지만 
	//removeAttribute를 하면 loginInfo에 담긴내용만 사라진다  
  	session.removeAttribute("logInInfo");
  			
  	System.out.println("로그아웃되었습니다");
  	
  	return "redirect:login";
	  		
	}//kakaoLogout end
	
	
	//아이디찾기 페이지로 이동
	@RequestMapping(value ="/findId", method = RequestMethod.GET)
	public String findId() {
		
		return "user/findID";
	}
	
	//아이디찾기 이메일 발송
	@RequestMapping(value="/findIdImpl", method = RequestMethod.POST)
	public String findIdImpl(@RequestParam Map<String, Object> commandMap , HttpServletRequest request, Model model) {
		
		  System.out.println(commandMap);
		
		  String searchId = null;
		  
		  //아이디 조회해 오기
		  Users users = userService.getUsersId(commandMap);
		  
		  if( users != null) { //회원정보가 있는 경우
			  searchId = users.getId();
		  }else {
			  searchId = "";
		  }
		  
		  //urlPath 주소
		  String urlPath = request.getServerName() + ":" + request.getServerPort()
		  					+ request.getContextPath();
		  
		  //루트 컨텍스트
		  String root = request.getContextPath();
		  
		  //회원 메일로 아이디 발송
		  userService.mailSendingToFindId(commandMap, urlPath, searchId);
		  
		  model.addAttribute("alertMsg", "메일을 발송하였습니다.");
	      model.addAttribute("url", root + "/user/login");
		
		  return "common/result";
	}
	
	
	//비밀번호찾기 페이지로 이동
	@RequestMapping(value ="/findPw", method = RequestMethod.GET)
	public String findPW() {
		
		return "user/findPW";
	}
	
	//비밀번호 임시생성
	@RequestMapping(value = "/findPwImpl", method = RequestMethod.POST)
	public String findPwImpl(@RequestParam Map<String, Object> commandMap , HttpServletRequest request, Model model) {
		
		System.out.println(commandMap);
		
		//회원인 경우 임시 비밀번호 생성
		Users users = userService.getUsersPw(commandMap);
		
		//urlPath 주소
		String urlPath = request.getServerName() + ":" + request.getServerPort()
					+ request.getContextPath();
		  
		//루트 컨텍스트
		String root = request.getContextPath();
		
		String randomPw = null;
		
		 if( users != null) { //회원정보가 있는 경우
			  randomPw = users.getPw();
		  }else {
			  randomPw = "";
		  }
		
		//회원 메일로 아이디 발송
		userService.mailSendingToFindPw(commandMap, urlPath, randomPw);
		
		model.addAttribute("alertMsg", "메일을 발송하였습니다.");
		model.addAttribute("url", root + "/user/login");
		
		return "common/result";
	}
	
	//회원가입 페이지로 이동
	@RequestMapping(value ="/join", method = RequestMethod.GET)
	public String join() {
		
		return "user/join";
	}
	
	//회원가입을 위한 이메일 발송
	@RequestMapping(value ="/joinemailcheck", method = RequestMethod.POST)
	public String joinEmailCheck(@RequestParam List<MultipartFile> file, Users users, String addr_detail,
			HttpSession session, HttpServletRequest request, Model model ) {
		
		//상세주소(addr_detail)를 기본주소(addr)에 합치기
		String addr = users.getAddr() + " " + addr_detail;
		users.setAddr(addr);
		System.out.println("합친주소: " + addr);
		
		// 프로필 이미지 저장 위치 꺼내기
		String root = session.getServletContext().getRealPath("/resources/upload_user");
		
		// 프로필 이미지 업로드 및 DB에 저장
		userService.insertUserProfile(file, users, root);
		 
		// http://localhost:8089/www 꺼내기
		String urlPath = request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		
		// 회원가입을 위한 이메일 발송
		userService.mailSendingToJoin(users, urlPath);
		
		model.addAttribute("alertMsg", "이메일로 확인 메일이 발송 되었습니다.");
		model.addAttribute("url", "/login");
		 
		return "common/result";
	}
	
	//메일을 받은 경우 회원정보 저장
	@RequestMapping(value ="/joinimple", method = RequestMethod.POST)
	public String joinimple(Users users, HttpServletRequest request, Model model) {
		
		int res = userService.insertUser(users);
		if(res>0) {
			model.addAttribute("alertMsg", "회원가입 축하드립니다!!!!!");
			model.addAttribute("url", "/login");
		}else {
			model.addAttribute("alertMsg", "회원가입에 실패하였습니다.");
			model.addAttribute("url", "/join");
		}
		
		return "common/result";
	}
	
	//아이디 중복 확인
	@RequestMapping(value="/idcheck", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String idCheck(String id, HttpServletRequest request, Model model ){
		  
		  int res = userService.idCheck(id);
		  if(res > 0) { // 아이디 중복
			  return id;
		  }else { // 아이디 중복 아님
			  return "";
		  }
	}
		
	//닉네임 중복 확인
	@RequestMapping(value="/nickcheck", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String nickCheck(String nick, HttpServletRequest request, Model model ){
		
		int res = userService.nickCheck(nick);
		if(res > 0) { // 닉네임 중복
			return nick;
		}else { // 닉네임 중복 아님
			return "";
		}
	}
		
	//메일 중복 확인
	@RequestMapping(value="/mailcheck", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String mailCheck(String mail, HttpServletRequest request, Model model ){
		
		int res = userService.mailCheck(mail);
		if(res > 0) { // 이메일 중복
			return mail;
		}else { // 이메일 중복 아님
			return "";
		}
	}
	
	
	
}
