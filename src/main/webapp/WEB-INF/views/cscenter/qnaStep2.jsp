<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../navigator1.jsp" flush="true"/>
	<title>�ϸδ� QNA</title>
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
	            <p style="margin-top: 40px;"><h5 style="display:inline;">${qna.writercode}</h5> ���� ���ǰ� ��ϵǾ����ϴ�.</p>
	            <div id="blk"></div>
	</blockquote>
	  <div id="stepBtn">
	         	<input type="button" value="���� 1:1���� " onclick="location.href='<c:url value="//mypage/myQnaList" />'"
	          	 class="btn btn-success btn-round">            
	            </div>
	<div id="blk2"></div>
	
	 
	</body>
	
		<script>
	

	$(window).load(function() {
		sessionChk()
	});

	
	//�α��� Ȯ��
	function sessionChk() {
		var id = "${sessionScope.myuserCode}";
		/* alert("??"); */
		console.log('idüũ:' + id);
		if (id == '' || null || undefined || 0 || NaN){
			$('#username').hide();
		  }else{
		  console.log("�α��� ��"); 
		  $('#ulmagin').hide();
		   /*  ���� :ä�þ˸��� ���� ��� ����*/
		  bye();
	      	wsocket = new WebSocket("ws://localhost:8080<c:url value='/echo'/>");
	      	wsocket.onmessage = onMessage;
		  wsocket.onclose = onClose;
		  wsocket.onopen = onOpen;
		  /*ä�þ˸� ���� ��� ��  */
		}
	};
	
	
	</script>
	
	
</html>