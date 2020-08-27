<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mt-6 flex text-sm ml-6">
 	${user.id}
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