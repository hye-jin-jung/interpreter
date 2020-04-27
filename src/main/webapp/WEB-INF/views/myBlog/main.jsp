<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../navigator1.jsp" flush="true" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>
    일맺다 - MY BLOG
</title>
<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/assets2/css/material-dashboard.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet">

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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/myBlog/main/${blogMaster}" role="tab">My Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/myBlog/bbomGeMain/${blogMaster}" role="tab">BBomGe</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/myBlogEr/${blogMaster}" role="tab">IllNaNum</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/myBlogEe/${blogMaster}" role="tab">IllPro</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content-detail">
            <div style="float: left; display: flex;">
                <h2>${blogMaster}</h2>
                <div style="margin-top: 16px;">
                    <h4>님의 Blog</h4>
                </div>
            </div>

            <div style="float: right; display: flex; margin-top: 20px; margin-right: 300px">
                <div class="userinfo" style="width:150px; height:100px;">
                    <i class="material-icons" style="font-size: 30px; color:red;">favorite</i>
                    <span class="userinfo-detail">${userLoveInfo}</span>
                    <h6>받은 찜 개수</h6>
                </div>
                <div class="userinfo" style="width:150px; height:100px;">
                    <i class="material-icons" style="font-size: 30px; color:#58ACFA;">check_circle</i>
                    <span class="userinfo-detail">${userInfo.cfCount}</span>
                    <h6>알바생 인증 수</h6>
                </div>
                <div class="userinfo" style="width:150px; height:100px;">
                    <i class="material-icons" style="font-size: 30px; color:gold;">report_problem</i>
                    <span class="userinfo-detail">${userInfo.warningCount}</span>
                    <h6>신고 받은 횟수</h6>
                </div>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br>

            <div class="divide-line">
                <i class="material-icons">arrow_forward_ios</i>
                <span style="margin-top: 3px;">${blogMaster}님의 활동</span>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats" onclick="location.href='${pageContext.request.contextPath}/lover/loverList/${blogMaster}';">
                            <div class="card-header card-header-warning card-header-icon">
                                <div class="card-icon">
                                    <a href="${pageContext.request.contextPath}/lover/loverList/${blogMaster}" style="color:white;"><i class="material-icons">loyalty</i></a>
                                </div>
                                <p class="card-category">${blogMaster}님이 찜한 사람</p>
                                <h3 class="card-title">${myCount.loveCount}
                                    <small>명</small>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">People I like</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats" onclick="location.href='${pageContext.request.contextPath}/bookMark/bmkList/${blogMaster}';">
                            <div class="card-header card-header-success card-header-icon">
                                <div class="card-icon">
                                    <a href="${pageContext.request.contextPath}/bookMark/bmkList/${blogMaster}" style="color:white"><i class="material-icons">star</i></a>
                                </div>
                                <p class="card-category">즐겨찾기 게시글</p>
                                <h3 class="card-title">${myCount.MarkCount}
                                    <small>개</small>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">My Favorite Posts</div>
                            </div>
                        </div></a>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="card card-stats" onclick="location.href='${pageContext.request.contextPath}/myBlog/myContent/${blogMaster}';">
                            <div class="card-header card-header-danger card-header-icon">
                                <div class="card-icon">
                                    <a href="${pageContext.request.contextPath}/myBlog/myContent/${blogMaster}" style="color:white"><i class="material-icons">library_books</i></a>
                                </div>
                                <p class="card-category">${blogMaster}님이 쓴 게시글</p>
                                <h3 class="card-title">${myCount.GesiCount}
                                    <small>개</small>
                                </h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">My Posts</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <br><br><br><br><br>


            <div class="divide-line">
                <i class="material-icons">arrow_forward_ios</i>
                <span style="margin-top: 3px;">최근 뽐게 활동</span>
            </div>

            <!-- 이미지 슬라이드 -->
            <div class="section pt-o" id="carousel"
                style="background-color: #EAEAEA; margin-right: 340px; padding-top: 0px;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 ml-auto mr-auto">
                            <div class="card page-carousel">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"
                                            style="background-color: #E7E7E7;">
                                        </li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"
                                            style="background-color: #E7E7E7;"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"
                                            style="background-color: #E7E7E7;"></li>
                                    </ol>
                                    <div class="carousel-inner" role="listbox">


                                        <c:choose>

                                            <c:when test="${fn:length(imgPath) == 1}">

                                                <div class="carousel-item active"
                                                    style="width: 400px; height: 400px; text-align: center; width: 100%; height: auto;">
                                                    <img class="d-block img-fluid" src="${imgPath[0]}" alt="First slide">
                                                </div>

                                            </c:when>



                                            <c:when test="${fn:length(imgPath) == 2}">

                                                <div class="carousel-item active"
                                                    style="width: 400px; height: 400px; text-align: center; width: 100%; height: auto;">
                                                    <img class="d-block img-fluid" src="${imgPath[1]}" alt="First slide">
                                                </div>
                                                <div class="carousel-item"
                                                    style="width: 400px; height: 400px; text-align: center; width: 100%; height: auto;">
                                                    <img class="d-block img-fluid" src="${imgPath[0]}" alt="Second slide">
                                                </div>

                                            </c:when>



                                            <c:when test="${fn:length(imgPath) >= 3}">

                                                <div class="carousel-item active"
                                                    style="width: 400px; height: 400px; text-align: center; width: 100%; height: auto;">
                                                    <img class="d-block img-fluid" src="${imgPath[2]}" alt="First slide">
                                                </div>
                                                <div class="carousel-item"
                                                    style="width: 400px; height: 400px; text-align: center; width: 100%; height: auto; min-height:initial;">
                                                    <img class="d-block img-fluid" src="${imgPath[1]}" alt="Second slide">
                                                </div>
                                                <div class="carousel-item"
                                                    style="width: 400px; height: 400px; text-align: center; width: 100%; height: auto; min-height:initial;">
                                                    <img class="d-block img-fluid" src="${imgPath[0]}" alt="Third slide">
                                                </div>

                                            </c:when>



                                            <c:otherwise>
                                            	<div class="carousel-item active" style="width: 400px; text-align: center;">
                                                    <p style="text-align: center;"><img class="d-block img-fluid" src="${pageContext.request.contextPath}/imagefile/BBomGeNoImg.png" alt="First slide"></p>
                                                </div>
                                            </c:otherwise>

                                        </c:choose>

                                    </div>
                                    <a class="left carousel-control carousel-control-prev"
                                        href="#carouselExampleIndicators" role="button" data-slide="prev"
                                        style="background-color: #1ABC9C;">
                                        <span class="fa fa-angle-left"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control carousel-control-next"
                                        href="#carouselExampleIndicators" role="button" data-slide="next"
                                        style="background-color: #1ABC9C;">
                                        <span class="fa fa-angle-right"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 이미지 슬라이드 끝 -->
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