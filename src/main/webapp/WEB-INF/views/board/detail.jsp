<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date today = new Date();
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");
	request.setAttribute("today", sdf1.format(today));
%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/board/detail.css">

<!-- HEADER -->
<%@include file="../layout/header.jsp" %>

<section class="antialiased font-sans bg-gray-200">

    <div class="container mx-auto px-4 sm:px-8">
        <div class="py-8">
        
            <div class="pb-2">
                <h2 class="text-2xl font-semibold leading-tight text-gray-700">게시글</h2>
	            <button onclick="document.getElementById('myModal').showModal()" id="btn" class="text-sm font-extrabold float-right w-32 focus:outline-none border border-transparent py-2 px-5 rounded-lg shadow-sm text-center text-white bg-blue-500 hover:bg-blue-600 font-medium" 
				>댓글작성</button>
				<div class="clear-both"></div>
            </div>
            
            <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
                <div class="inline-block min-w-full shadow rounded-lg overflow-hidden">
                    <table class="min-w-full leading-normal">
                        <colgroup>
                    		<col width="50%" />
                    		<col width="10%" />
                    		<col width="10%" />
                    		<col width="10%" />
                    		<col width="10%" />
                    		<col width="10%" />
                    	</colgroup>
                        <thead>
                            <tr>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    제목
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    구분
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    작성자
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    작성일자
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    조회수
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    추천수
                                </th>	
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                   <div class="flex items-center ml-3">
	                                   <p class="text-gray-900 whitespace-no-wrap text-left">
	                                       ${board.title }
	                                   </p>
                                   </div>
                                </td>
								<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                	<c:choose>
                                		<c:when test="${board.type eq 1 }">
		                                    <span
		                                        class="relative inline-block px-3 py-1 font-semibold text-green-900 leading-tight">
		                                        <span aria-hidden
		                                            class="absolute inset-0 bg-green-200 opacity-50 rounded-full"></span>
		                                        <span class="relative text-left">자유</span>
		                                    </span>
	                                    </c:when>
                                		<c:when test="${board.type eq 2 }">
		                                    <span
		                                        class="relative inline-block px-3 py-1 font-semibold text-orange-900 leading-tight">
		                                        <span aria-hidden
		                                            class="absolute inset-0 bg-orange-200 opacity-50 rounded-full"></span>
		                                        <span class="relative text-left">광고</span>
		                                    </span>
	                                    </c:when>
                                		<c:when test="${board.type eq 3 }">
		                                    <span
		                                        class="relative inline-block px-3 py-1 font-semibold text-red-900 leading-tight">
		                                        <span aria-hidden
		                                            class="absolute inset-0 bg-red-200 opacity-50 rounded-full"></span>
		                                        <span class="relative text-left">공지</span>
		                                    </span>
	                                    </c:when>
                                    </c:choose>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                            	<div class="flex items-center">
                                        <div class="flex-shrink-0 w-10 h-10">
                                            <img class="w-full h-full rounded-full"
                                                src="<%=request.getContextPath() %>/resources/upload_user/${board.renamed }.${board.ext }"
                                                alt="" />
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-gray-900 whitespace-no-wrap text-left">${board.nick }</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-gray-900 whitespace-no-wrap text-left">
                                        <fmt:formatDate var="date" value="${board.dates }" pattern="yyyy-MM-dd" />
                                        <c:choose>
                                        	<c:when test="${today eq date }">
                                        		<%= sdf2.format(today) %>
                                        	</c:when>
                                        	<c:otherwise>
                                        		${date }
                                        	</c:otherwise>
                                        </c:choose>
                                    </p>
                                </td>
								<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                            	<p class="text-gray-900 whitespace-no-wrap text-center">${board.count }</p>
                                </td>
								<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
									<c:choose>
										<c:when test="${board.goodbad ge 0}">
	                            			<p class="text-gray-900 whitespace-no-wrap text-center font-bold text-blue-600">${board.goodbad }</p>
                                		</c:when>
                                		<c:otherwise>
	                            			<p class="text-gray-900 whitespace-no-wrap text-center font-bold text-red-600">${board.goodbad }</p>
                                		</c:otherwise>
                                	</c:choose>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- 본문 내용 시작 -->
            <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
                <div class="inline-block min-w-full shadow rounded-lg overflow-hidden">
                    <table class="min-w-full leading-normal">
                        <thead>
                            <tr>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    <p class="float-left inline-block">본문</p>
                                    <p class="float-right inline-block px-6 font-bold text-red-600">
                                    	<img id="boardBood" onclick="boardRecommend(${board.no }, 2)" class="inline-block w-6 h-6 cursor-pointer" src="<%=request.getContextPath() %>/resources/image/board/bad.png">
                                    	${board.bad }
                                    </p>
                                    <p class="float-right inline-block px-2">싫어요</p>
                                    <p class="float-right inline-block px-6 font-bold text-blue-600">
                                    	<img id="boardBad" onclick="boardRecommend(${board.no }, 1)" class="inline-block w-6 h-6 cursor-pointer" src="<%=request.getContextPath() %>/resources/image/board/good.png">
										${board.good }
                                    </p>
                                    <p class="float-right inline-block px-2">좋아요</p>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <div class="flex items-center">
                                        <div class="ml-3">
                                            <p class="text-gray-900">
                                            	${board.content }
                                            </p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 본문 내용 끝 -->
            
            <!-- 댓글란 시작 -->
            <c:if test="${commentsData.clist[0] ne null }">
            <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
                <div class="inline-block min-w-full shadow rounded-lg overflow-hidden">
                    <table class="min-w-full leading-normal">
                    	<colgroup>
                    		<col width="70%">
                    		<col width="10%">
                    		<col width="10%">
                    		<col width="10%">
                    	</colgroup>
                        <thead>
                            <tr>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    댓글
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    작성자
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    좋아요
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    싫어요
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${commentsData.clist }" var="comments">
                            <tr>
                                <td class="px-2 py-2 border-b border-gray-200 bg-white text-sm">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 w-10 h-10">
                                            <img class="w-full h-full rounded-full"
                                                src="<%=request.getContextPath() %>/resources/upload_user/${comments.renamed }.${comments.ext }"
                                                alt="" />
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-gray-900 whitespace-no-wrap text-xs">
                                                ${comments.content }
                                            </p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-2 py-2 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-gray-900 whitespace-no-wrap text-xs">${comments.nick }</p>
                                </td>
                                <td class="px-2 py-2 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-blue-600 whitespace-no-wrap text-center font-bold">
                                    	<img class="inline-block w-6 h-6 cursor-pointer" src="<%=request.getContextPath() %>/resources/image/board/good.png">
                                    	${comments.good }
                                    </p>
                                </td>
                                <td class="px-2 py-2 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-red-600 whitespace-no-wrap text-center font-bold">
                                    	<img class="inline-block w-6 h-6 cursor-pointer" src="<%=request.getContextPath() %>/resources/image/board/bad.png">
                                    	${comments.bad }
                                    </p>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            </c:if>
            <!-- 댓글란 끝 -->
            
        </div>
    </div>

	<!-- Modal -->
	<dialog id="myModal" class="fixed h-auto w-11/12 md:w-1/2 p-5  bg-white rounded-md ">
		<div class="flex flex-col w-full h-auto justify-center items-center">
			<!-- Header -->
			<div class="w-full h-auto">
				<div onclick="document.getElementById('myModal').close();" class="float-right w-1/12 h-auto justify-center cursor-pointer">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</div>
				<div class="clear-both"></div>
				<div class="flex h-auto justify-center items-center text-2xl font-bold">
					댓글 작성
				</div>
			</div>
			<!--Header End-->
			<!-- Content-->
			<form action="<%=request.getContextPath() %>/comments/write" method="post" class="w-full max-w-xl rounded-lg px-4 pt-2">
				<div class="flex flex-wrap -mx-4 mb-2">
					<div class="w-full md:w-full my-2">
						<input hidden="hidden" name="ref" value="${board.no }">
						<textarea class="bg-gray-300 rounded border border-gray-400 leading-normal resize-none w-full h-20 py-2 px-3 font-medium placeholder-gray-700 focus:outline-none" name="content" placeholder='좋은 게시글인군요!' required></textarea>
					</div>
					<div class="w-full md:w-full flex items-start md:w-full">
						<div class="flex items-start w-1/2 text-gray-700 px-2 mr-auto"></div>
						<div class="-mr-1">
							<input type='submit' class="bg-white text-gray-700 font-medium py-1 px-4 border border-gray-400 rounded-lg tracking-wide mr-1 hover:bg-gray-100" value='등록'>
						</div>
					</div>
				</div>
			</form>
			<!-- Content End -->
		</div>
	</dialog>

</section>

<script>
function boardRecommend(ref, goodBad) {
	
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '<%=request.getContextPath()%>/recommend/board?ref='+ref+'&goodBad='+goodBad);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send();
	
	xhr.addEventListener('load', function() {
		
		var data = xhr.response;

		if(data > 0) {
			
		} else {
			alert("이미 추천/비추천 하셨습니다.");
		}
	});
	
}
</script>

<%@include file="../layout/footer.jsp" %>
