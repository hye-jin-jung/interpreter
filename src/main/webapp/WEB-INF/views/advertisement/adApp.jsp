<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<% request.setCharacterEncoding("UTF-8");%>
<% String sessionCode = (String)session.getAttribute("myuserCode"); %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>광고신청</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!--  <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> -->
  
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img//apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img//favicon1.png">
  
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet">
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet">
  
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
#foo{
	width: 160px;
  	height: auto;
}
button{         
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
         margin : 20px 80px 10px 155px;
      }
      
button:hover{         
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
.eAd{
   position: absolute;
    left: 100px;
    width: 1100px;
    height: 90%;
    margin: 120px 0px 0px 0px;
} 
.cAd{
   position: absolute;
    left: 100px;
    width: 1100px;
    height: 90%;
    margin: 30px 0px 0px 0px;
} 
form{
	width: 400px;
	height:420px;
	display: inline-grid;
	}
	
.birth{
    display: inline-block;
	margin : 0px 0px 0px 0px;
	}

</style>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

 <c:if test="${category == 'employee' || category == 'employer'}">
<div class="eAd">
 <form action = "adAppSuccess1">	
 	<input type = "hidden" name = "userCode" value= "${userCode}">
 	<input  type = "hidden" name = "adcategory" value= "${category}">
 	
 	<div class="form-group has-success" ><p>게시글 광고 신청시 300point가 차감됩니다.</p></div>
 	
 	<div class="form-group has-success" style="float:left;">
 	<label for = "link" class="formLabel">게시글코드</label>
 	<select  class="form-control form-control-success join " name = "link" required/>
	<c:forEach var = "e" items = "${boardList}" varStatus = "Loop">
		<c:if test = "${category == 'employer'}">
		<option value = "${e.ebCode}">${e.ebCode} : ${e.title}</option>
		</c:if>
		<c:if test = "${category == 'employee'}">
		<option value = "${e.wbCode}">${e.wbCode} : ${e.title}</option>
		</c:if>
	</c:forEach>
	</select>
	</div>
 	
 	<div class="form-group has-success" style="float:left;">
 	<label for = "title" class="formLabel">게시글제목</label>
 	<input class="form-control form-control-success join " type = "text" name = "title" required/>
 	</div>
 	
 	<div class="form-group has-success" style="float:left;">
 	<label for = "content" class="formLabel">건의사항</label>
 	<textarea class="form-control form-control-success join " style="width:400px; height:150px;" name = "content"></textarea>
 	</div>
 	
 	 	<button type = "submit">등록</button>
 </form>
 </div>
 </c:if>
 
  <c:if test="${category == 'company'}">
 <div class="cAd">
  <form action = "adAppSuccess2" enctype="multipart/form-data"
  method = "POST" onsubmit = "return check();">
 	<input type = "hidden" name = "userCode" value= "${userCode}">
 	<input type = "hidden" name = "adcategory" value= "${category}">
 	
	<div class="form-group has-success" style="float:left;">
 	<label for = "enterprise" class="formLabel">업체명</label>
 	<input type = "text" name = "enterprise" class="form-control form-control-success join " required/>
 	</div>
	
	<div class="form-group has-success" style="float:left;">
	<label for = "enterprise" class="formLabel">업체 로고</label>
 	<input type='file' id="imgInp" name = "file" class="form-control form-control-success join " required/>
	</div>
		<div style="width:160px;height:160px;">
        <img id="foo" src="#"/>
        </div>
 	
 	<div class="form-group has-success" style="float:left;">
 	<label for = "link" class="formLabel">업체 사이트</label>
 	<input type = "text" name = "link" class="form-control form-control-success join " required/>
 	<span id = "linkCheck" style="color:red;"></span>
	</div>
 	
 	<div class="form-group has-success" style="float:left;">
 	<div class = "birth" style="padding-top:10px;width:70px;">
 	<label for = "adDate" class="formLabel">광고 기간</label></div><div class = "birth" style="padding-top:10px;width:70px;">
 	<input type = "number" name = "adDate" class="form-control form-control-success join "  required/></div>
 	<div class = "birth" style="padding-top:10px;width:50px;">일</div>
 	</div>
 	
 	
 	<label for = "phone" class="formLabel">전화번호</label>
 	<div class="form-group has-success" style="float:left;">
 	<div class = "birth" style="padding-top:10px;">
 	<input type = "text" name = "phone1" class="form-control form-control-success join "  onchange = "makePhone()" value = "010" style="width:100px;"required/>
 	</div><div class = "birth" style="padding-top:10px;width:10px;">-</div>
 	<div class = "birth" style="padding-top:10px;">
 	<input type = "text" name = "phone1" class="form-control form-control-success join " onchange = "makePhone()" style="width:100px;" required/>
	</div><div class = "birth" style="padding-top:10px;width:10px;">-</div>
	<div class = "birth" style="padding-top:10px;margin-right: 70px;">
	<input type = "text" name = "phone1" class="form-control form-control-success join " onchange = "makePhone()" style="width:100px;" required/>
	</div>
	<span id = "phoneCheck" style="color:red;"></span>
 	<input type = "hidden" id = "phone" name = "phone"/>
 	</div>
 	
 	<div class="form-group has-success" style="float:left;">
 	<label for = "email" class="formLabel">이메일</label>
 	<input type = "email" name = "email" class = "form-control" required/>
 	<br/><span id = "emailCheck" style="color:red;"></span>
	</div>
 	
 	<div class="form-group has-success" style="float:left;">
 	<label for = "content" class="formLabel">건의사항</label> 	
 	<textarea  class="form-control form-control-success join " style="width:400px; height:150px;" name = "content"></textarea>
 	</div>
 	
 	<button type = "submit">등록</button>
 </form>
 </div>
 </c:if>
  	<br/><br/>
       <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
    <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
 
  
 <script>
 
 	if(<%=sessionCode== null%>){
		alert("로그인이 필요한 서비스입니다.");
		window.open('', '_self', '');
		window.close();
	}
 
 	window.onpageshow = function (event) {
 		if (event.persisted
     		|| (window.performance && window.performance.navigation.type == 2)) {
     	// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우 하고싶은거 밑에 쓰세용
     		alert("창을 종료합니다.");
     		window.close();
     	//저는 새로고침하게 만들어놨어유
 		}
	}
	
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
            	$('#foo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function() {
    	console.log(this.value);
        readURL(this);
    });
    
    function makePhone(){
    	var phoneNum = document.getElementsByName("phone1");
    	var phoneVal = phoneNum[0].value + phoneNum[1].value + phoneNum[2].value;
    	$("#phone").val(phoneVal);
    }
    
    function check(){
    	
    	var link = $("input[name = link]").val();  	
    	var phone = $("input[name = phone]").val();
    	var linkRule = /(http(s)?:\/\/)([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/gi;
    	var phoneRule = /^\d{11}$/;

    	if(!phoneRule.test(phone)||!linkRule.test(link)){
    		if(!phoneRule.test(phone)){
    			$("#phoneCheck").html("올바른 휴대폰 번호 형식이 아닙니다.");
    		}
    		if(!linkRule.test(link)){
    			$("#linkCheck").html("올바른  url 형식이 아닙니다.");
    		}
    	  	return false;
     	}else{
    		return true;
    	} 		
    }
    
   </script>

</body>
</html>