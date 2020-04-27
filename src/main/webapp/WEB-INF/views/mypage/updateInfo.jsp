<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>마이페이지</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
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
    left: 800px;
    top: 750px;
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

	
#year {
	width:150px;
	margin-right : 20px;}
	
#month{
	width:110px;
	margin-right : 20px;}
	
 #day{
	width:110px;
	margin-right : 20px;}
	
.birth{
    display: inline-block;
	margin : 0px 0px 0px 0px;
	position: inherit;
    left: 40px;
	}

#emailCheck{
margin: 20px 0px 20px 10px;

}
#usercodeCheck {
    margin: 0px 0px 0px 10px;
    height: 35px;
}
#send{
margin: 0px 0px 0px 10px;
    width: 120px;
    height: 35px;
}

#email{
	width:400px;
}
#userCode{
	width:400px;
	margin: 0px 0px 0px 20px;
}
#phone{
	width: 370px;
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
		     <p style="margin-top: 40px;"><h5 style="display:inline;">개인정보 수정</h5></p>
		</blockquote>
<form action="updateInfo" class="mypageForm" method="POST" onsubmit="return updateInfo();">
	
	<div class="updateForm">
		<div class="form-group has-success" style="float:left;">
        	 <label class="formLabel" for = "userCode">닉네임</label>
        	 <input type="text" name="usercode" id="userCode" value="${member.usercode }"  class="form-control form-control-success" >
 		<input type="button" id="usercodeCheck" class="btn btn-default btn-round" value="중복확인">
		<input type="checkbox" id="usercodeConfirm" style="display:none" >
        </div>

		
		<div class="form-group has-success " style="float:left;">
		 <label class="formLabel">생년월일</label> 
		<div class = "birth">
       	<input type="text" id="year" value="${year}" class="birthdate form-control "  style="margin:10px;">
		</div>
		<div class = "birth">		 
				<select id="month"  class="form-control birthdate" style="margin:10px;" >
					<option value="${month}">${month}월</option>
					<%for(int i = 1; i<=9; i++){%>
					<option value="0<%=+i %>" id="month" ><%=i %>월</option>
					<%} %>
					<%for(int i = 10; i<=12; i++){%>
					<option value="<%=+i %>" id="month"><%=i %>월</option>
					<%} %>
				</select>
		</div>
		<div class = "birth">		 
				<select id="day" class="form-control birthdate" style="margin:10px;" >
					<option value="${day}">${day}일</option>
					<%for(int i = 1; i<=9; i++){%>
					<option value="0<%=+i %>" id="month"><%=i %>월</option>
					<%} %>
					<%for(int i = 10; i<=31; i++){%>
					<option value="<%=+i %>" id="month"><%=i %>월</option>
					<%} %>
				</select> 	
			<div style="display:inline" id="year-wrong" style="display:none" >생년월일을 올바르게 입력해주세요.</div>
			
			<input type="hidden" id="birthdate" value="${year}+${month}+${day}" name="birthdate">
		</div>
		</div>
		
		<div class="form-group has-success" style="float:left;">
		<label class="formLabel" for = "phone">휴대폰 번호</label> <input type="text" id="phone" class="form-control form-control-success join" placeholder="-없이 숫자로만 입력" style="margin-left: 20px;">
		<input type="button" class="btn btn-default btn-round" id="send" value="인증번호 발송">
		</div>
		  
		<div class="form-group has-success" style="float:left;">
		<label class="formLabel" for = "sendCheck">인증번호 입력</label><input type="text" id="sendCheck" placeholder="인증번호 확인" class="form-control form-control-success join " placeholder="인증번호 입력" style="margin-left: 5px;" >
		</div>
		
		<div class="form-group has-success" style="top: 50px;float:left;">
		<input type="submit" id="updateInfoBtn" class="button" value="정보수정" style="margin-left: 220px;">
		<input type="hidden" name="phone" value="${member.phone}">
		</div>
	</div>
	</form>
	</div>





<script src="${pageContext.request.contextPath}/js/mypage.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/js/join.js" charset="UTF-8"></script>
 <footer >
<jsp:include page="../footer.jsp" flush="true"/>
</footer>
</body>
</html>