<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>일맺다</title>

	<meta charset="utf-8">
	<link rel="apple-touch-icon" sizes="76x76" href="./assets/img//apple-icon.png">
	<link rel="icon" type="image/png" href="./assets/img//favicon1.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no"
		name="viewport">
	<!--     Fonts and icons     -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
	<!-- CSS Files -->
	<link href="./assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="./assets/css/paper-kit.css?v=2.2.0" rel="stylesheet">
	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="./assets/demo/demo.css" rel="stylesheet">
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>

<style>
	#topAndBot {

		position: fixed;
		width: 175px;
		display: inline-block;
		right: 0px;
		/* 창에서 오른쪽 길이 */
		top: 94%;
		/* 창에서 위에서 부터의 높이 */
		background-color: transparent;
		margin: 0;
		z-index: 999;

	}

	#main {
		margin: 0 auto;
		background-color: #fff;
		/* position: fixed; */
	}


	#mainimageblk {
		width: 100%;
		height: 106px;
		border-bottom: 1px solid #E7E7E7;
	}




	#mainimage {
		width: 1320px;
		height: 410px;
		margin-top: 0;
		background-image: url(${pageContext.request.contextPath}/imagefile/mainimage.png);
		background-repeat: no-repeat;
		background-position: center;
		/* border:1px solid #E7E7E7; */
		margin: 0 auto;
		position: relative;
	}



	#username ul {
		margin-top: 4px;
		list-style: none;
		height: 0px;
	}

	#username ul li {
		display: block;
		float: left;
		text-align: center;
		font-size: 14px;
	}

	#username a,
	#username a:visited {

		padding: 0px 30px 0px 0px;
		display: block;
		color: black;
		/* 글자색 */
		text-decoration: none;
		/* 밑줄 없음 */
	}




	div .homelogo {

		position: absolute;
		margin: -2px 0px 0px -100px;
	}

	#navi .menu2 {
		float: right;
		margin: -105px 250px 0px 0px;
		position: relative;
	}

	#admain {
		width: 1320px;
		height: 600px;
		background-color: #E7E7E7;
		margin: 0 auto;

	}

	#addiv {
		padding: 0px 13px;
	}


	.adatc {
		width: 280px;
		height: 415px;
		background-color: #fff;
		border: 6px solid #e0e0e0;
		float: left;
		margin-left: 2%;
	}


	#companyAd {
		width: 1320px;
		height: 420px;
		background-color: #3F4C5F;
		color: white;
		font-size: 20px;
		margin: 0 auto;
		position: relative;

	}

	#ad {
		position: absolute;
		background-color: white;
		width: 1000px;
		height: 200px;
		margin: -300px 150px 0px 450px;
	}


	#rank {
		width: 1320px;
		height: 600px;
		background-color: #E7E7E7;
		margin: 0 auto;
	}


	#adname1 {
		margin: 0px 195px 0px 50px;
	}

	#adname2 {
		margin: 0px 195px 0px 0px;
	}

	#adname3 {
		margin: 0px 30px 0px 10px;
	}

	#adname4 {
		margin: 0px 35px 0px 40px;
	}


	.blk {
		margin: 0px 5px 0px 50px;
	}

	#blkw {
		height: 250px;

	}


	.footer {
		left: 0;
		bottom: 0;
		width: 100%;
		padding: 15px 0;
		text-align: center;
	}




	#username {
		z-index: 99999;
		margin: 35px 0px 0px 1450px;
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
		margin: -55px 0px 0px 40px;
		width: 300px;
		left: 1200px;
		font-size: 15px;
	}

	#logimage {
		position: absolute;
		margin: -55px 0px 0px -130px;

	}

	#aa {
		margin: -10px 0px 0px -100px;
	}

	#green {
		color: #1ABC9C;
	}

	.img-button {
		/* background: url( "${pageContext.request.contextPath}/imagefile/baro.png" ) no-repeat; */
		border: none;
		/*   width: 248px;
      height: 67px;  */
		position: absolute;
		margin: -110px 0px 0px 480px;

	}

	.adli {
		margin-bottom: 13px;
	}

	.adul {
		margin-top: 15px;
		margin-left: 20px;
		list-style: none;

	}


	.adul a,
	.adul a:visited {
		display: inline;
		color: black;
		text-decoration: none;
		/* 밑줄 없음 */
	}


	.navbar-translate {
		margin-left: 35px;
	}


	.uldiv {

		position: relative;

	}



	.item-number {
		position: absolute;
		width: 40px;
		font-size: 15px;
		color: #bbb;
		font-weight: 700;
		margin: 10px 0px 0px -31px;
	}




	.lia:hover {
		font-weight: bold;
	}

	#ranktitle {
		color: #3F4C5F;
		font-size: 35px;
	}

	/* 여울 css 끝  */

	/*지영 css시작  */
	.eeRank {
		width: 400px;
	}

	.erRank {
		width: 400px;
		margin-left: 4px;
	}

	.allrank {
		display: flex;
		margin: 15px 250px;
	}

	.rankt {
		width: 100%;
		border-top: 1px solid #bfbfbf;
	}

	tr {
		border-bottom: 1px solid #bfbfbf;
		height: 28px;

	}

	thead tr {
		background-color: #9ec5be66;
		color: #ffffff;
		text-align: center;
	}

	tbody tr:nth-child(2n) {
		background-color: #fbfbfb78;
	}

	tbody tr:nth-child(2n+1) {
		background-color: #e0e0e066;
	}

	.star-rating {
		width: 160px;
	}

	.star-rating,
	.star-rating span {
		display: inline-block;
		height: 15.6px;
		overflow: hidden;
		background: url(imagefile/review/star3.png)no-repeat;
		background-size: 80px;
	}

	.star-rating span {
		background-position: left bottom;
		line-height: 0;
		vertical-align: top;
	}

	.logo {
		width: 130px;
		height: auto;
	}

	.cBt {
		background-color: white;
		border: 0;
		padding: 0;
	}

	#c {
		margin: 0;
		padding: 0;
		list-style: none;
		display: inline;
	}

	.cad {
		align: left;
		width: 700px;

	}

	#banner_container {
		width: 910px;
		height: 170px;
		overflow: hidden;
		position: relative;
		left: 38px;
		margin: 5px;
	}

	#banner_wrapper {
		width: 1850px;
		position: absolute;
	}

	#cadImg {
		width: 100px;
		float: left;
		border: 1px solid #e9eeef;
		margin: 20px 5px 10px 5px
	}

	.cadButt {
		width: 30px;
		heght: 60px;
		background-color: transparent;
	}

	#btn_left {
		background-color: transparent;
		border: none;
		position: relative;
		top: -100px;
		left: -50px;
	}

	#btn_right {
		background-color: transparent;
		border: none;
		position: relative;
		top: -100px;
		left: 960px;
	}

	#cadGo {
		margin-left: 790px;
	}

	.btn-info {
		background-color: #8e9192;
		border-color: #8e9192;
		height: 30px;
		width: 70px;
		padding: 0;
	}

	.btn-info:hover {
		background-color: #1ABC9C;
		border-color: #1ABC9C;
	}

	/*지영 css끝  */
</style>


<body class="index-page sidebar-collapse">
	
	<div id="fix">
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg fixed-top navbar-transparent" color-on-scroll="300">


		<div class="container" style="position:relative; z-index: 9999;">
			<div class="homelogo">
				<a href="<c:url value="/index" />"><img src="${pageContext.request.contextPath}/imagefile/12.gif"
					name="select"></a>
			</div>
			<div class="navbar-translate">
				<a class="navbar-brand" href="<c:url value="/workerBoard/list" />" rel="tooltip" title="구직게시판"
				data-placement="bottom">일프로게시판</a>


				<a class="navbar-brand" href="<c:url value="/employerBoard/list" />" rel="tooltip" title="구인게시판"
				data-placement="bottom">일나눔게시판</a>

				<a class="navbar-brand" href="<c:url value="/freeList" />" rel="tooltip" title="자유게시판"
				data-placement="bottom" >자유게시판</a>

				<a class="navbar-brand" href="<c:url value="/map" />" rel="tooltip" title="1map"
				data-placement="bottom">지도검색
				</a>

				<a class="navbar-brand" href="<c:url value="/noticeList" />" rel="tooltip" title="고객센터"
				data-placement="bottom">고객센터
				</a>

				<a class="navbar-brand" onclick="delchk();" rel="tooltip" title="마이블로그" data-placement="bottom">마이블로그
				</a>
				<button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navigation" aria-controls="navigation-index" aria-expanded="false"
					aria-label="Toggle navigation">
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
	</div>


	<!-- -------------------------------------------- -->
	<div id="topAndBot">
		<a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
		<a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
	</div>

	<div id="main">


		<section>
			<div id="mainimageblk"></div>
			<!--최우식 이미지-->
			<div id="mainimage"></div>
			<!-- 이미지 버튼 -->
			<img src="${pageContext.request.contextPath}/imagefile/baro.png" alt="지도검색" class="img-button"
				onclick="location.href='<c:url value = "/map" />';">

			<div id="admain">
				<!--공고 광고-->
				<br> <br> <br> <span id="adname1">일프로 인기공고</span>
				<span id="adname2">일나눔 인기공고</span>
				<span id="adname3">일프로 광고공고</span>
				<span class="blk"></span>
				<button class="btn btn-info" onclick="adApp(this)" value="employee">신청하기</button>
				<!-- <button class="adApp" onclick="adApp(this)" value="employer">신청하기</button> -->
				<span id="adname4">일나눔 광고공고</span> <span class="blk"></span>
				<button class="btn btn-info" onclick="adApp(this)" value="employer">신청하기</button>
				<!-- <button class="adApp" onclick="adApp(this)" value="employee">신청하기</button> -->
				<br> <br>
				<div id="addiv">
					<div id="adfirst" class="adatc"></div> <!-- 일프로 -->
					<div id="adsecond" class="adatc"></div> <!-- 일나눔 -->
					<div id="adthird" class="adatc"></div> <!-- 광고일프로 -->
					<div id="fourth" class="adatc"></div> <!-- 광고일나눔 -->
				</div>
			</div>

			<div id="companyAd"><br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현재 <b>채용 중인 업체</b>와 일맺기
				<button id="cadGo" class="btn btn-info" onclick="adApp(this)" value="company">신청하기</button>
			</div>
			<div id="ad" class="cad">
				<div id="banner_container">
					<div id="banner_wrapper">
					</div>
				</div>

				<!--   //좌우버튼을 생성하여 배너 이동시키기 -->
				<div id="banner_navi">
					<button id="btn_left"><img class="cadButt"
							src="${pageContext.request.contextPath}/imagefile/buttonR.png"
							style="filter:fliph()" /></button>
					<button id="btn_right"><img class="cadButt"
							src="${pageContext.request.contextPath}/imagefile/buttonLeft.png" /></button>
				</div>
			</div>
			<div id="rank">
				<br>
				&nbsp;&nbsp;&nbsp;<span id="ranktitle"><b>BEST ILLPRO • ILLNANUM</b></span>
				<div class="allrank">
					<div class="eeRank"></div>
					<div class="erRank"></div>
				</div>
			</div>
		</section>
	</div>
	<div id="blkw"></div>
	<p style="text-align: center;">
		<img src="${pageContext.request.contextPath}/imagefile/mini1.png" />
	</p>
	<br>
	<div class="footer">
		(주)일맺다(대표: 김지영) | 개인정보보호관리자: 김지영<br>
		서울 중구 남대문로 120 대일빌딩 2층 | 대표번호: 02-1544-9970 광고문의: 02-1544-9970<br>
		사업자등록: 138-87-00058 | 직업정보제공사업: J1200020160017 | 통신판매업: 2016-서울종로-00784<br>
		Copyright Anchoreer Co., Inc. All rights reserved.<br><br>

	</div>




	<!--   Core JS Files   -->
	<script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="./assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="./assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
	<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
	<script src="./assets/js/plugins/moment.min.js"></script>
	<script src="./assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
	<!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
	<script src="./assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>


	<script>
		$(document).ready(function () {

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



		$(document).ready(function () {
			sessionChk()
			updateAtc()
			updateAd()
			updateRankingList()
		});


		//로그인 확인
		function sessionChk() {
			var id = "${sessionScope.myuserCode}";
			console.log('id체크:' + id);
			if (id == '' || null || undefined || 0 || NaN) {
				console.log("로그인 안됨");
			} else {
				console.log("로그인 됨");
				
				/*  지영 :채팅알림을 위한 기능 시작*/
				bye();
				wsocket = new WebSocket("ws://192.168.30.72:8080<c:url value='/echo'/>");
				wsocket.onmessage = onMessage;
				wsocket.onclose = onClose;
				wsocket.onopen = onOpen;
				/*채팅알림 위한 기능 끝  */
			}
		};
		
		/*채팅창 들어갔을 때 채팅알림 갯수 안보이게 하기 */
		function deleteChatSpan(){
			/* $("#green").html(''); */
		}

		//마이블로그 못가게
		function delchk() {

			var id = "${sessionScope.myuserCode}";
			if (id == '' || null || undefined || 0 || NaN) {
				alert("로그인 후 이용할 수 있습니다");
				window.location.href = '${pageContext.request.contextPath}/login/login';
			} else {
				window.location.href = '${pageContext.request.contextPath}/myBlog/main/${myuserCode}';
			}

		}

		/*  지영 :채팅알림을 위한 기능*/
		function bye() {
		<%
		if (session.getAttribute("fromCode") != null) {
				session.removeAttribute("fromCode");
			};
		%>
		};

		function onOpen(e) {
			console.log(e);
		};

		function onMessage(i) {
			var f = i.data;
			$("#green").html(f);
		};

		function onClose(e) {
			
		};
		
		function startChatAjax() {
			setInterval(function () { updateChatCount() }, 3000);
		}
		function updateChatCount() {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/chatCount",
				error: function () {
				},
				success: function (data) {
					 $("#green").html(data); 
				}
			});
		}
		/*채팅알림 위한 기능 끝  */
		
		/* 인기게시글, 광고, 랭킹 시작 */
		$(document).ready(function () {
			startAjax();//인기 게시글 불러오는 ajax, setInterval  
			startRankAjax();// 랭킹 불러오는 ajax, setInterval 
			startAdAjax();//광고 불러오는 ajax, setInterval  
			setInterval(aniAd, 3000);//광고 배너 자동으로 넘어가는 ajax, setInterval  
			
			$('#myCarousel').carousel({
				interval: 10000
			});
		});

		function startRankAjax() {
			setInterval(function () { updateRankingList() }, 1800000);
		}

		function startAdAjax() {
			setInterval(function () { updateAd() }, 60000);
		}

		function startAjax() {
			setInterval(function () {
				updateAtc()
			}, 600000);
		};

		// 인기글
		function updateAtc() {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/newPop",
				dataType: "json",
				error: function () {
					/*  alert('통신실패!!'); */
				},
				success: function (data) {
					var eb = '';
					eb += '<div class="uldiv"><ul class="adul">'
					for (i = 0; i < data.ebList.length; i++) {
						var e = data.ebList[i];
						var address = e.address.split(" ");
						
						var title = e.title;
						if(e.title.length >17){
							title = e.title.substring(0, 15) + '...';
			        	}
						
						eb += '<div class="item-number">' + (i + 1) + '</div>';
						eb += '<li class="adli"><b><a href = "myBlog/main/' + e.writerCode + '">' + e.writerCode + '</a></b><br/>';
						eb += '<a class="lia" href = "workerBoard/read/' + e.ebcode + '">' + title + '<br/></a>';
						eb += '<small><b>' + address[1] + '</b> | 급여 : ' + e.salary + '</small></li>';
					}
					eb += '</ul></div>'

					var wb = '';
					wb += '<div class="uldiv"><ul class="adul">'
					for (i = 0; i < data.wbList.length; i++) {
						var w = data.wbList[i];
						var address = w.address.split(" ");
						
						var title = w.title;
						if(w.title.length >17){
							title = w.title.substring(0, 15) + '...';
			        	}

						wb += '<div class="item-number">' + (i + 1) + '</div>';
						wb += '<li class="adli"><b><a href = "myBlog/main/' + w.writerCode + '">' + w.writerCode + '</a></b><br/>';
						wb += '<a class="lia" href = "employerBoard/read/' + w.wbcode + '">' + title + '<br/></a>';
						wb += '<small><b>' + address[1] + '</b> | 급여 : ' + w.salary + '</small></li>';
					}
					wb += '</ul></div>'

					$('#adfirst').html(eb);
					$('#adsecond').html(wb);
				}

			})
		};

		//실시간 광고
		function updateAd() {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/newAd",
				dataType: "json",
				error: function () {
					/* alert('통신실패!!'); */
				},
				success: function (data) {
					console.log('제이슨도착' + data);
					/* 이미지 띄워주는 법 알아오기  */
					var cAd = '';

					var j = 0;
					for (i = 0; i < data.cAdList.length; i++) {
						var c = data.cAdList[i];
						cAd += ' <button class = "cBt" value= "' + c.link + '" onclick= "company(this)"><img id = "cadImg" src="companyLogo/' + c.image + '" class="page" style = "width:170px; height:150px;"/></button>';

					}

					var erAd = '';
					erAd += '<div class="uldiv"><ul class="adul">'
					for (i = 0; i < data.erAdList.length; i++) {
						var er = data.erAdList[i];
						var address = er.address.split(" ");
						var title = er.title;
						if(er.title.length >17){
							title = er.title.substring(0, 15) + '...';
			        	}
						erAd += '<div class="item-number">' + (i + 1) + '</div>';
						erAd += '<li class="adli"><b><a href = "myBlog/main/' + er.userCode + '">' + er.userCode + '</a></b><br/>';
						erAd += '<a class="lia" href = "employerBoard/read/' + er.link + '">' + title + '<br/></a>';
						erAd += '<small>' + address[1] + ' | 급여 : ' + er.salary + '</small></li>';
					}
					erAd += '</ul></div>'

					var eeAd = '';
					eeAd += '<div class="uldiv"><ul class="adul">'
					for (i = 0; i < data.eeAdList.length; i++) {
						var ee = data.eeAdList[i];
						var address = ee.address.split(" ");
						var title = ee.title;
						if(ee.title.length >17){
							title = ee.title.substring(0, 15) + '...';
			        	}
						eeAd += '<div class="item-number">' + (i + 1) + '</div>';
						eeAd += '<li  class="adli"><b><a href = "myBlog/main/' + ee.userCode + '">' + ee.userCode + '</a></b><br/>';
						eeAd += '<a class="lia" href = "workerBoard/read/' + ee.link + '">' + title + '<br/></a>';
						eeAd += '<small>' + address[1] + ' | 급여 : ' + ee.salary + '</small></li>';
					}
					eeAd += '</ul></div>'

					$('#banner_wrapper').html(cAd);
					$('#adthird').html(eeAd);
					$('#fourth').html(erAd);
				}

			});
		}

		//랭킹
		function updateRankingList() {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/newRanking",
				dataType: "json",
				error: function () {
					alert('통신실패!!');
				},
				success: function (data) {

					var newEeList = '';
					newEeList += '<table class = "rankt"><thead><tr><th>순위</th><th>닉네임</th><th style = "width:190px; text-align:left;">평균별점</th><th>리뷰수</th></tr></thead><tbody>';
					for (i = 0; i < data.newEe.length; i++) {
						var newEe = data.newEe[i];
						newEeList += '<tr><td><center>' + newEe.rankNum + '</center></td><td><a href = "myBlog/main/' + newEe.usercode + '">' + newEe.usercode + '</a></td><td><div style = "width:22px;float:left;"><small>';
						newEeList += newEe.avg + '</small></div><div style = "float:left;"><span class="star-rating"><span style ="width:' + newEe.avg * 10 + '%"></span></span></div></td>';
						newEeList += '<td><center>' + newEe.count + '</td></center></tr>';

					}
					newEeList += '</tbody></table>'

					var newErList = '';
					newErList += '<table class = "rankt"><thead><tr><th>순위</th><th>닉네임</th><th style = "width:190px;text-align:left;">평균별점</th><center><th>리뷰수</th></tr></thead><tbody>';
					for (i = 0; i < data.newEr.length; i++) {
						var newEr = data.newEr[i];
						newErList += '<tr><td><center>' + newEr.rankNum + '</center></td><td><a href = "myBlog/main/' + newEr.usercode + '">' + newEr.usercode + '</a></td><td><div style = "width:22px;float:left;"><small>';
						newErList += newEr.avg + '</small></div><div style = "float:left;"><span class="star-rating"><span style ="width:' + newEr.avg * 10 + '%"></span></span></div></td>';
						newErList += '<td><center>' + newEr.count + '</center></td></tr>';

					}
					newErList += '</tbody></table>'
					$('.eeRank').html(newEeList);
					$('.erRank').html(newErList);
				}

			});
		}
		/* 인기게시글, 광고, 랭킹 끝*/
		
		/* 광고 신청서 팝업 띄우는 메서드 시작*/
		function adApp(e) {
			var category = e.value;

			var url = "${pageContext.request.contextPath}/adApp?category=" + category;
			var name = "adApp";
			var option = "width = 600, height = 700, top = 100, left = 200, location = no"
			window.open(url, name, option);
		};

		function company(e) {
			var url = e.value;
			var name = "company";
			var option = "width = 800, height = 700, top = 100, left = 200, location = no"
			window.open(url, name, option);
		};
		/* 광고 신청서 팝업 띄우는 메서드 끝*/
		
		//광고 움직이는 ani 시작
		var BANNER_INDEX = 1;
		var nIndex = BANNER_INDEX - 1;
		// 배너의 위치 : 배너가 움직이려면 LEFT값을 변경해야 하는데 LEFT 값을 계산하려면 배너의 위치가 필요하다.
		var BANNER_LEN = 4;
		//배너의 넓이 : 배너의 넓이는 언제든지 변할 수 있으니 배너의 넓이를 정의하는 변수를 정의한다.
		var BANNER_WIDTH = 183.5;
		//배너의 개수 : 사용자의 요청에 따라 배너의 개수가 변할 수 있으니 배너의 개수를 정의하는 변수가 필요하다.
		var SHOW_DURATION = 120;
		//슬라이드 속도를 조절할수있다. 200/1000초로 기본 셋을 설정한다.
		$(document).ready(function () {
			$("#btn_left").unbind();
			$("#btn_left").bind("click", function () {
				if(nIndex != 0){
					nIndex = nIndex - 1;				
					showBannerAt(nIndex);	
				}
			});
			$("#btn_right").unbind();
			$("#btn_right").bind("click", function () {
				// 이동할 이전 배너 인덱스 값 구하기.
				if(nIndex <= 4){
					nIndex = nIndex + 1;				
					showBannerAt(nIndex);
				}
			});
		});
		
		//자동으로 광고를 움직이게 하는 함수
		function aniAd(){
			
			nIndex = nIndex + 1;	
			if (nIndex == 6){
				nIndex = 1;
			}
			showBannerAt(nIndex);
		}

		function showBannerAt(nIndex) {
			var nPosition = -BANNER_WIDTH * nIndex;
			//슬라이드 시작
			$("#banner_wrapper").stop();
			$("#banner_wrapper").animate({
				left: nPosition
			}, SHOW_DURATION, function () {});
		}
		/* 광고 움직이는 ani 끝*/



	</script>
	<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
</body>

</html>