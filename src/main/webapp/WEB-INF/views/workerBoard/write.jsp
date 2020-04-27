<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>새 글 쓰기</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=187df647b367c95dcb90f3336f3e852b&libraries=services"></script>

<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/exception.js"></script>

<!--2개 스크립트 추가  -->
<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<style>

	 .navbar.navbar-transparent { /*여울****/ 
	  /* background: transparent !important; */
	  padding-top: 25px; 
	  box-shadow: none;
	  color: black;
	}	
	.navbar .navbar-brand {
	  font-weight: 500;
	  margin: 5px 0px;
	  padding: 20px 15px;
	  font-size: 15px;
	  color: #66615B;
	  text-transform: uppercase;
	}
	
	 #header { 
   height:100px;
   }
	
		li { list-style: none}
	
	 .nav-item a{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color: transparent;
         border : 2px solid #66615B;
         color : #66615B;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 100px;
         height: 40px;
         
      }
      
      .nav-item a:hover{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color:  #66615B;
         border : 2px solid #66615B;
         color : #fdf9ec;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 100px;
          height: 40px;
       
      }
     .navbar-nav > li > a {
    	padding-top: 7px;
	}
	
	.navbar-nav{
		padding-top:20px;
		padding-left:360px;
	}
	
	.navbar-toggler{
		display:none;
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

<jsp:include page="../zxc20.jsp" flush="true"/>

</head>
<div id="header"></div>
<body> 

		<div id="topAndBot">
		   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
		   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
		</div>

<div class="container">
	<div class="row">
		<h2>일프로 글쓰기</h2>		   
		<form:form name="form" id="form" commandName="workerBoardVO" method="POST" onsubmit="return writeCheck()" >
			<div>
						<form:input style="text-align:center; height:60px; font-size:26px;" class="form-control" path="title" type="text" placeholder="제목을 입력하세요." name="title"/> 
						<form:errors path="title" />
				<table class="table" style="text-align:left;">
					<tr>
						<th><form:label path="userCode">작성자</form:label></th>
						<td><form:input style="width: 30%;" class="form-control" path="userCode" type="text" value="${myuserCode }" readOnly="true"/>
						<form:errors path="userCode" /></td>
					</tr>
		  			<tr>
						<th><form:label path="address">주소</form:label></th>
						<td><form:input class="form-control" path="address" type="text" id="roadFullAddr"  name="roadFullAddr" placeholder="주소를 입력하세요." readOnly="true" /> 
						<form:input path="address" type="button" onClick="goPopup();" value="주소 검색"/></td>
						<form:errors path="address" />	
						<!-- 위도 -->
						<form:label path="lat" type="hidden"></form:label>
						<form:input path="lat" type="hidden" id="entY"  name="entY"/> 
						<form:errors path="lat" />
						<!-- 경도 -->
						<form:label path="lng" type="hidden"></form:label>
						<form:input path="lng" type="hidden" id="entX"  name="entX"/> 
						<form:errors path="lng" />
					</tr> 	 			
					<tr>
						<th><form:label path="workStart">근무시작일</form:label></th>
						<td><form:input style="width: 30%;" class="form-control" type="text" id="datepicker1" placeholder="근무시작일" path="workStart" name="workStart"/> 
						<form:errors path="workStart" /></td>
					<tr>	
						<th><form:label path="workEnd">근무종료일</form:label></th>
						<td><form:input style="width: 30%;" class="form-control" type="text" id="datepicker2" placeholder="근무종료일" path="workEnd" name="workEnd" />
						<form:errors path="workEnd" />
						</td>
					</tr>
		 			<tr>
						<th><form:label path="workTime">근무시간대</form:label></th>
						<td><form:select style="width: 30%;" class="form-control" path="workTime" name="workTime">
								<form:option value="">근무시간대를 선택하세요</form:option>
								<form:option value="오전">오전</form:option>
								<form:option value="오후">오후</form:option>
								<form:option value="무관">무관</form:option>
							</form:select>
						<form:errors path="workTime"/>
						</td>
					</tr>
					<tr>
						<th><form:label path="job">업직종</form:label></th>
						<td><form:select style="width: 30%;" class="form-control" path="job" name="job">
						 		<form:option value="">업직종을 선택하세요</form:option>
								<form:option value="단순">단순</form:option>
								<form:option value="서비스">서비스</form:option>
								<form:option value="유통/판매">유통/판매</form:option>
								<form:option value="사무직">사무직</form:option>
								<form:option value="IT/컴퓨터">IT/컴퓨터</form:option>
								<form:option value="디자인">디자인</form:option>
								<form:option value="교육/강사">교육/강사</form:option>
								<form:option value="운전/배달">운전/배달</form:option>
								<form:option value="의료">의료</form:option>
						 	</form:select>
						<form:errors path="job" />
						</td>
					</tr>
					<tr>
						<th><form:label path="salary">급여</form:label></th>
						<td><form:input style="width: 30%;" class="form-control" path="salary" name="salary"/> 
						<form:errors path="salary"/>
						</td>
					</tr>
					<tr>
						<th><form:label path="age">나이</form:label></th>
						<td><form:select style="width: 30%;" class="form-control" path="age" name="age">
								<form:option value="0">나이대를 선택하세요</form:option>
								<form:option value="10">10대</form:option>
								<form:option value="20">20대</form:option>
								<form:option value="30">30대</form:option>
								<form:option value="40">40대</form:option>
								<form:option value="50">50대</form:option>
								<form:option value="1">무관</form:option>
							</form:select><form:errors path="age" />
						</td>
					</tr>
					<tr>
						<th><form:label path="deadline">공고마감일</form:label></th>
						<td><form:input style="width: 30%;" class="form-control" type="text" id="datepicker3" placeholder="공고마감일" path="deadline" name="deadline"/> 
						<form:errors path="deadline" />
						</td>
					</tr>
				</table>	
						<textarea class="form-control" name="content" rows="13" cols="50" wrap="hard" placeholder="내용을 입력하세요"></textarea> 
						<form:errors path="content" />
			</div>
			<div style="text-align:center;"><br>
			<input type="submit"  class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;" value="등록"/> 
				<a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;"
					href="<c:url value="/workerBoard/list" />">취소</a>
			</div>
		</form:form>
	</div>
</div>

   <jsp:include page="../zxc30.jsp" flush="true"/>	

</body>

<script>
	
	//근무시작일
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
	
	//공고마감일
	$(function(){
		$("#datepicker3").datepicker({
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
			yearSuffix:'년',
			minDate: 0, //오늘 이전 날짜 선택 불가
			onClose: function( selectedDate ) {    
	           	$("#datepicker1").datepicker( "option", "minDate", selectedDate );
	        }   
		});
	});
	
	// 좌표변환 API
	var geocoder = new kakao.maps.services.Geocoder();

	 var callback = function(result, status) {
	     if (status === kakao.maps.services.Status.OK) {
	         console.log(result);
	         console.log("전체제이슨" + result[0].road_address);

	         document.form.entX.value = result[0].road_address.x;
	         document.form.entY.value = result[0].road_address.y;

	         console.log('변환x' + $('#entX').val());
	         console.log('변환y' + $('#entY').val());
	     }
	 };
	 
	 
	 

	 
	 //주소검색용
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
		var pop = window.open("${pageContext.request.contextPath}/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}


	function jusoCallBack(roadFullAddr,entX,entY){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		geocoder.addressSearch(roadFullAddr, callback);
	}
	


</script>

</html>
