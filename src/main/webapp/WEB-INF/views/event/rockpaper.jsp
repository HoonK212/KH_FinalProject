<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event_rockpaper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<style type="text/css">
/* 	  body { */
/*     	background: #e2e8f0; */
/*   	} */
/*     *:hover { */
/*       transition: all 150ms ease-in; */
/*     } */
</style>
<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp" %>

<div id="eventcontent">
	
	<div style=" font-size: 30px;" id="eventname">
		<span class="font-extrabold text-black-700"> 
		<img src="<%=request.getContextPath() %>/resources/image/event/2.png" width="40px;" style="display: inline-block;">
		 가위 바위 보
		</span>
	</div>

  
	<div class="antialiased max-w-6xl mx-auto bg-gray-300">
		<div class="relative block md:flex items-center">
      	<div class="w-full md:w-1/2 relative z-1 bg-gray-100 rounded shadow-lg overflow-hidden">
        	<div class="text-lg font-medium text-green-500 uppercase  text-center border-b border-gray-200 tracking-wide">AI</div>
        	<div class="block sm:flex md:block lg:flex items-center justify-center" id="cam">
        			AI 화면
        	</div>
        <div class="flex justify-center">
          <ul>
            <li class="flex items-center">
              <div class="bg-green-200 rounded-full p-2 fill-current text-green-700">
                <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="icon-umbrella"><path class="primary" d="M11 3.05V2a1 1 0 0 1 2 0v1.05A10 10 0 0 1 22 13c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a10 10 0 0 1 9-9.95z"/><path class="secondary" d="M11 14a1 1 0 0 1 2 0v5a3 3 0 0 1-6 0 1 1 0 0 1 2 0 1 1 0 0 0 2 0v-5z"/></svg>
              </div>
              <span class="text-gray-700 text-lg ml-3">No setup, monthly, or hidden fees</span>
            </li>
            <li class="flex items-center">
              <div class="bg-green-200 rounded-full p-2 fill-current text-green-700">
                <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="icon-shopping-bag"><path class="primary" d="M5 8h14a1 1 0 0 1 1 .92l1 12A1 1 0 0 1 20 22H4a1 1 0 0 1-1-1.08l1-12A1 1 0 0 1 5 8z"/><path class="secondary" d="M9 10a1 1 0 0 1-2 0V7a5 5 0 1 1 10 0v3a1 1 0 0 1-2 0V7a3 3 0 0 0-6 0v3z"/></svg>
              </div>
              <span class="text-gray-700 text-lg ml-3">Pay only for what you use</span>
            </li>
            <li class="flex items-center ">
              <div class="bg-green-200 rounded-full p-2 fill-current text-green-700">
                <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="icon-pie-chart"><path class="primary" d="M14 13h6.78a1 1 0 0 1 .97 1.22A10 10 0 1 1 9.78 2.25a1 1 0 0 1 1.22.97V10a3 3 0 0 0 3 3z"/><path class="secondary" d="M20.78 11H14a1 1 0 0 1-1-1V3.22a1 1 0 0 1 1.22-.97c3.74.85 6.68 3.79 7.53 7.53a1 1 0 0 1-.97 1.22z"/></svg>
              </div>
              <span class="text-gray-700 text-lg ml-3">Real-time fee reporting</span>
            </li>
          </ul>
        </div>
        <a class="block flex items-center justify-center bg-gray-200 hover:bg-gray-300 text-md font-semibold text-gray-800 uppercase " href="#">
          <span>Create account</span>
          <span class="font-medium text-gray-700 ml-2">➔</span>
        </a>
      </div>
     
     <div class="w-full md:w-1/2 relative z-1 bg-gray-100 rounded shadow-lg overflow-hidden">
        	<div class="text-lg font-medium text-green-500 uppercase  text-center border-b border-gray-200 tracking-wide">도전 상대</div>
        	<div class="block sm:flex md:block lg:flex items-center justify-center" id="cam">
        			나의 화면
        	</div>
        <div class="flex justify-center">
          <ul>
            <li class="flex items-center">
              <div class="bg-green-200 rounded-full p-2 fill-current text-green-700">
                <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path class="primary" d="M11 3.05V2a1 1 0 0 1 2 0v1.05A10 10 0 0 1 22 13c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a10 10 0 0 1 9-9.95z"></path><path class="secondary" d="M11 14a1 1 0 0 1 2 0v5a3 3 0 0 1-6 0 1 1 0 0 1 2 0 1 1 0 0 0 2 0v-5z"></path></svg>
              </div>
              <span class="text-gray-700 text-lg ml-3">No setup, monthly, or hidden fees</span>
            </li>
            <li class="flex items-center">
              <div class="bg-green-200 rounded-full p-2 fill-current text-green-700">
                <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path class="primary" d="M5 8h14a1 1 0 0 1 1 .92l1 12A1 1 0 0 1 20 22H4a1 1 0 0 1-1-1.08l1-12A1 1 0 0 1 5 8z"></path><path class="secondary" d="M9 10a1 1 0 0 1-2 0V7a5 5 0 1 1 10 0v3a1 1 0 0 1-2 0V7a3 3 0 0 0-6 0v3z"></path></svg>
              </div>
              <span class="text-gray-700 text-lg ml-3">Pay only for what you use</span>
            </li>
            <li class="flex items-center ">
              <div class="bg-green-200 rounded-full p-2 fill-current text-green-700">
                <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path class="primary" d="M14 13h6.78a1 1 0 0 1 .97 1.22A10 10 0 1 1 9.78 2.25a1 1 0 0 1 1.22.97V10a3 3 0 0 0 3 3z"></path><path class="secondary" d="M20.78 11H14a1 1 0 0 1-1-1V3.22a1 1 0 0 1 1.22-.97c3.74.85 6.68 3.79 7.53 7.53a1 1 0 0 1-.97 1.22z"></path></svg>
              </div>
              <span class="text-gray-700 text-lg ml-3">Real-time fee reporting</span>
            </li>
          </ul>
        </div>
        <a class="block flex items-center justify-center bg-gray-200 hover:bg-gray-300 text-md font-semibold text-gray-800 uppercase " href="#">
          <span>Create account</span>
          <span class="font-medium text-gray-700 ml-2">➔</span>
        </a>
      </div>
     
     
    </div>
      
    
  </div>

      	<div>
	    <button class='relative bg-blue-500 text-white p-6 rounded text-2xl font-bold overflow-hidden'>
	     	 대결!
      		<div class="ribbon bg-red-500 text-sm whitespace-no-wrap px-4">fight</div>
	  	</button>
	  	</div>



</div>




</section>
<%@include file="../layout/footer.jsp" %>
