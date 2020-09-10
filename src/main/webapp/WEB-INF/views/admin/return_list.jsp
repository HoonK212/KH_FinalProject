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
	
	<!-- CONTANINER -->
	<div class="section-container">
	
		<!-- 상단 제목 영역 -->
		<span class="font-semibold text-4xl"><a href="<%=request.getContextPath()%>/admin/returnlist">반품조회</a></span>
		
		
			<!-- 상단 버튼 영역 -->		
			<form action="<%=request.getContextPath()%>/admin/returnlist" method="GET"  class="flex justify-end">
				<div class="mr-3">
					<input name="fromdate" type="date" /> - <input name="todate" type="date" />
				</div>
			
				  <div class="mr-3">
				      <select name="type" id="select" style="height: 40px;">
				          <option value="1">상품코드</option>
				          <option value="2">상품명</option>
				          <option value="3">수리여부</option>
				          <option value="4">반품완료</option>
				      </select>
				  </div>
				  
	            <input name="data" type="text" class="mr-3" placeholder="입력하세요"/>
	            <input name="searchType" value="search" type="hidden" />
			    <button class='bg-gray-100 text-gray-800 py-2 px-3 rounded font-bold'>
			      조회하기
			  	</button>
					        
			</form>
		
		
		
			<!-- 테이블 영역 -->
			<div class="shadow overflow-hidden rounded border-b border-gray-200">
			    <table class="table-fixed bg-white w-full">
			      <thead class="bg-gray-800 text-white">
			        <tr>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">No</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">주문번호</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품코드</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품명</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">수량</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">반품사유</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">신청인ID</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">신청인이름</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">수리여부</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">반품완료</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">신청날짜</td>
			        </tr>
			      </thead>
			    <tbody class="text-gray-700">
			    <c:forEach items="${rlist }" var="rt" varStatus="status">
			      <tr class="${status.count % 2 == 1 ? '' : 'bg-gray-100'}">
			        <td class="w-1/4 py-3 px-4 text-center">${rt.rnum }</td>
			        <td class="w-1/4 py-3 px-4 text-center hover:text-blue-500" onclick="getReturnDetail(${status.count})" >${rt.op_no }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${rt.code }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${rt.name }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${rt.amount }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${rt.reason }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${rt.id }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${rt.to_name }</td>
			        <c:if test="${rt.accept eq 0 }">
			        <td class="w-1/4 py-3 px-4 text-center">N</td>
			      	</c:if>
			        <c:if test="${rt.accept eq 1 }">
			        <td class="w-1/4 py-3 px-4 text-center">Y</td>
			      	</c:if>
			        <c:if test="${rt.status eq 0 }">
			        <td class="w-1/4 py-3 px-4 text-center">N</td>
			      	</c:if>
			        <c:if test="${rt.status eq 1 }">
			        <td class="w-1/4 py-3 px-4 text-center">Y</td>
			      	</c:if>
			      	<td class="w-1/4 py-3 px-4 text-center">${rt.dates }</td>
			      </tr>
			     </c:forEach> 
			    </tbody>
			    </table>
			  </div>
		
		
		
		
			<!-- 하단 페이지네이션 영역 -->
			<div class="px-5 py-5 bg-white border-t flex flex-col xs:flex-row items-center xs:justify-between" style="background-color: #edf2f7;">
			<div class="inline-flex mt-2 xs:mt-0">
			<div class="flex flex-col items-center">	
			<div class="flex text-gray-700">	
		        
		        <c:choose>
		        	<c:when test="${page.blockStart > 1 }">
		        		<c:if test="${not empty search}">
		         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${page.blockStart-1}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${page.blockStart-1}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${page.blockStart}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${page.blockStart}" class="nav prev">
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
         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${pagenation}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
        		</c:if>
        		<c:if test="${empty search }">
         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${pagenation}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${page.blockEnd}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${page.blockEnd}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${page.blockEnd+1}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/returnlist?cPage=${page.blockEnd+1}" class="nav prev">
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
				<dialog id="myModal" class="fixed h-auto w-11/12 md:w-1/2 p-5  bg-white rounded-md ">
					<div class="flex flex-col w-full h-auto justify-center items-center">
						<!-- Header -->
						<div class="w-full h-auto">
							<div onclick="document.getElementById('myModal').close();" class="float-right w-1/12 h-auto justify-center cursor-pointer">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
							</div>
							<div class="clear-both"></div>
						</div>
						<!--Header End-->
						<!-- Content-->
						<form action="<%=request.getContextPath()%>/admin/returnmodify" method="POST">
						<div class="flex flex-col justify-center items-center w-full max-w-xl rounded-lg px-4 pt-2">
							
						 <div class="shadow w-full overflow-hidden rounded border-b border-gray-200">
						 	<table>
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">주문번호</th>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="returnDetail_op_no"></td>
						        <input id="op_no" name="op_no" type="hidden" />
								</tr>
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품코드</th>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="returnDetail_code"></td>
						        </tr>  
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품명</th>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="returnDetail_name"></td>
						        </tr>  
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">수량</th>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="returnDetail_amount"></td>
						        </tr>  
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">반품사유</th>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="returnDetail_reason"></td>
						        </tr>  
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">신청인ID</th>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="returnDetail_id"></td>
						        </tr>  
						        <tr>  
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">신청인이름</td>
								<td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="returnDetail_to_name"></td> 
						        </tr>
						        <tr>  
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">신청날짜</td>
								<td class="bg-gray-100 w-1/4 py-3 px-4 text-center" id="returnDetail_dates"></td> 
						        </tr>
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">수리여부</td>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center">
						        	<select name="accept" id="returnDetail_accept">
						        		<option value="0" >N</option>
						        		<option value="1" >Y</option>
						        	</select>
						        </td>
						        </tr>
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">반품완료</td>
						        <td class="bg-gray-100 w-1/4 py-3 px-4 text-center">
						        	<select name="status" id="returnDetail_status">
						        		<option value="0" >N</option>
						        		<option value="1" >Y</option>
						        	</select>
						        </td>
						        </tr>
						 	</table>
						  </div>
							<div class="mt-4">
								<button class="bg-gray-800 text-white font-bold py-3 px-3 border border-gray-400
								rounded-lg tracking-wide mr-1 hover:bg-gray-100">수정완료</button>
							</div>
						</div>
						</form>
						<!-- Content End -->
					</div>
				</dialog>
		   	  		
	</div> <!-- CONTENT 끝  -->

</div> <!-- SECTION 끝 -->
	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>

</div> <!-- ADMIN-CONTAINER 끝 -->

<script type="text/javascript">
var returnDetail_op_no = null;
var returnDetail_code = null;
var returnDetail_name = null;
var returnDetail_amount = null;
var returnDetail_reason = null;
var returnDetail_id = null;
var returnDetail_to_name = null;
var returnDetail_dates = null;
var returnDetail_accept = null;
var returnDetail_status = null;

function getReturnDetail(count) {
	
	var xhr = new XMLHttpRequest();
	//파라미터로 보낼 상품 코드
	var op_no = document.getElementsByTagName('tr')[count].childNodes[3].innerText;
	var param = "op_no="+op_no;
	
	console.log(op_no);
	
	xhr.open('GET', '<%=request.getContextPath()%>/admin/returndetail?' + param);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.send();
    xhr.addEventListener('load', function(){
		
    	//반품 상세 정보
    	var result = JSON.parse(xhr.response); 
		
    	console.log(xhr.response);
		console.log(result);
		console.log(result[0].op_no);
		
		document.getElementById('returnDetail_op_no').innerText = result[0].op_no;
		document.getElementById('op_no').value = result[0].op_no;
		document.getElementById('returnDetail_code').innerText = result[0].code;
		document.getElementById('returnDetail_name').innerText = result[0].name;
		document.getElementById('returnDetail_amount').innerText = result[0].amount;
		document.getElementById('returnDetail_reason').innerText = result[0].reason; 
		document.getElementById('returnDetail_id').innerText = result[0].id;
		document.getElementById('returnDetail_to_name').innerText = result[0].to_name;
		document.getElementById('returnDetail_dates').innerText = result[0].dates; 
		
//		var date = new Date(result[0].dates);
//		console.log(date);
		
		
		if(result[0].accept == 0){
			document.getElementById('returnDetail_accept')[0].selected = true;
		}else{
			document.getElementById('returnDetail_accept')[1].selected = true;
		}
		if(result[0].status == 0){
			document.getElementById('returnDetail_status')[0].selected = true;
		}else{
			document.getElementById('returnDetail_status')[1].selected = true;
		}
		
		
    })
    
    //모달 창 열기
    document.getElementById('myModal').showModal();
}



</script>

</html>