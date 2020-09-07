package com.dht.www.user.controller;

import java.io.BufferedReader;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import common.util.FileUtil;

@Controller
@RequestMapping("/captchaImage")
public class ApiExamCaptchaImage {
	
	@RequestMapping(value="/getImg", method=RequestMethod.POST)
	@ResponseBody
	public static String getCaptchaImage(String captchaKey, HttpSession session) {
		
		System.out.println(captchaKey);
		
        String clientId = "fhac9coVsZlNcnAG8Vgp"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "Ssd9uvhvfs"; //애플리케이션 클라이언트 시크릿값";

        String key = captchaKey; // https://openapi.naver.com/v1/captcha/nkey 호출로 받은 키값
        String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        
        //이미지 전달받아 파일 생성&저장하고 파일 이름 반환
        String responseBody = get(apiURL,requestHeaders, session);

        System.out.println(responseBody);
        
        return responseBody;
    }
	
	@RequestMapping(value="/deleteImg", method=RequestMethod.GET)
	@ResponseBody
	public static boolean deleteCaptchaImage(String filename, HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/resources/image/captcha") + "/" + filename + ".jpg";
		new FileUtil().deleteFile(path);
		
		return true;
	}

    private static String get(String apiUrl, Map<String, String> requestHeaders, HttpSession session){
        
    	//URL와 연결 생성하고 반환
    	HttpURLConnection con = connect(apiUrl);
        
    	try {
    		//요청 메소드 설정
            con.setRequestMethod("GET");

            //요청 속성 설정(네이버 클라이언트 아이디와 시크릿값 박기)
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
           
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                
            	//이미지 파일 이름 반환
            	return getImage(con.getInputStream(), session);
            } else { // 에러 발생
                return error(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    // URL 연결 생성
    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
    
    // 이미지를 받아 파일을 실제로 생성&저장하고 파일이름을 반환하는 메소드
    private static String getImage(InputStream is, HttpSession session){
        
    	int read;
        byte[] bytes = new byte[1024];
        
        // 랜덤한 이름으로 파일 생성
        String filename = Long.valueOf(new Date().getTime()).toString();
        // 파일을 저장할 경로
        String readFolder = session.getServletContext().getRealPath("/resources/image/captcha");

        // 파일 객체 생성
        File f = new File(readFolder + "/" + filename + ".jpg");
        
        try(OutputStream outputStream = new FileOutputStream(f)){
            
        	// 파일을 실제로 생성함
        	f.createNewFile();
            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            
            // 생성한 파일의 파일 이름 반환
            return filename;
            
        } catch (IOException e) {
            throw new RuntimeException("이미지 캡차 파일 생성에 실패 했습니다.",e);
        }
    }
    
    //에러 발생시 에러 출력 코드??
    private static String error(InputStream body) {
        
    	InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

}
