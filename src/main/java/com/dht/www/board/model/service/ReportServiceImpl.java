package com.dht.www.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.board.model.dao.ReportDao;
import com.dht.www.board.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao reportDao;

	// 게시글 신고
	@Override
	public int insertReport(Report report) {
		return reportDao.insertReport(report);
	}

}
