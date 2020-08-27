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
							<img alt="step1" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Plank1-1.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-teal-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-teal-200">
							<div class="text-xs uppercase font-bold text-teal-500">Step 1</div>
							<div class="text-xl font-bold text-teal-700">견갑골(날개뼈)과 쇄골은 전체적으로 뒤로 밀리지 않도록 단단히 고정시켜준다. 어깨는 방향이 지면과 수직을 이루도록 한다. 허리는 일직선을 만들고 고개도 들지 않는다.</div>
						</div>
					</div>

					<div class="flex flex-col bg-orange-200 justify-center text-center">
						<div class="flex flex-col justify-center items-center relative">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-orange-300 border-dashed"></div>
							</div>
							<div class="rounded-full w-12 h-12 text-xl text-orange-100 bg-orange-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">2</div>
							<img alt="step2" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Plank1-2.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-orange-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-orange-200">
							<div class="text-xs uppercase font-bold text-orange-500">Step 2</div>
							<div class="text-xl font-bold text-orange-700">엉덩이는 허리가 아래쪽으로 처지지 않도록 지속적으로 엉덩이 근육을 수축시키면서 긴장 상태를 유지해야 한다. 그래서 머리부터 발끝까지 일직선을 유지해야 한다.</div>
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
								<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
								<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/pose@0.8/dist/teachablemachine-pose.min.js"></script>
								<script type="text/javascript">
								    // More API functions here:
								    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/pose
								
								    // the link to your model provided by Teachable Machine export panel
								    const URL = "<%=request.getContextPath() %>/resources/motionmodel/plank/";
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
								        
								        if(ff == false){
						        			webcam.pause();
						        		}
								        
								    }
									
								    var status = "plank"
								    
								    var count = 0
								    var set = 0;
								    var progressCnt = 0
								    var ff = null;
									
								    
								    var counter = 0;
								    
								    
								    var exArr = new Array(); 
								    exArr =	"${exerciseName}".split(",");
									for(var i=0; i<exArr.length; i++) {
										console.log(exArr[i])
									}

								    
								    async function predict() {
								        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
								        const prediction = await model.predict(posenetOutput);
								
								        if(prediction[0].probability.toFixed(2) >= 0.80) {
								        	
								        	setInterval(function(){
								        		console.log("하하")
								        	},10000)
								        	
								        	
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
							
							<!-- 진짜 웹캠 공간끝 -->
			
			
			
			
			<div class="mt-8 border border-blue-800 mx-8 lg:mx-16 flex flex-wrap">
			
				<!-- 프로그래스바 템플릿 시작 -->
				<div class="" style="margin: 10px 15px; width: 100%;">
					<div class="" style="width: 100%;">
						<h5>세트</h5>
						<div class="progress">
							<div class="progress-bar-set" role="progressbar"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="2">0</div>
						</div>
						<h5>횟수</h5>
						<div class="progress" >
							<div class="progress-bar-count" role="progressbar"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="2">0</div>
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
							