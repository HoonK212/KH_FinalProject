package com.dht.www.mypage.model.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.mypage.model.dao.MypageDao;

import common.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDao mypageDao;
	
	@Override
	public int setGoal(Map<String, Object> goal) {
		
		return mypageDao.setGoal(goal);
	}

	@Override
	public int updateGoal(Map<String, Object> goal) {

		return mypageDao.updateGoal(goal);
	}

	@Override
	public Map<String, Object> selectOrderList(int cPage, int cntPerPage, String id) {
		
		Paging p = new Paging(mypageDao.selectOrderCnt(id), cPage, cntPerPage);
		Map<String,Object> mp = new HashMap<>();
		mp.put("page", p);
		mp.put("id", id);
		
		List<Map<String,Object>> olist = mypageDao.selectOrderList(mp);
		
		Map<String, Object> commandMap = new HashMap<>();
		commandMap.put("olist", olist);
		commandMap.put("page", p);

		return commandMap;
	}

	@Override
	public int cancelOrder(String op_no) {
		
		return mypageDao.cancelOrder(op_no);
	}

	@Override
	public int submitReturn(Map data) {
		
		return mypageDao.submitReturn(data);
	}

	@Override
	public void insertReview(Map data) {
		
		mypageDao.insertReview(data);
	}

	@Override
	public int selectOrderAmountCnt(String id) {
		
		return mypageDao.selectOrderAmountCnt(id);
	}

	@Override
	public Map<String, Object> selectExerciseGoal(String id) {
		
		Map<String,Object> commandMap = new HashMap<>();
		commandMap = mypageDao.selectExerciseGoal(id);
		
		String ex = (String) commandMap.get("exercises");
		String[] exArr = ex.split(",");
		
		String days = String.valueOf( commandMap.get("days") );
		String[] daysArr = days.split("");
		
		Map<String,Object> result = new HashMap<>();
		result.put("exercises", exArr);
		result.put("grade", commandMap.get("grade"));
		result.put("days", daysArr);
		result.put("id", commandMap.get("id"));
		
		return result;
	}

}
