package com.dht.www.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dht.www.mypage.model.service.MypageService;
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
	  System.out.println(commandMap);
	  
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
	   
	   return "redirect:goalsetting";
   }
   

   // 마이페이지 메인으로 이동
   @RequestMapping(value = "/mymain", method = RequestMethod.GET)
   public String myMain(HttpSession session, Model model) {
	   
	 Files pic = (Files) session.getAttribute("logInPic");
	 Users user = (Users) session.getAttribute("logInInfo");
	 
	 Map<String,Object> mygoal =  mypageService.selectExerciseGoal(user.getId());
		  
	 model.addAttribute("pic", pic);
	 model.addAttribute("user", user);
	 model.addAttribute("mygoal", mygoal);
	   
      return "mypage/myMain";
   }
   
   //주문 내역 조회
   @RequestMapping(value = "/orderlist" , method = RequestMethod.GET)
   public String selectOrderList(
		    @RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="3") int cntPerPage,
			HttpSession session, 
			Model model) {
	   
	   //마이페이지 사이드바에 사용할 정보
	   Users user = (Users)session.getAttribute("logInInfo");
	   Files pic = (Files) session.getAttribute("logInPic");

	   Map<String, Object> result = mypageService.selectOrderList(cPage, cntPerPage, user.getId());
	   System.out.println(result);
	   
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
}
