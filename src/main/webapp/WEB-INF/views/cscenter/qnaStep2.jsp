<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../navigator1.jsp" flush="true"/>
	<title>일맺다 QNA</title>
<jsp:include page="../navigator2.jsp" flush="true"/>

	<style>
		#blk {
			height:106px;
		}
		
		#blk2 {
			height:200px;
		}
	
		#qnain{
			width:800px;
			margin: 150px 0px 0px 590px;
		}
		
		#stepBtn{
			margin: -70px 0px 0px 935px;
		}
	</style>
	
	<div id="blk"></div>

	<blockquote class="blockquote" id="qnain">
	            <p style="margin-top: 40px;"><h5 style="display:inline;">${qna.writercode}</h5> 님의 문의가 등록되었습니다.</p>
	            <div id="blk"></div>
	</blockquote>
	  <div id="stepBtn">
	         	<input type="button" value="나의 1:1문의 " onclick="location.href='<c:url value="//mypage/myQnaList" />'"
	          	 class="btn btn-success btn-round">            
	            </div>
	<div id="blk2"></div>
	
	 
	</body>
	
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
	
	
</html>