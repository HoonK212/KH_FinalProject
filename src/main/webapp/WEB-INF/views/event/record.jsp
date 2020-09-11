<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event_record.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp"  %>

<script>

$("#recordrow1").html
</script>


<div id="eventcontent" class="py-5 mb-5">

	<div style=" font-size: 30px;" id="eventname">
		<span id="hi" class="font-extrabold text-black-700"> 
			<img  src="<%=request.getContextPath() %>/resources/image/event/5.png" width="40px;" style="display: inline-block;">
			 	신기록 랭킹
		</span>
	</div>
	<div class="py-3">
		<p class="text-xl font-bold text-indigo-600">${start } ~ ${end }</p>
	</div>
	
	<div id="recordrow1">
		<c:forEach begin="0" end="2" items="${list }" var="item" varStatus="stat">
			<div class="mx-3 pb-3">
				<table class="content-table" style="min-width: 250px;">
					<thead>
						<tr>
							<th colspan="3;" style="text-align: center;">${fn:toUpperCase(item[0].name)}</th>
						</tr>
						<tr>
							<th>Rank</th>
							<th>Name</th>
							<th>기록</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${item }" var="i" begin="0" end="2">
						<tr>
							<td>${i.rank }</td>
							<td>${i.id }</td>
							<td>${i.record }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
	
	<div id="recordrow2">
		<c:forEach begin="3" end="5" items="${list }" var="item" varStatus="stat">
			<div class="mx-3 pb-3"">
				<table class="content-table" style="min-width: 250px;">
					<thead>
						<tr>
							<th colspan="3;" style="text-align: center;">
							<c:if test="${item[0].name ne 'kneepushup'}">${fn:toUpperCase(item[0].name)}</c:if>
							<c:if test="${item[0].name eq 'kneepushup'}">PUSHUP</c:if>
							</th>
						</tr>
						<tr>
							<th>Rank</th>
							<th>Name</th>
							<th>기록</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${item }" var="i" begin="0" end="2">
						<tr>
							<td>${i.rank }</td>
							<td>${i.id }</td>
							<td>${i.record }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
	
	<div id="recordrow3">
		<c:forEach begin="6" end="8" items="${list }" var="item" varStatus="stat">
			<div class="mx-3 pb-3"">
				<table class="content-table" style="min-width: 250px;">
					<thead>
						<tr>
							<th colspan="3;" style="text-align: center;">${fn:toUpperCase(item[0].name)}</th>
						</tr>
						<tr>
							<th>Rank</th>
							<th>Name</th>
							<th>기록</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${item }" var="i" begin="0" end="2">
						<tr>
							<td>${i.rank }</td>
							<td>${i.id }</td>
							<td>${i.record }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
</div>
</section>
<%@include file="../layout/footer.jsp" %>