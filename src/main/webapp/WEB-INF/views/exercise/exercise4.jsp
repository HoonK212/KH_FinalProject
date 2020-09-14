<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/exercise/exercise.css">

<!-- HEADER -->
<%@include file="../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	exerChange(window.exerArrList[exerCnt]);
	
})
var exerCnt = 0;
var exerArrList = new Array();
var exerCountArr = new Array();

exerArrList[0] = "${exerciseInfo[0]}";
exerArrList[1] = "${exerciseInfo[1]}";
exerArrList[2] = "${exerciseInfo[2]}";
exerArrList[3] = "${exerciseInfo[3]}";
exerArrList[4] = "${exerciseInfo[4]}";
exerArrList[5] = "${exerciseInfo[5]}";
exerArrList[6] = "${exerciseInfo[6]}";
exerArrList[7] = "${exerciseInfo[7]}";
exerArrList[8] = "${exerciseInfo[8]}";

exerCountArr[0] = "${exerciseCount[0]}";
exerCountArr[1] = "${exerciseCount[1]}";
exerCountArr[2] = "${exerciseCount[2]}";
exerCountArr[3] = "${exerciseCount[3]}";
exerCountArr[4] = "${exerciseCount[4]}";
exerCountArr[5] = "${exerciseCount[5]}";
exerCountArr[6] = "${exerciseCount[6]}";
exerCountArr[7] = "${exerciseCount[7]}";
exerCountArr[8] = "${exerciseCount[8]}";



function countUpdate(count, set, exer) {
	
    
	var delay = 1000;
	// count가 countMAX값 보다 같거나 클 때(운동 진행 중)
	if($(".progress-bar-count")[0].ariaValueMax >= count){
		$(".progress-bar-count").animate( { width: count / $(".progress-bar-count")[0].ariaValueMax * 100 + "%"	}, delay, 'swing');
		if(exer == 'plank') {
			$(".progress-bar-count").attr("aria-valuenow", count).html(count + "초")
		} else {
			$(".progress-bar-count").attr("aria-valuenow", count).html(count + "개")
		}
		
		
		// count가 countMAX값 같을 때(1세트 운동 끝)
		if($(".progress-bar-count")[0].ariaValueMax == count) {
			console.log("count가 MAX 달성 " + count)
			window.count = 0;
			count=0;
			totalTime=0;
			runningTime=0;
			console.log("count 0으로 대입 후  " + count)
			
			// 마지막 세트 끝나면 카운트는 증가x
			if($(".progress-bar-set")[0].ariaValueMax != set+1){
				
				$(".progress-bar-count").animate( { width: count / $(".progress-bar-count")[0].ariaValueMax * 100 + "%"	}, delay, 'swing');
				if(exer == 'plank') {
					$(".progress-bar-count").attr("aria-valuenow", count).html(count + "초")
				} else {
					$(".progress-bar-count").attr("aria-valuenow", count).html(count + "개")
				}
				
			}
			
			window.set++;
			set++;
			console.log('세이트: ' + set)
			$('.progress-bar-set').animate( { width: set / $(".progress-bar-set")[0].ariaValueMax * 100 + "%" }, delay, 'swing');
			
			$(".progress-bar-set").attr("aria-valuenow", set).html(set + "세트")
			
			
			// 운동 끝
			if($(".progress-bar-set")[0].ariaValueMax == set) {
				
    			exerCnt++;
    			
				if(window.exerArrList[exerCnt] != "") {
	    			window.set = 0;
					set = 0;
					
					console.log("엑설엑설 : " + exerCnt);
					setTimeout("alert('충분한 휴식을 취한 후 다음 운동을 진행하려면 확인 버튼을 누르세요.')", 2000);
					setTimeout("exerChange(window.exerArrList[exerCnt]);", 2000);
					
					
	    			
				} else {
					setTimeout("alert('선택한 운동이 끝났습니다.\n운동 보상 받기 버튼을 클릭해 보상을 받으세요!')", 2000);
					$(".complete").css({'pointer-events':'all'});
	    			$(".complete").css({'cursor':'pointer'});
				}
				
    			
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

// AJAX 통신 - 운동정보 변경
function exerChange(exerName) {
	console.log(" = = = = = = = = = = = = = = = = = = = = = = =")
	console.log(exerName)
	var xhr = new XMLHttpRequest();
	
	xhr.open('GET', '<%=request.getContextPath()%>/exercise/nextexer?exerName='+exerName);
	
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	
	xhr.send();
	
	xhr.addEventListener('load', function() {
		
		var data = xhr.response;
		console.dir(data)
		
		document.querySelector('#right').innerHTML = data;
		
		// 운동 바뀔 때마다 횟수 적용
		document.querySelector('.progress-bar-count').ariaValueMax = exerCountArr[exerCnt];

		// 운동 바뀔 때마다 왼쪽 프로그레바 변수 0으로 초기화
		window.progressCnt = 0; 
		
		// 다음 운동 실행
		eval(exerArrList[exerCnt]+"();");
		
		console.log("새로로로로로로로로로로로")
		console.dir(URL)
	})
	
}

function exerChangejs(exerName) {
	console.log(" = = = = = = = = = = = = = = = = = = = = = = =")
	console.log(exerName)
	var xhr = new XMLHttpRequest();
	
	xhr.open('GET', '<%=request.getContextPath()%>/exercise/nextexerjs?exerName='+exerName);
	
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	
	xhr.send();
	
	xhr.addEventListener('load', function() {
		
		var data = xhr.response;
		eval(data);
	})
	
}

$(".complete").click(function() {
	console.log("클릭");
	location.href = "<%=request.getContextPath()%>/exercise/exercisefinish";
})
</script>


<!-- section 시작 -->
<section style="min-height:73vh;">

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
                                src="<%=request.getContextPath() %>/resources/upload_user/${logInPic.renamed }.${logInPic.ext }">
						</div>
						<div class="md:w-2/3 w-full px-3 flex flex-row flex-wrap">
							<div
								class="w-full text-right text-gray-700 font-semibold relative pt-3">
								<div class="text-2xl text-white leading-tight">${logInInfo.nick }</div>
								<div class="text-normal text-gray-300 mt-1">만 ${userAge }살</div>
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
					
					<c:set var="exerCount1" value="0" />
					<c:set var="exerCount2" value="0" />
					<c:set var="exerCount3" value="0" />
					
					<c:forEach items="${leftExerInfo }" var="exerInfo">
					<c:if test="${exerInfo.type eq 1}">
						<c:set var="exerCount1" value="${exerCount1+1 }" />
						<c:if test="${exerCount1 eq 1}">
							<h5 class="progressbar-title">전신</h5>
						</c:if>
						<p class="progressbar-content">${exerInfo.name }</p>
						<div class="progress">
							<div class="progress-bar" role="progressbar" aria-valuenow="0"  aria-valuemin="0" aria-valuemax="100" id="${exerInfo.name }"></div>
						</div>
					</c:if>
					</c:forEach>
					
					
					<c:forEach items="${leftExerInfo }" var="exerInfo">
					<c:if test="${exerInfo.type eq 2}">
						<c:set var="exerCount2" value="${exerCount2+1 }" />
						<c:if test="${exerCount2 eq 1}">
							<h5 class="progressbar-title">상체</h5>
						</c:if>
						<p class="progressbar-content">${exerInfo.name }</p>
						<div class="progress">
							<div class="progress-bar" role="progressbar" aria-valuenow="0"  aria-valuemin="0" aria-valuemax="100" id="${exerInfo.name }"></div>
						</div>
					</c:if>
					</c:forEach>
					
					<c:forEach items="${leftExerInfo }" var="exerInfo">
					<c:if test="${exerInfo.type eq 3}">
						<c:set var="exerCount3" value="${exerCount3+1 }" />
						<c:if test="${exerCount3 eq 1}">
							<h5 class="progressbar-title">하체</h5>
						</c:if>
						<p class="progressbar-content">${exerInfo.name }</p>
						<div class="progress">
							<div class="progress-bar" role="progressbar" aria-valuenow="0"  aria-valuemin="0" aria-valuemax="100" id="${exerInfo.name }"></div>
						</div>
					</c:if>
					</c:forEach>
					
				</div>
			</div>
			<!-- 프로그래스바 템플릿 끝 -->
			
		</div>
		<!-- left layout 끝 -->

		<!-- right layout 시작 -->
		<div id="right">
		
				<!-- 운동설명, 캠 영역 -->
				
		</div>
		<!-- right layout 끝 -->

	</div>
	<!-- div wrap 끝 -->
</section>
<!-- section 끝 -->
<!-- JS 통합 -->
<script type="text/javascript">

var URL, model, webcam, ctx, labelContainer, maxPredictions, modelURL, metadataURL, flip, canvas, minPartConfidence;
var status;
var set = 0;
var progressCnt = 0;
var count = 0;
var jumpingcnt = 0; // jumpingjack 가짜 cnt
var burpeeCnt = 0; // burpee 가짜 cnt
var crunchCnt = 0; // crunch 가짜 cnt
var sideCnt = 0; // sidelunge 가짜 cnt

var start=0;
var end=0;
var runningTime=0;
var totalTime=0;

async function init() {
    modelURL = URL + "model.json";
	metadataURL = URL + "metadata.json";

	model = await tmPose.load(modelURL, metadataURL);
	maxPredictions = model.getTotalClasses();

	flip = true;
	webcam = new tmPose.Webcam(512, 480, flip);
	await webcam.setup();
	await webcam.play();
	window.requestAnimationFrame(loop);

	canvas = document.getElementById("canvas");
	canvas.width = 512; 
	canvas.height = 480;
	ctx = canvas.getContext("2d");
	labelContainer = document.getElementById("label-container");
	for (let i = 0; i < maxPredictions; i++) {
        labelContainer.appendChild(document.createElement("div"));
    }
}

async function loop(timestamp) {
	webcam.update();
	await predict();
	window.requestAnimationFrame(loop);
}

var predict;
var prediction, audio, classPrediction;
var pose

function drawPose(pose) {
	if (webcam.canvas) {
		ctx.drawImage(webcam.canvas, 0, 0);
		if (pose) {
			minPartConfidence = 0.5;
			tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
			tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
		}
	}
};

/* 플랭크 시작 */
var plank_predict = async function predict() {
    var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
    prediction = await model.predict(posenetOutput);

    if(start == 0) {
	    start = Date.now(); // 이걸 predict밖에 선언
    	
    }
    
    if(prediction[0].probability.toFixed(2) >= 0.80) {
    	
    	if(status == 'unplank') {
    		start = Date.now();
    		status = 'plank';
    	}
    	
    	end = Date.now();
    	runningTime = end - start;
    	
    	if( Math.floor( (totalTime+runningTime) / 1000 ) == count+1 ) {
    		
    		console.log("운동함")
    		
    		count++;
			progressCnt++;
			
			countUpdate(count, set, "plank");
			leftCountUpdate(progressCnt, "plank");
    	}
    	
    	status = 'plank';
    	
    } else {
    	if(status == 'plank') {
    		totalTime += runningTime;
    	}
    	status = 'unplank';
    }
    
    for (let i = 0; i < maxPredictions; i++) {
        classPrediction =
        prediction[i].className + ": " + prediction[i].probability.toFixed(2);
    }

    drawPose(pose);
}
/* 플랭크 끝 */

/* 점핑잭 시작 */
var jumpingjack_predict = async function predict() {
	var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
	prediction = await model.predict(posenetOutput);

	if(prediction[0].probability.toFixed(2) == 1.00) {
    	
		if(status == "jump1" && jumpingcnt==1){
			jumpingcnt++;
			console.log(jumpingcnt);
		}
    	
		if(jumpingcnt >= 4){
			count++;
			progressCnt++;
			
			console.log("카운터 증가" + count);
			audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
			audio.play();
			console.log(count);

			countUpdate(count, set, "jumpingjack");
			leftCountUpdate(progressCnt, "jumpingjack");
			window.jumpingcnt = 0;
			console.log("0으로 선언후"+jumpingcnt);
		}
    	
		status = "stand";
		console.log(status);
	} else if(prediction[1].probability.toFixed(2) == 1.00) {
		if(status == "stand" && jumpingcnt == 0){
			jumpingcnt++;
			console.log(jumpingcnt);
		}
		if(status == "stand" && jumpingcnt == 2){
			jumpingcnt++;
			console.log(jumpingcnt);
		}
		if(status == "jump2" && jumpingcnt == 4){
			jumpingcnt++;
			console.log(jumpingcnt);
		}

		status = "jump1";
		console.log("그냥 점프1"+status);
	}else if(prediction[2].probability.toFixed(2) == 1.00) {

		if(status == "jump1" && jumpingcnt == 3){
			jumpingcnt++;
			console.log(jumpingcnt);
		}

		status = "jump2";
		console.log("그냥 점프2"+status);
	}
    	
	for (let i = 0; i < maxPredictions; i++) {
		classPrediction =
		prediction[i].className + ": " + prediction[i].probability.toFixed(2);
	}

	drawPose(pose);
}
/* 점핑잭 끝 */

/* 버피 시작 */
var burpee_predict = async function predict() {
	var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
	prediction = await model.predict(posenetOutput);

	if(prediction[0].probability.toFixed(2) == 1.00) {

		if(status == "burpee1" && burpeeCnt == 3) { 

			count++;
			progressCnt++;
			
			console.log("카운터 증가" + count);
			audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
			audio.play();
			console.log(count);

			countUpdate(count, set, "burpee");
			leftCountUpdate(progressCnt, "burpee");
			window.burpeeCnt = 0;
			console.log("0으로 선언후"+burpeeCnt);
		}
    	
		status = "stand";
		console.log(status);
	} else if(prediction[1].probability.toFixed(2) == 1.00) {
		if(status == "stand" && burpeeCnt == 0 ){
			burpeeCnt++;
			console.log(burpeeCnt);
		}
		if(status == "burpee2" && burpeeCnt == 2 ){
			burpeeCnt++;
			console.log(burpeeCnt);
		}

		status = "burpee1";
		console.log("여기가 기본"+status);
	} else if(prediction[2].probability.toFixed(2) == 1.00) {
		if(status == "burpee1" && burpeeCnt == 1 ){
			burpeeCnt++;
			console.log(burpeeCnt);
		}
		status = "burpee2";
		console.log("여기가 기본"+status);
	} 
    	
	for (let i = 0; i < maxPredictions; i++) {
		classPrediction =
		prediction[i].className + ": " + prediction[i].probability.toFixed(2);
	}

    drawPose(pose);
}
/* 버피 끝 */

/* 레그레이즈 시작 */
var legraise_predict = async function predict() {
	var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
	prediction = await model.predict(posenetOutput);

	if(prediction[0].probability.toFixed(2) == 1.00) {
		console.log("레그다운들어옴"+status);
    		
		status = "legdown";
		console.log(status);
	} else if(prediction[1].probability.toFixed(2) == 1.00) {
		if(status == "legdown") { 
			count++;
			progressCnt++;

			console.log("카운터 증가" + count);
			var audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
			audio.play();
			console.log(count);

			countUpdate(count, set, "legraise");
			leftCountUpdate(progressCnt, "legraise");
		}
		status = "legup";
		console.log("여기가 업"+status);
	}
    
	for (let i = 0; i < maxPredictions; i++) {
		classPrediction =
		prediction[i].className + ": " + prediction[i].probability.toFixed(2);
    }

    drawPose(pose);
}
/* 레그레이즈 끝 */

/* 크런치 시작 */
var crunch_predict = async function predict() {
	var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
	prediction = await model.predict(posenetOutput);

	if(prediction[0].probability.toFixed(2) == 1.00) {
    	console.log("클래스1 들어옴"+status);
    		
		if(crunchCnt == 1){
		 	if(status == "bent") { 
				        		
    		count++;
    		progressCnt++;
			
    		console.log("카운터 증가" + count);
    		var audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
    		audio.play();
    		console.log(count);

    		countUpdate(count, set, "crunch");
    		leftCountUpdate(progressCnt, "crunch");
    		window.crunchCnt = 0;
    		console.log("0으로 선언후"+crunchCnt);
    		}
    	}
    	
		if(status == "bent" && crunchCnt == 0) { 
			crunchCnt++;
    		console.log("점프카운트 증가후"+crunchCnt);
		}
    	
    	status = "up";
		console.log(status);
    } else if(prediction[1].probability.toFixed(2) == 1.00) {
    	status = "bent";
    	console.log("여기가 기본 class2"+status);
    }
    
    for (let i = 0; i < maxPredictions; i++) {
        classPrediction =
        prediction[i].className + ": " + prediction[i].probability.toFixed(2);
    }

    drawPose(pose);
}
/* 크런치 끝 */

/* 푸쉬업 시작 */
var pushup_predict = async function predict() {
	var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
    prediction = await model.predict(posenetOutput);

    if(prediction[0].probability.toFixed(2) == 1.00) {
       console.log(status);
       if(status == "pushdown") {
			count++;
			progressCnt++;
			console.log("카운터 증가" + count);
			audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
			audio.play();
			console.log(count);
			
			countUpdate(count, set, "pushup");
			leftCountUpdate(progressCnt, "pushup");
	   }
   
		status = "pushup";
		console.log(status);
   } else if(prediction[1].probability.toFixed(2) == 1.00) {
		status = "pushdown";
		console.log(status);
   }                                    
      
   for (let i = 0; i < maxPredictions; i++) {
		classPrediction =
		prediction[i].className + ": " + prediction[i].probability.toFixed(2);
   }
   
   drawPose(pose);
}
/* 푸쉬업 끝 */

/* 니푸쉬업 시작 */
var kneepushup_predict = async function predict() {
	var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
    prediction = await model.predict(posenetOutput);

    if(prediction[0].probability.toFixed(2) == 1.00) {
       console.log(status);
       if(status == "pushdown") {
			count++;
			progressCnt++;
			console.log("카운터 증가" + count);
			audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
			audio.play();
			console.log(count);
			
			countUpdate(count, set, "kneepushup");
			leftCountUpdate(progressCnt, "kneepushup");
	   }
   
		status = "pushup";
		console.log(status);
   } else if(prediction[1].probability.toFixed(2) == 1.00) {
		status = "pushdown";
		console.log(status);
   }                                    
      
   for (let i = 0; i < maxPredictions; i++) {
		classPrediction =
		prediction[i].className + ": " + prediction[i].probability.toFixed(2);
   }
   
   drawPose(pose);
}
/* 니푸쉬업 끝 */

/* 사이드런지 시작 */
var sidelunge_predict = async function predict() {
    var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
    prediction = await model.predict(posenetOutput);

    if(prediction[0].probability.toFixed(2) == 1.00) {
    	
    	if(status == "left" && sideCnt==1){
    		sideCnt++;
    		console.log(sideCnt);
    	}
    	
    	if(status == "right" && sideCnt==3){
    		sideCnt++;
    		console.log(sideCnt);
    	}
    	
    	if(sideCnt == 4){
			count++;
    		progressCnt++;
			
    		console.log("카운터 증가" + count);
    		var audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
    		audio.play();
    		console.log(count);

    		countUpdate(count, set, "sidelunge");
    		leftCountUpdate(progressCnt, "sidelunge");
    		window.sideCnt = 0;
    		console.log("0으로 선언후"+sideCnt);
    	}
    	
    	status = "stand";
		console.log(status);
    } else if(prediction[1].probability.toFixed(2) == 1.00) {
		if(status == "stand" && sideCnt == 0){
			sideCnt++;
			console.log(sideCnt);
		}
		
    	status = "left";
    	console.log(status);
    } else if(prediction[2].probability.toFixed(2) == 1.00) {
		if(status == "stand" && sideCnt == 2){
			sideCnt++;
			console.log(sideCnt);
		}
    	status = "right";
    	console.log(status);
    }
    
    for (let i = 0; i < maxPredictions; i++) {
        classPrediction =
        prediction[i].className + ": " + prediction[i].probability.toFixed(2);
    }

    drawPose(pose);
}
/* 사이드런지 끝 */


/* 스쿼트 시작 */
var squat_predict = async function predict() {
	var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
	prediction = await model.predict(posenetOutput);

    if(prediction[0].probability.toFixed(2) == 1.00) {
    	
    	if(status == "squat") {
			count++;
    		progressCnt++;
			
    		console.log("카운터 증가" + count);
    		audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
    		audio.play();
    		console.log(count);
    		
    		countUpdate(count, set, "squat");
    		leftCountUpdate(progressCnt, "squat");
    		
    	}
    	
    	status = "stand";
		console.log(status);
    } else if(prediction[1].probability.toFixed(2) == 1.00) {
		status = "squat";
		console.log(status);
	} else if(prediction[2].probability.toFixed(2) == 1.00) {
    	status = "bent";
    	console.log(status);
    } else if(prediction[3].probability.toFixed(2) == 1.00) {
    	
    	console.log("wrong");
    } 
    	
    for (let i = 0; i < maxPredictions; i++) {
		classPrediction =
        prediction[i].className + ": " + prediction[i].probability.toFixed(2);
    }

    drawPose(pose);
}
/* 스쿼트 끝 */

/* 런지 시작 */
var lunge_predict = async function predict() {
   var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
    prediction = await model.predict(posenetOutput);

    if(prediction[0].probability.toFixed(2) == 1.00) {
       if(status == "down") { 
			count++;
			progressCnt++;
			
			console.log("카운터 증가" + count);
			audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
			audio.play();
			
			countUpdate(count, set, "lunge");
			leftCountUpdate(progressCnt, "lunge");
		}
		status = "stand";
		console.log(status);
	} else if(prediction[1].probability.toFixed(2) == 1.00) {
		status = "down";
		console.log(status);
	}
   
	for (let i = 0; i < maxPredictions; i++) {
		classPrediction = prediction[i].className + ": " + prediction[i].probability.toFixed(2);
// 		labelContainer.childNodes[i].innerHTML = classPrediction;
	}
   
   drawPose(pose);
}
/* 런지 끝 */


/* 진짜 실행할 함수 영역 */
function plank() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/plank/";
	predict = plank_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/side.mp3');
    audio.play();
}

function jumpingjack() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/jumpingjack/";
	predict = jumpingjack_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/face.mp3');
    audio.play();
}

function burpee() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/burpee/";
	predict = burpee_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/side.mp3');
    audio.play();
}

function legraise() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/legraise/";
	predict = legraise_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/side.mp3');
    audio.play();
}

function crunch() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/crunch/";
	predict = crunch_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/side.mp3');
    audio.play();
}

function pushup() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/pushup/";
	predict = pushup_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/side.mp3');
    audio.play();
}

function kneepushup() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/kneepushup/";
	predict = kneepushup_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/side.mp3');
    audio.play();
}

function sidelunge() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/sidelunge/";
	predict = sidelunge_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/side.mp3');
    audio.play();
}

function squat(){
	URL = "<%=request.getContextPath() %>/resources/motionmodel/squat/";
	predict = squat_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/face.mp3');
    audio.play();
}

function lunge() {
	URL = "<%=request.getContextPath() %>/resources/motionmodel/lunge/";
	predict = lunge_predict;
	init();
	audio = new Audio('<%=request.getContextPath() %>/resources/audio/side.mp3');
    audio.play();
}
</script>


<!-- FOOTER -->
<%@include file="../layout/footer.jsp"%>