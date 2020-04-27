<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

  function delchk(){
    
    var id = "${sessionScope.myuserCode}";
      if (id == '' || null || undefined || 0 || NaN){
      alert("로그인 후 이용할 수 있습니다");
      window.location.href='${pageContext.request.contextPath}/login/login';
      } else {
        window.location.href='${pageContext.request.contextPath}/myBlog/main/${myuserCode}';
      }
  
  }
  
  </script>

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
  
  
  	.navbar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
       margin-left: 0px; 
	}
 
 
 	.navbar .navbar-brand {
 	
    font-weight: 500;
    margin: 5px 0px;
    padding: 20px 16.5px;
    font-size: 15px;
    color: #66615B;
    text-transform: uppercase;
    
	}

</style>

</head>


<body class="index-page sidebar-collapse">
	<div id="fix">
   <!-- Navbar -->
  <nav class="navbar navbar-expand-lg fixed-top navbar-transparent" color-on-scroll="300">
  
	
    <div class="container" style="position:relative; z-index: 9999;">
    	<div class="homelogo"> 
			<a href="<c:url value="/index" />"><img src="${pageContext.request.contextPath}/imagefile/12.gif" name="select"></a>
		</div>
      <div class="navbar-translate">
<a class="navbar-brand" href="<c:url value="/workerBoard/list" />" rel="tooltip" title="구직게시판" data-placement="bottom">일프로게시판</a>


<a class="navbar-brand" href="<c:url value="/employerBoard/list" />" rel="tooltip" title="구인게시판" data-placement="bottom">일나눔게시판</a>

<a class="navbar-brand" href="<c:url value="/freeList" />" rel="tooltip" title="자유게시판" data-placement="bottom" >자유게시판
</a>

<a class="navbar-brand" href="<c:url value="/map" />" rel="tooltip" title="1map" data-placement="bottom">지도검색
</a>

<a class="navbar-brand" href="<c:url value="/noticeList" />" rel="tooltip" title="고객센터" data-placement="bottom">고객센터
</a>

<a class="navbar-brand" onclick="delchk();" rel="tooltip" title="Coded by Creative Tim" data-placement="bottom">마이블로그
</a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar bar1"></span>
          <span class="navbar-toggler-bar bar2"></span>
          <span class="navbar-toggler-bar bar3"></span>
        </button>
      </div>
      
      
   	<c:if test="${empty sessionScope.myuserCode}">
			<div class="collapse navbar-collapse justify-content-end" id="navigation">
				<div id="ulmagin">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a href="https://demos.creative-tim.com/paper-kit-2/docs/1.0/getting-started/introduction.html"
								target="_blank" class="nav-link"></a>
						</li>
						<li class="nav-item">
							<a href="<c:url value="/join/step1" />" class="btn btn-outline-default btn-round"
							type="button">회원가입</a>

							<a href="<c:url value="/login/login" />" class="btn btn-outline-default btn-round"
							type="button">로그인</a>
						</li>
					</ul>
				</div>
			</div>
			</c:if>
		</div>

		<!-- 로그인시 변경되는 div -->
	<c:if test="${not empty sessionScope.myuserCode}">
		<div id="username">
			<!--로그인 후 회원창-->
			<div id='logimage'>
				<img src="${pageContext.request.contextPath}/imagefile/mini2.png">
			</div>
			<div id="aa">
				<div class="usercode"><b>${sessionScope.myuserCode}</b>님</div>
				<ul>
					<li><a href="${pageContext.request.contextPath}/chatList"
							onclick="window.open(this.href,'팝업창','width=438,height=618'); return false;">채팅
							<b>
								<font id="green">${chatCount}</font>
							</b></a></li>
					<li><a href="<c:url value="/mypage/myQnaList" />">마이페이지</a></li>
					<li><a href="<c:url value="/logout" />">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	</nav>
	<!-- End Navbar -->

        
