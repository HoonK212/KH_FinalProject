<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event_rockpaper.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style type="text/css">
/* 	  body { */
/*     	background: #e2e8f0; */
/*   	} */
/*     *:hover { */
/*       transition: all 150ms ease-in; */
/*     } */

/* $("#mybox").css("height", "480"); */
</style>

<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp" %>

<div id="eventcontent">
	
	<div style=" font-size: 30px; margin: 40;" id="eventname">
		<span class="font-extrabold text-black-700"> 
		<img src="<%=request.getContextPath() %>/resources/image/event/2.png" width="40px;" style="display: inline-block;">
		 가위 바위 보
		</span>
	</div>

  
	<div style="min-height: 73vh; margin:0 auto;" class="mx-10 antialiased max-w-6xl bg-gray-300 h-64">
		<div style="min-height: 80vh;" class="relative block md:flex items-center h-64">
      	<div class="w-full h-full md:w-1/2 relative z-1 bg-gray-100 rounded shadow-lg overflow-hidden">
        	<div id="aibox" class="text-lg font-medium text-green-500 uppercase  text-center border-b border-gray-200 tracking-wide">AI</div>
        	<div class="block sm:flex md:block lg:flex items-center justify-center w-full h-full">

        			<img id="aiscreen" alt="image" src="<%=request.getContextPath()%>/resources/image/rockpaper/total.png">

        	</div>
        
      </div>
     
     <div class="w-full h-full md:w-1/2 relative z-1 bg-gray-100 rounded shadow-lg overflow-hidden">
        	<div id="mybox" class="text-lg font-medium text-green-500 uppercase  text-center border-b border-gray-200 tracking-wide">도전 상대</div>
        	<div style="width: 480;height: 512;margin-top: 135px;" class=" mx-12 block sm:flex md:block lg:flex items-center justify-center w-full"  id="webcam-container">
        	</div>
        <div class="items-baseline  my-5 flex justify-center">
          <ul>
            <li class="flex items-center">
              <div class="bg-green-200 rounded-full p-2 fill-current text-green-700">
                <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path class="primary" d="M11 3.05V2a1 1 0 0 1 2 0v1.05A10 10 0 0 1 22 13c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a2 2 0 1 0-4 0c0 1.33-2 1.33-2 0a10 10 0 0 1 9-9.95z"></path><path class="secondary" d="M11 14a1 1 0 0 1 2 0v5a3 3 0 0 1-6 0 1 1 0 0 1 2 0 1 1 0 0 0 2 0v-5z"></path></svg>
              </div>
              <span class="text-gray-700 text-lg ml-3" id="label-container"></span>
            </li>	
            
          </ul>
        </div>
<!--         <a class="block flex items-center justify-center bg-gray-200 hover:bg-gray-300 text-md font-semibold text-gray-800 uppercase " href="#"> -->
<!--           <span>Create account</span> -->
<!--           <span class="font-medium text-gray-700 ml-2">➔</span> -->
<!--         </a> -->

		<div style="color:red;">※ 먼저 포즈를 취하고 대결버튼을 눌러주세요!</div>
      </div>
     
     
    </div>
      
    
  </div>

      	<div class="my-24">
	    <button class='relative bg-blue-500 text-white p-6 rounded text-2xl font-bold overflow-hidden' type="button" onclick="init()">
	     	 대결!
      		<div class="ribbon bg-red-500 text-sm whitespace-no-wrap px-4">fight</div>
	  	</button>
	  	</div>



</div>

<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    const URL = "<%=request.getContextPath() %>/resources/imagemodel/";

    let model, webcam, labelContainer, maxPredictions ;
    
    var status = "start";
    // Load the image model and setup the webcam
    async function init() {
    	
    	console.log(${coin})
    	if(${coin} < 0){
    		alert("보유 코인이 부족합니다.")
    		return;
    	}
    	
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const flip = true; // whether to flip the webcam
        webcam = new tmImage.Webcam(512, 480, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        console.log("여기까지도1?")
        window.requestAnimationFrame(loop);
        console.log("여기까지도2?")
        // append elements to the DOM
        document.getElementById("webcam-container").appendChild(webcam.canvas);
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }

    
    async function loop() {
       	 webcam.update(); // update the webcam frame
	     await predict();
       	 window.requestAnimationFrame(loop);
    }

    // run the webcam image through the image model
    
    async function predict() {
        // predict can take in an image, video or canvas html element
        const prediction = await model.predict(webcam.canvas);
        var num=0;
	        if(prediction[0].probability.toFixed(2) == 1.0){
        		if(status == "start"){
	        		labelContainer.childNodes[0].innerHTML = "바위"
		        	status="complete";
	        		num=1;
        		}
	        }else if(prediction[1].probability.toFixed(2) == 1.0){
	        	if(status == "start"){
	        		labelContainer.childNodes[0].innerHTML = "가위"
		        	status="complete";
	        		num=2;
	        	}
	        }else if(prediction[2].probability.toFixed(2) == 1.0){
	        	if(status == "start"){
	        		labelContainer.childNodes[0].innerHTML = "보"
		    		status="complete";
	        		num=3;
	        	}
	        
	        }else{
	        	if(status == "start"){
	        	labelContainer.childNodes[0].innerHTML = "알수없음"
	        	}
	        }
	        

	        if(status=="complete"){
	        	aiscreen_info(num);
	        	status="end";
	        	console.log("안넘어가니"+num)
	        	webcam.pause();
	        }
	        
        }
    
	function aiscreen_info(num){
		console.log("함수는 실행되네")
		
		console.log(num)
		var ran= parseInt(Math.random()*3+1); 
		console.log(ran)
			
		if(ran==1){
			$("#aiscreen").attr("src","<%=request.getContextPath()%>/resources/image/rockpaper/rock.png");
			setTimeout(function() {
				if(num==1){
					compensation(0);
					alert("비겼습니다.")
					loc();
					console.log("비겼습니다.")
				}else if(num==2){
					compensation(0);
					alert("졌습니다.")
					loc();
					console.log("졌습니다.")
				}else if(num==3){
					compensation(1);
					alert("이겼습니다. \n 5포인트가 지급되었습니다.")
					loc();
					console.log("이겼습니다.")
				}
			
			}, 1000);
		}else if(ran==2){
			$("#aiscreen").attr("src","<%=request.getContextPath()%>/resources/image/rockpaper/scissors.png");
			setTimeout(function() {
				if(num==1){
					compensation(1);
					alert("이겼습니다.\n 5포인트가 지급되었습니다.")
					loc();
					console.log("이겼습니다.")
				}else if(num==2){
					compensation(0);
					alert("비겼습니다.")
					loc();
					console.log("비겼습니다.")
				}else if(num==3){
					compensation(0);
					alert("졌습니다.")
					loc();
					console.log("졌습니다.")
				}
			}, 1000);
		}else if(ran==3){
			$("#aiscreen").attr("src","<%=request.getContextPath()%>/resources/image/rockpaper/paper.png");
			setTimeout(function() {
				if(num==1){
					compensation(0);
					alert("졌습니다.")
					loc();
					console.log("졌습니다.")
				}else if(num==2){
					compensation(1);
					alert("이겼습니다. \n 5포인트가 지급되었습니다.")
					loc();
					console.log("이겼습니다.")
				}else if(num==3){
					compensation(0);
					alert("비겼습니다.")
					loc();
					console.log("비겼습니다.")
				}
			}, 1000);
		}
	}
	
function compensation(num){
	jQuery.ajax({
		url: "/event/rockpaper",
		type:"POST",
		dataType : 'json', 
		data : { result : num }
	})
	
}
function loc(){
		document.location.href="/event/rockpaper";
	}

</script>
</section>
<%@include file="../layout/footer.jsp" %>
