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
		
		<!-- 상단 제목 영역  -->
		<span class="font-semibold text-4xl">회원관리</span>
		

			<!-- 상단 버튼 영역  -->		
			<div class="flex justify-end">
			
				  <div class="mr-3">
				      <select id="select">
				          <option value="1">회원아이디</option>
				          <option value="2">회원이름</option>
				      </select>
				  </div>
				  
	            <input type="text" class="mr-3" placeholder="입력하세요"/>
			    <button class='bg-gray-100 text-gray-800 py-2 px-3 rounded font-bold'>
			      조회하기
			  	</button>
					        
			</div>
		
		
		
		
		
			<!-- 테이블 영역  -->	
			  <div class="shadow overflow-hidden rounded border-b border-gray-200">
			    <table class="table-fixed bg-white w-full">
			      <thead class="bg-gray-800 text-white">
			        <tr>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">회원아이디</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">이름</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">성별</td>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">나이</td>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">트레이닝상태</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">보유포인트</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">보유코인</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">가입날짜</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">계정정지</th>
			        </tr>
			      </thead>
			    <tbody class="text-gray-700">
			      <tr>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr class="bg-gray-100">
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr class="bg-gray-100">
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr class="bg-gray-100">
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr class="bg-gray-100">
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr class="bg-gray-100">
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
			      </tr>
			      <tr class="bg-gray-100">
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">kitty9302</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">문지영</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">여</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500">22</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >최상</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >3000</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.18</a></td>
			        <td class="w-1/9 py-3 px-4 text-center"><a class="hover:text-blue-500" >N</a></td>
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

		
	</div> <!-- CONTENT 끝 -->

</div> <!--SECTION 끝  -->
	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>

</div> <!-- ADMIN-CONTAINER 끝  -->

</html>