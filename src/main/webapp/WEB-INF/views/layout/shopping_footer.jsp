<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<footer>
	<div>
	   <div class="max-w-6xl m-auto text-gray-800 flex flex-wrap justify-center">
	      <div class="p-5 w-48 ">
	         <div class="text-xs uppercase text-gray-500 font-medium">SHOP</div>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/shopping/list?listno=1">이벤트 상품<span class="text-white text-xs p-1"></span></a>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/shopping/list?listno=2">인기 상품<span class="text-white text-xs p-1"></span></a>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/shopping/list?listno=3">신규 상품<span class="text-white text-xs p-1"></span></a>
	      </div>
	      <div class="p-5 w-48 ">
	         <div class="text-xs uppercase text-gray-500 font-medium">EXERCISE</div>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/exercise/type">운동하기<span class="text-white text-xs p-1"></span></a>
	      </div>
	      <div class="p-5 w-48 ">
	         <div class="text-xs uppercase text-gray-500 font-medium">EVENT</div>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/event/attend">출석이벤트<span class="text-white text-xs p-1"></span></a>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/event/rockpaper">가위바위보<span class="text-white text-xs p-1"></span></a>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/event/roulette">룰렛돌리기<span class="text-white text-xs p-1"></span></a> 
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/event/quiz">초성퀴즈<span class="text-white text-xs p-1"></span></a> 
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/event/record">신기록 랭킹<span class="text-white text-xs p-1"></span></a> 
	      </div>
	      <div class="p-5 w-48 ">
	         <div class="text-xs uppercase text-gray-500 font-medium">BOARD</div>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/board/list">게시판<span class="text-white text-xs p-1"></span></a>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/board/write">게시글쓰기<span class="text-white text-xs p-1"></span></a>
	      </div>
	      <div class="p-5 w-48 ">
	         <div class="text-xs uppercase text-gray-500 font-medium">MYPAGE</div>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/mypage/myMain">회원정보<span class="text-white text-xs p-1"></span></a>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/mypage/goalSetting">운동관리<span class="text-white text-xs p-1"></span></a>
	         <a class="my-3 text-white block" href="<%=request.getContextPath() %>/mypage/myMain">구매내역<span class="text-white text-xs p-1"></span></a> 
	      </div>
	      <div class="p-5 w-48 ">
	         <div class="text-xs uppercase text-gray-500 font-medium">Contact us</div>
	         <span class="my-3 text-white block">서울특별시 강남구 테헤란로10길 9<br>그랑프리 빌딩 4F</span> 
	      </div>
	   </div>
	</div>
	
	<div class="pt-2 ">
	   <div class="flex pb-5 px-3 m-auto pt-5 border-t text-gray-800 text-sm flex-col
	      md:flex-row max-w-6xl">
	      <div class="mt-2 text-white"><a href="<%=request.getContextPath()%>/">DHT</a> © Copyright 2020. All Rights Reserved.
	      
	   </div>
	</div>

</footer>
</div>
</body>
</html>