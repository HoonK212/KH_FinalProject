package com.dht.www.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/event")
public class EventController {
	
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
	public String eventRoulettefinal() {
		return "event/roulette";
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