package com.dht.www.event.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dht.www.event.model.service.EventService;
import com.dht.www.exercise.model.vo.Compensation;
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;

	//====================== 공통 함수 ======================
	
	//사용자 현재 포인트, 코인 조회
	//key - 'point', 'coin'
	private Map<String, Object> checkPC(Compensation com) {
		return eventService.checkPC(com);
	}
	
	//이벤트에서 얻은 포인트 추가 - Compensation inc 필드 이용
	//업데이트 성공한 행 수 반환
	private int insertPoint(Compensation com) {
		return eventService.insertPoint(com);
	}
	
	//코인 차감 : -1 (이벤트 1회 실행)
	//업데이트 성공한 행 수 반환
	private int insertCoin(Compensation com) {
		return eventService.insertCoin(com);
	}
	
	//=======================================================
	
	// 가위바위보 VIEW
	@RequestMapping(value="/rockpaper", method=RequestMethod.GET)
	public void eventRockPaperScissorsfinal(HttpSession session, Model model) {
		Map<String, Object> coin;
		Users user = (Users) session.getAttribute("logInInfo");
		
		Compensation com = new Compensation();
		
		com.setId(user.getId());
		
		coin = eventService.checkPC(com);
		int num = Integer.parseInt( String.valueOf( coin.get("coin") ) );
		
		System.out.println("코인 나오니"+num);
		model.addAttribute("coin",num);
		model.addAttribute("event", 1);
	}
	
	@RequestMapping(value="/rockpaper", method=RequestMethod.POST)
	@ResponseBody
	public void eventRockPaperScissorsfinalCompensation(HttpSession session, 
			@RequestParam int result) {
		Users user = (Users) session.getAttribute("logInInfo");
		
		Compensation com = new Compensation();
		
		com.setId(user.getId());
		com.setInc(5);
		com.setEvent(4);
		
		insertCoin(com);
		
		if(result==1) {
			insertPoint(com);
		}
	}
	
	// 룰렛 VIEW
	@RequestMapping(value="/roulette", method=RequestMethod.GET)
	public void eventRoulette(Model model, HttpSession session) {
		Users login = (Users) session.getAttribute("logInInfo");
		Compensation com = new Compensation();
		com.setId(login.getId());
		
		//현재 포인트, 코인
		model.addAttribute("pointcoin", checkPC(com));
		model.addAttribute("event", 2);
	}
	
	@RequestMapping(value="/roulette", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> rouletteResult(Model model, HttpSession session, String result) {
		Users login = (Users) session.getAttribute("logInInfo");
		
		Compensation com = new Compensation();
		com.setId(login.getId());
		com.setEvent(3);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(result.equals("꽝!")) {
			//코인 수 차감
			insertCoin(com);
			map.put("getPoint", 0);
			
		} else {
			String[] arr = result.split(" ");
			com.setInc(Integer.parseInt(arr[0]));
			
			//포인트 업데이트, 코인수 차감
			insertCoin(com);
			insertPoint(com);
			map.put("getPoint", com.getInc());
			
		}
		map.put("pointcoin", checkPC(com));
		return map;
		
	}
	
	// 신기록 VIEW
	@RequestMapping(value = "/record", method = RequestMethod.GET)
	public void eventRecordfinal(Model model) {
		// 요일을 1-7으로 반환
		GregorianCalendar cal = new GregorianCalendar();
		int day = cal.get(Calendar.DAY_OF_WEEK);
		
		List<List<Map<String, Object>>> list = eventService.selectRecord(day);
		model.addAttribute("list", list);
		model.addAttribute("start", list.get(0).get(0).get("sdate"));
		model.addAttribute("end", list.get(0).get(0).get("edate"));
		model.addAttribute("event", 4);

	}
	
	// 초성퀴즈 VIEW - event : 2, 하루 한 번 참여 가능
	@RequestMapping(value="/quiz", method=RequestMethod.GET)
	public void eventQuiz(HttpSession session, Model model) {
		Users login = (Users) session.getAttribute("logInInfo");
		
		//요일을 1-7으로 반환
		GregorianCalendar cal = new GregorianCalendar();
		
		Compensation com = new Compensation();
		com.setId(login.getId());
		com.setEvent(2);
		
		int day = cal.get(Calendar.DAY_OF_WEEK);
			
		Map<String, Object> quiz = eventService.selectQuiz(day);
		String[] words = ((String) quiz.get("ini")).split("");
		quiz.put("words", words);
		quiz.put("length", words.length);
		
		model.addAttribute("attend", eventService.checkAtt(com));
		model.addAttribute("quiz", quiz);
		model.addAttribute("event", 3);
	}
	
	@RequestMapping(value="/quiz", method=RequestMethod.POST)
	public String quizResult(HttpSession session, String answer) {
		Users login = (Users) session.getAttribute("logInInfo");
		
		Compensation com = new Compensation();
		com.setId(login.getId());
		com.setEvent(2);
		com.setInc(10);
		insertPoint(com);
		
		return "redirect:/event/quiz";
		
	}
	
	// 출석체크 VIEW
	@RequestMapping(value = "/attend", method = RequestMethod.GET)
	public void eventAttend(HttpSession session, Model model) {
		Users login = (Users) session.getAttribute("logInInfo");

		Compensation com = new Compensation();
		com.setId(login.getId());
		com.setEvent(1);

		model.addAttribute("attend", eventService.checkAtt(com));
		model.addAttribute("attList", eventService.selectAttend(login.getId()));
		model.addAttribute("event", 0);

	}

	@RequestMapping("/check")
	@ResponseBody
	public int checkAttend(HttpSession session, String id, String today) {
		Users login = (Users) session.getAttribute("logInInfo");

		Compensation com = new Compensation();
		com.setId(login.getId());
		com.setEvent(1);

		int check = eventService.checkWeekAttend(id);
		if (check == 6) {
			com.setInc(5);
		} else {
			com.setInc(3);
		}
		insertPoint(com);
		
		return com.getInc();
		
	}
		
}
