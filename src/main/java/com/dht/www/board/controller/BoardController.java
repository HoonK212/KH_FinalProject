package com.dht.www.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {

	// 게시판 목록 조회
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list() {
	}
	
	// 게시판 상세 조회
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void detail() {
	}
	
}
