package com.dht.www.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dht.www.board.model.service.BoardService;
import com.dht.www.board.model.service.CommentsService;
import com.dht.www.board.model.service.FilesService;
import com.dht.www.board.model.vo.Board;
import com.dht.www.user.model.vo.Users;

import common.exception.FileException;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private FilesService filesService;
	
	@Autowired
	private CommentsService commentsService;
	
	// 게시판 목록 조회
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(@RequestParam(required=false, defaultValue="1") int cPage, @RequestParam(required=false, defaultValue="10") int cntPerPage, Model model) {
		
		Map<String, Object> boardListMap = boardService.selectBoardList(cPage, cntPerPage);
		model.addAttribute("boardData", boardListMap);
	}
	
	// 게시판 상세 조회
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void detail(@RequestParam int no, Model model) {
		
		Map<String, String> boardMap = boardService.selectBoard(no);
		model.addAttribute("board", boardMap);
		
		Map<String, Object> filesListMap = filesService.selectBoardFiles(no);
		model.addAttribute("filesData", filesListMap);
		
		Map<String, Object> commentsListMap = commentsService.selectCommentsList(no);
		model.addAttribute("commentsData", commentsListMap);
	}
	
	// 게시글 작성 페이지
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public void write(HttpSession session, Model model) {
		Users login = (Users) session.getAttribute("logInInfo");
		model.addAttribute("profile", boardService.selectProfile(login));
	}
	
	
	// 게시글 작성 (첨부파일 포함)
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(@RequestParam List<MultipartFile> files, HttpSession session, Board board, Model model, HttpServletRequest req) throws FileException {
		
		String logInId = ((Users) session.getAttribute("logInInfo")).getId();
		board.setId(logInId);
		
		String path = session.getServletContext().getRealPath("/resources/upload_board");
		int res = 0;
		
		try {
			res = boardService.insertBoardWithFiles(board, files, path);
		} catch (Exception e) {
		}
		
		if(res > 0) {
			model.addAttribute("url", req.getContextPath()+"/board/list");
		} else {
			model.addAttribute("alertMsg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("url", req.getContextPath()+"/board/list");
		}
		
		return "/common/result";
	}
	
	// 게시글 수정 페이지
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modify(@RequestParam int no, Model model) {
		
		Map<String, String> boardMap = boardService.selectBoard(no);
		model.addAttribute("board", boardMap);
	}
	
	// 게시글 수정
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(Board board, Model model, HttpServletRequest req) {
		
		int res = 0;
		
		try {
			res = boardService.updateBoardContent(board);
		} catch (Exception e) {
		}
		
		if(res > 0) {
			model.addAttribute("url", req.getContextPath()+"/board/detail?no="+board.getNo());
		} else {
			model.addAttribute("alertMsg", "게시글 작성에 실패하였습니다.");
			model.addAttribute("url", req.getContextPath()+"/board/detail?no="+board.getNo());
		}
		
		return "/common/result";
	}
	
}
