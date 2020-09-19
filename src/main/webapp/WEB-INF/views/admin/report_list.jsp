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
		<span class="font-semibold text-4xl"><a href="<%=request.getContextPath()%>/admin/reportlist">신고관리</a></span>
		
			<!-- 테이블 영역 -->
			  <div class="shadow overflow-hidden rounded border-b border-gray-200">
			    <table class="table-fixed bg-white w-full">
				<colgroup>
					<col width="31%" />
					<col width="7%" />
					<col width="7%" />
					<col width="9%" />
					<col width="12%" />
					<col width="7%" />
					<col width="7%" />
					<col width="20%" />
				</colgroup>
			      <thead class="bg-gray-800 text-white">
			        <tr>
			          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">게시글제목</th>
			          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">작성자</td>
			          <th class="w-4/10 py-3 px-4 uppercase font-semibold text-sm">신고자</th>
			          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">신고이유</td>
			          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">신고날짜</th>
			          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">조치여부</th>
			          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">정지기간</th>
			          <th class="w-1/10 py-3 px-4 uppercase font-semibold text-sm">비고</th>
			        </tr>
			      </thead>
			    <tbody class="text-gray-700">
			    <c:if test="${!empty rlist }">
			    <c:forEach items="${rlist }" var="report" varStatus="status">
			      <tr class="${status.count % 2 == 1 ? '' : 'bg-gray-100'} hover:bg-blue-200 cursor-pointer" onclick="getReportDetail('${report.id }', ${report.ref }, ${report.manage})">
			        <td class="w-1/4 py-3 px-4 text-center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${report.title }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${report.target }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${report.id }</td>
			        <td class="w-1/4 py-3 px-4 text-center">
						<c:choose>
				        	<c:when test="${report.reason eq 1}">욕설</c:when>
				        	<c:when test="${report.reason eq 2}">거짓</c:when>
				        	<c:when test="${report.reason eq 3}">중복</c:when>
				        	<c:otherwise>기타</c:otherwise>
				        </c:choose>
			        </td>
			        <td class="w-1/4 py-3 px-4 text-center">
			        	<fmt:formatDate value="${report.dates }" pattern="yyyy-MM-dd"/>
			        </td>
			        <td class="w-1/4 py-3 px-4 text-center">
						<c:choose>
				        	<c:when test="${report.manage eq 0}">N</c:when>
				        	<c:otherwise>Y</c:otherwise>
				        </c:choose>
			        </td>
			        <td class="w-1/4 py-3 px-4 text-center">
						<c:choose>
				        	<c:when test="${report.days eq 1}">01일</c:when>
				        	<c:when test="${report.days eq 2}">03일</c:when>
				        	<c:when test="${report.days eq 3}">07일</c:when>
				        	<c:when test="${report.days eq 4}">30일</c:when>
				        	<c:otherwise>-</c:otherwise>
				        </c:choose>
			        </td>
			        <td class="w-1/4 py-3 px-4 text-center">
						<c:choose>
				        	<c:when test="${report.note eq null}">-</c:when>
				        	<c:otherwise>${report.note }</c:otherwise>
				        </c:choose>
			        </td>
			      </tr>
			     </c:forEach> 
			     </c:if>
			     <c:if test="${empty rlist }">
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
		         		<a href="<%= request.getContextPath() %>/admin/reportlist?cPage=${page.blockStart-1}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/reportlist?cPage=${page.blockStart}" class="nav prev">
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
		        
         		<a href="<%= request.getContextPath() %>/admin/reportlist?cPage=${pagenation}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/reportlist?cPage=${page.blockEnd}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/reportlist?cPage=${page.blockEnd+1}" class="nav prev">
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
				<dialog id="myModal" class="fixed h-auto w-1/4 p-5  bg-white rounded-md ">
					<div class="flex flex-col w-1/2 h-auto justify-center items-center" style="margin: 0 auto;">
						<!-- Header -->
						<div class="w-full h-auto" style="width: 410px;">
							<div onclick="document.getElementById('myModal').close();" class="float-right w-1/12 h-auto justify-center cursor-pointer">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
							</div>
							<div class="clear-both"></div>
						</div>
						<!--Header End-->
						<!-- Content-->
						<form action="<%=request.getContextPath()%>/admin/reportmodify" method="POST">
						<div class="flex flex-col justify-center items-center w-full max-w-xl rounded-lg px-4 pt-2">
							
						 <div class="shadow w-full overflow-hidden rounded border-b border-gray-200">
						 	<table>
						        <tr>
						        <th class="bg-gray-800 text-white w-full py-3 px-4 uppercase font-semibold text-sm">내용</th>
						        <td class="bg-gray-100 w-3/4 py-3 px-4 text-center" id="reportDetail_detail"></td>
						        <input id="reportId" name="id" type="hidden" />
						        <input id="reportRef" name="ref" type="hidden" />
								</tr>
						        <tr>
						        <th class="bg-gray-800 text-white w-full py-3 px-4 uppercase font-semibold text-sm">조치</td>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center">
						        	<select name="days" id="reportDetail_days">
						        		<option value="1" >01일 정지</option>
						        		<option value="2" >03일 정지</option>
						        		<option value="3" >07일 정지</option>
						        		<option value="4" >30일 정지</option>
						        	</select>
						        </td>
						        </tr>
						        <tr>  
						        <th class="bg-gray-800 text-white w-full py-3 px-4 uppercase font-semibold text-sm">비고</td>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center">
						        	<input name="note" id="reportDetail_note" style="text-align:center;"/>
						        </td> 
						        </tr>
						 	</table>
						  </div>
							<div class="mt-4">
								<button class="bg-gray-800 text-white font-bold py-3 px-3 border border-gray-400 rounded-lg tracking-wide mr-1 hover:bg-gray-100 hover:text-black"
									id="reportbtn">확인</button>
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
function getReportDetail(id, ref, manage) {
	
	var xhr = new XMLHttpRequest();
    xhr.open('GET', '<%=request.getContextPath()%>/admin/reportdetail?id='+id+'&ref='+ref);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.send();
    xhr.addEventListener('load', function(){
		
    	//해당 상품의 재고 정보 받음
    	var result = JSON.parse(xhr.response); 
		
		document.getElementById('reportDetail_detail').innerText = result[0].detail;
		document.getElementById('reportId').value = result[0].id;
		document.getElementById('reportRef').value = result[0].ref;

		if (result[0].days == 1) {
			document.getElementById("reportDetail_days")[0].selected = true;
		} else if (result[0].days == 2) {
			document.getElementById("reportDetail_days")[1].selected = true;
		} else if (result[0].days == 3) {
			document.getElementById("reportDetail_days")[2].selected = true;
		} else if (result[0].days == 4) {
			document.getElementById("reportDetail_days")[3].selected = true;
		} else {
			document.getElementById("reportDetail_days")[0].selected = true;
		}
		
		if (result[0].note != null) {
			document.getElementById('reportDetail_note').value = result[0].note;
		} else {
			document.getElementById('reportDetail_note').value = '';
		}

		if (manage == 0) {
			document.getElementById("reportbtn").classList.remove("hidden");
		} else if (manage == 1) {
			document.getElementById("reportbtn").classList.add("hidden");
		}
		
    })
    
    //모달 창 열기
    document.getElementById('myModal').showModal();
}

</script>

</html>

