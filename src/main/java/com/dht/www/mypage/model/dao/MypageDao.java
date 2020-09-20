package com.dht.www.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;
import com.dht.www.mypage.model.vo.Account;
import com.dht.www.mypage.model.vo.Files;
import com.dht.www.user.model.vo.Users;

import common.util.Paging;

@Repository
public class MypageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int setGoal(Map<String, Object> goal) {

		return sqlSession.insert("MYPAGE.setGoal", goal);
	}

	public int updateGoal(Map<String, Object> goal) {

		return sqlSession.update("MYPAGE.updateGoal", goal);
	}
	
	public List<Map<String,Object>> selectOrderList(Map<String, Object> mp){
		
		return sqlSession.selectList("MYPAGE.selectOrderList", mp);
	}

	public int selectOrderCnt(String id) {

		return sqlSession.selectOne("MYPAGE.selectOrderCnt", id);
	}

	public int cancelOrder(String op_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("MYPAGE.cancelOrder", op_no);
	}

	public int submitReturn(Map data) {
		
		return sqlSession.insert("MYPAGE.submitReturn", data);
	}

	public void insertReview(Map data) {
		sqlSession.insert("MYPAGE.insertReview", data);
	}

	public int selectOrderAmountCnt(String id) {
		
		return sqlSession.selectOne("MYPAGE.selectOrderAmountCnt", id);
	}

	public Map<String, Object> selectExerciseGoal(String id) {
		
		return sqlSession.selectOne("MYPAGE.selectExerciseGoal", id);
	}

	//기록 날짜 조회
	public List<Map<String,Object>> selectMyRecordDates(String id) {
		
		return sqlSession.selectList("MYPAGE.selectMyRecordDates", id);
	}
	
	//날짜로 나의 기록 조회
	public List<Map<String, Object>> selectMyRecordByDate(Map<String, Object> param) {
		
		return sqlSession.selectList("MYPAGE.selectMyRecordByDate", param);
	}

	// 운동 조회  
	public List<Map<String, Object>> selectExercises() {
		
		return sqlSession.selectList("MYPAGE.selectExercise");
	}
	
	// 운동 이름으로 운동 번호 조회
	public int selectExerciseByName(String string) {
		
		return sqlSession.selectOne("MYPAGE.selectExerciseByName", string);
	}
	
	public int selectSuccessDate(Map<String, Object> param) {
	
		return sqlSession.selectOne("MYPAGE.selectSuccessDate", param);
	}
	
	public double selectDeCal(Map<String, Object> param) {
		
		return sqlSession.selectOne("MYPAGE.selectDeCal", param);
	}
	
	
	// ------ 세민 ------
	
	   
	   //중복된 메일인지 확인하는 메소드 
	   public int chMail(String mail) {
	      return sqlSession.selectOne("MYPAGE.chMail", mail);
	   }
	   
	   //기존에 존재하는 닉네임인지 확인하는 메소드
	   public int chNick(String nick) {
	      return sqlSession.selectOne("MYPAGE.chNick", nick);
	   }
	   
	   //계좌를 확인하는 메소드 
	   public int chAccount(long account) {
	      return sqlSession.selectOne("MYPAGE.chAccount", account);
	   }
	   
	   //회원정보를 업데이트 하는 메소드 
	   public void updateUserInfo(Users user, String id) {
	      
	      //회원정보를 update하는 메소드 
	      Map <String, Object> map =new  HashMap <String, Object> ();
	      map.put("pw", user.getPw());
	      map.put("mail", user.getMail());
	      map.put("nick", user.getNick());
	      map.put("addr", user.getAddr());
	      map.put("post", user.getPost());
	      map.put("tel", user.getTel());
	      
	      map.put("id", id);
	      
	      sqlSession.update("MYPAGE.updateUserInfo", map);
	      
	   }
	   //기존에 계좌가 있는지 확인하는 메소드 
	   public int checkAccount(String id) {
	      return sqlSession.selectOne("MYPAGE.checkAccount", id);
	   }
	   //계좌정보를 입력하는 메소드 
	   public void insertAccount(Account account, String id) {
	      Map <String, Object> map =new  HashMap <String, Object> ();
	      map.put("account", account.getAccount());
	      map.put("bank", account.getBank());
	      map.put("id", id);
	      
	      sqlSession.insert("MYPAGE.insertAccount", map);
	   }
	   //계좌정보를 업데이트 하는 메소드 
	   public void updateAccount(Account account, String id) {
	      Map <String, Object> map =new  HashMap <String, Object> ();
	      map.put("account", account.getAccount());
	      map.put("bank", account.getBank());
	      map.put("id", id);
	      
	      sqlSession.update("MYPAGE.updateAccount", map);
	   }
	   //파일정보를 업데이트 하는 메소드
	   public void insertUserProfile(Map<String, Object> f) {
	      sqlSession.insert("MYPAGE.insertUserProfile", f);
	   }
	   //파일정보를 삭제하는 메소드 
	   public void deleteFile(String id) {
	      sqlSession.delete("MYPAGE.deleteFile", id);
	   }
	   //파일정보를 가져오는 메소드 
	   public List<Files> selectFileList(String id) {
	      return sqlSession.selectList("MYPAGE.selectFileList", id);
	   }
	   
	   //user의 정보를 가져오는 메소드
	   public Users selectUserInfo(String id) {
	      return sqlSession.selectOne("MYPAGE.selectUserInfo", id);
	   }
	   //파일 정보를 가져오는 메소드
	   public Files selectUserFile(String id) {
	      return sqlSession.selectOne("MYPAGE.selectUserFile", id);
	   }
	   
	   //계좌 정보를 가져오는 메소드 
	   public Account selectUserAccount(String id) {
	      return sqlSession.selectOne("MYPAGE.selectUserAccount", id);
	   }
	   
	   		
	   		//사용자 point 값 가져오기
		   public int userPoint(String id) {
		         //이게 가능해?
		         if( sqlSession.selectOne("MYPAGE.userPoint", id) != null) {
		            return sqlSession.selectOne("MYPAGE.userPoint", id);
		         }else {
		            return 0 ;
		         }
		      }
	      
	      //coin 가져오는 메소드 
	      public int userCoin(String id) {
	         if(sqlSession.selectOne("MYPAGE.userCoin", id) != null) {
	            return sqlSession.selectOne("MYPAGE.userCoin", id);
	         }else {
	            return 0 ;
	         }
	      }
	   
	   //point 차감하는 메소드
	   public void subPoint(int point, String id) {
	      Map <String, Object> map =new  HashMap <String, Object> ();
	      map.put("point", point);
	      map.put("id", id);
	      
	      System.out.println("dao-point:" + point);
	      System.out.println("dao-id:" + id);
	      
	      sqlSession.insert("MYPAGE.subPoint", map);
	   }
	   
	   //게시글을 가져오는 메소드
	   public List<Board> selectUserWritten(Paging p , String id) {
	      
	      Map <String, Object> map =new  HashMap <String, Object> ();
	      map.put("start", p.getStart());
	      map.put("end", p.getEnd());
	      map.put("id", id);
	      
	      return  sqlSession.selectList("MYPAGE.selectUserWritten", map);
	   }
	   
	   //댓글 가져오는 메소드
	   public List<Comments> selectUserComment(Paging p ,String id) {
	      
	      Map <String, Object> map =new  HashMap <String, Object> ();
	      map.put("start", p.getStart());
	      map.put("end", p.getEnd());
	      map.put("id", id);
	      
	      return sqlSession.selectList("MYPAGE.selectUserComment", map);
	   }
	   
	   //게시글을 삭제하는 메소드
	   public void deleteWritten(String no) {
	       sqlSession.delete("MYPAGE.deleteWritten", no);
	   }
	   
	   //댓글을 삭제하는 메소드
	   public void deleteComment(String no) {
	      sqlSession.delete("MYPAGE.deleteComment", no);
	   }
	   //총 게시글수를 가져오는 메소드 
	   public int selectWrittenCnt(String id ) {
	      return sqlSession.selectOne("MYPAGE.selectWrittenCnt", id);
	   }
	   
	   //댓글 총 수를 가져온는 메소드 
	   public int selectCommentCnt(String id) {
	      return sqlSession.selectOne("MYPAGE.selectCommentCnt", id);
	   }
	   //회원의 비밀번호를 가져오는 메소드 
	   public String selectUserPw(String id) {
	      return sqlSession.selectOne("MYPAGE.selectUserPw", id);
	   }






}
