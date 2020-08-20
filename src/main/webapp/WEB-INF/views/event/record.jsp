<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event_record.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp"  %>


<div id="eventcontent">

	<div style=" font-size: 30px;" id="eventname">
		<span class="font-extrabold text-black-700"> 
		<img src="<%=request.getContextPath() %>/resources/image/event/5.png" width="40px;" style="display: inline-block;">
		 신기록 랭킹
		</span>
	</div>
	
		<div id="recordrow1">
			<c:forEach var="i" begin="1" end="3">
			<div id="ex1">
			<table class="content-table">
			<thead>
			  	<tr>
			      <th colspan="3;" style="text-align: center;">운동이름!</th>
			</tr>
			   <tr>
			     <th>Rank</th>
			     <th>Name</th>
			   	<th>기록</th>
			</tr>
			 </thead>
			 <tbody>
			   <tr>
			     <td style="">1</td>
			     <td>Domenic</td>
			<td>기이록</td>
			   </tr>
			   <tr class="active-row">
			     <td>2</td>
			     <td>Sally</td>
				<td>기이록</td>
			  	 </tr>
			 	  <tr>
			   	  <td>3</td>
			   	  <td>Nick</td>
				<td>기이록</td>
			 	  </tr>
				 </tbody>
			</table>
			</div>
			
			</c:forEach>
		</div>
		
		
		<div id="recordrow2">
			<c:forEach var="i" begin="1" end="3">
			<div id="ex1">
			<table class="content-table">
			<thead>
			  	<tr>
			      <th colspan="3;" style="text-align: center;">운동이름!</th>
			</tr>
			   <tr>
			     <th>Rank</th>
			     <th>Name</th>
			   	<th>기록</th>
			</tr>
			 </thead>
			 <tbody>
			   <tr>
			     <td style="">1</td>
			     <td>Domenic</td>
			<td>기이록</td>
			   </tr>
			   <tr class="active-row">
			     <td>2</td>
			     <td>Sally</td>
				<td>기이록</td>
			  	 </tr>
			 	  <tr>
			   	  <td>3</td>
			   	  <td>Nick</td>
				<td>기이록</td>
			 	  </tr>
				 </tbody>
			</table>
			</div>
			
			</c:forEach>
		</div>
		
		
		<div id="recordrow3">
			<c:forEach var="i" begin="1" end="3">
			<div id="ex1">
			<table class="content-table">
			<thead>
			  	<tr>
			      <th colspan="3;" style="text-align: center;">운동이름!</th>
			</tr>
			   <tr>
			     <th>Rank</th>
			     <th>Name</th>
			   	<th>기록</th>
			</tr>
			 </thead>
			 <tbody>
			   <tr>
			     <td style="">1</td>
			     <td>Domenic</td>
			<td>기이록</td>
			   </tr>
			   <tr class="active-row">
			     <td>2</td>
			     <td>Sally</td>
				<td>기이록</td>
			  	 </tr>
			 	  <tr>
			   	  <td>3</td>
			   	  <td>Nick</td>
				<td>기이록</td>
			 	  </tr>
				 </tbody>
			</table>
			</div>
			
			</c:forEach>
		</div>
	
	

</div>


</section>
<%@include file="../layout/footer.jsp" %>