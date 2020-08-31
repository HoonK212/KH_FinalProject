<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<!-- <input type="text" class="text-sm ml-6 text-gray-700 w-5/6 lex items-center  -->
<!-- 	justify-between bg-white rounded-md border-2 border-blue-500 p-2 focus:outline-none"  -->
<!-- 	placeholder="요청사항을 직접 입력합니다."> -->