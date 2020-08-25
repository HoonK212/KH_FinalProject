package com.dht.www.user.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.dht.www.mypage.model.vo.Files;
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
	public void mailSendingToFindId(Map<String, Object> commandMap, String urlPath, String searchId);
	
	//회원인 경우 임시비밀번호 생성
	public Users getUsersPw(Map<String, Object> commandMap);
	
	//회원 메일로 비밀번호 발송
	public void mailSendingToFindPw(Map<String, Object> commandMap, String urlPath, String randomPw);
	
	//프로필 이미지 저장
	public void insertUserProfile(List<MultipartFile> files, Users user, String root);
	
	//회원 가입을 위한 이메일 발송
	public void mailSendingToJoin(Users users, String urlPath);
	
	//회원 정보 저장
	public int insertUser(Users users);
	
	//회원 프로필 이미지 파일 정보 
	public Files selectUserProfile(Users user);
	
	
}
