<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/exercise/exercise.css">

<!-- HEADER -->
<%@include file="../layout/header.jsp"%>


<style	 type="text/css">
#label-container{
	color: white;
}
</style>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
$(document).ready(function() {
	init();
})

function countUpdate(count, set) {

	var delay = 1000;
	// count가 countMAX값 보다 같거나 클 때(운동 진행 중)
	if($(".progress-bar-count")[0].ariaValueMax >= count){
		
		$(".progress-bar-count").animate( {
			width: count / $(".progress-bar-count")[0].ariaValueMax * 100 + "%"
		}, delay, 'swing' );
		
		$(".progress-bar-count").attr("aria-valuenow", count).html(count + "개")
		
		
		// count가 countMAX값 같을 때(1세트 운동 끝)
		if($(".progress-bar-count")[0].ariaValueMax == count) {
			console.log("count가 MAX 달성 " + count)
			window.count = 0;
			count=0;
			console.log("count 0으로 대입 후  " + count)
			
			// 마지막 세트 끝나면 카운트는 증가x
			if($(".progress-bar-set")[0].ariaValueMax != set+1){
				
				$(".progress-bar-count").animate( {
					width: count / $(".progress-bar-count")[0].ariaValueMax * 100 + "%"
				}, delay, 'swing' );
			
				$(".progress-bar-count").attr("aria-valuenow", count).html(count + "개")
			}
			
			window.set++;
			set++;
			
			$('.progress-bar-set').animate( {
				width: set / $(".progress-bar-set")[0].ariaValueMax * 100 + "%"
			}, delay, 'swing' );
			
			$(".progress-bar-set").attr("aria-valuenow", set).html(set + "세트")
			
			
			// 운동 끝
			if($(".progress-bar-count")[0].ariaValueMax == set) {
				$(".complete").css({'pointer-events':'all'})
    			$(".complete").css({'cursor':'pointer'})
    			
//     			webcam.pause(); // 웹캠 중단
			}
		}
		console.log("운동함 " + count)
	}
}


function leftCountUpdate(progressCnt,exArr) {
	var delay = 1000;
	$("div[id='"+ exArr + "']").animate( {
		width:  Math.floor(progressCnt / ( $(".progress-bar-set")[0].ariaValueMax * $(".progress-bar-count")[0].ariaValueMax )  * 100) + "%"
	}, delay, 'swing' );
	
	$("div[id='"+ exArr + "']").html( Math.floor(progressCnt / ( $(".progress-bar-set")[0].ariaValueMax * $(".progress-bar-count")[0].ariaValueMax )  * 100) + "%")
}
</script>




<!-- section 시작 -->
<section>

	<!-- div wrap 시작 -->
	<div id="wrap">
	
		<!-- 프로그래스바 시작 -->
		<div class="max-w-5xl mx-auto my-16 border-b-2 pb-4">
			<div class="flex pb-3">
				<div class="flex-1"></div>

				<div class="flex-1">
					<div class="w-10 h-10 bg-green-500 mx-auto rounded-full text-lg text-white flex items-center">
						<span class="text-white text-center w-full">1</span>
					</div>
				</div>


				<div class="w-1/6 align-center items-center align-middle content-center flex">
					<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
						<div class="bg-green-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 100%"></div>
					</div>
				</div>


				<div class="flex-1">
					<div class="w-10 h-10 bg-green-500 mx-auto rounded-full text-lg text-white flex items-center">
						<span class="text-white text-center w-full">2</span>
					</div>
				</div>

				<div class="w-1/6 align-center items-center align-middle content-center flex">
					<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
						<div class="bg-green-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 100%"></div>
					</div>
				</div>

				<div class="flex-1">
					<div class="w-10 h-10 bg-green-500 mx-auto rounded-full text-lg text-white flex items-center">
						<span class="text-white text-center w-full">3</span>
					</div>
				</div>


				<div class="w-1/6 align-center items-center align-middle content-center flex">
					<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
						<div class="bg-green-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 100%"></div>
					</div>
				</div>


				<div class="flex-1">
					<div class="w-10 h-10 bg-green-500 mx-auto rounded-full text-lg text-white flex items-center">
						<span class="text-white text-center w-full">4</span>
					</div>
				</div>


				<div class="flex-1"></div>
			</div>

			<div class="flex text-base content-center text-center">
				<div class="w-1/4">종류선택</div>
				<div class="w-1/4">등급선택</div>
				<div class="w-1/4">운동선택</div>
				<div class="w-1/4">운동시작</div>
			</div>
		</div>
		<!-- 프로그래스바 끝 -->

		<!-- 안내문구 시작 -->
		<div class="container_checkbox">
			<h1 class="level-title">파이팅, 포기하지 마세요!</h1>
		</div>
		<!-- 안내문구 끝 -->

		<!-- left layout 시작 -->
		<div id="left">
		
			<!-- 프로필 템플릿 시작 -->
			<div class="w-full bg-white flex flex-row flex-wrap p-3">
				<div class="mx-auto w-full">
					<!-- Profile Card -->
					<div class="rounded-lg shadow-lg bg-gray-600 w-full flex flex-row flex-wrap p-3 antialiased"
						style="background-image: url('https://images.unsplash.com/photo-1578836537282-3171d77f8632?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1950&amp;q=80'); background-repeat: no-repat; background-size: cover; background-blend-mode: multiply;">
						<div class="md:w-1/3 w-full">
							<img class="rounded-lg shadow-lg antialiased"
								src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png">
						</div>
						<div class="md:w-2/3 w-full px-3 flex flex-row flex-wrap">
							<div
								class="w-full text-right text-gray-700 font-semibold relative pt-3">
								<div class="text-2xl text-white leading-tight">홍길동</div>
								<div class="text-normal text-gray-300">신장 172cm</div>
								<div class="text-normal text-gray-300">체중 100kg</div>
								<div class="text-normal text-gray-300">나이 30살</div>
							</div>
						</div>
					</div>
					<!-- End Profile Card -->
				</div>
			</div>
			<!-- 프로필 템플릿 끌 -->

			<!-- 프로그래스바 템플릿 시작 -->
			<div style="margin: 10px 15px;">
				<div style="width: 100%;">
					<h5 class="progressbar-title">전신</h5>
					<p class="progressbar-content">운동1</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="10"
							aria-valuemin="0" aria-valuemax="100" id="plank">10</div>
					</div>
					<p class="progressbar-content">운동2</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="20"
							aria-valuemin="0" aria-valuemax="100" id="jumpingjack">20</div>
					</div>
					<p class="progressbar-content">운동3</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="30"
							aria-valuemin="0" aria-valuemax="100" id="burpee">30</div>
					</div>
					<h5 class="progressbar-title">상체</h5>
					<p class="progressbar-content">운동4</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="40"
							aria-valuemin="0" aria-valuemax="100" id="legraise">40</div>
					</div>
					<p class="progressbar-content">운동5</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="50"
							aria-valuemin="0" aria-valuemax="100" id="crunch">50</div>
					</div>
					<p class="progressbar-content">운동6</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="60"
							aria-valuemin="0" aria-valuemax="100" id="pushup">60</div>
					</div>
					<h5 class="progressbar-title">하체</h5>
					<p class="progressbar-content">운동7</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="70"
							aria-valuemin="0" aria-valuemax="100">70</div>
					</div>
					<p class="progressbar-content">운동8</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="0"
							aria-valuemin="0" aria-valuemax="100" id="squat">0</div>
					</div>
					<p class="progressbar-content">운동9</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="90"
							aria-valuemin="0" aria-valuemax="100" id="lunge">90</div>
					</div>
				</div>
			</div>
			<!-- 프로그래스바 템플릿 끝 -->
			
		</div>
		<!-- left layout 끝 -->

		<!-- right layout 시작 -->
		<div id="right">
		
		
			<c:if test="${exerciseName eq 'legraise' }">
				<%@include file="./legraise.jsp"%>
			</c:if>
		
		
		
			
		</div>
		<!-- right layout 끝 -->

	</div>
	<!-- div wrap 끝 -->
	
</section>
<!-- section 끝 -->


<!-- FOOTER -->
<%@include file="../layout/footer.jsp"%>