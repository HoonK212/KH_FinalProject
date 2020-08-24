<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/board/detail.css">

<!-- HEADER -->
<%@include file="../layout/header.jsp" %>

<section class="antialiased font-sans bg-gray-200">

    <div class="container mx-auto px-4 sm:px-8">
        <div class="py-8">
        
            <div class="pb-2">
                <h2 class="text-2xl font-semibold leading-tight text-gray-700">게시글</h2>
	            <button onclick="document.getElementById('myModal').showModal()" id="btn" class="text-sm font-extrabold float-right w-32 focus:outline-none border border-transparent py-2 px-5 rounded-lg shadow-sm text-center text-white bg-blue-500 hover:bg-blue-600 font-medium" 
				>댓글작성</button>
				<div class="clear-both"></div>
            </div>
            
            <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
                <div class="inline-block min-w-full shadow rounded-lg overflow-hidden">
                    <table class="min-w-full leading-normal">
                        <colgroup>
                    		<col width="50%" />
                    		<col width="10%" />
                    		<col width="10%" />
                    		<col width="10%" />
                    		<col width="10%" />
                    		<col width="10%" />
                    	</colgroup>
                        <thead>
                            <tr>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    제목
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    구분
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    작성자
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    작성일자
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    조회수
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    추천수
                                </th>	
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                   <div class="flex items-center ml-3">
	                                   <p class="text-gray-900 whitespace-no-wrap text-left">
	                                       여기는 제목입니다. 1
	                                   </p>
                                   </div>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <span
                                        class="relative inline-block px-3 py-1 font-semibold text-green-900 leading-tight">
                                        <span aria-hidden
                                            class="absolute inset-0 bg-green-200 opacity-50 rounded-full"></span>
                                        <span class="relative text-left">자유</span>
                                    </span>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                            	<div class="flex items-center">
                                        <div class="flex-shrink-0 w-10 h-10">
                                            <img class="w-full h-full rounded-full"
                                                src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2.2&w=160&h=160&q=80"
                                                alt="" />
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-gray-900 whitespace-no-wrap text-left">사람1</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-gray-900 whitespace-no-wrap text-left">
                                        Jan 21, 2020
                                    </p>
                                </td>
								<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                            	<p class="text-gray-900 whitespace-no-wrap text-center">1</p>
                                </td>
								<td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                            	<p class="text-gray-900 whitespace-no-wrap text-center font-bold text-blue-600">1</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- 본문 내용 시작 -->
            <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
                <div class="inline-block min-w-full shadow rounded-lg overflow-hidden">
                    <table class="min-w-full leading-normal">
                        <thead>
                            <tr>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    <p class="float-left inline-block">본문</p>
                                    <p class="float-right inline-block px-6 cursor-pointer font-bold text-red-600">1</p>
                                    <p class="float-right inline-block px-6">싫어요</p>
                                    <p class="float-right inline-block px-6 cursor-pointer font-bold text-blue-600">2</p>
                                    <p class="float-right inline-block px-6">좋아요</p>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <div class="flex items-center">
                                        <div class="ml-3">
                                            <p class="text-gray-900">
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                                본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 본문입니다아아 !!!!! 
                                            </p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 본문 내용 끝 -->
            
            <!-- 댓글란 시작 -->
            <div class="-mx-4 sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
                <div class="inline-block min-w-full shadow rounded-lg overflow-hidden">
                    <table class="min-w-full leading-normal">
                    	<colgroup>
                    		<col width="70%">
                    		<col width="10%">
                    		<col width="10%">
                    		<col width="10%">
                    	</colgroup>
                        <thead>
                            <tr>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    댓글
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    작성자
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    좋아요
                                </th>
                                <th
                                    class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-center text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                    싫어요
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 w-10 h-10">
                                            <img class="w-full h-full rounded-full"
                                                src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2.2&w=160&h=160&q=80"
                                                alt="" />
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-gray-900 whitespace-no-wrap">
                                                댓글입니다아 !!!
                                            </p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-gray-900 whitespace-no-wrap">사람2</p>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-blue-600 whitespace-no-wrap text-center font-bold cursor-pointer">2</p>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-red-600 whitespace-no-wrap text-center font-bold cursor-pointer">1</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <div class="flex items-center">
                                        <div class="flex-shrink-0 w-10 h-10">
                                            <img class="w-full h-full rounded-full"
                                                src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2.2&w=160&h=160&q=80"
                                                alt="" />
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-gray-900 whitespace-no-wrap">
                                                댓글입니다아 !!!
                                            </p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-gray-900 whitespace-no-wrap">사람2</p>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-blue-600 whitespace-no-wrap text-center font-bold cursor-pointer">2</p>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <p class="text-red-600 whitespace-no-wrap text-center font-bold cursor-pointer">1</p>
                                </td>
                            </tr>
	                            <tr>
	                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                                    <div class="flex items-center">
	                                        <div class="flex-shrink-0 w-10 h-10">
	                                            <img class="w-full h-full rounded-full"
	                                                src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2.2&w=160&h=160&q=80"
	                                                alt="" />
	                                        </div>
	                                        <div class="ml-3">
	                                            <p class="text-gray-900 whitespace-no-wrap">
	                                                댓글입니다아 !!!
	                                            </p>
	                                        </div>
	                                    </div>
	                                </td>
	                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                                    <p class="text-gray-900 whitespace-no-wrap">사람2</p>
	                                </td>
	                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                                    <p class="text-blue-600 whitespace-no-wrap text-center font-bold cursor-pointer">2</p>
	                                </td>
	                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                                    <p class="text-red-600 whitespace-no-wrap text-center font-bold cursor-pointer">1</p>
	                                </td>
	                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 댓글란 끝 -->
            
        </div>
    </div>

	<!-- Modal -->
	<dialog id="myModal" class="fixed h-auto w-11/12 md:w-1/2 p-5  bg-white rounded-md ">
		<div class="flex flex-col w-full h-auto justify-center items-center">
			<!-- Header -->
			<div class="w-full h-auto">
				<div onclick="document.getElementById('myModal').close();" class="float-right w-1/12 h-auto justify-center cursor-pointer">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
				</div>
				<div class="clear-both"></div>
				<div class="flex h-auto justify-center items-center text-2xl font-bold">
					댓글 작성
				</div>
			</div>
			<!--Header End-->
			<!-- Content-->
			<form class="w-full max-w-xl rounded-lg px-4 pt-2">
				<div class="flex flex-wrap -mx-4 mb-2">
					<div class="w-full md:w-full my-2">
						<textarea class="bg-gray-300 rounded border border-gray-400 leading-normal resize-none w-full h-20 py-2 px-3 font-medium placeholder-gray-700 focus:outline-none" name="body" placeholder='좋은 게시글인군요!' required></textarea>
					</div>
					<div class="w-full md:w-full flex items-start md:w-full">
						<div class="flex items-start w-1/2 text-gray-700 px-2 mr-auto"></div>
						<div class="-mr-1">
							<input type='submit' class="bg-white text-gray-700 font-medium py-1 px-4 border border-gray-400 rounded-lg tracking-wide mr-1 hover:bg-gray-100" value='등록'>
						</div>
					</div>
				</div>
			</form>
			<!-- Content End -->
		</div>
	</dialog>

</section>

<%@include file="../layout/footer.jsp" %>
