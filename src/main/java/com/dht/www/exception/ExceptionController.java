package com.dht.www.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import common.exception.CustomException;
import common.exception.ErrorCode;

@ControllerAdvice(basePackages = {"com.dht.www"})
@Controller
public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public ModelAndView ex(Exception e) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("alertMsg", "에러가 발생했습니다.");
		mav.addObject("url", "/main");
		mav.setViewName("/common/result");
		
		return mav;
	}

	@ExceptionHandler(CustomException.class)
	public ModelAndView ex(CustomException e) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("alertMsg", ErrorCode.valueOf(e.getMessage()).getMESSAGE());
		mav.addObject("url", ErrorCode.valueOf(e.getMessage()).getURL());
		mav.setViewName("/common/result");
		
		return mav;
	}
	
}
