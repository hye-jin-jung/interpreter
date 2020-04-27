<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets2/img/favicon1.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/assets2/css/material-dashboard.css" rel="stylesheet"/>
<style>
	.table > thead > tr > th {
		background-color: #d6d6d6 !important; 
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
	
	.pagination > li > a,
	.pagination > li> span,
	.pagination > li:first-child > a,
	.pagination >li:first-child > span,
	.pagination > li:last-child > a,
	.pagination > li:last-child > span {
		background-color: transparent;
		border: 2px solid #1ABC9C;
		border-radius: 20px;
		color: #1ABC9C;
		height: 36px;
		margin: 0 2px;
		min-width: 36px;
		padding: 8px 12px;
		font-weight: 600;
	}
	
	.page-item:first-child .page-link, .page-item:last-child .page-link {
		border-bottom-left-radius: 20px;
		border-top-left-radius: 20px;
		border-bottom-right-radius: 20px;
		border-top-right-radius: 20px;
	}

	.pagination > li > a:hover {
		background-color: #1ABC9C !important;
		border-color: #1ABC9C !important;
		color: #FFFFFF;
	}
</style>
<c:if test="${message == null}">
<table class="table" style="margin:0 auto; width: 70%;">
	<tr>
		<th style="background-color: #d6d6d6"><input type="hidden"></th>
		<th style="background-color: #d6d6d6">아이디</th>
		<th style="background-color: #d6d6d6">닉네임</th>
		<th style="background-color: #d6d6d6">경고 횟수</th>
		<th style="background-color: #d6d6d6">가입일</th>
	</tr>
	<c:forEach items="${user}" var="user">
		<tr>
			<td><input type="checkbox"  id="check" name="check" onclick="checkBox(form.check, this)" value="${user.usercode}"></td>
			<td>${user.email}</td>
			<td>${user.usercode}</td>
			<td>${user.warningCount}</td>
			<td>${user.regiDate}</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="5" align="right">
				<input type="button" id="chat" class="btn btn-outline-button btn-round" value="채팅하기">
				<input type="button" id="warning" class="btn btn-outline-button btn-round" value="경고"> 
				<input type="button" id="deleteUser" class="btn btn-outline-button btn-round" value="회원탈퇴">
			</td>
		</tr>
</table>
	<div aria-label="Page navigation example" style="padding-left: 900px; padding-right: 45%; padding-top: 35px; padding-bottom: 0px;">
			<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/admin/user/${pageMaker.startPage - 1}">&lt</a>
				</li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
  				<li><a href="${pageContext.request.contextPath}/admin/user/${idx}">${idx}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/admin/user/${pageMaker.endPage + 1}">&gt</a>
				</li>
			</c:if>
			</ul>
	</div>
<script>
	function checkBox(targetObj, inObj) {
		var len = targetObj.length;
	
		if(len > 1) {
			for(var i=0; i<len; i++) {
				if(targetObj[i] != inObj) {
					targetObj[i].checked = false;
				}	
			}
		}
	}
</script>
</c:if>
<c:if test="${message == false}">
<script>
	alert("정상적인 접근이 아닙니다.");
</script>
	<div style="text-align: center;">
		<br><br>
		<p><a href="${pageContext.request.contextPath}/admin">관리자 로그인</a></p>
		<p><a href="${pageContext.request.contextPath}/index">일맺다 메인으로 돌아가기</a></p>
		<br>
		<p style="text-align: center;"><img src="${pageContext.request.contextPath}/imagefile/mini1.png"/></p>
	</div>
</c:if>


