package com.dht.www.mypage.controller;

import java.util.HashMap;
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

import com.dht.www.mypage.model.service.MypageService;
import com.dht.www.mypage.model.vo.Account;
import com.dht.www.mypage.model.vo.Files;
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	
	@Autowired
	MypageService mypageService;
	
	
   // 목표설정 페이지 이동
   @RequestMapping(value = "/goalsetting", method = RequestMethod.GET)
   public String goalSetting(Model model, HttpSession session) {
	   
	  Files pic = (Files) session.getAttribute("logInPic");
	  Users user = (Users) session.getAttribute("logInInfo");
	  
	  Map<String,Object> commandMap =  mypageService.selectExerciseGoal(user.getId());
	  
	  model.addAttribute("pic", pic);
	  model.addAttribute("user", user);
	  model.addAttribute("mygoal", commandMap);
	  
      return "mypage/goalSetting";
   }
   
   //목표 설정
   @RequestMapping(value = "/setgoal", method = RequestMethod.POST)
   public String setGaol(String exercise, String days, String grade, HttpSession session) {
	   
	   String d = "";
	   String str = days;
	   String[] daysArr = str.split(",");
	   for(int i=0; i<daysArr.length; i++) {
		   d += daysArr[i]; 
	   }
	   
	   Users user = (Users)session.getAttribute("logInInfo");
	   Map<String,Object> commandMap =  mypageService.selectExerciseGoal(user.getId());
	   
	   Map<String, Object> goal = new HashMap<>();
	   goal.put("id", user.getId());
	   goal.put("days", d);
	   goal.put("exercise", exercise);
	   goal.put("grade", grade);
	   
	   if(commandMap == null) {
		   int res1 = mypageService.setGoal(goal);
	   }else {
		   int res2 = mypageService.updateGoal(goal);
	   }
	   
	   return "redirect:mymain";
   }
   

   // 마이페이지 메인으로 이동
   @RequestMapping(value = "/mymain", method = RequestMethod.GET)
   public String myMain(HttpSession session, Model model) {
	   
	 Files pic = (Files) session.getAttribute("logInPic");
	 Users user = (Users) session.getAttribute("logInInfo");
	 
	 Map<String,Object> mygoal =  mypageService.selectExerciseGoal(user.getId());
	 Map<Object,Object> myrecord = mypageService.selectMyRecord(user.getId());
	 List<String> successDate = mypageService.selectSuccessDates(user.getId());
	 double decal = mypageService.selectDeCal(user.getId());
	 
	 int mygoalCnt = 0;
	 int successCnt = 0;
	 double successPercent = 0;
	 //목표 요일 갯수
	 if(mygoal != null && successDate != null) {
		 mygoalCnt = ((List) mygoal.get("days")).size();
		 //성공 요일 갯수
		 successCnt = successDate.size();
		 //목표 성공률
		 successPercent = (int)( (double)successCnt/ (double)mygoalCnt * 100.0 );
	 }

	 model.addAttribute("pic", pic);
	 model.addAttribute("user", user);
	 model.addAttribute("mygoal", mygoal);
	 model.addAttribute("myrecord", myrecord);
	 model.addAttribute("successDate", successDate);
	 model.addAttribute("successPercent", successPercent);
	 model.addAttribute("decal", decal);
	   
      return "mypage/myMain";
   }
   
   //주문 내역 조회
   @RequestMapping(value = "/orderlist" , method = RequestMethod.GET)
   public String selectOrderList(
		    @RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="5") int cntPerPage,
			HttpSession session, 
			Model model) {
	   
	   //마이페이지 사이드바에 사용할 정보
	   Users user = (Users)session.getAttribute("logInInfo");
	   Files pic = (Files) session.getAttribute("logInPic");

	   //주문 조회
	   Map<String, Object> result = mypageService.selectOrderList(cPage, cntPerPage, user.getId());
	   System.out.println(result);
	   
	   //총 주문건수
	   int totalAmount = mypageService.selectOrderAmountCnt(user.getId());
	   System.out.println(totalAmount);
	   
	   model.addAttribute("olist", result.get("olist"));
	   model.addAttribute("page", result.get("page"));
	   model.addAttribute("totalamount", totalAmount);
	   model.addAttribute("pic", pic);
	   model.addAttribute("user", user);
	   
	   return "mypage/orderList";
   }
   
   //리뷰 작성
   @RequestMapping(value = "/insertreview" , method = RequestMethod.POST)
   public String insertReview(
		   @RequestParam Map data) {
	   
	   System.out.println("리뷰작성");
	   System.out.println(data);
	   
	   mypageService.insertReview(data);
	   
	   return "redirect:orderlist";
   }
   
   //구매 취소
   @RequestMapping(value = "/cancelorder" , method = RequestMethod.GET)
   public String cancelOrder(String op_no) {
	   
	   System.out.println("구매취소");
	   System.out.println(op_no);
	   
	   int res = mypageService.cancelOrder(op_no);
	   System.out.println("구매취소 업데이트 결과 : " + res);
	   return "redirect:orderlist";
   }

   //반품 신청
   @RequestMapping(value = "/submitreturn" , method = RequestMethod.GET)
   public String submitReturn(
		   @RequestParam Map data) {
	   
	   System.out.println("반품신청");
	   System.out.println(data);
	   
	   int res = mypageService.submitReturn(data);
	   System.out.println("반품신청 결과 : " + res);
	   
	   return "redirect:orderlist";
   }
   
   // -------------------------세민 ----------------------
   
   //이메일 중복 체크
   @RequestMapping(value = "/chMail" , method = RequestMethod.POST)
   @ResponseBody
   public String chMail(@RequestParam("mail") String mail , HttpSession session, HttpServletRequest request) {
   
      System.out.println("mail:" + mail );
      //기존의 이메일이 존재하는 지 확인 하는 메소드
      int res = mypageService.chMail(mail);
      if(res == 0) {//사용할 수 있는 이메일
      
      //랜덤 값 생성 
      int randomN =   (int)(Math.random()*100) + 1 ;
      
      String urlPath = request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
      
      //이메일 을 보내는 메소드 
      mypageService.sendingEmail(randomN, mail, urlPath);
         
      System.out.println("사용할 수 있는 이메일 ");
      
      return String.valueOf(randomN);
      
      }else {//사용할 수 없는 이메일
      System.out.println("사용할 수 없는 이메일 ");
         
      return "0";
      }
   
   }//end
   
   
   //비밀번호가 맞는지 확인하는 메소드 
   @RequestMapping(value = "/chPasswaord" , method = RequestMethod.POST)
   @ResponseBody
   public String chPasswaord(@RequestParam("pw") String pw , HttpSession session) {
      
      //세션에서 회원정보를 가져오는 메소드
      Users user = (Users) session.getAttribute("logInInfo");
      
      //비밀번호가 맞는지 확인하는 메소드 
      String chPw = mypageService.checkPassword(pw, user.getId());
      System.out.println("chPw :" + chPw);
      
      if(chPw.equals("0")) {//비밀번호가 일치하는 경우
         return "0";
      }else {//비밀번호가 일피하지 않는 경우
         return "1";
      }
   }//end
   
   //닉네임 중복체크
   @RequestMapping(value = "/chNick" , method = RequestMethod.POST)
   @ResponseBody
   public String chNick(@RequestParam("nick") String nick , HttpSession session) {
      
      System.out.println("nick:" + nick);
      
      int res = mypageService.chNick(nick);
      
      if(res == 0) {//사용할 수 있는 닉네임
         System.out.println("사용할 수 있는 닉네임");
      return "0";
      }else {//사용할 수 없는 닉네임
         System.out.println("사용할 수 없는 닉네임");
      return "1";
      }
   
   }//end
   
   //계좌 중복체크
   @RequestMapping(value = "/chAccount" , method = RequestMethod.POST)
   @ResponseBody
   public String chAccount(@RequestParam("account") long account , HttpSession session) {
      
      System.out.println("account:" + account);
      
      int res = mypageService.chAccount(account);
      
      if(res == 0) {//사용할 수 있는 계좌
      return "0";
      }else {//사용할 수 없는 계좌
      return "1";
      }
   
   }//end
   
   
   //회원정보 
   @RequestMapping(value = "/myInformation" , method = RequestMethod.GET)
   public String myInformation(Model model, HttpSession session) {
      
      //user 정보를 가져오는 메소드
      Users user = (Users)session.getAttribute("logInInfo");
      
      //파일 정보를 가져오는 메소드 
      Files file = (Files)session.getAttribute("logInPic");
      
      //계좌정보를 가져오는 메소드 
      Account account = mypageService.selectUserAccount(user.getId());
      
      model.addAttribute("user", user);
      model.addAttribute("pic", file);
      model.addAttribute("account", account);
      
      return "mypage/myInformation";
   }
   
      
   //회원정보를 수정하는 메소드 
   @RequestMapping(value = "/modifyMyInformation" , method = RequestMethod.POST)
   public String modifyMyInformation(@RequestParam List<MultipartFile> file, Users user ,Account account , HttpSession session) {
      
      
      System.out.println("file :" + file);
      System.out.println("user :" + user);
      System.out.println("account :" + account);
      
      Users userInfo = (Users) session.getAttribute("logInInfo");
      
      //세션에서 userId 가져 오기 
      String id = userInfo.getId();
      
      //session 에서 패스워드 가져옮 
      String sPw = userInfo.getPw();
      
      //user에서 가져온 패스워드 
      String pw = user.getPw();
      
      //user 정보를 update 하는 경우 
      if(sPw.equals(pw)){//비밀번호가 같은 경우
         
         //회원정보를 엡데이트 
         mypageService.updateUserInfo(user, id, account );
         
      }else {//비밀번호가 다른 경우
         
        //회원아이디를 암호화해서 업데이트 
        String codePw =  mypageService.codePassword(pw);
        user.setPw(codePw);
        mypageService.updateUserInfo(user, id, account );
        
      }
      
      String root = session.getServletContext().getRealPath("/resources/upload_user");
       
      // 프로필 이미지 업로드 및 DB에 저장//삭제 
      mypageService.insertUserProfile(file, id, root, session);
      
      
      //수정 된 user의 정보를 가져오는 메소드
      Users users = mypageService.selectUserInfo(id);
      
      //수정된 파일의 정보를 가져온는 메소드 
      Files files = mypageService.selectUserFile(id);
      System.out.println(files);
      
      //수정된 회원정보를 세션에 저장하는 메소드 
      session.setAttribute("logInInfo", users);
      session.setAttribute("logInPic", files);
      
      return "redirect:myInformation";
   }

   
   
   
   
   
   //마이 포인트
   @RequestMapping(value = "/myPoint" , method = RequestMethod.GET)
   public String myPoint(Model model, HttpSession session) {
      
      
      //세션에서 정보 가져오는 메소드 
      Users user = (Users)session.getAttribute("logInInfo");
      Files pic = (Files) session.getAttribute("logInPic");
      
      //세션에서 가져온 아이디로 회원이 보유한 포인트 , 코인을 가져오는 메소드 
      int point = mypageService.userPoint(user.getId());
      int coin = mypageService.userCoin(user.getId());
      
      
      //뷰에 전달하는 메소드 
      model.addAttribute("point", point);
      model.addAttribute("coin", coin);
      model.addAttribute("user", user);
      model.addAttribute("pic", pic);
      
      return "mypage/myPoint";
   }
   
   //point 차감하는 메소드 
   @RequestMapping(value = "/subPoint" , method = RequestMethod.POST)
   @ResponseBody
   public String subPoint(@RequestParam("subPoint") String subPoint , HttpSession session, HttpServletRequest request) {
            
            //세션 값에서 회원 정보가져오기
            Users user = (Users)session.getAttribute("logInInfo");
            
            String id = user.getId();
      
            System.out.println("subPoint:"+ subPoint);
      
           
            int point = Integer.parseInt(subPoint); 
          System.out.println("현금화 시키는 point 값 :" + point);
          
          //포인트 차감하는 메소드 
          mypageService.subPoint(point, id);
          
          return "0";
   }
      
   //페이징 처리를 해주어야 한다 
     //게시글 가져오는 메소드
   @RequestMapping(value = "/myWritten" , method = RequestMethod.GET)
   public String myWritten(@RequestParam(required=false, defaultValue="1") int cPage, Model model, HttpSession session) {
      
      //한 페이지당 10개의 게시글이 나오도록 한다 
      int cntPerPage = 10 ;
      
      //세션 정보를 가져오는 메소드 
      Users user = (Users)session.getAttribute("logInInfo");
      Files pic = (Files) session.getAttribute("logInPic");
      //세션 정보를 통해 회원의 게시글을 가져오는 메소드 
      Map <String, Object> board = mypageService.selectUserWritten(user.getId(), cPage, cntPerPage);
      
      //게시글을 뷰에 전달하는 메소도
      model.addAttribute("board", board.get("blist") );
      model.addAttribute("paging", board.get("paging") );
      model.addAttribute("pic", pic);
	  model.addAttribute("user", user);
      
      return "mypage/myWritten";
   }
   
   //게시글 삭제하는 메소드 
   @RequestMapping(value = "/deleteWritten", method = RequestMethod.POST)
   @ResponseBody
   public String deleteWritten(@RequestParam(value = "valueArrTest[]") List<String> valueArr, HttpSession session) {
      
      System.out.println("valueArr :" + valueArr);
      
      //세션으로 user 정보 가져오기 
      Users user = (Users) session.getAttribute("logInInfo");
      

      //list 값을 불러오는 메소드 
      for(String no : valueArr) {
         //파일정보 삭제하기 
         mypageService.deleteWrittenfiles(no, session);
         
         //no에 해당하는 게시글을 삭제하는 메소드 
         mypageService.deleteWritten(no);
         
      }
      
      return "success";
      
   }//end


   
  //페이징 처리를 해주어야 한다 
     //댓글 가져오는 메소드 
   @RequestMapping(value = "/myComment" , method = RequestMethod.GET)
   public String myComment(@RequestParam(required=false, defaultValue="1") int cPage, Model model, HttpSession session) {
      
      //페이지당 10개를 보여준다 
      int cntPerPage = 10 ;
      
      //세션 정보를 가져오는 메소드 
      Users user = (Users)session.getAttribute("logInInfo");
      Files pic = (Files) session.getAttribute("logInPic");
      //세션 정보를 통해 회원의 게시글을 가져오는 메소드 
      Map <String, Object> comment = mypageService.selectUserComments(user.getId(), cPage, cntPerPage );
      
      //게시글을 뷰에 전달하는 메소도
      model.addAttribute("comment", comment.get("clist") );
      model.addAttribute("paging", comment.get("paging") );
      model.addAttribute("pic", pic);
	  model.addAttribute("user", user);
      
      return "mypage/myComment";
   } 
   
  //댓글 삭제하는 메소드 
   @RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
   @ResponseBody
   public String deleteComment(@RequestParam(value = "valueArrTest[]") List<String> valueArr) {
      
      System.out.println("valueArr :" + valueArr);

      //list 값을 불러오는 메소드 
      for(String no : valueArr) {
         
         //no에 해당하는 게시글을 삭제하는 메소드 
         mypageService.deleteComment(no);
         
      }
      
      return "success";
      
   }//end
   
   
   
   
   
}
