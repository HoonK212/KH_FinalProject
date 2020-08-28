//
//					  
//					var URL = "<%=request.getContextPath() %>/resources/motionmodel/lunge/";
//								    let model, webcam, ctx, labelContainer, maxPredictions;
//									
//								    console.log("경로" + URL);
//								    
//								    async function init2() {
//								    	  console.log("init2실행 된거인가요?")
//								        var modelURL = URL + "model.json";
//								        var metadataURL = URL + "metadata.json";
//								
//								        model = await tmPose.load(modelURL, metadataURL);
//								        maxPredictions = model.getTotalClasses();
//								
//// 								        var size = 500;
//								        var flip = true; // whether to flip the webcam
//								        webcam = new tmPose.Webcam(512, 480, flip); // width, height, flip
//								        await webcam.setup(); // request access to the webcam
//								        await webcam.play();
//								        window.requestAnimationFrame(loop);
//								
//								        var canvas = document.getElementById("canvas");
//								        canvas.width = 512; canvas.height = 480;
//								        ctx = canvas.getContext("2d");
//								        labelContainer = document.getElementById("label-container");
//								        for (let i = 0; i < maxPredictions; i++) { // and class labels
//								            labelContainer.appendChild(document.createElement("div"));
//								        }
//								    }
//								
//								      function loop(timestamp) {
//								        webcam.update();
//								        await predict();
//								        window.requestAnimationFrame(loop);
//								        
//								        if(ff == false){
//						        			webcam.pause();
//						        		}
//								        
//								    }
//									
//								    var status = "stand"
//								    var count = 0
//								    var set = 0;
//								    var progressCnt = 0
//								    var ff = null;
//								    
//	
//								    var exArr = new Array(); 
//								    exArr =	"${exerciseName}".split(",");
//									for(var i=0; i<exArr.length; i++) {
//										console.log(exArr[i])
//									}
//
//								    
//								    
//								      function predict() {
//								        var { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
//								        var prediction = await model.predict(posenetOutput);
//								
//								        if(prediction[0].probability.toFixed(2) == 1.00) {
//								        	if(status == "down") { 
//								        		count++;
//								        		progressCnt++;
//												
//								        		console.log("카운터 증가" + count);
//								        		var audio = new Audio('<%=request.getContextPath() %>/resources/audio/' + count + '.mp3');
//				        		audio.play()
//				        		console.log(count)
//
//				        		ff = countUpdate(count, set);
//				        		leftCountUpdate(progressCnt ,exArr[0])
//				        		
//				        	}
//				        	status = "stand"
//		        			console.log(status)
//				        } else if(prediction[1].probability.toFixed(2) == 1.00) {
//				        	
//				        	
//				        	status = "down"
//				        	console.log(status)
//				        }
//				        	
//				        for (let i = 0; i < maxPredictions; i++) {
//				            var classPrediction =
//			                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
//				            labelContainer.childNodes[i].innerHTML = classPrediction; //여기가 값나오는 부분!
//				        }
//				
//				        drawPose(pose);
//				    }
//				
//				    function drawPose(pose) {
//				        if (webcam.canvas) {
//				            ctx.drawImage(webcam.canvas, 0, 0);
//				            if (pose) {
//				                var minPartConfidence = 0.5;
//				                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
//				                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
//				            }
//				        }
//				    }
//			