<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>회원가입</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">

<jsp:include page="../navigator2.jsp" flush="true"/>

<div class="joinDiv">
회 원 가 입
</div>
	<form action="step3" method="POST" class="step1Form" onsubmit="return confirmCheck2();">
		 
		<div class="form-group has-success" style="float:left;">
                  아이디(Email)<input type="email" name="email" id="email" placeholder="이메일주소" class="form-control form-control-success" required >
        </div>
		
		<input type="button" id="emailCheck" class="btn btn-default btn-round" value="중복확인">
		<input type="checkbox" id="emailConfirm" style="display:none">
		<br> 
		
		<div class="form-group has-success" style="float:left;">
        	 닉네임   <input type="text" name="usercode" id="userCode" placeholder="닉네임" class="form-control form-control-success" required >
        </div>
		<input type="button" id="usercodeCheck" class="btn btn-default btn-round" value="중복확인">
		<input type="checkbox" id="usercodeConfirm" style="display:none" >
		<br>
		비밀번호 
		<div class="form-group has-success">
              <input type="password" name="password" id="password1" placeholder="8자 이상,하나이상의 문자,숫자 및 특수 문자를 입력하세요" class="password form-control form-control-success" required >
        </div>
		비밀번호 확인 
		<div class="form-group has-success">
              <input type="password" id="password2" placeholder="비밀번호 확인" class="password form-control form-control-success" required >
        </div>
		<div style="display:inline" id="alert-wrong" class="wrong"><h6 style="color: red;">비밀번호가 일치하지 않습니다.</h6></div>
		<div style="display:inline" id="alert-wrong2"class="wrong"><h6 style="color: red;">비밀번호 형식이 옳바르지 않습니다. 8자 이상,하나이상의 문자,숫자 및 특수 문자를 입력하세요.</h6></div>
		<br>

		<div class="form-group has-success">
		 생년월일 
		<div class = "birth">
       	<input type="text" id="year" placeholder="년도" class="birthdate form-control " required  style="margin:10px;">
		</div>
		<div class = "birth">		 
				<select id="month"  class="form-control birthdate" required style="margin:10px;" >
					<option value="">월</option>
					<%for(int i = 1; i<=9; i++){%>
					<option value="0<%=+i %>" id="month" ><%=i %>월</option>
					<%} %>
					<%for(int i = 10; i<=12; i++){%>
					<option value="<%=+i %>" id="month"><%=i %>월</option>
					<%} %>
				</select>
		</div>
		<div class = "birth">		 
				<select id="day" class="form-control birthdate" required style="margin:10px;" >
					<option value="">일</option>
					<%for(int i = 1; i<=9; i++){%>
					<option value="0<%=+i %>" id="day"><%=i %>일</option>
					<%} %>
					<%for(int i = 10; i<=31; i++){%>
					<option value="<%=+i %>" id="day"><%=i %>일</option>
					<%} %>
				</select> 
		</div>
			<input type="hidden" id="birthdate" name="birthdate"><br> 		
			<div style="display:inline" id="year-wrong" style="display:none" ><h6 style="color: red;">생년월일을 올바르게 입력해주세요.</h6></div>
		</div>
		<div class="form-group has-success" style="float:left;">
		휴대폰 번호 <input type="text" name="phone" id="phone" class="form-control form-control-success join" placeholder="-없이 숫자로만 입력" required >
		</div>
		 <input type="button" class="btn btn-default btn-round" id="send" value="인증번호 발송"> <br> 
		<div class="form-group has-success" style="float:left;">
		인증번호 입력<input type="text" id="sendCheck" placeholder="인증번호 확인" class="form-control form-control-success join " placeholder="인증번호 입력" required >
		</div>
		<br>
		<br>
		<div class="form-group has-success" style="top: 50px;">
		<input type="submit" class="btn btn-success btn-round" value="가입하기">
		</div> 
	</form>
<script src="${pageContext.request.contextPath}/js/join.js" charset="UTF-8"></script>
<jsp:include page="../footer.jsp" flush="true"/>
</body>

<style type="text/css">
	form{
		width:500px;
		height:800px;
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
		}
	
	#emailCheck{
	margin: 20px 0px 20px 10px;
	}
	#usercodeCheck{
	margin: 20px 0px 20px 10px;
	}
	
	#send{
	margin: 20px 0px 20px 10px;
	}
	
	#email{
		width:400px;
	}
	#userCode{
		width:400px;
	}
	#phone{
		width: 370px;
	}
	
	input[type=submit]{
	    width: 150px;
    
    }
    
</style>
</html>