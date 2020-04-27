<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>정보수정 완료</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<script>var contextPath = "${pageContext.request.contextPath}";</script>

<!-- 사이드바 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<jsp:include page="../navigator2.jsp" flush="true"/>
<jsp:include page="mypageMain.jsp" flush="true"/>

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
   
   
   div .homelogo {
    position: absolute;
    margin: 3px 0px 0px -100px;
	}


   .navbar-translate {
    margin-left: -395px;
	}
   


   
   
   
</style>
<blockquote class="blockquote"  id="stepHr">			
			<p style="margin-top: 40px;"><h5 style="display:inline;"> 회원 정보가 정상적으로 수정 되었습니다.</h5></p>
			
			<input type="button" class="button" value="확인" onclick="location.href ='${pageContext.request.contextPath}/mypage/updateInfo'">
			
</blockquote>


<footer>
<jsp:include page="../footer.jsp" flush="true"/>
</footer>
</body>
</html>