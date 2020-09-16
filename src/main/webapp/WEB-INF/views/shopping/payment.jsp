<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- tailwind css -->
<link href="https://tailwindcomponents.com/css/component.ecommerce-checkout.css" rel="stylesheet">

<%@include file="../layout/shopping_header.jsp" %>

    <main class="my-5" style="width: 90%; margin: 0 auto;">
    	<div class="container mx-auto px-6">
        	<h3 class="text-gray-700 text-2xl font-medium">주문/결제</h3>
        <br>
            <div class="flex items-center">
	           	<span class="flex items-center justify-center text-white bg-blue-500 rounded-full h-5 w-5 mr-2 ml-4">
	           		1</span>장바구니
	           	<span class="flex items-center justify-center border-2 border-blue-500 rounded-full h-5 w-5 mr-2 ml-4">
	           		2</span> 주문/결제
	           	<span class="flex items-center justify-center border-2 border-gray-500 rounded-full h-5 w-5 mr-2 ml-4">
	           		3</span> 완료
            </div>
		<br> 
            <div class="flex flex-col lg:flex-row">
            	<div class="w-full lg:w-1/2 order-2 mr-8">
            	
<!--                     <form class="mt-8 lg:w-11/12"> -->
                    
                    
                    <!-- ---------------------------------------배송지 선택-------------------------------- -->
                    
                        <div style="margin-top: 0">
                            <h4 class="text-sm text-gray-500 font-bold">배송지 선택</h4>
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
                            <h4 class="text-sm text-gray-500 font-bold">배송지 정보</h4>
                            <hr>
                            	<div id="deliveryResult" >
<%--                             	<c:if test="(${empty logInInfo.name or empty logInInfo.post or empty logInInfo.addr})"> --%>
<!--                             		<div class="text-sm ml-6 text-gray-700 w-5/6 lex items-center  -->
<!-- 										justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" > -->
<!-- 										신규 배송지를 입력해주세요  -->
<!-- 									</div> -->
<%--                             	</c:if> --%>
<%--                             	<c:if test="(${not empty logInInfo.name and not empty logInInfo.post and not empty logInInfo.addr})"> --%>
                                    
								    <br>
								
								<div class="flex items-center justify-between bg-white rounded-md 
								 			border-2 p-3 focus:outline-none mr-6 ml-6"> 
								    <label class="flex items-center">
								        <span class="ml-2 text-sm text-gray-700">수령인</span>
								    </label>
								    <span class="text-gray-600 text-sm">${logInInfo.name}</span>
								</div>
								<br>
								<div class="flex items-center justify-between bg-white rounded-md 
								 			border-2 p-3 focus:outline-none mr-6 ml-6">
								    <label class="flex items-center">
								        <span class="ml-2 text-sm text-gray-700">우편번호</span>
								    </label>
								    <span class="text-gray-600 text-sm">${logInInfo.post}</span>
								</div>
								<br>
								<div class="flex items-center justify-between bg-white rounded-md 
								 			border-2 p-3 focus:outline-none mr-6 ml-6">
								    <label class="flex items-center">
								        <span class="ml-2 text-sm text-gray-700">상세주소</span>
								    </label>
								    <span class="text-gray-600 text-sm">${logInInfo.addr}</span>
								</div>
								
								<br>
<!-- 									<input type="text" class="text-sm ml-6 text-gray-700 w-5/6 lex items-center  -->
<!-- 										justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none"  -->
<!-- 										placeholder="요청사항을 직접 입력합니다."> -->
<%-- 								</c:if> --%>
										
                             	</div>
                        </div> 
						<br>
					<!-- ---------------------------------------할인 및 포인트-------------------------------- -->                        
                        
						<div class="mt-8">
                            <h4 class="text-sm text-gray-500 font-bold">할인 및 포인트</h4>
                            <hr>
                           	<div class="mt-6 flex text-sm inline-flex ml-6" >
                          		적립포인트 잔액
                            </div>
                            <div class="mt-6 flex text-sm inline-flex float-right mr-6">
                             	${point} 포인트
                            </div>
						<br><br>
	                            <label class="flex items-center float-right mr-6">
	                                <input type="checkbox" id="usePointCheck" class="form-radio h-5 w-5 text-blue-600"/>
	                                <span class="ml-2 text-sm text-gray-700">적립포인트 전액 사용</span>
	                            </label>
                        <br><br><br>
							<div class="mt-6 inline-flex text-sm mr-6 ml-6">
								사용 포인트 </div>
							<input id="usePoint" type="number" max="${point}" min="0" value="0" class=" w-1/6 mr-6 text-sm text-gray-700 lex items-center justify-between 
									bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none float-right" placeholder="포인트">
                       	</div>
<!--                     </form> -->
                </div>
                    
                    
					<!-- ---------------------------------------주문자 정보-------------------------------- -->                    
                    
                <div class="w-full mb-8 flex-shrink-0 order-1 lg:w-1/2 lg:mb-0 lg:order-2 mt-8 ml-8">
                    <div class=" justify-center lg:justify-end details">
                        <div class="border rounded-md w-full px-4 py-10 ">
                            <div class="flex items-center justify-between">
                                <h3 class="text-gray-700 font-bold">주문자 정보</h3>
                            </div>
                            <div class="flex justify-between mt-6">
                                <div class="flex">
                                    <img class="h-25 w-40 object-cover rounded" 
                                    		src="<%=request.getContextPath() %>/resources/${logInPic.path}/${logInPic.renamed}.${logInPic.ext}" 
                                    			alt="">
                                    <div class="mx-8">
                                        <h3 class="text-sm text-gray-600">이름</h3>
                                        <h3>${logInInfo.name}</h3>
                                        <br>
                                        <h3 class="text-sm text-gray-600">전화번호</h3>
                                        <h3>${logInInfo.tel}</h3>
                                        <br>
                                        <h3 class="text-sm text-gray-600">이메일</h3>
                                        <h3>${logInInfo.mail}</h3>
                                    </div>
                                </div>
                            </div>  
                           <br><br>
                            <div class="mx-1">
                            	<h3 class="text-sm text-blue-500 font-semibold">
                            	주문자 정보로 결제관련 정보가 제공됩니다. 정확한 정보로 등록되어있는지 확인해주세요.</h3>
                            </div>           
                    	</div>
                       <br>                   	
                    	
                    	
					<!-- ---------------------------------------주문정보-------------------------------- -->
						<c:set var="total" value="0"></c:set>
						
                        
                       		
                        		<div class="border rounded-md w-full px-4 py-10">
                            		<div class="flex items-center justify-between">
                                		<h3 class="text-gray-700 font-bold -webkit-text-stroke: medium">주문 정보</h3>
                            		</div>
                        <c:forEach items="${product}" var="product">
                       		<c:set var="price" value="${product.price * product.amount }"></c:set>
                        			<div>
                            	<div class="flex justify-between mt-6 ">
                                	<div class="flex w-full">
                                    	<img class="h-25 w-40 object-cover rounded" src="<%=request.getContextPath() %>/resources/${product.path }/${product.renamed }.${product.ext }" alt="">
                                		<div class="flex w-full justify-between">
                                   			<div class="mx-8">
		                                        <h3 class="text-sm text-gray-600 ">상품정보</h3>
		                                        <br>
		                                        <h3 class="text-sm text-gray-600">판매자 </h3>
		                                        <br>
		                                        <h3 class="text-sm text-gray-600">수량 </h3>
		                                        <br>
		                                        <h3 class="text-sm text-gray-600">금액 </h3>
		                                        <div class="flex items-center mt-2">
                                        		</div>
                                    		</div>
                                    		<div class="mx-8 float-right">
		                                        <h3 class="text-sm text-gray-600 float-right">${product.name} </h3>
		                                        <br>
		                                        <br>
		                                        <h3 class="text-sm text-gray-600">${product.company}</h3>
		                                        <br>
		                                        <h3 class="text-sm text-gray-600">${product.amount}</h3>
		                                        <br>
		                                        <h3 class="text-sm text-gray-600">${product.price}원</h3>
		                                        <div class="flex items-center mt-2">
		                                        </div>
                                    		</div>
                                   		</div>
                                	</div>
                            	</div>
                            	<br>
                                <span class="text-gray-600 float-right mx-8 font-bold">총 주문 금액 ${price}원</span>
                                </div>
                                <br><br>
                        	<c:set var="total" value="${total + price}"></c:set>
                      </c:forEach>
                        	</div>
                        	
                    </div>
                </div>  
            </div>
        </div>
       <br><br><br>
       
					<!-- ---------------------------------------결제 총액-------------------------------- -->
        
        <div class="container mx-auto px-6">
        	<div class="border rounded-md w-full px-4 py-10">
				<div class="flex items-center justify-between w-full">
				    <h3 class="text-gray-700 font-bold">결제 금액</h3>
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
						<c:set var="totalPayment" value="${total  + 3000}"></c:set>
						
                        	<h3 id="totalLoc" class="text-sm text-gray-600">${totalPayment} 원</h3>
                            <br>
                            <h3 class="text-sm text-gray-600">3,000원</h3>
                            <h3 class="text-sm text-gray-600">${sale}원</h3>
                            <h3 id="usePointLoc" class="text-sm text-gray-600">0 포인트</h3>
                        </div>
					</div>
				</div>
			<br>
			</div>
		
			<br>
			<div class="flex items-center justify-between bg-white w-full rounded-md border-2 border-blue-500 p-4 focus:outline-none" style="display: inline-flex;">
				<label class="flex items-center">
				    <input id = "necessary" type="checkbox" class="form-radio h-5 w-5 text-blue-600" /><span class="ml-2 text-sm text-gray-700 font-bold">위 상품의 구매조건 확인 및 결제진행 동의</span>
				<span class="text-gray-600 text-sm"></span>
				</label>
			</div>
		<br><br>
			<div class=" items-center justify-between">
				<button type="button" onclick="javascript:history.go(-1)" class="flex items-center text-gray-700 text-sm font-medium rounded hover:underline focus:outline-none float-left">
				    <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M7 16l-4-4m0 0l4-4m-4 4h18"></path></svg>
				    <span class="mx-2">이전</span>
				</button>
                <button onclick="requestPayment();" id="pay" class="flex items-center px-3 py-2 bg-blue-600 text-white text-sm font-medium rounded-md focus:outline-none focus:bg-blue-500 float-right">
                    <span>결제</span>
                    <svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
                </button>

         <br><br><br>
        	</div>
        </div>
    	</main>
  
<script type="text/javascript">  	
   	$("#usePointCheck").click(function(){
   		
   		if($("#usePointCheck").is(":checked")){
   			$("#usePoint").val(${point})
   			$("#usePointLoc").text(${point}+" 포인트")
   			$("#totalLoc").text(${totalPayment}-$('#usePoint').val()+" 원")
   		}else{
   			$("#usePoint").val('')
   			$("#usePointLoc").text('')
			$("#totalLoc").text(${totalPayment}+" 원")
   		}
   	})
   	
   	$("#usePoint").change(function(){
   		
   		if(($("#usePoint").val() >= 0) && ($("#usePoint").val() <= ${point})){
	   		$("#usePointLoc").text($("#usePoint").val()+" 포인트")
	   		$("#totalLoc").text(${totalPayment}-$('#usePoint').val()+" 원")
   		}else if($("#usePoint").val() < 0){
   			alert("잘못된 입력 형식입니다.")
   			$("#usePoint").val('')
   		}else{
   			alert("보유포인트가 부족합니다.")
   			$("#usePoint").val('')
   		}
   	})
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
	IMP.init('imp56588598');	// 가맹점 식별코드, 회원가입해서 직접 넣어야합니다

});
</script>

<script>
function requestPayment() {
	
	if($("#necessary").is(":checked")){
		console.log("활성화하렴")
		$("#pay").prop('disabled', false);
	}else{
		console.log("비활성화하렴")
		alert("구매조건 확인 및 결제진행 동의 체크 사항은 필수입니다.")
		return;
	}
	
	
	IMP.request_pay({
	    pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
	    pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
    	name : '주문명 : ' + '${product[0].name}', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성 
	    amount : 10, //${totalPayment},	//결제금액 - 필수항목
	    buyer_email : '${logInInfo.mail}', //주문자Email - 선택항목
	    buyer_name : '${logInInfo.name}', //주문자명 - 선택항목 
	    buyer_tel : '${logInInfo.tel}', //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
	   	buyer_addr : '${logInInfo.addr}', //주문자주소 - 선택항목
	    buyer_postcode : '${logInInfo.post}', //주문자우편번호 - 선택항목 
	    
	   // m_redirect_url : 'https://www.yourdomain.com/payments/complete' //모바일결제후 이동페이지 - 선택항목, 모바일에서만 동작
	    
	}, function(rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
	    if ( rsp.success ) { // 결제 성공 로직
	        var msg = '결제가 완료되었습니다. 저거니';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        msg += '[rsp.success]';

	        
	        // 결제 완료 처리 로직
			//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			jQuery.ajax({
					url: "/shopping/paymentCheck", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
					type: 'POST',
					dataType: 'json',
					contentType:'application/json',
					data: JSON.stringify({
						imp_uid : rsp.imp_uid,
						name : $('#toName').val(),
						tel : $('#toTel').val(),
						post :$('#sample4_postcode').val(),
						addr : $("#sample4_roadAddress").val()+" "+$("#sample4_detailAddress").val(),
						product : '${product}',
// 						info : '${logInInfo}',
						point : $('#usePoint').val()
						//기타 필요한 데이터가 있으면 추가 전달
						})
				}).done(function(data) {
				//[2] 서버에서의 응답 처리
					if ( data == 'success' ) {
						var msg = '결제가 완료되었습니다. 이거니';
						msg += '\n고유ID : ' + rsp.imp_uid;
						msg += '\n상점 거래ID : ' + rsp.merchant_uid;
						msg += '\n결제 금액 : ' + rsp.paid_amount;
						msg += '\n카드 승인번호 : ' + rsp.apply_num;
				        msg += '\n[done]';
	
						alert(msg);
	    			} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    			}
	    		});
			location.href="/shopping/paymentComplete";
	        
	    } else { // 결제 실패 로직
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	});
}

</script>

<%@include file="../layout/shopping_footer.jsp" %>