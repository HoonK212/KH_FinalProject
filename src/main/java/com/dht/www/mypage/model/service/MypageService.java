package com.dht.www.mypage.model.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
	
	public int setGoal(Map<String, Object> goal);

	public int updateGoal(Map<String, Object> goal);
	
	public Map<String, Object> selectOrderList(int cPage, int cntPerPage, String id);

	public int cancelOrder(String op_no);

	public int submitReturn(Map data);

	public void insertReview(Map data);

	public int selectOrderAmountCnt(String id);
}
