<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Home Training</title>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/image/logo.png">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/user/join.css">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.js" defer></script>
</head>
<body>

<div class="h-screen">
	<div x-data="app()" x-cloak>
		<div class="max-w-3xl mx-auto px-4 py-10">
			<div x-show.transition="step === 'complete'">
				<div class="bg-white rounded-lg p-10 flex items-center shadow justify-between">
					<div>
						<svg class="mb-4 h-20 w-20 text-green-500 mx-auto" viewBox="0 0 20 20" fill="currentColor">  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/></svg>
						<h2 class="text-2xl mb-4 text-gray-800 text-center font-bold">비밀번호 찾기</h2>
						<div class="text-gray-600 mb-8">
							{사용자가 입력한 이메일 주소 출력}으로 메일을 전송했습니다. 등록한 메일함에서 임시 비밀번호를 확인해주세요. 감사합니다.
						</div>
						<button
							@click="step = 3"
							class="w-40 block mx-auto focus:outline-none py-2 px-5 rounded-lg shadow-sm text-center text-gray-600 bg-white hover:bg-gray-100 font-medium border" 
						>홈으로</button>
					</div>
				</div>
			</div>
			<div x-show.transition="step != 'complete'">	
			
				<div class="border-b-2 py-4">
					<div class="flex flex-col md:flex-row md:items-center md:justify-between">
						<div class="flex-1">
							<div x-show="step === 3" class="mt-10">
								<div class="text-2xl font-extrabold text-gray-800 leading-tight text-gray-800">비밀번호 찾기</div>
							</div>
						</div>
					</div>
				</div>

				<div class="py-10">	
					<div x-show.transition.in="step === 3">
						<div class="mt-10 mb-10">
							<label for="name" class="font-bold mb-1 text-gray-800 inline-block">이름</label>
							<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(1/3)</p>
							<input type="text" name="name"
								class="w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium"
								placeholder="등록된 이름 입력">
						</div>
						<div class="mt-10 mb-10">
							<label for="id" class="font-bold mb-1 text-gray-800 inline-block">아이디</label>
							<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(2/3)</p>
							<input type="text" name="id"
								class="w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium"
								placeholder="등록된 아이디 입력">
						</div>
						<div class="mb-10">
							<label for="mail" class="font-bold mb-1 text-gray-800 inline-block">이메일</label>
							<p class="font-bold mb-1 text-gray-400 block text-xs inline-block">(3/3)</p>
							<input type="email" name="mail"
								class="w-full px-4 py-3 rounded-lg shadow-sm focus:outline-none focus:shadow-outline text-gray-600 font-medium"
								placeholder="등록된 이메일 입력">
						</div>
					</div>
				</div>
				
			</div>
		</div>

		<div class="fixed bottom-0 left-0 right-0 py-5 bg-white shadow-md" x-show="step != 'complete'">
			<div class="max-w-3xl mx-auto px-4">
				<div class="flex justify-between">
					<div class="w-full text-right">
						<button
							@click="step = 'complete'"
							x-show="step === 3"
							class="w-32 focus:outline-none border border-transparent py-2 px-5 rounded-lg shadow-sm text-center text-white bg-blue-500 hover:bg-blue-600 font-medium" 
						>완료</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>

	<script>
		function app() {
			return {
				step: 3
			}
		}
	</script>

</body>
</html>