<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>

<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">

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
    .button{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color: transparent;
         border : 2px solid #1ABC9C;
         color : #1ABC9C;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 150px;
            height: 35px;
      }
      
.button:hover{         
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
      border-bottom-left-radius: 20px;
      border-bottom-right-radius: 20px;
      background-color:  #1ABC9C;
      border : 2px solid #1ABC9C;
      color : #fdf9ec;
      font-family:sans-serif;
      font-size: 12px;
      font-weight: bold;
      width: 150px;
      height: 35px;

   }
   
   
   div .homelogo {
    position: absolute;
    margin: 3px 0px 0px -100px;
	}


   .navbar-translate {
    margin-left: -395px;
	}
   
   
</style>

	<div class="card text-center">
	  <div class="card-header card-header-rose">
	    <ul class="nav nav-tabs" style="border-bottom: none;">
	      <li class="nav-item">
	        <a class="nav-link disabled" href="#">
	        <img src="${pageContext.request.contextPath}/image/point.png" style="width: 30px; padding-bottom: 3px;" /> &nbsp;포인트 : ${point} 점</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link active" href="${pageContext.request.contextPath}/mypage/myQnaList" style="top: 5px;">나의 1:1문의</a>
	      </li>
	    </ul>
	  </div>
	  <div class="card-body">
  
    <div class="container" id="content"> 
		<div class="row">
		<table class="table" border="1" style="border:none;">
		<thead>
			<tr>
				<th style="background-color:#eeeeee; text-align:center;">문의유형</th>
				<th style="background-color:#eeeeee; text-align:center;">제목</th>
				<th style="background-color:#eeeeee; text-align:center;">작성일</th>
			</tr>
		</thead>
		<tbody> 
			<c:forEach items="${QnAList}" var="list">
			<!-- 특정문의글을 보여주기 위한 글번호 -->
				<tr>
					<td>${list.inquirytype}</td>
					<td><a href="#" onclick="return QnaContent('${list.questionNo}');">${list.title}</a></td>
					<td>${list.regdate}</td>
				</tr>
			</c:forEach>
		</tbody> 
		</table>
		
		<!-- 페이징 -->
		<nav aria-label="Page navigation example" style="width: 1100px;">
	  <ul class="pagination justify-content-end">
		<c:if test="${pageMaker.prev}">
				<li class="page-item disabled">
				<a class="page-link" href="myQnaList?page=${pageMaker.startPage - 1}" tabindex="-1">이전</a>
				</li>
			</c:if>
	  	
	  	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item" >
				<a class="page-link" href="myQnaList?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
	  	
	  	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item">
				<a class="page-link" href="myQnaList?page=${pageMaker.endPage + 1}">다음</a>
				</li>
			</c:if>
		  </ul>
		</nav>
	
		</div>
	</div> 

  </div>
</div>


	
<script src="${pageContext.request.contextPath}/js/mypage.js" charset="UTF-8"></script>	

		<jsp:include page="../footer.jsp" flush="true"/>
</body>
</html>