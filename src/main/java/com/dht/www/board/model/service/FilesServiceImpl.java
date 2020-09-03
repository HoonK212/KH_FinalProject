package com.dht.www.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.board.model.dao.FilesDao;

@Service
public class FilesServiceImpl implements FilesService {

	@Autowired
	private FilesDao filesDao;

	// 게시판 첨부파일 조회
	@Override
	public Map<String, Object> selectBoardFiles(int no) {
		
		Map<String, Object> filesListMap = new HashMap<String, Object>();
		
		List<Map<String, String>> flist = filesDao.selectBoardFiles(no);
		filesListMap.put("flist", flist);
		
		return filesListMap;
	}

}
