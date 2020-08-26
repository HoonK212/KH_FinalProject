<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://unpkg.com/tailwindcss@1.2.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="h-screen overflow-hidden flex items-center justify-center" style="background: #edf2f7;">

<button type="button" id="addform" onclick="addForm();">폼생성</button>

<script type="text/javascript">
function addForm() {
	var sForm = document.createElement("form");
	sForm.action = "/shopping/test";
	sForm.method = "post";
	
	sForm.appendChild
	
	document.body.appendChild(sForm);
	
	
}
</script>
</body>
</html>
