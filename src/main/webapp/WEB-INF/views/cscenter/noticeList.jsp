<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../navigator1.jsp" flush="true"/>

<title>일맺다 공지사항</title>

  <script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>



  <!-- 사이드바 -->
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <!-- 부트스트랩 -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>



	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cs.css">
	<jsp:include page="../navigator2.jsp" flush="true"/>
	<jsp:include page="csInclude.jsp" flush="true"/>


	<style>
	
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

	
		
		#notice{
			margin:70px 0px 0px 750px;
		}
	
		#noTile {
			margin:120px 0px 0px 650px;
		}
	
		#notice a {
		font-size: 17px;
		color: #66615b;             /* 글자색 */
	    text-decoration: none !important;  /* 밑줄 없음 */
	
		}
		
		
		#notice a:hover, a:focus {
	    color: #1ABC9C;
	    text-decoration: none;
	    font-weight:bold;
	    
   		}
		
		
		
		.noticeAtc {
			margin-top: 30px; 
		}
		
		
		.navbar .btn {
		    margin: 11px 3px;
		    font-size: 12px;
		}
		
		.navbar-nav>li>a {
		    padding-top: 2px;
		    padding-bottom: 34px;
		    line-height: 33px;
		}
		
		.btn-round {
		    border-radius: 30px;
		    height: 20px;
		}
		
		
		#ulmagin {
		    margin: 7px 0px 0px 15px;
		    position: absolute;
	    }
		
		/* 이거 */

		div .homelogo {
	    position: absolute;
	    margin: 5px 0px 0px -101px;
		}
		
		/* 이거 */
		#username {
		    z-index: 99999;
		    margin: 41px 0px 0px 1456px;
		    width: 1600px;
		    heigth: 69px;
		    -webkit-transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
		    -moz-transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
		    -o-transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
		    -ms-transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
		    transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
		    position: absolute;
		}
		
	
	</style>
	
	<!-- 진짜메항따 잘 따라오는데 메뉴 오른쪽으로 치우칠때 이거 -->
	<c:if test="${not empty sessionScope.myuserCode}">
		<script>$(".navbar-translate").css("margin-left", "-392px");</script>
	</c:if>
	

   <div id="topAndBot">
   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
   </div>
   
   
	<div id="blk"></div>
	<div id="noTile"><h3>일맺다 공지사항</h3></div>
	
	<div id="notice">
		<c:forEach items="${noticeList}" var="vo">
			<div class="noticeAtc">
				<a href="<c:url value="/noticeList/read/${vo.no}" />">
						<i class="far fa-bell fa-1x"></i> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.title}</a> </div>
		</c:forEach>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
		<script>
		
	
		$(window).load(function() {
			sessionChk()
		});
	
		
		//로그인 확인
		function sessionChk() {
			var id = "${sessionScope.myuserCode}";
			/* alert("??"); */
			console.log('id체크:' + id);
			if (id == '' || null || undefined || 0 || NaN){
				$('#username').hide();
			  }else{
			  console.log("로그인 됨"); 
			  $('#ulmagin').hide();
			   /*  지영 :채팅알림을 위한 기능 시작*/
			  bye();
		      	wsocket = new WebSocket("ws://localhost:8080<c:url value='/echo'/>");
		      	wsocket.onmessage = onMessage;
			  wsocket.onclose = onClose;
			  wsocket.onopen = onOpen;
			  /*채팅알림 위한 기능 끝  */
			}
		};
		
		
		</script>
	
		<jsp:include page="../footer.jsp" flush="true"/>
	</body>
</html>