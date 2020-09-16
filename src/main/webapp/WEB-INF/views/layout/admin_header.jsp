<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="lay-item">
	<div class="flex justify-between items-center mx-auto py-4 px-6 bg-white border-b-4 border-indigo-600">
		<div class="flex items-center cursor-pointer" onclick="location.href='<%=request.getContextPath() %>/admin/productlist'">
			<img class="inline-block h-12" src="<%=request.getContextPath() %>/resources/image/logo.png"/>
			<span class="font-black text-2xl">통합관리시스템</span>
		</div>
		<div class="flex items-center">
			<div x-data="{ dropdownOpen: false }"  class="relative">
				<button class="relative z-10 block h-8 w-8 rounded-full overflow-hidden shadow focus:outline-none">
					<img class="h-full w-full object-cover" src="https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=296&q=80" alt="Your avatar">
				</button>
			</div>
			<span class="font-mono ml-4">문지영님</span>
		</div>
	</div>
</div>