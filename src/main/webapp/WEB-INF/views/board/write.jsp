<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<!-- HEADER -->
<%@include file="../layout/header.jsp" %>

<!-- 네이버 스마트 에디터 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	// 작성버튼 동작
	$("#btnWrite").click(function() {
		
		//스마트에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
		submitContents( $("#btnWrite") );
		
		// 실제 <form>의 submit 수행
		$("form").submit();
	});
	
	function submitContents(elClickedObj) {
		
		// 에디터의 내용을 #content에 반영한다
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		try {
			
		//<form>태그의 submit을 수행한다
		elClickedObj.form.submit();
		} catch(e) {
		}
	}
	
})
</script>

<section class="antialiased font-sans " style="min-height: 73vh;">
<form action="/board/write" method="post" enctype="multipart/form-data">

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
	                                   <input class="text-gray-900 whitespace-no-wrap text-left w-full h-10" placeholder="제목 입력란" name="title" required="required"/>
                                   </div>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                    <select class="text-gray-800 font-bold" name="type">
                                    	<option value="1" class="text-gray-800 font-bold">자유</option>
                                    	<option value="2" class="text-gray-800 font-bold">광고</option>
                                    	<option value="3" class="text-gray-800 font-bold">공지</option>
                                    </select>
                                </td>
                                <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
	                            	<div class="flex items-center">
                                        <div class="flex-shrink-0 w-10 h-10">
                                            <img class="w-full h-full rounded-full"
                                                src="<%=request.getContextPath() %>/resources/upload_user/logo.png"
                                                alt="" />
                                        </div>
                                        <div class="ml-3">
                                            <p class="text-gray-900 whitespace-no-wrap text-left">${logInInfo.nick }</p>
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
                                <td class="border-b border-gray-200 bg-white text-sm">
                                    <div class="flex items-center">
                                        <div class="w-full">
                                        	<br>
	                                        <textarea id="content" name="content" style="width: 1200px;" required="required"></textarea>
                                            <script type="text/javascript">
												var oEditors = [];
												nhn.husky.EZCreator.createInIFrame({
												oAppRef: oEditors
												, elPlaceHolder: "content" //에디터가 적용될 <textarea>의 id
												, sSkinURI: "/resources/se2/SmartEditor2Skin.html" //에디터 스킨
												, fCreator: "createSEditor2"
												})
											</script>
											<br>
                                        	<input class="px-2" type="file" name="files" multiple="multiple" id="boardfileimage">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </div>

	            <button class="mt-3 text-sm font-extrabold float-right w-32 focus:outline-none border border-transparent py-2 px-5 rounded-lg shadow-sm text-center text-white bg-blue-500 hover:bg-blue-600 font-medium" 
				id="btnWrite">등록</button>

            </div>
            <!-- 본문 내용 끝 -->
            
        </div>
    </div>
    
</form>
</section>

<%@include file="../layout/footer.jsp" %>
