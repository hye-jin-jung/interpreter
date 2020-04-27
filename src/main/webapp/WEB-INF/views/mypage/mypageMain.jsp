<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default" id="nv" role="navigation" style="height: 76px; position:relative;"> <!-- style="width:200px;" -->
	<div class="container" style="width:200px; float:left;">
	<div style="height:106px"></div>
		<div class="navbar-header">
			<div class="menuTitle">			
				<p>MY PAGE</p>
			</div>
		</div>
		<div id="sidebar-wrapper" class="sidebar-toggle">
			<ul class="sidebar-nav">
		    	<li>
		      		<a href="${pageContext.request.contextPath}/mypage/myQnaList">-main</a>
		    	</li>
		    	<li>
		      		<a href="${pageContext.request.contextPath}/mypage/updateInfo">-개인정보 수정</a>
		    	</li>
		    	<li>
		      		<a href="${pageContext.request.contextPath}/mypage/updatePwd">-비밀번호 변경</a>
		    	</li>
		    	<li>
		      		<a href="${pageContext.request.contextPath}/myPageEr">-소개서 관리</a>
		    	</li>
		    	<li>
		      		<a href="${pageContext.request.contextPath}/erMatchingManage/1">-일자리 매칭 관리</a>
		    	</li>
		    	<li>
		      		<a href="${pageContext.request.contextPath}/calendar/index">-나의 일정 관리</a>
		    	</li>
		    	<li>
		      		<a href="${pageContext.request.contextPath}/mypage/deleteAccount">-회원 탈퇴</a>
		    	</li>
		  	</ul>
		</div>
  	</div>
</nav>
