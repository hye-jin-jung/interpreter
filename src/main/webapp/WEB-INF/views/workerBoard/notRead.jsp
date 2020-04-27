<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>

<html>
<head>
<title>삭제된 게시글입니다.</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/function.js"></script>

<!--2개 스크립트 추가  -->
<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>

	 .navbar.navbar-transparent { /*여울****/ 
	  /* background: transparent !important; */
	  padding-top: 25px; 
	  box-shadow: none;
	  color: black;
	}	
	.navbar .navbar-brand {
	  font-weight: 500;
	  margin: 5px 0px;
	  padding: 20px 15px;
	  font-size: 15px;
	  color: #66615B;
	  text-transform: uppercase;
	}
	
	 #header { 
   height:100px;
   }
	
		li { list-style: none}
	
	 .nav-item a{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color: transparent;
         border : 2px solid #66615B;
         color : #66615B;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 100px;
         height: 40px;
         
      }
      
      .nav-item a:hover{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color:  #66615B;
         border : 2px solid #66615B;
         color : #fdf9ec;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 100px;
          height: 40px;
       
      }
     .navbar-nav > li > a {
    	padding-top: 7px;
	}
	
	.navbar-nav{
		padding-top:20px;
		padding-left:360px;
	}
	
	.navbar-toggler{
		display:none;
	}
	
	pre {
    background-color: #ffffff;
    border: 1px solid #fff;
	font-family:Helvetica Neue;	
	}
	
	#topAndBot{
      position:fixed;
      width:175px;
      display:inline-block;
      right:0px; /* 창에서 오른쪽 길이 */
      top:94%; /* 창에서 위에서 부터의 높이 */
      background-color: transparent;
      margin:0;
      z-index: 999;
    }
</style>

<jsp:include page="../zxc2.jsp" flush="true"/>

</head>
<div id="header"></div>	
<body>

		<div id="topAndBot">
		   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
		   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
		</div>
		
<!-- 게시글이 삭제됐다면 -->			
	<div class="container">
		<div class="row">
			<div style="text-align:center;">
				<h3>${notRead }</h3><br>
					<a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;" 
						 href="<c:url value="/bookMark/bmkList/${blogMaster}"/>">돌아가기</a> 
			</div>	
		</div>
	</div>

   <jsp:include page="../zxc3.jsp" flush="true"/>	    

</body> 	  
</html>
