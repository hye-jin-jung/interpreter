<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
</head>

<title>리뷰</title>

<style>

.star{
  display:inline-block;
  width: 15px;height: 30px;
  cursor: pointer;
}
.star_left{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
  background-size: 30px; 
  margin-right: -3px;
}
.star_right{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -15px 0; 
  background-size: 30px; 
  margin-left: -3px;
}
.star.on{
  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}
body{
	overflow:hidden;
}
label{
	text-family: sans-serif;
}
button{			
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color: transparent;
	border : 2px solid #ffc107;
	color : #ffc107;
	font-family:sans-serif;
	font-size: 12px;
	font-weight: bold;
	width: 100px;
   	height: 35px;
   	margin: 9px 50px;
}
		
button:hover{			
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color:  #ffd556;
	border : 2px solid #ffd556;
	color : #fdf9ec;
	font-family:sans-serif;
	font-size: 12px;
	font-weight: bold;
	width: 100px;
   	height: 35px;
}
form{
	padding: 5px 50px 5px 50px;
    margin: 0px 35px;
    width: 410px;
}
</style>
</head>
<body>

  <form action="<c:url value='/reviewSuccess'/>" method = "POST" onsubmit = "return reviewCheck();">
  	<input type ="hidden" name = "category" value = "${category}"/>
  	<input type ="hidden" name = "targetCode" value = "${targetCode}"/>
  	<input type = "hidden" name = "matchingCode" value = "${matchingCode}"/>
 	<label>별점
 	<div class="star-box">
 	<span class="star star_left"></span>
 	<span class="star star_right"></span>

  	<span class="star star_left"></span>
  	<span class="star star_right"></span>

  	<span class="star star_left"></span>
  	<span class="star star_right"></span>

 	<span class="star star_left"></span>
 	<span class="star star_right"></span>
	
 	<span class="star star_left"></span>
 	<span class="star star_right"></span>
	</div>
		<input type = "hidden" name = "star"/>
	</label>
	
	<br/>
  	<label>한줄평<br/><br/>
  		<textarea id = "content" name = "content" style="width:400px;height:100px"></textarea>
  	</label>
  	
  	<br/>
  	<button type = "button" id = "close">취소</button>
  	<button type = "submit">등록</button>
  </form>



<script>
	window.onpageshow = function (event) {
    	if (event.persisted
        	|| (window.performance && window.performance.navigation.type == 2)) {
        	// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우 하고싶은거 밑에 쓰세용
        	alert("창을 종료합니다.");
        	window.close();
        	//저는 새로고침하게 만들어놨어유
    		}
		}
	
	 $(document).ready(function(){
		
		 $(".star").on('click',function(){
			   var idx = $(this).index();
			   $(".star").removeClass("on");
			     for(var i=0; i<=idx; i++){
			        $(".star").eq(i).addClass("on");
			   }
			     $("input[name = star]").val((idx +1)/2);	
		 });
		 
		 $("#close").click(function close(){
			 	window.close();
		 });
	});
	
	 function reviewCheck(){
		if( $("input[name = star]").val().length == 0 || $("#content").val().length == 0 ){
			alert("빈항목을 입력해주세요")
			return false;
		}
		else{
			return true;
		} 
	 }
	


</script>
</body>
</html>
