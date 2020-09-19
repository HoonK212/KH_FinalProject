<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
body {background-color:#eee}
#contents {
  position: relative;
  transition: .3s;
  margin-left: 290px;
  background-color: #2a2b3d;
}
.margin {
  margin-left: 0 !important;
}
/* Start side navigation bar  */

.side-nav {
  float: left;
  height: 100%;
  width: 290px;
  background-color: #252636;
  color: #CCC;
  -webkit-transform: translateX(0);
  -moz-transform: translateX(0);
  transform: translateX(0);
  -webkit-transition: all .3s ease-in-out;
  -moz-transition: all .3s ease-in-out;
  transition: .3s;
  position: fixed;
  top: 0;
  left: 0;
  overflow: auto;
  z-index: 9999999
}
.side-nav .close-aside {
  position: absolute;
  top: 7px;
  right: 7px;
  cursor: pointer;
  color: #EEE;
}
.side-nav .heading {
  background-color: #252636;
  padding: 15px 15px 15px 30px;
  overflow: hidden;
  border-bottom: 1px solid #2a2b3c
}
.side-nav .heading > img {
  border-radius: 50%;
  float: left;
  width: 28%;
}
.side-nav .info {
  float: left;
  width: 69%;
  margin-left: 3%;
}
.side-nav .heading .info > h3 {margin: 0 0 5px}
.side-nav .heading .info > h3 > a {
  color: #EEE;
  font-weight: 100;
  margin-top: 4px;
  display: block;
  text-decoration: none;
  font-size: 18px;
}
.side-nav .heading .info > h3 > a:hover {
  color: #FFF;
}
.side-nav .heading .info > p {
  color: #BBB;
  font-size: 13px;
}
/* End heading */
/* Start search */
.side-nav .search {
  text-align: center;
  padding: 15px 30px;
  margin: 15px 0;
  position: relative;
}
.side-nav .search > input {
  width: 100%;
  background-color: transparent;
  border: none;
  border-bottom: 1px solid #23262d;
  padding: 7px 0 7px;
  color: #DDD
}
.side-nav .search > input ~ i {
  position: absolute;
  top: 22px;
  right: 40px;
  display: block;
  color: #2b2f3a;
  font-size: 19px;
}
/* End search */

.side-nav .categories > li {
  padding: 17px 40px 17px 30px;
  overflow: hidden;
  border-bottom: 1px solid rgba(255, 255, 255, 0.02);
  cursor: pointer;
}
.side-nav .categories > li > a {
  color: #AAA;
  text-decoration: none;
}
/* Start num: there are three options primary, danger and success like Bootstrap */
.side-nav .categories > li > a > .num {
  line-height: 0;
  border-radius: 3px;
  font-size: 14px;
  color: #FFF;
  padding: 0px 5px
}
.dang {background-color: #f35959}
.prim {background-color: #0275d8}
.succ {background-color: #5cb85c}
/* End num */
.side-nav .categories > li > a:hover {
  color: #FFF
}
.side-nav .categories > li > i {
  font-size: 18px;
  margin-right: 5px
}
/*.side-nav .categories > li > a:after {
  content: "\f053";
  font-family: fontAwesome;
  font-size: 11px;
  line-height: 1.8;
  float: right;
  color: #AAA;
  -webkit-transition: all .3s ease-in-out;
  -moz-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
}*/
.side-nav .categories .opend > a:after {
  -webkit-transform: rotate(-90deg);
  -moz-transform: rotate(-90deg);
  transform: rotate(-90deg);
}
/* End categories */
/* Start dropdown menu */
.side-nav .categories .side-nav-dropdown {
  padding-top: 10px;
  padding-left: 30px;
  list-style: none;
  display: none;
}
.side-nav .categories .side-nav-dropdown > li > a {
  color: #AAA;
  text-decoration: none;
  padding: 7px 0;
  display: block;
}
.side-nav .categories p {
  margin-left: 30px;
  color: #535465;
  margin-top: 10px;
}

/* End dropdown menu */

.show-side-nav {
  -webkit-transform: translateX(-290px);
  -moz-transform: translateX(-290px);
  transform: translateX(-290px);
}




/* End side navigation bar  */
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

/* Start bootstrap */
.navbar-right .dropdown-menu {
  right: auto !important;
  left: 0 !important;
}
.navbar-default {
  background-color: #6f6486 !important;
  border: none !important;
  border-radius: 0 !important;
  margin: 0 !important
}
.navbar-default .navbar-nav>li>a {
  color: #EEE !important;
  line-height: 55px !important;
  padding: 0 10px !important;
}
.navbar-default .navbar-brand {color:#FFF !important}
.navbar-default .navbar-nav>li>a:focus,
.navbar-default .navbar-nav>li>a:hover {color: #EEE !important}

.navbar-default .navbar-nav>.open>a,
.navbar-default .navbar-nav>.open>a:focus,
.navbar-default .navbar-nav>.open>a:hover {background-color: transparent !important; color: #FFF !important}

.navbar-default .navbar-brand {line-height: 55px !important; padding: 0 !important}
.navbar-default .navbar-brand:focus,
.navbar-default .navbar-brand:hover {color: #FFF !important}
.navbar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {margin: 0 !important}


.navbar-default .navbar-nav>li>a {
  float: left !important;
}
.navbar-default .navbar-nav>li>a>span:not(.caret) {
  background-color: #e74c3c !important;
  border-radius: 50% !important;
  height: 25px !important;
  width: 25px !important;
  padding: 2px !important;
  font-size: 11px !important;
  position: relative !important;
  top: -10px !important;
  right: 5px !important
}
.dropdown-menu>li>a {
  padding-top: 5px !important;
  padding-right: 5px !important;
}
.navbar-default .navbar-nav>li>a>i {
  font-size: 18px !important;
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


/*table*/
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
  width: 2%;
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
    
</style>
</head>
<body>

<!-- 사이드 네비 메뉴 -->
<%@include file="/WEB-INF/views/mypage/navi.jsp" %>

<!-- HEADER -->
<div style="padding-left:300px; padding-bottom:20px; padding-top:20px;">
<header class="container">
    <h1>내가 쓴 글</h1>
    <ul class="breadcrumb">
      <li>마이페이지</li>
      <li>댓글</li>
    </ul>
</header>
</div>


<div style="padding-left:400px; padding-bottom:10px; display:inline-block;"><span><a href="<%=request.getContextPath()%>/mypage/myWritten">게시글</a></span> | <span><a href="<%=request.getContextPath()%>/mypage/myComment">댓글</a></span></div>
<div class="my-table" style="width:90%; padding-left:400px;">
<table class="table table-action"  style="table-layout:fixed;">
  
  <thead>
    <tr>
      <th class="t-small"><input type="checkbox" id="checkAll"  onclick="checkAll();"></th>
      <th class="t-small" style="text-align:center;">번호</th>
      <th class="t-medium">내용</th>
      <th class="t-small">작성일</th>
      <th class="t-small">아이디</th>
    </tr>
  </thead>
  
  <tbody>
  <c:forEach var="comment" items="${comment}">
    <tr>
      <td><label><input type="checkbox" name="chk" id="chk" value="${comment.no}"></label></td>
      <td style="width:10%; text-align:center;">${comment.no}</td>
      <td style="width:40%; text-overflow:ellipsis; overflow:hidden; white-space: nowrap;">${comment.content}</td>
      <td>${comment.dates}</td>
      <td class="t-status t-active">${comment.id}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</div>

<!-- delete button -->

          <div class="button raised green" style="width:5%; margin-left:1300px;" onclick="checkboxArr();">
               <div class="center">삭제</div>
          </div>
          
<!-- 페이징 -->
   <div
                        class="px-5 py-5 flex flex-col xs:flex-row items-center xs:justify-between          ">
                        <div class="inline-flex mt-2 xs:mt-0" style="padding-left:190px;">
                     <div class="flex flex-col items-center">
                         <div class="flex text-gray-700 pb-3">
                             <c:choose>
                                <c:when test="${paging.blockStart > 1 }">
                                    <a href="<%= request.getContextPath() %>/mypage/myWritten?cPage=${paging.blockStart-1}" class="nav prev">
                                    <div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
                                          <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left w-4 h-4">
                                              <polyline points="15 18 9 12 15 6"></polyline>
                                          </wsvg>
                                      </div>
                                 </a>
                                </c:when>
                                <c:otherwise>
                                   <a href="<%= request.getContextPath() %>/mypage/myWritten?cPage=${paging.blockStart}" class="nav prev">
                                    <div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
                                          <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left w-4 h-4">
                                              <polyline points="15 18 9 12 15 6"></polyline>
                                          </svg>
                                      </div>
                                 </a>
                                </c:otherwise>
                             </c:choose>
                             <div class="flex h-8 font-medium ">
                                 <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
                                 <a href="<%= request.getContextPath() %>/mypage/myWritten?cPage=${page }">
                                    <c:choose>
                                     <c:when test="${paging.currentPage eq page }">
                                      <div class="w-8 md:flex justify-center items-center hidden cursor-pointer leading-5 transition duration-150 ease-in border-t-2 border-orange-600">${page}</div>
                                     </c:when>
                                     <c:otherwise>
                                      <div class="w-8 md:flex justify-center items-center hidden cursor-pointer leading-5 transition duration-150 ease-in border-t-2 border-transparent">${page}</div>
                                     </c:otherwise>
                                    </c:choose>
                                   </a>
                                </c:forEach>
                             </div>
                           <c:choose>
                                <c:when test="${paging.blockEnd+1 > paging.lastPage }">
                                    <a href="<%= request.getContextPath() %>/mypage/myWritten?cPage=${paging.blockEnd}">
                                      <div class="h-8 w-8 ml-1 flex justify-center items-center  cursor-pointer">
                                          <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right w-4 h-4">
                                              <polyline points="9 18 15 12 9 6"></polyline>
                                          </svg>
                                      </div>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="<%= request.getContextPath() %>/mypage/myWritten?cPage=${paging.blockEnd+1}">
                                      <div class="h-8 w-8 ml-1 flex justify-center items-center  cursor-pointer">
                                          <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right w-4 h-4">
                                              <polyline points="9 18 15 12 9 6"></polyline>
                                          </svg>
                                      </div>
                                  </a>
                                </c:otherwise>
                                 </c:choose>
                         </div>
                        <span class="text-xs xs:text-sm text-gray-900">
                                  Showing ${paging.blockStart } to ${paging.blockEnd } of ${paging.lastPage }
                              </span>
                     </div>
                      </div>
                   </div>   
         <!-- 페이징 end -->



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
   
   
   /* stage-select------------------- */
      button = document.querySelector('button');
   datalist = document.querySelector('datalist');
   select = document.querySelector('select');
   options = select.options;

   /* on arrow button click, show/hide the DDL*/
   button.addEventListener('click', toggle_ddl);

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

   /* when user selects an option from DDL, write it to text field */
   select.addEventListener('change', fill_input);

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
   
   
   //체크박스 전체 선택하기, 선택 해제하기ㅏ 
   function checkAll(){
         if( $("#checkAll").is(':checked') ){
           $("input[name=chk]").prop("checked", true);
         }else{
           $("input[name=chk]").prop("checked", false);
         }
   }
   
   

   //선택된 체크박스의 값을 삭제 
   function checkboxArr() {
      
      //선택된 체크박스 값이 없는 경우 삭제가 되면 안된다 
      if($("input:checkbox[name='chk']").is(":checked") == false){
         alert('하나 이상의 글을 선택해주세요')
      }else{
         
          var checkArr = [];     // 배열 초기화
          $("input[name='chk']:checked").each(function(i){
              checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
          })
          
          
       
          $.ajax({
              url: '<%= request.getContextPath() %>/mypage/deleteComment '
              , type: 'post'
              , dataType: 'text'
              , data: {
                  valueArrTest: checkArr
              }
              ,success : function(){
                 location.href = '<%= request.getContextPath()%>/mypage/myComment'
              }
              
          });
      } 
   }
      

</script>
</body>
</html>