package com.dht.www.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dht.www.user.model.dao.UserDao;
import com.dht.www.user.model.vo.Users;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public Users selectUser(Users user) {
		
		return userDao.selectUser(user);
	}

}
