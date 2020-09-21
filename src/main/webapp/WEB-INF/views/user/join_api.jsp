<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Home Training</title>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/image/logo.png">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/user/join.css">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>
<!-- 주소를 가져오기 위한 라이브러리 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
/* 자동방지가입 CSS */
.cpt-layout{
	display: grid;
	grid-template-columns: 230px 80px;
	grid-template-rows: 100px 50px 25px;
	
	justify-content: left;
	align-items: center;
	
	width: 600px;
	height: 300px;
	padding-top: 20px;
	
}

.cpt-layout:nth-child(1){
 	grid-column: 1/4; 
 	grid-row: 1/3; 
}
.cpt-layout:nth-child(2){
	grid-column: 4/5; 
 	grid-row: 1/3; 
}
.cpt-layout:nth-child(3){
	grid-column: 1/4; 
 	grid-row: 3/4; 
}
.cpt-layout:nth-child(4){
	grid-column: 4/5; 
 	grid-row: 3/4; 
}
.cpt-layout:nth-child(5){
	grid-column: 1/5; 
 	grid-row: 1/4; 
}

</style>
</head>
<body>

<div class="h-screen">
	<form action="<%= request.getContextPath() %>/user/joinemailcheck" method="post" enctype="multipart/form-data" onsubmit="return required();">
	<div x-data="app()" x-cloak>
		<div class="max-w-3xl mx-auto px-4 py-10">
			<div x-show.transition="step === 'complete'">
				<div class="bg-white rounded-lg p-10 flex items-center shadow justify-between">
					<div>
						<svg class="mb-4 h-20 w-20 text-green-500 mx-auto" viewBox="0 0 20 20" fill="currentColor">  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/></svg>
						<h2 class="text-2xl mb-4 text-gray-800 text-center font-bold">회원가입 신청완료</h2>
						<div class="text-gray-600 mb-8">
							{사용자가 입력한 이메일 주소 출력}으로 메일을 전송했습니다. 등록한 메일함에서 회원가입을 완료해주세요. 감사합니다.
						</div>
						<button
							@click="step = 1"
							class="w-40 block mx-auto focus:outline-none py-2 px-5 rounded-lg shadow-sm text-center text-gray-600 bg-white hover:bg-gray-100 font-medium border" 
						>홈으로</button>
					</div>
				</div>
			</div>
			<div x-show.transition="step != 'complete'">	
			
				<!-- Top Navigation -->
				<div class="border-b-2 py-4">
					<div class="uppercase tracking-wide text-xs font-bold text-gray-500 mb-1 leading-tight" x-text="`회원가입 단계 : 기본 정보 / 비밀 번호 / 상세 정보`"></div>
					<div class="flex flex-col md:flex-row md:items-center md:justify-between">
						<div class="flex-1">
							<div x-show="step === 1" class="mt-2">
								<div class="text-2xl font-extrabold text-gray-800 leading-tight text-gray-800">기본 정보</div>
							</div>
							<div x-show="step === 2" class="mt-2">
								<div class="text-2xl font-extrabold text-gray-800 leading-tight text-gray-800">자동 가입 방지</div>
							</div>
							<div x-show="step === 3" class="mt-2">
								<div class="text-2xl font-extrabold text-gray-800 leading-tight text-gray-800">상세 정보</div>
							</div>
						</div>
						<div class="flex items-center md:w-64">
							<div class="w-full bg-white rounded-full mr-2">
								<div class="rounded-full bg-green-500 text-xs leading-none h-2 text-center text-white" :style="'width: '+ parseInt(step / 3 * 100) +'%'"></div>
							</div>
							<div class="text-xs w-10 text-gray-600" x-text="parseInt(step / 3 * 100) +'%'"></div>
						</div>
					</div>
				</div>
				<!-- /Top Navigation -->
		
		
				<!-- Step Content -->
				<div class="py-10">	
					<div x-show.transition.in="step === 1">
						<div class="mb-5 text-center">
							<div class="mx-auto w-32 h-32 mb-2 border rounded-full relative bg-gray-100 mb-4 shadow-inset">
								<img id="image" class="object-cover w-full h-32 rounded-full" :src="image" />
							</div>
							
							<label 
								for="fileInput"
								type="button"
								class="cursor-pointer inine-flex justify-between items-center focus:outline-none border py-2 px-4 rounded-lg shadow-sm text-left text-gray-600 bg-white hover:bg-gray-100 font-medium"
							>
								<svg xmlns="http://www.w3.org/2000/svg" class="inline-flex flex-shrink-0 w-6 h-6 -mt-1 mr-1" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<rect x="0" y="0" width="24" height="24" stroke="none"></rect>
									<path d="M5 7h1a2 2 0 0 0 2 -2a1 1 0 0 1 1 -1h6a1 1 0 0 1 1 1a2 2 0 0 0 2 2h1a2 2 0 0 1 2 2v9a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2v-9a2 2 0 0 1 2 -2" />
									<circle cx="12" cy="13" r="3" />
								</svg>						
								사진 검색
							</label>
							<div class="mx-auto w-56 text-gray-500 text-xs text-center mt-1">프로필 사진을 추가하려면 클릭하십시오.</div>
							<input name="file" id="fileInput" accept="image/*" class="hidden" type="file" @change="let file = document.getElementById('fileInput').files[0]; 
								var reader = new FileReader();
								reader.onload = (e) => image = e.target.result;
								reader.readAsDataURL(file);">
						</div>
						<div class="mb-5">
							<label for="name" class="font-bold mb-1 text-gray-800 inline-block">이름</label>
							<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(1/3)</p>
							<input type="text" name="name" id="name"
								class="w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium"
								placeholder="실명 입력">
						</div>
						<label for="id" class="font-bold mb-1 text-gray-800 inline-block">아이디</label>
						<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(2/3)</p>
						<p class="font-bold mb-1 text-gray-400 block text-xs inline-block"><span id="idcheckResult" style="color: red; font-size: 0.8rem;"></span><br></p>
						<div class="flex mb-5">
							<c:if test="${kakaoId != null}">
							<input type="text" name="id" value='${kakaoId}' readonly
								class="w-9/12 px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium mr-6">
							</c:if>
							<c:if test="${googleId != null}">
							<input type="text" name="id" value='${googleId}' readonly
								class="w-9/12 px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium mr-6">
							</c:if>
						</div>
						<label for="nick" class="font-bold mb-1 text-gray-800 inline-block">닉네임</label>
						<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(3/3)</p>
						<p class="font-bold mb-1 text-gray-400 block text-xs inline-block"><span id="nickcheckResult" style="color: red; font-size: 0.8rem;"></span></p>
						<div class="flex mb-5">
							<input type="text" name="nick" id="nick" onblur="XmlNickCheck()"
								class="w-9/12 px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium mr-6"
								placeholder="사용하고자 하는 닉네임 입력">
							<label
								class="flex justify-start items-center rounded-lg bg-white pl-4 pr-6 py-3 shadow-sm bg-gray-800">
								<div class="select-none text-white font-extrabold" onclick="XmlNickCheck()">중복확인</div>
							</label>
						</div>
					</div>
					<div x-show.transition.in="step === 2">
						<div class="mb-5">
							<!-- 자동방지 가입 -->
							<div class="py-10">
							<label class="font-bold mb-1 text-gray-800 block">자동가입 방지</label>
							<div class="text-gray-600 mt-2 mb-4">
								아래 이미지에 보이는 숫자와 문자를 입력하세요.
							</div>
							<div class="flex items-center mt-4 h-3 cpt-layout">
								<div id="cpt-img"></div>
								<div id="refresh"><img style="width: 50px; height: 50px; margin: 0 auto;" src="<%=request.getContextPath()%>/resources/image/captcha/refreshicon.png" /></div>
								<div><input id="input" type="text" class="px-4 py-3 rounded-lg shadow-sm 
								focus:outline-none focus:shadow-outline text-gray-600 font-medium"/></div>
								<label class="flex justify-center items-center rounded-lg bg-white pl-3 pr-3 py-3 shadow-sm bg-gray-800">
								<div class="select-none text-white font-extrabold" id="btnSubmit">확인</div>
								</label>
								<span id="result" style="color: red; font-size: 0.8rem; min-height: 1rem; display:inline-block"></span>
							</div>
							</div>
						</div>
					</div>
					<div x-show.transition.in="step === 3">
						<div class="mb-5">
							<label for="birth" class="font-bold mb-1 text-gray-800 inline-block">생년월일</label>
							<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(1/5)</p>
							<input type="date" name="birth" id="birth"
								class="w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium">
						</div>
						<div class="mb-5">
							<label for="gender" class="font-bold mb-1 text-gray-800 inline-block">성별</label>
							<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(2/5)</p>
							<div class="flex">
								<label
									class="flex justify-start items-center rounded-lg bg-white pl-4 pr-6 py-3 shadow-sm mr-4">
									<div class="text-teal-600 mr-3">
										<input id="gender" type="radio" name="gender" x-model="gender" value="Male" class="form-radio focus:outline-none focus:shadow-outline" />
									</div>
									<div class="select-none text-gray-800">Male</div>
								</label>
								<label
									class="flex justify-start items-center rounded-lg bg-white pl-4 pr-6 py-3 shadow-sm">
									<div class="text-teal-600 mr-3">
										<input type="radio" name="gender" x-model="gender" value="Female" class="form-radio focus:outline-none focus:shadow-outline" />
									</div>
									<div class="select-none text-gray-800">Female</div>
								</label>
							</div>
						</div>
						<div class="mb-5">
							<label for="mail" class="font-bold mb-1 text-gray-800 inline-block">이메일</label>
							<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(3/5)<span id="mailcheckResult" style="color: red; font-size: 0.8rem;"></span><br></p>
							<div class="mb-5 flex">
							<input type="email" name="mail" id="mail" 
								class="w-9/12 px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium mr-6"
								placeholder="example@mail.com">
							<label
								class="flex justify-start items-center rounded-lg bg-white pl-4 pr-6 py-3 shadow-sm bg-gray-800">
<!-- 								<div class="select-none text-white font-extrabold" onclick="XmlMailCheck()">중복확인</div> -->
							</label>
							</div>
						</div>
						<div class="mb-5">
							<label for="tel" class="font-bold mb-1 text-gray-800 inline-block">전화번호</label>
							<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(4/5)</p>
							<input type="tel" name="tel" id="tel"
								class="w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium"
								placeholder="010-0000-1111">
						</div>
						<div class="mb-5">
							<label for="post" class="font-bold mb-1 text-gray-800 inline-block">주소</label>
			                     <p class="font-bold mb-1 text-gray-600 block text-sm inline-block">(우편번호 / 주소 / 상세주소)</p>
			                     <p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(5/5)</p>
			                     <div class="flex mb-2">
			                        <input type="text" name="post" 
			                           class="post w-9/12 px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium mr-6"
			                           placeholder="우편 번호"  id="sample4_postcode">
			                        <label
			                           class="flex justify-start items-center rounded-lg bg-white pl-4 pr-6 py-3 shadow-sm bg-gray-800"  onclick="sample4_execDaumPostcode()">
			                           
			                            <div class="select-none text-white font-extrabold" >우편번호검색</div> 
			                        </label>
			                     </div>
			                     <input type="text" name="addr"
			                        class="addr w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium mb-2"
			                        placeholder="도로명 주소" id="sample4_roadAddress">
			                     <input type="text"
			                        class="w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium mb-2"
			                        placeholder="지번 주소" id="sample4_jibunAddress">
			                     <input type="text" name="addr_detail"
			                        class="addr_detail w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium mb-2"
			                        placeholder="상세 주소" id="sample4_detailAddress">
						</div>
					</div>
				</div>
				<!-- / Step Content -->
			
			</div>
		</div>

		<!-- Bottom Navigation -->	
		<div class="fixed bottom-0 left-0 right-0 py-5 bg-white shadow-md" x-show="step != 'complete'">
			<div class="max-w-3xl mx-auto px-4">
				<div class="flex justify-between">
					<div class="w-1/2">
						<button type="button"
							x-show="step > 1"
							@click="step--"
							class="w-32 focus:outline-none py-2 px-5 rounded-lg shadow-sm text-center text-gray-600 bg-white hover:bg-gray-100 font-medium border" 
						>이전</button>
					</div>

					<div class="w-1/2 text-right">
						<button type="button"
							x-show="step < 3"
							@click="step++"
							class="w-32 focus:outline-none border border-transparent py-2 px-5 rounded-lg shadow-sm text-center text-white bg-blue-500 hover:bg-blue-600 font-medium" 
						>다음</button>

						<button type="submit" x-show="step === 3" class="w-32 focus:outline-none py-2 px-5 rounded-lg shadow-sm text-center 
						text-white bg-blue-500 hover:bg-blue-600 font-medium" >완료</button>
						
						<button hidden="hidden" id="stepOne" @click="step = 1" type="button"></button>
						<button hidden="hidden" id="stepTwo" @click="step = 2" type="button"></button>
						<button hidden="hidden" id="stepThree" @click="step = 3" type="button"></button>
						<button hidden="hidden" id="stepComplete" @click="step = 'complete'"  type="button"></button>
						
					</div>
				</div>
			</div>
		</div>
		<!-- / Bottom Navigation https://placehold.co/300x300/e2e8f0/cccccc -->	
	</div>
</form>	
</div>
	
	<script type="text/javascript">
    var ajaxFlag_nickcheck = false;
    var ajaxFlag_captcha = false;
    var ajaxFlag_mailcheck = true;
      
    function required() {

    	   var name = document.getElementById('name').value;
           var nick = document.getElementById('nick').value;
           var birth = document.getElementById('birth').value;
           var gender = document.getElementById('gender').value;
           var mail = document.getElementById('mail').value;
           var tel = document.getElementById('tel').value;
           var post = document.querySelector('.post').value;
           var addr = document.querySelector('.addr').value;
           var addr_detail = document.querySelector('.addr_detail').value;
           
           var stepOne = document.getElementById('stepOne');
           var stepTwo = document.getElementById('stepTwo');
           var stepThree = document.getElementById('stepThree');
           var stepComplete = document.getElementById('stepComplete');
           
           if(name == ""){
              alert("이름을 입력해 주세요.");
              stepOne.click();
              return false;
           }
           if(nick == ""){
               alert("닉네임을 입력해 주세요.");
               stepOne.click();
               return false;
            }
           if(!ajaxFlag_nickcheck){
              alert("닉네임 중복검사를 해주세요");
              stepOne.click();
              return false;
           }
		//-----------------------------------------
           if(!ajaxFlag_captcha){
              alert("자동가입방지를 완료해 주세요.");
              stepTwo.click();
              return false;
            }
		//-----------------------------------------
           if(birth == ""){
              alert("생년월일을 선택해 주세요.");
              stepThree.click();
              return false;
           }
           if(mail == ""){
              alert("이메일을 입력해 주세요.");
              stepThree.click();
              return false;
           }
           if(!ajaxFlag_mailcheck){
              alert("이메일 중복검사를 해주세요.");
              stepThree.click();
              return false;
           }
           if(tel == ""){
              alert("전화번호를 입력해 주세요.");
              stepThree.click();
              return false;
           }
           if(post == "" || addr == "" || addr_detail == ""){
              alert("주소를 입력해 주세요.");
              stepThree.click();
              return false;
           }
       		
           //모든것을 성공한 후 전송하기 전에 마지막 스텝으로 이동
           stepComplete.click();
           return true;
     }
    
       // 닉네임 중복 확인
       function XmlNickCheck(){
          
         var nick = document.getElementById('nick').value;
         
         if( nick != ""){
             var xhr = new XMLHttpRequest();
             xhr.open('POST', '<%=request.getContextPath()%>/user/nickcheck');
             xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
             xhr.send('nick='+nick);
             xhr.addEventListener('load', function(){
                var data = xhr.response; 
                if( data != '' ){
                   document.querySelector('#nickcheckResult').textContent = data + '는 이미 존재하는 닉네임입니다.'
                   document.querySelector('#result').style.color = 'red';
                   ajaxFlag_nickcheck = false;
                }else{
                   document.querySelector('#nickcheckResult').textContent = '사용가능한 닉네임입니다.'
                	   document.querySelector('#result').style.color = '#3182ce';
                   ajaxFlag_nickcheck = true;
                }
             })
         }
       }
       
       // 이메일 중복 확인
       function XmlMailCheck(){
    	   
    	   var mail = document.getElementById('mail').value;
    	   
    	   if( mail != ""){
               var xhr = new XMLHttpRequest();
               xhr.open('POST', '<%=request.getContextPath()%>/user/mailcheck');
               xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
               xhr.send('mail='+mail);
               xhr.addEventListener('load', function(){
                  var data = xhr.response; 
                  if( data != '' ){
                     document.querySelector('#mailcheckResult').textContent = ' ' + '이미 존재하는 이메일입니다.'
                     ajaxFlag_mailcheck = false;
                  }else{
                     document.querySelector('#mailcheckResult').textContent = ' ' + '사용가능한 이메일입니다.'
                     ajaxFlag_mailcheck = true;
                  }
               })
           }
       }
      
   </script>
   
   <script type="text/javascript">
    window.onload = function(){
      
      var captchaKey = null;
      var filename = null;
      
      document.getElementById('refresh').addEventListener('click', function() {
         	
	  	  	//입력값 없애기
	  	  	var input = document.getElementById('input');
	  	  	input.value = "";  
	  	  	
	  	  	//결과출력 없애기
	  	  	document.getElementById('result').textContent = '';
    	  
            var xhr = new XMLHttpRequest(); 
            xhr.open('GET', '<%=request.getContextPath()%>/captchaKey/getKey');
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send();
            xhr.addEventListener('load', function(){
               var data =  JSON.parse(xhr.response);
               
               //캡차키 전달받음
               captchaKey = data.key
               //캡차키를 던져 이미지를 받는 함수
               captchaImage(captchaKey);
            }); 
            
      });
      
      function captchaImage(captchaKey){
   
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '<%=request.getContextPath()%>/captchaImage/getImg');
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send("captchaKey="+captchaKey);
            xhr.addEventListener('load', function(){
   
               filename = xhr.response;
                document.getElementById('cpt-img').innerHTML = 
                   "<img src=<%=request.getContextPath()%>/resources/image/captcha/"+filename+".jpg>";
                
            });
      }
      
      document.getElementById('btnSubmit').addEventListener('click', function(){
            
            var input = document.getElementById('input');
            var xhr = new XMLHttpRequest();
            var param = 'input='+input.value+'&mycaptchakey='+captchaKey;
            
            xhr.open('GET', '<%=request.getContextPath()%>/captchaResult/getResult?' + param);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send();
            xhr.addEventListener('load', function(){
               var result = JSON.parse(xhr.response); //괄호가 없다. 속성이다.
               
               ajaxFlag_captcha = result.result;
               
               if(result.result){
                  document.getElementById('result').textContent = '성공했습니다';
               }else{
                  document.getElementById('result').textContent = '다시 시도해주세요';
               }
            })      
      })
      
         //페이지가 로드되면 자동으로 캡차 이미지가 나오게 한다
         document.getElementById('refresh').click();
      }
    
    
     //주소 가져오는 코드
     //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
     function sample4_execDaumPostcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var roadAddr = data.roadAddress; // 도로명 주소 변수
                 var extraRoadAddr = ''; // 참고 항목 변수

                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraRoadAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraRoadAddr !== ''){
                     extraRoadAddr = ' (' + extraRoadAddr + ')';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('sample4_postcode').value = data.zonecode;
                 document.getElementById("sample4_roadAddress").value = roadAddr;
                 document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                 
                 // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                 if(roadAddr !== ''){
                     document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                 } else {
                     document.getElementById("sample4_extraAddress").value = '';
                 }

                 var guideTextBox = document.getElementById("guide");
                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                 if(data.autoRoadAddress) {
                     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                     guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                     guideTextBox.style.display = 'block';

                 } else if(data.autoJibunAddress) {
                     var expJibunAddr = data.autoJibunAddress;
                     guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                     guideTextBox.style.display = 'block';
                 } else {
                     guideTextBox.innerHTML = '';
                     guideTextBox.style.display = 'none';
                 }
             }
         }).open();
     }//end
     
     document.addEventListener('keydown', function(event) {
         if (event.keyCode === 13) {
           event.preventDefault();
         };
       }, true);
     
     
     
     function app() {
         return {
            step: 1, 
            passwordStrengthText: '보안수준 : 취약',
            togglePassword: false,

            image: 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAAAAAAAD/4QBCRXhpZgAATU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAkAAAAMAAAABAAAAAEABAAEAAAABAAAAAAAAAAAAAP/bAEMACwkJBwkJBwkJCQkLCQkJCQkJCwkLCwwLCwsMDRAMEQ4NDgwSGRIlGh0lHRkfHCkpFiU3NTYaKjI+LSkwGTshE//bAEMBBwgICwkLFQsLFSwdGR0sLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLP/AABEIAdoB2gMBIgACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APTmZsnmk3N60N1NJTELub1o3N60lFAC7m9aNzetJRQAu5vWjc3rSUUALub1o3N60lFAC7m9aNzetJRQAu5vWjc3rSUUALub1o3N60lFAC7m9aNzetJRQAu5vWjc3rSUUALub1o3N60lFAC7m9aNzetJRQAu5vWjc3rSUUALub1o3N60lFAC7m9aNzetJRQAu5vWjc3rSUUALub1o3N60lFAC7m9aNzetJRQAu5vWjc3rSUUALub1o3N60lFAC7m9aNzetJRQAu5vWjc3rSUUALub1o3N60lJQA7c3rSbm9aSigBdzetG4+tJRQAZPrRuPrSUUALub1/lRub1pKSgBdzUbm9aSigBdzetG5vX+VJSUALub1/lUu5qhqXj1oAG6mkpW6mkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooASiiigAooooAKSiigAooo+lACUZoooAKKKSgAo/rRSUALUlRVJz60AObqaSlbqaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkoooAKKKKACiikoAKSlooASiiigA+lHpRQaACkoooATmilpPegBP/ANdS5HrUdSfL7UAObqaSlbqaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKSiigAooooAKKKKAEooooASij60UAFFFHpQAUmaKPxoAKSlpPWgA/wAmk/pS/Sk47dqADpUvPvUXrUn4H8qAHt1NJSt1NJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFISFBJIAHUk4FAC0VTlv4EyEBc+3C/nVSS9uX6MEHonX8zQBrEqvLEAe5A/nUTXVqvWVfwyf5VjFmY5Ykn3JP86SmBrG/tB3c/RTTf7QtvST8hWXRQBqi/te+8f8AAc09by0b/loB/vAiseigDeV43+66t9CDTq5/p04+lTJdXMfSQkej/MP1oA2qKoR6gpwJUK/7Scj8utXEkjkG5GDD2P8AMUgH0UUUAFFFJQAUUUUAFFFJQAtJRRQAUlFFABR2oo+lAB1pKKP60AFFFFACUHjNH/66KAEpaSj/APVQAc0/I9KZUufpQA5uppKVuppKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACimsyopZiAo5JNZlxePLlI8rH0J/ib60AWp72KLKph3/wDHR9TWdLNNMcuxPoOij6Co6KYBRRRQAUUUUAFFFFABRRRQAUUUUAFKruhDIxUjuDikooA0IL/os4/4Gv8AUVfBVgCpBB6Ecg1gVLBcSwH5eUP3lPQ/SgDaoqOKaOZdyH/eB6qfepKQBRRRQAlFFFABSUUUAFFFFABRRSf5NABxR6e1FJQAcUUUnP6UALSf5/GjvRz+FAB06d6KT6UGgA96kyf8mo//ANdP59P1oAlbqaSlbqaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACmu6RqzucKvJNKSACScADJJ7Csi6uDO2BkRqflHr7mgBLi5edu4QH5V/qagoopgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACUUUUAPjkkiYOhwR+RHoa14J0nTI4YffX0NYtPileJ1dDyOoPQj0NAG7SUyKVJkDr36juD6U+kAUhoooAKKKKACij/JpKACj/PNFFABScUelFACUdqP8mj+dABn9KMjij60d+tACf5FH5Uf59qOOlACfhUn40zmn4oAlbqaSlbqaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKhuJhDEz/xfdQerGgCpfXGT5CHgf6w+/8AdqhQSSSScknJPqTRTAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkoooAKKKKACiiigCe2nMEnP+rbhx6e9bHoQevT3zXP1p2M+9DE33k5X/AHf/AK1AF2koNFIAoopKAFpKKPSgApPX0pf8mkoAKKTPP1paAE+lFFIT/ntQAelHAoz0oz/hQAd6T155oooAKk2+wqLPt/8AWqTj1P5GgCZuppKVuppKACiiigAooooAKKKKACiiigAooooAKKKKACiiigArJvpd8uwH5Y+P+BHrWnK4jjkc/wAKkj69qwiSSSepJJ+ppgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSUUUAFFFFABRRSUAFFFFABT4pDFIkg/hPPuO4plFAG8CGAYchgCD7HmlqpYy74dp6xnH4HkVapALSUUUAH+NFFJQAc0f5+tHFJQAUUUepoAP/r0nP/1sUH1ozQAUnOaPwo9OlAAcd6T60tJQAHn+lSZPotR/55qTJ/yKAJm6mkpW6mkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAKWoPiNE/vtk/RazKt6g2Zgv9xB+Z5qpTAKKKKACiiigAooooAKKKKACiiigAooooAKKKSgAooooAKKKSgBaSiigAooooAKKKSgC3YPtmKdpFI/EcitSsOJiksTejr+Wa3PSgAoo/zzSflSAWkNBo/nQAlH9aPr60envQAf5NJS0noaADNFH+fYUH/61ACUetFJnGaADg//AK6O/NJ6fhRz0PrQAH/CpefVfzqI46ZNS8UATN1NJSt1NJQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAYt0d1xOf9rA/AYqGnzHMsx/6aP/ADplMAooooAKKKKACiiigAooooAKKKKACiikoAKKKKACiikoAWkoo4oAKKKKACiikoAKWkooAOa3UOUjb1VT+lYVbUB/cwHuY1JoAkz+dGTR2pP5UgAn+lFFHNABSfjzS0nFABn2+lFFIfQj6UAB6c0elH+eKT/JoAPU/wD6qOaPUe1HpQAho+tHXp+lJ/8AqoAOPXrT8H0H50z/ADxUmT6n9KALDdTSUrdTSUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAGFL/AK2b/ro/8zTKluBiecf7Z/XmoqYBRRRQAUUUUAFFFFABRRRQAUUUUAJRRRQAUUUUAFJRRQAUUUUAFFFJQAtJRRQAUUUUAFbUH+og/wCua/yrFrbjGI4h6Io/SgB/NJR60H2pAB/Wj0o5ooATPSjj/P8A9ej/APVSelACn/PrSccYo/z/APXpPf8A/VQAo9KSg9OfX+VHIoAOo7/1pp/P0+lO/Wm8/wD6qAD07dfxo4/Wj9fekyOp/wAigBc9fqKk/Koj39sVLlvf9KALDdTSUrdTSUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAGRfLtuGP95Vb9MVWrQ1FP9TJ9UP8xWfTAKKKKACiiigAooooAKKKKACkoooAKKKKACkpaSgAooooAKKKKACkpaSgAooo5oAKKKSgByjcyL6sAPxrcHHHoMYrJs033Ef+zlz+HStf1xQAn+eKPSj/AD9aPxxSAQ8UUUnrzQAtJn6UZP8An2o5/wA+9ACHt+dHPt3/AP1Uen8qM/rQAZ/wpP8APt60f55o5/rmgA9+1J680fyo7mgBD+H0o6Z4o9/T60UAJz05p/Pv+dM/PnGKk59BQBabqaSlbqaSgAooooAKKKKACiiigAooooAKKKKACiiigAooooAguo/MgkUdQNy/Veaxq6CsS5i8qZ1/hJ3L9DTAiooooAKKKKACiiigApKWkoAKKKKACiikoAKKKKACiiigApKWkoAKKKKACiikoAKKKACSoHUkAY96ANDT0wskh/iIUfQcmr3/AOumRRiKNIx/CBn3PenfmaQC+lFJzzQe/wCtAB/k0nX8fSlJpBgcfj+FABRwfw6Un+TRnt+dAB9KT1xR24+uaKAA/wD6/ek6c0fnzQeP55oAPekOf896OOvPTrR+VABwTgen60hwADRS/T8KAEPJ+vTNSc+v8qj5/wAfwqTP0/OgC03U0lK3U0lABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAVUvofMj3qPnjyfqverdFAHP0VYuoDDIcD92+Snt6iq9MAooooAKKKSgAooooAKKKSgAooooAKKKPagAoopKAFpKKKACiiigApKKKACrljFucyt0ThfdqqojSOqJ1Y4+nqa2Y0WNFReijH196AHUpopO34UgD/J5pP1o/w/Wj+tAAcfnzR/hRz9fSk4/wA/yFAB/k0Z46/Wjpn+tJ+NAAT3P6daT/PtS+tJQAd/0o5pOuOaO340AH+Tn1pAf8il9c+lJQAdPWjn/D2oP4e9Hp9PxoATPNSc+g/Sou3SpMD0NAFxuppKVuppKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAjmiSZGRu/IPofWsWSN4nZHGCP19xW9Ve5t1nXsJF+639DQBj0UrKyMysCGBwQabTAKKKKACiiigAopKKACiiigAopKKACiiigAoopKACiiigAzR1xjJNFaNpa7MSyj5uqKf4c9z70ASWlv5K7m/1jdf9kelWT3o/E/Wk/pSAPr6/wA6P50cGk6ZoAP0/Gj/APXRQf8AOKAEx9Pzo59f/r0HH5f1pP6UALx1FJ6cjPOfx7Ufp/jRx6/0oATnijpx+VGc/SkOefT8qAD+p9aD+uaOnNJj88/hQAuaT+lHrzSe/Hv3oAWkyP8APFGeg7d8Un/6qAD8sfrTvl9f1FN6YH6U/j0P5UAXW6mkpW6mkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAguLZJ154cD5W/oayJIpImKOMHt6EeoNbtMkijlUq6gjt6g+oNAGFRVqezliyyZdOvH3h9RVWmAUlLSUAFFFFABRRRQAUlLSUAFFFFABRRSUAH+RQASQACWPAAHJNSw280x+VcL3Y9K04beKAZHL92P8qAIba0EeHlwXHReoX/AOvVz/Cj0opAJz+dH+FH5/Wk9f8AOKAD9P1o9f60c8Z70Z+lACUfnRRxx+vtQAnr/Wg5/wA9qP8AHvRxj86AE9M96Mn8aOOlJ/8Aq9aAD1/TPWk649sUvfr/AIUnH9KADP6Uf40H/wDX60c/l1oAOvpR/h+FJke/40nPHtn60AGee31NJ6+/tS8dun9fxpOOmPcUAL/hUmR/tfrUJ7/zNSZb1P50AXm6mkpW6mkoAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApKKKACiiigAqvNaQS5ONr/3k/qKsUlAGTLZXEedo3qO69fxFViCDgggjseDW/THjikGHRW+o5/OmBhUVqPYW7fdLp9DkfkahbTn/AIJQf94Y/lQBQoq2bC5GeYz9G/8ArUn2G69F/wC+hQBVoq0LG6PUIPq3+FPGnyn70iD6ZNAFKk/nWmunwjG93b8lFWEggj+5GoPTJGT+ZoAyo7a4kxtQhfVuBV2KxiTBkO8+nRfyq37Ht0ooAOAMDoPQYx9KKOn6UnFIAoo/z+dHagA4pMf5NFHagA+h59KTtR36fjRkc+tAB60n8/8APpSikJFACc+/09qPp75o/wA+oo4zQAZ6+vv/ACpOOPz/ABo6ZyaQ9vb0oAM9vzo/CjPtR2/oaAA496ODx7c0h9+9HJx70AJ3+lHHTP8A9ej8MUnHFAB3o54AoPP50h9fc8UAH+NScev+fzqPp/SpMH/P/wCugC83U0lK3U0lABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUlLSUAFFNeSOMbnYKPfv9BVKXUByIUz/tP/QUAX/X0qB7q2jyC4J9E5P6cVlSTzy/fckenQfkKjpgaJ1FMjETbe5JGfyqzHPBN9xxn0PDfkaxKP8AIoA3/wDPNFY8d3cx4G/cPR+f1q0mop/y0jI91Of0NIC9RUC3dq3/AC0A9mBFSh425DKfoRQA6ko560c+9ABSetLzTSyrncyj6kD+dAC9sUVC1zbLnMi/hz/KoGv4QPkVmPv8ooAuU15I4wS7Ko9zyfwrMkvrh+m1B/s8n8zVYlmOWYknuTk/rTA0X1CINhEZl7nO3P0FPS9tn6sUP+0OD26isqigDdBBGVIOeRtIP8qM9P8A9dYaO8ZJRmU/7JIq1HfyLxIoceo4b/CgDSIpOc1HFPDL9x8nH3Tww/CpM89KQBn/AOtQaT3/ADo/+vQAetJxijPWjigA6fypOOKO3PP1oPTr1zxQAf070np/n9aOaXuaAE4/+tR9Ov8AKg5PNJ+npQAHr/nmk4wc/wD6qMZ/z+NHH6fjQAentR/n2NJ+P/66P69qAD1H696THI+lH40hP+fagBeff2471Jg+pqI+nPT6VJuj9/zNAF9uppKVuppKACiiigAooooAKKKKACiiigAooooAKKKKACkpaimnigXLnk/dUdTQBISqgkkADqTwKoT34GVgGT/fbp+AqpPcSzn5jheyjoKhpgOd3clnYs3qabRSUALSUUUAFFFFABSUtJQAUf59KKKAFDOOAzD8TS+ZL/z0f/vo02koAcXfuzfmTTevX9aKSgBaKPak9KACg0UUAFJRn/69H/1qAA0UH0pKAAZByOCPTircN9ImFly6+v8AEKqHJzRQBtJIki7oyGH6j6in5/8Ar1iJJJG25GII/I/hWjb3SS4DfLJ6HofcUgLPpSZ/z9aX1/XNJ6+npQAcY/Sj29vyo65/SjnP+eKAG/y/WjrS/wCfzo/+tQAn+FJ3x3o6f56UUAJyM8cUUuP8OvakNAB/+qk70ev50maAF5603PtS55Ppn1oPqfWgBOOn40/n0P6VHk8D396mx9aAL7dTSUrdTSUAFFFFABRRRQAUUUUAFFFFABRRRQAUUVXubhYF4wZG+4P6mgAublYBgYMh+6vp7msh3eRi7klj1J/kKGZnYsxJYnJJptMAooooASiiigAo9KKKACiiigBKKKKACiiigApKWkoAKSlooAKTpRRQAUlLSUAFHeik4oAOaKP5Uf8A1qACkooOaACjODkH6e1Ic0UAaFtdlsRyn5sYVvX0Bq7nH096wsjmtC1ut+IZD83ARj3HoaALnXpQCcUfyo5+n+NIBOmaQ85pc89PxpPc8Dt/jQAh7evb8KU+tGevToTSenp3oAD9f/rUe3NJxkf5zR+PpigA57DnFJij6+lB9fWgAJFNPt/9elOfr/8AXpOP6e1AC+n+f1p2D/kmmf0/lUv4f5/KgDQbqaSlbqaSgAooooAKKKKACiiigAooooAKKKT1z2oAjmlSFGdu3AH94+lY0kjyOzuclj+XsKlupzNIcH92nCD196r0wCiiigAopKKACiiigAooooAKSiigAooooAKKKSgAo/z+NFFACcUUUUAFFFJQAUZoozQAlH50c0cUAFFFIfp/9agAo4oooASiiigBPTAoyfp3H/1qP8/nRQBqWtwJV2Mf3i9f9oetT8n61io7RsrqeVPHv7VsRyLIodeh5we3saAHd+Pxo9/84pOOv6mjn8+lIA9/zNJ69aX+VJ6e3WgA6elJye1LwfWkoAMdf0pD29s80uTjGfzpM57UAH8vz/Sk+oo/zn/61J0/GgBe4x6fp9Kkz7fpUf8An8aftP8AkigDSbqaSlbqaSgAooooAKKKKACiiigAooooAKpX0+xBEp+aTr7L/wDXq4SACTwACT9BWHNIZZHkPc8D0UdBQBHRRRTAKSiigAooooAKKKKACkoooAKKKKACkpaSgAoozRQAUUnPNFAB+dFFFABxSc0UUAJn9KKKOlABR/Wj/P1pOKACijmkoAKKKKAE/OjFFHGcUAHr+VHvRxSH2oAP8irVnNsfyz91zgZ7NVWjv+ORz0oA3OvUe4pPzqKGQSxK38XRvqOKk/8A1c+9IA9O3+e9HXjPP6UmeaD6CgAJ6Y9eaD0/mc0f5/Cm/wCf/r0AL+FJ/P8AzxR/niloAT/PsPaj+XbP+NHXP6UnX/69AB/Xr/OpMH3pnHv2qTn1P50AaLdTSUrdTSUAFFFFABRRRQAUUUUAFJRRQBUv5dkQQfekOP8AgI5NZVWb2TfOw7RgIPr3qtTAKKKSgAooooAKKKKACiikoAKKKKACiikoAWkoooAKSiloAT/PFFFFACf4UUdaM0AHY0nPY0UUAFFFJxxigAo/Gj+tFABSZoooAPcelFJ/+ujigA/yaKP88UGgBKPxo96KAEo7/jR3o70AW7GTDmPPDjI/3hWgTWKrbGVx/CQfy7VsghgpHQgE/jQAdf0zQf8AH86D+ntScc+nvSAPrnmj9P8A69JnpQM8fXJ7UAH+foaT29sClPXjHvSf4d6ADPtRkdPxpe3Xt9KT06ewoAOKlwPX9Ki44H4c80/H+cUAabdTSUrdTSUAFFFFABRRRQAUlLSUAFNdgiO56Kpb8hTqrXzbbdx3cqv9aAMgkkknqSSfx5oopKYC0lFFABRRRQAUlFFABRRRQAUUfhRQAUlHJooAPSkpe1JQAp/CkoNFABSUv1pKADpR60UlABx+dFFH6igBKWjmkoAKSlzmkoAM/wCelHpSUc8+9AB+NH+FFBoAM8dKb29+tLnvR/P1oAPWk/OjvRzxQAUUUnH60AHr6Vp2jhoQCTlMr/Wsw1csW5lT1Ab8uKAL3H4dKKP/ANXSjpn260gE7+vejijB/L9KTjII/wAmgBfek+n4fWl5GaD7flQAh9c59MUUcD+VH+cCgA7HH59qlyfb8jUX0HfvzzT+f7woA026mkpW6mkoAKKKKACiikoAKKKKACqGotxCnqWY/hxV+svUT+9Qekf8yaAKdJRRTAKKKKACkpaKAEooooAKKKKACkoooAKOwopPWgA/yKOKKKACkoo9f60AFJS5P+FJ6UAFHNFFABSUUUAGetBopPqaAD+fajrSZoPNAAf84oo9aOcf56UAHce1JzQeM0fSgA9aP85pP8KKAD0o49KKKAEzSelLmkzQAtTWhxOvuGX9M1BT4TtlhP8Atr+pxQBr/nxRzjJ/Gl56elJzxk0gE9Mk0vTuOf1o/wAf880fLQAnXp0/w9KPx9qP8k0f1zQAfjwKPbtzQPp/9ek49eOc0AGfY5Gafg+tMz7egp+1ff8AMUwNRuppKVuppKQBRRSUAFFFFABRRSUALWTf/wCv/wCALWrWVf8A+v8A+ALTAqUUUUAFFFJQAUUUUAHeiiigApKKPxoAPrRRRQAUlFHFAB/+rmg0UlAAaM0dDSfTpQAGiiigA4pKWkFAAaOaDSdqAD0ozR3pKACiiigA9Pb1pPalNJQAUZ+lJRQAGiij/wCv7UABpPWgnv0ooAPxpKKOmRQAdv8AGlj/ANZH/vr/ADpvH9adH/rI/wDfX+dAG0SMnpSY9KM/oaDn8/TikAeuPoaTH55OaOO1HPv/AI0AJ07Dpz6Gl9Pf+tJ0zx1/l1pc8fTpQAn+B5o9Onf15o5wT24zSHpwPwFMA44qTLepph/w+lPw3oaANRuppKVuppKQBSUUUAFFFFABSUUUAFZV/wD8fH/AFrVrJv8A/X/8AWmBVpKWkoAWkoooAKKKKACiikoAKKKDQAUlHtRQAUUUlAAaKPxpKAA0dOlFFABR/Sk5zR/KgBaSiigApO9FH+fxoAP8aPSk6+1J+NAC9x/n86M/5FH50lABRRSUALSUe/p60UAH86TP5UUmaAD0xRR/n6Uf5NAB70UUn/66ADinR/6yP/fU/rTeP8M0sf34+f41/nQBtZ/w/wDrc0nXsPwo/wAg0HvmkAen40Z70n6Z6fj2oIH59aAF70nP4Uf4YoPtxn9KYCc8eoxilznPWj+dJQAdR04NSZPoPzqOpMf5xSA1G6mm05upptABRRRQAUlLSUAFFFFACVlX/wDr/wDgC1q1lX/+v/4AtMCpRRRQAUUUUAFFFJQAUUUUAFJS0lABSUvpSUALSUUE+1ACUUfrRQAetJS0lAC5pP1oooASij2o9fc0AFH0pPT/ADmigAz9cUetHf8ADtSGgAycmjp/hR/+uj60AJR3oo+negAo6UnvRntQAGk9aX86SgAP40nFL+PekoAPX9KKPWk/yaAFpY/vx/768/jSUsePMj9d6/qaANk55+tH8v5UYoHT3HOD70gD/HvSf5/+tR6j19aOP8DTAOMd6Dx0+n/1qP8AI/nQe/tQAdO/5dqSl7Hpn3pPXikAemPp3qbI9aiHWpcD1NAGi3U0lS+n0H8qKAIqKk7UUARUVJQO9AEX+eKKlPb6UnYUAR1lX/8Ar+f7i1telZF//rx/uL/WmBRoqT/61JQAyipP/r0nc/57UAMpKkPf8KO5oAjop56Cg/0oAjop9Hp+FADKSnnrRQAyk61Ieg/Gjt+NAEdH+RUh6fjSDtQAz+dJ0qQ9/wDPakPSgBhpKlPT/PpSHvQBHzSf4mn+v4UGgBnej/PNSdjSdj9BQBH/AIUU80H7v5UAMpDUn9360Dv/AJ70AR/l0o9aef6UD/GgCPij+dSDr+dIe9AEdIal7fjTfX6UAMoz+dOPT8aWgBn+NJUvp+NN/wABQAzmnJ9+P/eX+dKO9SR/6yH/AHx/MUAanH+fekzUnYfSl9f8+lICLj+lH/6/6VKf4P8Ad/wpq/dpgM/Cgc9e2akPf/dpO/4D+YpAM6//AF+v5UZPH+cVJ3/E0rd/+BUAQ89fQcj2qXn1/nR3j+lNPVvqaAP/2Q==',
            password: '',
            gender: 'Male',

            checkPasswordStrength() {
               var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
               var mediumRegex = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})");

               let value = this.password;

               if (strongRegex.test(value)) {
                  this.passwordStrengthText = "보안수준 : 강력";
               } else if(mediumRegex.test(value)) {
                  this.passwordStrengthText = "보안수준 : 평범";
               } else {
                  this.passwordStrengthText = "보안수준 : 취약";
               }
            }
         }
      }
   </script>


</body>
</html>