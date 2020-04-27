<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../navigator1.jsp" flush="true"/>

	<title>일맺다 QNA</title>
<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

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

	
	
	
	#blk{
		height: 150px;
	}
	
	#blk2{
		height: 50px;
	}
	
	#title{

		width:800px;
		height:40px;
	}
	
	
	#header{
	
		margin:-50px 0px 0px 500px;

	}
	
	#titlediv, #inqudiv, #contdiv, #complaindiv, #filediv {
	
		margin:0px 0px 0px 680px;
		
	}

	#inquirytype, #complain {
	
		width:200px;
		height:40px;
	}
	
	#content {
	
		width:800px;
		height:250px;
		resize:none;
	}		
	
	#complaindiv input{
	
		display: inline;
	
	}
	
	#sub {
		margin:0px 0px 0px 1320px;
	}
	
	
	#subbutn, #resetbutn{
		background-color: #1ABC9C;
	    color: #FFFFFF;
	    border-color: #1ABC9C;
	    box-shadow: none;
 	  }
	
	#subbutn:hover, #resetbutn:hover {
		background-color: #048f74;
	    color: #FFFFFF;
	    border-color: #048f74;
	    box-shadow: none;
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
	
	
		div .homelogo {
		    position: absolute;
		    margin: 4px 0px 0px -100px;
		}
		
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
		
		
		
		.btn {
		    box-sizing: border-box;
		    border-width: 2px;
		    font-size: 12px;
		    font-weight: 600;
		    padding: 1.5rem 18px;
		    line-height: 0.2;
		    cursor: pointer;
		    text-transform: uppercase;
		    background-color: #66615B;
		    border-color: #66615B;
		    color: #FFFFFF;
		    opacity: 1;
		    filter: alpha(opacity=100);
		    -webkit-transition: all 150ms linear;
		    -moz-transition: all 150ms linear;
		    -o-transition: all 150ms linear;
		    -ms-transition: all 150ms linear;
		    transition: all 150ms linear;
		}
		
		h3, .h3 {
		    font-size: 1.825em;
		    line-height: 1.4;
		    margin: 20px 0px 0px 180px;
		}
			
	
	</style>
	
	<c:if test="${not empty sessionScope.myuserCode}">
		<script>$(".navbar-translate").css("margin-left", "-392px");</script>
	</c:if>
	
	
	
	   <div id="topAndBot">
	   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
	   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
	   </div>
	
		
		<div id="blk"></div>
		<div id="header">
		<b><h3> 1:1 문의하기</h3></b>
		</div>
		<div id="blk2"></div>
		
			<section>
				  <form action="${pageContext.request.contextPath}/qnaStep2" method="POST" enctype="multipart/form-data">
				  	   <input type="hidden" id="writercode" name="writercode" value="${myuserCode}">
				      
				      <div id="titlediv" class="form-group has-success" style="float:left;">
                 	     제목
                 	  <input type="text" id="title" name="title" class="form-control form-control-success" required >
       				  </div>
				      <br>
				      <br>
				      <br>
				      <br>
					    <div id="inqudiv">	
					   	 상담유형  	 
							<select id="inquirytype" name="inquirytype" class="form-control inquirytype" required >
								<option value="이용문의">이용문의
					            <option value="불만 및 신고">불만 및 신고
					            <option value="기타">기타
							</select>
						</div>
					  <br>	
				      <div id="contdiv"> 
				              설명
				      <textarea class="form-control" id="content" name="content" rows="1" cols="10" placeholder="문의 내용을 입력하세요."></textarea>    
				      </div> 
				      <br>
				      <div id="complaindiv">
				              신고 회원 닉네임&nbsp;&nbsp;&nbsp;
			            <input type="text" class="form-control" name="complain" id="complain" disabled>&nbsp;&nbsp;
			            <input type="button" class="btn btn-default btn-round" id="usercodeCheck" value="회원확인" disabled>
			           </div>
			            <br>
				      
				      <div id="filediv">      
				              첨부파일 
				      <br><br>
		              <input multiple="multiple" type="file" name="uploadFile" />
		              </div>
		              <br>
		              <div id="sub" class="form-group has-success" style=" top: 20px;">
					  <input type="submit" class="btn btn-success btn-round" id="subbutn" value="등록">
					  <input type="reset" class="btn btn-success btn-round" id="resetbutn" value="다시쓰기">
					  </div> 
		  		 </form>
		   </section>
		   
		   
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
		
	
	
		//닉네임칸 활성화
		$('#inquirytype').change(function(){
			if($("select[name=inquirytype]").val() == "불만 및 신고"){
				$("input[name=complain]").attr('disabled', false);
				$('#usercodeCheck').attr('disabled', false);
			}else {
				$("input[name=complain]").attr('disabled', true);
				$('#usercodeCheck').attr('disabled', true);
			}
		});
		
		
		//닉네임 중복확인
		$('#usercodeCheck').click(function(){
			var userCode = $("input[name=complain]").val();
			console.log("확인 할 닉네임 :"+userCode);
			$.ajax({
				url : "${pageContext.request.contextPath}/cs/usercodeChk",
				type : "POST",
				data : userCode,
				contentType : "application/String",
				dataType : "text",
				success : function(data){
					console.log("온 data"+data)
					if(data == 0 ){
						alert("존재하지 않는 회원입니다.")
						$("input[name=complain]").val('');
					} 
				}
			})		
		});
		
		
		
		
	</script>
	
		<jsp:include page="../footer.jsp" flush="true"/>
</body>

</html>
