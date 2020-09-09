<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<!-- HEAD -->
<%@include file="/WEB-INF/views/layout/admin_head.jsp" %>

<div class="admin-container">

<!-- HEADER -->
<%@include file="/WEB-INF/views/layout/admin_header.jsp" %>
<!-- SIDEBAR -->
<%@include file="/WEB-INF/views/layout/admin_sidebar.jsp" %>

<!-- SECTION  -->
<div class="lay-item">

	<!-- CONTENT  -->
	<div class="section-container">
	
			<!-- 상단제목 -->
			<span class="font-semibold text-4xl">상품 등록</span>
		
		
			<!-- 상단 버튼 영역 -->
			<div class="flex justify-end" style="min-height: 2.8rem;">
			 
			</div>
			
			
			<!-- 테이블 영역 -->
			<!-- 다중 파일 form 형성  -->
			<form action="<%=request.getContextPath()%>/admin/productregister" method="POST" enctype="multipart/form-data" >
			<div class="shadow overflow-hidden rounded border-b border-gray-200">
					
					<!-- 테이블  -->
				    <table class="bg-gray-200 table-fixed">
				    
				        <tr>
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">상품카테고리</th>
				          <td class="border py-3 px-4 text-center">
				          <select id="select" class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight 
				          focus:outline-none focus:bg-white focus:border-indigo-500" name="code" >
					          <option value="A">기구</option>
					          <option value="B">보조제</option>
					          <option value="C">식품</option>
					      </select></td>
				        </tr>
				        
				        <tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">상품명</th>
				          <td class="border py-3 px-4 text-center">
				          <input class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight 
				          focus:outline-none focus:bg-white focus:border-indigo-500" type="text" name="name" >
				          </td>
				        </tr> 
				       
				         <tr> 
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">상품설명</th>
				          <td class="border py-3 px-4 text-center">
				          <textarea name="describe" id="content" class="w-full" ></textarea>
							<!-- 스마트 에디터 적용하는 코드 -->
							<!-- <textarea>에 스마트 에디터의 스킨을 입히는 코드 -->
							<script type="text/javascript">
								var oEditors = [];
								
								nhn.husky.EZCreator.createInIFrame({
								oAppRef: oEditors
								, elPlaceHolder: "content" //에디터가 적용될 <textarea>의 id
								, sSkinURI: "/resources/se2/SmartEditor2Skin.html" //에디터 스킨
								, fCreator: "createSEditor2"
								})
							</script>
				          </td>
				         </tr> 
				         

				        <tr style="min-height: 22rem;"> 
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">썸네일<br>이미지<br><br>
				          <button type="button" class="bg-white text-gray-800 py-2 px-3 rounded font-bold" id="clickUpForThumb">업로드</button></th>
				          <td class="grid grid-flow-row grid-cols-4 grid-rows-auto gap-4 border py-3 px-4" id="thumbbox" style="min-height: 21rem; min-width: 82rem;">
						  	<input type="file" id="filesforthumb" name="files" multiple style="display:none;"/>
						  </td>
				         </tr> 

				        <tr style="min-height: 22rem;"> 
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">이미지<br><br>
				          <button type="button" class="bg-white text-gray-800 py-2 px-3 rounded font-bold" id="clickUp">업로드</button></th>
				          <td class="grid grid-flow-row grid-cols-4 grid-rows-auto gap-4 border py-3 px-4" id="imgbox" style="min-height: 21rem; min-width: 82rem;">
							<input type="file" id="files" name="files" multiple style="display:none;"/>
						  </td>
				         </tr> 
				         
				         <tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">가격</th>
				          <td class="border py-3 px-4 text-center">
				          <input name="price" class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-indigo-500" type="text" >
				          </td>
				        </tr>
				         
				    	<tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">재고</th>
				          <td class="border py-3 px-4 text-center">
				          <input name="stock" class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-indigo-500" type="text" >
				          </td>
				        </tr>
				        
				        <tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">제조사</th>
				          <td class="border py-3 px-4 text-center">
				          <input name="company" class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-indigo-500" type="text" >
				          </td>
				        </tr>
				        
				        <tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">제조일</th>
				          <td class="border py-3 px-4 text-center">
				          <input name="dates" class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-indigo-500" type="date" >
				          </td>
				        </tr>
				        <input name="thumbArr" id="thumbArr" type="hidden" />
				       
				        
				    </table>
			</div><!-- 테이블 영역 끝!-->
			
			<!-- 하단 버튼 영역  -->	
			<div class="flex justify-center items-center mt-4">
					<div>
				    <button type="button" id="btnWrite" class='bg-gray-800 text-white py-2 px-3 rounded font-bold mr-5'>
				      저장
				  	</button>
				    <button type="button" id="btnCancel" class='bg-gray-800 text-white py-2 px-3 rounded font-bold'>
				      <a href="<%=request.getContextPath()%>/admin/productlist">취소</a>
				  	</button>
					</div>
			</div>
		</form>	
		</div>
	</div>
	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>
</div>

<script type="text/javascript">
window.onload = function() {
	
	var lengthForThumb = null;
	
	document.getElementById('clickUpForThumb').onclick = function(e) {
		
		document.getElementById('filesforthumb').click();
		
		if(lengthForThumb != null){
			console.log("썸네일 삭제시작");
			console.log(lengthForThumb);
			
			var elements = document.getElementsByClassName('delforthumb');
			while(elements.length > 0){
				elements[0].parentNode.removeChild(elements[0]);
			};
		};
	};
	
	document.getElementById('filesforthumb').onchange = function(e) {
		
		var idx = -1;
		var files = e.target.files;
		
		for (var i = 0; i < files.length; i++ ) {

			var f = files[i];
			var reader = new FileReader();
			reader.onload = function(e) {
				idx++;
				var newDIV1 = document.createElement("div");
				newDIV1.className = 'product-img delforthumb';
				
				var newDIV2 = document.createElement("div");
				newDIV2.className = 'shadow-lg thumb';
				var newIMG = document.createElement("img");
				newDIV2.appendChild(newIMG);

				//---------------------
				newDIV1.appendChild(newDIV2);
				//-----------------------
				document.getElementById('thumbbox').appendChild(newDIV1);
				var img = document.getElementsByClassName('thumb')[idx].childNodes[0];
				img.src = e.target.result;
				img.style.width = '16rem';
				img.style.height = '15rem';
				img.style.overflow = 'hidden';
				
			};
			reader.readAsDataURL(f);
		};     
		
		//보내질 파일 리스트
		console.log(e.target.files);
		lengthForThumb = files.length;
		thumbForSending = e.target.files;
		
		//썸네일 배열 생성
		createThumbArr();
	};
	
	var length = null;

	document.getElementById('clickUp').onclick = function(e) {
		//e.currentTarget.childNodes[3].click();
		document.getElementById('files').click();
		
		if(length != null){
			console.log("삭제시작");
			console.log(length);
			
			var elements = document.getElementsByClassName('del');
			while(elements.length > 0){
			    elements[0].parentNode.removeChild(elements[0]);
			};
		};
	};
	

	document.getElementById('files').onchange = function(e) {
		
		var idx = -1;
		var files = e.target.files;
		
		for (var i = 0; i < files.length; i++ ) {

			var f = files[i];
			var reader = new FileReader();
			reader.onload = function(e) {
				idx++;
				var newDIV1 = document.createElement("div");
				newDIV1.className = 'product-img del';
				
				var newDIV2 = document.createElement("div");
				newDIV2.className = 'shadow-lg normalimg';
				var newIMG = document.createElement("img");
				newDIV2.appendChild(newIMG);

				//---------------------
				newDIV1.appendChild(newDIV2);
				//-----------------------
				document.getElementById('imgbox').appendChild(newDIV1);
				var img = document.getElementsByClassName('normalimg')[idx].childNodes[0];
				img.src = e.target.result;
				img.style.width = '16rem';
				img.style.height = '15rem';
				img.style.overflow = 'hidden';
				
			}
			reader.readAsDataURL(f);
		};     
		
		//보내질 파일 리스트
		console.log(e.target.files);
		length = files.length;
	};
	
	function createThumbArr() {
		var thumbArr = new Array();
	
	    for (var i=0; i<lengthForThumb; i++) {
	    	thumbArr[i] = '1';
	    }
		document.getElementById('thumbArr').value = JSON.stringify(thumbArr); 
		alert('썸네일이 등록되었습니다.');
		console.log(thumbArr);
		console.log(document.getElementById('thumbArr'));
	};

}

</script>
<script type="text/javascript">
		
		function submitContents(elClickedObj) {
			
			// 에디터의 내용을 #content에 반영한다
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			try {
				//<form>태그의 submit을 수행한다
				elClickedObj.form.submit();
			} catch(e) {
			}
		}

		// 작성버튼 동작
		$("#btnWrite").click(function() {
			//스마트에디터의 내용을 <textarea>에 적용하는 함수를 호출한다
			submitContents( $("#btnWrite") );
			
			var special_pattern = /[~!@#$%^&*()_+|<>?:{}]/;

			if($('input[name="name"]').val() == ""){
				alert('상품명을 입력해 주세요');
				return false;
			}else if(special_pattern.test($('input[name="name"]').val())){
				alert('상품명에 특수문자가 들어갈 수 없습니다');
				return false;
			}else if($('#filesforthumb').val() == ""){
				alert('썸네일 이미지를 등록해 주세요');
				return false;
			}else if($('#files').val() == ""){
				alert('상세 이미지를 등록해 주세요');
				return false;
			}else if($('input[name="price"]').val() == ""){
				alert('가격을 입력해 주세요');
				return false;
			}else if($('input[name="stock"]').val() == ""){
				alert('재고를 입력해 주세요');
				return false;
			}else if($('input[name="company"]').val() == ""){
				alert('제조사를 입력해 주세요');
				return false;
			}else if(special_pattern.test($('input[name="company"]').val())){
				alert('제조사명에 특수문자가 들어갈 수 없습니다');
				return false;
			}else if($('input[name="dates"]').val() == ""){
				alert('제조일을 입력해 주세요');
				return false;
			}

			// 실제 <form>의 submit 수행
			$("form").submit();
		});
		
</script>

</html>
