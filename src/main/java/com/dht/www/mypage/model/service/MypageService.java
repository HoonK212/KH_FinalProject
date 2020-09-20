package com.dht.www.mypage.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.dht.www.mypage.model.vo.Account;
import com.dht.www.mypage.model.vo.Files;
import com.dht.www.user.model.vo.Users;

public interface MypageService {
	
	public int setGoal(Map<String, Object> goal);

	public int updateGoal(Map<String, Object> goal);
	
	public Map<String, Object> selectOrderList(int cPage, int cntPerPage, String id);

	public int cancelOrder(String op_no);

	public int submitReturn(Map data);

	public void insertReview(Map data);

	public int selectOrderAmountCnt(String id);

	public Map<String, Object> selectExerciseGoal(String id);

	public List<String> transformToDOW(String[] daysArr);
	
	public Map<Object, Object> selectMyRecord(String id);
	
	public List<String> selectSuccessDates(String id);
	
	// -------- 세민 ------------
	   //기존의 이메일이 존재하는 지 확인 하는 메소드 
	   public int chMail(String mail);
	   //기존의 닉네임이 존재하는지 확인 하는 메소드 
	   public int chNick(String nick);
	   //계좌가 이미 존재하는 지 확인하는 메소드 
	   public int chAccount(long account);
	   //비밀번호를 암호화 하는 메소드 
	   public String codePassword(String pw);
	   //회원정보를 업데이트 하는 코드 
	   public void updateUserInfo(Users user, String id, Account account);
	   //회원이미지를 업로드 하는 메소드 
	   public void insertUserProfile(List<MultipartFile> file, String id, String root, HttpSession session);
	   //user의 정보를 가져오는 메소드 
	   public Users selectUserInfo(String id);
	   //파일 정보를 가져오는 메소드 
	   public Files selectUserFile(String id);
	   //계좌 정보를 가져오는 메소드 
	   public Account selectUserAccount(String id);
	   //에일변경을 하는 경우 메일 인증을 위해 메일보낸는 메소드 
	   public void sendingEmail(int randomN, String mail, String urlPath);
	   //point 가져오는 메소드
	   public int userPoint(String id);
	   //coin 가져오는 메소드
	   public int userCoin(String id);
	   //point 차감하는 메소드 
	   public void subPoint(int point, String id);
	   //게시글을 가져오는 메소드 
	   public Map<String, Object> selectUserWritten(String id, int cPage, int cntPerPage);
	   //댓글 가져오는 메소드 
	   public Map<String, Object> selectUserComments(String id, int cPage, int cntPerPage);
	   //게시글을 삭제하는 메소드 
	   public void deleteWritten(String no);
	   //댓글을 삭제하는 메소드
	   public void deleteComment(String no);
	   //패스워드가 맞는지 확인하는 메소드
	   public String checkPassword(String pw, String id);

	

	
	

}
