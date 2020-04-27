<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../navigator1.jsp" flush="true" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<title>마이블로그 사장님탭</title>

<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/assets2/css/material-dashboard.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet">

<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>
	body {
		background-color: #EAEAEA !important;
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
	

	.star-avg {
		width: 307.5px;
	}

	.star-avg,
	.star-avg span {
		display: inline-block;
		height: 29.25px;
		overflow: hidden;
		background: url("${pageContext.request.contextPath}/imagefile/review/star3.png")no-repeat;
		background-size: 150px;
	}

	.star-avg span {
		background-position: left bottom;
		line-height: 0;
		vertical-align: top;
	}

	.star-rating {
		width: 205px;
	}

	.star-rating,
	.star-rating span {
		display: inline-block;
		height: 19.5px;
		overflow: hidden;
		background: url("${pageContext.request.contextPath}/imagefile/review/star3.png")no-repeat;
		background-size: 100px;
	}

	.star-rating span {
		background-position: left bottom;
		line-height: 0;
		vertical-align: top;
	}
</style>

<jsp:include page="../navigator2.jsp" flush="true" />
<style>
	
      div .homelogo {
	    position: absolute;
	    margin: 6px 0px 0px -100px;
	  }
      
      
      .navbar-translate {
	    margin-left: 35px;
	    margin-top: -4px;
	  }
    
    
    .navbar .navbar-brand {
	    font-weight: 500;
	    margin: 5px 0px;
	    padding: 20px 15px;
	    font-size: 15px;
	    color: #66615B;
	    text-transform: uppercase;
	}
    
    #username {
	    z-index: 99999;
	    margin: 43px 0px 0px 1450px;
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



<div class="main-panel">

   <div id="topAndBot">
   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
   </div>

	<div class="content" style="margin-top: 30px;">
		<div class="nav-tabs-navigation" style="width: 1400px;">
			<div class="nav-tabs-wrapper" style="margin-top: 130px;">
				<ul id="tabs" class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/myBlog/main/${blogMaster}" role="tab">My Blog</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/myBlog/bbomGeMain/${blogMaster}"
							role="tab">BBomGe</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/myBlogEr/${blogMaster}" role="tab">IllNaNum</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="${pageContext.request.contextPath}/myBlogEe/${blogMaster}"
							role="tab">IllPro</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div><br></div>
		
		<div class="content-detail" style="display: flex; margin-left: 55px;">

				<div class="card card-nav-tabs" style="width: 400px; height: 500px;">
					<div class="card-header card-header-warning">
						<i class="material-icons">star_half</i> Five-Star Rating
					</div>
					<div class="card-body">
						<h4 class="card-title">일프로 ${blogMaster}님</h4>
						<p class="card-text">${blogMaster}님이 일프로로서 받은 별점의 평균입니다.</p>
						<small>평균별점</small><br><br>
						<span class="star-avg">
							<span style="width:${avgStar*10}%"></span>
						</span>
					</div>
				</div>

				<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>

				<div class="card card-nav-tabs" style="width: 400px; height: 500px;">
					<div class="card-header card-header-success">
						<i class="material-icons">description</i> Cover Letter
					</div>
					<div class="card-body">
						<h4 class="card-title">자기소개서</h4>
						<p class="card-text">일프로 ${blogMaster}님을 소개합니다.</p>
						<div class="intro">
							<c:if test="${eeIntro.openCheck == 'Y'}">
								<p>희망 근무지 : ${eeIntro.workspace}</p>
								<c:if test="${!empty career}">
									<table>
										<th>회사</th>
										<th>근무기간</th>
										<c:forEach var="cc" items="${career}" varStatus="Loop">
											<tr>
												<td>${cc.company}</td>
												<td>${cc.startDate}~${cc.endDate}</td>
											</tr>
										</c:forEach>
									</table>
								</c:if>
								<p>${eeIntro.contents}</p>
							</c:if>
							<c:if test="${eeIntro.openCheck != 'Y'}">
								<p>아직 등록된 소개서가 없습니다.</p>
							</c:if>
						</div>
					</div>
				</div>

				<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>

				<div class="card card-nav-tabs" style="width: 400px; height: 500px;">
					<div class="card-header card-header-danger">
						<i class="material-icons">record_voice_over</i> Review
					</div>
					<div class="card-body">
						<h4 class="card-title">일프로 ${blogMaster}님에 대한 평가</h4>
						<p class="card-text">${blogMaster}님과 일한 일나눔들이 남긴 평가입니다.</p>
						<div class="review">
							<c:if test="${empty review}">
								<p>등록된 리뷰가 없습니다.</p>
							</c:if>
							<c:forEach var="rv" items="${review}" varStatus="Loop">
								<p>${rv.reviewerCode}
									<span class="star-rating">
										<span style="width:${rv.star*9.5}%"></span>
									</span><br />
									<small>한줄평 :</small> ${rv.contents}</p>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
	</div>

	<div style="background-color: #EAEAEA; height: 100px;"></div>
	<p style="text-align: center; width: 1320px; margin-left: 70px;">
		<img src="${pageContext.request.contextPath}/imagefile/mini1.png" /><br><br>
		(주)일맺다(대표: 김지영) | 개인정보보호관리자: 김지영<br>
		서울 중구 남대문로 120 대일빌딩 2층 | 대표번호: 02-1544-9970 광고문의: 02-1544-9970<br>
		사업자등록: 138-87-00058 | 직업정보제공사업: J1200020160017 | 통신판매업: 2016-서울종로-00784<br>
		Copyright Anchoreer Co., Inc. All rights reserved.<br><br>
	</p><br>

</div>

<jsp:include page="../nav3Js.jsp" flush="true" />