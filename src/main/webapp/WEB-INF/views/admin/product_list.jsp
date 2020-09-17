<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<!-- HEAD -->
<%@include file="/WEB-INF/views/layout/admin_head.jsp" %>

<div class="admin-container">

<!-- HEADER -->
<%@include file="/WEB-INF/views/layout/admin_header.jsp" %>

<!-- SIDEBAR -->
<%@include file="/WEB-INF/views/layout/admin_sidebar.jsp" %>
	
<!-- SECTION  -->
<div class="lay-item" style="min-height: 808px;">
	
	
	<!-- CONTENT -->
	<div class="section-container">
		
		<!-- 상단제목 -->
		<span class="font-semibold text-4xl">상품관리</span>
		
		
		<!-- 상단 버튼 영역 -->
		<form action="<%=request.getContextPath()%>/admin/productlist" method="get"> 
		<div class="flex justify-end" style=" margin-bottom:10px;">
		  <div class="mr-3">
		      <select name="type" id="select" style="height: 40px;">
		          <option value="1">상품코드</option>
		          <option value="2">상품명</option>
		      </select>
		  </div>
		  
          <input name="data" type="text" class="mr-3" placeholder="검색어를 입력하세요." />
          <input name="searchType" value="search" type="hidden" />
		  <button type="submit" class='text-white py-2 px-3 rounded font-bold bg-blue-500 hover:bg-blue-600' >
		    조회하기
		  </button>
			<!-- 상품등록 페이지로 이동하는 버튼   -->
			<button type="button" class='product-register-btn bg-gray-600 text-white py-2 px-3 rounded font-bold ml-4 hover:bg-gray-700' >
			    상품등록
			</button>
		</div>
	
		
		<!-- 테이블 영역 -->		
		<div class="shadow overflow-hidden rounded border-b border-gray-200">
			    <table class="table-fixed bg-white w-full">
			      <thead class="bg-gray-800 text-white">
			        <tr>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">No</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품코드</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품명</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">판매가</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">제조사</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">제조일</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">재고</td>
			        </tr>
			      </thead>
			    <tbody class="text-gray-700">
			    <c:if test="${!empty plist }">
			    <c:forEach items="${plist}" var="product" varStatus="status">
			      <tr class="${status.count % 2 == 1 ? '' : 'bg-gray-100'} hover:bg-blue-200" onclick="location.href='<%=request.getContextPath()%>/admin/productdetail?code=${product.code}'" style="cursor:pointer;">
			        <td class="w-1/4 py-3 px-4 text-center">${product.rnum  }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${product.code }</td>
			        <td class="w-1/4 py-3 px-4 text-center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${product.name }</td>
			        <td class="w-1/4 py-3 px-4 text-center">
			        <fmt:formatNumber pattern="#,###" value="${product.price}" />원
			        </td>
			        <td class="w-1/4 py-3 px-4 text-center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${product.company }</td>
			        <td class="w-1/4 py-3 px-4 text-center"><fmt:formatDate value="${product.dates }" pattern="yyyy-MM-dd"/></td>
			        <td class="w-1/4 py-3 px-4 text-center">${product.stock }</td>
			      </tr>
			     </c:forEach> 
			     </c:if>
			     <c:if test="${empty plist }">
			     	<td colspan="7" class="w-1/4 py-3 px-4 text-center font-bold">조회된 데이터가 없습니다.</td>
			     </c:if>
			    </tbody>
			    </table>
			  </div>
		

			<!-- 하단 페이지네이션 영역 -->
			<!-- section pagination -->
			<div class="px-5 py-5 bg-white border-t flex flex-col xs:flex-row items-center xs:justify-between" >
			<div class="inline-flex mt-2 xs:mt-0">
			<div class="flex flex-col items-center">	
			<div class="flex text-gray-700">	
		        
		        <c:choose>
		        	<c:when test="${page.blockStart > 1 }">
		        		<c:if test="${not empty search}">
		         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${page.blockStart-1}&type=${search.type}&data=${search.data}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${page.blockStart-1}" class="nav prev">
		         		</c:if>
		         			<div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
					            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" 
					            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
					            class="feather feather-chevron-left w-4 h-4">
					                <polyline points="15 18 9 12 15 6"></polyline>
					            </svg>
							</div>
		         		</a>
		        	</c:when>
		        	<c:otherwise>
		        		<c:if test="${not empty search}">
		         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${page.blockStart}&type=${search.type}&data=${search.data}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${page.blockStart}" class="nav prev">
		         		</c:if>
							<div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
					            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" 
					            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
					            class="feather feather-chevron-left w-4 h-4">
					                <polyline points="15 18 9 12 15 6"></polyline>
					            </svg>
							</div>	        		
		        		</a>
		        	</c:otherwise>
		        </c:choose>
		       
		        <div class="flex h-8 font-medium">
		        <c:forEach begin="${page.blockStart}" end="${page.blockEnd}" var="pagenation">
		        
		        <c:if test="${not empty search}">
         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${pagenation}&type=${search.type}&data=${search.data}" class="nav prev">
        		</c:if>
        		<c:if test="${empty search }">
         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${pagenation}" class="nav prev">
         		</c:if>
	         		<c:choose>
		       	   		<c:when test="${page.currentPage eq pagenation }">
			       	    	<div class="w-8 md:flex justify-center items-center hidden cursor-pointer 
			       	    	leading-5 transition duration-150 ease-in border-t-2 border-orange-600">${pagenation}</div>
		       	   		</c:when>
			       	    <c:otherwise>
			       	    	<div class="w-8 md:flex justify-center items-center hidden cursor-pointer 
			       	    	leading-5 transition duration-150 ease-in border-t-2 border-transparent">${pagenation}</div>
			       	    </c:otherwise>
		       	 	</c:choose>
		         </a>
		        
		        </c:forEach> 
	        	</div>
	        	
	        	
		        <c:choose>
		        	<c:when test="${page.blockEnd+1 > page.lastPage }">
		        		<c:if test="${not empty search}">
		         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${page.blockEnd}&type=${search.type}&data=${search.data}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${page.blockEnd}" class="nav prev">
		         		</c:if>
		         			<div class="h-8 w-8 ml-1 flex justify-center items-center  cursor-pointer">
					            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" 
					            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
					            class="feather feather-chevron-right w-4 h-4">
					                <polyline points="9 18 15 12 9 6"></polyline>
					            </svg>
							</div>
		         		</a>
		        	</c:when>
		        	<c:otherwise>
		        		<c:if test="${not empty search}">
		         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${page.blockEnd+1}&type=${search.type}&data=${search.data}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/productlist?cPage=${page.blockEnd+1}" class="nav prev">
		         		</c:if>
					        <div class="h-8 w-8 ml-1 flex justify-center items-center  cursor-pointer">
					            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" 
					            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
					            class="feather feather-chevron-right w-4 h-4">
					                <polyline points="9 18 15 12 9 6"></polyline>
					            </svg>
					        </div>	         		
		         		</a>
		        	</c:otherwise>
		   	   	</c:choose>
	 	   	 
	   	  	</div>
	   	  	</div>
	   	  	</div>
	   	  	</div>
   	  		<!-- // section pagination -->
   	   
   	   
   	   
		
	</div> <!-- CONTENT 끝!  -->

</div> <!-- SECTION 끝!  -->


	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>

</div> <!-- ADMIN-CONTAINER 끝! -->

<script type="text/javascript">

	/* Product_Register_Button */
	var prb = document.querySelector('.product-register-btn');
	
	
	/*prb 버튼 클릭시 상품등록 페이지로 이동   */
	prb.onclick=function(){
				
		location.href="<%=request.getContextPath()%>/admin/productregister";
		
	}
</script>



</html>