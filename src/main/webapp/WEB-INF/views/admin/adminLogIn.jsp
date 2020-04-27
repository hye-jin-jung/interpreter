<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {
		margin: 70px auto;
		width: auto;
        background-color: #E7E7E7;
	}
	
	div {
		width: 300px;
        margin: 0px auto;
        padding: 0px auto;
		border: 5px solid #ffffff;
		background-color: #E7E7E7;
	}
	
	input {
		
	}
	
	footer {
		
	}

</style>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets2/img/favicon1.png">
<title>일맺다 관리자 페이지</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/admin/LogIn" method="post">
		<div style="border: none; margin-bottom: 30px;">
			<a href="${pageContext.request.contextPath}/index" target="_blank"><img src="${pageContext.request.contextPath}/imagefile/12.gif" style="display: block; margin: 0px auto;"></a>
		</div>
		<div style="border: none;">
			<input type="text" name="adminID" style="width: 250px; height: 35px; font-size: 20px; vertical-align: 20px; margin: 0px 24px;">
			<input type="password" name="adminPW" style="width: 250px; height: 35px; font-size: 20px; vertical-align: 30px; margin: 0px 24px;">
			<input type="submit" value="로그인" style="width: 254px; height: 39px; font-size: 20px; margin: 0px 24px;">
		</div>
	</form>
	<footer style="position: absolute; width: 100%;	bottom: 35px;">
		<div style="border: none; margin-bottom: 25px;">
			<img src="${pageContext.request.contextPath}/imagefile/mini1.png" style="display: block; margin: 0px auto;"/>
		</div>
		<div style="border: none; margin: 0px auto; width: 70%; text-align: center;">
			(주)일맺다(대표: 김지영) | 개인정보보호관리자: 김지영<br>
			서울 중구 남대문로 120 대일빌딩 2층 | 대표번호: 02-1544-9970 광고문의: 02-1544-9970<br>
			사업자등록: 138-87-00058 | 직업정보제공사업: J1200020160017 | 통신판매업: 2016-서울종로-00784<br>
			Copyright Anchoreer Co., Inc. All rights reserved.
		</div>
	</footer>

</body>