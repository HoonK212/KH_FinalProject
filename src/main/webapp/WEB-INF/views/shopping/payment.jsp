<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- tailwind css -->
<link href="https://tailwindcomponents.com/css/component.ecommerce-checkout.css" rel="stylesheet">

<%@include file="../layout/shopping_header.jsp" %>
<%@include file="../layout/shopping_cart.jsp" %>
<!--  ㅋㅋ 메롱 -->
    <main class="my-5" style="width: 90%; margin: 0 auto;">
    	<div class="container mx-auto px-6">
        	<h3 class="text-gray-700 text-2xl font-medium">주문/결제</h3>
        <br>
            <div class="flex items-center">
	            <button class="flex text-sm text-blue-500 focus:outline-none">
	            	<span class="flex items-center justify-center text-white bg-blue-500 rounded-full h-5 w-5 mr-2">
	            		1</span>장바구니
	            </button>
	            <button class="flex text-sm text-gray-700 ml-8 focus:outline-none">
	            	<span class="flex items-center justify-center border-2 border-blue-500 rounded-full h-5 w-5 mr-2">
	            		2</span> 주문/결제
	            </button>
	            <button class="flex text-sm text-gray-500 ml-8 focus:outline-none" disabled>
	            	<span class="flex items-center justify-center border-2 border-gray-500 rounded-full h-5 w-5 mr-2">
	            		3</span> 완료
	            </button>
            </div>
		<br> 
            <div class="flex flex-col lg:flex-row">
            	<div class="w-full lg:w-1/2 order-2">
            	
                    <form class="mt-8 lg:w-11/12">
                    
                    
                    <!-- ---------------------------------------배송지 선택--------------------------------메롱 -->
                    
                        <div style="margin-top: 0">
                            <h4 class="text-sm text-gray-500 font-medium">배송지 선택</h4>
                            <hr>
                            <div class="ml-6">
                                <div class="flex items-center justify-between bg-white rounded-md 
                                			border-2 p-3 focus:outline-none inline-flex">
                                    <label class="flex items-center">
                                        <input type="radio" onclick="deliveryfunc(0);" id="deliveryBasic" 
                                        		name="delivery" value="basic" class="form-radio h-5 w-5 text-blue-600" checked>
                                        		<span class="ml-2 text-sm text-gray-700">기본 배송지</span>
                                    </label>

                                    <span class="text-gray-600 text-sm"></span>
                                </div>
                               <div class="mt-6 flex items-center justify-between bg-white rounded-md 
											border-2 p-3 focus:outline-none inline-flex" >
                                    <label class="flex items-center">
                                        <input type="radio" onclick="deliveryfunc(1);" id="deliveryNew" 
                                        		name="delivery" value="new" class="form-radio h-5 w-5 text-blue-600">
                                        		<span class="ml-2 text-sm text-gray-700">신규 배송지</span>
                                    </label>

                                    <span class="text-gray-600 text-sm"></span>
                               </div> 
                            </div>
                        </div>
                        
                        
					<!-- ---------------------------------------배송지 정보-------------------------------- -->
                
                        <div class="mt-8" >
                            <h4 class="text-sm text-gray-500 font-medium">배송지 정보</h4>
                            <hr>
                            	<div id="deliveryResult">
<%--                             	<c:if test="(${user.name empty && user.post empty && user.addr empty})"> --%>
<%--                             	<c:if test="(${user.name empty})"> --%>
                            		<div class="text-sm ml-6 text-gray-700 w-5/6 lex items-center 
										justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" >
										신규 배송지를 입력해주세요 
									</div>
<%--                             	</c:if> --%>
<%--                             	<c:if test="(${user.name not empty && user.post not empty && user.addr not empty})"> --%>
                                	<div class="mt-6 flex text-sm ml-6">
                                		console.log(${user.name})
                                		${user.id }
								    	${user.name}
									</div>
									<div class="mt-6 flex text-sm ml-6">
										${user.post}
									</div>
									<div class="mt-6 flex text-sm ml-6">
										${user.addr}
									</div>
									<br>
									<input type="text" class="text-sm ml-6 text-gray-700 w-5/6 lex items-center 
										justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" 
										placeholder="요청사항을 직접 입력합니다.">
<%-- 								</c:if> --%>
										
                             	</div>
                        </div> 
						<br><br><br>
					<!-- ---------------------------------------할인 및 포인트-------------------------------- -->                        
                        
						<div class="mt-8">
                            <h4 class="text-sm text-gray-500 font-medium">할인 및 포인트</h4>
                            <hr>
                           	<div class="mt-6 flex text-sm inline-flex ml-6" >
                          		적립포인트 잔액
                            </div>
                            <div class="mt-6 flex text-sm inline-flex float-right mr-6">
                             	${point} 포인트
                            </div>
						<br><br>
							<button class="flex items-center justify-between bg-white float-right rounded-md  
									border-blue-500 p-2 focus:outline-none mr-6" style="display: inline-flex;">
	                            <label class="flex items-center">
	                                <input type="checkbox" class="form-radio h-5 w-5 text-blue-600" checked>
	                                <span class="ml-2 text-sm text-gray-700">항상 적립포인트 전액 사용</span>
	                            </label>
                             	<span class="text-gray-600 text-sm"></span>
                             </button>
                        <br><br><br>
							<div class="mt-6 inline-flex text-sm mr-6 ml-6">
								사용 포인트 </div>
							<input type="number" class=" w-1/6 mr-6 text-sm text-gray-700 lex items-center justify-between 
									bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none float-right" >
                       	</div>
                    </form>
                </div>
                    
                    
					<!-- ---------------------------------------주문자 정보-------------------------------- -->                    
                    
                <div class="w-full mb-8 flex-shrink-0 order-1 lg:w-1/2 lg:mb-0 lg:order-2 mt-8">
                    <div class=" justify-center lg:justify-end details">
                        <div class="border rounded-md w-full px-4 py-10 ">
                            <div class="flex items-center justify-between">
                                <h3 class="text-gray-700 font-medium">주문자 정보</h3>
                            </div>
                            <div class="flex justify-between mt-6">
                                <div class="flex">
                                    <img class="h-20 w-20 object-cover rounded" 
                                    		src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?
                                    			ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" 
                                    			alt="">
                                    <div class="mx-3">
                                        <h3 class="text-sm text-gray-600">이름 : </h3><h3>${user.name}</h3>
                                        <h3 class="text-sm text-gray-600">전화번호 :</h3><h3>${user.tel}</h3>
                                        <h3 class="text-sm text-gray-600">이 메 일 :</h3><h3>${user.mail}</h3>
                                    </div>
                                </div>
                            </div>  
                           <br> 
                            <div class="mx-3">
                            	<h3 class="text-sm text-gray-600 ">주문자 정보로 결제관련 정보가 제공됩니다.
                            	<br>정확한 정보로 등록되어있는지 확인해주세요.</h3>
                            </div>           
                    	</div>
                       <br><br>                    	
                    	
                    	
					<!-- ---------------------------------------주문정보-------------------------------- -->
						<c:set var="total" value="0"></c:set>
                        <c:forEach items="${product}" var="product">
                       		<c:set var="price" value="${product.price * product.amount }"></c:set>
                        		<div class="border rounded-md w-full px-4 py-10">
                            		<div class="flex items-center justify-between">
                                		<h3 class="text-gray-700 font-medium">주문 정보</h3>
                            		</div>
                            	<div class="flex justify-between mt-6 ">
                                	<div class="flex w-full">
                                    	<img class="h-20 w-20 object-cover rounded" src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" alt="">
                                		<div class="flex w-full justify-between">
                                   			<div class="mx-3">
		                                        <h3 class="text-sm text-gray-600 ">상품정보</h3>
		                                        <h3 class="text-sm text-gray-600">판매자 </h3>
		                                        <h3 class="text-sm text-gray-600">수량 </h3>
		                                        <h3 class="text-sm text-gray-600">할인 </h3>
		                                        <div class="flex items-center mt-2">
                                        		</div>
                                    		</div>
                                    		<div class="mx-3 float-right">
		                                        <h3 class="text-sm text-gray-600 float-right">${product.name} </h3>
		                                        <h3 class="text-sm text-gray-600">${product.company}</h3>
		                                        <h3 class="text-sm text-gray-600">${product.amount}</h3>
		                                        <h3 class="text-sm text-gray-600">${product.price}원</h3>
		                                        <div class="flex items-center mt-2">
		                                        </div>
                                    		</div>
                                   		</div>
                                	</div>
                            	</div>
                                <span class="text-gray-600 float-right">주문 금액 ${price}원</span>
                        	</div>
                        	
                        	<c:set var="total" value="${total + price}"></c:set>
                      </c:forEach>
                    </div>
                </div>  
            </div>
        </div>
       <br><br><br>
       
					<!-- ---------------------------------------결제 총액-------------------------------- -->
        
        <div class="container mx-auto px-6">
        	<div class="border rounded-md w-full px-4 py-10">
				<div class="flex items-center justify-between w-full">
				    <h3 class="text-gray-700 font-medium">결제 금액</h3>
				</div>
				<div class="flex justify-between mt-6">
					<div class="flex w-full justify-between">
				    	<div class="mx-3">
				        	<h3 class="text-sm text-gray-600">총 상품금액</h3>
				            <br>
				            <h3 class="text-sm text-gray-600">배송비(+)</h3> 
				            <h3 class="text-sm text-gray-600">할인금액(-)</h3> 
				            <h3 class="text-sm text-gray-600">적립포인트 사용(-)</h3> 
				        </div>
                        <div class="mx-3">
                        	<h3 class="text-sm text-gray-600">${total - point - 3000}</h3>
                            <br>
                            <h3 class="text-sm text-gray-600">3,000원</h3>
                            <h3 class="text-sm text-gray-600">0원</h3>
                            <h3 class="text-sm text-gray-600">${point }포인트</h3>
                        </div>
					</div>
				</div>
			<br>
			</div>
			<br>
			<button class="flex items-center justify-between bg-white w-full rounded-md border-2 border-blue-500 p-4 focus:outline-none" style="display: inline-flex;">
				<label class="flex items-center">
				    <input id = "necessary" type="checkbox" class="form-radio h-5 w-5 text-blue-600" ><span class="ml-2 text-sm text-gray-700">위 상품의 구매조건 확인 및 결제진행 동의</span>
				</label>
				<span class="text-gray-600 text-sm"></span>
			</button>
		<br><br>
			<div class=" items-center justify-between">
				<button class="flex items-center text-gray-700 text-sm font-medium rounded hover:underline focus:outline-none float-left">
				    <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M7 16l-4-4m0 0l4-4m-4 4h18"></path></svg>
				    <span class="mx-2">이전</span>
				</button>
                <button onclick="requestPayment();" id="pay" disabled="disabled" class="flex items-center px-3 py-2 bg-blue-600 text-white text-sm font-medium rounded-md focus:outline-none focus:bg-blue-500 float-right">
                    <span>결제</span>
                    <svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
                </button>      
         <br><br><br>
        	</div>
    	</main>
    	
<script type="text/javascript">
$(document).ready(function(){
	
    $("#necessary").change(function(){
    	
    	console.log("체크")
    	console.log('${logInInfo.id}')
    	console.log('${logInInfo.name}')
/*     	
    	console.log("버튼클릭")
    		if( !( $("#necessary").is(":checked") )){
    			alert('구매 동의 체크 해주세요.')
    		}
    	
    	 */
    	
        if($("#necessary").is(":checked")){
        	
            $("#pay").prop('disabled', false);
            
        }else{
        	$("#pay").prop('disabled', true);
        }
    });
});
</script>
    
<script type="text/javascript">

var xmlHttp = null;

function deliveryfunc(num){
	
	 xmlHttp = new XMLHttpRequest();
	
	xmlHttp.onreadystatechange = callback;
	xmlHttp.open("GET", "<%=request.getContextPath()%>/shopping/delivery?num="+num);
	xmlHttp.send();
}

function callback(){
	
	if(xmlHttp.readyState == 4 || xmlHttp.status == 200){
		
		console.log("정상")
		printDelivery();
	}
	
	function printDelivery(){
		console.log("하이")
		deliveryResult.innerHTML = xmlHttp.responseText;
	}
	
}
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(document).ready(function() {
	// iamport 변수 초기화
	var IMP = window.IMP;
	IMP.init('imp06064630');	// 가맹점 식별코드, 회원가입해서 직접 넣어야합니다

});
</script>

<script>
function requestPayment() {

	IMP.request_pay({
	    pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
	    pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
    	name : '주문명 : ' + '${product[0].name}', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성 
	    amount : 10, //결제금액 - 필수항목
	   /*  buyer_email : 'iamport@siot.do', //주문자Email - 선택항목
	    buyer_name : '구매자이름', //주문자명 - 선택항목 */
	    buyer_tel : '010-1234-5678' //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
	   /*  buyer_addr : '서울특별시 강남구 삼성동', //주문자주소 - 선택항목
	    buyer_postcode : '123-456', //주문자우편번호 - 선택항목 */
	    
	   // m_redirect_url : 'https://www.yourdomain.com/payments/complete' //모바일결제후 이동페이지 - 선택항목, 모바일에서만 동작
	    
	}, function(rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
	    if ( rsp.success ) { // 결제 성공 로직
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        msg += '[rsp.success]';

	        
	        // 결제 완료 처리 로직
			//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		 jQuery.ajax({
				url: "<%=request.getContextPath()%>/shopping/paymentComplete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
				type: 'POST',
				dataType: 'json',
				data: {
					// rsp객체를 통해 전달된 데이터를 DB에 저장할 때 사용한다
					imp_uid : rsp.imp_uid
				} 
	
			}).done(function(data) {
				//[2] 서버에서의 응답 처리
				if ( data == 'success' ) {
					var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\n결제 금액 : ' + rsp.paid_amount;
					msg += '\n카드 승인번호 : ' + rsp.apply_num;
			        msg += '\n[done]';

					alert(msg);
					move();
					
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    			
	    		}
	    	});
	        
	    } else { // 결제 실패 로직
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}

function move(){
	console.log("오긴 오니")
	location.href="<%=request.getContextPath()%>/shopping/paymentComplete"
}

</script>

<%@include file="../layout/shopping_footer.jsp" %>