package com.dht.www.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dht.www.board.model.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	// 게시판 목록 조회
	@RequestMapping(value="/list")
	public void list(@RequestParam(required=false, defaultValue="1") int cPage, @RequestParam(required=false, defaultValue="5") int cntPerPage, Model model) {
		
		Map<String, Object> commandMap = boardService.selectBoardList(cPage, cntPerPage);
		model.addAttribute("boardData", commandMap);
	}
	
	// 게시판 상세 조회
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void detail() {
	}
	
	// 게시글 작성 페이지
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write() {
	}
	
	// 작성한 게시글 삽입
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public void insert() {
	}
	
}
