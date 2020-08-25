package com.dht.www.user.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.dht.www.user.model.vo.Users;

public interface UserService {
	
	// 로그인
	public Users selectUser(Users user);
	
	//계정중지 회원확인
	public boolean checkReportedAccount(Users user);
		
	//code를 보내고 access_token을 받아오는 코드 
	public <JsonNode> JsonNode getAccessToken(String code);
	
	//토큰을 통해 회원정보를 가져오는 코드 
	public <JsonNode> JsonNode getKakaoUserInfo(JsonNode access_token);

	//회원 아이디 조회
	public Users getUsersId(Map<String, Object> commandMap);
	
	//회원 메일로 아이디 발송
	public void mailSending(Map<String, Object> commandMap, String urlPath, String searchId);
	
	//회원인 경우 임시비밀번호 생성
	public Users getUsersPw(Map<String, Object> commandMap);
	
	//회원 메일로 비밀번호 발송
	public void mailSendingFindPw(Map<String, Object> commandMap, String urlPath, String randomPw);
	
	//회원가입
	public void insertUser(List<MultipartFile> files, Users user, String root);
	
	
}
