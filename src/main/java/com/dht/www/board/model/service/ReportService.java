package com.dht.www.board.model.service;

import java.util.Map;

import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;
import com.dht.www.board.model.vo.Report;

public interface ReportService {

	// 게시글 신고
	public int insertReport(Report report);
	
}
