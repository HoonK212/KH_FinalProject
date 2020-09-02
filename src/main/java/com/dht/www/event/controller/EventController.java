package com.dht.www.event.controller;

import java.util.HashMap;
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
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 가위바위보 VIEW
	@RequestMapping(value="/rockpaper", method=RequestMethod.GET)
	public String eventRockPaperScissorsfinal() {
		return "event/rockpaper";
	}
	
	// 출석체크 VIEW
	@RequestMapping(value="/attendancecheck", method=RequestMethod.GET)
	public String eventAttendancecheckfinal() {
		return "event/attendancecheck";
	}
	
	// 룰렛 VIEW
	@RequestMapping(value="/roulette", method=RequestMethod.GET)
	public void eventRoulette(Model model, HttpSession session) {
		
		Users login = (Users) session.getAttribute("logInInfo");
		
		//잔여 코인수
		model.addAttribute("coin", 0);
		
	}
	
	@RequestMapping(value="/roulette", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> rouletteResult(Model model, HttpSession session, String result, @RequestParam(required=false, defaultValue="guest") String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(result.equals("꽝!")) {
			//코인 수 차감
			return map;
		} else {
			String[] arr = result.split(" ");
			int point = Integer.parseInt(arr[0]);
			
			//포인트 업데이트, 코인수 차감
			
			map.put("point", point);
			map.put("coin", 0);
			
			return map;
		}
	}
	
	// 신기록 VIEW
	@RequestMapping(value="/record", method=RequestMethod.GET)
	public String eventRecordfinal() {
		return "event/record";
	}
	
	// 초성퀴즈 VIEW
	@RequestMapping(value="/quiz", method=RequestMethod.GET)
	public String eventQuizfinal() {
		return "event/quiz";
	}
	
}