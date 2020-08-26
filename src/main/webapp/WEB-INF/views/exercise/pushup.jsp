<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
								    const URL = "<%=request.getContextPath() %>/resources/motionmodel/pushup/";
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
									
								    var status = "pushup"
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
								        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
								        const prediction = await model.predict(posenetOutput);
								
								        if(prediction[0].probability.toFixed(2) == 1.00) {
								        	console.log(status)
								        	if(status == "pushdown") { // 스쿼트에서 일어나면 개수 증가
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
								        	
								        	status = "pushup"
							        		console.log(status)
								        } else if(prediction[1].probability.toFixed(2) == 1.00) {
								        	status = "pushdown"
								        	console.log(status)
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
								<script type="text/javascript">
																		
								</script>
							
							
							</div>