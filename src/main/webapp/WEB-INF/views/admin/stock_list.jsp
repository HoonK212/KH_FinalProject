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
	
	<!-- CONTENT  -->
	<div class="section-container">
		
		<!-- 상단 제목 영역 -->
		<span class="font-semibold text-4xl">재고관리</span>
		
		
			<!-- 상단 버튼 영역 -->
			<form action="<%=request.getContextPath()%>/admin/stocklist" method="GET" class="flex justify-end">
			<div class="flex justify-end" style=" margin-bottom:10px;">
				  <div class="mr-3">
				      <select name="type" id="select" style="height: 40px;">
				          <option value="1">상품코드</option>
				          <option value="2">상품명</option>
				      </select>
				  </div>
				  
	            <input name="data" type="text" class="mr-3" placeholder="검색어를 입력하세요." />
	            <input name="searchType" value="search" type="hidden" />
			    <button class='text-white py-2 px-3 rounded font-bold bg-blue-500 hover:bg-blue-600'>
			      조회하기
			  	</button>
		  	</div>
			</form>					        
	
		
		
			<!-- 테이블 영역 -->
			  <div class="shadow overflow-hidden rounded border-b border-gray-200">
			    <table class="table-fixed bg-white w-full">
			      <thead class="bg-gray-800 text-white">
			        <tr>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">No</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품코드</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품명</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">재고현황</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">판매여부</td>
			        </tr>
			      </thead>
			    <tbody class="text-gray-700">
			    <c:if test="${!empty plist }">
			    <c:forEach items="${plist }" var="product" varStatus="status">
			      <tr class="${status.count % 2 == 1 ? '' : 'bg-gray-100'} hover:bg-blue-200 cursor-pointer" onclick="getStockDetail(${status.count})">
			        <td class="w-1/4 py-3 px-4 text-center">${product.rnum }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${product.code }</td>
			        <td class="w-1/4 py-3 px-4 text-center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${product.name }</td>
			        <td class="w-1/4 py-3 px-4 text-center"><fmt:formatNumber pattern="#,###" value="${product.stock }" />개</td>
			        <c:if test="${product.sell eq 1 }">
			        <td class="w-1/4 py-3 px-4 text-center text-blue-500 font-bold">판매중</td>
			      	</c:if>
			        <c:if test="${product.sell eq 0 }">
			        <td class="w-1/4 py-3 px-4 text-center text-red-500 font-bold">판매중단</td>
			      	</c:if>
			      </tr>
			     </c:forEach> 
			     </c:if>
			     <c:if test="${empty plist }">
			     	<td colspan="5" class="w-1/4 py-3 px-4 text-center font-bold">조회된 데이터가 없습니다.</td>
			     </c:if>
			    </tbody>
			    </table>
			  </div>
		
			<!-- 하단 페이지네이션 영역 -->
			<!-- section pagination -->
			<div class="px-5 py-5 bg-white border-t flex flex-col xs:flex-row items-center xs:justify-between">
			<div class="inline-flex mt-2 xs:mt-0">
			<div class="flex flex-col items-center">	
			<div class="flex text-gray-700">	
		        
		        <c:choose>
		        	<c:when test="${page.blockStart > 1 }">
		        		<c:if test="${not empty search}">
		         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${page.blockStart-1}&type=${search.type}&data=${search.data}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${page.blockStart-1}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${page.blockStart}&type=${search.type}&data=${search.data}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${page.blockStart}" class="nav prev">
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
         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${pagenation}&type=${search.type}&data=${search.data}" class="nav prev">
        		</c:if>
        		<c:if test="${empty search }">
         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${pagenation}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${page.blockEnd}&type=${search.type}&data=${search.data}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${page.blockEnd}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${page.blockEnd+1}&type=${search.type}&data=${search.data}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/stocklist?cPage=${page.blockEnd+1}" class="nav prev">
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
   	  		
   	  		
   	  			<!-- Modal -->
				<dialog id="myModal" class="fixed h-auto w-2/5 p-5  bg-white rounded-md ">
					<div class="flex flex-col w-1/2 h-auto justify-center items-center" style="margin: 0 auto;">
						<!-- Header -->
						<div class="w-full h-auto" style="width: 320px;">
							<div onclick="document.getElementById('myModal').close();" class="float-right w-1/12 h-auto justify-center cursor-pointer">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
							</div>
							<div class="clear-both"></div>
						</div>
						<!--Header End-->
						<!-- Content-->
						<form action="<%=request.getContextPath()%>/admin/stockmodify" method="POST">
						<div class="flex flex-col justify-center items-center w-full max-w-xl rounded-lg px-4 pt-2">
							
						 <div class="shadow w-full overflow-hidden rounded border-b border-gray-200">
						 	<table>
						        <tr>
						        <th class="bg-gray-800 text-white w-full py-3 px-4 uppercase font-semibold text-sm">상품코드</th>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="stockDetail_code"></td>
						        <input id="code" name="code" type="hidden" />
								</tr>
						        <tr>
						        <th class="bg-gray-800 text-white w-full py-3 px-4 uppercase font-semibold text-sm">상품명</th>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="stockDetail_name"></td>
						        </tr>  
						        <tr>  
						        <th class="bg-gray-800 text-white w-full py-3 px-4 uppercase font-semibold text-sm">재고현황</td>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center"><input id="stockDetail_stock" name="stock" style="text-align:center;"/></td> 
						        </tr>
						        <tr>
						        <th class="bg-gray-800 text-white w-full py-3 px-4 uppercase font-semibold text-sm">판매여부</td>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center">
						        	<select name="sell" id="stockDetail_sell">
						        		<option value="0" >판매중단</option>
						        		<option value="1" >판매중</option>
						        	</select>
						        </td>
						        </tr>
						 	</table>
						  </div>
							<div class="mt-4">
								<button class="bg-gray-800 text-white font-bold py-3 px-3 border border-gray-400
								rounded-lg tracking-wide mr-1 hover:bg-gray-100 hover:text-black">수정완료</button>
							</div>
						</div>
						</form>
						<!-- Content End -->
					</div>
				</dialog>
   	  		

		
	</div> <!-- CONTENT 영역 끝  -->

</div> <!-- SECTION 영역 끝 -->
	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>

</div> <!-- ADMIN-CONTAINER 끝 -->

<script>
function getStockDetail(count) {
	
	var xhr = new XMLHttpRequest();
	//파라미터로 보낼 상품 코드
	var productCode = document.getElementsByTagName('tr')[count].childNodes[3].innerText;
	var param = "code="+productCode;
	
    xhr.open('GET', '<%=request.getContextPath()%>/admin/stockdetail?' + param);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.send();
    xhr.addEventListener('load', function(){
		
    	//해당 상품의 재고 정보 받음
    	var result = JSON.parse(xhr.response); 
		
		document.getElementById('stockDetail_code').innerText = result[0].code;
		document.getElementById('code').value = result[0].code;
		document.getElementById('stockDetail_name').innerText = result[0].name;
		document.getElementById('stockDetail_stock').value = result[0].stock;

		//판매여부에 따라 셀렉트 요소 선택
		if(result[0].sell == 0){
			document.getElementById("stockDetail_sell")[0].selected = true;
		}else{
			document.getElementById("stockDetail_sell")[1].selected = true;
		}
		
    })
    
    //모달 창 열기
    document.getElementById('myModal').showModal();
}

</script>

</html>

