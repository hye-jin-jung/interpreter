<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/assets2/css/material-dashboard.css" rel="stylesheet"/>
<meta charset="UTF-8">
<style>
	.dropdown-item {
		color: #000000;
	}
	
	.dropdown-item:hover {
		color: #ffffff;
		background-color: #1ABC9C !important;
	}

	.table {
		width: 60%;
		margin-left: auto;
		margin-right: auto;
	}
	
	.btn-outline-button {
		color: #1ABC9C;
		background-color: transparent;
		background-image: none;
		border-color: #1ABC9C;
		border-style: solid;
		border-width: 2px;
	}

	.btn-outline-button:hover {
		color: #ffffff;
		background-color: #1ABC9C;
		border-color: #1ABC9C;
	}
</style>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets2/img/favicon1.png">
<title>일맺다 관리자 페이지</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-info" style="background-color: #1ABC9C !important;">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index" target="_blank">일맺다</a>
			
			<div class="collapse navbar-collapse" id="navbar-info">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/user/1">회원관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/notice">공지사항 관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/qna">1:1 문의 관리</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" href="#pk" role="button" aria-haspopup="true" aria-expanded="false">광고 관리</a>
							<ul class="dropdown-menu dropdown-info" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/ad">광고 관리</a>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adApp">광고 문의 관리</a>
							</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/LogOut">로그아웃</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="margin-top: 50px;">
		<form action="${pageContext.request.contextPath}/admin/ad/insertContent" method="post">
			<table class="table">
				<tr>
					<th style="width: 130px;"><label style="color: black;">광고 문의글 번호</label></th>
					<td>
						<input type="text" name="adAppNo" value="${adAppVO.pageNo}" readonly="readonly" style="border: none; width:600px; height:50px; background-color:transparent;">
					</td>
				</tr>
				<tr>
					<th style="width: 130px;"><label style="color: black; margin-top: 6px;margin-bottom: 5px;">광고 카테고리</label></th>
					<td>
						<input type="text" name="adCategory" value="${adAppVO.adCategory}" readonly="readonly" style="border: none; width:600px; height:50px; background-color:transparent;">
					</td>
				</tr>
				<tr>
					<th style="width: 130px;"><label style="color: black;">광고 시작일</label></th>
					<td>
						<input type="text" class="form-control" id="datepicker1" name="start" style="width: 130px;">
					</td>
				</tr>
				<tr>
					<th style="width: 130px;"><label style="color: black;">광고 종료일</label></th>
					<td>
						<input type="text" class="form-control" id="datepicker2" name="end" style="width: 130px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="left">
						<a href="${pageContext.request.contextPath}/admin/ad" class="btn btn-outline-button btn-round">목록</a>
					</td>
					<td colspan="2" align="right">
						<input type="submit" class="btn btn-outline-button btn-round" value="등록">
					</td>
				</tr>
			
			</table>
		</form>
	</div>
	

<script>
	$("#userCodeCheck").click(function() {
		var userCode = $("input[name=userCode]").val();
		console.log("확인 할 닉네임 :" + userCode);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/ad/userCodeCheck",
			type : "POST",
			data : userCode,
			contentType : "application/String",
			dataType : "text",
			success : function(data) {
				console.log("온 data"+data)
				
				if(data == 0 ) {
					alert("존재하지 않는 회원입니다.")
					$("input[name=userCode]").val('');
				} else {
					alert("존재하는 회원입니다.")
				}
			}
		})		
	});
	
	//광고시작일
	$(function(){
		$("#datepicker1").datepicker({
			showOn:'both',
			buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly:true,
			//buttonText:'날짜선택',
			dateFormat:'yy-mm-dd',
			prevText:'이전 달',
			nextText:'다음 달',
			monthNames:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames:['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort:['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear:true,
			yearSuffix:'년',
			minDate: 0, //오늘 이전 날짜 선택 불가
			onClose: function( selectedDate ) {    
                //시작일(datepicker1) datepicker가 닫힐때
                //종료일(datepicker2)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            	$("#datepicker2").datepicker( "option", "minDate", selectedDate );
            }    
		});
	});
	
	//근무종료일
	$(function(){
		$("#datepicker2").datepicker({
			showOn:'both',
			buttonImage:"http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			buttonImageOnly:true,
			//buttonText:'날짜선택',
			dateFormat:'yy-mm-dd',
			prevText:'이전 달',
			nextText:'다음 달',
			monthNames:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames:['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort:['일', '월', '화', '수', '목', '금', '토'],		
			dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear:true,
			yearSuffix:'년'
		});
	});
</script>


</body>
</html>