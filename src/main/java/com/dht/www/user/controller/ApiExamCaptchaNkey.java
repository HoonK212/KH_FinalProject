package com.dht.www.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/captchaKey")
public class ApiExamCaptchaNkey {
	
	@RequestMapping(value="/getKey", method=RequestMethod.GET)
	@ResponseBody
	public static String getCaptchaKey() {
		
		System.out.println("/getkey 요청");
		
        String clientId = "fhac9coVsZlNcnAG8Vgp"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "Ssd9uvhvfs"; //애플리케이션 클라이언트 시크릿값";

        String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
        String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        
        //URL로 요청하여 키를 발급받는다. (애플리케이션 클라이언트 아이디와 시크릿값을 가지고)
        String responseBody = get(apiURL, requestHeaders);

        System.out.println(responseBody);
        
        return responseBody;
    }
	
	// 1.URL 연결 생성 2. 요청 정보 세팅 3. 이미지를 받기위한 키 반환
    private static String get(String apiUrl, Map<String, String> requestHeaders){
        
    	//URL와 연결 생성하고 반환
    	HttpURLConnection con = connect(apiUrl);
        
    	try {
    		//요청 메소드 설정
            con.setRequestMethod("GET");
            
            //요청 속성 설정(네이버 클라이언트 아이디와 시크릿값 박기)
            for(Map.Entry<String, String> header : requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
               
            	//전달받은 키 반환
            	return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
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
    
    // 발급받은 키를 읽는 메소드
    private static String readBody(InputStream body){
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
