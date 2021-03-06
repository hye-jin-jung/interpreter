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

    .pagination>li>a,
    .pagination>li>span,
    .pagination>li:first-child>a,
    .pagination>li:first-child>span,
    .pagination>li:last-child>a,
    .pagination>li:last-child>span {
        background-color: transparent;
        border: 2px solid #1ABC9C;
        border-radius: 20px;
        color: #1ABC9C;
        height: 36px;
        margin: 0 2px;
        min-width: 36px;
        padding: 8px 12px;
        font-weight: 600;
    }

    .page-item:first-child .page-link,
    .page-item:last-child .page-link {
        border-bottom-left-radius: 20px;
        border-top-left-radius: 20px;
        border-bottom-right-radius: 20px;
        border-top-right-radius: 20px;
    }

    .pagination>li>a:hover {
        background-color: #1ABC9C !important;
        border-color: #1ABC9C !important;
        color: #FFFFFF;
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
        <div class="content-detail" style="width: 1100px;">

            <div style="float: left; display: flex;">
                <h2>${myuserCode}</h2>
                <div style="margin-top: 16px;">
                    <h4>님의 BBomGe</h4>
                </div>
            </div>

            <div style="float: right; display: flex; width: 350px; margin-top: 28px;">
                <div class="form-group col-md-4" style="width: 200px;">
                    <select id="inputState" class="form-control" name="searchType">
                        <option selected value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}" />>-----
                        </option>
                        <option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}" />>제목</option>
                        <option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}" />>내용</option>
                        <option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}" />>제목+내용</option>
                    </select>
                </div>

                <div class="input-group no-border" style="width: 200px; margin-top: 8px;">
                    <input type="text" value="${scri.keyword}" name="keyword" id="keywordInput"
                        style="background-color: transparent;" class="form-control" placeholder="Search...">
                    <button type="submit" class="btn btn-white btn-round btn-just-icon" id="searchBtn">
                        <i class="material-icons">search</i>
                        <div class="ripple-container"></div>
                    </button>
                </div>
            </div>
            <br><br><br><br><br><br>

            <div class="container-fluid" id="container-bbomGe">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" style="width: 1100px;">
                            <div class="card-header card-header-primary">
                                <div style="float:left;">
                                    <h4 class="card-title ">BBOM GE</h4>
                                    <p class="card-category"> Bbomnagi Gesipan</p>
                                </div>
                                <div style="float:right;"><button type="button" class="btn btn-info btn-round"
                                        onclick="location.href='${pageContext.request.contextPath}/myBlog/bbomGeWrite'"
                                        style="background-color: #0B614B; border-color: #0B614B;"><i
                                            class="fa fa-pencil"></i> WRITE</button></div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class=" text-primary">
                                            <th>제목</th>
                                            <th style="width: 200px;">조회수</th>
                                            <th style="width: 200px;">작성일</th>
                                        </thead>
                                        <tbody>
                                            <!-- 목록 시작 -->
                                            <c:forEach items="${list}" var="list">
                                                <tr>
                                                    <td><a
                                                            href="contentView?showCode=${list.showCode}">${list.title}</a>
                                                    </td>
                                                    <td>${list.hit}</td>
                                                    <td class="text-primary">${list.registDate}</td>
                                                </tr>
                                            </c:forEach>
                                            <!-- 목록 끝 -->
                                        </tbody>

                                        <tr>
                                            <td colspan="5">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <br>

                        <div style="width: 1100px;">
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="bbomGeMain${pageMaker.makeSearch(pageMaker.startPage - 1)}"
                                            aria-label="Previous">
                                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                    <li class="page-item">
                                        <a class="page-link" href="bbomGeMain${pageMaker.makeSearch(idx)}">${idx}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                    <li class="page-item">
                                        <a class="page-link"
                                            href="bbomGeMain${pageMaker.makeSearch(pageMaker.endPage + 1)}"
                                            aria-label="Next">
                                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
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