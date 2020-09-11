package com.dht.www.mypage.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.mypage.model.dao.MypageDao;

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

}
