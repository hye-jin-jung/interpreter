<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일맺다 :: 페이지를 찾을 수 없습니다.</title>
<style>
body{
	color: #66615b;
    font-size: 14px;
    font-weight: 300;
    font-family: 'Montserrat', "Helvetica", Arial, sans-serif;
    background: url(https://s.pstatic.net/static/w8/err/bg_body.gif) repeat-x;
	text-align: center;
}
div{
	font-family: sans-serif;
}
 a, a:visited {
    color: black;             /* 글자색 */
    text-decoration: none;  /* 밑줄 없음 */
  }
	</style>
</head>
<body>
<div style="margin-left: 30%;margin-top: 12%;"><a href="<c:url value="/index"/>">일맺다 홈</a> | <a href="<c:url value="/noticeList" />">일맺다 고객센터</a></div>
<div >
<img alt="" src="imagefile\1.png" style = "margin-bottom:40px;">
<div style="margin-top: 40px;text-align: left;margin: 0 auto;width: 500px;">
<b>죄송합니다.<br/>요청하신 페이지를 찾을 수 없습니다.</b>
<br/><br/>
방문하시려는 페이지의 주소가 잘못 입력되었거나,<br/>
페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.
<br/><br/>
입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.<br/> 
관련 문의사항은 <a href="<c:url value="/noticeList" />">일맺다 고객센터</a>에 알려주시면 친절하게 안내해 드리겠습니다.<br/>
감사합니다.
</div>

<div class="footer" style="margin-top: 40px;">
    (주)일맺다 | Copyright Anchoreer Co., Inc. All rights reserved.
</div>
</div>  
</body>
</html>