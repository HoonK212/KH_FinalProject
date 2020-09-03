package com.dht.www.event.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	//이벤트에서 얻은 포인트 추가
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
		Compensation com = new Compensation();
		com.setId(login.getId());
		
		System.out.println(checkPC(com));
		
		//현재 포인트, 코인
		model.addAttribute("pointcoin", checkPC(com));
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