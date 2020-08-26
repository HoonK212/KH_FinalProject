package com.dht.www.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dht.www.board.model.service.CommentsService;
import com.dht.www.board.model.service.RecommendService;
import com.dht.www.board.model.vo.Recommend;
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/recommend")
public class RecommendController {

	@Autowired
	private RecommendService recommendService;
	
	// 게시글 좋아요 & 싫어요
	@RequestMapping(value="/board", method=RequestMethod.GET, produces = "application/plain; charset=UTF-8")
	@ResponseBody
	public String boardRecommend(Recommend recommend, HttpSession session) {
		
		String logInId = ((Users) session.getAttribute("logInInfo")).getId();
		recommend.setId(logInId);
		System.out.println(recommend);
		int res = recommendService.insertBoardRecommend(recommend);
		
		if(res > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}
