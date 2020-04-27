<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();
%>
<jsp:include page="../navigator1.jsp" flush="true"/>

<title>소개서 작성</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
<script src = "${pageContext.request.contextPath}/js/address.js"></script>

<script>var contextPath = "${pageContext.request.contextPath}";</script>


<!-- 사이드바 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src = "${pageContext.request.contextPath}/js/address.js"></script>

<jsp:include page="../navigator2.jsp" flush="true"/>
<jsp:include page="../mypage/mypageMain.jsp" flush="true"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
<style>
ul, ol {
    margin-left: 110px;
    list-style : none;
}
footer{
    left: 700px;
    top: 700px;
}
.updateInfo{
   position: absolute;
    left: 100px;
    width: 1100px;
    height: 90%;
    margin: 0px 0px 0px 170px;
} 

form{
	width: 1100px;
	height:420px;
	display: inline-grid;
	}

	
#sido1{
	width:150px;
	margin-right : 20px;}
	

#gugun1{
	width:150px;
	margin-right : 20px;}
		
.birth{
    display: inline-block;
	margin : 0px 0px 0px 0px;
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
         width: 100px;
         height: 35px;
         margin : 20px 0px 10px 50px;
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
      width: 100px;
      height: 35px;

   }

.updateForm{
    position: absolute;
    left: 450px;
    height: 400px;
    width: 100%;
    top: 200px;
}



	 div .homelogo {
	    position: absolute;
	    margin: 3px 0px 0px -100px;
	}


 	.navbar-translate {
 	   margin-left: -395px;
	}
   

	ul, ol {
	    margin-left: 0px;
	    list-style: none;
	}





</style>
<div class="updateInfo">
		<blockquote class="blockquote" id="stepHr">
		<c:if test = "${category == 'employee'}">
		    <p style="margin-top: 40px;"><h5 style="display:inline;">일프로 소개서 작성</h5></p>
		</c:if>
		<c:if test = "${category == 'employer'}">
			<p style="margin-top: 40px;"><h5 style="display:inline;">일나눔 소개서 작성</h5></p>
		</c:if>     
		</blockquote>
  <form action = "${pageContext.request.contextPath}/writeIntro/${category}" 
  		method = "POST"
  		onsubmit = "return submitCheck();">
  		
	<div class="updateForm">
	<input type ="hidden" name = "userCode" value = "${myuserCode}"/>
  	<input type = "hidden" name = "openCheck" value = "${openCheck}"/>
  	
  		<div class="form-group has-success" style="float:left;">
		 <label class="formLabel">희망 근무지</label> 
		<div class = "birth">		 
				<select id="sido1"  name="sido1" class="form-control birthdate" style="margin:10px;" required>
				</select>
		</div>
		<div class = "birth">	 
				<select id="gugun1" name="gugun1" class="form-control birthdate" style="margin:10px;" >
				</select> 	
		<input type = "hidden" name = "workspace"/>	
		</div>
		</div>
		
 		<c:if test = "${category == 'employee'}">
		
       	<label class="formLabel" for = "userCode">경력사항</label>
 		<button type = "button" id = "plusCareer" style = "width:30px;">+</button>
		<button type = "button" id = "minusCareer" style = "width:30px;">-</button>
		<ul class = "career">
		</ul>
		</c:if>
						
		<div class="form-group has-success" style="float:left;">
		<label class="formLabel" for = "sendCheck">자기소개</label>
		<textarea _ngcontent-c4 class="form-control" id = "contents" name = "contents" style="width:400px;height:100px" required></textarea>
  		</div>

		<div class="form-group has-success" style="top: 50px;">
		<input type="button"  id = "close" class="button" value="취소" style="margin-left: 150px;">
  		<input type="button"  id = "submit" class="button" value="등록">
		</div>
	</div>
	</form>
	</div>


<jsp:include page="../nav3Js.jsp" flush="true"/>


<script src = "${pageContext.request.contextPath}/js/myPageWriteEdit.js"></script>
<script>

 	var ajaxUrl ='';
	if(${category=='employee'}){
		ajaxUrl = "${pageContext.request.contextPath}/myPageEe";
	}else{
		ajaxUrl = "${pageContext.request.contextPath}/myPageEr";
	}
	
	var thisuserCode = "${myuserCode}";
	var thiscategory = "${category}";
	var thisopenCheck = "${openCheck}";  
	 
	function submitSuccess(introList){
		var jsonData = JSON.stringify(introList);   
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/writeSuccess/${category}",
			data : jsonData,
			contentType: "application/json",
			success : function(data) {
			  	var ajaxUrl = "${pageContext.request.contextPath}/" + data;
			  	window.location.replace(ajaxUrl);
			}
		});	
	}
	
	sido();/*  삽입된 스크립트 address.js 에 있는 시도, 군구 초기 셋팅 메서드*/
	
	function dateYear(e){
		/* if문 추가 */
		e.html("<option value='0'>년</option>");
		for(var i =<%= cal.get(Calendar.YEAR)%>; i > 1950; i--){
			e.append("<option value='"+i+"'>"+i+"년</option>");
		}
	}
	
	function dateMonth(e){
		e.html("<option value='0'>월</option>");
		for(var i = 1; i < 13; i++){
			e.append("<option value='"+i+"'>"+i+"월</option>");
		}
	}		
	
</script>

</body>
</html>