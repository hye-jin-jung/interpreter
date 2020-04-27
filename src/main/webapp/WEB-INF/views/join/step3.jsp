<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>회원가입 완료</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

<style>
body{
	"margin-top: 300px;
}
</style>

</head>

<jsp:include page="../navigator2.jsp" flush="true"/>

<div style="height:106px;"></div>

<blockquote class="blockquote" id="stepHr" style="margin-top: 180px; height: 202px;">
            <p style="margin-top: 40px;"><h5 style="display:inline;">${user.usercode}</h5> 님 1M 회원이 되신것을 축하드립니다!!!</p>
            <div id="stepBtn" style="padding-top: 20px;">
            <input type="button" value="home으로 이동" onclick="location.href= '${pageContext.request.contextPath}/index'" class="btn btn-success btn-round"> 
			<input type="button" value="로그인하기" onclick="location.href= '${pageContext.request.contextPath}/login/login'"  class="btn btn-success btn-round">            
            </div>
</blockquote>


<jsp:include page="../footer.jsp" flush="true"/>
</body>
</html>