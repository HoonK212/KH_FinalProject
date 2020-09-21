<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
body {}
#contents {
  position: relative;
  transition: .3s;
  margin-left: 290px;
/*   background-color: #2a2b3d;  */
}
.margin {
  margin-left: 0 !important;
}



/*이미지*/
body {
  margin: auto;
/*   background: #F2F5E9; */
 
  font-family: "Arial"
}
ul {
    padding:0;
}
ul.gallery li {
  display: inline-block;
  opacity:1;
  -webkit-transition: opacity .5s ease-in-out;
  -moz-transition: opacity .5s ease-in-out;
  -o-transition: opacity .5s ease-in-out;
  transition: opacity .5s ease-in-out;

}
label {
  cursor: pointer;
  color: #fff;
  background: #5D6B74;
  padding: 5px 19px;
}
.image-input{
  display: none;
}
img {
 /* padding: 5px; */
/*   border: 1px solid #ccc; */

}
/*Select Categorie*/   
 .image-input#select-animals:checked ~ .gallery li:not(.animals-item), input#select-lightning:checked ~ .gallery li:not(.lightning-item), input#select-desert:checked ~ .gallery li:not(.desert-item) {
  opacity: 0.1;
}

/*다중선택*/
body {

  /*이거를 지우니까 네비는 모양을 갖추는 것 같다 */
  /*font: normal 14px/100% "Andale Mono", AndaleMono, monospace;*/
  
  
  /* color: #fff;  */ 
/*   padding: 50px; */
 /* width: 300px; */ 
  margin: 0 auto;
 /*  background-color: #374954; */
}

.dropdown {
  position: absolute;
  top:50%;
  transform: translateY(-50%);
}

 a {
  color: #fff; 
} 

.dropdown dd,
.dropdown dt {
  margin: 0px;
  padding: 0px;
}

.dropdown ul {
  margin: -1px 0 0 0;
}

.dropdown dd {
  position: relative;
}

.dropdown a,
.dropdown a:visited {
  color: #fff;
  text-decoration: none;
  outline: none;
  font-size: 12px;
}

.dropdown dt a {
  background-color: #4F6877;
  display: block;
  padding: 8px 20px 5px 10px;
  min-height: 25px;
  line-height: 24px;
  overflow: hidden;
  border: 0;
  width: 272px;
}

.dropdown dt a span,
.multiSel span {
  cursor: pointer;
  display: inline-block;
  padding: 0 3px 2px 0;
}

.dropdown dd ul {
  background-color: #4F6877;
  border: 0;
  color: #fff;
  display: none;
  left: 0px;
  padding: 2px 15px 2px 5px;
  position: absolute;
  top: 2px;
  width: 280px;
  list-style: none;
  height: 100px;
  overflow: auto;
}

.dropdown span.value {
  display: none;
}

.dropdown dd ul li a {
  padding: 5px;
  display: block;
}

.dropdown dd ul li a:hover {
  background-color: #fff;
}

.multi-button {
  background-color: #6BBE92;
  width: 302px;
  border: 0;
  padding: 10px 0;
  margin: 5px 0;
  text-align: center;
  color: #fff;
  font-weight: bold;
}


/*dropdoewn2*/


.dropdown2 {
  position: absolute;
  top:24%;
  transform: translateY(-50%);
}

.a2 {
  color: #fff;
}

.dropdown2 dd,
.dropdown2 dt {
  margin: 0px;
  padding: 0px;
}

.dropdown2 ul {
  margin: -1px 0 0 0;
}

.dropdown2 dd {
  position: relative;
}

.dropdown2 a,
.dropdown2 a:visited {
  color: #fff;
  text-decoration: none;
  outline: none;
  font-size: 12px;
}

.dropdown2 dt a {
  background-color: #4F6877;
  display: block;
  padding: 8px 20px 5px 10px;
  min-height: 25px;
  line-height: 24px;
  overflow: hidden;
  border: 0;
  width: 272px;
}

.dropdown2 dt a span,
.multiSel span {
  cursor: pointer;
  display: inline-block;
  padding: 0 3px 2px 0;
}

.dropdown2 dd ul {
  background-color: #4F6877;
  border: 0;
  color: #fff;
  display: none;
  left: 0px;
  padding: 2px 15px 2px 5px;
  position: absolute;
  top: 2px;
  width: 280px;
  list-style: none;
  height: 100px;
  overflow: auto;
}

.dropdown2 span.value {
  display: none;
}

.dropdown2 dd ul li a {
  padding: 5px;
  display: block;
}

.dropdown2 dd ul li a:hover {
  background-color: #fff;
}
.multi-button {
  background-color: #6BBE92;
  width: 302px;
  border: 0;
  padding: 10px 0;
  margin: 5px 0;
  text-align: center;
  color: #fff;
  font-weight: bold;
}



/*dropdoewn3*/


.dropdown3 {
  position: absolute;
  top:80%;
  transform: translateY(-50%);
}

.a3 {
  color: #fff;
}

.dropdown3 dd,
.dropdown3 dt {
  margin: 0px;
  padding: 0px;
}

.dropdown3 ul {
  margin: -1px 0 0 0;
}

.dropdown3 dd {
  position: relative;
}

.dropdown3 a,
.dropdown3 a:visited {
  color: #fff;
  text-decoration: none;
  outline: none;
  font-size: 12px;
}

.dropdown3 dt a {
  background-color: #4F6877;
  display: block;
  padding: 8px 20px 5px 10px;
  min-height: 25px;
  line-height: 24px;
  overflow: hidden;
  border: 0;
  width: 272px;
}

.dropdown3 dt a span,
.multiSel span {
  cursor: pointer;
  display: inline-block;
  padding: 0 3px 2px 0;
}

.dropdown3 dd ul {
  background-color: #4F6877;
  border: 0;
  color: #fff;
  display: none;
  left: 0px;
  padding: 2px 15px 2px 5px;
  position: absolute;
  top: 2px;
  width: 280px;
  list-style: none;
  height: 100px;
  overflow: auto;
}

.dropdown3 span.value {
  display: none;
}

.dropdown3 dd ul li a {
  padding: 5px;
  display: block;
}

.dropdown3 dd ul li a:hover {
  background-color: #fff;
}
.multi-button {
  background-color: #6BBE92;
  width: 302px;
  border: 0;
  padding: 10px 0;
  margin: 5px 0;
  text-align: center;
  color: #fff;
  font-weight: bold;
}



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


/* modal */
/* Modal Base CSS */
.scotch-overlay
{
    position: fixed;
    z-index: 9998;
    top: 0;
    left: 0;

    opacity: 0;

    width: 100%;
    height: 100%;

    -webkit-transition: 1ms opacity ease;
       -moz-transition: 1ms opacity ease;
        -ms-transition: 1ms opacity ease;
         -o-transition: 1ms opacity ease;
            transition: 1ms opacity ease;

    background: rgba(0,0,0,.6);
}

.scotch-modal
{
    position: absolute;
    z-index: 9999;
    top: 50%;
    left: 50%;

    opacity: 0;

    width: 94%;
    padding: 24px 20px;

    -webkit-transition: 1ms opacity ease;
       -moz-transition: 1ms opacity ease;
        -ms-transition: 1ms opacity ease;
         -o-transition: 1ms opacity ease;
            transition: 1ms opacity ease;

    -webkit-transform: translate(-50%, -50%);
       -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
         -o-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);

    border-radius: 2px;
    background: #fff;
}

.scotch-modal.scotch-open.scotch-anchored
{
    top: 20px;

    -webkit-transform: translate(-50%, 0);
       -moz-transform: translate(-50%, 0);
        -ms-transform: translate(-50%, 0);
         -o-transform: translate(-50%, 0);
            transform: translate(-50%, 0);
}

.scotch-modal.scotch-open
{
    opacity: 1;
}

.scotch-overlay.scotch-open
{
    opacity: 1;

}

/* Close Button */
.scotch-close
{
    font-family: Helvetica,Arial,sans-serif;
    font-size: 24px;
    font-weight: 700;
    line-height: 12px;

    position: absolute;
    top: 5px;
    right: 5px;

    padding: 5px 7px 7px;

    cursor: pointer;

    color: #fff;
    border: 0;
    outline: none;
    background: #e74c3c;
}

.scotch-close:hover
{
    background: #c0392b;
}

/* Default Animation */

.scotch-overlay.fade-and-drop
{
    display: block;

    opacity: 0;
}

.scotch-modal.fade-and-drop
{
    top: -300%;

    opacity: 1;

    display: block;
}

.scotch-modal.fade-and-drop.scotch-open
{
    top: 50%;

    -webkit-transition: 500ms top 500ms ease;
       -moz-transition: 500ms top 500ms ease;
        -ms-transition: 500ms top 500ms ease;
         -o-transition: 500ms top 500ms ease;
            transition: 500ms top 500ms ease;
}

.scotch-modal.fade-and-drop.scotch-open.scotch-anchored
{

    -webkit-transition: 500ms top 500ms ease;
       -moz-transition: 500ms top 500ms ease;
        -ms-transition: 500ms top 500ms ease;
         -o-transition: 500ms top 500ms ease;
            transition: 500ms top 500ms ease;
}

.scotch-overlay.fade-and-drop.scotch-open
{
    top: 0;

    -webkit-transition: 500ms opacity ease;
       -moz-transition: 500ms opacity ease;
        -ms-transition: 500ms opacity ease;
         -o-transition: 500ms opacity ease;
            transition: 500ms opacity ease;

    opacity: 1;
}

.scotch-modal.fade-and-drop
{
    -webkit-transition: 500ms top ease;
       -moz-transition: 500ms top ease;
        -ms-transition: 500ms top ease;
         -o-transition: 500ms top ease;
            transition: 500ms top ease;
}

.scotch-overlay.fade-and-drop
{
    -webkit-transition: 500ms opacity 500ms ease;
       -moz-transition: 500ms opacity 500ms ease;
        -ms-transition: 500ms opacity 500ms ease;
         -o-transition: 500ms opacity 500ms ease;
            transition: 500ms opacity 500ms ease;
}

/*pop-up*/

body {
  font-family:'Roboto';
}

.popup-trigger:hover {
    opacity:.8;
}

.popup {
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  z-index: 1000;
  width: 100%;
  background-color: rgba(94, 110, 141, 0.9);
  opacity: 0;
  visibility: hidden;
  transition:500ms all;

}

.popup.is-visible {
  opacity: 1;
  visibility: visible;
 transition:1s all;
}

.popup-container {
  transform:translateY(-50%);
  transition:500ms all;
  position: relative;
  width: 43%;
  margin: 2em auto;
  top: 5%;
  padding:5rem;
  background: #FFF;
  border-radius: .25em .25em .4em .4em;
  text-align: center;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
}

.is-visible .popup-container {
  transform:translateY(0);
  transition:500ms all;
}

.popup-container .popup-close {
  position: absolute;
  top: 8px;
  font-size:0;
  right: 8px;
  width: 30px;
  height: 30px;
}


.popup-container .popup-close::before,
.popup-container .popup-close::after {
  content: '';
  position: absolute;
  top: 12px;
  width: 14px;
  height: 3px;
  background-color: #8f9cb5;
}

.popup-container .popup-close::before {
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transform: rotate(45deg);
  left: 8px;
}

.popup-container .popup-close::after {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform: rotate(-45deg);
  right: 8px;
}


.popup-container .popup-close:hover:before,
.popup-container .popup-close:hover:after {
  background-color:#35a785;
  transition:300ms all;
}

/*저장버튼 */
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
    
    #fonttt{
      font: normal 14px/100% "Andale Mono", AndaleMono, monospace;
    }

</style>
</head>
<body>

<!--header  -->
<div style="padding-left:345px;">
<header class="container">
    <h1 style="font-size:30px;">목표설정</h1>
    <ul class="breadcrumb" >
      <li>마이페이지</li>
      <li>목표설정</li>
    </ul>
</header>
</div> 

<!-- 사이드 네비 메뉴 -->
<%@include file="/WEB-INF/views/mypage/navi.jsp" %>

<form action="<%=request.getContextPath() %>/mypage/setgoal" method="post" style="padding-left: 74px;">
<!-- 이미지 -->

<!--  <h2 style="margin-left:600;" >css Portfolio Gallery</h2>-->
  <label for="select-all" class="label-all" style="margin-left:586;">
    All
  </label>
<input type="radio" id="select-animals" name="button" class="image-input">
  <label for="select-animals" class="label-animals">
    전신운동
  </label>
<input type="radio" id="select-lightning" name="button"  class="image-input">
  <label for="select-lightning" class="label-lightning">
    상체운동
  </label>
<input type="radio" id="select-desert" name="button"  class="image-input">
  <label for="select-desert" class="label-desert">
    하체운동
  </label>
  

   <!-- 저장 버튼 -->

   <c:choose>
      <c:when test="${empty mygoal}">
         <div style="display:inline-block; padding-left:171px;">
         <button id="btnSubmit01" class="button raised green center" style="width:77; height:35; line-height:35px; text-align:center;">목표적용</button>
         </div>
      </c:when>
      <c:otherwise>
         <div style="display:inline-block; padding-left:171px;">
         <button id="btnSubmit02" class="button raised green center" style="width:77; height:35; line-height:35px; text-align:center;">목표적용</button>
         </div>
      </c:otherwise>
   </c:choose>
   
  

<ul class="gallery" style="padding-left:600; padding-top:10; width:1250px;">
  <li  id="info" class="info animals-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/Plank.jpg" style="width: 200; height: 200;"/>
  </li>
  <li id="info" class="info  animals-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/Jumping-Jack.jpg" style="width:200; height: 200;"  />
  </li>
  <li id="info" class="info animals-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/Burpee(1).png"  style="width:200; height: 200;" />
  </li>
  <li id="info" class="info lightning-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/Leg-Raise.png"  style="width:200; height: 200;"  />
  </li>
  <li id="info" class="info lightning-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/Crunch.png"  style="width:200; height: 200;" />
  </li>
  <li id="info" class="info lightning-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/Push-Up.jpg"  style="width:200; height: 200;"  />
  </li>
  <li id="info" class="info desert-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/sidelunge.png"   style="width:200; height: 200;" />
  </li>
  <li id="info" class="info desert-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/Squat.png"  style="width:200; height: 200;"   />
  </li>
  <li id="info" class="info desert-item">
    <img src="<%=request.getContextPath()%>/resources/image/mypage/Lunge.jpg"  style="width:200; height: 200;" />
  </li>
</ul>

<!-- 다중선택 추가 -->
<!-- 새로운  멀티  font: normal 14px/100% "Andale Mono", AndaleMono, monospace;-->
 <dl class="dropdown2" style="margin-left:260;">
  <dt>
    <a href="#" class="a2" style="width:302;">
      <span class="hida2">운동선택</span>    
      <p class="multiSel2"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect2" >
            <ul id="fonttt">
                <li >
                    <input type="checkbox" name="exercise" value="plank" />플랭크</li>
                <li>
                    <input type="checkbox" name="exercise" value="jumpingjack" />점핑잭</li>
                <li>
                    <input type="checkbox" name="exercise" value="burpee" />버핏</li>
                <li>
                    <input type="checkbox" name="exercise" value="legraise" />레그레이즈</li>
                <li>
                    <input type="checkbox" name="exercise" value="crunch" />크런치</li>
                <li>
                    <input type="checkbox" name="exercise" value="pushup" />푸시업</li>
                <li>
                    <input type="checkbox" name="exercise" value="sidelunge" />사이드런지</li>
                <li>
                    <input type="checkbox" name="exercise" value="squat" />스쿼트</li>
                <li>
                    <input type="checkbox" name="exercise" value="lunge" />런지</li>
            </ul>
        </div>
    </dd>
  <button type="button" class="multi-button">목표 운동을 선택하세요</button> 
  
 </dl>
  

<!--다중선택  -->

<dl class="dropdown" style="margin-left:260;"> 
  
    <dt>
    <a href="#" style="width:302;">
      <span class="hida">요일선택</span>    
      <p class="multiSel"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect">
            <ul id="fonttt">
                <li>
                    <input type="checkbox" name="days" value="1" />일</li>
                <li>
                    <input type="checkbox" name="days" value="2" />월</li>
                <li>
                    <input type="checkbox" name="days" value="3" />화</li>
                <li>
                    <input type="checkbox" name="days" value="4" />수</li>
                <li>
                    <input type="checkbox" name="days" value="5" />목</li>
                <li>
                    <input type="checkbox" name="days" value="6" />금</li>
                <li>
                    <input type="checkbox" name="days" value="7" />토</li>
            </ul>
        </div>
    </dd>
<button type="button" class="multi-button">목표 요일을 선택하세요</button> 
</dl>


<!--단계선텍  -->

<dl class="dropdown3" style="margin-left:260;"> 
  
    <dt>
    <a href="#" style="width:302;" class="a3">
      <span class="hida3">단계선택</span>    
      <p class="multiSel3"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect3">
            <ul id="fonttt">
                <li>
                    <input type="checkbox" name="grade" value="1" />왕초보자</li>
                <li>
                    <input type="checkbox" name="grade" value="2" />초보자</li>
                <li>
                    <input type="checkbox" name="grade" value="3" />중급자</li>
                <li>
                    <input type="checkbox" name="grade" value="4" />고급자</li>
                <li>
                    <input type="checkbox" name="grade" value="5" />마스터</li>
            </ul>
        </div>
    </dd>
  <button type="button" class="multi-button">목표 단계를 선택 하세요</button>
</dl>
</form>
<!-- 저장 버튼 -->
<!-- <div style="display:inline-block;">
   <div class="button raised green center" style="width:77; height:35; line-height:35px; text-align:center;">목표적용</div> 
</div> -->


<!-- pop-up -->
   <div class="popup" role="alert">
     <div class="popup-container">
       <a href="#0" class="popup-close img-replace">Close</a>
       <div style="font-size: 1.5rem; line-height: 1.5;"></div>
     </div> 
   </div> 
<!-- pop up end -->

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
   
   
   /* 다중선택 */
  $(".dropdown dt a").on('click', function() {
  $(".dropdown dd ul").slideToggle('fast');
});

$(".dropdown dd ul li a").on('click', function() {
  $(".dropdown dd ul").hide();
});

function getSelectedValue(id) {
  return $("#" + id).find("dt a span.value").html();
}

$(document).bind('click', function(e) {
  var $clicked = $(e.target);
  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
});

$('.mutliSelect li').on('click', function() {
   var idx = $(this).index();
  var title = $(this).closest('.mutliSelect').find('li').eq(idx).text();
/*     title = $(this).val() + ","; */

  if ($(this).children().is(':checked')) {
    var html = '<span title="' + title + '">' + title + '</span>';
    $('.multiSel').append(html);
    $(".hida").hide();
  } else {
    $('span[title="' + title + '"]').remove();
    var ret = $(".hida");
    $('.dropdown dt a').append(ret);

  }
});   
   
   /*다중선택 2*/
      $(".dropdown2 dt a").on('click', function() {
        $(".dropdown2 dd ul").slideToggle('fast');
      });

      $(".dropdown2 dd ul li a").on('click', function() {
        $(".dropdown2 dd ul").hide();
      });

      function getSelectedValue(id) {
        return $("#" + id).find("dt a span.value").html();
      }

      $(document).bind('click', function(e) {
        var $clicked = $(e.target);
        if (!$clicked.parents().hasClass("dropdown2")) $(".dropdown2 dd ul").hide();
      });

      $('.mutliSelect2 li').on('click', function() {
      var idx = $(this).index();
      console.log(idx);
        var title = $(this).closest('.mutliSelect2').find('li').eq(idx).text();
/*           title = $(this).val() + ","; */
//      console.log($(this).closest('.mutliSelect2').find('li'));
//      console.log($(this).closest('.mutliSelect2').find('li').eq(idx));
//      console.log($(this).closest('.mutliSelect2').find('li').eq(idx).text());
//      console.log($(this).closest('.mutliSelect2').find('li').eq(idx).innerText());
//      console.log($(this).closest('.mutliSelect2').find('li')[idx]);
//      console.log($(this).closest('.mutliSelect2').find('li')[idx].text());
   
        if ($(this).children().is(':checked')) {
          var html = '<span title="' + title + '">' + title + '</span>';
          $('.multiSel2').append(html);
          $(".hida2").hide();
        } else {
          $('span[title="' + title + '"]').remove();
          var ret = $(".hida2");
          $('.dropdown2 dt a').append(ret);

        }
      });   
      
   /*단계선택*/   
   
   $(".dropdown3 dt a").on('click', function() {
        $(".dropdown3 dd ul").slideToggle('fast');
      });

      $(".dropdown3 dd ul li a").on('click', function() {
        $(".dropdown3 dd ul").hide();
      });

      function getSelectedValue(id) {
        return $("#" + id).find("dt a span.value").html();
      }

      $(document).bind('click', function(e) {
        var $clicked = $(e.target);
        if (!$clicked.parents().hasClass("dropdown3")) $(".dropdown3 dd ul").hide();
      });
   
      //운동단계 1개만 선택하도록 처리
      $('input[type="checkbox"][name="grade"]').click(function(){

         if($(this).prop('checked') && $('input[type="checkbox"][name="grade"]:checked').size()>1){
         $(this).prop('checked', false);
         alert('운동단계는 1개만 선택해주세요.');
         }
      });         
      
      $('.mutliSelect3 li').on('click', function() {
       var idx = $(this).index();
        var title = $(this).closest('.mutliSelect3').find('li').eq(idx).text();
        if($(this).children().is(':checked')) {
          var html = '<span title="' + title + '">' + title + '</span>';
          $('.multiSel3').append(html);
          $(".hida3").hide();
        } else {
          $('span[title="' + title + '"]').remove();
          var ret = $(".hida3");
          $('.dropdown3 dt a').append(ret);

        }
      });   
      
      
      /* 모달 */
      
 (function() {

  // Define our constructor 
  this.Modal = function() {

    // Create global element references
    this.closeButton = null;
    this.modal = null;
    this.overlay = null;

    // Determine proper prefix
    this.transitionEnd = transitionSelect();

    // Define option defaults 
    var defaults = {
      autoOpen: false,
      className: 'fade-and-drop',
      closeButton: true,
      content: "",
      maxWidth: 600,
      minWidth: 280,
      overlay: true
    }

    // Create options by extending defaults with the passed in arugments
    if (arguments[0] && typeof arguments[0] === "object") {
      this.options = extendDefaults(defaults, arguments[0]);
    }

    if(this.options.autoOpen === true) this.open();

  }

  // Public Methods

  Modal.prototype.close = function() {
    var _ = this;
    this.modal.className = this.modal.className.replace(" scotch-open", "");
    this.overlay.className = this.overlay.className.replace(" scotch-open",
      "");
    this.modal.addEventListener(this.transitionEnd, function() {
      _.modal.parentNode.removeChild(_.modal);
    });
    this.overlay.addEventListener(this.transitionEnd, function() {
      if(_.overlay.parentNode) _.overlay.parentNode.removeChild(_.overlay);
    });
  }

  Modal.prototype.open = function() {
    buildOut.call(this);
    initializeEvents.call(this);
    window.getComputedStyle(this.modal).height;
    this.modal.className = this.modal.className +
      (this.modal.offsetHeight > window.innerHeight ?
        " scotch-open scotch-anchored" : " scotch-open");
    this.overlay.className = this.overlay.className + " scotch-open";
  }

  // Private Methods

  function buildOut() {

    var content, contentHolder, docFrag;

    /*
     * If content is an HTML string, append the HTML string.
     * If content is a domNode, append its content.
     */

    if (typeof this.options.content === "string") {
      content = this.options.content;
    } else {
      content = this.options.content.innerHTML;
    }

    // Create a DocumentFragment to build with
    docFrag = document.createDocumentFragment();

    // Create modal element
    this.modal = document.createElement("div");
    this.modal.className = "scotch-modal " + this.options.className;
    this.modal.style.minWidth = this.options.minWidth + "px";
    this.modal.style.maxWidth = this.options.maxWidth + "px";

    // If closeButton option is true, add a close button
    if (this.options.closeButton === true) {
      this.closeButton = document.createElement("button");
      this.closeButton.className = "scotch-close close-button";
      this.closeButton.innerHTML = "&times;";
      this.modal.appendChild(this.closeButton);
    }

    // If overlay is true, add one
    if (this.options.overlay === true) {
      this.overlay = document.createElement("div");
      this.overlay.className = "scotch-overlay " + this.options.className;
      docFrag.appendChild(this.overlay);
    }

    // Create content area and append to modal
    contentHolder = document.createElement("div");
    contentHolder.className = "scotch-content";
    contentHolder.innerHTML = content;
    this.modal.appendChild(contentHolder);

    // Append modal to DocumentFragment
    docFrag.appendChild(this.modal);

    // Append DocumentFragment to body
    document.body.appendChild(docFrag);

  }

  function extendDefaults(source, properties) {
    var property;
    for (property in properties) {
      if (properties.hasOwnProperty(property)) {
        source[property] = properties[property];
      }
    }
    return source;
  }

  function initializeEvents() {

    if (this.closeButton) {
      this.closeButton.addEventListener('click', this.close.bind(this));
    }

    if (this.overlay) {
      this.overlay.addEventListener('click', this.close.bind(this));
    }

  }

  function transitionSelect() {
    var el = document.createElement("div");
    if (el.style.WebkitTransition) return "webkitTransitionEnd";
    if (el.style.OTransition) return "oTransitionEnd";
    return 'transitionend';
  }

}());
      
      

 /*pop-up-1 */
   
 
    jQuery(document).ready(function($){
       var idx = null;
       $('ul.gallery li').on('click', function(event){
          idx = $(this).index()+1;
          //open popup
           event.preventDefault();
           $('.popup').addClass('is-visible');
          if(idx==1)   $('.popup-container div').html(desc1);
          if(idx==2)   $('.popup-container div').html(desc2);
          if(idx==3)   $('.popup-container div').html(desc3);
          if(idx==4)   $('.popup-container div').html(desc4);
          if(idx==5)   $('.popup-container div').html(desc5);
          if(idx==6)   $('.popup-container div').html(desc6);
          if(idx==7)   $('.popup-container div').html(desc7);
          if(idx==8)   $('.popup-container div').html(desc8);
          if(idx==9)   $('.popup-container div').html(desc9);
       });
       $('.popup').on('click', function(event){
           //close popup
           if( $(event.target).is('.popup-close') || $(event.target).is('.popup') ) {
             event.preventDefault();
             $(this).removeClass('is-visible');
           }
       });
        //close popup when clicking the esc keyboard button
        $(document).keyup(function(event){
          if(event.which=='27'){
            $('.popup').removeClass('is-visible');
          }
        });
    });
   
   var desc1 = "<div><h2>플랭크</h2><br><p>1. 견갑골(날개뼈)과 쇄골은 전체적으로 뒤로 밀리지 않도록 단단히 고정시켜준다.</p><p>2. 어깨는 방향이 지면과 수직을 이루도록 한다.</p><p>3. 허리는 일직선을 만들고 고개도 들지 않는다.</p><p>4. 엉덩이는 허리가 아래쪽으로 처지지 않도록 지속적으로 엉덩이 근육을 수축시키면서 긴장 상태를 유지해야 한다. 그래서 머리부터 발끝까지 일직선을 유지해야 한다.</p><p>5. 허벅지는 안쪽을 강하게 조여 내전근의 긴장을 유도한다.</p><p>6. 발끝은 가지런히 모아주며 발뒤꿈치도 붙인다.</p></div>";
   var desc2 = "<div><h2>점핑잭</h2><br><p>1. 차렷 자세를 취합니다.</p><p>2. 두 팔을 양옆으로 올리면서 두 발을 점프해서 벌립니다.</p><p>3. 다시 차렷 자세로 돌아갑니다.</p><p>4. 두 발을 점프해서 더 넓게 벌리면서 두 손은 머리 위로 올려 박수를 칩니다.</p><p>5. 다시 차렷 자세로 돌아갑니다.</p><p>6. ‘하나둘, 하나둘’ 박자에 맞춰 리듬감 있게 이 동작들을 반복합니다.</p></div>";
   var desc3 = "<div><h2>버핏</h2><br><p>1. 차렷 자세를 취합니다.</p><p>2. 무릎을 굽혀 바닥에 손을 집고 상체를 숙여줍니다.</p><p>3. 다리를 뒤쪽으로 길게 뻗어 푸쉬업 자세를 만듭니다.</p><p>4. 다리를 가슴쪽으로 다시 당깁니다.</p><p>5. 차렷자세 또는 점프 후  이 동작들을 반복합니다.</p></div>";
   var desc4 = "<div><h2>레그레이즈</h2><br><p>1. 누워서 위와같이 몸통과 다리가 직각이 되도록 자세를 취합니다.</p><p>2. 다리를 들어올렸다면 숨을 들이마셔 복부에 공기를 채운다는 느낌으로 배에 힘을 줍니다.</p><p>3. 배에 힘을 주었다면, 호흡을 참고 다리를 내립니다.</p><p>4. 다리를 내린 다음 다시 몸통과 같이 직각이 되도록 다리를 들어올립니다. 이 때 다리를 들어올리면서 숨을 천천히 뱉고, 다리를 다시 뻗어올렸다면 복부에 공기를 채운다는 느낌으로 배에 힘을 줍니다.</p></div>";
   var desc5 = "<div><h2>크런치</h2><br><p>1. 손은 머리 뒤로 가져간상태에서 천장을 보고 눕는다.</p><p>2. 바닥에서 어깨가 살짝 떨어질 정도로만 상체를 일으켜 세우면서 호흡을 내쉰다.</p></div>";
   var desc6 = "<div><h2>푸쉬업</h2><br><p>1. 팔을 어깨보다 살짝 넓게 벌려 바닥을 짚는다.</p><p>2. 머리부터 발끝까지 일자를 유지한 채 가슴에 바닥이 닿을 정도로 내려갔다 올라온다.</p><p>3. 복근을 포함한 코어 의 긴장감을 유지한다.</p></div>";
   var desc7 = "<div><h2>사이드런지</h2><br><p>1. 엎드려뻗쳐 상태에서 상체는 지면과 평행하게 유지합니다.</p><p>2. 다리는 곧게 뻗어서 바닥을 디디고, 발은 골반 넓이 정도로 벌려줍니다.</p><p>3. 양 무릎을 리듬감있게 번갈아 가면서 가슴 앞으로 당겨 올려 바닥을 디딥니다.</p></div>";
   var desc8 = "<div><h2>스쿼트</h2><br><p>1. 발 각도는 대략 120도 정도로 고정시킵니다.</p><p>2. 견갑골을 고정시켜 가슴을 폅니다.</p><p>3. 엉덩이부터 천천히 내빼면서 서서히 내려갔다가 무릎까지 90도를 만든 다음에 올라옵니다.</p></div>";
   var desc9 = "<div><h2>런지</h2><br><p>1. 골반너비로 두 발을 벌리고 허리에 손을 대고 바로 서줍니다.</p><p>2. 한쪽 발을 70~100cm 가량 앞으로 벌려 내밀고, 왼발의 뒤꿈치를 세워줍니다.(이 때 시선은 앞을 보도록 해야합니다.)</p><p>3. 허리와 등을 똑바로 편 채로 오른편 무릎을 90도로 구부리고 반대편 무릎은 바닥에 닿는 느낌으로 몸을 내려줍니다.</p></div>";


   $('#btnSubmit01').on('click', function(){
      console.log('시작');
      if($('input[type="checkbox"][name="exercise"]:checked').size() == 0){
         alert('목표 운동을 선택해 주세요');
         return false;
      }else if($('input[type="checkbox"][name="days"]:checked').size() == 0){
         alert('목표 요일을 선택해 주세요');
         return false;
      }else if($('input[type="checkbox"][name="grade"]:checked').size() == 0){
         alert('목표 단계를 선택해 주세요');
         return false;
      }
      alert('나의 운동 목표가 설정되었습니다!');	
   });
   $('#btnSubmit02').on('click', function(){
      console.log('시작');
      if($('input[type="checkbox"][name="exercise"]:checked').size() == 0){
         alert('목표 운동을 선택해 주세요');
         return false;
      }else if($('input[type="checkbox"][name="days"]:checked').size() == 0){
         alert('목표 요일을 선택해 주세요');
         return false;
      }else if($('input[type="checkbox"][name="grade"]:checked').size() == 0){
         alert('목표 단계를 선택해 주세요');
         return false;
      }
      alert('나의 운동 목표가 변경되었습니다!');
   });
   
   
   
</script>
</body>
</html>