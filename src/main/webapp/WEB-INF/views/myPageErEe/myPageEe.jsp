<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../navigator1.jsp" flush="true"/>

<script>var contextPath = "${pageContext.request.contextPath}";</script>
  
<!-- 부트스트랩 -->
 <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets2/demo/demo.css" rel="stylesheet" />

<!-- 사이드바 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script>var contextPath = "${pageContext.request.contextPath}";</script>
<!-- 부트스트랩 -->
 <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets2/demo/demo.css" rel="stylesheet" />

<!-- 사이드바 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="${pageContext.request.contextPath}/js/mypage.js" charset="UTF-8"></script>
<style>
#myPageEe {
    margin: 0px 200px 0px 10px;
    display: flex;
    width: 100%;
    height: 100%;
}
.intro{
	margin: 50px 50px 50px 50px;
    padding: 3% 30% 3% 30%;
    width: 100%;
    height: 100%;
    align-items: center;
}

#openStatus{
	display: flex;
	position: absolute;
}

.btn btn-orange btn-round{
margin : 20px 0px 0px 0px;
}
btn btn-orange btn-round:hover{
color:white;
}

button{
margin : 20px 10px 0px 10px;
}

#goWrite{
margin : 20px 0px 0px 0px;
}


#first{
	width : 100%;
    height: 80px;
	border: 2px solid #d0e2d5;
	margin-bottom: 5px;
}
#second{
	width : 100%;
	border: 2px solid #d0e2d5;
}

#middle{
	width : 100%;
	margin-bottom: 5px;
	border: 2px solid #d0e2d5;
}

#career{
    width: 100%;
    height: 30px;
    padding-top: 3px;
    border-bottom: 2px solid #d0e2d5;
    background-color : #d0e2d5;
    color : white;
}
table{
	width : 95%;
	padding : 5px 10px 5px 10px;
	margin : 5px 10px 5px 10px; 
}
th {
    text-align: center;
    border-bottom: 1px solid #cecece;
}
#workspace{
	float:left;
}

#contents{
	width : 100%;
	height : 30px;
	padding-top: 3px;
    border-bottom: 2px solid #d0e2d5;
    background-color : #d0e2d5;
    color : white;
}






</style>
<title>소개서관리</title>

<jsp:include page="../navigator2.jsp" flush="true"/>

<jsp:include page="../mypage/mypageMain.jsp" flush="true"/>

<style>

	 div .homelogo {
	    position: absolute;
	    margin: 3px 0px 0px -100px;
	}


 	.navbar-translate {
 	   margin-left: -395px;
	}
   



</style>


<div class="card text-center">
  <div class="card-header card-header-rose">
    <ul class="nav nav-tabs">
      <li class="nav-item">
      	<c:if test="${category =='employee'}">
        <a class="nav-link" href="myPageEr">일나눔소개서관리</a>
        </c:if>
        <c:if test="${category =='employer'}">
        <a class="nav-link active" href="myPageEr">일나눔소개서관리</a>
        </c:if>
      </li>
      <li class="nav-item">
        <c:if test="${category =='employee'}">
        <a class="nav-link active" href="myPageEe">일프로소개서관리</a>
        </c:if>
        <c:if test="${category =='employer'}">
        <a class="nav-link" href="myPageEe">일프로소개서관리</a>
        </c:if>
      </li>
    </ul>
  </div>
  <div class="card-body">
  
<div id = "myPageEe">
	<div id = "openStatus">
	공개여부
	<input type = "checkbox" id = "open" checked> 
	 <label for = "open"><span></span></label>
	</div><br/><br/>


	<div class = "intro">
	<c:if test="${category =='employee' }">
	
		<div><h2>일프로 소개서</h2></div>
	</c:if>

	<c:if test="${category =='employer' }">
		<div><h2>일나눔 소개서</h2></div>
	</c:if>
	<c:if test="${intro != null}">
		<div id = "first">
		<div id = "contents">희망 근무지</div>
		<p style = "height : 100%; padding-top: 15px;">${intro.workspace}</p>
		</div>
		<c:if test="${!empty career}">
		<div id = "middle">
		<div id = "contents">경력사항</div>
		<table>
			<th style = "width: 40%">회사</th>
			<th style = "width: 30%">재직시작일</th>
			<th style = "width: 30%">재직종료일</th>
		<c:forEach var = "cc" items="${career}" varStatus = "Loop">
			<tr>
			<td>${cc.company}</td>
			<td>${cc.startDate}</td>
			<td>${cc.endDate}</td>
			</tr>
		</c:forEach>
		</table>
		</div>
		</c:if>
		<div id = "second">
		<div id = "contents">자기소개</div>
		<div style = "height : 100%; width : padding-top: 15px;">${intro.contents}</div>
		</div>
		<button  ngcontent-c4 class="btn btn-orange btn-round" type="button" 
		onclick="goPage('editIntro')">수정</button>
		<button  ngcontent-c4 class="btn btn-orange btn-round" type="button" 
		id = "delete" value = "${intro.introductionCode}">삭제</button>
<%-- 		
		<button onclick="goPage('editIntro')">수정</button>
		<button id = "delete" value = "${intro.introductionCode}">삭제</button>	 --%>	
	</c:if>
	<c:if test="${intro == null}">
		<p>등록된 소개서가 없습니다.</p>
		<button id = "goWrite" ngcontent-c4 class="btn btn-success btn-round" onclick="goPage('writeIntro')">소개서 작성하기</button>
		
	</c:if>
	</div>
</div>

</div>
</div>
<footer style ="margin-left: 100px;">
<jsp:include page="../footer.jsp" flush="true"/>
</footer>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/onoff.css">

 <script>
 window.onpageshow = function (event) {
 	if (event.persisted
     	|| (window.performance && window.performance.navigation.type == 2)) {
     	// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우 하고싶은거 밑에 쓰세용
     	document.location.reload();
     	//저는 새로고침하게 만들어놨어유
 	}
	}
 
	$(document).ready(function(){
		openStatus()	
		
		$("#open").change(function(){
			updateOpenCheck();
		});
		
		$("#delete").click(function(){
			if (confirm("정말 삭제하시겠습니까??") == true){    //확인
				deleteIntro();
			}else{   //취소
			    return;
			}
		});
		$(document).keypress(function(e){
		    if(e.keyCode==13) window.even.keyCode = 0;
		  });
		
	});
	
	function deleteIntro(){
		var introductionCode = $("#delete").val();
		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/deleteIntro/${category}",
	        data : introductionCode,
	        contentType : "application/String",
	        success : function(data) {  
	        	alert("소개서가 삭제되었습니다");
	         	location.reload(); 
	        }
		});			
	};
	
	function updateOpenCheck(){
		var openCheck = '';
		if($("#open").is(":checked")){
			openCheck = 'Y';
		}else{
			openCheck = 'N';
		}		

		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/updateOpenCheck/${category}",
	        data : openCheck,
	        contentType: "application/String",
	        success : function(data) {  
	        	/* alert("OpenCheck ajax성공") */
	        }
		});			
	};
	
	function openStatus(){
		if(${intro.openCheck == 'Y'}){
			$("#open").attr("checked", true);					
		}else if(${intro.openCheck == 'N'}){
			$("#open").attr("checked", false);	
		}else{
			$("#open").attr("checked", false);	
		}
	} 
	
	function goPage(goUrl){
		var resultUrl = '';
		if(goUrl == 'writeIntro'){
			var openCheck = '';
			if($("#open").is(":checked")){
				openCheck = 'Y';
			}else{
				openCheck = 'N';
			}
			resultUrl = goUrl + '/${category}?open='+ openCheck;
		}
		else{
			resultUrl = goUrl + '/${category}';
		}
		location.replace(resultUrl);
	}
	
</script>
<style>
input:checked + label span {
    transform: translateX(30px);
}
</style>
</body>
</html>
