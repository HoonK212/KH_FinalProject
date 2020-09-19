package com.dht.www.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dht.www.board.model.vo.Board;
import com.dht.www.board.model.vo.Comments;
import com.dht.www.mypage.model.dao.MypageDao;
import com.dht.www.mypage.model.vo.Account;
import com.dht.www.mypage.model.vo.Files;
import com.dht.www.user.model.vo.Users;

import common.exception.FileException;
import common.util.FileUtil;
import common.util.Paging;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
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
		
		Map<String,Object> cm = new HashMap<>();
//		cm = mypageDao.selectRecord(id);
		
		
		Map<String,Object> result = new HashMap<>();
		result.put("exercises", exArr);
		result.put("grade", commandMap.get("grade"));
		result.put("days", daysArr);
		result.put("id", commandMap.get("id"));
		
		return result;
	}

	@Override
	public String[] transformToDOW(String[] daysArr) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//------------ 세민 ------------
	

	   
	   //이메일 확인 하는 메소드 
	   public int chMail(String mail) {
	      return mypageDao.chMail(mail);
	   }
	   
	   //기존에 존재하는 닉네임인지 확인하는 메소드 
	   public int chNick(String nick) {
	      return mypageDao.chNick(nick);
	   }

	   //기존에 계좌가 존재하는 지 확인하는 메소드 
	   public int chAccount(long account) {
	      return mypageDao.chAccount(account);
	   }
	   
	   //패스워드를 암호화하는 메소드 
	   public String codePassword(String pw) {

	      System.out.println("pw:" + pw);
	      //비밀번호 암호화 하는 코드 
	      String password = passwordEncoder.encode(pw);
	      
	      return password ; 
	   }

	   //회원정보를 업데이트 하는 코드 
	   public void updateUserInfo(Users user, String id, Account account) {
	      
	      //회원정보를 업데이트 하는 메소드 
	      mypageDao.updateUserInfo(user, id);
	      
	      //계좌정보를 업데이트 하는 메소드 
	      int res = mypageDao.checkAccount(id);
	      
	      if(res == 0) {
	         //계좌 정보가 기존에 없는 경우  insert
	         mypageDao.insertAccount(account, id);
	      }else {
	         //계좌정보가 기존이 엤는 경우 
	         mypageDao.updateAccount(account, id);
	      }
	      
	   }//end
	   
	   //회원 이미지를 insert 하는 메소드 
	   public void insertUserProfile(List<MultipartFile> file, String id, String root, HttpSession session) {
	      
	      if(!(file.size()== 1 && file.get(0).getOriginalFilename().equals(""))) { //사용자가 프로필 이미지를 업로드한 경우
	           
	         //파일정보를 불러오는 메소드 
	         List<Files> files = mypageDao.selectFileList(id);
	         
	         
	         //실제로 파일을 삭제하는 메소드 
	         for(Files f : files) {
	            
	             String path = session.getServletContext().getRealPath("/resources/upload_product") + "/" + f.getRenamed() + "." + f.getExt();
	               
	               new FileUtil().deleteFile(path);
	            
	         }
	         
	         
	         //파일을 db에서  삭제하는 메소드 
	         mypageDao.deleteFile(id);
	         
	         //파일을 업로드 하는 메소드 
	          List<Map<String, Object>> fileData = null;
	          try {
	            //실제로 이미지 업로드
	             fileData = new FileUtil().fileUpload(file, root);
	            
	            for(Map<String, Object> f : fileData) {
	               //이미지가 참조하는 사용자 아이디정보 넣기
	               f.put("id", id);  
	               //DB에 파일 정보 저장
	               mypageDao.insertUserProfile(f);
	            }
	         } catch (FileException e) {
	            e.printStackTrace();
	         }
	         }else { 
	            System.out.println("업로드를 하지 않은 경우  파일의 아무 변화 없음 ");
	         }   
	      
	      
	   }
	   
	   //user의 정보를 가져오는 메소드
	   public Users selectUserInfo(String id) {
	      return mypageDao.selectUserInfo(id);
	   }
	   
	   //파일 정보를 가져오는 메소드 
	   public Files selectUserFile(String id) {
	      return  mypageDao.selectUserFile(id);
	   }
	   
	   //계좌정보를 가져온는 메소드 
	   public Account selectUserAccount(String id) {
	      return mypageDao.selectUserAccount(id);
	   }
	   //메일 을 보내느 메소드 
	   public void sendingEmail(int randomN, String mail, String urlPath) {
	      
	      String setfrom = "kh_finalproject@naver.com";
	      String tomail = mail;
	      String title = "인증번호를 입력해주세 요 .";
	      String htmlBody =  "<h3>인증번호를 인증번호란에 입력해주세요!</;h3>"
	            + "<span>" + "인증번호" + randomN + "</span>";
	            
	      try {
	            //메일 발송
	            mailSender.send( new MimeMessagePreparator() {
	               public void prepare(MimeMessage mimeMessage) throws MessagingException {
	                    MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	                    //보내는 이
	                    message.setFrom(setfrom);
	                    //받는 이
	                    message.setTo(tomail);
	                    //메일 제목
	                    message.setSubject(title);
	                    //메일 내용
	                    //두번째 boolean값은 html 여부 (true : html, false : text)
	                    message.setText(htmlBody, true);
	                  };
	               
	            });
	      
	      } catch(Exception e) {
	         e.printStackTrace();
	      //   throw new MailException("M_ERROR_01");
	      }
	      
	   }
	   
	   //point 가져오는 메소드 
	   public int userPoint(String id) {
	      return mypageDao.userPoint(id);
	   }
	   
	   //coin 가져오는 메소드 
	   public int userCoin(String id) {
	      return mypageDao.userCoin(id);
	   }

	   //point 차감하는 메소드
	   public void subPoint(int point, String id) {
	       mypageDao.subPoint(point , id);
	   }
	   
	   //게시글을 가져오는 메소드 + 페이징
	   public Map<String, Object> selectUserWritten(String id ,int cPage, int cntPerPage) {
	      
	      
	      Map<String, Object> commandMap = new HashMap<String, Object>();
	      
	      //페이징 설정
	      Paging p = new Paging(mypageDao.selectWrittenCnt(id), cPage, cntPerPage);
	      
	      List<Board> blist = mypageDao.selectUserWritten(p, id);
	      
	      commandMap.put("blist", blist);
	      commandMap.put("paging", p);
	      
	      return  commandMap;
	   }
	   
	   //댓글 가져오는 메소드 + 페이징 
	   public Map<String, Object> selectUserComments(String id ,int cPage, int cntPerPage) {
	      
	      Map<String, Object> commandMap = new HashMap<String, Object>();
	      
	      //페이징 설정
	      Paging p = new Paging(mypageDao.selectCommentCnt(id), cPage, cntPerPage);
	      
	      List<Comments> clist = mypageDao.selectUserComment(p, id);
	      
	      commandMap.put("clist", clist);
	      commandMap.put("paging", p);
	      
	      return  commandMap;
	      
	   }
	   
	   //게시글을 삭제하는 메소드
	   public void deleteWritten(String no) {
	        mypageDao.deleteWritten(no);
	   }

	   //댓글을 삭제하는 메소드
	   public void deleteComment(String no) {
	       mypageDao.deleteComment(no);
	   }
	   
	   //패스워드가 맞는지 확인하는 메소드 
	   public String checkPassword(String pw, String id) {
	      
	      //회원정보에서 패스워드 가져오기 
	      String password = mypageDao.selectUserPw(id);
	      
	      System.out.println("pw:" + pw);
	      System.out.println("password:" + password);
	      
	      
	      //사용자가 입력한 비밀번호와 DB에 암호화돼 저장된 비밀번호가 같은지 확인
	      //암호화 되었는 비밀번호를 먼저 위치시켜야 한다 
	      if(passwordEncoder.matches(pw,password)) { //비밀번호 일치
	            System.out.println("일치");
	            return "0";
	      }else { // 비밀번호 불일치
	            System.out.println("불일치");
	            return "1";
	      }
	      
	   }
	   
	   

}
