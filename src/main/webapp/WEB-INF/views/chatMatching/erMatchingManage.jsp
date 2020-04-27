<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../navigator1.jsp" flush="true"/>

<title>일나눔 매칭 관리</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>

<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<style>
#smsStatus{
	display: flex;
	position: absolute;
}
button{
	outline : none;
	font-size: bold;
}
.btn {
    padding: 0px 12px 0px 12px;
} 

table{
	border:none;
}
   
	.pagination > li > a,
	.pagination > li> span,
	.pagination > li:first-child > a,
	.pagination >li:first-child > span,
	.pagination > li:last-child > a,
	.pagination > li:last-child > span {
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
	
	.page-item:first-child .page-link, .page-item:last-child .page-link {
		border-bottom-left-radius: 20px;
		border-top-left-radius: 20px;
		border-bottom-right-radius: 20px;
		border-top-right-radius: 20px;
	}
	.pagination > li > a:hover {
		background-color: #1ABC9C !important;
		border-color: #1ABC9C !important;
		color: #FFFFFF !important;
	}

</style>
<jsp:include page="../navigator2.jsp" flush="true"/>

<jsp:include page="../mypage/mypageMain.jsp" flush="true"/>


<style>
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
       <ul class="nav nav-tabs">
         <li class="nav-item">
           <a class="nav-link active" href="${pageContext.request.contextPath}/erMatchingManage/1">일나눔 매칭</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="${pageContext.request.contextPath}/eeMatchingManage/1">일프로 매칭</a>
         </li>
       </ul>
     </div>
     <div class="card-body">
 	<br/><br/>
	
	<div class="container" id = "container"> 
      <div class="row">
      <table class="table" border="1">
      <thead>
         <tr>
            <th style="background-color:#eeeeee; text-align:center; width: 100px;">게시글코드</th>
            <th style="background-color:#eeeeee; text-align:center;">제목</th>
            <th style="background-color:#eeeeee; text-align:center; width: 170px;">일프로 닉네임</th>
            <th style="background-color:#eeeeee; text-align:center; width: 50px;">인증하기</th>
            <th style="background-color:#eeeeee; text-align:center; width: 50px;">리뷰쓰기</th>
            <th style="background-color:#eeeeee; width: 50px;"/>
         </tr>
      </thead>
      <tbody id = "content"> 

      </tbody> 
      </table>
      <div>
  	</div>
      </div>
   </div>
    <div class = "page"aria-label="Page navigation example" style="padding-left: 40%; padding-right: 40%; padding-top: 0px; padding-bottom: 0px;">
	</div>     
  </div>
</div>
	</div>
 <footer style ="margin-left: 100px;">
 <jsp:include page="../footer.jsp" flush="true"/>
 </footer>
<script>
	window.onpageshow = function (event) {
    	if (event.persisted
        	|| (window.performance && window.performance.navigation.type == 2)) {
        	// Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우 하고싶은거 밑에 쓰세용
        	document.location.reload();
        	//저는 새로고침하게 만들어놨어유
    	}
	}
	
	$(document).ready(function(){
		updateErMatching();
 		startAjax();
	});	
	
	function updateErMatching(){
		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/newerList/${page}",
	        dataType: "json",
	        error : function() {
	            console.log('통신실패!!');
	        },
	        success : function(data) {
	        	var newList = '';
	        	if(data.hasOwnProperty('newerList')){
	        		for(i = 0; i < data.newerList.length; i++){ 
	        			var erList = data.newerList[i];
	        			newList += '<tr class = "conChild"><td>' + erList.ebCode + '</td><td><a href = "${pageContext.request.contextPath}/employerBoard/read/' +erList.ebCode +'">' + erList.title+'</a></td>'; 
	        			newList += '<td><a href = "${pageContext.request.contextPath}/myBlog/main/'+  erList.employerCode + '">' + erList.employeeCode + '</a></td>';
	        			
	        			if(erList.cfCheck == 'Y'){
	        				newList += '<td><button id = "cf' + erList.ebCode + '" _ngcontent-c4 class="btn btn-danger btn-link" disabled>인증완료</button></td>';
	        			}
	        			else{
	        				newList += '<td><button id = "cf' + erList.ebCode + '" _ngcontent-c4 class="btn btn-danger btn-link" onclick = "cf(this)" value="' + erList.employeeCode 
	        							+ '" name = "' + erList.matchingCode+'">인증</button></td>';
	        			}
	        			
	        			if(erList.cfCheck == 'Y' && erList.reviewCode == 'null'){	
	        				newList += '<td><button id = "review' + erList.ebCode + '" _ngcontent-c4 class="btn btn-danger btn-link" onclick = "openChildReview(this)" value="' 
	        							+ erList.employeeCode+'" name = "'+erList.matchingCode+'">리뷰쓰기</button></td>';
	        			}
	        			else if (erList.cfCheck == 'N'){
	        				newList += '<td><button id = "review' + erList.ebCode + '" _ngcontent-c4 class="btn btn-danger btn-link" disabled>미인증</button></td>';
	        			}
	        			else if(erList.reviewCode != 'null'){
	        				newList += '<td><button id = "review' + erList.ebCode + '" _ngcontent-c4 class="btn btn-danger btn-link" disabled>리뷰완료</button></td>';
	        			}
	        			
	        			if(erList.cfCheck == 'Y'){
	        				newList += '<td><button id ="cancelM' + erList.ebCode + '" _ngcontent-c4 class="btn btn-danger btn-link" disabled>매칭취소</button></td></tr>';	  	  
	        			}else{
	        				newList += '<td><button id ="cancelM' + erList.ebCode + '" _ngcontent-c4 class="btn btn-danger btn-link" onclick = "cancel(this)" value="' 
										+ erList.matchingCode + '">매칭취소</button></td></tr>';	  
	        			}
	        				               
	        		}
	        		var newPage = '<ul class="pagination">';	
	        		
	        		if (data.prev == 'true'){
	        			newPage += '<li class="page-item">';
	        			newPage += '<a class="page-link" href="${pageContext.request.contextPath}/erMatchingManage/'+ data.startPage - 1 + '">&lt</a></li>';
				
	        		}
	    			for (var i = data.startPage ; i < data.endPage+1 ; i++){
	    				newPage += '<li><a href="${pageContext.request.contextPath}/erMatchingManage/' + i +'" style = "color:#1ABC9C;">' + i +'</a></li>';
	    			}	
	    		
	    			if (data.next == 'true' && data.endPage >0){
	    				newPage += '<li class="page-item">';
	    				newPage += '<a class="page-link" href="${pageContext.request.contextPath}/erMatchingManage/'+ data.endPage + 1 + '">&lt</a></li>';
	    			}
	      				
	    			newPage +='</ul>';	
	    			
	        		$('#content').html(newList);
	        		$('.page').html(newPage);

	        	}
	        	else if(data.hasOwnProperty('not')){
	        		newList = '<div style ="padding-top: 200px;">' + data.not + '</div>';
	        		$('#container').html(newList);
	        	}		        		  	 	            
	        }
		});
	}
	
	function startAjax(){
		setInterval(function(){updateErMatching()}, 3000)
	}
	
	function openChildReview(e){	
		var employeeCode = e.value;
		var matchingCode = e.name;
		var name = "review/employee";
		var url = "${pageContext.request.contextPath}/review/employee?targetCode="+employeeCode+"&matchingCode=" +matchingCode;
        var name = "review";
        var option = "width = 600, height = 300, top = 100, left = 200, location = no";
        var openWin = window.open(url, name, option);
  
	}
	
	function cancel(e){
		var matchingCode = e.value;
		
		var obj = { "matchingCode" :matchingCode }
		
		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/cancelMatching",
	        data :JSON.stringify(obj),
	        contentType: "application/json",
	        success : function(data) {  
	        	alert("매칭취소되었습니다")
	        }
		});			
	};
	
	function cf(e){
		var employeeCode = e.value;
		var matchingCode = e.name;
		var obj = { "targetCode" :employeeCode ,
					"matchingCode" :matchingCode}
		
		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/cf",
	        data :JSON.stringify(obj),
	        contentType: "application/json",
	        success : function(data) {
	            $('.cfSuccess').html("인증완료");
	        }
		});			
		$(e).attr("disabled", true);
	};
	
	
</script>

</body>
</html>