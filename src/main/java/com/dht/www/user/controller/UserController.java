package com.dht.www.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dht.www.user.model.service.UserService;
import com.dht.www.user.model.vo.Users;

@Controller()
@RequestMapping("/user")
public class UserController {
	
	
	@Autowired
	public UserService userService;
	

	// 로그인페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value = "/loginimple", method = RequestMethod.POST)
	public String loginImpl(Users user, HttpSession session, Model model, HttpServletRequest request) {

		System.out.println("loginimple [GET]");

		System.out.println(user.getId() + ", " + user.getPw());
		
		Users res = userService.selectUser(user);
		 
		System.out.println("로그인결과 : " + res);
		
		String root = request.getContextPath();
		
		if(res != null) {
			session.setAttribute("logInInfo", res);
			
			model.addAttribute("alertMsg", "로그인 되었습니다!");
			model.addAttribute("url", root + "/main");
		}else {
			
			model.addAttribute("alertMsg", "로그인 실패하였습니다!");
			model.addAttribute("url", root + "/user/login");
			
		}

		return "common/result";
	}

}
