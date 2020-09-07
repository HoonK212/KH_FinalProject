<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event/event_record.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">

<%@include file="../layout/header.jsp" %>
<%@include file="./event_sidebar.jsp"  %>

<script>

$("#recordrow1").html
</script>


<div id="eventcontent">

	<div style=" font-size: 30px;" id="eventname">
		<span id="hi" class="font-extrabold text-black-700"> 
			<img  src="<%=request.getContextPath() %>/resources/image/event/5.png" width="40px;" style="display: inline-block;">
			 	신기록 랭킹
		</span>
	</div>
	
	<br><br><br>
	
		<div id="recordrow1">
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list1[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list1}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
				
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list2[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list2}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
				
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list3[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list3}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
		</div>
		<br>
		
		<div id="recordrow2">
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list4[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list4}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
				
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list5[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list5}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
				
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list6[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list6}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
		</div>
		<br>
		
		<div id="recordrow3">
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list7[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list7}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
				
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list8[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list8}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
				
				<div id="ex1">
					<table class="content-table">
						<thead>
				  			<tr>
				      			<th colspan="3;" style="text-align: center;">${list9[0].name}</th>
							</tr>
							<tr>
								<th>Rank</th>
								<th>Name</th>
								<th>기록</th>
							</tr>
				 		</thead>
				 		<c:forEach var="result" items="${list9}" begin="0" end="2">
				 		<tbody>
					   			<tr style="">
									<td>${result.rank }</td>
									<td>${result.id }</td>
									<td>${result.record }</td>
					   			</tr>
				 			</c:forEach>
					 	</tbody>
					</table>
				</div>
		</div>
		<br>
	
	

</div>
<%@include file="../layout/footer.jsp" %>