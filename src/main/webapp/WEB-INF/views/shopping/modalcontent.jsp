<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<div class="md:flex md:items-center">
	<div class="w-full h-64 md:w-1/2 lg:h-96">
		<img class="h-full w-full rounded-md object-cover max-w-lg mx-auto" src="https://images.unsplash.com/photo-1578262825743-a4e402caab76?ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80" alt="Nike Air">
	</div>
	<div class="w-full max-w-lg mx-auto mt-5 md:ml-8 md:mt-0 md:w-1/2">
		<h3 class="text-2xl text-gray-700 uppercase text-lg">${detail.name }</h3>
 		<span class="text-gray-700 mt-3">${detail.price }원</span>
		<hr class="my-3">
		<div class="mt-2">
			<div class="flex items-center mt-1">
				<input type="hidden" value="${detail.code }" id="code">
				<label class="text-gray-700 text-sm mr-3" for="count">Count:</label>
				<input type="number" min="1" value="1" name="amount" id="amount"
				class="text-center text-gray-700 bg-gray-200 outline-none focus:outline-none hover:text-black focus:text-black" />
			</div>
		</div>
		<div class="flex items-center mt-6">
			<!-- 주문하기 -->
			<button onclick="sendOrder();" class="px-8 py-2 bg-indigo-600 text-white text-sm font-medium rounded hover:bg-indigo-500 focus:outline-none focus:bg-indigo-500">주문하기</button>
			<!-- 장바구니 담기 -->
			<button onclick="sendBasket();" class="mx-2 text-gray-600 border rounded-md p-2 hover:bg-gray-200 focus:outline-none">
				<svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
			</button>
		</div>
	</div>
</div>