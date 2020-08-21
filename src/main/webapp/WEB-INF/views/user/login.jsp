<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/resources/logo.png">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">
</head>
<body>

<div class="bg-gray-800 h-screen w-screen">
    <div class="flex flex-col items-center flex-1 h-full justify-center px-4 sm:px-0">
        <div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2 bg-white sm:mx-0" style="height: 500px">
            <div class="flex flex-col w-full md:w-1/2 p-4">
                <div class="flex flex-col flex-1 justify-center mb-8">
                    <h1 class="text-3xl text-center font-extrabold text-gray-800">WELCOME</h1>
                    <div class="w-full mt-4">
                        <form class="form-horizontal w-3/4 mx-auto" method="POST" action="<%=request.getContextPath()%>/user/loginimple">
                            <div class="flex flex-col mt-4">
                                <input id="id" type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" name="id" value="" required placeholder="ID">
                            </div>
                            <div class="flex flex-col mt-4">
                                <input id="password" type="password" class="flex-grow h-8 px-2 rounded border border-grey-400" name="pw" required placeholder="Password">
                            </div>
                            <div class="flex items-center mt-4">
                                <input type="checkbox" name="remember" id="remember" class="mr-2"> <label for="remember" class="text-sm text-grey-dark">로그인 상태 유지</label>
                            </div>
                            <div class="flex flex-col mt-8">
                                <button id="btnLogin" type="submit" class="bg-blue-500 hover:bg-blue-700 text-white text-sm font-semibold py-2 px-4 rounded">
                                    로그인
                                </button>
                                <br>
                                <button class="bg-blue-500 hover:bg-blue-700 text-white text-sm font-semibold py-2 px-4 rounded">
                                    회원가입
                                </button>
                                <br>
                                <div class="btn-wrapper text-center">
                         			<button class="bg-white active:bg-gray-100 text-gray-800 font-normal px-4 py-2 rounded outline-none focus:outline-none mr-2 mb-1 uppercase shadow hover:shadow-md inline-flex items-center font-bold text-xs" type="button" style="transition: all 0.15s ease 0s;"><img alt="..." class="w-5 mr-1" src="<%=request.getContextPath() %>/resources/image/user/google.png">구글</button>
                       		    	<button class="bg-white active:bg-gray-100 text-gray-800 font-normal px-4 py-2 rounded outline-none focus:outline-none mr-1 mb-1 uppercase shadow hover:shadow-md inline-flex items-center font-bold text-xs" type="button" style="transition: all 0.15s ease 0s;"><img alt="..." class="w-5 mr-1" src="<%=request.getContextPath() %>/resources/image/user/kakao.png">카카오</button>
                        		</div>
                        </div>
                        </form>
                        <div class="text-center mt-4">
                            <a class="no-underline hover:underline text-blue-dark text-xs" href="{{ route('password.request') }}">
                            	아이디 찾기
                            </a>
                            /
                            <a class="no-underline hover:underline text-blue-dark text-xs" href="{{ route('password.request') }}">
                            	비밀번호 찾기
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hidden md:block md:w-1/2 rounded-r-lg" style="background: url('https://images.unsplash.com/photo-1536922246289-88c42f957773?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1980&q=80'); background-size: cover; background-position: center center;"></div>
        </div>
    </div>
</div>

</body>
</html>