<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>비밀번호 변경완료</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<script>var contextPath = "${pageContext.request.contextPath}";</script>


<!-- 사이드바 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<jsp:include page="../navigator2.jsp" flush="true"/>
<%
	if(session.getAttribute("myuserCode") != null){
%>			
	<jsp:include page="mypageMain.jsp" flush="true"/>
<%
	}
%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
<style>
footer{
    left: 700px;
    top: 750px;
}

#stepHr {
	margin-top: 180px;
	height: 200px;
	width: 1500px;
	margin-left: 300px;
   }
   
.button{         
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
    background-color: transparent;
    border : 2px solid #1ABC9C;
    color : #1ABC9C;
    font-family:sans-serif;
    font-size: 12px;
    font-weight: bold;
    width: 150px;
    height: 35px;
    margin-top: 10px;
 }
      
.button:hover{         
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
    background-color:  #1ABC9C;
    border : 2px solid #1ABC9C;
    color : #fdf9ec;
    font-family:sans-serif;
    font-size: 12px;
    font-weight: bold;
    width: 150px;
    height: 35px;

   }
   
footer{
	margin-right: auto;
    margin-left: 320px;
    width: 1460px;
}
</style>

	<blockquote class="blockquote"  id="stepHr">			
		<p style="margin-top: 40px;"><h5 style="display:inline;">비밀번호 변경이 완료되었습니다.</h5></p>
	
		<%
			if(session.getAttribute("myuserCode") != null){
		%>		
			<input type="button" class="button" value="확인" onclick="location.href = '${pageContext.request.contextPath}/mypage/myQnaList'" style="margin-top: 30px;">
		<%
			}else{
		%>
			<input type="button" value="main으로 이동" class="button" onclick="location.href = '${pageContext.request.contextPath}/index'">
			<input type="button" value="로그인 하기" class="button" onclick="location.href = '${pageContext.request.contextPath}/login/login'">
		<%
			}
		%>
	</blockquote>

	 <footer>
	<jsp:include page="../footer.jsp" flush="true"/>
	</footer>

</body>
</html>