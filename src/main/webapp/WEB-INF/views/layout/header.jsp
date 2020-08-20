<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">
<link href="https://fonts.googleapis.com/css?family=Bebas+Neue|Montserrat:400,900&amp;display=swap" rel="stylesheet">
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/image/logo.png">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bebas+Neue|Montserrat:400,900&display=swap">
<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

<header>
        <div class="container mx-auto px-6 py-3 font-extrabold">
            <div class=" items-center justify-between">
                <div class="hidden w-full text-white-600 md:flex md:items-center"></div>
                <div class="w-full text-white-700 md:text-center text-2xl ">
                <img src="<%=request.getContextPath() %>/resources/image/logo.png" style="width: 70px; height: 70px; display: inline;">
                    Daily Home Training
                </div>
<!--                 <div class="flex items-center justify-end w-full"> -->
<!--                     <div class="flex sm:hidden"> -->
<!--                         <button @click="isOpen = !isOpen" type="button" class="text-white-600 hover:text-gray-500 focus:outline-none focus:text-gray-500" aria-label="toggle menu"> -->
<!--                             <svg viewBox="0 0 24 24" class="h-6 w-6 fill-current"> -->
<!--                                 <path fill-rule="evenodd" d="M4 5h16a1 1 0 0 1 0 2H4a1 1 0 1 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2zm0 6h16a1 1 0 0 1 0 2H4a1 1 0 0 1 0-2z"></path> -->
<!--                             </svg> -->
<!--                         </button> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
            <nav :class="isOpen ? '' : 'hidden'" class="sm:flex sm:justify-center sm:items-center mt-4">
                <div class="flex flex-col sm:flex-row">
                    <a class="mt-3 text-white-600 sm:mx-30 sm:mt-0 lg:mx-24" href="#">Home</a>
                    <a class="mt-3 text-white-600 sm:mx-30 sm:mt-0 lg:mx-24" href="#">Shop</a>
                    <a class="mt-3 text-white-600 sm:mx-30 sm:mt-0 lg:mx-24" href="#">Categories</a>
                    <a class="mt-3 text-white-600 sm:mx-30 sm:mt-0 lg:mx-24" href="#">Contact</a>
                    <a class="mt-3 text-white-600 sm:mx-30 sm:mt-0 lg:mx-24" href="#">About</a>
                </div>
            </nav>
        </div>
</header>




