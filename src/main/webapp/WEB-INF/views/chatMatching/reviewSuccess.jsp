<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
</head>
<style>
button{			
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color: transparent;
	border : 2px solid #ffc107;
	color : #ffc107;
	font-family:sans-serif;
	font-size: 12px;
	font-weight: bold;
	width: 100px;
	height: 35px;
}

button:hover{			
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color:  #ffd556;
	border : 2px solid #ffd556;
	color : #fdf9ec;
	font-family:sans-serif;
	font-size: 12px;
	font-weight: bold;
	width: 100px;
	height: 35px;
}
</style>
<body>

		<div style="margin:50px; 210px;text-align: center;">
		100point 적립 완료!
		<p>감사합니다</p>
		<button id = "close">확인</button>
		</div>
	
</body>

<script>
$(document).ready(function(){
	$("#close").click(function(){
		window.close();
	});	
});
</script>
</html>