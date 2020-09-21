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
	
	<!-- CONTANINER -->
	<div class="section-container">
	
		<!-- 상단 제목 영역 -->
		<span class="font-semibold text-4xl">배송관리</span>
		
		
			<!-- 상단 버튼 영역 -->		
			<form action="<%=request.getContextPath()%>/admin/statuslist" method="GET"  class="flex justify-end">
			<div class="flex justify-end" style=" margin-bottom:10px;">
				<div class="mr-3" style="padding-top: 8px;">
					<input name="fromdate" type="date" /> - <input name="todate" type="date" />
				</div>
			
				  <div class="mr-3">
				      <select name="type" id="select" style="height: 40px;">
				          <option value="1">상품코드</option>
				          <option value="2">상품명</option>
				          <option value="3">배송상태</option>
				      </select>
				  </div>
				  
	            <input name="data" type="text" class="mr-3" placeholder="검색어를 입력하세요."/>
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
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">배송상태</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">주문번호</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">주문내역</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품코드</th>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">상품명</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">수량</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">주문자ID</td>
			          <th class="w-1/4 py-3 px-4 uppercase font-semibold text-sm">반품사유</td>
			        </tr>
			      </thead>
			    <tbody class="text-gray-700">
			    <c:if test="${!empty slist }">
			    <c:forEach items="${slist }" var="st" varStatus="status">
			      <tr class="${status.count % 2 == 1 ? '' : 'bg-gray-100'} hover:bg-blue-200 cursor-pointer" onclick="getOrdersDetail(${status.count})">
			        <td class="w-1/4 py-3 px-4 text-center" >${st.rnum }</td>
			        <input type="hidden" value="${st.status }" class="orderstatus" /> 
			        <c:choose>
						<c:when test="${st.status eq 1 }">
						<td class="w-1/4 py-3 px-4 text-center text-green-500 font-bold" onclick="getStatusModify(${status.count})">상품준비</td>
						</c:when>
						
						<c:when test="${st.status eq 2 }">
						<td class="w-1/4 py-3 px-4 text-center text-blue-500 font-bold" onclick="getStatusModify(${status.count})" >출고완료</td>
						</c:when>
						
						<c:when test="${st.status eq 3 }">
						<td class="w-1/4 py-3 px-4 text-center text-purple-500 font-bold" onclick="getStatusModify(${status.count})" >배송완료</td>
						</c:when>
						
						<c:when test="${st.status eq 4 }">
						<td class="w-1/4 py-3 px-4 text-center hover:text-red-500 font-bold"  onclick="getStatusModify(${status.count})">주문취소</td>
						</c:when>
						
						<c:when test="${st.status eq 5 }">
						<td class="w-1/4 py-3 px-4 text-center text-red-500 font-bold" onclick="getStatusModify(${status.count})" >반품접수</td>
						</c:when>
						
						<c:when test="${st.status eq 6 }">
						<td class="w-1/4 py-3 px-4 text-center hover:text-red-500 font-bold" onclick="getStatusModify(${status.count})" >반품완료</td>
						</c:when>
						
					</c:choose>
			        <td class="w-1/4 py-3 px-4 text-center">${st.op_no }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${st.o_no }</td>
			        <td class="w-1/4 py-3 px-4 text-center">${st.code }</td>
			        <td class="w-1/4 py-3 px-4 text-center" style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${st.name }</td>
			        <td class="w-1/4 py-3 px-4 text-center"><fmt:formatNumber pattern="#,###" value="${st.amount }" />개</td>
			        <td class="w-1/4 py-3 px-4 text-center">${st.id }</td>
			        <c:choose>
			        	<c:when test="${not empty st.reason }">
					        <td class="w-1/4 py-3 px-4 text-center">${st.reason }</td>
			        	</c:when>
			        	<c:otherwise>
					        <td class="w-1/4 py-3 px-4 text-center">-</td>
			        	</c:otherwise>
			        </c:choose>
			        
			      </tr>
			     </c:forEach>
			     </c:if>
			     <c:if test="${empty slist }">
			     	<td colspan="8" class="w-1/4 py-3 px-4 text-center font-bold">조회된 데이터가 없습니다.</td>
			     </c:if>
			    </tbody>
			    </table>
			  </div>
		
		
		
		
			<!-- 하단 페이지네이션 영역 -->
			<div class="px-5 py-5 bg-white border-t flex flex-col xs:flex-row items-center xs:justify-between">
			<div class="inline-flex mt-2 xs:mt-0">
			<div class="flex flex-col items-center">	
			<div class="flex text-gray-700">	
		        
		        <c:choose>
		        	<c:when test="${page.blockStart > 1 }">
		        		<c:if test="${not empty search}">
		         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${page.blockStart-1}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${page.blockStart-1}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${page.blockStart}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${page.blockStart}" class="nav prev">
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
         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${pagenation}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate=${search.todate}" class="nav prev">
        		</c:if>
        		<c:if test="${empty search }">
         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${pagenation}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${page.blockEnd}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${page.blockEnd}" class="nav prev">
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
		         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${page.blockEnd+1}&type=${search.type}&data=${search.data}&fromdate=${search.fromdate}&todate={search.todate}" class="nav prev">
		        		</c:if>
		        		<c:if test="${empty search }">
		         		<a href="<%= request.getContextPath() %>/admin/statuslist?cPage=${page.blockEnd+1}" class="nav prev">
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
				<dialog id="myModal" class="fixed h-auto w-2/6 p-5  bg-white rounded-md">
					<div class="flex flex-col w-full h-auto justify-center items-center">
						<!-- Header -->
						<div class="w-full h-auto" style="width: 660px;">
							<div onclick="document.getElementById('myModal').close();" class="float-right w-1/12 h-auto justify-center cursor-pointer">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
							</div>
							<div class="clear-both"></div>
						</div>
						<!--Header End-->
						<!-- Content-->
						<div class="flex flex-col justify-center items-center w-full max-w-xl rounded-lg px-4 pt-2">
							
						 <div class="shadow w-full overflow-hidden rounded border-b border-gray-200">
						 	<table class="w-full">
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">주문날짜</th>
						        <td class="bg-gray-100 w-3/4 py-3 px-4 text-center" id="ordersDetail_dates"></td>
								</tr>
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">주문인ID</th>
						        <td class="bg-gray-100 w-3/4 py-3 px-4 text-center" id="ordersDetail_id"></td>
						        </tr>  
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">성함</th>
						        <td class="bg-gray-100 w-3/4 py-3 px-4 text-center" id="ordersDetail_name"></td>
						        </tr>  
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">전화번호</th>
						        <td class="bg-gray-100 w-3/4 py-3 px-4 text-center" id="ordersDetail_tel"></td>
						        </tr>  
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">주소</th>
						        <td class="bg-gray-100 w-3/4 py-3 px-4 text-center" id="ordersDetail_addr"></td>
						        </tr>  
						        <tr>
						        <th class="bg-gray-800 text-white w-1/4 py-3 px-4 uppercase font-semibold text-sm">우편번호</th>
						        <td class="bg-gray-100 w-3/4 py-3 px-4 text-center" id="ordersDetail_post"></td>
						        </tr>  
						 	</table>
						  </div>
						</div>
						<!-- Content End -->
					</div>
				</dialog>
				
   	  			<!-- Order Status Modal -->
				<dialog id="OrderStatus" class="fixed h-auto w-2/6 p-5  bg-white rounded-md ">
					<div class="flex flex-col w-full h-auto justify-center items-center">
						<!-- Header -->
						<div class="w-full h-auto" style="width: 660px;">
							<div onclick="document.getElementById('OrderStatus').close();" class="float-right w-1/12 h-auto justify-center cursor-pointer">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
							</div>
							<div class="clear-both"></div>
						</div>
						<!--Header End-->
						<!-- Content-->
						<h4 class="text-2xl text-center font-bold tracking-wide comment">배송상태 변경</h4><br> 
						<form action="<%= request.getContextPath() %>/admin/modifystatus" method="get">
						<label class="flex justify-start items-start">
							<div class="bg-white border-2 rounded border-gray-400 w-6 h-6 flex flex-shrink-0 justify-center items-center mr-2 focus-within:border-blue-500">
							   <input type="checkbox" name="status" class="opacity-0 absolute">
							   <svg class="fill-current hidden w-4 h-4 text-green-500 pointer-events-none" viewBox="0 0 20 20"><path d="M0 11l2-2 5 5L18 3l2 2L7 18z"/></svg>
							</div>
							<div class="select-none font-bold text-red-600">Label Text</div>
						</label><br>
						<input type="hidden" name="op_no" >
						<button class="block uppercase mx-auto shadow bg-indigo-800 hover:bg-indigo-700 focus:shadow-outline focus:outline-none text-white text-xs py-3 px-10 rounded">변경</button>
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
var ordersDetail_dates = null;
var ordersDetail_id = null;
var ordersDetail_name = null;
var ordersDetail_tel = null;
var ordersDetail_addr = null;
var ordersDetail_post = null;

function getOrdersDetail(count) {
	
	var xhr = new XMLHttpRequest();
	//파라미터로 보낼 상품 코드
	var o_no = document.getElementsByTagName('tr')[count].childNodes[7].innerText;
	var param = "o_no="+o_no;
	
	xhr.open('GET', '<%=request.getContextPath()%>/admin/ordersdetail?' + param);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    xhr.send();
    xhr.addEventListener('load', function(){
		
    	//반품 상세 정보
    	var result = JSON.parse(xhr.response); 
		
		var date = new Date(result[0].dates);
		
	    var year = date.getFullYear();
	    var month = date.getMonth()+1
	    var day = date.getDate();
	    if(month < 10){
	        month = "0"+month;
	    }
	    if(day < 10){
	        day = "0"+day;
	    }
	 
	    var dates = year+"-"+month+"-"+day;

		
		document.getElementById('ordersDetail_dates').innerText = dates;
		document.getElementById('ordersDetail_id').innerText = result[0].id;
		document.getElementById('ordersDetail_name').innerText = result[0].to_name;
		document.getElementById('ordersDetail_tel').innerText = result[0].to_tel;
		document.getElementById('ordersDetail_addr').innerText = result[0].to_addr; 
		document.getElementById('ordersDetail_post').innerText = result[0].to_post;	
		
    })
    
    //모달 창 열기
    document.getElementById('myModal').showModal();
}

function getStatusModify(count){
	var status = document.getElementsByTagName('tr')[count].childNodes[5].innerText;
	
	if(status == '상품준비'){
		$('.comment').html('현재상태: 상품준비<br>출고가 완료되면 배송상태를 변경해주세요.')
		$('.select-none').text('출고 완료');
		$("input[name='status']").val(2);
		$("input[name='op_no']").val(document.getElementsByTagName('tr')[count].childNodes[7].innerText);
		//모달 창 열기
	    document.getElementById('OrderStatus').showModal();  
	}else if(status == '출고완료'){
		$('.comment').html('현재상태: 출고완료<br>배송이 완료되면 배송상태를 변경해주세요.')
		$('.select-none').text('배송완료');
		$("input[name='status']").val(3);
		$("input[name='op_no']").val(document.getElementsByTagName('tr')[count].childNodes[7].innerText);
		//모달 창 열기
	    document.getElementById('OrderStatus').showModal();  
	}else if(status == '반품접수'){
		$('.comment').html('현재상태: 반품접수<br>반품이 완료되면 반품완료로 변경해주세요.')
		$('.select-none').text('반품완료');
		$("input[name='status']").val(6);
		$("input[name='op_no']").val(document.getElementsByTagName('tr')[count].childNodes[7].innerText);
		//모달 창 열기
	    document.getElementById('OrderStatus').showModal();  
	}
	
}


</script>

<style type="text/css">
  input:checked + svg {
  	display: block;
  }
</style>

</html>