<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <meta charset="utf-8">
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img//apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img//favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>
    일맺다 메인
  </title>
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no" name="viewport">
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet">
  
  
  <style>

  #main {
    margin : 0 auto;
    background-color:#fff;
    /* position: fixed; */
   
  }
  
  #mainimageblk{
   	width:100%; 
    height: 106px;
    border-bottom: 1px solid #E7E7E7;
  }
  
  
  
  
  #mainimage {
    width:1320px; 
    height: 410px;
    margin-top: 0;
    background-image: url(${pageContext.request.contextPath}/imagefile/mainimage.png);
    background-repeat: no-repeat;
    background-position: center;
    /* border:1px solid #E7E7E7; */
    margin:0 auto;
    position:relative;
  }

  

   #username ul{
    margin-top: 4px;
    list-style: none;
    height:0px;
  }
  
  #username ul li {
    display:block;
    float:left;
    text-align: center;
    font-size:14px;
  }
  #username a, #username a:visited {
  	
    padding: 0px 30px 0px 0px; 
    display: block;
    color: black;             /* 글자색 */
    text-decoration: none;  /* 밑줄 없음 */
  }
 



  div .homelogo {

    position:absolute;
    margin : -2px 0px 0px -100px;
  }

  #navi .menu2 {
    float: right;
    margin : -105px 250px 0px 0px;
    position:relative;
  }

  #admain{
    width:1320px; 
    height:600px;
    background-color:#E7E7E7;
    margin:0 auto;
    
  }

  #addiv {
    padding: 0px 13px; 
  }


  .adatc {
    width:280px; 
    height:415px;
    background-color:#fff;
    border:6px solid #e0e0e0;
    float: left;
    margin-left: 2%;
   }


  #companyAd{
    width:1320px; 
    height:420px;
    background-color:#3F4C5F;
    color:white;
    font-size:20px;
    margin:0 auto;

    
  }

  
  #rank{
    width:1320px; 
    height:600px;
    background-color:#E7E7E7;
    color:#3F4C5F;
    font-size:35px;
    margin:0 auto;
  }


  #adname1 {
    margin : 0px 195px 0px 50px;
  }

  #adname2 {
    margin : 0px 195px 0px 0px;
  }

  #adname3 {
    margin : 0px 25px 0px 0px;
  }

  #adname4 {
    margin : 0px 29px 0px 36px;
  }


  .blk{
    margin : 0px 5px 0px 50px;
  }

  #blkw{
    height:250px;

  }


  .footer {
  left: 0;
  bottom: 0;
  width: 100%;
  padding: 15px 0;
  text-align: center;
}


  

  #username{
  	z-index: 99999;
	margin : 35px 0px 0px 1450px;
    width: 1600px;
    heigth: 69px; 
    -webkit-transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
    -moz-transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
    -o-transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
    -ms-transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
    transition: all 0.33s cubic-bezier(0.685, 0.0473, 0.346, 1);
    position: absolute;
   
  }

  div .usercode {
    margin : -55px 0px 0px 40px;
    width: 300px;
    left: 1200px;
    font-size:15px;
  }

  #logimage{
	position: absolute;
    margin : -55px 0px 0px -130px;

  }

  #aa{
    margin : -10px 0px 0px -100px;
  }
  
  #green {
  color: #1ABC9C; 
  }
  
  .img-button {
      /* background: url( "${pageContext.request.contextPath}/imagefile/baro.png" ) no-repeat; */
      border: none;
    /*   width: 248px;
      height: 67px;  */
      position:absolute;
      margin : -110px 0px 0px 470px;
     	
    }
    
   .adli {
   	  margin-bottom: 13px;
   } 
   
   .adul {

    list-style: none;
   
   }
  
 
   .adul a, .adul a:visited {
   	 display:inline;
	 color: black; 
	 text-decoration: none;  /* 밑줄 없음 */
  }
  
  
	.navbar-translate {
		margin-left:35px;
	}
  



</style>


  
</head>


<body class="index-page sidebar-collapse">
   <!-- Navbar -->
  <nav class="navbar navbar-expand-lg fixed-top navbar-transparent" color-on-scroll="300">
  
	
    <div class="container" style="position:relative; z-index: 9999;">
    	<div class="homelogo"> 
			<a href="<c:url value="/index" />"><img src="${pageContext.request.contextPath}/imagefile/1.png" name="select"></a>
		</div>
      <div class="navbar-translate">
<a class="navbar-brand" href="<c:url value="/workerBoard/list" />" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom">구직게시판</a>

<a class="navbar-brand" href="<c:url value="/employerBoard/list" />" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom">구인게시판</a>

<a class="navbar-brand" href="<c:url value="/freeList" />" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom" >자유게시판
</a>

<a class="navbar-brand" href="<c:url value="/map" />" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom">지도검색
</a>

<a class="navbar-brand" href="<c:url value="/noticeList" />" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom">고객센터
</a>

<a class="navbar-brand" href="<c:url value="/myBlog/main" />" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom">마이블로그
</a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar bar1"></span>
          <span class="navbar-toggler-bar bar2"></span>
          <span class="navbar-toggler-bar bar3"></span>
        </button>
      </div>
      
      
      
      <div class="collapse navbar-collapse justify-content-end" id="navigation">
      	<div id="ulmagin">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a href="https://demos.creative-tim.com/paper-kit-2/docs/1.0/getting-started/introduction.html" target="_blank" class="nav-link"></a>
          </li>
          <li class="nav-item">
            <a href="<c:url value="/join/step1" />" class="btn btn-outline-default btn-round" type="button">회원가입</a>
           
			<a href="<c:url value="/login/login" />" class="btn btn-outline-default btn-round" type="button">로그인</a>
          </li>
        </ul>
        </div>
      </div>
    </div>
  
	<!-- 로그인시 변경되는 div -->

  		<div id="username"> <!--로그인 후 회원창-->
  			<div id = 'logimage'>
		      <img src="${pageContext.request.contextPath}/imagefile/mini2.png">
		     </div>
		        <div id="aa">
		          <div class="usercode"><b>${sessionScope.myuserCode}</b>님</div>
		      <ul>
		        <li><a href="index.jsp" onclick="window.open(this.href,'팝업창','width=800,height=1000'); return false;">채팅
		        <b><font id="green">20</font></b></a></li>
		        <li><a href="room.html">마이페이지</a></li>
		        <li><a href="room.html">로그아웃</a></li>
		     </ul>
		      </div>
		    </div> 
    
  </nav>
  <!-- End Navbar --> 
 
        
     
     
  


        
        
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
      $(document).ready(function() {

        if ($("#datetimepicker").length != 0) {
          $('#datetimepicker').datetimepicker({
            icons: {
              time: "fa fa-clock-o",
              date: "fa fa-calendar",
              up: "fa fa-chevron-up",
              down: "fa fa-chevron-down",
              previous: 'fa fa-chevron-left',
              next: 'fa fa-chevron-right',
              today: 'fa fa-screenshot',
              clear: 'fa fa-trash',
              close: 'fa fa-remove'
            }
          });
        }

        function scrollToDownload() {

          if ($('.section-download').length != 0) {
            $("html, body").animate({
              scrollTop: $('.section-download').offset().top
            }, 1000);
          }
        }
      });
      
      
      
      
      
      /* ------------------------------------------------------------------------------------------- */
      
      
   
		
 	   </script>
	</body>
</html>

