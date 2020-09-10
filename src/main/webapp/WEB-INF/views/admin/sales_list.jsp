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
	
	<!-- CONTENT  -->
	<div class="section-container">

		<!-- 상단 제목 영역  -->
		<span class="font-semibold text-4xl">매출목록</span>
		
		
			<!-- 상단 버튼 영역 -->
			<form action="<%=request.getContextPath()%>/admin/salesSearchList" method="post"> 
			<div class="flex justify-end">
				<div class="mr-3">
					<input type="date" name="date1" /> - <input type="date" name="date2"/>
				</div>
			
				  <div class="mr-3">
				      <select id="select" name="search" style="height: 40px;">
				          <option value="code">상품번호</option>
				          <option value="name">상품명</option>
				      </select>
				  </div>
				  
	            <input type="text" class="mr-3" placeholder="입력하세요" name="search2"/>
			    <button class='bg-gray-100 text-gray-800 py-2 px-3 rounded font-bold'>
			      조회하기
			  	</button>
			</div>
			</form>
					        
		
		
		
		
		
			<!--  테이블 영역 -->
			  <div class="shadow overflow-hidden rounded border-b border-gray-200">
			    <table class="table-fixed bg-white w-full">
			      <thead class="bg-gray-800 text-white">
			        <tr>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">상품번호</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">상품명</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">판매가</td>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">할인가</td>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">판매수량</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">포인트사용</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">현금사용</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">총매출액</th>
			          <th class="w-1/9 py-3 px-4 uppercase font-semibold text-sm">날짜</th>
			        </tr>
			      </thead>
			    <tbody class="text-gray-700">
			     <c:forEach items="${salesData.slist}" var="listData">
			     				     
			      <tr>
			        <td class="w-1/9 py-3 px-4 text-center">${listData.code}</td>
			        <td class="w-1/9 py-3 px-4 text-center">${listData.name}</td>
			        <td class="w-1/9 py-3 px-4 text-center">${listData.price}</td>
			        <td class="w-1/9 py-3 px-4 text-center">0</td>
			        <td class="w-1/9 py-3 px-4 text-center">${listData.amount}</td>
			        <td class="w-1/9 py-3 px-4 text-center">${listData.point}</td>
			        <td class="w-1/9 py-3 px-4 text-center">${listData.price}</td>
			        <td class="w-1/9 py-3 px-4 text-center"><c:out value=" ${listData.price * listData.amount - listData.point }" /></td>
			        <td class="w-1/9 py-3 px-4 text-center"><c:out value="${listData.dates}" /></td>
			      </tr>
			    </c:forEach>
			    </tbody>
			    </table>
			  </div>

   	   <!-- 페이징 처리 -->
		
		   <div
                        class="px-5 py-5 bg-white border-t flex flex-col xs:flex-row items-center xs:justify-between          ">
                        <div class="inline-flex mt-2 xs:mt-0">
							<div class="flex flex-col items-center">
							    <div class="flex text-gray-700 pb-3">

							        <c:choose>
							        	<c:when test="${paging.blockStart > 1 }">
							         		<a href="<%= request.getContextPath() %>/admin/salesList?cPage=${paging.blockStart-1}" class="nav prev">
												<div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
										            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left w-4 h-4">
										                <polyline points="15 18 9 12 15 6"></polyline>
										            </svg>
										        </div>
											</a>
							        	</c:when>
							        	<c:otherwise>
							        		<a href="<%= request.getContextPath() %>/admin/salesList?cPage=${paging.blockStart}" class="nav prev">
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
								         <a href="<%= request.getContextPath() %>/admin/salesList?cPage=${page }">
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
							         		<a href="<%= request.getContextPath() %>/admin/salesList?cPage=${paging.blockEnd}">
										        <div class="h-8 w-8 ml-1 flex justify-center items-center  cursor-pointer">
										            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right w-4 h-4">
										                <polyline points="9 18 15 12 9 6"></polyline>
										            </svg>
										        </div>
							         		</a>
							        	</c:when>
							        	<c:otherwise>
							         		<a href="<%= request.getContextPath() %>/admin/salesList?cPage=${paging.blockEnd+1}">
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
		
	</div> <!-- CONTENT 영역 끝 -->

</div> <!-- SECTION 영역 끝 -->
	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>

</div> <!-- ADMIN-CONTAINER 영역 끝 -->

</html>