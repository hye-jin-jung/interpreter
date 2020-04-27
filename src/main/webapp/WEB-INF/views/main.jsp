<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>일맺다 테스트</title>


<style>


  #main {
    margin : 0 auto;
    background-color:#fff;
    /* position: fixed; */
   
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

  #navi{
    /* background:#003E00; */
    margin-top:-15px;
    width:100%;
    height:110px;
    margin:0 auto;
    border-bottom:1px solid #E7E7E7;
  }

  #navi ul{
    list-style: none;
    height:40px;
    padding-top:30px;
  }
  
  #navi ul li {
    display:inline;
    float:left;
    text-align: center;
    font-size:20px;
  }
  #navi a, #navi a:visited {
    padding: 20px 3px 5px 35px;
    display: block;
    color: black;             /* 글자색 */
    text-decoration: none;  /* 밑줄 없음 */
  }


  #username{
    margin : 2px 0px 0px 105px;
  }


  #username ul{
    margin-top: 4px;
    list-style: none;
    height:0px;
  }
  
  #username ul li {
    display:inline;
    float:left;
    text-align: center;
    font-size:17px;
  }
  #username a, #username a:visited {
    padding: 0px 30px 0px 0px; 
    display: block;
    color: black;             /* 글자색 */
    text-decoration: none;  /* 밑줄 없음 */
  }




  div .homelogo {
    float:left;
    margin : 20px 0px 0px 220px;
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
    position:absolute;
    top: 1px;
    left: 1350px;

  }

  div .usercode {
    margin : -55px 0px 0px 40px;
    width: 300px;
    left: 1200px;
    font-size:20px;
  }

  #logimage{
    margin : 55px 0px 0px -130px;

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
  

   .logo{
	width: 130px;
  	height: auto;
  }

   .cBt{
	background-color: white;
	border : 0;
  }

   #c{
	margin : 0;
	padding : 0;
	list-style : none;
	display:inline;
	width: 800px;
  }

   .cad{
	align : left;
	width: 800px;
  }



  
  </style>
<!-- 제이쿼리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>





</head>

<body>


	<div id="main">
		<header>
			<nav id="navi">

				<div class="homelogo"> 
					<a href="#"><img src="${pageContext.request.contextPath}/imagefile/1.png" name="select"></a>
				</div>

				<div class="menu1"> <!-- 상단 메뉴 -->
					<ul>
						<li><a href="경로쓰기.jsp">구인게시판</a></li>
						<li><a href="경로쓰기.jsp">구직게시판</a></li>
						<li><a href="<c:url value="/freeList" />">자유게시판</a></li>
						<li><a href="<c:url value="/map" />">지도검색</a></li>
						<li><a href="<c:url value="/noticeList" />">고객센터</a></li>
						<li><a href="경로쓰기.jsp">마이블로그</a></li>
					</ul>
				</div>

				<div class="menu2"> <!-- 로그인전 화면 -->
					<ul>
						<li><a href="<c:url value="/join/step1" />">회원가입</a></li>
						<li><a href="<c:url value="/login/login" />">로그인</a></li>
					</ul>
				</div>
			</nav>
			
					
		    <div id="username"> <!--로그인 후 회원창-->
		      <img src="${pageContext.request.contextPath}/imagefile/mini2.png" id="logimage">
		        <div id="aa">
		          <div class="usercode"><b>${sessionScope.myuserCode}</b>님</div>
		      <ul>
		        <li><a href="desk.html">채팅 <b><font id="green">20</font></b></a></li>
		        <li><a href="room.html">마이페이지</a></li>
		        <li><a href="room.html">로그아웃</a></li>
		     </ul>
		      </div>
		    </div> 
			
			
			
			
			
		</header>

		<section>
		
			<!--최우식 이미지-->
			<div id="mainimage"></div>
			<!-- 이미지 버튼 -->			
			<img src="${pageContext.request.contextPath}/imagefile/baro.png" alt="지도검색" class="img-button" 
			onclick="location.href='<c:url value = "/map"/>';">

			<div id="admain">
				<!--공고 광고-->
				<br> <br> <br> <span id="adname1">구인글 인기공고</span> 
				<span id="adname2">구직글 인기공고</span>
				<span id="adname3">구인글 광고공고</span>
				<span class="blk"></span>
				<button class="adApp" onclick="adApp(this)" value="employer">신청하기</button>
				<span id="adname4">구직글 광고공고</span> <span class="blk"></span>
				<button class="adApp" onclick="adApp(this)" value="employee">신청하기</button>
				<br> <br>
				<div id="addiv">
					<div id="adfirst" class="adatc"></div> <!-- 구인글 -->
					<div id="adsecond" class="adatc"></div> <!-- 구직글 -->
					<div id="adthird" class="adatc"></div> <!-- 광고구인글 -->
					<div id="fourth" class="adatc"></div> <!-- 광고구직글 -->
				</div>
			</div>

		<div id="companyAd"><br><br>
		<button class = "adApp"  onclick = "adApp(this)" value = "company">신청하기</button>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재 <b>채용 중인 업체</b>와 일맺기 
          <div id="ad" class = "cad"></div>
          </div>
          	 
          	 
        <div id="rank">
          <br>
          &nbsp;&nbsp;&nbsp;<b>BEST ILLPRO • ILLSAJANG</b>
          <div class = "eeRank"></div>
	
		  <div class = "erRank"></div>
        </div> 
        
    </section>
  </div>
  <div id="blkw"></div> 
  <p style="text-align: center;">
    <img src="${pageContext.request.contextPath}/imagefile/mini1.png"/>
  </p>
  <br>
  <div class="footer">
    (주)일맺다(대표: 김지영)  |  개인정보보호관리자: 김지영<br>     
    서울 중구 남대문로 120 대일빌딩 2층  |    대표번호: 02-1544-9970 광고문의: 02-1544-9970<br>    
    사업자등록: 138-87-00058  |  직업정보제공사업: J1200020160017 |  통신판매업: 2016-서울종로-00784<br>     
    Copyright Anchoreer Co., Inc. All rights reserved.<br><br> 

  </div>

</body>

<script>


		$(window).load(function(){
			sessionChk()
			updateAtc()
			updateAd()
			updateRankingList()
		});
	
	
	
	function sessionChk() {
		var id = "${sessionScope.myuserCode}";
		console.log('id체크:' + id);
		if (id == '' || null || undefined || 0 || NaN){
			$('#username').hide();
		  }else{
		  console.log("로그인 됨"); 
		  $('.menu2').hide();
		}
	};
	
	
	
	 $(document).ready(function(){	
		startAjax();
	});	 
	
	function updateAtc(){
		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/newPop",
	        dataType: "json",
	        error : function() {
	           /*  alert('통신실패!!'); */
	        },
	        success : function(data) {
	        	/* 이미지 띄워주는 법 알아오기  */
	        	var eb = '';	
        		eb += '<ul class="adul">'
	        			for(i = 0; i < data.ebList.length; i++){
	        				var e = data.ebList[i];
	        				eb += '<li class="adli"><b><a href = "myblog/'+ e.writerCode + '">' + e.writerCode + '</a></b><br/>'; 
	        				eb += '<a href = "content/' + e.ebcode + '">' +  e.title + '<br/></a>';
	        				eb += '<small><b>' + e.address +'</b> | 급여 : '+ e.salary +'</small></li>';	        					
	        			}
        		eb += '</ul>'
	        		
	        	var wb = '';	
        		wb += '<ul class="adul">'
	        			for(i = 0; i < data.wbList.length; i++){
	        				var w = data.wbList[i];
	        				wb += '<li class="adli"><b><a href = "myblog/'+ w.writerCode + '">' + w.writerCode + '</a></b><br/>'; 
	        				wb += '<a href = "content/' + w.wbcode + '">' +  w.title + '<br/></a>';
	        				wb += '<small><b>' + w.address +'</b> | 급여 : '+ w.salary +'</small></li>';	             					
	        			}	
        		wb += '</ul>'	
	        	
        		$('#adfirst').html(eb);
	        	$('#adsecond').html(wb);
	        }      
	       
		})
	};
	
	
	//실시간 광고
	
	function updateAd(){
			$.ajax({
		        type : "POST",
		        url : "${pageContext.request.contextPath}/newAd",
		        dataType: "json",
		        error : function() {
		            /* alert('통신실패!!'); */
		        },
		        success : function(data) {
		        	/* 이미지 띄워주는 법 알아오기  */
		        	var cAd = '';	
	        		cAd += '<ul id = "c">'
	        		var j = 0;
	        			for(i = 0; i < data.cAdList.length; i++){
	        				
	        				var c = data.cAdList[i];
	        				cAd += '<button class = "cBt" value= "' + c.link + '" onclick= "company(this)">';
	        				cAd +=  '<li><b><img class="logo" src="companyLogo/' + c.image + '"/>';
	        				cAd += '</b><br/>' + c.enterprise + '</li></button>';	        					
	        			}
	        		cAd += '</ul>'
	        			
		        	var erAd = '';	
	        		erAd += '<ul class="adul">'
		        			for(i = 0; i < data.erAdList.length; i++){
		        				var er = data.erAdList[i];
		        				erAd += '<li class="adli"><b><a href = "myblog/'+ er.userCode + '">' + er.userCode + '</a></b><br/>'; 
		        				erAd += '<a href = "content/' + er.link + '">' +  er.title + '<br/></a>';
		        				erAd += '<small>' + er.address +' | 급여 : '+ er.salary +'</small></li>';	        					
		        			}
	        		erAd += '</ul>'
		        		
		        	var eeAd = '';	
	        		eeAd += '<ul class="adul">'
		        			for(i = 0; i < data.eeAdList.length; i++){
		        				var ee = data.eeAdList[i];
		        				eeAd += '<li  class="adli"><b><a href = "myblog/'+ ee.userCode + '">' + ee.userCode + '</a></b><br/>'; 
		        				eeAd += '<a href = "content/' + ee.link + '">' +  ee.title + '<br/></a>';
		        				eeAd += '<small>' + ee.address +' | 급여 : '+ ee.salary +'</small></li>';	             					
		        			}	
	        		eeAd += '</ul>'	
		        	
	        		$('.cad').html(cAd);
		        	$('#adthird').html(erAd);
		        	$('#fourth').html(eeAd);
		        }      
		       
			});
		}
	
	/*  랭킹*/
			function updateRankingList(){
			$.ajax({
		        type : "POST",
		        url : "${pageContext.request.contextPath}/newRanking",
		        dataType: "json",
		        error : function() {
		            alert('통신실패!!');
		        },
		        success : function(data) {
		        
		        	var newEeList = '';	
		        		newEeList += '<table><th>순위</th><th>닉네임</th><th>평균별점</th><th>리뷰수</th>'
		        			for(i = 0; i < data.newEe.length; i++){
		        				var newEe = data.newEe[i];
		        					newEeList += '<tr><td>' + newEe.rankNum + '</td><td>' + newEe.usercode + '</td><td><small>';
		        					newEeList += newEe.avg +'</small><span class="star-rating"><span style ="width:' + newEe.avg * 25 + '%"></span></span></td>';
		        					newEeList += '<td>' + newEe.count + '</td></tr>';
		        					
		        			}
		        		newEeList += '</table>'
		        		
		        	var newErList = '';	
		        		newErList += '<table><th>순위</th><th>닉네임</th><th>평균별점</th><th>리뷰수</th>'
		        			for(i = 0; i < data.newEr.length; i++){
		        				var newEr = data.newEr[i];
		        					newErList += '<tr><td>' + newEr.rankNum + '</td><td>' + newEr.usercode + '</td><td><small>';
		        					newErList += newEr.avg +'</small><span class="star-rating"><span style ="width:' + newEr.avg * 25 + '%"></span></span></td>';
		        					newErList += '<td>' + newEr.count + '</td></tr>';
		        					
		        			}	
		        		newErList += '</table>'	
		        		$('.eeRank').html(newEeList);
		        		$('.erRank').html(newErList);
		        }      
		       
			});
		}
		
		function startAjax(){
			setInterval(function(){updateRankingList()}, 3600000);
		}
	
	
	
	
	
	function startAjax(){
		setInterval(function(){
			updateAtc()
			updateAd()
			}, 5000);
	};
	
	
	
	function adApp(e){
		var category = e.value;
		
		var url = "${pageContext.request.contextPath}/adApp?category=" + category;
        var name = "adApp";
        var option = "width = 500, height = 700, top = 100, left = 200, location = no"
        window.open(url, name, option);
	};
	
	function company(e){
		var url = e.value;
        var name = "company";
        var option = "width = 800, height = 700, top = 100, left = 200, location = no"
        window.open(url, name, option);
	};
	
	
	
	
	
</script>




</html>
