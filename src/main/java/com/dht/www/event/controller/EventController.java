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
	public String eventRockPaperScissorsfinal() {
		return "event/rockpaper";
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
	public void eventRecordfinal(Model model) {
	
//		//매주 수요일 최고기록 정산
//		Calendar wed = Calendar.getInstance();
//		
//		int hour = wed.get(Calendar.HOUR);
//		int minute = wed.get(Calendar.MINUTE);
//		int second = wed.get(Calendar.SECOND);
//				
//		if(wed.get(Calendar.DAY_OF_WEEK) == 4) {
//			if(hour == 0 && minute == 0 && second == 0 ) {
//				
//				
//			}
//		}
		
		Map<Integer, List> map = new HashMap<Integer, List>();
		map = eventService.selectRecord();
				
		System.out.println("최종"+ map);

		List list1 = new ArrayList();
		List list2 = new ArrayList();
		List list3 = new ArrayList();
		List list4 = new ArrayList();
		List list5 = new ArrayList();
		List list6 = new ArrayList();
		List list7 = new ArrayList();
		List list8 = new ArrayList();
		List list9 = new ArrayList();
		
//		for(int i=1; i<=map.size(); i++) {
//			System.out.println("이건 되니 : " + i);
//			System.out.println("이거배열안에꺼는" + map.get(i));
//			System.out.println(map.get(i).size() + "없나봐");
//			for(int j=0; j<map.get(i).size(); j++) {
//				System.out.println("이거는 " + j);
//				list.add(map.get(i).get(j));
//				System.out.println(map.get(i).get(j)+"값이 왜이래");
//			}
//		}
//		model.addAttribute("list",list);

		list1 = map.get(1);
		list2 = map.get(2);
		list3 = map.get(3);
		list4 = map.get(4);
		list5 = map.get(5);
		list6 = map.get(6);
		list7 = map.get(7);
		list8 = map.get(8);
		list9 = map.get(9);
		
//		for(int i=1; i<=map.size(); i++) {
//			
//			model.addAttribute(""+i+"", map.get(i));
//			System.out.println("숫자"+i);
//			System.out.println("모델"+model);
//		}
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		model.addAttribute("list5",list5);
		model.addAttribute("list6",list6);
		model.addAttribute("list7",list7);
		model.addAttribute("list8",list8);
		model.addAttribute("list9",list9);
		
		System.out.println("왜안되는데"+list1);
		
	}
	
	// 초성퀴즈 VIEW - event : 2, 하루 한 번 참여 가능
	@RequestMapping(value="/quiz", method=RequestMethod.GET)
	public void eventQuiz(HttpSession session, Model model) {
		
		Users login = (Users) session.getAttribute("logInInfo");
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
		
		//요일을 1-7으로 반환
		GregorianCalendar cal = new GregorianCalendar();
		
		String today = format.format(new Date());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", login.getId());
		map.put("dates", today);
		map.put("event", 2);
		
		
		int day = cal.get(Calendar.DAY_OF_WEEK);
			
		Map<String, Object> quiz = eventService.selectQuiz(day);
		String[] words = ((String) quiz.get("INI")).split("");
		quiz.put("words", words);
		quiz.put("length", words.length);
		
		model.addAttribute("attend", eventService.checkAtt(map));
		model.addAttribute("quiz", quiz);
		
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
	public void jooyi(HttpSession session, Model model) {

		Users login = (Users) session.getAttribute("logInInfo");
		SimpleDateFormat format1 = new SimpleDateFormat("yy/MM/dd");

		String today = format1.format(new Date());

		Map<String, Object> check = new HashMap<String, Object>();
		check.put("id", login.getId());
		check.put("dates", today);
		check.put("event", 1);

		model.addAttribute("attend", eventService.checkAtt(check));
		model.addAttribute("attList", eventService.selectAttend(login.getId()));

	}

	@RequestMapping("/check")
	@ResponseBody
	public int check(HttpSession session, String id, String today) {
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
