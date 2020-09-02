<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- 장바구니 아이콘 클릭 -->
    <div @mouseleave="cartOpen = !cartOpen" :class="cartOpen ? 'translate-x-0 ease-out' : 'translate-x-full ease-in'" class="z-50 fixed right-0 top-0 max-w-xs w-full h-full px-6 py-4 transition duration-300 transform overflow-y-auto bg-white border-l-2 border-gray-300">
        <div class="flex items-center justify-between">
            <button onclick="location.href='<%=request.getContextPath()%>/shopping/basket'" class="text-2xl font-medium text-gray-700">장바구니</button>
            <button @click="cartOpen = !cartOpen" class="text-gray-600 focus:outline-none">
                <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M6 18L18 6M6 6l12 12"></path></svg>
            </button>
        </div>
        <hr class="my-3">
        
        <!-- 장바구니 아이템 -->
      	 <c:if test="${empty basket }">
		<tr><td colspan="6" class="py-2 text-center font-semibold text-blue-700">장바구니가 비어있습니다</td></tr>
		</c:if>
		<c:if test="${not empty basket }">
		<c:forEach items="${basket }" var="item" varStatus="stat">
        <div class="flex justify-between mt-6">
            <div class="flex">
                <a href="<%= request.getContextPath()%>/shopping/detail?code=${item.code }"><img class="h-20 w-20 object-cover rounded" src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" alt=""></a>
                <div class="mx-3">
                    <h3 class="text-sm text-gray-600"><a href="<%= request.getContextPath()%>/shopping/detail?code=${item.code }">${item.name }</a></h3>
                    <div class="flex items-center mt-2">
                        <span class="text-gray-700 mx-2">${item.amount }</span>
                    </div>
                </div>
            </div>
            <span class="text-gray-600">${item.price }</span>
        </div><!-- 장바구니 아이템 end -->
        </c:forEach>
        </c:if>
        <!-- 결제하기 -->
        <a onclick="location.href='<%=request.getContextPath() %>/shopping/basket'" class="flex items-center justify-center mt-4 px-3 py-2 bg-blue-600 text-white text-sm uppercase font-medium rounded hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
            <span>주문하기</span>
            <svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
        </a>
    </div><!-- 장바구니 아이콘 클릭 end -->
    