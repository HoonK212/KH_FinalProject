package com.dht.www.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dht.www.board.model.service.BoardService;
import com.dht.www.board.model.service.CommentsService;
import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/comments")
public class CommentsController {

	@Autowired
	private CommentsService commentsService;
	
	// 댓글 작성
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(Comments comments, Model model, HttpServletRequest req, HttpSession session) {
		
		String logInId = ((Users) session.getAttribute("logInInfo")).getId();
		comments.setId(logInId);
		int res = commentsService.insertComments(comments);
		
		if(res > 0) {
			model.addAttribute("url", req.getContextPath()+"/board/detail?no="+comments.getRef());
		} else {
			model.addAttribute("alertMsg", "댓글 작성에 실패하였습니다.");
			model.addAttribute("url", req.getContextPath()+"/board/detail?no="+comments.getRef());
		}
		
		return "/common/result";
	}
	
}
