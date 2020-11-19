package com.dht.www.mypage.model.service;

import java.time.LocalDate;
import java.util.ArrayList;
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

	// 설정 목표 조회
	@Override
	public Map<String, Object> selectExerciseGoal(String id) {
		
		Map<String,Object> commandMap = new HashMap<>();
		
		//설정한 목표 조회
		commandMap = mypageDao.selectExerciseGoal(id);
		
		//목표 설정 안한 경우
		if(commandMap == null) {
			return null;
		}
		
		//목표 운동 데이터 가공
		List<Map<String,Object>> exList = new ArrayList<>();
		String[] exArr = ((String) commandMap.get("exercises")).split(",");
		for(int i=0; i<exArr.length; i++) {
			
			int exNo = mypageDao.selectExerciseByName(exArr[i]);
			Map<String,Object> em = new HashMap<>();
			em.put("no", exNo);
			em.put("name", exArr[i]);
			
			exList.add(em);
		}
		
		//목표 요일 데이터 가공
		String[] daysArr = String.valueOf(commandMap.get("days")).split("");
		List<Object> prcDaysArr = transformToDOW(daysArr);
		
		//목표 성공 날짜
		List<Object> successDates = selectSuccessDates(commandMap.get("id"), prcDaysArr, exList);
		
		//목표 성공률
		int mygoalCnt = prcDaysArr.size();
		int scdCnt = successDates.size();
		int scdPercent = (int)( (double)scdCnt/ (double)mygoalCnt * 100.0 );
		
		Map<String,Object> result = new HashMap<>();
		result.put("days", prcDaysArr);
		result.put("exercises", exList);
		result.put("grade", commandMap.get("grade"));
		result.put("scd", successDates);
		result.put("scdPercent", scdPercent);
		
		return result;
	}
		
	public List<Object> selectSuccessDates(Object userid, 
			List<Object> goalDays, List<Map<String, Object>> goalExcersie) {

		List<Object> result = new ArrayList<>();
		
		for(int i = 0; i < goalDays.size(); i++) {
		
			int successCnt = 0;
			for(int k = 0; k < goalExcersie.size(); k++) {
				
				Map<String,Object> param = new HashMap<>();
				param.put("ex_no", goalExcersie.get(k).get("no"));
				param.put("dates", goalDays.get(i));
				param.put("id", userid);
				
				//각 날짜에 해당 운동의 기록이 있는지 조회
				int cnt = mypageDao.selectSuccessDate(param);
				if(cnt>0) {
					//있으면 기록 갯수 +1
					successCnt++;
				}
			}
			//각 목표 운동마다 조회한 후 기록갯수와 목표 운동갯수가 일치하면 해당 날짜 저장
			if(successCnt == goalExcersie.size()) {
				result.add(goalDays.get(i));
			}
		}
		return result;
	}

	@Override
	public double selectDeCal(String id) {
	
		Map<String,Object> param = new HashMap<>();
	
		param.put("id", id);
		param.put("start", firstDate);
		param.put("end", today);
	
		return mypageDao.selectDeCal(param);
	}

	@Override
	public Map<Object, Object> selectMyRecord(String id) {
	
		Map<Object,Object> commandMap = new HashMap<>();
	
		List<Map<String,Object>> mrd = mypageDao.selectMyRecordDates(id);
	
		if(mrd == null) {
			return null;
		}

		for( int i=0; i < mrd.size(); i++ ) {
		
			Map<String,Object> mp = new HashMap<>();
		
			mp.put("dates", mrd.get(i).get("dates"));
		
			Map<String,Object> param = new HashMap<>();
			param.put("id", id);
			param.put("date", String.valueOf(mrd.get(i).get("dates")));
			List<Map<String,Object>> lm = mypageDao.selectMyRecordByDate(param);
		
			commandMap.put(mp, lm);
		}
		
		System.out.println(commandMap);
		
		return commandMap;
	}

	static LocalDate today = LocalDate.now();
	static LocalDate firstDate = LocalDate.of(today.getYear(), today.getMonth(), 1);
	static int firstDayOfWeek = firstDate.getDayOfWeek().getValue();
	static int lastday;
	static int month = today.getMonthValue();
	static{
		if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ) { 
			lastday = 31; 
		}else if(month == 4 || month == 6 || month == 9 || month == 11) { 
			lastday = 30; 
		}else if(!today.isLeapYear()) { 
			lastday = 28; 
		}else { 
			lastday = 29; 
		}
	}

	public static List<Object> transformToDOW(String[] daysArr) {
	
		List<Object> list = new ArrayList<>();
		
		int goalDay;
		for(int i = 0; i < daysArr.length;  i++ ) {
			int gap = Integer.parseInt(daysArr[i]) - firstDayOfWeek;
			if(gap >= 0) {
				goalDay = 1 + gap;
			}else {
				goalDay = 1 + gap + 7;
			}
			do {
				list.add( LocalDate.of(today.getYear(), today.getMonth(), goalDay) );
				goalDay += 7;
			}while(goalDay <= lastday);
		};
		return list;
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
	   public int chAccount(String account) {
	      return mypageDao.chAccount(account);
	   }
	   
	   //패스워드를 암호화하는 메소드 
	   public String codePassword(String pw) {

	      //비밀번호 암호화 하는 코드 
	      String password = passwordEncoder.encode(pw);
	      
	      return password ; 
	   }

	      //회원정보를 업데이트 하는 코드 
	      public void updateUserInfo(Users user, String id, Account account) {
	         
	         //회원정보를 업데이트 하는 메소드 
	         mypageDao.updateUserInfo(user, id);
	         
	         System.out.println("account null 검사 : ");
	         System.out.println(account.getAccount());
	         
	         //account가 null이 아닌경우 에만 수행
	         if(!account.getAccount().equals("")) {
	            
	            //계좌정보를 업데이트 하는 메소드 
	            int res = mypageDao.checkAccount(id);
	            
	            if(res == 0) {
	               //계좌 정보가 기존에 없는 경우  insert
	               mypageDao.insertAccount(account, id);
	            }else {
	               //계좌정보가 기존이 엤는 경우 
	               mypageDao.updateAccount(account, id);
	            }
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
	   
	   //게시글에 첨부된 파일 삭제하기 
	   public void deleteWrittenfiles(String no, HttpSession session) {
	      
	      //게시글에 첨부된 파일 가져오기 
	      List<Files> files = mypageDao.selectWrittenFileList(no);
	      
	      //게시글의 파일이 있는 경우에만 
	      if(files != null) {
	         
	         //실제로 파일을 삭제하는 메소드 
	           for(Files f : files) {
	              
	               String path = session.getServletContext().getRealPath("/resources/upload_board") + "/" + f.getRenamed() + "." + f.getExt();
	                 
	                 new FileUtil().deleteFile(path);
	              
	           }
	           
	           //파일을 db에서  삭제하는 메소드 
	           mypageDao.deleteWrittenfiles(no);
	      
	      }
	      
	   }//end

	   //댓글을 삭제하는 메소드
	   public void deleteComment(String no) {
	       mypageDao.deleteComment(no);
	   }
	   
	   //패스워드가 맞는지 확인하는 메소드 
	   public String checkPassword(String pw, String id) {
	      
	      //회원정보에서 패스워드 가져오기 
	      String password = mypageDao.selectUserPw(id);
	      
	      
	      
	      //사용자가 입력한 비밀번호와 DB에 암호화돼 저장된 비밀번호가 같은지 확인
	      //암호화 되었는 비밀번호를 먼저 위치시켜야 한다 
	      if(passwordEncoder.matches(pw,password)) { //비밀번호 일치
	            return "0";
	      }else { // 비밀번호 불일치
	            return "1";
	      }
	      
	   }


}
