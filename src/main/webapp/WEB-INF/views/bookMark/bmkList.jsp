<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<jsp:include page="../navigator1.jsp" flush="true" />
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>
        일맺다 - BookMark List
    </title>
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

.bookMark1{
	/* display: inline-block; */ 
	position: absolute;
	top : 370px;
	margin-left : 50px;
	float:left;
	width:450px;
}
.bookMark2{
 	display: inline-block;
	position: absolute;
	top : 370px;
	margin-left : -100px;
	width: 450px;
 }

.list a{
	color:#000000; 
}
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
	margin: 20px 10px;
}
table.type11 th {
    width: 400px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #ce4869;
}

table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
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
	
	
	
	</style>
	


    
    <div class="main-panel">

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
                            <a class="nav-link" href="${pageContext.request.contextPath}/myBlogEr/${blogMaster}"
                                role="tab">IllNaNum</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/myBlogEe/${blogMaster}" role="tab">IllPro</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="content-detail" style="text-align:center">
                <div style="float: left; display: flex;">
                    <h2>${blogMaster}</h2>
                    <div style="margin-top: 16px;">
                        <h4>님의 BookMark List</h4>
                    </div>
                </div>

                <br><br><br><br><br><br>
				
					<div class="bookMark1">
		                <div class="divide-line" >
		                    <i class="material-icons">arrow_forward_ios</i>
		                    <span style="margin-top: 3px;font-size:16px;">북마크한 일나눔 게시글</span>
		                </div>
		                	<div class="bmk1 list" >
								<table class="type11" >
									<thead>
										<tr>
											<th scope="cols">일나눔 게시글 북마크</th>
										</tr>
									</thead>
									<tbody >
										<!-- 사장 게시글 북마크 -->
										<c:forEach var="ebBmkList" items="${ebBmkList}" varStatus="loop">
											<c:if test="${!empty ebBmkList}">
												<tr>
													<td style="border-bottom: 1px solid #ce4869;">${ebBmkList.bmkCode}
														<a id="bookMarkGo" href="<c:url value="/employerBoard/read/${ebBmkList.bmkCode}"/>"> 게시글 바로 가기</a></td>
												</tr>
											</c:if>	
										</c:forEach>
											<c:if test="${empty ebBmkList}">
												<tr>
													<td>북마크한 일나눔 게시글이 없습니다.</td>
												</tr>	
											</c:if>	
									</tbody>
								</table>
							</div>
					</div>	

		                <br><br><br><br><br>
		
					<div class="bookMark2">
		                <div class="divide-line" >
		                    <i class="material-icons">arrow_forward_ios</i>
		                    <span style="margin-top: 3px;font-size:16px;">북마크한 일프로 게시글</span>
		                </div>
		                		<div class="bmk2 list">	
									<table class="type11">
										<thead>
											<tr>
												<th style="background: #1ABC9C;">일프로 게시글 북마크</th>
											</tr>
										</thead>
										<tbody>
											<!-- 알바 게시글 북마크 -->
											<c:forEach var="wbBmkList" items="${wbBmkList}" varStatus="loop">
												<c:if test="${!empty wbBmkList }">
													<tr>
														<td style="border-bottom: 1px solid #1ABC9C;">${wbBmkList.bmkCode}
															<a id="bookMarkGo" href="<c:url value="/workerBoard/read/${wbBmkList.bmkCode}"/>"> 게시글 바로 가기</a></td>
													</tr>
												</c:if>
											</c:forEach>
											<c:if test="${empty wbBmkList}">
													<tr>
														<td>북마크한 일프로 게시글이 없습니다.</td>
													</tr>	
												</c:if>	
										</tbody>
									</table>
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

