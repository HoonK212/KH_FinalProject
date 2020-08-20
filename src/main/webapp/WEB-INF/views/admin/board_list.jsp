<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<!-- HEAD -->
<%@include file="/WEB-INF/views/layout/admin_head.jsp" %>

<div class="admin-container">

<!-- HEADER -->
<%@include file="/WEB-INF/views/layout/admin_header.jsp" %>

<!-- SIDEBAR -->
<%@include file="/WEB-INF/views/layout/admin_sidebar.jsp" %>
	
<!-- SECTION  -->
<div class="lay-item">
	
	<!-- CONTENT -->
	<div class="section-container">
		
		<!-- 상단 제목 영역 -->
		<span class="font-semibold text-4xl">게시글목록</span>
		
		
		<!-- 상단 버튼 영역 -->
		<div class="flex justify-end">
				<div class="mr-3">
					<input type="date" /> - <input type="date" />
				</div>
			
				  <div class="mr-3">
				      <select id="select">
				          <option value="1">게시글번호</option>
				          <option value="2">작성자</option>
				          <option value="3">신고여부</option>
				      </select>
				  </div>
				  
	            <input type="text" class="mr-3" placeholder="입력하세요"/>
			    <button class='bg-gray-100 text-gray-800 py-2 px-3 rounded font-bold'>
			      조회하기
			  	</button>
		</div>
		
		
		
		
		
		<!-- 테이블 영역 -->
		  <div class="shadow overflow-hidden rounded border-b border-gray-200">
		    <table class="table-fixed bg-white w-full">
		      <thead class="bg-gray-800 text-white">
		        <tr>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">게시글번호</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">카테고리</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">게시글제목</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">작성자</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">조회수</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">댓글수</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">신고여부</th>
		        </tr>
		      </thead>
		    <tbody class="text-gray-700">
		      <tr>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1001</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">광고</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">역삼역 3번출구 헬스장 오픈</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">100</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">3</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">N</th>
		      </tr>
		      <tr class="bg-gray-100">
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1002</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">자유</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">런닝머신 5일차 후기</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1000</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">300</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">Y</th>
		      </tr>
		      <tr>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1003</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">광고</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">역삼역 3번출구 헬스장 오픈</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">100</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">3</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">N</th>
		      </tr>
		      <tr class="bg-gray-100">
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1004</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">자유</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">런닝머신 5일차 후기</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1000</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">300</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">Y</th>
		      </tr>
		      <tr>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1005</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">광고</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">역삼역 3번출구 헬스장 오픈</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">100</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">3</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">N</th>
		      </tr>
		      <tr class="bg-gray-100">
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1006</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">자유</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">런닝머신 5일차 후기</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1000</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">300</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">Y</th>
		      </tr>
		      <tr>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1007</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">광고</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">역삼역 3번출구 헬스장 오픈</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">100</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">3</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">N</th>
		      </tr>
		      <tr class="bg-gray-100">
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1008</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">자유</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">런닝머신 5일차 후기</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1000</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">300</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">Y</th>
		      </tr>
		      <tr>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1009</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">광고</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">역삼역 3번출구 헬스장 오픈</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">100</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">3</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">N</th>
		      </tr>
		      <tr class="bg-gray-100">
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1010</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">자유</td>
		          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">런닝머신 5일차 후기</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">문지영</td>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">1000</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">300</th>
		          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">Y</th>
		      </tr>
		      
		    </tbody>
		    </table>
		  </div>

				
		
		
		
		
		
		
		
			<!-- 하단 페이지네이션 영역 -->
			<div class="flex justify-center">
				<nav class="space-y-2">
					<div class="text-sm bg-gray-800 hover:bg-gray-400 hover:text-gray-800 text-white font-semibold py-1 px-3 rounded-l inline-block">이전</div>				
					<div class="text-sm bg-gray-800 hover:bg-gray-400 hover:text-gray-800 text-white font-semibold py-1 px-3 rounded inline-block">1</div>				
					<div class="text-sm bg-gray-800 hover:bg-gray-400 hover:text-gray-800 text-white font-semibold py-1 px-3 rounded inline-block"">2</div>				
					<div class="text-sm bg-gray-800 hover:bg-gray-400 hover:text-gray-800 text-white font-semibold py-1 px-3 rounded inline-block">3</div>				
					<div class="text-sm bg-gray-800 hover:bg-gray-400 hover:text-gray-800 text-white font-semibold py-1 px-3 rounded inline-block">4</div>				
					<div class="text-sm bg-gray-800 hover:bg-gray-400 hover:text-gray-800 text-white font-semibold py-1 px-3 rounded inline-block">5</div>				
					<button class="text-sm bg-gray-800 hover:bg-gray-400 hover:text-gray-800 text-white font-semibold py-1 px-3 rounded-r inline-block">다음</button>				
				</nav>
			</div>

		
	</div> <!-- CONTENT 끝! -->

</div> <!-- SECTION 끝! -->
	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>

</div> <!-- ADMIN-CONTAINER 끝!  -->

</html>