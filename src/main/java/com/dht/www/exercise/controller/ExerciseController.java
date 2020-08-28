package com.dht.www.exercise.controller;

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
	
	
	@RequestMapping(value="/trainning", method=RequestMethod.POST)
	public String exerciseSelectToTrainning(@RequestParam(value="exerType", required=false) String exerType , @RequestParam(value="exercise", required=false) String exerciseName, HttpSession session, Model model) {
		System.out.println("= = = = = = = = = = = = = = =  = = = = = = = = = =");
		System.out.println(session.getAttribute("exerType"));
		System.out.println(session.getAttribute("level"));
		System.out.println(exerType);
		System.out.println(exerciseName);
		
		
		// 새로운 목표 설정 시
		if(exerType == null) {
			String[] newExerArr = exerciseName.split(",");
			model.addAttribute("ExerciseInfo", newExerArr);
		}
		

		// 설정한 목표 설정 시 
		if (exerciseName == null) {
			Users user = (Users) session.getAttribute("logInInfo");

			// 설정한 운동 종류 가져오기
			String exerInfo = exerciseService.selectExerciseMyRoutine(user);
			System.out.println(exerInfo);
			
			String[] goalExerArr = exerInfo.split(",");
			System.out.println("가져온 운동 정보" + goalExerArr);
			
			// 설정한 운동 종류 모델값 지정
			model.addAttribute("ExerciseInfo", goalExerArr);

			// 설정한 운동 등급 가져오기
			int exerGrade = exerciseService.selectExerciseMyGrade(user);
			System.out.println("등급 : " + exerGrade);
			
			// 설정한 운동 등급 모델값 지정
			model.addAttribute("ExerciseGrade", exerGrade);
		}
		
		return "exercise/exercise4";
	}
	
	
}