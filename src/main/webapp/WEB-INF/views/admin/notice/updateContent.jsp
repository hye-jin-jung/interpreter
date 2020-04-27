<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/assets2/css/material-dashboard.css" rel="stylesheet"/>
<style>
	.dropdown-item {
		color: #000000;
	}
	
	.dropdown-item:hover {
		color: #ffffff;
		background-color: #1ABC9C !important;
	}

	.table {
		width: 60%;
		margin-left: auto;
		margin-right: auto;
	}
	
	.btn-outline-button {
		color: #1ABC9C;
		background-color: transparent;
		background-image: none;
		border-color: #1ABC9C;
		border-style: solid;
		border-width: 2px;
	}

	.btn-outline-button:hover {
		color: #ffffff;
		background-color: #1ABC9C;
		border-color: #1ABC9C;
	}
</style>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets2/img/favicon1.png">
<title>일맺다 관리자 페이지</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-info" style="background-color: #1ABC9C !important;">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index" target="_blank">일맺다</a>
			
			<div class="collapse navbar-collapse" id="navbar-info">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/user/1">회원관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/notice">공지사항 관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/qna">1:1 문의 관리</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" href="#pk" role="button" aria-haspopup="true" aria-expanded="false">광고 관리</a>
							<ul class="dropdown-menu dropdown-info" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/ad">광고 관리</a>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adApp">광고 문의 관리</a>
							</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/LogOut">로그아웃</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="margin-top: 50px;">
		<form action="${pageContext.request.contextPath}/admin/notice/updateContent" method="post">
			<table class="table">
				<tr>
					<th style="width: 100px;"><label style="color: black;">제목</label></th>
					<td style="padding-left: 14px;">
						<input type="text" name="title" value="${post.title}" style="border: none; width:600px; height:50px; background-color:transparent;">
					</td>
				</tr>
				<tr>
					<th style="width: 100px;"><label style="color: black;">내용</label></th>
					<td style="padding-left: 14px;">
						<textarea name="content" cols="100" rows="25" style="border: none; background-color:transparent; overflow: auto; text-align: justify">${post.content}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<a href="${pageContext.request.contextPath}/admin/notice/viewContent?no=${post.no}" class="btn btn-outline-button btn-round">취소</a>
						<input type="submit" class="btn btn-outline-button btn-round" value="등록">
					</td>
				</tr>
				<tr>
					<td style="border-top: none;"><input type="hidden" name="no" value="${post.no}"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>