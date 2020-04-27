<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true" />

<title>회원 탈퇴</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mypage.css">
<script>
	var contextPath = "${pageContext.request.contextPath}";
</script>
<!-- 사이드바 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<jsp:include page="../navigator2.jsp" flush="true" />
<jsp:include page="mypageMain.jsp" flush="true" />

<style>
body {
	background-color: #EAEAEA !important;
}

footer {
	left: 750px;
	top: 650px;
}

.updateInfo {
	position: absolute;
	left: 100px;
	width: 85%;
	height: 90%;
	margin: 0px 200px 0px 200px;
}

input[type=submit] {
	width: 150px;
}

.form-group {
	top: 50px;
	left: 0px;
}

element.style {
	float: left;
}

.form-group {
	top: 0px;
	left: 0px;
	right: 0px;
	width: 100%;
	height: 60px;
	margin-bottom: 0px;
	display: flex;
}

#stepHr {
	width: 1320px;
	margin-left: 70px;
}

footer {
	position: absolute;
}

.formLabel {
	width: 150px;
	padding-top: 10px;
}

.button {
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color: transparent;
	border: 2px solid #1ABC9C;
	color: #1ABC9C;
	font-family: sans-serif;
	font-size: 12px;
	font-weight: bold;
	width: 150px;
	height: 35px;
}

.button:hover {
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color: #1ABC9C;
	border: 2px solid #1ABC9C;
	color: #fdf9ec;
	font-family: sans-serif;
	font-size: 12px;
	font-weight: bold;
	width: 150px;
	height: 35px;
}

.deleteForm {
	position: absolute;
	left: 500px;
	height: 400px;
	width: 500px;
	top: 150px;
}

.deleteAccount {
	top: 250px;
	margin-left: 200px;
	position: absolute;
	left: 100px;
}

.footer {
	background-color: #EAEAEA !important;
}

div .homelogo {
	position: absolute;
	margin: 3px 0px 0px -100px;
}

.navbar-translate {
	margin-left: -395px;
}
</style>

<div class="deleteAccount">

	<blockquote class="blockquote" id="stepHr">
		<p style="margin-top: 40px;">
		<h5 style="display: inline;">회원 탈퇴</h5>
		</p>
	</blockquote>

	<div class="deleteForm">
		-쪽지,포인트 등의 개인정보 데이터는 삭제됩니다.<br> -각종 게시판의 게시글, 댓글 등의 데이터는 삭제되지
		않습니다. 반드시 탈퇴 전 직접 삭제하셔야 합니다.<br> -회원 탈퇴 뒤에는 모든 회원 정보가 삭제되며 재가입시에도
		기존 아이디는 더 이상 사용하실 수 없습니다.<br> <br>
		<br>
		<div class="form-check">
			<label class="form-check-label"> <input class="check"
				id="check" type="checkbox"> 안내사항을 모두 확인하였으며, 이에 동의합니다. <span
				class="form-check-sign"></span>
			</label>
		</div><br/>
		<lable style = "width: 50px;">비밀번호</label>
		<div class="form-group has-success">
			<input type="password" id="password" placeholder="비밀번호"
				class="password form-control form-control-success" required>
		</div>


		<input type="button" id="deleteAccount" value="회원 탈퇴" class="button"
			style="margin-left: 180px;">

	</div>

</div>

<script src="${pageContext.request.contextPath}/js/mypage.js"
	charset="UTF-8"></script>

<footer>
	<jsp:include page="../footer.jsp" flush="true" />
</footer>

</body>
</html>