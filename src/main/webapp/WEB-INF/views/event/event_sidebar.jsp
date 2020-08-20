<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<div id="sectionbody">


		<div id="sidebar">
			<div class="bg-red-200">
		    <div class="flex flex-col sm:flex-row sm:justify-around">
			        <div class="w-64 bg-white h-full">
			            <div class="flex items-center justify-center mt-10">
			               <div class="flex-shrink-0 px-8 py-4 flex flex-row items-center justify-between">
				      <a href="#" class="text-lg font-semibold tracking-widest text-gray-900 uppercase rounded-lg dark-mode:text-white focus:outline-none focus:shadow-outline">Event</a>
				      <button class="rounded-lg md:hidden rounded-lg focus:outline-none focus:shadow-outline" @click="open = !open">
				        <svg fill="currentColor" viewBox="0 0 20 20" class="w-6 h-6">
				          <path x-show="!open" fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM9 15a1 1 0 011-1h6a1 1 0 110 2h-6a1 1 0 01-1-1z" clip-rule="evenodd"></path>
				          <path x-show="open" fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" style="display: none;"></path>
				        </svg>
				      </button>
				    </div>
		            </div>
		
		            <nav class="mt-10">
		                <a class="flex items-center py-2 px-8 bg-black-200 text-gray-700 border-r-4 border-red-700" href="#">
		                    <img src="<%=request.getContextPath() %>/resources/image/event/1.png" width="20px;">
		
		                    <span class="mx-4 font-medium">출석 이벤트</span>
		                </a>
		
		                <a class="flex items-center mt-5 py-2 px-8 text-gray-600 border-r-4 border-white hover:bg-gray-200 hover:text-gray-700 hover:border-gray-700" href="#">
							<img src="<%=request.getContextPath() %>/resources/image/event/2.png" width="20px;">
		
		                    <span class="mx-4 font-medium">가위바위보</span>
		                </a>
		
		                <a class="flex items-center mt-5 py-2 px-8 text-gray-600 border-r-4 border-white hover:bg-gray-200 hover:text-gray-700 hover:border-gray-700" href="#">
							<img src="<%=request.getContextPath() %>/resources/image/event/3.png" width="20px;">
		                    <span class="mx-4 font-medium">룰렛돌리기</span>
		                </a>
		
		                <a class="flex items-center mt-5 py-2 px-8 text-gray-600 border-r-4 border-white hover:bg-gray-200 hover:text-gray-700 hover:border-gray-700" href="#">
							<img src="<%=request.getContextPath() %>/resources/image/event/4.png" width="20px;">
		                    <span class="mx-4 font-medium">초성퀴즈</span>
		                </a>
		                
		                <a class="flex items-center mt-5 py-2 px-8 text-gray-600 border-r-5 border-white hover:bg-gray-200 hover:text-gray-700 hover:border-gray-700" href="#">
							<img src="<%=request.getContextPath() %>/resources/image/event/5.png" width="20px;">
		                    <span class="mx-4 font-medium">신기록 랭킹</span>
		                </a>
		                
		            </nav>
		
		        </div>
				
				    </div>
				</div>
		
		</div><!-- sidebar -->