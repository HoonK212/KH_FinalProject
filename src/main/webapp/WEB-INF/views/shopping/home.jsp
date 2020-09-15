<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- tailwind css -->
<link href="https://tailwindcomponents.com/css/component.ecommerce-home.css" rel="stylesheet">    

<%@include file="../layout/shopping_header.jsp" %>

<style>
.animated {
	-webkit-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

.animated.faster {
	-webkit-animation-duration: 500ms;
	animation-duration: 500ms;
}

.fadeIn {
	-webkit-animation-name: fadeIn;
	animation-name: fadeIn;
}

.fadeOut {
	-webkit-animation-name: fadeOut;
	animation-name: fadeOut;
}

@keyframes fadeIn {
	from {
		opacity: 0;
	}
		to {
		opacity: 1;
	}
}

@keyframes fadeOut {
	from {
		opacity: 1;
	}
		to {
			opacity: 0;
	}
}
</style>
	
<main class="my-5">
	<div class="container mx-auto px-6">
        
			<!-- 이벤트 상품 -->
			<div class="h-64 rounded-md overflow-hidden bg-cover bg-center" style="background-image: url('https://images.unsplash.com/photo-1577655197620-704858b270ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1280&q=144')">
				<div class="bg-gray-900 bg-opacity-50 flex items-center h-full">
					<div class="px-10 max-w-xl">
						<h2 class="text-2xl text-white font-semibold">이벤트 상품</h2>
						<p class="mt-2 text-gray-400">이벤트 진행중인 상품입니다.</p>
						<button onclick="location.href='<%= request.getContextPath()%>/shopping/list?listno=1'" class="flex items-center mt-4 px-3 py-2 bg-blue-0 text-white text-sm uppercase font-medium rounded hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
							<span>쇼핑 하기</span>
							<svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
						</button>
					</div>
				</div>
			</div>
            
			<!-- 인기상품/신규상품 -->
			<div class="md:flex mt-8 md:-mx-4">
				<!-- 인기상품 -->
				<div class="w-full h-64 md:mx-4 rounded-md overflow-hidden bg-cover bg-center md:w-1/2" style="background-image: url('https://images.unsplash.com/photo-1547949003-9792a18a2601?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')">
					<div class="bg-gray-900 bg-opacity-50 flex items-center h-full">
						<div class="px-10 max-w-xl">
							<h2 class="text-2xl text-white font-semibold">인기 상품</h2>
							<p class="mt-2 text-gray-400">DHT에서 가장 인기많은 상품입니다.</p>
							<button onclick="location.href='<%= request.getContextPath()%>/shopping/list?listno=2'" class="flex items-center mt-4 px-3 py-2 bg-blue-0 text-white text-sm uppercase font-medium rounded hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
								<span>쇼핑 하기</span>
								<svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
							</button>
						</div>
					</div>
				</div>
                
				<!-- 신규 상품 -->
				<div class="w-full h-64 mt-8 md:mx-4 rounded-md overflow-hidden bg-cover bg-center md:mt-0 md:w-1/2" style="background-image: url('https://images.unsplash.com/photo-1486401899868-0e435ed85128?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')">
					<div class="bg-gray-900 bg-opacity-50 flex items-center h-full">
						<div class="px-10 max-w-xl">
							<h2 class="text-2xl text-white font-semibold">신규 상품</h2>
							<p class="mt-2 text-gray-400">새로 등록된 상품입니다.</p>
							<button onclick="location.href='<%= request.getContextPath()%>/shopping/list?listno=3'" class="flex items-center mt-4 px-3 py-2 bg-blue-0 text-white text-sm uppercase font-medium rounded hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
								<span>쇼핑 하기</span>
								<svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
							</button>
						</div>
					</div>
                </div>
			</div><!-- 인기상품/신규상품 end -->
            
			<!-- 운동 보조제 -->
			<div class="mt-16">
				<h3 class="text-gray-600 text-2xl font-medium">운동 보조제</h3>
				<div class="grid gap-6 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 mt-6">
                
					<c:forEach items="${list1}" var="list" begin="0" end="3">
						<div class="w-full max-w-sm mx-auto rounded-md shadow-md overflow-hidden">
							<a href="/shopping/detail?code=${list.code }">
								<div class="flex items-end justify-end h-56 w-full bg-cover" style="background-image: url('<%=request.getContextPath() %>/resources/${list.path }/${list.renamed }.${list.ext }')"></div>
							</a>
							<div class="py-2" style="text-align: right;">
								<button onclick="loadBody('${list.code}');" class="p-2 rounded-full bg-blue-600 text-white mx-5 -mb-4 hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
									<svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
								</button>
							</div>
							<div class="px-5 py-3">
								<h3 class="text-gray-700 uppercase"><a href="/shopping/detail?code=${list.code }">
								<c:if test="${list.event eq 1 }"><span class="bg-yellow-500 text-xs">event</span></c:if>
		                        ${list.name}</a></h3>
		                        
		                        <c:if test="${list.event eq 0 }"><span class="text-gray-500 mt-2"><fmt:formatNumber pattern="#,###" value="${list.price}" />원</span></c:if>
		                        <c:if test="${list.event eq 1 }">
		                        <span class="text-gray-500 mt-2 line-through"><fmt:formatNumber pattern="#,###" value="${list.price}" />원</span>
		                        <span class="text-red-500 mt-2 pl-1"><fmt:formatNumber pattern="#,###" value="${list.price * 0.95}" />원</span>
		                        </c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div><!-- 운동 보조제 end -->
            
			<!-- 운동 기구 -->
			<div class="mt-16">
				<h3 class="text-gray-600 text-2xl font-medium">운동 기구</h3>
				<div class="grid gap-6 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 mt-6">
                
					<c:forEach items="${list2}" var="list" begin="0" end="3">
						<div class="w-full max-w-sm mx-auto rounded-md shadow-md overflow-hidden">
							<a href="/shopping/detail?code=${list.code }">
								<div class="flex items-end justify-end h-56 w-full bg-cover" style="background-image: url('<%=request.getContextPath() %>/resources/${list.path }/${list.renamed }.${list.ext }')"></div>
							</a>
							<div class="py-2" style="text-align: right;">
								<button onclick="loadBody('${list.code}');" class="p-2 rounded-full bg-blue-600 text-white mx-5 -mb-4 hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
									<svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
								</button>
							</div>
							<div class="px-5 py-3">
								<h3 class="text-gray-700 uppercase"><a href="/shopping/detail?code=${list.code }">
								<c:if test="${list.event eq 1 }"><span class="bg-yellow-500 text-xs">event</span></c:if>
		                        ${list.name}</a></h3>
		                        
		                        <c:if test="${list.event eq 0 }"><span class="text-gray-500 mt-2"><fmt:formatNumber pattern="#,###" value="${list.price}" />원</span></c:if>
		                        <c:if test="${list.event eq 1 }">
		                        <span class="text-gray-500 mt-2 line-through"><fmt:formatNumber pattern="#,###" value="${list.price}" />원</span>
		                        <span class="text-red-500 mt-2 pl-1"><fmt:formatNumber pattern="#,###" value="${list.price * 0.95}" />원</span>
		                        </c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div><!-- 운동 기구 end -->
            
			<!-- 다이어트 식품 -->
			<div class="mt-16">
				<h3 class="text-gray-600 text-2xl font-medium">다이어트 식품</h3>
				<div class="grid gap-6 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 mt-6">
                
					<c:forEach items="${list3}" var="list" begin="0" end="3">
						<div class="w-full max-w-sm mx-auto rounded-md shadow-md overflow-hidden">
							<a href="/shopping/detail?code=${list.code }">
								<div class="flex items-end justify-end h-56 w-full bg-cover" style="background-image: url('<%=request.getContextPath() %>/resources/${list.path }/${list.renamed }.${list.ext }')"></div>
							</a>
							<div class="py-2" style="text-align: right;">
								<button onclick="loadBody('${list.code}');" class="p-2 rounded-full bg-blue-600 text-white mx-5 -mb-4 hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
									<svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
								</button>
							</div>
							<div class="px-5 py-3">
								<h3 class="text-gray-700 uppercase"><a href="/shopping/detail?code=${list.code }">
								<c:if test="${list.event eq 1 }"><span class="bg-yellow-500 text-xs">event</span></c:if>
		                        ${list.name}</a></h3>
		                        
		                        <c:if test="${list.event eq 0 }"><span class="text-gray-500 mt-2"><fmt:formatNumber pattern="#,###" value="${list.price}" />원</span></c:if>
		                        <c:if test="${list.event eq 1 }">
		                        <span class="text-gray-500 mt-2 line-through"><fmt:formatNumber pattern="#,###" value="${list.price}" />원</span>
		                        <span class="text-red-500 mt-2 pl-1"><fmt:formatNumber pattern="#,###" value="${list.price * 0.95}" />원</span>
		                        </c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div><!-- 다이어트 식품 end -->
        </div>
        
	<!-- 모달창 -->
	<div class="main-modal fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster"
	style="background: rgba(0,0,0,.7);">
		<div style="max-width: 40rem;"
		class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-md mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">

				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">장바구니 담기</p>
					<div class="modal-close cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
						<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z"></path>
						</svg>
					</div>
				</div>
					
				<!--Body-->
				<div class="my-5" id="modalBody"></div><!-- 모달 body end -->
				
			</div>
		</div>
	</div><!-- 모달창 end -->
	
	<input type="hidden" id="userId" value="${logInInfo.id }"/>
</main>
    
<script>
var sale = 0

const modal = document.querySelector('.main-modal');
const closeButton = document.querySelectorAll('.modal-close');

const modalClose = () => {
	modal.classList.remove('fadeIn');
	modal.classList.add('fadeOut');
	setTimeout(() => {
		modal.style.display = 'none';
	}, 500);
}

const openModal = (code) => {
	modal.classList.remove('fadeOut');
	modal.classList.add('fadeIn');
	modal.style.display = 'flex';
	
	//loadBody(code);
}

for (let i = 0; i < closeButton.length; i++) {
	const elements = closeButton[i];
	elements.onclick = (e) => modalClose();
	modal.style.display = 'none';
	window.onclick = function (event) {
		if (event.target == modal) modalClose();
	}
}
		
const loadBody = (code) => {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '<%=request.getContextPath()%>/shopping/modalload?code='+code);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send();
	xhr.addEventListener('load', function() {
		var data = xhr.response;
		document.querySelector('#modalBody').innerHTML = data;
		openModal(code);
	});
}

const sendOrder = () => {
	var orderForm = document.createElement("form");
	orderForm.setAttribute("method", "get");
	orderForm.setAttribute("action", "<%=request.getContextPath()%>/shopping/payment");
	
	var code = document.createElement("input"); 
	code.setAttribute("type", "hidden"); 
	code.setAttribute("name", "codes"); 
	code.setAttribute("value", document.querySelector("#code").value);

	var sale = document.createElement("input"); 
	sale.setAttribute("type", "hidden"); 
	sale.setAttribute("name", "sale"); 
	sale.setAttribute("value", parseInt(document.querySelector("#sale").value * document.querySelector('#amount').value));
	
	var amount = document.createElement("input"); 
	amount.setAttribute("type", "hidden"); 
	amount.setAttribute("name", "amount"); 
	amount.setAttribute("value", document.querySelector('#amount').value);
	
	var userId = document.createElement("input"); 
	userId.setAttribute("type", "hidden"); 
	userId.setAttribute("name", "userId"); 
	userId.setAttribute("value", document.querySelector('#userId').value);
	
	orderForm.appendChild(code);
	orderForm.appendChild(sale);
	orderForm.appendChild(amount);
	orderForm.appendChild(userId);
	
	document.body.appendChild(orderForm); 
	orderForm.submit();
}

//장바구니 추가
const sendBasket = () => {
	var basketForm = document.createElement("form");
	basketForm.setAttribute("method", "post");
	basketForm.setAttribute("action", "<%=request.getContextPath()%>/shopping/basket");
	
	var code = document.createElement("input"); 
	code.setAttribute("type", "hidden"); 
	code.setAttribute("name", "codes"); 
	code.setAttribute("value", document.querySelector("#code").value);
	
	var amount = document.createElement("input"); 
	amount.setAttribute("type", "hidden"); 
	amount.setAttribute("name", "amount"); 
	amount.setAttribute("value", document.querySelector('#amount').value);
	
	var userId = document.createElement("input"); 
	userId.setAttribute("type", "hidden"); 
	userId.setAttribute("name", "userId"); 
	userId.setAttribute("value", document.querySelector('#userId').value);
	
	basketForm.appendChild(code);
	basketForm.appendChild(amount);
	basketForm.appendChild(userId);
	
	document.body.appendChild(basketForm);
	
	send(event, basketForm);
}

const send = (e,form) => {
	fetch(form.action,{method:'post', body: new FormData(form)})
	.then(function(response) {
		if(response.ok) {
			var con_test = confirm("장바구니에 상품을 담았습니다. \n장바구니로 이동하시겠습니까?");
			if(con_test == true){
				location.href='<%=request.getContextPath()%>/shopping/basket';
			}
			else if(con_test == false){
				modalClose();
			}
		}
	});
	e.preventDefault();
}
</script>

<%@include file="../layout/footer.jsp" %>
