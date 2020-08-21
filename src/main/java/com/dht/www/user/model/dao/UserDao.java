package com.dht.www.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.user.model.vo.Users;


@Repository
public class UserDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	//로그인
	public Users selectUser(Users user) {
		
		return session.selectOne("USERS.selectUser", user);
	}

}
