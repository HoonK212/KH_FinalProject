<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event_quiz.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp" %>

<div id="eventcontent" class="my-8 mb-10" style="min-height: 73vh;">
	<div style=" font-size: 30px;" id="eventname">
		<span class="font-extrabold text-black-700"> 
		<img src="<%=request.getContextPath() %>/resources/image/event/4.png" width="40px;" style="display: inline-block;">
		 초성 퀴즈
		</span>
	</div>
	
	<div id="quizquiz">
		<svg class="z-0 absolute" xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="0 0 600 600">
	  	<g transform="translate(300,300)">
	    	<path d="M108.7,-102.8C139.7,-47.8,163,-2.6,157.3,41.4C151.6,85.4,117,128.3,71.9,150.5C26.8,172.7,-28.9,174.2,-85.4,155.4C-141.9,136.6,-199.1,97.6,-217.2,42.6C-235.3,-12.3,-214.2,-83.2,-171.5,-140.9C-128.7,-198.7,-64.4,-243.3,-12.8,-233.2C38.8,-223,77.7,-157.9,108.7,-102.8Z" fill="#7adcb58c"/>
	  	</g>
		</svg>
		
		<div class="flex flex-row rounded">
	  		<div class="relative z-2 max-w-sm rounded overflow-hidden shadow-lg" style="min-width: 600px; min-height: 300px;">
	   		<div class="px-6 py-4">
	    	<div class="relative text-teal-900 font-bold text-xl my-2">주제 설명</div>
	    	<p class="text-gray-700 text-base z-234 mt-3">
	      	${quiz.describe }
	    	</p>
	   	
	   	<c:if test="${attend gt 0 }">
			<div class="text-blue-700 font-bold text-xl mt-8 mb-2">정답 : <span>${quiz.name }</span></div>
		</c:if>
	   	
		<c:if test="${attend lt 1 }">
			<div class=" flex flex-wrap  justify-center mt-3 my-2">
		   	<c:forEach items="${quiz.words }" var="word" begin="0" end="${quiz.length }">
		 		<div class="rounded w-auto flex-1 text-gray-700 text-center bg-teal-400 hover:bg-teal-600 px-4 py-2 m-2">${word }</div>
		   	</c:forEach>
			</div>
			
			<div>
			<input id="answer" name="answer" type="text" class="shadow appearance-none border rounded py-2 px-3 text-grey-darker">
			<button class="tracking-wider text-white bg-blue-500 px-4 py-1 text-sm rounded leading-loose mx-2 font-semibold" id="answerBtn" onclick="submitAnswer();">정답</button>
			</div>
		</c:if>
		<c:if test="${attend gt 0 }">
			<p class="text-center text-gray-700">오늘은 이미 문제를 푸셨습니다.</p>
		</c:if>
		
	</div>
	</div>
</div>

</div>

</div>
</section>

<script type="text/javascript">
const submitAnswer = () => {
	document.querySelector("#answerBtn").disabled = true;
	document.querySelector("#answerBtn").remove();
	
	var answer = document.querySelector("#answer").value;
	var checkAnswer = '${quiz.name}';
	
	if(checkAnswer == answer) {
		alert("정답입니다!\n10포인트를 얻었습니다!");
		sendResult();
	} else {
		alert("틀렸습니다!")
	}
}

document.querySelector("#answer").addEventListener("keydown", function(e){
	if(e.keyCode == 13) {
		submitAnswer();
	}
}) 

const sendResult = () => {
	var quizForm = document.createElement("form");
	quizForm.setAttribute("method", "post");
	quizForm.setAttribute("action", "<%=request.getContextPath()%>/event/quiz");
	
	quizForm.appendChild(document.querySelector("#answer"));
	document.body.appendChild(quizForm);
	console.log(quizForm);
	quizForm.submit();
}
</script>
<%@include file="../layout/footer.jsp" %>