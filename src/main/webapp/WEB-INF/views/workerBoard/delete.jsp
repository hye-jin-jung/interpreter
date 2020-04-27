<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>${workerBoardVO.title}&nbsp 삭제</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">

</head>
<body>
<br><br><br>
	<div style="text-align:center;">
        <form name="deleteForm" 
	        action="<c:url value="/workerBoard/delete" />" method="POST">
	                <input type="hidden" size="1" name="wbCode" value="${wbCode}"/>
	                	게시글을 삭제하시겠습니까?<br><br>
	 
	                <input class="btn btn-primary" type="submit" style="background-color:#1ABC9C;border-color:#1ABC9C;" value="삭제"/>
	                <a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;"  
	                	href="<c:url value="/workerBoard/read/${wbCode}"/>">취소</a>
        </form>
        <div>${msg}</div>
	</div>
</body>
</html>
