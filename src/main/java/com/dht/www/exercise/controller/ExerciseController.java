package com.dht.www.exercise.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dht.www.exercise.model.service.ExerciseService;
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/exercise")
public class ExerciseController {

	@Autowired
	public ExerciseService exerciseService;
	
	
	// 종류선택 VIEW
	@RequestMapping(value="/type", method=RequestMethod.GET)
	public String exerciseTypeForm( HttpSession session ,  Model model , HttpServletRequest req) {
		
		Users user = (Users)session.getAttribute("logInInfo");
		
		//설정한 목표있는지 찾기
		int goal = exerciseService.selectGoalInfo(user);
		//목표값
		model.addAttribute("goal", goal);
			
		
		return "exercise/exercise1";
	}
	
	// 등급선택 VIEW
	@RequestMapping(value="/level", method=RequestMethod.GET)
	public String exercise2( HttpSession session ) {
		return "exercise/exercise2";
	}
	
	// 운동선택 VIEW
	@RequestMapping(value="/select", method=RequestMethod.GET)
	public String exercise3( HttpSession session) {
		return "exercise/exercise3";
	}
	
	// 운동시작 VIEW
	@RequestMapping(value="/trainning", method=RequestMethod.GET)
	public String exercise4( HttpSession session) {
		return "exercise/exercise4";
	}

	 
	
//	@RequestMapping(value="/myroutine", method=RequestMethod.POST)
//	public String exerciseMyRoutine( HttpSession session) {
//		
//		Users user = (Users)session.getAttribute("logInInfo");
//		Users userpic = (Users)session.getAttribute("logInPic");
//		Map<String,Object> map = new HashMap();
//		
//		//설정한 운동종류번호가져오기
//		int exernum = exerciseService.selectExerciseMyRoutine(user);
//		System.out.println(exernum);
//		
//		int gradenum = exerciseService.selectExerciseMyGrade(user);
//		System.out.println("등급 : "+ gradenum);
//		
//		//NUMBER타입인거 int형 배열에 하나하나 넣기
//		String str = Integer.toString(exernum);
//		System.out.println(str);
//		int[] exArr = new int[str.length()];
//		for (int i = 0; i < str.length(); i++) {
//			exArr[i] = Integer.parseInt(String.valueOf(str.charAt(i)));
//		}
//		
//		map.put("exernum", exArr);
//		map.put("exergrade", gradenum);
//		
//		
//		return "exercise/exercise4";
//	}
	
	
	
	
	
	
	@RequestMapping(value="/level", method=RequestMethod.POST)
	public String exerciseTypeToLevel(@RequestParam String exerType, HttpSession session, Model model) {
		session.setAttribute("exerType", exerType);
		
		System.out.println(exerType);
		
		return "exercise/exercise2";
	}
	
	@RequestMapping(value="/select", method=RequestMethod.POST)
	public String exerciseLevelToSelect(@RequestParam String level, HttpSession session, Model model) {
		System.out.println(session.getAttribute("exerType"));
		System.out.println(level);
		
		session.setAttribute("level", level);
		
		return "exercise/exercise3";
	}
	
	
//	@RequestParam(required=false) String exerType ,
	@RequestMapping(value="/trainning", method=RequestMethod.POST)
	public String exerciseSelectToTrainning(@RequestParam(required=false) String exerType , @RequestParam(value="exercise" , required=false) String exerciseName, HttpSession session, Model model) {
		
		System.out.println("========== = == = =  = = = = = = = = = =");
		System.out.println(session.getAttribute("exerType"));
		System.out.println(session.getAttribute("level"));
		System.out.println(exerType);
		System.out.println(exerciseName);
		
		
		if(exerType =="myExer") {
			
		Users user = (Users)session.getAttribute("logInInfo");
//		Users userpic = (Users)session.getAttribute("logInPic");
		Map<String,Object> map = new HashMap();
		
		//설정한 운동종류번호가져오기
		int exernum = exerciseService.selectExerciseMyRoutine(user);
		System.out.println(exernum);
		
		int gradenum = exerciseService.selectExerciseMyGrade(user);
		System.out.println("등급 : "+ gradenum);
		
		//NUMBER타입인거 int형 배열에 하나하나 넣기
		String str = Integer.toString(exernum);
		System.out.println(str);
		int[] exArr = new int[str.length()];
		for (int i = 0; i < str.length(); i++) {
			exArr[i] = Integer.parseInt(String.valueOf(str.charAt(i)));
		}
	
		map.put("exernum", exArr);
		map.put("exergrade", gradenum);
		}
		
		
		
		
		model.addAttribute("exerciseName", exerciseName);
		
		
		return "exercise/exercise4";
	}
	
	
}