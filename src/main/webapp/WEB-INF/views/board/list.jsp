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

<!-- HEADER -->
<%@include file="../layout/header.jsp" %>

<section class="antialiased font-sans bg-gray-200">

    <div class="container mx-auto px-4 sm:px-8">
        <div class="py-8">
        
            <div class="pb-2">
                <h2 class="text-2xl font-semibold leading-tight text-gray-700">게시판</h2>
                <button onclick="location.href='<%=request.getContextPath() %>/board/write'" class="text-sm font-extrabold float-right w-32 focus:outline-none border border-transparent py-2 px-5 rounded-lg shadow-sm text-center text-white bg-blue-500 hover:bg-blue-600 font-medium" 
				>글쓰기</button>
            </div>
            
            <div class="my-2 flex sm:flex-row flex-col">
                <div class="flex flex-row mb-1 sm:mb-0">
                    <div class="relative">
                        <select id="cntPerPage" name="cntPerPage"
                            class="appearance-none h-full rounded-l border block appearance-none w-full bg-white border-gray-400 text-gray-700 py-2 px-4 pr-8 leading-tight focus:outline-none focus:bg-white focus:border-gray-500">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select>
                        <div
                            class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                            <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                            </svg>
                        </div>
                    </div>
                    <div class="relative">
                        <select
                            class="appearance-none h-full rounded-r border-t sm:rounded-r-none sm:border-r-0 border-r border-b block appearance-none w-full bg-white border-gray-400 text-gray-700 py-2 px-4 pr-8 leading-tight focus:outline-none focus:border-l focus:border-r focus:bg-white focus:border-gray-500">
                            <option>모두</option>
                            <option>자유</option>
                            <option>광고</option>
                            <option>공지</option>
                        </select>
                        <div
                            class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                            <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                            </svg>
                        </div>
                    </div>
                </div>
                <div class="block relative">
                    <span class="h-full absolute inset-y-0 left-0 flex items-center pl-2">
                        <svg viewBox="0 0 24 24" class="h-4 w-4 fill-current text-gray-500">
                            <path
                                d="M10 4a6 6 0 100 12 6 6 0 000-12zm-8 6a8 8 0 1114.32 4.906l5.387 5.387a1 1 0 01-1.414 1.414l-5.387-5.387A8 8 0 012 10z">
                            </path>
                        </svg>
                    </span>
                    <input placeholder="Search"
                        class="appearance-none rounded-r rounded-l sm:rounded-l-none border border-gray-400 border-b block pl-8 pr-6 py-2 w-full bg-white text-sm placeholder-gray-400 text-gray-700 focus:bg-white focus:placeholder-gray-600 focus:text-gray-700 focus:outline-none" />
                </div>
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
                        	<c:forEach items="${boardData.blist }" var="board">
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                   <div class="flex items-center ml-3">
	                                   <p class="text-gray-900 whitespace-no-wrap text-left">
	                                       <a href="<%=request.getContextPath() %>/board/detail?no=${board.no }">
	                                       		${board.title }
	                                       </a>
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
										<c:when test="${board.goodbad le 0}">
	                            			<p class="text-gray-900 whitespace-no-wrap text-center font-bold text-blue-600">${board.goodbad }</p>
                                		</c:when>
                                		<c:otherwise>
	                            			<p class="text-gray-900 whitespace-no-wrap text-center font-bold text-red-600">${board.goodbad }</p>
                                		</c:otherwise>
                                	</c:choose>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div
                        class="px-5 py-5 bg-white border-t flex flex-col xs:flex-row items-center xs:justify-between          ">
                        <div class="inline-flex mt-2 xs:mt-0">
							<div class="flex flex-col items-center">
							    <div class="flex text-gray-700 pb-3">

							        <c:choose>
							        	<c:when test="${boardData.paging.blockStart > 1 }">
							         		<a href="<%= request.getContextPath() %>/board/list?cPage=${boardData.paging.blockStart-1}" class="nav prev">
												<div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
										            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left w-4 h-4">
										                <polyline points="15 18 9 12 15 6"></polyline>
										            </svg>
										        </div>
											</a>
							        	</c:when>
							        	<c:otherwise>
							        		<a href="<%= request.getContextPath() %>/board/list?cPage=${boardData.paging.blockStart}" class="nav prev">
												<div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
										            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-left w-4 h-4">
										                <polyline points="15 18 9 12 15 6"></polyline>
										            </svg>
										        </div>
											</a>
							        	</c:otherwise>
							        </c:choose>
							        
							        <div class="flex h-8 font-medium ">
							            <c:forEach begin="${boardData.paging.blockStart}" end="${boardData.paging.blockEnd}" var="page">
								         <a href="<%= request.getContextPath() %>/board/list?cPage=${page }">
								       	  <c:choose>
								       	   <c:when test="${boardData.paging.currentPage eq page }">
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
							        	<c:when test="${boardData.paging.blockEnd+1 > boardData.paging.lastPage }">
							         		<a href="<%= request.getContextPath() %>/board/list?cPage=${boardData.paging.blockEnd}">
										        <div class="h-8 w-8 ml-1 flex justify-center items-center  cursor-pointer">
										            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right w-4 h-4">
										                <polyline points="9 18 15 12 9 6"></polyline>
										            </svg>
										        </div>
							         		</a>
							        	</c:when>
							        	<c:otherwise>
							         		<a href="<%= request.getContextPath() %>/board/list?cPage=${boardData.paging.blockEnd+1}">
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
		                            Showing ${boardData.paging.blockStart } to ${boardData.paging.blockEnd } of ${boardData.paging.total }
		                        </span>
							</div>
	                	</div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    
</section>

<%@include file="../layout/footer.jsp" %>
