<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div class="lay-item">
	<div class="flex justify-between items-center mx-auto py-4 px-6 bg-white border-b-4 border-indigo-600">
		<div class="flex items-center cursor-pointer" onclick="location.href='<%=request.getContextPath() %>/admin/productlist'">
			<img class="inline-block h-12" src="<%=request.getContextPath() %>/resources/image/logo.png"/>
			<span class="font-black text-2xl">통합관리시스템</span>
		</div>
		<div class="flex items-center">
			
			<div x-data="{ dropdownOpen: false }"  class="relative">
				<button @click="dropdownOpen = !dropdownOpen" class="relative z-10 block h-8 w-8 rounded-full overflow-hidden shadow focus:outline-none">
					<img class="h-full w-full object-cover" src="https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=296&q=80" alt="Your avatar">
				</button>
				<div x-show="dropdownOpen" @click="dropdownOpen = false" class="fixed inset-0 h-full w-full z-10"></div>
	   
				<div x-show="dropdownOpen" class="absolute right-0 mt-2 py-2 w-48 bg-indigo-600 rounded-md shadow-xl z-20">
					<c:if test="${not empty admin }">
					<a href="<%=request.getContextPath()%>/adminlogin/logout" class="block px-4 py-2 text-sm text-white hover:bg-gray-600 hover:text-white">로그아웃</a>
					</c:if>
					<c:if test="${empty admin }">
					<a href="<%=request.getContextPath()%>/adminlogin/main" class="block px-4 py-2 text-sm text-white hover:bg-gray-600 hover:text-white">로그인</a>
					</c:if>
				</div>
			</div>

			<span class="font-mono ml-4">관리자님</span>
		</div>
	</div>
</div>