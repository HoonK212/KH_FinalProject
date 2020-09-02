package com.dht.www.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.dht.www.board.model.vo.Board;

import common.exception.FileException;

public interface BoardService {

	// 게시글 목록 조회
	public Map<String, Object> selectBoardList(int currentPage, int cntPerPage);

	// 게시판 상세 조회
	public Map<String, String> selectBoard(int no);

	// 게시글 작성
//	public int insertBoard(Board board);

	// 게시글 작성 (첨부파일 포함)
	public int insertBoardWithFiles(Board board, List<MultipartFile> files, String path) throws FileException ;
	
}
