<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/exercise/exercise.css">

<!-- HEADER -->
<%@include file="../layout/header.jsp"%>


<script type="text/javascript">
/* 프로그래스바 jQuery 시작 */

$(document).ready(function() {

	init();
	
	var delay = 1000;
	$(".progress-bar").each(function() {
		$(this).animate({
			width : $(this).attr('aria-valuenow') + '%'
		}, delay);

		$(this).prop('Counter', 0).animate({
			Counter : $(this).text()
		}, {
			duration : delay,
			easing : 'swing',
			step : function(now) {
				$(this).text(Math.ceil(now) + '%');
			}
		});
	});
	$(".progress-bar-count").each(function() {
		$(this).animate({
			width : $(this).attr('aria-valuenow') + '%'
		}, delay);

		$(this).prop('Counter', 0).animate({
			Counter : $(this).text()
		}, {
			duration : delay,
			easing : 'swing',
			step : function(now) {
				$(this).text(Math.ceil(now) + '개');
			}
		});
	});
	$(".progress-bar-time").each(function() {
		$(this).animate({
			width : $(this).attr('aria-valuenow') + '%'
		}, delay);

		$(this).prop('Counter', 0).animate({
			Counter : $(this).text()
		}, {
			duration : delay,
			easing : 'swing',
			step : function(now) {
				$(this).text(Math.ceil(now) + '개');
			}
		});
	});
	
	
	
})
/* 프로그래스바 jQuery 끝 */
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
							aria-valuemin="0" aria-valuemax="100">10</div>
					</div>
					<p class="progressbar-content">운동2</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="20"
							aria-valuemin="0" aria-valuemax="100">20</div>
					</div>
					<p class="progressbar-content">운동3</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="30"
							aria-valuemin="0" aria-valuemax="100">30</div>
					</div>
					<h5 class="progressbar-title">상체</h5>
					<p class="progressbar-content">운동4</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="40"
							aria-valuemin="0" aria-valuemax="100">40</div>
					</div>
					<p class="progressbar-content">운동5</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="50"
							aria-valuemin="0" aria-valuemax="100">50</div>
					</div>
					<p class="progressbar-content">운동6</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="60"
							aria-valuemin="0" aria-valuemax="100">60</div>
					</div>
					<h5 class="progressbar-title">하체</h5>
					<p class="progressbar-content">운동7</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="70"
							aria-valuemin="0" aria-valuemax="100">70</div>
					</div>
					<p class="progressbar-content">운동8</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="80"
							aria-valuemin="0" aria-valuemax="100">80</div>
					</div>
					<p class="progressbar-content">운동9</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="90"
							aria-valuemin="0" aria-valuemax="100">90</div>
					</div>
					<p class="progressbar-content">운동10</p>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="100"
							aria-valuemin="0" aria-valuemax="100">100</div>
					</div>
				</div>
			</div>
			<!-- 프로그래스바 템플릿 끝 -->
			
		</div>
		<!-- left layout 끝 -->

		<!-- right layout 시작 -->
		<div id="right">
		
			<!-- 캠 레이아웃 시작 -->
			<div class="antialiased max-w-full mx-auto px-8">
				<div class="relative block md:flex items-center">
					<div class="w-auto md:w-1/2 relative z-1 bg-gray-100 rounded shadow-lg overflow-hidden">
						<div class="text-lg font-medium text-black-500 uppercase p-8 text-center border-b border-gray-200 tracking-wide">운동 정보</div>
						<div class="block sm:flex md:block items-center justify-center layout-overflow">
							<div class="w-full text-center">

								<!-- 단계별 설명 탬플릿 시작 -->
								<div class="flex flex-col justify-center m-auto">
									<div class="flex flex-col bg-teal-200 justify-center text-center">
										<div class="flex flex-col justify-center items-center relative">
											<div class="w-56 h-12 hidden justify-center">
												<div class="h-full  border-teal-300 border-dashed"></div>
											</div>
											<div
												class="rounded-full w-12 h-12 text-xl text-teal-100 bg-teal-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">1</div>
											<img alt="step1" class="w-56 h-56 shadow my-5 object-scale-down" src="https://image.flaticon.com/icons/svg/1330/1330216.svg">
											<div class="w-56 h-12 hidden justify-center">
												<div class="h-full border-r-4 border-teal-300 border-dashed"></div>
											</div>
										</div>
										<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-teal-200">
											<div class="text-xs uppercase font-bold text-teal-500">Step 1</div>
											<div class="text-xl font-bold text-teal-700">Find your best idea</div>
										</div>
									</div>

									<div class="flex flex-col bg-orange-200 justify-center text-center">
										<div class="flex flex-col justify-center items-center relative">
											<div class="w-56 h-12 hidden justify-center">
												<div class="h-full border-r-4 border-orange-300 border-dashed"></div>
											</div>
											<div class="rounded-full w-12 h-12 text-xl text-orange-100 bg-orange-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">2</div>
											<img alt="step2" class="w-56 h-56 shadow my-5 object-scale-down" src="https://image.flaticon.com/icons/svg/1330/1330216.svg">
											<div class="w-56 h-12 hidden justify-center">
												<div class="h-full border-r-4 border-orange-300 border-dashed"></div>
											</div>
										</div>
										<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-orange-200">
											<div class="text-xs uppercase font-bold text-orange-500">Step 2</div>
											<div class="text-xl font-bold text-orange-700">Find your team and collaborate</div>
										</div>
									</div>

									<div class="flex flex-col bg-indigo-200 justify-center text-center">
										<div class="flex flex-col justify-center items-center relative">
											<div class="w-56 h-12 hidden justify-center">
												<div class="h-full border-r-4 border-indigo-300 border-dashed"></div>
											</div>
											<div class="rounded-full w-12 h-12 text-xl text-indigo-100 bg-indigo-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">3</div>
											<img alt="step3" class="w-56 h-56 shadow my-5 object-scale-down" src="https://image.flaticon.com/icons/svg/1330/1330216.svg">
											<div class="w-56 h-12 hidden justify-center">
												<div class="h-full border-r-4 border-indigo-300 border-dashed"></div>
											</div>
										</div>
										<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-indigo-200">
											<div class="text-xs uppercase font-bold text-indigo-500">Step 3</div>
											<div class="text-xl font-bold text-indigo-700">Make a good plan and prepare tasks</div>
										</div>
									</div>

									<div class="flex flex-col bg-pink-200 justify-center text-center">
										<div class="flex flex-col justify-center items-center relative">
											<div class="w-56 h-12 md:flex hidden justify-center">
												<div class="h-full border-r-4 border-pink-300 border-dashed"></div>
											</div>
											<div class="rounded-full w-12 h-12 text-xl text-pink-100 bg-pink-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">4</div>
											<img alt="step4" class="w-56 h-56 shadow my-5 object-scale-down" src="https://image.flaticon.com/icons/svg/1330/1330216.svg">
											<div class="w-56 h-12 hidden justify-center">
												<div class="h-full  border-pink-300 border-dashed"></div>
											</div>
										</div>
										<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-pink-200">
											<div class="text-xs uppercase font-bold text-pink-500">Step 4</div>
											<div class="text-xl font-bold text-pink-700">Execute, impletement your solution</div>
										</div>
									</div>
								</div>
								<!-- 단계별 설명 탬플릿 끝 -->

							</div>
						</div>
					</div>
					
					<div class="w-full md:w-1/2 relative z-0">
						<div
							class="bg-blue-900 text-white rounded-b md:rounded-b-none md:rounded-r shadow-lg overflow-hidden">
							<div class="text-lg font-medium text-white-500 uppercase p-8 text-center border-b border-gray-200 tracking-wide">
<!-- 									<button type="button" onclick="init()">운동 Start</button> -->
								운동 촬영 영상
							</div>
							<div class="text-center text-sm sm:text-md max-w-lg mx-auto text-gray-900 mt-8 px-8 lg:px-0 layout-cam">
							
							
							
							
<!-- 								<button type="button" onclick="init()">Start</button> -->
								<div><canvas id="canvas" style="display: inline;"></canvas></div>
								<div id="label-container"></div>
								<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
								<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
								<script type="text/javascript">
								    // More API functions here:
								    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/pose
								
								    // the link to your model provided by Teachable Machine export panel
								    const URL = "<%=request.getContextPath() %>/resources/motionmodel/squat/";
								    let model, webcam, ctx, labelContainer, maxPredictions;
									
								    console.log("경로" + URL);
								    
								    async function init() {
								        const modelURL = URL + "model.json";
								        const metadataURL = URL + "metadata.json";
								
								        // load the model and metadata
								        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
								        // Note: the pose library adds a tmPose object to your window (window.tmPose)
								        model = await tmPose.load(modelURL, metadataURL);
								        maxPredictions = model.getTotalClasses();
								
								        // Convenience function to setup a webcam
// 								        const size = 500;
								        const flip = true; // whether to flip the webcam
								        webcam = new tmPose.Webcam(512, 480, flip); // width, height, flip
								        await webcam.setup(); // request access to the webcam
								        await webcam.play();
								        window.requestAnimationFrame(loop);
								
								        // append/get elements to the DOM
								        const canvas = document.getElementById("canvas");
								        canvas.width = 512; canvas.height = 480;
								        ctx = canvas.getContext("2d");
								        labelContainer = document.getElementById("label-container");
								        for (let i = 0; i < maxPredictions; i++) { // and class labels
								            labelContainer.appendChild(document.createElement("div"));
								        }
								    }
								
								    async function loop(timestamp) {
								        webcam.update(); // update the webcam frame
								        await predict();
								        window.requestAnimationFrame(loop);
								    }
									
								    var status = "stand"
								    var count = 0
								    async function predict() {
								        // Prediction #1: run input through posenet
								        // estimatePose can take in an image, video or canvas html element
								        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
								        // Prediction 2: run input through teachable machine classification model
								        const prediction = await model.predict(posenetOutput);
								
								        if(prediction[0].probability.toFixed(2) == 1.00) {
								        	
								        	if(status == "squat") { // 스쿼트에서 일어나면 개수 증가
								        		count++
								        		console.log("카운터 증가" + count)
								        		var audio = new Audio('<%=request.getContextPath() %>/resources/audio/'+count+'.mp3');
								        		audio.play()
								        		console.log(count)
								        	}
								        	status = "stand"
							        		console.log(status)
								        } else if(prediction[1].probability.toFixed(2) == 1.00) {
								        	status = "squat"
								        	console.log(status)
								        } else if(prediction[2].probability.toFixed(2) == 1.00) {
								        	if(status == "squat" || status == "stand") {
								        		var audio = new Audio('<%=request.getContextPath() %>/resources/audio/wrong.mp3');
								        		audio.play()
								        	}
								        	status = "bent"
								        	console.log(status)
								        } else if(prediction[3].probability.toFixed(2) == 1.00) {
								        	
								        	console.log("wrong")
								        } 
								        	
								        	
								        for (let i = 0; i < maxPredictions; i++) {
								            const classPrediction =
								                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
								            labelContainer.childNodes[i].innerHTML = classPrediction; //여기가 값나오는 부분!
								        }
								
								        // finally draw the poses
								        drawPose(pose);
								    }
								
								    function drawPose(pose) {
								        if (webcam.canvas) {
								            ctx.drawImage(webcam.canvas, 0, 0);
								            // draw the keypoints and skeleton
								            if (pose) {
								                const minPartConfidence = 0.5;
								                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
								                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
								            }
								        }
								    }
								</script>
							
							
							
							</div>
							<div class="mt-8 border border-blue-800 mx-8 lg:mx-16 flex flex-wrap">
							
								<!-- 프로그래스바 템플릿 시작 -->
								<div class="" style="margin: 10px 15px; width: 100%;">
									<div class="" style="width: 100%;">
										<h5>세트</h5>
										<div class="progress">
											<div class="progress-bar" role="progressbar"
												aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0</div>
										</div>
										<h5>횟수</h5>
										<div class="progress">
											<div class="progress-bar-count" role="progressbar"
												aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0</div>
										</div>
									</div>
								</div>
								<!-- 프로그래스바 템플릿 끝 -->
								
							</div>
							<a class="block flex items-center justify-center bg-blue-800 hover:bg-blue-700 p-4 text-md font-semibold text-gray-300 uppercase mt-8"
								href="#"> <span>운동 보상 받기</span> <span class="font-medium text-gray-300 ml-2">➔</span>
							</a>
						</div>
					</div>
					
				</div>
				
			</div>
			<!-- 캠 레이아웃 끝 -->
			
		</div>
		<!-- right layout 끝 -->

	</div>
	<!-- div wrap 끝 -->
	
</section>
<!-- section 끝 -->


<!-- FOOTER -->
<%@include file="../layout/footer.jsp"%>