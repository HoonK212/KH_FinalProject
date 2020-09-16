<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@include file="../layout/shopping_header.jsp" %>
<style type="text/css">
.bu{
	background: #2d3748;
}
</style>
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
							<input type="checkbox" id="checkAll" class="form-checkbox h-5 w-5 text-blue-600" checked="checked">
							</label>
							<input type="hidden" id="userId" value="${logInInfo.id }">
						</th>
						<th class="text-center" colspan="2">상품 정보</th>
						<th class="hidden text-right md:table-cell">상품 금액</th>
						<th class="lg:text-right text-left pl-5 lg:pl-0">
							<span class="lg:hidden" title="Quantity">수량</span>
							<span class="hidden lg:inline">수량</span>
						</th>
						<th class="text-right" width="15%">합계</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="subTotal" value="0"/>
					<c:set var="startIdx" value="0" />
					
					<c:set var="endIdx" value="0" />
					<c:if test="${empty basket }">
					<tr><td colspan="6" class="py-2 text-center font-semibold text-blue-700">장바구니가 비어있습니다</td></tr>
					</c:if>
					
					<c:if test="${not empty basket }">
					<c:forEach items="${basket }" var="item" varStatus="stat">
					<c:set var="subTotal" value="${subTotal + item.price * item.amount }" />
					<c:set var="startIdx" value="${stat.begin }" />
					<c:set var="endIdx" value="${stat.end }" />
					<tr><td id="empty" colspan="6" class="py-2 text-center font-semibold text-blue-700"></td></tr>
					<tr id="b${stat.index }">
						<td class="text-left pl-5">
							<label class="inline-flex items-center mt-3">
							<input type="checkbox" class="form-checkbox h-5 w-5 text-blue-600" checked="checked" name="checkRow" id="check${stat.index }" value="${item.code }">
							</label>
						</td>
						<td class="hidden pb-4 md:table-cell">
							<a href="<%= request.getContextPath()%>/shopping/detail?code=${item.code }">
							<img src="<%=request.getContextPath() %>/resources/${item.path }/${item.renamed }.${item.ext }" class="h-20 w-20 object-cover rounded" alt="Thumbnail">
							</a>
						</td>
						<td>
							<p class="mb-2 md:ml-4"><a href="<%= request.getContextPath()%>/shopping/detail?code=${item.code }">${item.name }</a></p>
							<button onclick="deleteBasket(${stat.index});" type="button" class="text-gray-700 md:ml-4">
							<small>(삭제하기)</small>
							</button>
						</td>
						<td class="hidden text-right md:table-cell">
							
							<c:if test="${item.event eq 0 }">
							<span class="text-sm lg:text-base font-medium" id="price${stat.index }">${item.price }</span><span class="discount${stat.index }"></span> 원
							</c:if>

							<c:if test="${item.event eq 1 }">
							<span class="text-sm lg:text-base font-medium text-red-500">
							<fmt:formatNumber pattern="###" value="${item.price * 0.95 }" /></span> 원
							<br>
							<span id="price${stat.index }" class="discount${stat.index } text-sm lg:text-base font-medium line-through">${item.price }</span> 원
							</c:if>
							
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
							<c:if test="${item.event eq 0 }">
							<span class="text-sm lg:text-base font-medium" id="total${stat.index }">
							${item.price * item.amount }</span>원
							
							</c:if>

							<c:if test="${item.event eq 1 }">
							<span class="text-sm lg:text-base font-medium" id="total${stat.index }">
							<fmt:formatNumber pattern="###" value="${item.price * item.amount * 0.95 }" /></span> 원
							</c:if>
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		<hr class="pb-6 mt-6">
		<div class="flex mx-auto">
			<button id="selectDel" class="flex justify-center px-10 py-3 font-medium text-white uppercase rounded-full shadow item-center focus:shadow-outline focus:outline-none bu">
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
							총 상품금액
						</div>
						<div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-gray-900">
							<span id="subTotal">${subTotal }</span> 원
						</div>
					</div>
                	<div class="flex justify-between border-b">
						<div class="lg:px-4 lg:py-2 m-2 text-lg lg:text-xl font-bold text-center text-gray-800">
							배송비(+)
						</div>
						<c:if test="${empty basket }">
						<div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-gray-900">
						0 원
						</div>
						</c:if>
					
						<c:if test="${not empty basket }">
						<div id="delivery" class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-gray-900">
							3000 원
						</div>
						</c:if>
					</div>
					<div class="flex justify-between pt-4 border-b">
						<div class="lg:px-4 lg:py-2 m-2 text-lg lg:text-xl font-bold text-center text-gray-800">
							할인금액(-)
						</div>
						<div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-red-500">
							<c:set var="sale" value="0"/>
							<c:forEach items="${basket }" var="item">
							<c:if test="${item.event eq 1 }">
							<c:set var="sale" value="${sale + item.price * item.amount * 0.05 }" />
							</c:if>
							</c:forEach>
							<span id="sale"><fmt:formatNumber pattern="###" value="${sale }" /></span> 원
						</div>
					</div>
					<div class="flex justify-between pt-4 border-b">
						<div class="lg:px-4 lg:py-2 m-2 text-lg lg:text-xl font-bold text-center text-gray-800">
							총 주문금액
						</div>
						
						<c:if test="${empty basket }">
						<div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-green-500">
						0 원
						</div>
						</c:if>
					
						<c:if test="${not empty basket }">
						<div class="lg:px-4 lg:py-2 m-2 lg:text-lg font-bold text-center text-green-500">
							<span id="totalPrice">
							<fmt:formatNumber pattern="###" value="${subTotal + 3000 - sale }" /></span> 원
						</div>
						</c:if>
						
					</div>
					<div class="flex mx-auto justify-center">
						<button onclick="location.href='<%= request.getContextPath()%>/shopping/home'" class="flex justify-center px-10 py-3 my-6 mx-2 font-medium text-white uppercase rounded-full shadow item-center focus:shadow-outline focus:outline-none bu">
							<span class="ml-2 mt-5px">쇼핑 홈 가기</span>
						</button>
						<button id="orderBtn" class="flex justify-center px-10 py-3 my-6 mx-2 font-medium text-white uppercase rounded-full shadow item-center focus:shadow-outline focus:outline-none bu">
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
//장바구니 개별 삭제(AJAX)
function deleteBasket(num){
	
	var code = document.querySelector("#check"+num).value;
	var id = document.querySelector("#userId").value;
	var url = '<%= request.getContextPath()%>/shopping/deletebasket';
	
	var xhr = new XMLHttpRequest();
	
	xhr.open('POST', url);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send('num='+num+'&code='+code+'&id='+id);
	
	xhr.addEventListener('load', function() {
		
		var cssSelector = xhr.response;
		
		if( cssSelector != "fail" ) {
			document.querySelector(cssSelector).outerHTML = '';
			updateTotal();
			
			var length = ${fn:length(basket)};
			var codes = "";
			for(var i=0; i<length; i++) {
				if(document.querySelector("#amount"+i) != null) {
					codes += "i";
				}
			}
			if(codes == "") {
				document.querySelector("#delivery").innerText = '0 원';
				document.querySelector("#totalPrice").innerText = '0';
				document.querySelector("#empty").innerText = '장바구니가 비어있습니다';
			}
		} else {
			alert("장바구니 삭제에 실패했습니다.");
		}
	})
}

function calcPrice(num) {

	var amount = document.querySelector("#amount"+num).value;
	var code = document.querySelector("#check"+num).value;
	var userId = document.querySelector("#userId").value;
	
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '<%=request.getContextPath()%>/shopping/amount?amount='+amount+'&code='+code+'&userId='+userId);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send();
	
	xhr.addEventListener('load', function() {
		console.dir("수량 업데이트 성공")
		
		//수량 변경한 물품 총 가격 업데이트
		document.querySelector("#total"+num).innerText = 
			document.querySelector("#amount"+num).value * document.querySelector("#price"+num).innerText - document.querySelector(".discount"+num).innerText * 0.05;
		
		//전체 가격 총 합 업데이트
		updateTotal();	
	})
}

function updateTotal() {
	var length = ${fn:length(basket)};
	var subTotal = 0;
	var sale = 0;
	
	for(var i=0; i<length; i++) {
		if(document.querySelector("#amount"+i) != null) {
			var total = document.querySelector("#amount"+i).value * document.querySelector("#price"+i).innerText;
			subTotal += total;
			
			if(document.querySelector(".discount"+i).innerText != "") {
				sale += document.querySelector(".discount"+i).innerText * 0.05 * document.querySelector("#amount"+i).value;
			}
		}
	}
	document.querySelector("#sale").innerText = sale;
	document.querySelector("#subTotal").innerText = subTotal;
	document.querySelector("#totalPrice").innerText = subTotal + 3000 - document.querySelector("#sale").innerText;
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	//선택 주문하기
	$("#orderBtn").click(function() {
		// 선택된 체크박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");

		// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		
		var codes = map.get().join(",");
		var sale = parseInt($("#sale").text());

		if(${empty basket} || codes == "") {
			alert('장바구니가 비었습니다.');
			return;
		}
		// 전송 폼
		var $form = $("<form>")
			.attr("action", "<%= request.getContextPath()%>/shopping/payment")
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
			)
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "sale")
					.attr("value", sale)
			);
		$(document.body).append($form);
// 		$form.submit();
	});
});


//선택 삭제하기
$("#selectDel").click(function(){
	// 선택된 체크박스
	var $checkboxes = $("input:checkbox[name='checkRow']:checked");
	// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
	var map = $checkboxes.map(function() {
		return $(this).val();
	});
	var codes = map.get().join(",");
	
	// 전송 폼
	var $form = $("<form>")
		.attr("action", "<%= request.getContextPath()%>/shopping/deletelist")
		.attr("method", "post")
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

var $checkAll = $('#checkAll');
$checkAll.change(function () {
    var $this = $(this);
    var checked = $this.prop('checked');
	
    $('input[name="checkRow"]').prop('checked', checked);
});

var order = $('input[name="checkRow"]');
order.change(function () {
    var orderlength = order.length;
    var checkedLength = $('input[name="checkRow"]:checked').length;
    var selectAll = (orderlength == checkedLength);

    $checkAll.prop('checked', selectAll);
});

</script>
<%@include file="../layout/shopping_footer.jsp" %>