<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="../navigator1.jsp" flush="true"/>
<title>공지사항</title>

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

    
      #headerr {
         margin: 20px 0px 10px 445px;
      }
      
      
      #noticeTitle {
      
         width: 1060px;
         color : #454545;
         font-weight: bold;
         border-bottom: 2px solid #E7E7E7;
         position:relative;
      }
      
      #noticeTitle,#noticeContent {
      
         margin: 20px 0px 10px 445px;
      }
      
      #noticeRegdate{
         font-size: 17px;
         margin: -40px 0px 10px 505px;
      }
      
      #noticeHit {
         font-size: 15px;
         margin: -35px 0px 10px 1370px;
      }
   
	    
	   #blk {
	      height : 2px;
	      margin: -70px 0px 0px 1350px;
	      border-bottom: 1px solid #E7E7E7;
	   }    
	   
	   #blk2 {
	   
	      height : 350px;
	     
	   }  
	   
	   
	   #blk3 {
	   
	      height : 100px;
	     
	   }  
	   

		#noticeContent{
		
		margin-left: 470px;
	    width: 1000px;
	    margin-top: 50px;
		text-align: center;
		
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
	   
	   
	   
   </style>
   


   <div id="topAndBot">
   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
   </div>

      <div id="blk"></div>
      <div id="blk3"></div>
      
         <div id="headerr">
            <br>
            <br>
            <a href="<c:url value="/noticeList"/>" style="text-decoration: none;  color: black;"><h3>일맺다 공지사항</h3></a>
            <br>
            <br>
            <br>
            <br>
            <br>
         </div>
         
         <div id="noticeTitle">
               <h3 style="
                         padding-top: 10px;
                         padding-bottom: 20px;
                         padding-left: 20px;">
               ${NoticeVo.title}</h3>
         </div>
         <br><br>
         <div id="noticeRegdate">
               ${NoticeVo.regdate}
         </div>
               
         <div id="noticeHit">
         	     조회수&nbsp;&nbsp; ${NoticeVo.hit}
         </div>     
               
         <div id="noticeContent" style="margin-left:500px; width:1000px;">
               ${NoticeVo.content}
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
	   }
	};
	
	</script>
	
 <script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>

</html>