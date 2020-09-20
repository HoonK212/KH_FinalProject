<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event_calendar.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.3.2/main.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.3.2/main.min.js,npm/fullcalendar@5.3.2"></script>

<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="eventcontent" class="py-3" style="min-height: 73vh;">
	
	<div style=" font-size: 30px;" id="eventname" class="py-3">
		<span class="font-extrabold text-black-700"> 
		<img src="<%=request.getContextPath() %>/resources/image/event/1.png" width="40px;" style="display: inline-block;">
		 출석 체크
		</span>
	</div>

	<div class="wrapcontent py-3 justify-center mx-auto container calendar-container" style="width: 80%;">
		<div id="calendar"></div>
	</div>
	
</div>

</section>

<script type="text/javascript">
var dataset = [
	<c:forEach items='${attList}' var='att'>
		{
			title: '출석',
 			start: '${att.DATES}',
		},
	</c:forEach>
];

document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'title',
        center: '',
        right: 'custom'
      }
      , customButtons: {
    	  custom: {
    		  text: '출석체크하기'
    		  , id: 'attendance'
    		  , click: function() {
				//ajax
				var id = '${logInInfo.id}';
				
				var date = new Date();
				var year = date.getFullYear(); 
				var month = new String(date.getMonth()+1);
				var day = new String(date.getDate());
				if(month.length == 1){ 
					  month = "0" + month; 
				} 
				if(day.length == 1){ 
				  day = "0" + day; 
				} 
				
				var today = year+'/'+month+'/'+day;
				var check = year+'-'+month+'-'+day;
				
				var xhr = new XMLHttpRequest();
				xhr.open('GET', '<%=request.getContextPath()%>/event/check?id='+id+'&today='+today);
				xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xhr.send();
				xhr.addEventListener('load', function() {
					var data = xhr.response;

					if('${check}' == 6) {
						alert("출석완료되었습니다!\n이번주 연속 출석 달성!\n"+data+" 포인트를 얻었습니다!");
					} else {
						alert("출석완료되었습니다!\n"+data+" 포인트를 얻었습니다!");
					}
					
					document.querySelector(".fc-custom-button").disabled =  true;
					document.querySelector(".fc-custom-button").innerHTML = '출석완료';
					calendar.addEvent({
						title: '출석',
				        start: check,
					})
				});
			}
		}
	}
	, events: dataset
    
    });
    
    calendar.render();
    
    /* document.querySelector('#attBtn').addEventListener("click", event => {
    	calendar.addEvent({
    		title: '출석',
    		start: '2020-09-08',
    }); */
    
    var date = new Date();
    console.log(date);
    
    var attend = parseInt('${attend}');
	console.log(attend);

	if(attend > 0) {
		document.querySelector(".fc-custom-button").disabled =  true;
		document.querySelector(".fc-custom-button").innerHTML = '출석완료';
	}
    	
});

</script>

<%@include file="../layout/footer.jsp" %>