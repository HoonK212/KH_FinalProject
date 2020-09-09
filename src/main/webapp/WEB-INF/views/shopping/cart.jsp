<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

		<!-- 장바구니 아이템 -->
		<c:if test="${empty basket }">
			<tr><td colspan="6" class="py-2 text-center font-semibold text-blue-700">장바구니가 비어있습니다</td></tr>
		</c:if>
				
		<c:if test="${not empty basket }">
			<c:forEach items="${basket }" var="item" varStatus="stat">
				<div class="flex justify-between mt-6">
		            <div class="flex">
		                <a href="<%= request.getContextPath()%>/shopping/detail?code=${item.code }"><img class="h-20 w-20 object-cover rounded" src="<%=request.getContextPath() %>/resources/${item.path }/${item.renamed }.${item.ext }" alt="Thumbnail"></a>
		                <div class="mx-3">
		                    <h3 class="text-sm text-gray-600"><a href="<%= request.getContextPath()%>/shopping/detail?code=${item.code }">${item.name }</a></h3>
		                    <div class="flex items-center mt-2">
		                        <span class="text-gray-700 mx-2">${item.amount }</span>
		                    </div>
		                </div>
		            </div>
		            <span class="text-gray-600"><fmt:formatNumber pattern="#,###" value="${item.price }" /> 원</span>
		        </div><!-- 장바구니 아이템 end -->
			</c:forEach>
		</c:if>		