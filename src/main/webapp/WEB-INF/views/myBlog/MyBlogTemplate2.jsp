<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../navigator1.jsp" flush="true" />
<title>
    일맺다 - 뽐게
</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="../assets2/css/material-dashboard.css" rel="stylesheet" />
<link href="../assets/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/css/paper-kit.css?v=2.2.0" rel="stylesheet">

<style>
    body {
        background-color: #EAEAEA !important;
    }
</style>

<jsp:include page="../navigator2.jsp" flush="true" />
<div class="main-panel">

    <div class="content" style="margin-top: 30px;">
        <div class="nav-tabs-navigation" style="width: 1400px;">
            <div class="nav-tabs-wrapper" style="margin-top: 130px;">
                <ul id="tabs" class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" href="main" role="tab">My Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="bbomGeMain" role="tab">BBomGe</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/myBlogEr" role="tab">IllNaNum</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/myBlogEe" role="tab">IllPro</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content-detail">

            <!-- 이 부분에 콘텐츠 작성 -->

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