package com.dht.www.exercise.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dht.www.exercise.model.service.ExerciseService;

@Controller
@RequestMapping("/exercise")
public class ExerciseController {

	@Autowired
	public ExerciseService exerciseService;
	
	
	// 종류선택 VIEW
	@RequestMapping(value="/type", method=RequestMethod.GET)
	public String exerciseTypeForm() {
		return "exercise/exercise1";
	}
	
	// 등급선택 VIEW
	@RequestMapping(value="/level", method=RequestMethod.GET)
	public String exercise2() {
		return "exercise/exercise2";
	}
	
	// 운동선택 VIEW
	@RequestMapping(value="/select", method=RequestMethod.GET)
	public String exercise3() {
		return "exercise/exercise3";
	}
	
	// 운동시작 VIEW
	@RequestMapping(value="/trainning", method=RequestMethod.GET)
	public String exercise4() {
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
	public String exerciseSelectToTrainning(@RequestParam String exercise, HttpSession session, Model model) {
		System.out.println(session.getAttribute("exerType"));
		System.out.println(session.getAttribute("level"));
		System.out.println(exercise);
		
		return "exercise/exercise4";
	}
	
	
}