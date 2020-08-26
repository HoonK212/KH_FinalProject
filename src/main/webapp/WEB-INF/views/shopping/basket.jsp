<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../layout/shopping_header.jsp" %>
<%@include file="../layout/shopping_cart.jsp" %>

<link href="https://tailwindcomponents.com/css/component.ecommerce-product.css" rel="stylesheet">
<link href="https://tailwindcomponents.com/css/component.checkboxes.css" rel="stylesheet">
    
    <main class="my-5">
	<div class="container mx-auto px-6">
	  <div class="flex flex-col w-full p-8 text-gray-800 bg-white shadow-lg pin-r pin-y mx-auto">
	    <p class="text-2xl font-medium px-4">장바구니</p>
	    <hr class="pb-3 mt-4">
	    <div class="flex-1">
	      <table class="w-full text-sm lg:text-base" cellspacing="0">
	        <thead>
	          <tr class="h-12 uppercase">
	          	<th class="text-left pl-5">
		          	<label class="inline-flex items-center mt-3">
	                <input type="checkbox" id="checkAll" onclick="checkAll();" class="form-checkbox h-5 w-5 text-blue-600" checked="checked">
		            </label>
		            
		            <input type="hidden" id="userId" value="${logInInfo.id }">
		        </th>
	            <th class="text-center" colspan="2">상품 정보</th>
	            <th class="hidden text-right md:table-cell">상품 금액</th>
	            <th class="lg:text-right text-left pl-5 lg:pl-0">
	              <span class="lg:hidden" title="Quantity">Qtd</span>
	              <span class="hidden lg:inline">수량</span>
	            </th>
	            <th class="text-right">합계</th>
	          </tr>
	        </thead>
	        <tbody>
	          
		          <c:if test="${empty basket }">
		          	<tr><td>장바구니가 비어있습니다</td></tr>
		          </c:if>
	          
	          <c:forEach items="${basket }" var="item" varStatus="stat">
	          	<tr>
	          	<td class="text-left pl-5">
		          	<label class="inline-flex items-center mt-3">
	                <input type="checkbox" class="form-checkbox h-5 w-5 text-blue-600" checked="checked" name="checkRow" id="check${stat.index }" value="${item.code }">
		            </label>
		        </td>
	            <td class="hidden pb-4 md:table-cell">
	              <a href="#">
	                <img src="https://limg.app/i/Calm-Cormorant-Catholic-Pinball-Blaster-yM4oub.jpeg" class="w-20 rounded" alt="Thumbnail">
	              </a>
	            </td>
	            <td>
	              <a href="#">
	                <p class="mb-2 md:ml-4">${item.name }</p>
	                
	                <form action="/shopping/bdelete" method="POST">
	                  <button type="submit" class="text-gray-700 md:ml-4">
	                    <small>(삭제하기)</small>
	                  </button>
	                </form>
	                
	              </a>
	            </td>
	             <td class="hidden text-right md:table-cell">
	              <span class="text-sm lg:text-base font-medium" id="price${stat.index }">
	                ${item.price }
	              </span>
	            </td>
	            <td class="justify-center md:justify-end md:flex mt-6">
	              <div class="w-20 h-10">
	                <div class="relative flex flex-row w-full h-8">
	                <input type="number" id="amount${stat.index }" min="1" value="${item.amount }" onchange="calcPrice(${stat.index });"
	                  class="w-full font-semibold text-center text-gray-700 bg-gray-200 outline-none focus:outline-none hover:text-black focus:text-black" />
	                </div>
	              </div>
	            </td>
	            <td class="text-right">
	              <span class="text-sm lg:text-base font-medium" id="total${stat.index }">
	                ${item.price * item.amount }
	              </span>
	            </td>
	          </tr>
	          <c:set var="totalPrice" value="${totalPrice + info.donationPrice }" />
	          </c:forEach>
	        </tbody>
	      </table>
	      <hr class="pb-6 mt-6">
	      
	      <div class="flex mx-auto">
   			<button class="flex justify-center px-10 py-3 font-medium text-white uppercase bg-gray-800 rounded-full shadow item-center hover:bg-gray-700 focus:shadow-outline focus:outline-none">
               <span class="ml-2 mt-5px">선택 삭제</span>
             </button>
	      </div>
	      
	      <div class="my-4 mt-6 -mx-2 lg:flex">
	        <div class="w-full">
	          <div class="p-4 bg-gray-100 rounded-full text-center">
	            <h1 class="ml-2 font-bold uppercase">주문 상세</h1>
	          </div>
	          <div class="p-4">
	              <div class="flex justify-between border-b">
	                <div class="lg:px-4 lg:py-2 m-2 text-lg lg:text-xl font-bold text-center text-gray-800">
	                  Subtotal
	                </div>
	                <div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-gray-900">
	                  148,827.53€
	                </div>
	              </div>
	                <div class="flex justify-between pt-4 border-b">
	                  <div class="flex lg:px-4 lg:py-2 m-2 text-lg lg:text-xl font-bold text-gray-800">
	                    <form action="" method="POST">
	                      <button type="submit" class="mr-2 mt-1 lg:mt-2">
	                        <svg aria-hidden="true" data-prefix="far" data-icon="trash-alt" class="w-4 text-red-600 hover:text-red-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M268 416h24a12 12 0 0012-12V188a12 12 0 00-12-12h-24a12 12 0 00-12 12v216a12 12 0 0012 12zM432 80h-82.41l-34-56.7A48 48 0 00274.41 0H173.59a48 48 0 00-41.16 23.3L98.41 80H16A16 16 0 000 96v16a16 16 0 0016 16h16v336a48 48 0 0048 48h288a48 48 0 0048-48V128h16a16 16 0 0016-16V96a16 16 0 00-16-16zM171.84 50.91A6 6 0 01177 48h94a6 6 0 015.15 2.91L293.61 80H154.39zM368 464H80V128h288zm-212-48h24a12 12 0 0012-12V188a12 12 0 00-12-12h-24a12 12 0 00-12 12v216a12 12 0 0012 12z"/></svg>
	                      </button>
	                    </form>
	                    Coupon "90off"
	                  </div>
	                  <div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-green-700">
	                    -133,944.77€
	                  </div>
	                </div>
	                <div class="flex justify-between pt-4 border-b">
	                  <div class="lg:px-4 lg:py-2 m-2 text-lg lg:text-xl font-bold text-center text-gray-800">
	                    New Subtotal
	                  </div>
	                  <div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-gray-900">
	                    14,882.75€
	                  </div>
	                </div>
	                <div class="flex justify-between pt-4 border-b">
	                  <div class="lg:px-4 lg:py-2 m-2 text-lg lg:text-xl font-bold text-center text-gray-800">
	                    Tax
	                  </div>
	                  <div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-gray-900">
	                    2,976.55€
	                  </div>
	                </div>
	                <div class="flex justify-between pt-4 border-b">
	                  <div class="lg:px-4 lg:py-2 m-2 text-lg lg:text-xl font-bold text-center text-gray-800">
	                    Total
	                  </div>
	                  <div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-gray-900">
	                    17,859.3€
	                  </div>
	                </div>
	              <div class="flex mx-auto justify-center">
		   			<button class="flex justify-center px-10 py-3 my-6 mx-2 font-medium text-white uppercase bg-gray-800 rounded-full shadow item-center hover:bg-gray-700 focus:shadow-outline focus:outline-none">
		               <span class="ml-2 mt-5px">쇼핑 홈 가기</span>
		             </button>
		             <button class="flex justify-center px-10 py-3 my-6 mx-2 font-medium text-white uppercase bg-gray-800 rounded-full shadow item-center hover:bg-gray-700 focus:shadow-outline focus:outline-none" id="orderBtn">
		               <span class="ml-2 mt-5px">선택 주문</span>
		             </button>
			      </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>		

    </main>
 
<script type="text/javascript">

function calcPrice(num) {
	document.querySelector("#total"+num).innerText = document.querySelector("#amount"+num).value * document.querySelector("#price"+num).innerText
	
	var amount = document.querySelector("#amount"+num).value;
	var code = document.querySelector("#check"+num).value;
	
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '<%=request.getContextPath()%>/shopping/amount?amount='+amount+"&code="+code);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send();
	
	xhr.addEventListener('load', function() {
		console.dir("수량 업데이트 성공")
	})
}

// function orderSubmit() {
	
// 	var orderForm = document.createElement("form");
// 	orderForm.setAttribute("method", "post");
// 	orderForm.setAttribute("action", "/shopping/payment");
	
// 	var length = ${fn:length(basket)};
	
// 	for(var i=0; i<length; i++) {
// 		if(document.querySelector("#check"+i).checked) {
// 			var code = document.createElement("input");
// 		}
// 	}
// }
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#orderBtn").click(function() {
		// 선택된 체크박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");

		// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		var codes = map.get().join(",");

		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/shopping/payment")
			.attr("method", "get")
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "userId")
					.attr("value", $("#userId").val())
			)
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "codes")
					.attr("value", codes)
			);
		$(document.body).append($form);
		$form.submit();

	});
});

//전체 체크/해제
function checkAll() {
	// checkbox들
	var $checkboxes=$("input:checkbox[name='checkRow']");

	// checkAll 체크상태 (true:전체선택, false:전체해제)
	var check_status = $("#checkAll").is(":checked");
	
	if( check_status ) {
		// 전체 체크박스를 checked로 바꾸기
		$checkboxes.each(function() {
			this.checked = true;	
		});
	} else {
		// 전체 체크박스를 checked 해제하기
		$checkboxes.each(function() {
			this.checked = false;	
		});
	}
}

</script>
<%@include file="../layout/shopping_footer.jsp" %>