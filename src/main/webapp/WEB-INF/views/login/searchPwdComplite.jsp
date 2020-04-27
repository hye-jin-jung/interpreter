<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>아이디 / 비밀번호 찾기</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<!-- 부트스트랩 -->
 <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />

<style>
body{
	"margin-top: 300px;
}

.updateInfo{
   position: absolute;
    left: 100px;
    width: 85%;
    height: 90%;
    margin: 0px 200px 0px 200px;
} 

#send{
margin: 0px 0px 0px 10px;
    width: 120px;
    height: 35px;
}


input[type=submit]{
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
	margin-top: 180px;
	height: 400px;
	width: 1500px;
	margin-left: 200px;
   }

footer{
	position : absolute;
	margin-right: auto;
    margin-left: 640px;
} 
    
.formLabel{
width : 150px;
padding-top: 10px;
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
.updateForm{
    position: absolute;
    left: 500px;
    height: 400px;
    width: 500px;
    top: 150px;
}   

.updateInfo{
	top: 420px;
	width: 400px;
    height: 300px;    
    left: 0px;
    margin-left: 750px;
    margin-right: auto;
    right: 0px;
    
    font-size: 15px;
    line-height: 1.5em;
    -webkit-font-smoothing: antialiased;
    font-family: "Montserrat", "Helvetica", Arial, sans-serif;
    font-weight: 300;
}    

</style>

</head>


<jsp:include page="../navigator2.jsp" flush="true"/>

<div style="height:106px;"></div>

<blockquote class="blockquote" id="stepHr">
	<p class="mb-0">			
			 <br> <br> 
			 새로운 비밀번호를 입력하세요.
			 <br> <br>
	</p>
	
	<div class="updateInfo">
	새 비밀번호 
	<div class="form-group has-success">
		<input type="password" id="password1" class="password form-control form-control-success" required" placeholder="새 비밀번호" required > <br>
	</div>
		새 비밀번호 확인
		<div class="form-group has-success">
		 	<input type="password" id="password2" class="password form-control form-control-success" placeholder="새 비밀번호 확인 " required >
		</div>
			<div style="display:inline" id="alert-wrong"><h6 style="color: red;">새 비밀번호가 일치하지 않습니다.</h6></div>
			<div style="display:inline" id="alert-wrong2"class="wrong"><h6 style="color: red;">비밀번호 형식이 옳바르지 않습니다. 8자 이상,하나이상의 문자,숫자 및 특수 문자를 입력하세요.</h6></div>
		<br>
		<input type="button" id="updatePwdBtn" value="비밀번호 변경" class="btn btn-success btn-round">
	</div>
</blockquote>

<script src="${pageContext.request.contextPath}/js/mypage.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/js/join.js" charset="UTF-8"></script>

 <footer>
<jsp:include page="../footer.jsp" flush="true"/>
</footer>

</body>
</html>