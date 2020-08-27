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
		
		<!-- 상단제목 -->
		<span class="font-semibold text-4xl">상품목록</span>
		
		
		<!-- 상단 버튼 영역 -->
		<div class="flex justify-end">
		  <div class="mr-3">
		      <select id="select">
		          <option value="1">상품번호</option>
		          <option value="2">상품명</option>
		      </select>
		  </div>
		 
          <input type="text" class="mr-3" placeholder="입력하세요"/>
		  <button class='bg-gray-100 text-gray-800 py-2 px-3 rounded font-bold'>
		    조회하기
		  </button>
		</div>
		
		
		
		
		<!-- 테이블 영역 -->		
		  <div class="shadow overflow-hidden rounded border-b border-gray-200">
		    <table class="table-fixed bg-white">
		      <thead class="bg-gray-800 text-white">
		        <tr>
		          <th class="w-1/12 py-3 px-4 uppercase font-semibold text-sm">상품번호</th>
		          <th class="w-2/12 py-3 px-4 uppercase font-semibold text-sm">상품명</th>
		          <th class="w-1/12 py-3 px-4 uppercase font-semibold text-sm">판매가</td>
		          <th class="w-4/12 py-3 px-4 uppercase font-semibold text-sm">상품설명</td>
		          <th class="w-2/12 py-3 px-4 uppercase font-semibold text-sm">제조사</th>
		          <th class="w-1/12 py-3 px-4 uppercase font-semibold text-sm">제조일</th>
		          <th class="w-1/12 py-3 px-4 uppercase font-semibold text-sm">재고</th>
		        </tr>
		      </thead>
		    <tbody class="text-gray-700">
		      <tr>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr class="bg-gray-100">
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr class="bg-gray-100">
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr class="bg-gray-100">
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr class="bg-gray-100">
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr class="bg-gray-100">
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		      <tr class="bg-gray-100">
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">A1002</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500">닭가슴살</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500">35000</a></td>
		        <td class="w-4/12 py-3 px-4 text-center"><a class="hover:text-blue-500">불러 동력은 것은듣는다.</a></td>
		        <td class="w-2/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >하림</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >2020.08.17</a></td>
		        <td class="w-1/12 py-3 px-4 text-center"><a class="hover:text-blue-500" >300</a></td>
		      </tr>
		    </tbody>
		    </table>
		  </div>

		
		
		<!-- 하단 페이지네이션 영역  -->	
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

		
	</div> <!-- CONTENT 끝!  -->

</div> <!-- SECTION 끝!  -->
	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>

</div> <!-- ADMIN-CONTAINER 끝! -->

</html>