<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>test</h1>

<script type="text/javascript">

var exer1 = "pushup";
var exer2 = "lunge";

var exer;

function init() {
	console.log(exer);
	predict();
}	

var predict;

var pushup_predict = function pushup_predict() {
	console.log("pushup:predict");
}

var lunge_predict = function lunge_predict() {
	console.log("lunge:predict");
}

function pushup() {
exer = exer1;
predict = pushup_predict;

init();
}

function lunge() {
exer = exer2;
predict = lunge_predict;

init();
}

</script>

<script type="text/javascript">

var data = "pushup";

eval(data+"();");

</script>

</body>
</html>