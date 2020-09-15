<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<title>Daily Home Training</title>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">
	<link href="https://fonts.googleapis.com/css?family=Bebas+Neue|Montserrat:400,900&amp;display=swap" rel="stylesheet">
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/image/logo.png">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bebas+Neue|Montserrat:400,900&display=swap">
	<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<style type="text/css">
.shopcolor{
	color: white;
}
</style>


<body class="flex items-center justify-center" style="background: #edf2f7;">
<script src="https://premium-tailwindcomponents.netlify.app/assets/build/js/main.js?id=8c11b7cf78ebea1b5aed"></script>

<div x-data="{ cartOpen: false , isOpen: false }" class="bg-white" style="width: -webkit-fill-available;">

<header style="background: #2d3748;">
	<div class="container mx-auto px-6 py-8 font-extrabold">
		<div class="items-center justify-between">


                
			<div class="w-full text-gray-100 md:text-center text-2xl font-semibold">
			
			
				<a href="<%=request.getContextPath() %>/">
				<img src="<%=request.getContextPath() %>/resources/image/logo.png" style="width: 70px; height: 70px; display: inline;">
				Daily Home Training
				</a>
				
				<button id="cartBtn" onclick="location.href='<%=request.getContextPath()%>/shopping/basket'" @mouseover="{cartOpen = !cartOpen, openCart()}" class="focus:outline-none mx-4 sm:mx-0" style="float: right;">
				<svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor" style="color: white;">
				<path d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
				</svg>
				</button>
			
			</div>
		</div>
            
		<nav :class="isOpen ? '' : 'hidden'" class="sm:flex sm:justify-center sm:items-center mt-4">
			<div class="flex flex-col sm:flex-row">
				<a class="mt-3  sm:mx-3 sm:mt-0 lg:mx-24 shopcolor" href="<%=request.getContextPath() %>/">Home</a>
				<a class="mt-3  sm:mx-3 sm:mt-0 lg:mx-24 shopcolor" href="<%=request.getContextPath() %>/exercise/type">Exercise</a>
				<a class="mt-3  sm:mx-3 sm:mt-0 lg:mx-24 shopcolor" href="<%=request.getContextPath() %>/shopping/home">Shop</a>
				<a class="mt-3  sm:mx-3 sm:mt-0 lg:mx-24 shopcolor" href="<%=request.getContextPath() %>/event/attend">Event</a>
				<a class="mt-3  sm:mx-3 sm:mt-0 lg:mx-24 shopcolor" href="<%=request.getContextPath() %>/board/list">Board</a>
			</div>
		</nav>
	</div>
</header>
    
<!-- 사이드 장바구니 -->
<div @mouseleave="cartOpen = !cartOpen" :class="cartOpen ? 'translate-x-0 ease-out' : 'translate-x-full ease-in'" class="z-50 fixed right-0 top-0 max-w-xs w-full h-full px-6 py-4 transition duration-300 transform overflow-y-auto bg-white border-l-2 border-gray-300">
	<div class="flex items-center justify-between">
		<button onclick="location.href='<%=request.getContextPath()%>/shopping/basket'" class="text-2xl font-medium text-gray-700">장바구니</button>
		<button @click="cartOpen = !cartOpen" class="text-gray-600 focus:outline-none">
		<svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M6 18L18 6M6 6l12 12"></path></svg>
		</button>
	</div>
	<hr class="my-3">
        
	<!-- 장바구니 아이템 -->
	<div id="cartContent"></div>	
		
	<!-- 결제하기 -->
	<a onclick="location.href='<%=request.getContextPath() %>/shopping/basket'" class="flex items-center justify-center mt-4 px-3 py-2 bg-blue-600 text-white text-sm uppercase font-medium rounded hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
	<span>주문하기</span>
	<svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
	</a>
</div><!-- 사이드 장바구니 end -->
    
<!-- 검색창 -->
<div class="relative mt-6 max-w-lg mx-auto py-2">
	<span class="absolute inset-y-0 left-0 pl-3 flex items-center">
	<svg class="h-5 w-5 text-gray-500" viewBox="0 0 24 24" fill="none">
	<path d="M21 21L15 15M17 10C17 13.866 13.866 17 10 17C6.13401 17 3 13.866 3 10C3 6.13401 6.13401 3 10 3C13.866 3 17 6.13401 17 10Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
	</svg>
	</span>
	<input name="search" id="search" class="w-full border rounded-md pl-10 pr-4 py-2 focus:border-blue-500 focus:outline-none focus:shadow-outline" type="text" placeholder="Search">
</div>

<!-- 쇼핑 nav -->
<nav class="sm:flex sm:justify-center sm:items-center mt-4">
	<div class="md:flex items-center justify-center py-2 px-8 md:px-12">
		<div class="flex justify-between items-center">
			<div class="text-2xl font-bold text-gray-800 md:text-3xl">
				<a href="#"></a>
			</div>
			<div class="md:hidden">
				<button type="button" class="block text-gray-800 hover:text-gray-700 focus:text-gray-700 focus:outline-none">
					<svg class="h-6 w-6 fill-current" viewBox="0 0 24 24">
					<path class="hidden" d="M16.24 14.83a1 1 0 0 1-1.41 1.41L12 13.41l-2.83 2.83a1 1 0 0 1-1.41-1.41L10.59 12 7.76 9.17a1 1 0 0 1 1.41-1.41L12 10.59l2.83-2.83a1 1 0 0 1 1.41 1.41L13.41 12l2.83 2.83z"/>
					<path d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"/>
					</svg>
				</button>
			</div>
		</div>
		
		<div class="flex flex-col md:flex-row hidden md:block -mx-2">
			<a href="<%=request.getContextPath()%>/shopping/list?listno=0" class="text-gray-800 rounded hover:bg-blue-500 hover:text-gray-100 hover:font-medium py-2 px-2 md:mx-2">전체 보기</a>
			<a href="<%=request.getContextPath()%>/shopping/list?listno=1" class="text-gray-800 rounded hover:bg-blue-500 hover:text-gray-100 hover:font-medium py-2 px-2 md:mx-2">이벤트 상품</a>
			<a href="<%=request.getContextPath()%>/shopping/list?listno=2" class="text-gray-800 rounded hover:bg-blue-500 hover:text-gray-100 hover:font-medium py-2 px-2 md:mx-2">인기 상품</a>
			<a href="<%=request.getContextPath()%>/shopping/list?listno=3" class="text-gray-800 rounded hover:bg-blue-500 hover:text-gray-100 hover:font-medium py-2 px-2 md:mx-2">신규 상품</a>
			<a href="<%=request.getContextPath()%>/shopping/list?listno=4" class="text-gray-800 rounded hover:bg-blue-500 hover:text-gray-100 hover:font-medium py-2 px-2 md:mx-2">운동 보조제</a>
			<a href="<%=request.getContextPath()%>/shopping/list?listno=5" class="text-gray-800 rounded hover:bg-blue-500 hover:text-gray-100 hover:font-medium py-2 px-2 md:mx-2">운동 기구</a>
			<a href="<%=request.getContextPath()%>/shopping/list?listno=6" class="text-gray-800 rounded hover:bg-blue-500 hover:text-gray-100 hover:font-medium py-2 px-2 md:mx-2">다이어트 식품</a>
		</div>
	</div>
</nav>
            
<script type="text/javascript">

document.querySelector('#search').addEventListener("keydown", event => {
	if(event.keyCode === 13) {
		sendSearch();
	}
})

const sendSearch = () => {
	var searchForm = document.createElement("form");
	searchForm.setAttribute("method", "get");
	searchForm.setAttribute("action", "<%=request.getContextPath()%>/shopping/search");
	
	searchForm.appendChild(document.querySelector('#search'));
	
	document.body.appendChild(searchForm); 
	searchForm.submit();
}

/* 마우스 오버시 장바구니 출력 */
const openCart = () => {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '<%=request.getContextPath()%>/shopping/loadcart');
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send();
	xhr.addEventListener('load', function() {
		var data = xhr.response;
		document.querySelector('#cartContent').innerHTML = data;
	});
}

</script>