<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<img alt="step1" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Squat1-1.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-teal-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-teal-200">
							<div class="text-xs uppercase font-bold text-teal-500">Step 1</div>
							<div class="text-xl font-bold text-teal-700">발 각도는 대략 120도 정도로 고정시킵니다. 견갑골을 고정시켜 가슴을 폅니다.</div>
						</div>
					</div>

					<div class="flex flex-col bg-orange-200 justify-center text-center">
						<div class="flex flex-col justify-center items-center relative">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-orange-300 border-dashed"></div>
							</div>
							<div class="rounded-full w-12 h-12 text-xl text-orange-100 bg-orange-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">2</div>
							<img alt="step2" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Squat1-2.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-orange-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-orange-200">
							<div class="text-xs uppercase font-bold text-orange-500">Step 2</div>
							<div class="text-xl font-bold text-orange-700">엉덩이부터 천천히 내빼면서 서서히 내려갔다가 무릎까지 90도를 만든 다음에 올라옵니다.</div>
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
			
			
    					<!-- 진짜 웹캠 공간 -->
    
							<div class="text-center text-sm sm:text-md max-w-lg mx-auto text-gray-900 mt-8 px-8 lg:px-0 layout-cam">
							
<!-- 								<button type="button" onclick="init()">Start</button> -->
								<div><canvas id="canvas" style="display: inline;"></canvas></div>
								<div id="label-container"></div>
								<script type="text/javascript">
								    var URL = "<%=request.getContextPath() %>/resources/motionmodel/squat/";
								    let model, webcam, ctx, labelContainer, maxPredictions;
									
								    console.log("경로" + URL);
								    
								    async function init() {
								        var modelURL = URL + "model.json";
								        var metadataURL = URL + "metadata.json";
								
								        // load the model and metadata
								        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
								        // Note: the pose library adds a tmPose object to your window (window.tmPose)
								        model = await tmPose.load(modelURL, metadataURL);
								        maxPredictions = model.getTotalClasses();
								
								        // Convenience function to setup a webcam
// 								        var size = 500;
								        var flip = true; // whether to flip the webcam
								        webcam = new tmPose.Webcam(512, 480, flip); // width, height, flip
								        await webcam.setup(); // request access to the webcam
								        await webcam.play();
								        window.requestAnimationFrame(loop);
								
								        // append/get elements to the DOM
								        var canvas = document.getElementById("canvas");
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
								        
								        if(ff == false){
						        			webcam.pause();
						        		}
								        
								    }
									
								    var status = "stand"
								    var count = 0
								    var set = 0;
								    var progressCnt = 0
								    var ff = null;
								    
								    var exArr = new Array(); 
								    exArr =	"${exerciseName}".split(",");
									for(var i=0; i<exArr.length; i++) {
										console.log(exArr[i])
									}

								    
								    async function predict() {
								        var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
								        var prediction = await model.predict(posenetOutput);
								
								        if(prediction[0].probability.toFixed(2) == 1.00) {
								        	
								        	if(status == "squat") { // 스쿼트에서 일어나면 개수 증가
								        		count++;
								        		progressCnt++;
												
								        		console.log("카운터 증가" + count);
								        		var audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
								        		audio.play()
								        		console.log(count)
								        		

								        		//함수호출(오른쪽 프로그래스바)
								        		ff = countUpdate(count, set);
								        		//함수호출(왼쪽 프로그래스바)
								        		leftCountUpdate(progressCnt ,exArr[0])
								        		
								        		
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
								            var classPrediction =
							                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
// 								            labelContainer.childNodes[i].innerHTML = classPrediction; //여기가 값나오는 부분!
								        }
								
								        // finally draw the poses
								        drawPose(pose);
								    }
								
								    function drawPose(pose) {
								        if (webcam.canvas) {
								            ctx.drawImage(webcam.canvas, 0, 0);
								            // draw the keypoints and skeleton
								            if (pose) {
								                var minPartConfidence = 0.5;
								                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
								                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
								            }
								        }
								    }
								</script>
								<script type="text/javascript">
																		
								</script>
							
							
							</div>
							<!-- 진짜 웹캠 공간끝 -->
			
			
			
			
			
		
		
		
			
			
			
			
			<div class="mt-8 border border-blue-800 mx-8 lg:mx-16 flex flex-wrap">
			
				<!-- 프로그래스바 템플릿 시작 -->
				<div class="" style="margin: 10px 15px; width: 100%;">
					<div class="" style="width: 100%;">
						<h5>세트</h5>
						<div class="progress">
							<div class="progress-bar-set" role="progressbar"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="1">0</div>
						</div>
						<h5>횟수</h5>
						<div class="progress" >
							<div class="progress-bar-count" role="progressbar"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="1">0</div>
						</div>
					</div>
				</div>
				<!-- 프로그래스바 템플릿 끝 -->
					
				</div>
				<a class="block flex items-center justify-center bg-blue-800 hover:bg-blue-700 p-4 text-md font-semibold text-gray-300 uppercase mt-8 complete"
					href="#" > <span>운동 보상 받기</span> <span class="font-medium text-gray-300 ml-2">➔</span>
				</a>
			</div>
		</div>
		
	</div>
	
</div>
<!-- 캠 레이아웃 끝 -->