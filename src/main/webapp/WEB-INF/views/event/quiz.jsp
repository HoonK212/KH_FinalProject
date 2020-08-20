<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event_quiz.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp" %>

<div id="eventcontent">
	
	<div style=" font-size: 30px;" id="eventname">
		<span class="font-extrabold text-black-700"> 
		<img src="<%=request.getContextPath() %>/resources/image/event/4.png" width="40px;" style="display: inline-block;">
		 초성 퀴즈
		</span>
	</div>
	
	<div id="quizquiz">
		<svg class="z-0 absolute" xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="0 0 600 600">
	  	<g transform="translate(300,300)">
	    	<path d="M108.7,-102.8C139.7,-47.8,163,-2.6,157.3,41.4C151.6,85.4,117,128.3,71.9,150.5C26.8,172.7,-28.9,174.2,-85.4,155.4C-141.9,136.6,-199.1,97.6,-217.2,42.6C-235.3,-12.3,-214.2,-83.2,-171.5,-140.9C-128.7,-198.7,-64.4,-243.3,-12.8,-233.2C38.8,-223,77.7,-157.9,108.7,-102.8Z" fill="#7adcb58c"/>
	  	</g>
		</svg>
		
		<div class="flex flex-row rounded">
	  		<div class="relative z-2 max-w-sm rounded overflow-hidden shadow-lg">
	   		<div class="px-6 py-4">
	    	<div class="relative text-teal-900 font-bold text-xl mb-2">주제 설명</div>
	    	<p class="text-gray-700 text-base z-234 ">
	      	설명 설명 설명 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatibus quia, nulla! Maiores et perferendis eaque, exercitationem praesentium nihil.
	    	</p>
		<div class="text-teal-900 font-bold text-xl mt-2 mb-2">데일리홈트</div>
	   		<div class=" flex flex-wrap  justify-">
	  	 <div class="rounded w-auto flex-1 text-gray-700 text-center bg-teal-400 hover:bg-teal-600 px-4 py-2 m-2">ㄷ</div>
	 	 <div class="rounded w-auto flex-1 text-gray-700 text-center bg-teal-400 hover:bg-teal-600 px-4 py-2 m-2">ㅇ</div>
	 	 <div class="rounded w-auto flex-1 text-gray-700 text-center bg-teal-400 hover:bg-teal-600 px-4 py-2 m-2">ㄹ</div>
	 	 <div class="rounded w-auto flex-1 text-gray-700 text-center bg-teal-400 hover:bg-teal-600 px-4 py-2 m-2">ㅎ</div>
	 	 <div class="rounded w-auto flex-1 text-gray-700 text-center bg-teal-400 hover:bg-teal-600 px-4 py-2 m-2">ㅌ</div>
		</div>
		
		
		
		
		
	
		<input class="shadow appearance-none border rounded py-2 px-3 text-grey-darker">
		<button>
		<span class="tracking-wider text-white bg-blue-500 px-4 py-1 text-sm rounded leading-loose mx-2 font-semibold" title="">
	  	<i class="fas fa-award" aria-hidden="true"></i> 정답
		</span>
		</button>
	</div>
	
  	
  	
	</div>
</div>
	
	
	
	

</div>

</div>

</section>
<%@include file="../layout/footer.jsp" %>