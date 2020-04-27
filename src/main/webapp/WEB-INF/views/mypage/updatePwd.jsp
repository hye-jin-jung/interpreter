<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>비밀번호 변경</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

<script>var contextPath = "${pageContext.request.contextPath}";</script>

<!-- 사이드바 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<jsp:include page="../navigator2.jsp" flush="true"/>
<jsp:include page="mypageMain.jsp" flush="true"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
<style>
 body {
     background-color: #EAEAEA !important;
 }
footer{
    left: 750px;
    top: 800px;
}
.updateInfo{
   position: absolute;
    left: 100px;
    width: 85%;
    height: 90%;
    margin: 0px 200px 0px 200px;
} 

form{
	width: 700px;
	height:420px;
	display: inline-grid;
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
    width: 1320px;
    margin-left: 70px;
   }

footer{
position : absolute;
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
	top: 250px;
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

<div class="updateInfo">

		<blockquote class="blockquote" id="stepHr">
		     <p style="margin-top: 40px;"><h5 style="display:inline;">비밀번호 변경</h5></p>
		</blockquote>
		
	<div class="updateForm">
		<label class="formLabel">현재 비밀번호</label> 
		<div class="form-group has-success">
              <input type="password" id="oldpassword" placeholder="현재 비밀번호" class="password form-control form-control-success"  >
        </div>
      	<label class="formLabel">새 비밀번호 </label>
		<div class="form-group has-success">
              <input type="password" id="password1" placeholder="새 비밀번호" class="password form-control form-control-success"  >
        </div>
		<label class="formLabel">새 비밀번호 확인</label>
		<div class="form-group has-success">
              <input type="password" id="password2" placeholder="새 비밀번호 확인 " class="password form-control form-control-success"  >
        </div>
		<div style="display:inline" id="alert-wrong"><h6 style="color: red;">비밀번호가 일치하지 않습니다.</h6></div>
		<div style="display:inline" id="alert-wrong2"class="wrong"><h6 style="color: red;">비밀번호 형식이 옳바르지 않습니다. 8자 이상,하나이상의 문자,숫자 및 특수 문자를 입력하세요.</h6></div>
		<br>
		
		<div class="form-group has-success" style="top: 50px;float:left;">
		
		<input type="button" id="updatePwdBtn" class="button" value="변경" style="margin-left: 180px;">
		</div>
	</div>


</div>


<script src="${pageContext.request.contextPath}/js/mypage.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/js/join.js" charset="UTF-8"></script>

 <footer>
<jsp:include page="../footer.jsp" flush="true"/>
</footer>

</body>
</html>