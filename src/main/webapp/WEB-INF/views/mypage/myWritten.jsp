<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
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
  max-width: 60%;
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
  width: 6%;
}
.table .t-medium {
  width: 10%;
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
<div style="padding-left:400px; padding-bottom:20px; padding-top:20px;">
<header class="container">
    <h1 style="font-size:30px; font-weight:bold;">내가 쓴 글</h1>
    <ul class="breadcrumb">
      <li>마이페이지</li>
      <li>게시글</li>
    </ul>
</header>
</div>

<div style="padding-left:400px; padding-bottom:10px; display:inline-block;"><span><a href="<%=request.getContextPath()%>/mypage/myWritten">게시글</a></span> | <span><a href="<%=request.getContextPath()%>/mypage/myComment">댓글</a></span></div>
<div class="my-table" style="width:132%; padding-left:400px;">
<table class="table table-action" style="table-layout:fixed;">
  
  <thead>
    <tr>
      <th class="t-small" style="text-align:center;" ><input type="checkbox" id="checkAll" onclick="checkAll();" ></th>
      <th class="t-small" style="text-align:center;">번호</th>
      <th class="t-medium" style="text-align:center;">제목</th>
      <th style="text-align:center;">내용</th>
      <th class="t-medium" style="text-align:center;">작성일</th>
      <th class="t-medium" style="text-align:center;">조회수</th>
    </tr>
  </thead>
  
  <tbody>
  <c:forEach var="board" items="${board}">
    <tr>
      <td style="text-align:center;"><label><input type="checkbox" name="chk" id="chk" value="${board.no}" ></label></td>
      <td style="width:7%; text-align:center;text-align:center;">${board.no}</td>
      <td style="width:40%;text-overflow:ellipsis; overflow:hidden; white-space: nowrap;">${board.title}</td>
      <td style="text-overflow:ellipsis; overflow:hidden; white-space: nowrap;">${board.content}</td>
      <td class="t-status t-active"style="text-align:center;">${board.dates}</td>
      <td class="t-status t-active"style="text-align:center;">${board.count}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</div>

<!-- delete button -->

          <div class="button raised green" style="width:5%; margin-left:1300px; cursor: pointer;" onclick="checkboxArr();">
               <div class="center" >삭제</div>
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
      };
   
       
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
         //선택된 체크박스 값이 없다면 값을 넘기지 않는다
         if($("input:checkbox[name='chk']").is(":checked") == false){
            alert('하나이상의 글을 선택해주세요')         
         }else{
             var checkArr = [];     // 배열 초기화
             $("input[name='chk']:checked").each(function(i){
                 checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
             })
          
             $.ajax({
                 url: '<%= request.getContextPath() %>/mypage/deleteWritten '
                 , type: 'post'
                 , dataType: 'text'
                 , data: {
                     valueArrTest: checkArr
                 }
                 ,success : function(){
                    location.href = '<%= request.getContextPath()%>/mypage/myWritten'
                 }
                 
             });
         }
      }//end

</script>
</body>
</html>