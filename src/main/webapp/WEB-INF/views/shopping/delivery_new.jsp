<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="mt-6 lex text-sm">
                            <div class="mt-6 inline-flex text-sm mr-8 ml-6">
                             
                              수령인 </div>  
                               <input name="toName" type="text" class=" w-2/3 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" 
                            placeholder="50자 이내로 입력하세요.">
                            
<!--                             <br> -->
<!--                             <div id="toAddr" class="mt-6 text-sm inline-flex ml-6"> -->
<!--                               배송지 이름</div>   -->
<!--                                <input type="text" class=" w-1/3 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none"  -->
<!--                             placeholder="직접 입력하거나 선택하세요."> -->
                            
                    		<br>
                            <div class="mt-6 inline-flex text-sm mr-8 ml-6">
                              연락처</div>
						<input name="toTel" type="text" class=" w-2/3 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" 
                            placeholder="010-0000-1111">
                            <br>
                            <div class="mt-6 inline-flex text-sm ml-6">
                              배송지 주소</div>
                            <input id="sample4_postcode" name="toPost" placeholder="우편번호" type="text" class="inline-flex text-sm text-gray-700 lex items-center bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" >
                     		<input onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly="readonly" class="inline-flex items-center px-3 py-2 bg-blue-600 text-white text-sm font-medium rounded-md hover:bg-blue-500 focus:outline-none focus:bg-blue-500">
                            
                           <br>
                            <div class="mt-6 inline-flex text-sm ml-6">
                              도로명 주소</div>
                            <input id="sample4_roadAddress" name="toRoadAddr" placeholder="도로명주소" type="text" class="text-sm w-2/3 text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" ><br>
                            
                             <div class="mt-6 inline-flex text-sm ml-6">
                                 지번&nbsp&nbsp&nbsp&nbsp주소</div>
                            <input id="sample4_jibunAddress" name="toJibunAddr" placeholder="지번주소" type="text" class="text-sm w-2/3 text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" ><br>
                            
                            
                            <div class="mt-6 inline-flex text-sm ml-6">
                              배송지 상세</div>
                            <input id="sample4_detailAddress" name="toDetailAddr" placeholder="상세주소" type="text" class="text-sm w-2/3 text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" ><br>
                            <span id="guide" style="color:#999;display:none"></span>
                            
<%--                             <c:set var="roadAddress" value="$('#sample4_roadAddress').val() $('#sample4_detailAddress').val()"></c:set> --%>
<%--                             <c:set var="jibunAddress" value="$('#sample4_jibunAddress').val() $('#sample4_detailAddress').val()"></c:set> --%>
                            
                        <div class="mt-6 inline-flex text-sm ml-6">
                                  참고&nbsp&nbsp&nbsp&nbsp항목</div>
                            <input id="sample4_extraAddress" name="toExtraAddr" placeholder="참고항목" type="text" class="text-sm w-2/3 text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none" ><br>
                            
                    
<!--                             <div class="mt-6 inline-flex text-sm ml-6"> -->
<!--                               배송시 요청 </div> -->
<!--                                <input type="text" class=" w-2/3 text-sm text-gray-700 lex items-center justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none"  -->
<!--                             placeholder="요청사항을 직접 입력합니다."> -->
                        
<!--                              <br> -->
                        </div>
                        
                      