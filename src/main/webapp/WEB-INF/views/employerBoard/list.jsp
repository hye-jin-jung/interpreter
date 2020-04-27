 <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

 
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
  
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/function.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!--2개 스크립트 추가  -->
<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<title>일맺다 일나눔 게시판</title>

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
   height:10px;
   border-top: 1px solid #E7E7E7;
   }
   #detailbtn{
   background-color:#1ABC9C;
   border-color:#1ABC9C;
   position: relative ;
   left: 500px;
   }
   #allListbtn{
   background-color:#1ABC9C;
   border-color:#1ABC9C;
   position: relative ;
   left: 600px;
   top: -34px;
   }
  .pagination > li > a,
  .pagination > li > span {
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
	.pagination>li:first-child>a,
	.pagination>li:first-child>span{
	border-radius: 20px;
}
	.pagination > li:last-child > a, 
	.pagination > li:last-child > span {
	 border-radius: 20px;
}
	.nav-pills-default>li>a,
	.pagination>li>a:hover,
	.pagination>li>a:focus,
	.pagination>li>a:active,
	.pagination>li.active>a,
	.pagination>li.active>span,
	.pagination>li.active>a:hover,
	.pagination>li.active>span:hover,
	.pagination>li.active>a:focus,
	.pagination>li.active>span:focus {
	background-color: #1ABC9C;
	border-color: #1ABC9C;
	color: #FFFFFF;
}
	fieldset ul li {
		display:inline;
		padding:0 6px;
		border-left:1px solid #fff; 
	}
	ul li:first-child{border-left:none;}
	

	
	fieldset {
		display: block;
	    margin-inline-start: 2px;
	    margin-inline-end: 2px;
	    padding-block-start: 0.35em;
	    padding-inline-start: 0.75em;
	    padding-inline-end: 0.75em;
	    padding-block-end: 0.625em;
	    min-inline-size: min-content;
	}
	
	legend {
		display: block;
	}
	
	h4{
		font-size:16px;
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
         width: 88px;
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
         width: 88px;
         height: 40px;
       
      }
      
      #loginBtn{
      	width: 76px;
      	margin-left: 5px;
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

		<div id="topAndBot">
		   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
		   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
		</div>

<div class="container">
	<div class="row">
		<header>
			<h2>일나눔 게시판</h2>
		</header>
		<br><br>
			<!-- 상세검색 -->
				  	<div id="detail" >
				  		<div style="position: relative; left:12px;"><b>상세검색</b></div>
						  	<form method="POST" action="${pageContext.request.contextPath}/employerBoard/detail">
						  		<fieldset>
									<legend></legend>
										<h4 style="float: left;"><b>시/도</b></h4>
											<div style="float: left; width:810px;">
									  			<ul style="padding-left:60px;" id="sido"></ul>
									  		</div>	
							  	</fieldset>
							  	
							  	<fieldset>
							  		<legend></legend>
							  			<h4 style="float: left;"><b>구/군</b></h4>
							  				<div style="float: left; width:1030px;">
									  			<ul style="padding-left:60px;" id="gugun"></ul>
									  		</div>	
							  	</fieldset>
							  	
							  	<fieldset>
							    	<legend></legend>
							    		<h4 style="float: left;"><b>근무 시작일</b></h4>
								    		<div style="float: left; width:700px;">
										    	<ul style="padding-left:20px;">
										    	  	<li><input type="date" id="workStartDate" name="workStartDate" class="workStartDate"><li>
								  	 			</ul>
								  	 		</div>
							  	</fieldset>
							  	<fieldset>
							    	<legend></legend>
							    		<h4 style="float: left;"><b>근무 종료일</b></h4>
								    		<div style="float: left; width:700px;">
								    			<ul style="padding-left:20px;">
										    	  	<li><input type="date" id="workEndDate" name="workEndDate" class="workEndDate"></li>
								  	 			</ul>
								  	 		</div>
							  	</fieldset>
							   
								 <fieldset>
									 <legend></legend>
									 	<h4 style="float: left;"><b>근무 시간대</b></h4>
									 		<div id="worktime" style="float: left; width:auto;">
									 			<ul style="padding-left:20px;">
												    <li><input type="checkbox" class="worktime" name="worktime" value="오전">오전</li>
												    <li><input type="checkbox" class="worktime" name="worktime" value="오후">오후</li>
												    <li><input type="checkbox" class="worktime" name="worktime" value="상시">상시</li>
								 				</ul>
								 			</div>
								 </fieldset> 
								  
								  <fieldset> 
								  	<legend></legend>
								  		<h4 style="float: left;"><b>업직종</b></h4>
									   <div id="job" style="float: left; width:auto;">
									   		<ul style="padding-left:60px;">	
										   		<li><input type="checkbox" class="job" name="job" value="서비스">서비스</li>
										      	<li><input type="checkbox" class="job" name="job" value="사무업">사무업</li>
										      	<li><input type="checkbox" class="job" name="job" value="디자인">디자인</li>
										      	<li><input type="checkbox" class="job" name="job" value="운전/배달">운전/배달</li>
										      	<li><input type="checkbox" class="job" name="job" value="교육">교육</li>
										       	<li><input type="checkbox" class="job" name="job" value="IT/컴퓨터">IT/컴퓨터</li>
										       	<li><input type="checkbox" class="job" name="job" value="단순">단순</li>
									   		</ul>
									   </div>
								   </fieldset>
								   
								   <fieldset>
								   	<legend></legend>
										<h4 style="float: left;"><b>나이대</b></h4>	   
										   <div id="age" style="float: left; width:auto;">
										   		<ul style="padding-left:60px;">
											       <li><input type="checkbox" class="age" name="age" value="10">10대</li>
											       <li><input type="checkbox" class="age" name="age" value="20">20대</li>
											       <li><input type="checkbox" class="age" name="age" value="30">30대</li>
											       <li><input type="checkbox" class="age" name="age" value="40">40대</li>
											       <li><input type="checkbox" class="age" name="age" value="50">50대</li>
										   		</ul>
										   </div>
								   </fieldset>
								   <fieldset>
								   		<legend></legend>
								   </fieldset>
								   
								<button type="submit" class="btn btn-primary" id="detailbtn">상세 검색</button>
							</form>
								<button class="btn btn-primary" id="allListbtn"
										 onclick="location.href='<c:url value="/employerBoard/list" />'">초기화</button>
				   </div> 
		   <!-- 상세검색 끝 -->
	   
   
   <div id="blk"></div>
   
   
	
		<div style="text-align:right;">
			<c:if test="${!empty myuserCode}">
				<a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;"
					 href="<c:url value="/employerBoard/write" />">글쓰기</a>
			</c:if>
		</div>
		
		<!-- 최신 공지글 -->
		 <div id=getNotice>
		 	<img src="${pageContext.request.contextPath }/image/speaker.png" width="40" alt="공지">&emsp;
			 <c:forEach var="getNotice" items="${getNotice}" varStatus="loop">
			 	<a href="<c:url value="/noticeList/read/${getNotice.no}"/>" style="font-size:18px;">${getNotice.title }</a>
			 </c:forEach>
		</div>
		
	
	<!-- 글 목록 없다면  -->
   	<c:if test="${empty employerBoardList}">
   		<div class="row">			  	
	        <table class="table" style="text-align: center; border:1px solid #dddddd" >
	        	<thead>
	                <tr>
	                		<!-- <th style="background-color:#eeeeee; text-align:center;">매칭 아이콘</th>
	                		<th style="background-color:#eeeeee; text-align:center;">기간 아이콘</th> -->
	                		<th style="background-color:#eeeeee; text-align:center;">아이콘</th>
	                        <th style="background-color:#eeeeee; text-align:center;">글번호</th>
	                        <th style="background-color:#eeeeee; text-align:center;">닉네임</th>
	                        <th style="background-color:#eeeeee; text-align:center;">제목</th>
	                        <th style="background-color:#eeeeee; text-align:center;">작성일</th>
	                        <th style="background-color:#eeeeee; text-align:center;">조회수</th>
	                        
	                </tr>
	            </thead>
	        </table>
	           
	        	<div style="height:300px"> 등록된 결과가 없습니다. </div>
			</div>	
		</c:if>	
	
	
	<!-- 글이 있다면 -->
   	<c:if test="${!empty employerBoardList}">
   		<div class="row">		 
			  <table class="table" style="text-align: center; border:1px solid #dddddd" >
	        	<thead>
	                <tr>
	                		<!-- <th style="background-color:#eeeeee; text-align:center;">매칭 아이콘</th>
	                		<th style="background-color:#eeeeee; text-align:center;">기간 아이콘</th> -->
	                		<th style="background-color:#eeeeee; text-align:center;">아이콘</th>
	                        <th style="background-color:#eeeeee; text-align:center;">글번호</th>
	                        <th style="background-color:#eeeeee; text-align:center;">닉네임</th>
	                        <th style="background-color:#eeeeee; text-align:center;">제목</th>
	                        <th style="background-color:#eeeeee; text-align:center;">작성일</th>
	                        <th style="background-color:#eeeeee; text-align:center;">조회수</th>    
	                </tr>
	            </thead>		      		
	            <tbody> 
	                <c:forEach var="employerBoard" items="${employerBoardList}" varStatus="loop">
	                        <tr>
	                        	<td>
	                        		<!-- DB에 char형식으로 저장돼있어서 .charAt(0) 붙여줘야함 -->
	                        		<c:if test = "${employerBoard.matching eq 'Y'.charAt(0)}"> 
	                        			<img src="${pageContext.request.contextPath }/image/matching.png" width="25" alt="매칭">
	                        		</c:if>
	                        		<c:if test = "${employerBoard.timeover eq 'Y'.charAt(0)}">
	                        			<img src="${pageContext.request.contextPath }/image/timeover2.png" width="25" alt="기간만료">
	                        		</c:if>
	                        		</td>
	                            <td id="ebCode">${employerBoard.ebCode}</td>	
	                            <td class="dropdown">
	     	                      	<a href="#" class="dropdown-toggle" 
	     	                      		data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">${employerBoard.userCode}</a>
								   		<ul class="dropdown-menu">
									        <li><a href="${pageContext.request.contextPath}/myBlog/main/${employerBoard.userCode}">회원블로그</a></li>
									       	<li><a href="${pageContext.request.contextPath}/chat/${employerBoard.userCode}"
                                   					  onclick="window.open(this.href,'팝업창','width=466,height=620'); return false;">채팅하기</a></li> 
									       	<li><a href="#" id="lover" onclick="lover('${myuserCode}', '${employerBoard.userCode}'); return false;" >찜하기</a></li>
									       	 <li><a href="${pageContext.request.contextPath}/qnaStep1">신고하기</a></li>
								       	</ul>
	     	                      	</td> 
	                            <td><a href="<c:url value="/employerBoard/read/${employerBoard.ebCode}"/>">${employerBoard.title}</a></td>
	                            <td>${employerBoard.regDate}</td>       
	                            <td>${employerBoard.count}</td>
	                        </tr>
	                </c:forEach>
	        	</tbody>
	        </table>
	        
	        <!-- 검색 -->			
			<div style="float:right;" class="ebSearch">
			 	<select style="width: auto; float:left;" class="form-control" name="searchType" >
					<option value="t"<c:out value="${ebs.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
			 		<option value="a"<c:out value="${ebs.searchType eq 'a' ? 'selected' : ''}"/>>주소</option>
			 		<option value="j"<c:out value="${ebs.searchType eq 'j' ? 'selected' : ''}"/>>업직종</option>
			 		<option value="wt"<c:out value="${ebs.searchType eq 'wt' ? 'selected' : ''}"/>>근무시간대</option>
			 	</select>
			 		<input style="width: auto; float:left;" class="form-control" type="text" name="keyword" id="keywordInput" value="${ebs.keyword }"/> 	
			 	<button style="width: auto; float:left; background-color:#1ABC9C;border-color:#1ABC9C;" class="btn btn-primary" id="searchBtn">검색</button>
			 </div><br><br>
			 <!-- /검색 끝-->
	        
	        <!-- 페이징 -->
	        <div style="text-align:center;">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><</a></li>
					</c:if> 
					 
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
					</c:forEach>
							    
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">></a></li>
					</c:if> 
				</ul>
			</div>
			<!-- 페이징 끝 -->
				
        </div>
      </c:if>
	</div>      
</div>       

   <jsp:include page="../zxc30.jsp" flush="true"/>
	 
</body>


<script>

	//검색
 	$(function(){
 		$('#searchBtn').click(function(){
 			self.location = "list"
 				+ '${pageMaker.makeQuery(1)}'
 				+ "&searchType="
 				+ $("select option:selected").val()
 				+ "&keyword="
 				+ encodeURIComponent($('#keywordInput').val());
 		});
 	});
	
    //브라우저 뒤로가기하면 리스트 새로고침
    window.onpageshow = function(event) {
       if (event.persisted
             || (window.performance && window.performance.navigation.type == 2)) {
          // Back Forward Cache로 9 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우 하고싶은거 밑에 쓰세용
          document.location.reload();
          //저는 새로고침하게 만들어놨어유
       }
    }
	
	
 	//날짜
	 document.getElementById('workStartDate').valueAsDate = new Date();
    document.getElementById('workEndDate').valueAsDate = new Date();
	
	
	  
	   var area0 = ["서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주특별자치도"];
	   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서초구","서대문구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구","북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","기장군","해운대구"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	
	 
	
	 // 시/도 선택 박스 초기화
	   $(document).ready(function() {
		   $("#sido").each(function() {
			   $selsido = $(this);
			   sido();
			  });
	
		   $("#sido").change(function() {
				 var target = $("#sido");
				 var targetIndex = $("input:radio",target).index($("input:radio:checked",target));
				 var index = targetIndex+1;
				 
				 changeGugun(index);
				 
			 });
		});
	   
	
	
	 function sido(){
		  $.each(eval(area0), function() {
			  $("#sido").append("<li><input type='radio' class= 'sido' name='sido' value='"+this+"' >" + this+"</li>");
			  });
	 }
	
	 // 시/도 선택시 구/군 설정
	
	 
	
		function changeGugun(e){	
			var area = "area"+e; // 선택지역의 구군 Array
	
			  $("#gugun").html(''); //초기화
			  
			  if(e != 0){
				   $.each(eval(area), function() {
				    $("#gugun").append("<li><input type='checkbox' class= 'gugun' name='gugun' value='"+this+"' >"+this+"</li>");
				   });
			  }
			  
		}
	 
	

</script>
</html>