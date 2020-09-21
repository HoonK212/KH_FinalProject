<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 우편번호와 관련된 라이브러리 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Daily Home Training</title>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/image/logo.png">
<style type="text/css">
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: 'Droid Sans', sans-serif;
  outline: none;
}
::-webkit-scrollbar {
  background: transparent;
  width: 5px;
  height: 5px;
}
::-webkit-scrollbar-thumb {
  background-color: #888;
}
::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.3);
}
/* body {background-color:#eee} */
#contents {
  position: relative;
  transition: .3s;
  margin-left: 290px;
  background-color: #2a2b3d;
}
.margin {
  margin-left: 0 !important;
}

/* Start welcome */

.welcome {
  color: #CCC;
}
.welcome .content {
  background-color: #313348;
  padding: 15px;
  margin-top: 25px;
}
.welcome h2 {
  font-family: Calibri;
  font-weight: 100;
  margin-top: 0
}
.welcome p {
  color: #999;
}


/* Start statistics */
.statistics {
  margin-top: 25px;
  color: #CCC;
}
.statistics .box {
  background-color: #313348;
  padding: 15px;
  overflow: hidden;
}
.statistics .box > i {
  float: left;
  color: #FFF;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  line-height: 60px;
  font-size: 22px;
}
.statistics .box .info {
  float: left;
  width: auto;
  margin-left: 10px;
}
.statistics .box .info h3 {
  margin: 5px 0 5px;
  display: inline-block;
}
.statistics .box .info p {color:#BBB}

/* End statistics */
/* Start charts */
.charts {
  margin-top: 25px;
  color: #BBB
}
.charts .chart-container {
  background-color: #313348;
  padding: 15px;
}
.charts .chart-container h3 {
  margin: 0 0 10px;
  font-size: 17px;
}

/* Start users */

.admins {
  margin-top: 25px;
}
.admins .box {

}
.admins .box > h3 {
  color: #ccc;
  font-family: Calibri;
  font-weight: 300;
  margin-top: 0;
}
.admins .box .admin {
  margin-bottom: 20px;
  overflow: hidden;
  background-color: #313348;
  padding: 10px;
}
.admins .box .admin .img {
  width: 20%;
  margin-right: 5%;
  float: left;
}
.admins .box .admin .img img {
  border-radius: 50%;
}
.admins .box .info {
  width: 75%;
  color: #EEE;
  float: left;
}
.admins .box .info h3 {font-size: 19px}
.admins .box .info p {color: #BBB}

/* End users */
/* Start statis */

.statis {
  color: #EEE;
  margin-top: 15px;
}
.statis .box {
  position: relative;
  padding: 15px;
  overflow: hidden;
  border-radius: 3px;
  margin-bottom: 25px;
}
.statis .box h3:after {
  content: "";
  height: 2px;
  width: 70%;
  margin: auto;
  background-color: rgba(255, 255, 255, 0.12);
  display: block;
  margin-top: 10px;
}
.statis .box i {
  position: absolute;
  height: 70px;
  width: 70px;
  font-size: 22px;
  padding: 15px;
  top: -25px;
  left: -25px;
  background-color: rgba(255, 255, 255, 0.15);
  line-height: 60px;
  text-align: right;
  border-radius: 50%;
}

.main-color {
  color: #ffc107
}
.warning {background-color: #f0ad4e}
.danger {background-color: #d9534f}
.success {background-color: #5cb85c}
.inf {background-color: #5bc0de}




/* --- HEADER --- */
.breadcrumb {
  padding: 0;
  margin: 0;
  list-style-type: none;
}

header.container {
  margin-bottom: 1.5rem;
}

header .breadcrumb {
  color: #7d7d7d;
}

header .breadcrumb li {
  float: left;
  padding: 0 6px;
  height: 20px;
  line-height: 20px;
}

header .breadcrumb li:first-child {
  padding-left: 2px;
}

header .breadcrumb li:not(:last-child)::after {
  content: " \276f";
  padding-left: 8px;
}

header .count {
  float: right;
  color: #333333;
  height: 20px;
  line-height: 20px;
}


table {
  font-family: arial;
  max-width: 100%;
  background-color: transparent;
  border-collapse: collapse;
  border-spacing: 0;
}

.table { 
  width: 100%;
  margin-bottom: 20px;
}

.table th,
.table td {
  font-weight: normal;
  font-size: 12px;
  padding: 8px 15px;
  line-height: 20px;
  text-align: left;
  vertical-align: middle;
  border-top: 1px solid #dddddd;
}
.table thead th {
  background: #eeeeee;
  vertical-align: bottom;
}   
.table tbody > tr:nth-child(odd) > td,
.table tbody > tr:nth-child(odd) > th {
  background-color: #fafafa;
}    
.table .t-small {
  width: 5%;
}
.table .t-medium {
  width: 15%;
}
.table .t-status {
  font-weight: bold;
}
.table .t-active {
  color: #46a546;
}
.table .t-inactive {
  color: #e00300;
}
.table .t-draft {
  color: #f89406;
}
.table .t-scheduled {
  color: #049cdb;
}

 /* Delete-Button */
 .button {
   display: inline-block;
   position: relative;
   width: 120px;
   height: 32px;
   line-height: 32px;
   border-radius: 2px;
   font-size: 0.9em;
   background-color: #fff;
   color: #646464;
 }
 
 .button > paper-ripple {
   border-radius: 2px;
   overflow: hidden;
 }
 

.button.green {
   background-color: #0f9d58;
   color: #fff;
 }
 
 .button.raised {
   transition: box-shadow 0.2s cubic-bezier(0.4, 0, 0.2, 1);
   transition-delay: 0.2s;
   box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
 }
 
 .button.raised:active {
   box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2);
   transition-delay: 0s;
 }
 

  /* Misc */
 .center {
   text-align: center;
 }
 
 .pic-btn{
    background-color:#0f9d58;
    color:#fff;
    font-family: 'Droid Sans', sans-serif;
    margin:0;
    padding:0;
    text-align: center;
 
 }
 
    
.hide{display:none;}
    
</style>
</head>
<body>

<!-- 사이드 네비 메뉴 -->
 <%@include file="/WEB-INF/views/mypage/navi.jsp" %> 

<!--테이블  -->
<!-- TABLE -->
<div style="padding-left:400px; padding-bottom:20px; padding-top:20px;">
<header class="container" >
    <h1 style="font-size:30px; font-weight:bold;">내 회원정보</h1>
    <ul class="breadcrumb">
      <li>마이페이지</li>
      <li>내 회원정보</li>
    </ul>
</header>
</div>


<form action="<%=request.getContextPath() %>/mypage/modifyMyInformation" method="post" id="form" enctype="multipart/form-data">
<div class="my-table" style="width:90%; padding-left:400px;">
<table class="table table-action">
  <thead>
    <tr style="display:none;">
      <th class="t-small"></th>
      <th class="t-medium"></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="width:20%;">
      <input type="file" name="file" id="imageUpload" class="hide" multiple="multiple" /> 
     <img src="<%=request.getContextPath()%>/resources/${pic.path}/${pic.renamed }.${pic.ext}" id="imagePreview" alt="Preview Image" style="width:200px; height:180px;"/>
      </td> 
      <td>
         <label for="imageUpload" class="btn btn-large button raised green center " style="width:57; height:35; line-height:35px; cursor: pointer;">사진수정</label>
      </td>
      <td></td>
    </tr>
    <tr>
      <td>아이디</td>
      <td style="width:40%;"><input type='text' value="${user.id}" style="border:none;background-color:transparent;" readonly></td>
      <td></td>
    </tr>
    <tr>
      <td>비밀번호</td>
      <td>
      
      <input type='password' value="${user.pw}" style="border:none;background-color:transparent;" id="oPw" name="pw" readonly>
      
      <div id="pwAdd"></div>
      </td>
      <td> <span class="button raised green center" style="width:57; height:35; line-height:35px; cursor: pointer;" onclick="attachPw()" >수정</span></td>
    </tr>
    <tr>
      <td>닉네임</td>
      <td>
      <input type='text' value="${user.nick}" style="border:none;background-color:transparent;" id="oNick" name="nick" readonly>
      <div id="nickAdd"></div>
      </td>
      <td> <span class="button raised green center" style="width:57; height:35; line-height:35px; cursor: pointer;" onclick="attachNick()">수정</span></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td>
      <input type='email' value="${user.mail}" style="border:none;background-color:transparent;" id="oMail" name="mail" readonly>
      <div id="mailAdd"></div>
      </td>
      <td> <span class="button raised green center" style="width:57; height:35; line-height:35px; cursor: pointer;" onclick="attachMail()">수정</span></td>
    </tr>
    <tr>
      <td>전화번호</td>
      <td>
      <input type='text' value="${user.tel}" style="border:none;background-color:transparent;" id="oTel" name="tel" readonly>
      <div id="telAdd"></div>
      </td>
      <td> <span class="button raised green center" style="width:57; height:35; line-height:35px; cursor: pointer;" onclick="attachTel()">수정</span></td>
    </tr>
    <tr>
      <td>계좌</td>
      <td>
      <input type='text' value="${account.bank}" style="border:none;background-color:transparent;" id="oBank" name="bank" readonly>
      <input type='text' value="${account.account}" style="border:none;background-color:transparent;" id="oAccount" name="account" readonly>
      <div id="accountAdd"></div>
      </td>
      <td><span class="button raised green center" style="width:57; height:35; line-height:35px; cursor: pointer;" onclick="attachAccount()">수정</span></td>
    </tr>
    <tr>
      <td>주소</td>
      <td>
      <input type='text' value="${user.post}" style="border:none;background-color:transparent;" id="oPost" name="post" readonly>
      <input type='text' value="${user.addr}" style="border:none;background-color:transparent; width:100%;" id="oAddr" name="addr" readonly>
      <div id="addrAdd"></div>
      </td>
      <td><span class="button raised green center" style="width:57; height:35; line-height:35px; cursor: pointer;" onclick="attachAddr()">수정</span></td>
    </tr>
  </tbody>
</table>
</div>
</form>

<!-- button -->
   <div style="margin-left:1046px; display:inline; padding-bottom: 50px;">
        <div class="button raised green" style="width:5%; display:inline-block; text-align:center; cursor: pointer;" onclick="sendForm();">
               <span class="center" >저장</span>
        </div>
   </div>
<script>

   $(function () {

     'use strict';

     var aside = $('.side-nav'),
         showAsideBtn = $('.show-side-btn'),
         contents = $('#contents'),
         _window = $(window)

     showAsideBtn.on("click", function () {
       $("#" + $(this).data('show')).toggleClass('show-side-nav');
       contents.toggleClass('margin');
     });

     if (_window.width() <= 767) {
       aside.addClass('show-side-nav');
     }

     _window.on('resize', function () {
       if ($(window).width() > 767) {
         aside.removeClass('show-side-nav');
       }
     });

     // dropdown menu in the side nav
     var slideNavDropdown = $('.side-nav-dropdown');

     $('.side-nav .categories li').on('click', function () {

       var $this = $(this)

       $this.toggleClass('opend').siblings().removeClass('opend');

       if ($this.hasClass('opend')) {
         $this.find('.side-nav-dropdown').slideToggle('fast');
         $this.siblings().find('.side-nav-dropdown').slideUp('fast');
       } else {
         $this.find('.side-nav-dropdown').slideUp('fast');
       }
     });

     $('.side-nav .close-aside').on('click', function () {
       $('#' + $(this).data('close')).addClass('show-side-nav');
       contents.removeClass('margin');
     });

   });
   
   
   function toggle_ddl() {
     if (datalist.style.display === '') {
       datalist.style.display = 'block';
       this.textContent = "▲";
       /* If input already has a value, select that option from DDL */
       var val = input.value;
       for (var i = 0; i < options.length; i++) {
         if (options[i].text === val) {
           select.selectedIndex = i;
           break;
         }
       }
     } else hide_select();
   }

   function fill_input() {
     input.value = options[this.selectedIndex].value;
     hide_select();
   }

   /* when user wants to type in text field, hide DDL */
   input = document.querySelector('input');
   input.addEventListener('focus', hide_select);

   function hide_select() {
     datalist.style.display = '';
     button.textContent = "▼";
   }
   
   
   /* file-preview */
   $('#imageUpload').change(function(){         
   readImgUrlAndPreview(this);
   function readImgUrlAndPreview(input){
       if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {                        
                   $('#imagePreview').attr('src', e.target.result);
               }
             };
             reader.readAsDataURL(input.files[0]);
        }   
   });
   
   
   //수정버튼을 연속으로 못 누르도록 막는 변수 
   var changeBtn = true;
   
   //비밀번호 수정 버튼을 눌렀을 때 
   function attachPw(){
        
        if(changeBtn){
           
          //기존의 pw태그가 사라지는 코드 
          // $("#oPw").hide();
          $("#oPw").css("display","none");
   
            
          //비밀번호 확인을 위한 태그가 생성이 된다 
           const str =  
             '<div id="pwDiv">'
              +'<input type="password" id="pw" placeholder="기존 비밀번호 입력">&nbsp;<input type="button" value="비밀번호 확인" onclick="checkPw();"><br>'
              +'<span id ="inputPw" style="color:red;"></span><br>'
              +'<input type="password" id="chInputPw1" placeholder="변경 할 비밀번호 입력" /><br><br>'
              +'<input type="password" id="chInputPw2" placeholder="변경 할 비밀번호 확인" /><br><br>'
              +'<input type="button" value="취소" onclick="cancelPw();">&nbsp;<input type="button" value="변경" onclick="changePw();" >'
              +'</div>';
             
           $("#pwAdd").append(str); // JQuery를 이용해서 juso24라는 id값을 가져와서 그곳에 append 시킨다.
           
           //두번 연속 수정 버튼을 못 누르도록 막는다
           changeBtn = false ;
           
           //다시 비밀번호 수정 버튼을 눌렀을 때 확인 버튼을 다시 누르도록 유도하는 코드 
           pwCheck = false ;
         }
   }
   
   //확인 버튼을 눌렀는지 확인하는 변수 
   var pwCheck = false ;
   
   
   //비밀번호 확인 버튼을 눌렀을 때 
   function checkPw(){
       
      //확인할 기존의 비밀번호의 
      var pw = document.querySelector('#pw').value;
      if(pw == ''){
         alert('비밀번호를 입력 해주세요')
      }else{
         
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '<%=request.getContextPath()%>/mypage/chPasswaord');
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send('pw='+pw);
            xhr.addEventListener('load', function(){
               var data = xhr.response; 
               if( data == '0' ){//비밀번호가 일치하는 경우 //비밀번호 일치한다고 나타내기
                  
                  const str = '비밀번호가 일치합니다';
                 
                    //append 하면 안된다 innerHtml을 사용해야한다 
                  $("#inputPw").text(str);
                    
                    //비밀번호가 일치할 경우 
                    pwCheck = true ;
                  
               }else{//비밀번호가 일치하지 않는 경우 //비밀번호 일치하지 않는다고 나타내기 
                  
                  const str = '비밀번호가 일치 하지 않습니다';
               
                  $("#inputPw").text(str);
                  
                  //비밀번호가 일치하지 않는 경우
                    pwCheck = false ;
               }
            })
      
         }
   
   }//end
   
   
   //비밀번호 변경 버튼을 눌렀을 때 
   function changePw(){
      
      //비밀번호가 일치하는지 확인 했다면 
      if(pwCheck){
    
            //기존 비밀번호
            var oPw = document.querySelector('#oPw').value;
            //기존비밀번호 
            var pw = document.querySelector('#pw').value;
            //변경할 비밀 번호 값
            var chInputPw1 = document.querySelector('#chInputPw1').value;
            //변경할 비밀번호 확인 값 
            var chInputPw2 = document.querySelector('#chInputPw2').value;
            
            
            if(pw == '' || chInputPw1 == '' || chInputPw2 == '' ){
               alert('기존 비밀번호값 또는 변경할 비밀 번호를 입력해주세요 ')
            }else{
               //모든 값을 입력 했을 때 변경할 비밀번호 값이 일치하지 않는 경우 
               if(chInputPw1 != chInputPw2 ){
                     alert('변경한 비밀번호가 일치하지 않습니다 ')
               }else{//변경할 비밀번호 값이 일치하는 경우 
                  
                  //새로 생성된 div 삭제 
                  //$("#pwDiv").hide();
                  $("#pwDiv").css("display","none");
                     
                  //변경된 비밀번호를 기존의 비밀번호값으로 바꾼다
                  //alert(oPw);
                  //alert(chInputPw1);
                  //기존의 태그 생성 
                  //$("#oPw").show();
                  
                  //기존의 input 태그에 변경한 값을 넣기 
                  var oP = document.querySelector('#oPw')
                  oP.value = chInputPw1;
                  
                  //기존의 태그를 보여주는 코드
                  $("#oPw").css("display","block");
                  
                  //다시 수정버튼을 누르도록 하는 코드 
                  changeBtn = true;
                  
               }
               
               
            }
         }else{//비밀번호 중복체크를 하지 않은 경우 
            alert('비밀번호 중복 체크를 해주세요')
         }
      
   }//end
   
   
   //비밀번호 취소 버튼을 누르는 경우 
   function cancelPw(){
       //생성된 div 태그를 없앤다 
       //취소시에는 remove를 사용하자 
       //$("#pwDiv").remove();
       $("#pwDiv").remove();
      
       //기존의 태그를 생성한다 
       //$("#oPw").show();
       $("#oPw").css("display","block");
       
       
       $("#pwDiv").remove();
       
       
       changeBtn = true;
   }
   
   
   //닉네임 수정 버튼을 연속 두번 못누르도록 하는 변수 
   var nBtn = true ;
   
   //닉네임 수정 버튼을 눌렀을 때 
   function attachNick(){
       
       //수정버튼을  처음 눌렀을 때
      if(nBtn){
         
          //기존의 태그가 사라지도록 하는 코드 
             $("#oNick").css("display","none");
          
          //비밀번호 확인을 위한 태그가 생성이 된다 
           const str =  
             '<div id="nickDiv">'
              +'<input type="text" id="nick" placeholder="변경할 닉네임 입력">&nbsp;<input type="button" value="취소" onclick="cancelNick();">&nbsp; <input type="button" value="변경" onclick="checkNick();" class="nickC" ><br>'
              +'<span id="inputNick" style="color:red;"></span>'
              +'</div>';
             
           $("#nickAdd").append(str); 
           
           //수정버튼을 연속으로 누르지 못하도록 막는 코드 
           nBtn = false;
         }
   }
   
   
   //닉네임 확인 버튼을 눌렀을 때 
   function checkNick(){
      
      //확인할 변경할 닉네임 값
      var nick = document.querySelector('#nick').value;
      
      if(nick == ''){
         alert('변경할 닉네님을 입력해주세요.')
      }else{
         //변경할 닉네임을 작성한 경우
         var xhr = new XMLHttpRequest();
         xhr.open('POST', '<%=request.getContextPath()%>/mypage/chNick');
         xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
         xhr.send('nick='+nick);
         xhr.addEventListener('load', function(){
            
            var data = xhr.response; 
            
            if( data == '1' ){//닉네임이 중복되는 경우  
               //닉네임이 중복된다고 나타내기 
               const str = '이미 존재하는 닉네임입니다.';
               
               $("#inputNick").text(str);
            
            }else{//닉네임이 중복되지 않는 경우 
               
            //생성된 nickDiv 삭제 
            // $("#nickDiv").css("display","none");
             $("#nickDiv").css("display","none");
             $("#oNick").css("display","block");
            
            //변경한 닉네임을 기존의 닉네임의 값으로 변경해주는 코드 
           var oN = document.querySelector('#oNick');         
           oN.value = document.querySelector('#nick').value;     
           
            //한번더 삭제하기        
             $("#nickDiv").remove();
            
           //다시 수정버튼을 누를 수 있도록 하는 코드
           nBtn = true;
           
           
            }
         })
        }
   
   }//end
   
   
   
   //닉네임 취소 버튼을 눌렀을 때 
   function cancelNick(){
      //생성된 div 태그를 없앤다 
      //$("#nickDiv").css("display","none");
      $("#nickDiv").remove();
      
      //기존의 태그를 다시 생성한다 
      $("#oNick").css("display","block");
      
      //다시 한번 지워줘야 한다
      $("#nickDiv").remove();
      
      //다시 닉네임을 누를 수 있도록 하는 코드 
      nBtn = true;
   }
   
   
   //이메일 버튼을 연속 두번 못 누르도록 하는 변수  
   var eBtn = true;
   
   //이메일 수정 버튼을 눌렀을 때 
   function attachMail(){
      
      if(eBtn){
       //기존의 이메일 태그가 사라지는 코드    
       $("#oMail").css("display","none");
         
       //이메일 확인을 위한 태그가 생성이 된다 
        const str =  
          '<div id="mailDiv">'
          //이메일 정규식 해야겠다
           +'<input type="email" id="mail" placeholder="변경할 이메일 입력"/>&nbsp;<input type="button" value="중복확인" onclick="checkMail();"><br>'
           +'<span id="inMail" style="color:red;"></span><br>' 
           +'<input type="text" id="mailNumber" placeholder="인증번호 입력"/><br><br>'
           +'<input type="button" value="취소" onclick="cancelMail();" >&nbsp;<input type="button" value="변경" onclick="changeMail();">'
           +'</div>';
          
        $("#mailAdd").append(str); 
        
        eBtn=false;
        
        //수정 버튼을 눌렀을 때 다시 중복버튼을 누르도록 해야한다
        chMail = false;
      
          }
        
        
   }//end
   
   //이메일 확인 버튼을 눌렀는지 확인하는 변수 
   var chMail = false;
   
   
   //이메일 인증번호
   var randomN ;
   
   //이메일 확인 버튼을 눌렀을 때 
   function checkMail(){
      
         //중복확인을 위한 이메일 값
         var mail = document.querySelector('#mail').value;
         
         if(mail == ''){
            alert('확인을 위한 이메일을 입력해주세요.')
         }else{
            
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '<%=request.getContextPath()%>/mypage/chMail');
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send('mail=' + mail);
            xhr.addEventListener('load', function(){
               var data = xhr.response; 
               if( data == '0' ){//사용할 수 없는 이메일
                    //동일한 이메일이 존재합니다 
                  //const str = '이미 존재하는 이메일입니다.';
                     
                    //왜 도데체 아래 부분이 다 없어지는 걸까?
                  $("#inMail").html("이미 존재하는 이메일 입니다");
                  
               }else{//이메일이 중복되지 않는 경우 
                     randomN = data;  
                     //alert(randomN);
                   //인증번호가 전송되었음을 알려준다 
                  const str = '메일로 인증번호가 전송되었습니다.';
                  $("#inMail").html(str);
                  
                  //중복확인을 했음
                  chMail = true;
                  
               }
            })
         
            }
   }//end
   
   //이메일 변경 버튼을 눌렀을 때 
   function changeMail(){
      
      //이메일 중복체크를 한 경우
      if(chMail){
         
         var mail = document.querySelector('#mail').value;//변경할 이메일
         var mailNumber  = document.querySelector('#mailNumber').value;//인증번호
         var oMail = document.querySelector('#oMail').value;//기존의 이메일 값
         
         //변경할 이메일 값과, 인증번호가 null이 아닌지 확인 
         if(mail == '' || mailNumber == ''){
            alert('변경할 이메일 또는 인증번호를 입력해주세요')
         }else{//둘다 null이 아닌 경우
            //인증번호가 일치하는지 확인 
            if(mailNumber != randomN) {
               alert('인증번호가 일치하지 않습니다')
               }else{//인증번호가 일치하는 경우 
            
           //mailDiv 삭제 
            $("#mailDiv").css("display","none");
            
           //기존의 mail 태그 생성 
            $("#oMail").css("display","block");
           
           //변경된 이메일 값을 기존의 이메일 값으로 변경       
           var oM = document.querySelector('#oMail');
           oM.value =  document.querySelector('#mail').value;
           
           eBtn = true;
           
            }
           }
         
         }else{//이메일 중복체크를 하지 않은 경우
            alert('이메일 중복체크를 해주세요');
         }      
         
   }//end
   
   //이메일 취소 버튼을 눌렀을 때 
   //왜 2번째 취소 버튼을 눌렀을 때 div가 없어지지 않을 까? 
   function cancelMail(){
      //새로 생성된 mail div를 없앤다 
       $("#mailDiv").remove();
      
      //기존의 태그를 생성한다 
       $("#oMail").css("display","block");
      
      //다시 한번 지워줘야 한다
       $("#mailDiv").remove();
      
       eBtn = true;
   }
   
   
   //전화번호 수정 버튼을 연속으로 누르지 못하도록 하는 변수 
   var tBtn = true;
   
   
   //전화번호 수정버튼을 눌렀을 때 
   function attachTel(){
   
       if(tBtn){
          //기존의 전화번호 태그가 사라지는 코드    
           $("#oTel").css("display","none");
            
          //이메일 확인을 위한 태그가 생성이 된다 
           const str =  
             '<div id="telDiv">'
              +'<input type="text" id="tel" placeholder="010-0000-0000"/>&nbsp;'
              +'<input type="button" value="취소" onclick="cancelTel();">&nbsp;<input type="button" value="변경" onclick="changeTel();">'
              +'</div>';
             
           $("#telAdd").append(str);
           
           tBtn=false;
           
         }  
   }//end
   
   //전화번호 변경 버튼을 눌렀을 때
   function changeTel(){
      var oTel = document.querySelector('#oTel').value; //기존의 전화번호
      var tel  = document.querySelector('#tel').value; //변경될 전화번호 
      
      if(tel==''){
         alert('변경할 전화번호을 입력해주세요')
      }else{
         
         //telDiv가 사라지는 코드 
          $("#telDiv").css("display","none");
         
         //기존의 tel 태그가 생기는 코드 
          $("#oTel").css("display","block");
         
         //변경된 번호가 기존의 번호로 변경되는 코드 
         var oT = document.querySelector('#oTel');
         oT.value = document.querySelector('#tel').value;
         
         tBtn=true;
      
      }
   }//end
   
   
   
   //전화번호 취소 버튼을 누른 경우 
   function cancelTel(){
      //새로 생성된 div 태그를 없앤다 
       $("#telDiv").remove();
      
      //기존의 태그를 다시 생성한다 
      $("#oTel").css("display","block");
      
      //한번 더 삭제 한다      
       $("#telDiv").remove();
      //수정 버튼을 누를 수 있도록 해준다 
       tBtn=true;
   }
   
   
   
   //주소 수정버튼을 연속으로 누르지 못하도록하는 코드 
   var aBtn = true;
   
   
   //주소 수정 버튼을 눌렀을 때 
    function attachAddr(){
      
      if(aBtn){
         
          //기존의 주소 태그가 사라지는 코드    
         $("#oPost").css("display","none");
         $("#oAddr").css("display","none");
            
          //주소 확인을 위한 태그가 생성이 된다 
           const str =  
             '<div id="addrDiv">'
             +'<input type="text" id="sample4_postcode" placeholder="우편번호">'
             +'<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>'
             +'<input type="text" id="sample4_roadAddress" placeholder="도로명주소">'
             +'<input type="text" id="sample4_jibunAddress" placeholder="지번주소">'
             +'<span id="guide" style="color:#999;display:none"></span>'
             +'<input type="text" id="sample4_detailAddress" placeholder="상세주소"><br>'
              +'<input type="button" value="취소"  onclick="cancelAddr();">&nbsp;<input type="button" value="변경" onclick="changeAddr();">'
              +'</div>';
             
           $("#addrAdd").append(str); 
           
           aBtn = false;
           
      }
   }
   
   
    //우편번호와 관련 된 코드 
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
                
                //이 부분을 지우면 잘 진행이 될까?
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /* if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                } */

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
    
    
    //주소 변경 버튼을 눌렀을 때 
    function changeAddr(){
       //우편번호
       var sample4_postcode = document.querySelector('#sample4_postcode').value;
       
       //도로명주소 
       var sample4_roadAddress = document.querySelector('#sample4_roadAddress').value;
       
       //상세주소 
       var sample4_detailAddress = document.querySelector('#sample4_detailAddress').value;
       
       //기존의 우편번호
       var oPost = document.querySelector('#oPost');
       //기존의 상세주소
       var oAddr = document.querySelector('#oAddr');
       
       
       if(sample4_postcode == '' || sample4_roadAddress == '' || sample4_detailAddress == ''  ){
          alert('우편번호, 도로명주소, 상세주소 정보를 빠짐없이 기입해주세요')
       }else{
       
          //addrDiv 가 사라지는 코드 
          $("#addrDiv").css("display","none");
          
          //기존의 주소 태그 생성 
          $("#oAddr").css("display","block");
          $("#oPost").css("display","block");
          
          //변경할 주소 값이 기존의 값으로 바뀌는 코드 
          //우편번호
          oPost.value = sample4_postcode;
          //상세주소 
          oAddr.value = sample4_roadAddress + ' ' + ' ' + sample4_detailAddress; 
          
          //수정버튼을 누를 수 있도록 해주는 코드 
          aBtn = true;
       }
       
    }
    
    //주소 취소 버튼을 눌렀을 때 
    function cancelAddr(){
       //생성된 div 태그 없애기 
       $("#addrDiv").remove();
       
       //기존 주소 태그 생성하기
       $("#oAddr").css("display","block");
       $("#oPost").css("display","block");
      
       //한번 더 삭제하기
       $("#addrDiv").remove();
       
       //수정버튼을 누를 수 있도록 해주는 코드 
       aBtn = true;
    }
    
    
    //계좌 변경 수정 버튼을 연속으로 누르지 못하도록 막는 코드
    var atBtn = true;
    
    
    //계좌 변경 버튼을 눌렀을 때 
    function attachAccount(){
       
       if(atBtn){
          
          //기존의 계좌 태그가 사라지는 코드    
          $("#oBank").css("display","none");
          $("#oAccount").css("display","none");
            
          //계좌 확인을 위한 태그가 생성이 된다 
           const str =  
             '<div id="accountDiv">'
              +'<input type="text" id="bank" placeholder="변경할 은행 입력"/><br><br>'
              +'<input type="text" id="account" placeholder="변경할 계좌번호 입력"/><br>'
              +'<span id="inputAccount" style="color:red;"></span><br>'
              +'<input type="button" value="취소" onclick="cancelAccount();">&nbsp;<input type="button" value="변경" onclick="checkAccount();">'
              +'</div>';
             
           $("#accountAdd").append(str); 
           
           atBtn= false;
        
       }
   }
    
   
   //계좌 중복을 확인하는 버튼을 누른 경우 
   function checkAccount(){
      
         //중복확인을 위한 계좌 값
         var bank = document.querySelector('#bank').value;
         var account = document.querySelector('#account').value;
         
         if(account == '' || bank == ''){
            alert('변경 할 계좌와 은행을 입력해주세요')
         }else{
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '<%=request.getContextPath()%>/mypage/chAccount');
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send('account='+account);
            xhr.addEventListener('load', function(){
               var data = xhr.response; 
               if( data == '1' ){//사용할 수 없는 계좌
                     //동일한 계좌가 존재합니다 
                  const str = '이미 동일한 계좌가 존재합니다.';
                  $("#inputAccount").text(str);
               }else{//계좌가 중복되지 않는 경우 
               
                  //생성된 div 없애기 
                  $("#accountDiv").css("display","none");
               
                  //기존의 태그 생성 
                  $("#oBank").css("display","block");
                  $("#oAccount").css("display","block");
                  
                  //변경할 계좌, 은행을 기존의 태그의 값에다 넣기 
                  //변경할 계좌의 값
                  //var account = document.querySelector('#account').value;
                  //기존의 계좌 값
                  var oAccount = document.querySelector('#oAccount');
                 //기존의 은행 값
                  var oBank = document.querySelector('#oBank');
                 //변경할 은행 값
                  //var bank = document.querySelector('#bank').value;
   
                  oAccount.value = document.querySelector('#account').value;
                  oBank.value = document.querySelector('#bank').value ;
                  
                  //수정버튼을 누를 수 있도록 해주는 코드
                  atBtn= true;
                  
               }
            })
         }
   }//end
   
   
   //계좌 취소 버튼을 누른경우 
   function cancelAccount(){
      //새로운 div 태그를 삭제하는 코드 
      $("#accountDiv").remove();
               
      //기존의 태그를 생성하는 코드 
      $("#oBank").css("display","block");
      $("#oAccount").css("display","block");
      
      //한번 더 삭제해주는 코드
      $("#accountDiv").remove();
      
      //수정버튼을 누를 수 있도록 해주는 코드
      atBtn= true;
      
   } 
   
   //form을 전송하는 코드
   function sendForm(){
     
         var form = document.querySelector('#form');
         form.submit();
     
   }
  
   
   
   
   

</script>
</body>
</html>