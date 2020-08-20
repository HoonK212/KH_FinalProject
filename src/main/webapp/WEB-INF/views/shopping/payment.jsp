<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- tailwind css -->
<link href="https://tailwindcomponents.com/css/component.ecommerce-checkout.css" rel="stylesheet">

<%@include file="../layout/shopping_header.jsp" %>
<%@include file="../layout/shopping_cart.jsp" %>

<!--      <div :class="cartOpen ? 'translate-x-0 ease-out' : 'translate-x-full ease-in'" class="fixed right-0 top-0 max-w-xs w-full h-full px-6 py-4 transition duration-300 transform overflow-y-auto bg-white border-l-2 border-gray-300">
        <div class="flex items-center justify-between">
            <h3 class="text-2xl font-medium text-gray-700">장바구니</h3>
            <button @click="cartOpen = !cartOpen" class="text-gray-600 focus:outline-none">
                <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M6 18L18 6M6 6l12 12"></path></svg>
            </button>
        </div>
        <hr class="my-3">
        <div class="flex justify-between mt-6">
            <div class="flex">
                <img class="h-20 w-20 object-cover rounded" src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" alt="">
                <div class="mx-3">
                    <h3 class="text-sm text-gray-600">잉</h3>
                    <div class="flex items-center mt-2">
                        <button class="text-gray-500 focus:outline-none focus:text-gray-600">
                            <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        </button>
                        <span class="text-gray-700 mx-2">2</span>
                        <button class="text-gray-500 focus:outline-none focus:text-gray-600">
                            <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        </button>
                    </div>
                </div>
            </div>
            <span class="text-gray-600">20$</span>
        </div>
        <div class="flex justify-between mt-6">
            <div class="flex">
                <img class="h-20 w-20 object-cover rounded" src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" alt="">
                <div class="mx-3">
                    <h3 class="text-sm text-gray-600">Mac Book Pro</h3>
                    <div class="flex items-center mt-2">
                        <button class="text-gray-500 focus:outline-none focus:text-gray-600">
                            <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        </button>
                        <span class="text-gray-700 mx-2">2</span>
                        <button class="text-gray-500 focus:outline-none focus:text-gray-600">
                            <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        </button>
                    </div>
                </div>
            </div>
            <span class="text-gray-600">20$</span>
        </div>
        <div class="flex justify-between mt-6">
            <div class="flex">
                <img class="h-20 w-20 object-cover rounded" src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" alt="">
                <div class="mx-3">
                    <h3 class="text-sm text-gray-600">Mac Book Pro</h3>
                    <div class="flex items-center mt-2">
                        <button class="text-gray-500 focus:outline-none focus:text-gray-600">
                            <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        </button>
                        <span class="text-gray-700 mx-2">2</span>
                        <button class="text-gray-500 focus:outline-none focus:text-gray-600">
                            <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        </button>
                    </div>
                </div>
            </div>
            <span class="text-gray-600">20$</span>
        </div>
        <div class="mt-8">
            <form class="flex items-center justify-center">
                <input class="form-input w-48" type="text" placeholder="Add promocode">
                <button class="ml-3 flex items-center px-3 py-2 bg-blue-600 text-white text-sm uppercase font-medium rounded hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
                    <span>Apply</span>
                </button>
            </form>
        </div>
        <a class="flex items-center justify-center mt-4 px-3 py-2 bg-blue-600 text-white text-sm uppercase font-medium rounded hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
            <span>Chechout</span>
            <svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
        </a>
    </div>  -->
    <main class="my-5" style="width: 90%; margin: 0 auto;">
        <div class="container mx-auto px-6">
            <h3 class="text-gray-700 text-2xl font-medium">주문/정기 결제</h3>
            <br>
            <div class="flex items-center">
                        <button class="flex text-sm text-blue-500 focus:outline-none"><span class="flex items-center justify-center text-white bg-blue-500 rounded-full h-5 w-5 mr-2">1</span> 장바구니</button>
                        <button class="flex text-sm text-gray-700 ml-8 focus:outline-none"><span class="flex items-center justify-center border-2 border-blue-500 rounded-full h-5 w-5 mr-2">2</span> 주문/결제</button>
                        <button class="flex text-sm text-gray-500 ml-8 focus:outline-none" disabled><span class="flex items-center justify-center border-2 border-gray-500 rounded-full h-5 w-5 mr-2">3</span> 완료</button>
                    </div>
                   <br> 
            <div class="flex flex-col lg:flex-row">
                <div class="w-full lg:w-1/2 order-2">
              
                    <form class="mt-8 lg:w-11/12">
                        <div style="margin-top: 0">
                            <h4 class="text-sm text-gray-500 font-medium">배송지 선택</h4>
                            <hr>
                            <div class="ml-6">
                                <button class="flex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-3 focus:outline-none inline-flex">
                                    <label class="flex items-center">
                                        <input type="radio" class="form-radio h-5 w-5 text-blue-600" checked><span class="ml-2 text-sm text-gray-700">기본 배송지</span>
                                    </label>

                                    <span class="text-gray-600 text-sm"></span>
                                </button>
                                <button class="mt-6 flex items-center justify-between bg-white rounded-md border p-3 focus:outline-none inline-flex" >
                                    <label class="flex items-center">
                                        <input type="radio" class="form-radio h-5 w-5 text-blue-600"><span class="ml-2 text-sm text-gray-700">신규 배송지</span>
                                    </label>

                                    <span class="text-gray-600 text-sm"></span>
                                </button>
                            </div>
                        </div>
                        
                        
                        <!--------- 기존배송지 ---------------------------- -->
                
                         <div class="mt-8">
                            <h4 class="text-sm text-gray-500 font-medium">배송지 정보</h4>
                            <hr>
                            
                            <div class="mt-6 flex text-sm ml-6">
                              KH 정보 교육원
                            </div>
                            <div class="mt-6 flex text-sm ml-6">
                              1544-9970
                            </div>
                            <div class="mt-6 flex text-sm ml-6">
                              (13155) 서울특별시 강남구 테헤란로 14길 6 남도빌딩
                            </div>
                            <br>
                            <input type="text" class="text-sm ml-6 text-gray-700 w-5/6 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" placeholder="요청사항을 직접 입력합니다."> 
                               </div> 
                        <!--------- 신규배송지 ---------------------------- -->

							 <div class="mt-8">
                            <h4 class="text-sm text-gray-500 font-medium">배송지 정보</h4>
                            <hr>
                            
                            <div class="mt-6 lex text-sm">
                            <div class="mt-6 inline-flex text-sm mr-8 ml-6">
                             
                              수령인 </div>  
                               <input type="text" class=" w-2/3 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" 
                            placeholder="50자 이내로 입력하세요.">
                            
                            <br>
                            <div class="mt-6 text-sm inline-flex ml-6">
                             
                              배송지 이름</div>  
                               <input type="text" class=" w-1/3 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" 
                            placeholder="직접 입력하거나 선택하세요.">
                            
                              
                    		<br>
                            <div class="mt-6 inline-flex text-sm mr-8 ml-6">
                              연락처</div>
                               <input type="text" class=" w-1/6 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" > -
                               <input type="text" class=" w-1/6 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" > -
                               <input type="text" class=" w-1/6 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" >
                            
                            <br>
                            <div class="mt-6 inline-flex text-sm ml-6">
                              배송지 주소</div>
                            <input type="text" class="inline-flex text-sm text-gray-700 lex items-center bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" >
                     		<button class="inline-flex items-center px-3 py-2 bg-blue-600 text-white text-sm font-medium rounded-md hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
                                <span>우편번호</span>
                            </button>
                           <br>
                            <div class="mt-6 inline-flex text-sm ml-6">
                              배송지 상세</div>
                            <input type="text" class="text-sm w-2/3 text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" ><br>
                            
                    
                            <div class="mt-6 inline-flex text-sm ml-6">
                              배송시 요청 </div>
                               <input type="text" class=" w-2/3 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" 
                            placeholder="요청사항을 직접 입력합니다.">
                        
                             <br>
                        </div>
                      


                            
                             <br><br><br>
                        </div> 
                        <!--------- 신규배송지 ---------------------------- -->
                        <div class="mt-8">
                            <h4 class="text-sm text-gray-500 font-medium">할인 및 포인트</h4>
                            <hr>
                           <div class="mt-6 flex text-sm inline-flex ml-6" >
                              적립포인트 잔액
                            </div>
                            <div class="mt-6 flex text-sm inline-flex float-right mr-6">
                             	0 포인트
                            </div>
                            <br><br>
                            
								<button class="flex items-center justify-between bg-white float-right rounded-md  border-blue-500 p-2 focus:outline-none mr-6" style="display: inline-flex;">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-radio h-5 w-5 text-blue-600" checked><span class="ml-2 text-sm text-gray-700">항상 적립포인트 전액 사용</span>
                                    </label>

                                    <span class="text-gray-600 text-sm"></span>
                                </button>
                                

                            <br><br>
                           
                            <br>
                                 <div class="mt-6 inline-flex text-sm mr-6 ml-6">
                              사용 포인트 </div>
                               <input type="number" class=" w-1/6 mr-6 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none float-right" >
                        </div>
                        <!-- 
                        <br><br>
                        <div class="mt-8">
                            <h4 class="text-sm text-gray-500 font-medium">정기 결제 정보</h4>
                            <hr>
                            
                            <div class="mt-6 lex text-sm">
                            <div class="mt-6 inline-flex text-sm mr-6 ml-6">
                             
                              카드번호 </div>  
                               <input type="text" class=" w-2/3 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" 
                            placeholder="xxxx - xxxx - xxxx - xxxx">
                            
                              
                    		<br>
                            <div class="mt-6 inline-flex text-sm mr-6 ml-6">
                              유효기간  </div>
                               <input type="number" class=" w-1/6 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" >년
                               <input type="number" class=" w-1/6 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" >월
                            
                            <br>
                            <div class="mt-6 inline-flex text-sm mr-6 ml-6">
                              생년월일</div>
                            <input type="date" class="text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" >
                            
                            <br>
                            <div class="mt-6 inline-flex text-sm mr-6 ml-6">
                              비밀번호 </div>
                               <input type="text" class=" w-1/6 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" 
                            placeholder="비밀번호 앞 두자리"> **
                            
                            <br>
                             <br>
                        </div>
                        </div> -->
                        
                     <!-- ------------------------------------------------------- -->
                     
                     
                    </form>
                </div>
                <div class="w-full mb-8 flex-shrink-0 order-1 lg:w-1/2 lg:mb-0 lg:order-2 mt-8">
                    <div class=" justify-center lg:justify-end details">
                        <div class="border rounded-md w-full px-4 py-10 ">
                            <div class="flex items-center justify-between">
                                <h3 class="text-gray-700 font-medium">주문자 정보</h3>
<!--                                 <span class="text-gray-600 text-sm">Edit</span> -->
                            </div>
                            <div class="flex justify-between mt-6">
                                <div class="flex">
                                    <img class="h-20 w-20 object-cover rounded" src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" alt="">
                                    <div class="mx-3">
                                        <h3 class="text-sm text-gray-600">이인지</h3>
                                        <h3 class="text-sm text-gray-600">010-8**0-5**3</h3>
                                        <h3 class="text-sm text-gray-600">mf******@na***com</h3>
                                        
                                        
                                    </div>
                                </div>
                                <!-- <span class="text-gray-600">20$</span> -->
                      
                                       
                                        	
                                           <!--  <button class="text-gray-500 focus:outline-none focus:text-gray-600">
                                                <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                            </button>
                                            <span class="text-gray-700 mx-2">2</span>
                                            <button class="text-gray-500 focus:outline-none focus:text-gray-600">
                                                <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                            </button> -->
                                   
                            </div>  
                            <br> 
                            <div class="mx-3">
                             <h3 class="text-sm text-gray-600 ">주문자 정보로 결제관련 정보가 제공됩니다.
                             <br>정확한 정보로 등록되어있는지 확인해주세요.</h3>
                             </div>           
                        </div>
                        
                        <br><br>
                        
                        <div class="border rounded-md w-full px-4 py-10">
                            <div class="flex items-center justify-between">
                                <h3 class="text-gray-700 font-medium">주문 정보</h3>
<!--                                 <span class="text-gray-600 text-sm">Edit</span> -->
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
                                        <h3 class="text-sm text-gray-600">배송비 </h3>
                                        <div class="flex items-center mt-2">
                                        
<!--                                             <button class="text-gray-500 focus:outline-none focus:text-gray-600"> -->
<!--                                                 <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg> -->
<!--                                             </button> -->
<!--                                             <span class="text-sm text-gray-600">수량 : 2</span> -->
<!--                                             <button class="text-gray-500 focus:outline-none focus:text-gray-600"> -->
<!--                                                 <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg> -->
<!--                                             </button> -->
                                        </div>
                                    </div>
                                    <div class="mx-3 float-right">
                                       <h3 class="text-sm text-gray-600 float-right">닭가슴살</h3>
                                        <h3 class="text-sm text-gray-600">랭킹닭컴</h3>
                                        <h3 class="text-sm text-gray-600">2</h3>
                                        <h3 class="text-sm text-gray-600">0원</h3>
                                        <h3 class="text-sm text-gray-600">2500원</h3>
                                        <div class="flex items-center mt-2">
                                        
<!--                                             <button class="text-gray-500 focus:outline-none focus:text-gray-600"> -->
<!--                                                 <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M12 9v3m0 0v3m0-3h3m-3 0H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg> -->
<!--                                             </button> -->
<!--                                             <span class="text-sm text-gray-600">수량 : 2</span> -->
<!--                                             <button class="text-gray-500 focus:outline-none focus:text-gray-600"> -->
<!--                                                 <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg> -->
<!--                                             </button> -->
                                        </div>
                                    </div>
                                    </div>
                                </div>
<!--                                 <span class="text-gray-600">3800원</span> -->
                            </div>
                                <span class="text-gray-600 float-right">주문 금액 3800원</span>
                        </div>
                        
                        
                        
                        
                        
                    </div>
                </div>  
            </div>
        </div>
        
        <br><br><br>
        
        <div class="container mx-auto px-6">
        <div class="border rounded-md w-full px-4 py-10">
                            <div class="flex items-center justify-between w-full">
                                <h3 class="text-gray-700 font-medium">결제 금액</h3>
<!--                                 <span class="text-gray-600 text-sm">Edit</span> -->
                            </div>
                            <div class="flex justify-between mt-6">
                                <div class="flex w-full justify-between">
<!--                                     <img class="h-20 w-20 object-cover rounded" src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" alt=""> -->
                                    <div class="mx-3">
                                        <h3 class="text-sm text-gray-600">총 상품금액</h3>
                                        <br>
                                        <h3 class="text-sm text-gray-600">배송비(+)</h3> 
                                        <h3 class="text-sm text-gray-600">할인금액(-)</h3> 
                                        <h3 class="text-sm text-gray-600">적립포인트 사용(-)</h3> 
                                    </div>
                                    
                                   
<!--                                     <img class="h-20 w-20 object-cover rounded" src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80" alt=""> -->
                                    <div class="mx-3">
                                        <h3 class="text-sm text-gray-600">279,000원</h3>
                                        <br>
                                       <h3 class="text-sm text-gray-600">10,000원</h3>
                                         <h3 class="text-sm text-gray-600">48,000원</h3>
                                         <h3 class="text-sm text-gray-600">0원</h3>
                                </div>
                                
                            </div>
                        </div>
        <br>
        
                        </div>
                        <br>
                         <button class="flex items-center justify-between bg-white w-full rounded-md border-2 border-blue-500 p-4 focus:outline-none" style="display: inline-flex;">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-radio h-5 w-5 text-blue-600" checked><span class="ml-2 text-sm text-gray-700">위 상품의 구매조건 확인 및 결제진행 동의</span>
                                    </label>

                                    <span class="text-gray-600 text-sm"></span>
                                </button>
        				
        				<br><br>
       					 <div class=" items-center justify-between">
       					
                           <button class="flex items-center text-gray-700 text-sm font-medium rounded hover:underline focus:outline-none float-left">
                                <svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M7 16l-4-4m0 0l4-4m-4 4h18"></path></svg>
                                <span class="mx-2">이전</span>
                            </button>
                            <!-- <button class="flex items-center px-3 py-2 bg-blue-600 text-white text-sm font-medium rounded-md hover:bg-blue-500 focus:outline-none focus:bg-blue-500 float-left">
                                <span>이전</span>
                                <svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
                            </button> -->
                            <button class="flex items-center px-3 py-2 bg-blue-600 text-white text-sm font-medium rounded-md hover:bg-blue-500 focus:outline-none focus:bg-blue-500 float-right">
                                <span>결제</span>
                                <svg class="h-5 w-5 mx-2" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M17 8l4 4m0 0l-4 4m4-4H3"></path></svg>
                            </button>
         <br><br><br>
        </div>
    </main>
  
    
<%@include file="../layout/shopping_footer.jsp" %>