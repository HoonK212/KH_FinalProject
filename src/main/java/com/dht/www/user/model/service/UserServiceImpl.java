package com.dht.www.user.model.service;

import java.io.IOException;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dht.www.user.model.dao.UserDao;
import com.dht.www.user.model.vo.Users;
import com.fasterxml.jackson.databind.ObjectMapper;

import common.exception.FileException;
import common.util.FileUtil;


@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaMailSender mailSender;
	
	
	@Override
	public Users selectUser(Users user) {
		
		return userDao.selectUser(user);
	}

	@Override
	public boolean checkReportedAccount(Users user) {
		
		if( user.getReport() != null ) { //징계회원
			
			//현재날짜
			String currentDate = new SimpleDateFormat("yyyyMMdd").format( new java.sql.Date(System.currentTimeMillis()));
			int crd = Integer.parseInt(currentDate);
			
			//징계날짜
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String rd = sdf.format( new java.util.Date ( user.getReport().getTime() ) );
			int reportdate = Integer.parseInt(rd);
			
			//비교
			if( crd <= reportdate ) {
				return true; //징계 남음
			}else {
				return false; //징계 끝남
			}
			
		}else {
			return false; //징계회원이 아님
		}
	}
	
	//토큰값 가져오는 코드 
	@Override
	public <JsonNode> JsonNode getAccessToken(String code) {
		
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";

	    final List postParams = new ArrayList ();

	    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

	    postParams.add(new BasicNameValuePair("client_id", "f601dfea61fb3ccf05acb9ddb277a697"));    // REST API KEY

	    postParams.add(new BasicNameValuePair("redirect_uri","http://localhost:8089/www/user/kakaoLogin"));    // 리다이렉트 URI

	    postParams.add(new BasicNameValuePair("code", code));    // 로그인 과정중 얻은 code 값

	    final HttpClient client = HttpClientBuilder.create().build();

	    final HttpPost post = new HttpPost(RequestUrl);

	    JsonNode returnNode = null;

	    try {

	      //이부분에서 cast 했다! 
	      
	      post.setEntity(new UrlEncodedFormEntity(postParams));

	      final HttpResponse response = client.execute(post);

	      final int responseCode = response.getStatusLine().getStatusCode();

	      //JSON 형태 반환값 처리

	      ObjectMapper mapper = new ObjectMapper();

	      returnNode =  (JsonNode) mapper.readTree(response.getEntity().getContent());

	    } catch (UnsupportedEncodingException e) {

	      e.printStackTrace();

	    } catch (ClientProtocolException e) {

	      e.printStackTrace();

	    } catch (IOException e) {

	      e.printStackTrace();

	    } finally {

	        // clear resources

	    }

	    System.out.println("returnNode:" + returnNode);

	    return returnNode;
	
	}

	
	//토큰값을 받아 사용자의 정보를 가져오는 코드 
	@Override
	public <JsonNode> JsonNode getKakaoUserInfo(JsonNode accessToken) {
       
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        // add header
        post.addHeader("Authorization", "Bearer " + accessToken);
 
        JsonNode returnNode = null;
 
        try {
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();
 
            System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
            System.out.println("Response Code : " + responseCode);
 
            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = (JsonNode) mapper.readTree(response.getEntity().getContent());
 
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }
        
        System.out.println("returnNode2:"+ returnNode);
        return returnNode;
	}
	
	
	//아이디 조회하기
	@Override
	public Users getUsersId(Map<String, Object> commandMap) {

		return userDao.getUsersId(commandMap);
	}

	//회원 메일로 아이디 발송
	@Override
	public void mailSending(Map<String, Object> commandMap, String urlPath, String searchId) {
		
		String setfrom = "kitty9302@naver.com";
		String tomail = (String) commandMap.get("mail");
		String title = "아이디 조회결과";
		String htmlBody01 = 
				         "<h3>아이디 조회 결과</h3>"
				         + "<span>" + searchId + "</span>";
		String htmlBody02 = 
						"<h3>아이디 조회 결과</h3>"
				         + "<span>일치하는 회원 정보가 없습니다.</span>";
		
		try {
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
					     if(searchId != "" && searchId != null) { //회원정보 있음
					    	 message.setText(htmlBody01, true);
					     }else { //회원정보 없음
					    	 message.setText(htmlBody02, true);
					     }

				   	};
			   	
				});
		
		} catch(Exception e) {
			e.printStackTrace();
		//	throw new MailException("M_ERROR_01");
		}
		
	}

	//회원인 경우 임시 비밀번호 생성
	@Override
	public Users getUsersPw(Map<String, Object> commandMap) {
		
		//회원인지 확인
		Users res = userDao.getUsersPw(commandMap);
		
		if( res != null) {
			//임시비밀번호 생성
			UUID uuid = UUID.randomUUID(); //랜덤 UID 생성
			String randomPw = uuid.toString().split("-")[0]; //8자리 uid
			System.out.println("생성한 랜덤값 : " + randomPw);
			
			//user 객체에 저장
			res.setPw(randomPw);
			
			System.out.println("비밀번호 변경 후 : " + res);
			
			//DB에 업데이트
			int result = userDao.updateUsersPw(res);
			
			System.out.println("업데이트 성공 여부 : " + result);
		}
		
		return res;
	}

	//회원 메일로 랜덤 비밀번호 발송
	@Override
	public void mailSendingFindPw(Map<String, Object> commandMap, String urlPath, String randomPw) {
		
		String setfrom = "kitty9302@naver.com";
		String tomail = (String) commandMap.get("mail");
		String title = "임시 비밀번호 발급";
		String htmlBody01 = 
				         "<h3>임시 비밀번호</h3>"
				         + "<span>" + randomPw + "</span>";
		String htmlBody02 = 
						"<h3>임시 비밀번호</h3>"
				         + "<span> 일치하는 회원 정보가 없습니다.</span>";
		
		try {
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
					     if(randomPw != "" && randomPw != null) { //회원정보 있음
					    	 message.setText(htmlBody01, true);
					     }else { //회원정보 없음
					    	 message.setText(htmlBody02, true);
					     }

				   	};
			   	
				});
		
		} catch(Exception e) {
			e.printStackTrace();
		//	throw new MailException("M_ERROR_01");
		}
		
	}
	
	//회원가입
	@Override
	public void insertUser(List<MultipartFile> files, Users user, String root) {
		
		//회원정보 입력
		userDao.insertUser(user);
	      
	      //사용자가 프로필 이미지를 업로드한 경우
	      if(!(files.size()==0 && files.get(0).equals(""))) {
	         
		    List<Map<String, String>> fileData = null;
			
		    try {
				//실제로 파일 이미지 업로드하기
		    	fileData = new FileUtil().fileUpload(files, root);
				
				//db에 파일 저장
				for(Map<String, String> f : fileData) {
					//참조하는 사용자 아이디 넣어주기
					f.put("id", user.getId()); 
					userDao.insertUserProfile(f);
				}
			} catch (FileException e) {
				e.printStackTrace();
			}
	      }else { //사용자가 프로필 이미지를 업로드 하지 않을 때 기본 프로필이미지 업로드
	    	  userDao.insertBasicProfile(user);
	      }
	}
	


	
	
	
	
	
		
}
