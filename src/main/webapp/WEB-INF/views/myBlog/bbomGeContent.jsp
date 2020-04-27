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
<link href="${pageContext.request.contextPath}/assets2/css/material-dashboard.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet">

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>
body {
	background-color: #EAEAEA !important;
}

#topAndBot {
	position: fixed;
	width: 175px;
	display: inline-block;
	right: 0px; /* 창에서 오른쪽 길이 */
	top: 94%; /* 창에서 위에서 부터의 높이 */
	background-color: transparent;
	margin: 0;
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/myBlog/main/${blogMaster}" role="tab">My Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/myBlog/bbomGeMain/${blogMaster}" role="tab">BBomGe</a>
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
        
        <div class="alert alert-primary" style="width: 1400px; color: black; background-color: white; box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(255, 255, 255, 0.4);">
        	<div class="BBomGeContent" style="width: 1100px; margin-left: 135px;">
				<a href="${pageContext.request.contextPath}/myBlog/bbomGeMain/${blogMaster}" style="text-decoration: none; color: black;"><br><h3>일맺다 뽐게 BBomGe</h3></a>
		  		<div style="color:#A2A2A2;">&nbsp;일프로 ㆍ 일나눔 ㆍ 뽐내기 게시판</div><br>
		  		
				<form method="post" action="bbomGeModify" name="modifyfrm">

					<!-- 글번호 -->
					<input type="hidden" id="showCode" name="showCode" value="${content.showCode}">
					<input type="hidden" id="writerAtc" name="writerAtc" value="${content.writerCode}">

					<blockquote class="blockquote mb-0">
						<br>
						<div id="bbomtitle" style="display: flex;">
							<br>
							<h6 style="margin-top: 15px; margin-right: 20px;">${content.title}</h6>
							<br>
							<div style="display:flex;">
							<c:if test="${sessionScope.myuserCode eq content.writerCode}">
								<div id="ediAndDel" style="">
									<input id="editAtc" type="submit" value="수정" class="btn btn-info btn-round" style="background-color: #1ABC9C; border-color: transparent; box-shadow: none;">
									<button id="delAtc" type="button" class="btn btn-info btn-round" style="background-color: #1ABC9C; border-color: transparent; box-shadow: none;" onclick="goDel()">삭제</button>
								</div>
							</c:if>
							<div id="bbomHit" style="margin-top: 15px;">&nbsp;&nbsp;조회수&nbsp;&nbsp; ${content.hit}</div>
							</div>
						</div>
						<br>
					</blockquote>

					<br><br>
					<div id="bbomContent">${content.contents}</div>

				</form>

				<div class="comment">

					<form id="commentForm" name="commentForm" method="post">
						<br>
						<br>
						<div>
							<div>
								<span><strong>Comments</strong></span> <span id="cCnt"></span>
							</div>
							<div>
								<table class="table" style="display:flex;">
									<tr>
										<td><textarea style="width: 970px" rows="3" cols="30" id="comments" name="comments" placeholder="댓글을 입력하세요"></textarea><br></td>
										<td>
											<div>
												<input id="addComments" class="btn btn-outline-default btn-round" type="button" value="댓글 등록" onclick="fn_comment('${content.showCode}')">
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<input type="hidden" id="articleCode" name="articleCode" value="${content.showCode}">
						<input type="hidden" id="userCode" name="userCode" value="${sessionScope.myuserCode}">
					</form>

			</div>
			<div class="container">
				<form id="commentListForm" name="commentListForm" method="post">
					<div id="commentList"></div>
				</form>
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

<script>

	$(window).load(function() {
		getCommentList()
		sessionChk()
		$("#delAtc").click(function() {
			goDel();
		})
	});

	function goDel() {
		window.location
				.replace("${pageContext.request.contextPath}/myBlog/delete?showCode=${content.showCode}");
	}

	//로그인 확인
	function sessionChk() {
		var id = "${sessionScope.myuserCode}";
		/* alert("??"); */
		console.log('id체크:' + id);
		if (id == '' || null || undefined || 0 || NaN) {
			$('#username').hide();
		} else {
			console.log("로그인 됨");
			$('#ulmagin').hide();

		}
	};

	/* 댓글 등록하기(Ajax)*/
 	function fn_comment(code) {

		var id = "${sessionScope.myuserCode}";
		var comments = $('#comments');
		var commentVal = $('#comments').val();

		if (commentVal == '' || null || undefined || 0 || NaN) {
			alert('댓글을 입력하세요.')
		} else {

			var articleCode = $('#articleCode');

			if (id == '' || null || undefined || 0 || NaN) {
				alert('로그인 후 이용가능합니다.')
			} else {

				$.ajax({
			        type:'POST',
			        url : "<c:url value='/myBlog/addComment'/>",
			        data:$("#commentForm").serialize(),
			        success : function(data){
			            if(data=="success")
			            {
			                getCommentList();
			                $("#comments").val("");
			            }
			        },
			        error:function(request,status,error){
			            /* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
			       }
			        
			    });
			}
		}
	};
	
	
	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */
	$(function(){
	    
	    getCommentList();
	    
	});
	 

	
	/* 댓글 불러오기(Ajax)*/
	function getCommentList() {
		var articleCode = $('#showCode');

		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/myBlog/commentList',
			data: articleCode.val(),
			contentType: "application/String",
			success: function (data) {
				
				var html = "";
	            
	            if(data.length > 0){
	                html += data;
	            } else {
	                html += "<div>";
	                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
	                html += "</table></div>";
	                html += "</div>";
	            }
	            
	            $("#commentList").html(html);
				
			},
			error: function (request, status, error) {

			}

		});
	}
	
</script>

<script src="${pageContext.request.contextPath}/js/topNbottom.js"
	charset="UTF-8"></script>

<jsp:include page="../nav3Js.jsp" flush="true" />