<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 에러 화면 </title>
<style>
	#container { width: 700px; margin: auto; }
	h2, p { text-align: center; }
	.bg-tomato {background-color: tomato;}
</style>
</head>
<body>

<div id="container">
	<h2> 기본 에러 화면 [ error.jsp ] </h2>
	<hr>
	<p class="bg-tomato">Message : ${exception.message }</p>
	<p> 시스템 담당자에게 연락 바랍니다.</p>
</div>

</body>
</html>