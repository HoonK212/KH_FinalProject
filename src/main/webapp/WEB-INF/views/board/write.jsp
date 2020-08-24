<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<!-- HEADER -->
<%@include file="../layout/header.jsp" %>

<section class="antialiased font-sans bg-gray-200" style="min-height: 73vh;">

    <div class="container mx-auto px-4 sm:px-8">
        <div class="py-8">
        
            <div class="pb-2">
                <h2 class="text-2xl font-semibold leading-tight text-gray-700">게시글 작성</h2>
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
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                   <div class="flex items-center ml-3">
	                                   <input class="text-gray-900 whitespace-no-wrap text-left w-full h-10" placeholder="제목 입력란" name="title"/>
                                   </div>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <select class="text-gray-900 font-bold">
                                    	<option class="text-gray-500 font-bold">선택</option>
                                    	<option value="1" class="text-gray-700 font-bold">자유</option>
                                    	<option value="2" class="text-gray-700 font-bold">광고</option>
                                    	<option value="3" class="text-gray-700 font-bold">공지</option>
                                    </select>
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
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <div class="flex items-center">
                                        <div class="ml-3">
                                            <textarea placeholder="본문 입력란"></textarea>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
					
                </div>

	            <button class="mt-3 text-sm font-extrabold float-right w-32 focus:outline-none border border-transparent py-2 px-5 rounded-lg shadow-sm text-center text-white bg-blue-500 hover:bg-blue-600 font-medium" 
				>등록</button>

            </div>
            <!-- 본문 내용 끝 -->
            
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
