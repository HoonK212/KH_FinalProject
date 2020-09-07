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

<div id="eventcontent" class="py-3" style="min-height: 73vh;">
	
	<div style=" font-size: 30px;" id="eventname" class="py-3">
		<span class="font-extrabold text-black-700"> 
		<img src="<%=request.getContextPath() %>/resources/image/event/1.png" width="40px;" style="display: inline-block;">
		 출석 체크
		</span>
	</div>
	
<%	
	Calendar cal = Calendar.getInstance();

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
%>




	<div class="wrapcontent py-3 justify-center mx-auto" style="width: 80%;">
		<div id="calendar">
		
		
		</div>
    
	</div>
	  
      	<div class="py-3">
	    <button class='relative bg-blue-500 text-white p-6 rounded text-2xl font-bold overflow-hidden'>
	      출석 체크!
	      <div class="ribbon bg-red-500 text-sm whitespace-no-wrap px-4">check</div>
	  	</button>
	  	</div>
</div>

</section>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    });
    calendar.render();
});
</script>

<%@include file="../layout/footer.jsp" %>