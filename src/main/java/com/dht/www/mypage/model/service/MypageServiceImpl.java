package com.dht.www.mypage.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

	
	// 목표 설정 가공해서 조회
	@Override
	public Map<String, Object> selectExerciseGoal(String id) {
		
		Map<String,Object> commandMap = new HashMap<>();
		commandMap = mypageDao.selectExerciseGoal(id);
		
		if(commandMap == null) {
			return null;
		}
		
		
		//운동을 문자 배열로 치환
		String ex = (String) commandMap.get("exercises");
		String[] exArr = ex.split(",");
		
		//운동에 번호 대입
		//List<Map<String,Object>> exMap = mypageDao.selectExercises();
		List<Map<String,Object>> lm = new ArrayList<>();
		for(int i=0; i<exArr.length; i++) {
			Map<String,Object> em = new HashMap<>();
			int exNo = mypageDao.selectExerciseByName(exArr[i]);
			em.put("no", exNo);
			em.put("name", exArr[i]);
			lm.add(em);
		}
		
		//요일을 문자 배열로 치환
		String days = String.valueOf(commandMap.get("days"));
		String[] daysArr = days.split("");
		
		//숫자로 된 요일을 날짜로 치환
		List<String> domArr = transformToDOW(daysArr);
		
		Map<String,Object> result = new HashMap<>();
		result.put("id", commandMap.get("id"));
		result.put("days", domArr);
		result.put("exercises", lm);
		result.put("grade", commandMap.get("grade"));
		
		return result;
	}

	@Override
	public List<String> transformToDOW(String[] daysArr) {
		
		List<String> list = new ArrayList<>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//달력 생성 - getInstance가 현재 날짜로 세팅시키나?
		Calendar cal = Calendar.getInstance();
		
		//년,월,일
		int year = cal.get( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE ) ;
		
		
		//달의 첫째날
		String firstDay = String.valueOf(year) + "-" + String.valueOf(month) + "-1";
		
		
		//달의 첫째날로 달력 세팅
		try {
			cal.setTime(sdf.parse(firstDay));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//달의 첫째날의 요일을 숫자로 치환
		int dayNo = cal.get(Calendar.DAY_OF_WEEK) ;

		
		//31일 달(1,3,5,7,8,10,12)
		if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ) {
			
			for(int i = 0; i < daysArr.length;  i++ ) {
				
				//목표요일을 숫자로 변환
				int day = Integer.parseInt(daysArr[i]);
				//목표요일과 달의 첫째날의 차이
				int gap = day - dayNo;
				
				int plus = 1;
				
				//차이가 0이상일때 일(date)에 차이만큼 더하기
				if(gap >= 0) {
					plus += gap;
				} //라이가 음수일때 일(date)에 7을 더한 차이만큼 더하기
				else {
					plus += gap + 7;
				}
				
				//31일 이하일때까지 날짜(date)에 7을 더하고 그 값을 날짜 문자열 형태에 더한 후 배열에 넣기
				do {
					
					String d = String.valueOf(year) + "-" + String.valueOf(month) + "-";
					d += String.valueOf(plus);
					try {
						Date dt = sdf.parse(d);
						String da = sdf.format(dt);
						list.add(da);
					} catch (ParseException e) {
						e.printStackTrace();
					}

					plus += 7;
				
				}while(plus <= 31);
				
			}
		
		//30일 달(4,6,9,11)	
		}else if(month == 4 || month == 6 || month == 9 || month == 11) {
			
			for(int i = 0; i < daysArr.length;  i++ ) {
				
				//목표요일을 숫자로 변환
				int day = Integer.parseInt(daysArr[i]);
				//목표요일과 달의 첫째날의 차이
				int gap = day - dayNo;
				
				int plus = 1;
				
				//차이가 0이상일때 일(date)에 차이만큼 더하기
				if(gap >= 0) {
					plus += gap;
				} //라이가 음수일때 일(date)에 7을 더한 차이만큼 더하기
				else {
					plus += gap + 7;
				}
				
				//30일 이하일때까지 날짜(date)에 7을 더하고 그 값을 날짜 문자열 형태에 더한 후 배열에 넣기
				do {
					
					String d = String.valueOf(year) + "-" + String.valueOf(month) + "-";
					d += String.valueOf(plus);
					try {
						Date dt = sdf.parse(d);
						String da = sdf.format(dt);
						list.add(da);
					} catch (ParseException e) {
						e.printStackTrace();
					}

					plus += 7;
				
				}while(plus <= 30);
				
			}
		
		//28일 달(2)	
		}else {
			
			for(int i = 0; i < daysArr.length;  i++ ) {
				
				//목표요일을 숫자로 변환
				int day = Integer.parseInt(daysArr[i]);
				//목표요일과 달의 첫째날의 차이
				int gap = day - dayNo;
				
				int plus = 1;
				
				//차이가 0이상일때 일(date)에 차이만큼 더하기
				if(gap >= 0) {
					plus += gap;
				} //라이가 음수일때 일(date)에 7을 더한 차이만큼 더하기
				else {
					plus += gap + 7;
				}
				
				//28일 이하일때까지 날짜(date)에 7을 더하고 그 값을 날짜 문자열 형태에 더한 후 배열에 넣기
				do {
					
					String d = String.valueOf(year) + "-" + String.valueOf(month) + "-";
					d += String.valueOf(plus);
					try {
						Date dt = sdf.parse(d);
						String da = sdf.format(dt);
						list.add(da);
					} catch (ParseException e) {
						e.printStackTrace();
					}

					plus += 7;
				
				}while(plus <= 28);
				
			}
			
		}
		
		return list;
	}
	
	@Override
	public List<String> selectSuccessDates(String id) {
		
		Map<String,Object> commandMap = new HashMap<>();
		commandMap = mypageDao.selectExerciseGoal(id);
		
		if(commandMap == null) {
			return null;
		}
		
		
		//운동을 문자 배열로 치환
		String ex = (String) commandMap.get("exercises");
		String[] exArr = ex.split(",");
		
		//운동에 번호 대입
		//List<Map<String,Object>> exMap = mypageDao.selectExercises();
		List<Map<String,Object>> lm = new ArrayList<>();
		for(int i=0; i<exArr.length; i++) {
			Map<String,Object> em = new HashMap<>();
			int exNo = mypageDao.selectExerciseByName(exArr[i]);
			em.put("no", exNo);
			em.put("name", exArr[i]);
			lm.add(em);
		}
		
		//요일을 문자 배열로 치환
		String days = String.valueOf(commandMap.get("days"));
		String[] daysArr = days.split("");
		
		//숫자로 된 요일을 날짜로 치환
		List<String> domArr = transformToDOW(daysArr);
		
		
		//최종 반환 객체
		List<String> result = new ArrayList<>();
		
		//각 날짜마다 조회
		for(int i = 0; i < domArr.size(); i++) {
			//기록 갯수
			int successCnt = 0;
			//각 목표 운동 마다 조회
			for(int k = 0; k < lm.size(); k++) {
				
				Map<String,Object> param = new HashMap<>();
				param.put("ex_no", lm.get(k).get("no"));
				param.put("dates", domArr.get(i));
				param.put("id", id);
				
				//각 날짜에 해당 운동의 기록이 있는지 조회
				int cnt = mypageDao.selectSuccessDate(param);
				if(cnt>0) {
					//있으면 기록 갯수 +1
					successCnt++;
				}
			}
			//각 목표 운동마다 조회한 후 기록갯수와 목표 운동갯수가 일치하면 해당 날짜 저장
			if(successCnt == lm.size()) {
				result.add(domArr.get(i));
			}
		}
		
		return result;
	}
	
	
	@Override
	public double selectDeCal(String id) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		//달력 생성 - getInstance가 현재 날짜로 세팅시키나?
		Calendar cal = Calendar.getInstance();
		
		//년,월,일
		int year = cal.get( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

		String start = String.valueOf(year) + "-" + String.valueOf(month) + "-1";
		String end = String.valueOf(year) + "-" + String.valueOf(month) + "-" + String.valueOf(lastday);
		
		
		Map<String,Object> param = new HashMap<>();
		
		param.put("id", id);
		param.put("start", start);
		param.put("end", end);
		
		return mypageDao.selectDeCal(param);
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

	@Override
	public Map<Object, Object> selectMyRecord(String id) {
		
		//최종 반환할 Map 생성 
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
		
		
		return commandMap;
	}


}
