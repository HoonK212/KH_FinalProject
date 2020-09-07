<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
window.onload = function() {
	drawRouletteWheel();
}
</script>
<script type="text/javascript">
var colors = ["#DCEBF1", "#7DCADD", "#1B8BB8", "#0566A3", "#E89EBA", "#F7E59D"];
var restaraunts = ["꽝!", "3 포인트", "5 포인트", "10 포인트", "3 포인트", "5 포인트"];

var startAngle = 0;
var arc = Math.PI / 3;
var spinTimeout = null;

var spinArcStart = 10;
var spinTime = 0;
var spinTimeTotal = 0;

var ctx;

var doubleSpinFlag = false;

function doubleSpinCheck(){
	if(doubleSpinFlag){
		return doubleSpinFlag;
	}else{
		doubleSpinFlag = true;
		return false;
	}
}
   
function drawRouletteWheel() {
  var canvas = document.getElementById("canvas");
  
  if (canvas.getContext) {
    var outsideRadius = 200;
    var textRadius = 160;
    var insideRadius = 0;
   
    ctx = canvas.getContext("2d");
    ctx.clearRect(0,0,500,500);
   
    ctx.strokeStyle = "white";
    ctx.lineWidth = 2;
   
    ctx.font = 'bold 12px Helvetica, Arial';
   
    for(var i = 0; i < 6; i++) {
      var angle = startAngle + i * arc;
      ctx.fillStyle = colors[i];	
     
      ctx.beginPath();
      ctx.arc(250, 250, outsideRadius, angle, angle + arc, false);
      ctx.arc(250, 250, insideRadius, angle + arc, angle, true);
      ctx.stroke();
      ctx.fill();
     
      ctx.save();
      
      ctx.fillStyle = "black";
      ctx.translate(250 + Math.cos(angle + arc / 2) * textRadius,
                    250 + Math.sin(angle + arc / 2) * textRadius);
      ctx.rotate(angle + arc / 2 + Math.PI / 2);
      var text = restaraunts[i];
      
      ctx.font = 'bold 20px Helvetica, Arial';
      ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
      ctx.restore();
    }
   
    //Arrow
    ctx.fillStyle = "black";
    ctx.beginPath();
    ctx.moveTo(250 - 4, 250 - (outsideRadius + 5));
    ctx.lineTo(250 + 4, 250 - (outsideRadius + 5));
    ctx.lineTo(250 + 4, 250 - (outsideRadius - 5));
    ctx.lineTo(250 + 9, 250 - (outsideRadius - 5));
    ctx.lineTo(250 + 0, 250 - (outsideRadius - 13));
    ctx.lineTo(250 - 9, 250 - (outsideRadius - 5));
    ctx.lineTo(250 - 4, 250 - (outsideRadius - 5));
    ctx.lineTo(250 - 4, 250 - (outsideRadius + 5));
    ctx.fill();
  }
}

function spin() {
	var coin = document.querySelector("#coin").innerText;
	
	if(doubleSpinCheck()) return;

	if(parseInt(coin) < 1) {
		alert("코인이 부족합니다");
		return false;
		
	} else {
	  spinAngleStart = Math.random() * 10 + 10;
	  spinTime = 0;
	  spinTimeTotal = Math.random() * 3 + 4 * 1000;
	  rotateWheel();
		
	}
}

function rotateWheel() {
  spinTime += 30;
  if(spinTime >= spinTimeTotal) {
    stopRotateWheel();
    return;
  }
  var spinAngle = spinAngleStart - easeOut(spinTime, 0, spinAngleStart, spinTimeTotal);
  startAngle += (spinAngle * Math.PI / 180);
  drawRouletteWheel();
  spinTimeout = setTimeout('rotateWheel()', 30);
}

function stopRotateWheel() {
  clearTimeout(spinTimeout);
  var degrees = startAngle * 180 / Math.PI + 90;
  var arcd = arc * 180 / Math.PI;
  var index = Math.floor((360 - degrees % 360) / arcd);
  ctx.save();
  ctx.font = 'bold 50px Helvetica, Arial';
  var text = restaraunts[index]
  ctx.fillText(text, 250 - ctx.measureText(text).width / 2 + 7 , 250 + 16);
  
  send(text)

  ctx.restore();
  
}

function easeOut(t, b, c, d) {
  var ts = (t/=d)*t;
  var tc = ts*t;
  return b+c*(tc + -3*ts + 3*t);
}

function send(text) {
	var url = '<%= request.getContextPath()%>/event/roulette';
	
	var xhr = new XMLHttpRequest();
	
	xhr.open('POST', url);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send('result='+text);
	
	xhr.addEventListener('load', function() {
		
		var data = JSON.parse(xhr.response);
		
		if( data.getPoint == 0 ) {
			alert("꽝입니다!\n남은 코인 : " + data.pointcoin.coin +"개")
		} else {
			alert(data.getPoint + " 포인트를 얻었습니다!\n남은 코인 : " + data.pointcoin.coin + "개");
		}
		
		document.querySelector("#point").innerText = data.pointcoin.point;
		document.querySelector("#coin").innerText = data.pointcoin.coin;
		
		doubleSpinFlag = false;
		
	})
	
}

</script>

<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp" %>
	
<div id="eventcontent" class="my-8" style="min-height: 73vh;">
	
	<div style=" font-size: 30px;" id="eventname">
		<span class="font-extrabold text-black-700"> 
		<img src="<%=request.getContextPath() %>/resources/image/event/3.png" width="40px;" style="display: inline-block;">
		 룰렛 돌리기
		</span>
	</div>
	
 	<div>	
	<canvas id="canvas" width="500" height="500" style="display: inline;"></canvas>
	</div>
	
	<div class="my-2">
		<p>현재 포인트 : <span id="point">${pointcoin.point }</span></p>
		<p>잔여 코인 : <span id="coin">${pointcoin.coin }</span></p>
	</div>
	
	<div>
	    <button class='relative bg-blue-500 text-white p-6 rounded text-2xl font-bold overflow-hidden' onclick="spin();">
	      돌리기~!
	      <div class="ribbon bg-red-500 text-sm whitespace-no-wrap px-4">go!</div>
	  	</button>
  	</div>

</div>

</section>
<%@include file="../layout/footer.jsp" %>