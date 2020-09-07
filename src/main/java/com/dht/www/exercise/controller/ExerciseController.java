package com.dht.www.exercise.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		
		// 로그인 세션 얻기
		Users user = (Users) session.getAttribute("logInInfo");
		
		
		// 만 나이 모델값 지정
		Map<String, Object> userInfo = new HashMap<>();
		userInfo.put("name", user.getName());
		userInfo.put("birth", user.getBirth());
		
		model.addAttribute("userAge", exerciseService.selectUserAge(userInfo));
		
		
		// 새로운 목표 설정 시
		if(exerType == null) {
			
			// 설정한 운동 종류 모델값 지정 / 세션 등록
			String[] newExerArr = exerciseName.split(",");
			model.addAttribute("ExerciseInfo", newExerArr);
			
			List<String> exerciseList = new ArrayList<>();
			
			for(int i=0; i<newExerArr.length; i++) {
				exerciseList.add(newExerArr[i]);
			}
			
			session.setAttribute("ExerciseInfo", exerciseList);
			
			
			// 운동 개수 세션에 저장
			session.setAttribute("exerciseLength", newExerArr.length);
			
			// session으로 넘어온 등급
			int userLevel = 0;
			if(!session.getAttribute("level").equals("") && session.getAttribute("level") != null) {
				userLevel = Integer.parseInt((String) session.getAttribute("level"));
				
				System.out.println("level         : " + userLevel);
			}
			
			// 모델값에 운동*등급 계산한 값 전달 / 세션 등록
			int[] newExerCnt = exerciseService.selectCalcExerCnt(newExerArr, userLevel);
			model.addAttribute("ExerciseCount", newExerCnt);
			session.setAttribute("ExerciseCount", newExerCnt);
		}
		

		// 설정한 목표 설정 시 
		if (exerciseName == null) {
			
			// 설정한 운동 종류 가져오기
			String exerInfo = exerciseService.selectExerciseMyRoutine(user);
			System.out.println(exerInfo);
			
			String[] goalExerArr = exerInfo.split(",");
			System.out.println("가져온 운동 정보" + goalExerArr);
			
			// 설정한 운동 종류 모델값 지정 / 세션 등록
			model.addAttribute("ExerciseInfo", goalExerArr);
			session.setAttribute("ExerciseInfo", goalExerArr);
			
			// 운동 개수 세션에 저장
			session.setAttribute("exerciseLength", goalExerArr.length);

			// 설정한 운동 등급 가져오기
			int exerGrade = exerciseService.selectExerciseMyGrade(user);
			System.out.println("등급 : " + exerGrade);
			
			// 모델값에 운동*등급 계산한 값 전달 / 세션 등록
			int[] newExerCnt = exerciseService.selectCalcExerCnt(goalExerArr, exerGrade);
			model.addAttribute("ExerciseCount", newExerCnt);
			session.setAttribute("ExerciseCount", newExerCnt);
		}
		
		
		
		
		return "exercise/exercise4";
	}
	
	
	@RequestMapping(value="/nextexer", method=RequestMethod.GET)
	public String nextExer(@RequestParam String exerName, Model model) {
		
		System.out.println("이이이이이이!!");
		System.out.println(exerName);
		
		
		return "exercise/"+exerName;
	}
	
	@RequestMapping(value="/nextexerjs", method=RequestMethod.GET , produces = "application/text;charset=utf8")
	@ResponseBody
	public String nextExerjs(@RequestParam String exerName, Model model ,  HttpServletRequest req) {
		System.out.println(exerName);
		
		
		String temp;
		File fileName = new File(req.getServletContext().getRealPath("WEB-INF/resources/"+exerName));
		BufferedReader br = null;
		String test = "";
		  
		try {
			br = new BufferedReader(new FileReader(fileName));
			while ((temp = br.readLine()) != null) {
				test += temp;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)	br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		  
		System.out.println("디디디디디");
		System.out.println(test);
		  
		return test;
	}
	
	@RequestMapping(value="/exercisefinish", method=RequestMethod.GET)
	public String exerciseFinish(Model model, HttpSession session) {
		
		// 로그인 세션 얻기
		Users user = (Users) session.getAttribute("logInInfo");
		String userid = user.getId();
		
		// 세션에 있는 운동개수 int형으로 파싱
		int exerciseLength = 0;
		if(!session.getAttribute("exerciseLength").equals("") && session.getAttribute("exerciseLength") != null) {
			exerciseLength = (int) session.getAttribute("exerciseLength");
		}

		// 세션에 있는 운동등급 int형으로 파싱
		int exerciseLevel = 0;
		if(!session.getAttribute("level").equals("") && session.getAttribute("level") != null) {
			exerciseLevel = Integer.parseInt((String) session.getAttribute("level"));
		}
		
		Map<String, Object> rewardMap = new HashMap<>();
		
		rewardMap.put("userid", userid);
		rewardMap.put("exerciseLength", exerciseLength);
		rewardMap.put("exerciseLevel", exerciseLevel);
		
		// 포인트지급 - 운동개수 * 운동등급
		if(exerciseLength != 0 && exerciseLevel != 0) {
			exerciseService.insertExerciseReward(rewardMap);
		}

		
		
		
		
		
		// --------------------------------------------------------------
		
		// 세션에 있는 운동종류만큼 String, int ArrayList 생성
		
		ArrayList<String> exerciseList = (ArrayList) session.getAttribute("ExerciseInfo");
		int[] exerciseCount = (int[]) session.getAttribute("ExerciseCount");
		
		
		
//		for(int i=0;i<exerciseList.size(); i++) {
//		    System.out.println(exerciseList.get(i) + "<br>");
//		}
//		for(int i=0;i<exerciseCount.length; i++) {
//			System.out.println(exerciseCount[i] + "<br>");
//		}
		
		
		
		Map<String, Object> recordMap = new HashMap<>();
		
		recordMap.put("userid", userid);
		recordMap.put("exerciseList", exerciseList);
		recordMap.put("exerciseCount", exerciseCount);
		recordMap.put("exerciseLength", exerciseCount.length);
		
		
		
		// 운동기록 저장
		exerciseService.insertEventRecord(recordMap);
		
		
		
		
		return "redirect: /main";
	}
	
	
	
}