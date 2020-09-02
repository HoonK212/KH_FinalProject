package com.dht.www.board.controller;

import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dht.www.board.model.service.ReportService;
import com.dht.www.board.model.vo.Report;
import com.dht.www.user.model.vo.Users;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	// 게시글 신고
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertReport(Report report, Model model, HttpServletRequest req, HttpSession session) {
		
		String logInId = ((Users) session.getAttribute("logInInfo")).getId();
		report.setId(logInId);
		
		int res = -1;
		try {
			res = reportService.insertReport(report);
		} catch (Exception e) { }
		
		if(res > 0) {
			model.addAttribute("url", req.getContextPath()+"/board/detail?no="+report.getRef());
		} else {
			model.addAttribute("alertMsg", "이미 신고한 게시글입니다.");
			model.addAttribute("url", req.getContextPath()+"/board/detail?no="+report.getRef());
		}
		
		return "/common/result";
	}
	
}
