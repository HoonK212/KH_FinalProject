package com.dht.www.user.model.dao;

import java.util.Map;

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

	//아이디를 찾기 위한 조회
	public Users getUsersId(Map<String, Object> commandMap) {

		return session.selectOne("USERS.getUsersId", commandMap);
	}
	
	//비밀번호를 찾기 위한 회원 조회
	public Users getUsersPw(Map<String, Object> commandMap) {

		return session.selectOne("USERS.getUsersPw", commandMap);
	}
	
	//임시비밀번호로 업데이트
	public int updateUsersPw(Users res) {
		
		return session.update("USERS.updateUsersPw", res);
	}
	
	//회원정보 입력
	public int insertUser(Users user) {

		return session.insert("USERS.insertUser", user);
	}
	
	//회원 프로필 사진 입력
	public int insertUserProfile(Map<String, String> f) {

		return session.insert("USERS.insertUserProfile", f);
	}

	public int insertFile02(Users user) {

		return session.insert("USERS.insertUserProfile02", user);
	}
	


}
