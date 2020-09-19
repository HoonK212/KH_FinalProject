package com.dht.www.admin.controller;

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

import com.dht.www.admin.model.service.AdminService;
import com.dht.www.admin.model.vo.Admin;
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/adminlogin")
public class AdminLoginController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 메인
	@RequestMapping("/main")
	public String adminMain(HttpSession session, Model model) {
		
		Map<String,Object> admin = (Map<String,Object>) session.getAttribute("logInInfo");
		
		model.addAttribute("admin", admin);
		
		if(admin != null) {
			return "redirect:admin/productlist";
		}else {
			return "admin/main";
		}
		
	}
	
	//관리자 로그인
	@RequestMapping(value = "/loginimple", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String loginImpl(@RequestParam Map<String,Object> admin, HttpSession session, Model model, HttpServletRequest request) {

		System.out.println(admin.get("id") + ", " + admin.get("pw"));
		
		//관리자 정보 조회
		Map<String,Object> res = adminService.selectAdmin(admin);
		
		//루트 컨텍스트
		String root = request.getContextPath();
		
		//관리자 정보 있음
		if(res != null) {

			//로그인 성공
			session.setAttribute("logInInfo", res);
			
			return "1";
		
		}else {//관리자정보 없음
			return "2";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		//세션에 저장한 회원정보 삭제
		session.removeAttribute("logInInfo");
		
		//슬래시가 없으면 상대경로가 된다.
		return "redirect:main";
	}

}
