package com.dht.www.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dht.www.mypage.model.service.MypageService;
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	
	@Autowired
	MypageService mypageService;
	
   // 목표설정 페이지 이동
   @RequestMapping(value = "/goalSetting", method = RequestMethod.GET)
   public String goalSetting() {
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
	   
	   Map<String, Object> goal = new HashMap<>();
	   goal.put("id", user.getId());
	   goal.put("days", d);
	   goal.put("exercise", exercise);
	   goal.put("grade", grade);
	   
	   int res = mypageService.setGoal(goal);
	   
	   return "mypage/goalSetting";
   }
   
   //목표 설정 수정
   @RequestMapping(value = "/updategoal", method = RequestMethod.POST)
   public String updateGoal(String exercise, String days, String grade, HttpSession session) {
	   
	   String d = "";
	   String str = days;
	   String[] daysArr = str.split(",");
	   for(int i=0; i<daysArr.length; i++) {
		   d += daysArr[i]; 
	   }
	   
	   Users user = (Users)session.getAttribute("logInInfo");
	   
	   Map<String, Object> goal = new HashMap<>();
	   goal.put("id", user.getId());
	   goal.put("days", d);
	   goal.put("exercise", exercise);
	   goal.put("grade", grade);
	   
	   int res = mypageService.updateGoal(goal);

	   return "mypage/goalSetting";
   }

   // 마이페이지 메인으로 이동
   @RequestMapping(value = "/myMain", method = RequestMethod.GET)
   public String myMain() {
      return "mypage/myMain";
   }


}
