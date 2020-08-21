<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/exercise/exercise.css">


<!-- HEADER -->
<%@include file="../layout/header.jsp" %>


<script type="text/javascript">

$(document).ready(function() {
	
	$(".form").submit(function() {
		if( !($("input:radio[name='exerType']").is(":checked")) ) {
			alert("1개 이상을 선택해주세요")
			return false;
		}
		$(this).submit()
	})
	
	if( <%= session.getAttribute("exerType") %> != null) {
		console.log("들어왔다~")
		$("input:radio[id='<%= session.getAttribute("exerType") %>']").prop("checked", true)
	}
});
</script>


<!-- section 시작 -->
<section>
	<!-- div wrap 시작 -->
	<div id="wrap">
	
		<!-- 프로그래스바 시작 -->
		<div class="max-w-5xl mx-auto my-16 border-b-2 pb-4">	
		<div class="flex pb-3">
			<div class="flex-1">
			</div>
	
			<div class="flex-1">
				<div class="w-10 h-10 bg-green-500 mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-white text-center w-full">1</span>
				</div>
			</div>
	
	
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-green-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 20%"></div>
				</div>
			</div>
		
			
			<div class="flex-1">
				<div class="w-10 h-10 bg-white border-2 border-grey-light mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-gray-600 text-center w-full">2</span>
				</div>
			</div>
		
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-green-light text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 0%"></div>
				</div>
			</div>
		
			<div class="flex-1">
				<div class="w-10 h-10 bg-white border-2 border-grey-light mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-gray-600 text-center w-full">3</span>
				</div>
			</div>
		
		
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-green-light text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 0%"></div>
				</div>
			</div>
	
	
			<div class="flex-1">
				<div class="w-10 h-10 bg-white border-2 border-grey-light mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-gray-600 text-center w-full">4</span>
				</div>
			</div>
		
		
			<div class="flex-1">
			</div>		
		</div>
		
		<div class="flex text-base content-center text-center">
			<div class="w-1/4">
				종류선택
			</div>
			<div class="w-1/4">
				등급선택
			</div>
			<div class="w-1/4">
				운동선택
			</div>
			<div class="w-1/4">
				운동시작
			</div>			
		</div>
		</div>
		<!-- 프로그래스바 끝 -->
		
		<!-- radiobox 시작 -->
		<div class="container_checkbox">
		
		<h1 class="level-title">종류를 선택해주세요</h1>
		
		<form class="form cf" action="<%=request.getContextPath() %>/exercise/level" method="post">
			<section class="plan cf flex">
				<input type="radio" name="exerType" id="myExer" value="myExer" checked="checked"><label class="free-label four col " for="myExer">설정한 목표 불러오기</label>
				<input type="radio" name="exerType" id="newExer" value="newExer"><label class="premium-label four col" for="newExer">새로운 목표 설정하기</label>
			</section>
			
			<!-- 버튼 시작 -->
			<div class="flex nav-button margin-topbottom">
			    <button type="submit" class="border border-gary-500 bg-green-500 text-white block rounded-sm font-bold py-4 px-6 ml-2 flex items-center">
			        Next page
			        <svg class="h-5 w-5 ml-2 fill-current" clasversion="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			             viewBox="-49 141 512 512" style="enable-background:new -49 141 512 512;" xml:space="preserve">
			        <path id="XMLID_11_" d="M-24,422h401.645l-72.822,72.822c-9.763,9.763-9.763,25.592,0,35.355c9.763,9.764,25.593,9.762,35.355,0
			            l115.5-115.5C460.366,409.989,463,403.63,463,397s-2.634-12.989-7.322-17.678l-115.5-115.5c-9.763-9.762-25.593-9.763-35.355,0
			            c-9.763,9.763-9.763,25.592,0,35.355l72.822,72.822H-24c-13.808,0-25,11.193-25,25S-37.808,422-24,422z"/>
			        </svg>
			    </button>
			</div>
			<!-- 버튼 끝 -->
			
		</form>
		</div>
		<!-- radiobox 끝 -->
		
	</div>
	<!-- div wrap 끝 -->

</section>
<!-- section 끝 -->


<!-- FOOTER -->
<%@include file="../layout/footer.jsp" %>