<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>마이페이지</title>

<!-- 사이드바 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<%-- <!-- 부트스트랩 -->
 <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" /> --%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

<jsp:include page="../navigator2.jsp" flush="true"/>
<jsp:include page="mypageMain.jsp" flush="true"/>

<style>
    body {
        background-color: #EAEAEA !important;
    }
    
    .footer{
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
	<div class="card text-center">
	  <div class="card-header card-header-rose">
	    <ul class="nav nav-tabs">
	      <li class="nav-item">
	        <a class="nav-link disabled" href="#">포인트</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/myQnaList">나의 1:1문의</a>
	      </li>
	    </ul>
	  </div>
	  <div class="card-body">
	    
	    
	 <div class="container"> 
		<div class="row">
		<table class="table" border="1" style="border:none;">
		<thead>
		<tr>
			<th style="background-color:#eeeeee; text-align:center;">카테고리</th>
			<th style="background-color:#eeeeee; text-align:center;">제목</th>
			<th style="background-color:#eeeeee; text-align:center;">조회수</th>
		</tr>
		</thead>
		<tbody> 
		<c:forEach items="${user}" var="user">
			<tr>
				<td><input type="checkbox"></td>
				<td>${user.email}</td>
				<td>${user.usercode}</td>
				<td>${user.warningCount}</td>
				<td>${user.regiDate}</td>
			</tr>
		</c:forEach>
		</tbody> 
	</table>
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="${pageContext.request.contextPath}/admin/user?page=${pageMaker.startPage - 1}">이전</a></li>
			</c:if>
	
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a
					href="${pageContext.request.contextPath}/admin/user?page=${idx}">${idx}</a></li>
			</c:forEach>
	
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="${pageContext.request.contextPath}/admin/user?page=${pageMaker.endPage + 1}">다음</a></li>
			</c:if>
		</ul>
			</div>
		</div>
	</div>
    
    
  </div>
</div>


<footer>
	<jsp:include page="../footer.jsp" flush="true"/>
	
</footer>

</body>
</html>