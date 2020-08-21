package com.dht.www.user.model.service;

import com.dht.www.user.model.vo.Users;

public interface UserService {
	
	// 로그인
	public Users selectUser(Users user);

}
