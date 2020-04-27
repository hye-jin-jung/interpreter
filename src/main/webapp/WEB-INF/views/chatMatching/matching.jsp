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
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<style>
		.container{
			width: 95%;
   			height: 240px;
		}
		
  		body{
			padding-top: 10px;
			font-family: Montserrat,Helvetica,Arial,sans-serif;
		}
		 
		#scrollc{
			width : 100%;
			height : 100%;
			overflow-y : auto;
		}
		.table{
			margin-bottom: 2px;
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
		#sendEbBt{
			margin: 50px 30px 0px 150px;	
		}
		#matchingBt{
			margin: 50px 120px 0px 50px;		
		}
			
	</style> 
</head>

<title>매칭하기</title>
</head>
<body>
	<div class="container">    
    <!--  1:1채팅내역 for문으로띄움-->
     <table class="table table-hover">
    	<thead>
    	<tr>
    		<th/>
    		<th>글코드</th>
    		<th>제목</th>
    		<th>근무시작일</th>
    		<th>근무종료일</th>
    		<th>근무시간대</th>
    		
    	</tr>
    	</thead>
    </table>
    <div id ="scrollc">	
    <table class="table table-hover">
    	<thead>
    	</thead>
    	
    	<c:forEach var = "eb" items = "${employerBoardVoList}" varStatus = "Loop">
			
			<tr>
				<td><input type = "radio" name = "ebcode" /></td>
				<td>${eb.ebCode}</td>
				<td>${eb.title}</td>
				<td>${eb.workStart}</td>
				<td>${eb.workEnd}</td>
				<td>${eb.workTime}</td>
			</tr>
		</c:forEach>
    
    </table>
    </div>
    </div>
    <button id ="sendEbBt"  type="button">게시글전송</button>
     <button id ="matchingBt"  type="button">매칭하기</button>
 

<script>

	var wsocket;
	
	var ebCode = '';
	var title = '';
	var workStart = '';
	var workEnd = '';
	
	$(document).ready(function(){
 	
		$("input[name = ebcode]").change(function(){
			var tr = $("input[name = ebcode]:checked").parent().parent();
			var td = tr.children();
			
			console.log("클릭한 Row의 모든 데이터 : "+tr.text());
			
			ebCode = td.eq(1).text();
			title = td.eq(2).text();
			workStart = td.eq(3).text();
			workEnd = td.eq(4).text();
		});
		
		$("#sendEbBt").click(function(){
			if(ebCode==''){
				alert("게시글을 선택해주세요");
				return;
			}
			var ebUrl = "이 게시글로 매칭할까요?<br/>게시글 코드 : " +ebCode + "<br/>게시글 제목 : " + title +"<br/>" 
						+ "<a href = '${pageContext.request.contextPath}/employerBoard/read/" +ebCode +"' onclick='window.open(this.href); return false;'>매칭할 게시글 바로가기</a>";
			sendEb(ebUrl);
		});
		
		$("#matchingBt").click(function(){
 			if(ebCode==''){
				alert("게시글을 선택해주세요");
				return;
			}
			matching();
		});
		
		
	});
	
	/* 채팅전송 함수 */
	function sendEb(ebUrl){
		opener.parent.sendMessage(ebUrl);
	};
	
	
	/* 매칭하기 함수 */
	function matching(){
		
		
		var obj = { "ebCode" : ebCode, "title" : title, "workStart" : workStart, "workEnd" : workEnd};

		var ebUrl = "이 게시글로 매칭되었어요!<br/>게시글 코드 : " +ebCode + "<br/>게시글 제목 : " + title +"<br/>" 
					+ "<a href = '${pageContext.request.contextPath}/employerBoard/read/" +ebCode +"' onclick='window.open(this.href); return false;'>매칭된 게시글 바로가기</a>";
		sendEb(ebUrl);

		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/makeMatching",
	        data : JSON.stringify(obj),
	        contentType : "application/json",
		});	
		window.close();
	};


</script>
</body>
</html>
