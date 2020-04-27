<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>

<html>
<head>
<title>${workerBoardVO.title}</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/function.js"></script>

<!--2개 스크립트 추가  -->
<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">

   	//북마크 클릭 시 (추가 또는 제거) 하단에 적었더니 실행 오류 나서 위로 올림	 	
	function bookMark(myuserCode, bmkCode){
		console.log("북마크 함수 실행");
		
		var data = {"userCode" : myuserCode, "bmkCode" : bmkCode};
		console.log(data);
		
		$.ajax({
			url: "/interpreter/bookMark/bookMark",
			type:"POST",
			//json을 String으로 변환
			data: JSON.stringify(data),
			//Controller로 보내줄 타입
			contentType:"application/json",
			//Controller에서 반환해줄 타입
			dataType:"text",
			success:function(data){
				console.log("돌아온 data"+data);
				if(data == "있어요"){
					alert("북마크 삭제");
				}else if(data == "없어요"){
					alert("북마크 추가")
				}else if(data == "notSession"){
					alert("로그인이 필요한 서비스입니다.");
				}
			},
			erro:function(errorThrown){
				console.log(errorThrown.statusText);
			}
		});
	}; 
</script>

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
	
	pre {
    background-color: #ffffff;
    border: 1px solid #fff;
	font-family:Helvetica Neue;	
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
		
<!-- 게시글이 존재하고 공고기한이 지나지 않았다면 -->
<c:if test="${!empty workerBoardVO and workerBoardVO.timeover eq 'N'.charAt(0)}"> 			     
   <div class="container">
   		<div class="row">
   			<div style="text-align:right;">
   				<c:if test="${myuserCode eq workerBoardVO.userCode}">
   					<a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;"
	        	 		href="<c:url value="/workerBoard/edit/${workerBoardVO.wbCode}"/>">수정</a>
	                <a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;"
	                	href="<c:url value="/workerBoard/delete/${workerBoardVO.wbCode}"/>">삭제</a>
	     		</c:if> 
	    	</div>
	    	<div>
	    		<h1 style="text-align:center;">${workerBoardVO.title}</h1>
	    	</div>
	    	
	    	<div style="text-align:right;">
				작성자 : <span class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${workerBoardVO.userCode} </a><br>
							<ul class="dropdown-menu">
							    <li><a href="${pageContext.request.contextPath}/myBlog/main/${workerBoardVO.userCode}">회원블로그</a></li>
							   	<li><a href="${pageContext.request.contextPath}/chat/${workerBoardVO.userCode}"
                                   		onclick="window.open(this.href,'팝업창','width=466,height=620'); return false;">채팅하기</a></li>
                                   		<li><a href="#" id="lover" onclick="lover('${myuserCode}', '${workerBoardVO.userCode}'); return false;" >찜하기</a></li>
							   	<li><a href="${pageContext.request.contextPath}/qnaStep1">신고하기</a></li>
							</ul>
					 </span>		
			</div>
			<div style="text-align:right;">
				게시글코드 : ${workerBoardVO.wbCode}
			</div>
			<div>
				<table class="table" style="text-align: left;">
					<tr>
						<th>주소</th>
						<td>${workerBoardVO.address}</td>
					</tr>
					<tr>
                        <th>근무시작/종료일</th>
                        <td>${workerBoardVO.workStart} ~ ${workerBoardVO.workEnd}</td>
                	</tr>
                	<tr>
                        <th>근무시간대</th>
                        <td>${workerBoardVO.workTime}</td>
                	</tr>
               		 <tr>
                        <th>급여</th>
                        <td>${workerBoardVO.salary}원</td>
             	 	</tr>
              		<tr>
               	        <th>업직종</th>
                        <td>${workerBoardVO.job}</td>
	                </tr>
	                <tr>
                        <th>나이</th>
                        <td>${workerBoardVO.age}대</td>
	                </tr>
	                <tr>
                        <th>공고마감일</th>
                        <td>${workerBoardVO.deadline}</td>
                	</tr>
                </table>
                <div style="text-align:center; height:200px; border:1px solid #dddddd;">
					<pre>${workerBoardVO.content}</pre>
				</div><br>
			</div>
			
			<div style="text-align:center;">
				<!-- 채팅하기 -->
				<div class="btn-group" data-toggle="buttons" style="right:50px;" ><a href="${pageContext.request.contextPath}/chat/${workerBoardVO.userCode}"
		        			 onclick="window.open(this.href,'팝업창','width=466,height=620'); return false;">
		        		<input id="chatBtn" type="image" data-toggle="button" aria-pressed="false"
		        				src="${pageContext.request.contextPath }/image/chat.png" width="50" alt="채팅"/></a>
		        </div>
		        <!-- 북마크 -->
		        <div class="btn-group" data-toggle="buttons">	
			    	 	<input type="image" autocomplete="off" id="bookMark"  onclick="bookMark('${myuserCode}', '${workerBoardVO.wbCode}'); return false;"
			        		src="${pageContext.request.contextPath }/image/bookmark.png" width="50" alt="북마크"/>
			    
			    </div>
			    
				<!-- 공유하기 -->
				<div class="btn-group" data-toggle="buttons" style="left:50px;">
			        <div class="dropdown" id="shareBtn">   
			        	<input type="image" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
			        			src="${pageContext.request.contextPath }/image/share.png" width="50" alt="공유하기"/>
			        		<ul class="dropdown-menu" role="menu" aria-labelledby="dLalbe">	 
								<li>
									<a id="kakao-link-btn" onclick="sendLink(); return false;">
									<img src="${pageContext.request.contextPath }/image/kakao.png" width="30" alt="카톡">카카오톡으로 공유</a>
								</li>        
				     			<li>
				     				<a id="fb-btn" onclick="fb(); return false;"><img src="${pageContext.request.contextPath }/image/facebook.png" width="30" alt="페북">페이스북으로 공유</a>
				     			</li>
				     			<li>
				     				<a id="twt-btn" onclick="twt(); return false;"><img src="${pageContext.request.contextPath }/image/twitter.png" width="30" alt="트윗">트위터로 공유</a> 
			     				</li>
			     			</ul>
			     	</div>	
		     	</div>
			</div>	
			<br><br><br>		
			<div style="text-align:center;">
				<a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;"
					 href="<c:url value="/workerBoard/list" />">목록</a> 
			</div>     
   		</div>
   </div>
</c:if> 
<%-- <!-- 게시글이 삭제됐다면 -->			
<c:if test="${empty workerBoardVO}">   
	<div class="container">
		<div class="row">
			<div style="text-align:center;">
				<h3>${notRead }</h3>
					<a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;" 
						 href="<c:url value="/workerBoard/list" />">목록</a> 
			</div>	
		</div>
	</div>
</c:if> --%>
<!-- 공고기한이 만료 됐다면 -->			
<c:if test="${workerBoardVO.timeover eq 'Y'.charAt(0)}">   
	<div class="container">
		<div class="row">
			<div style="text-align:center;">
				<h3>기한이 만료된 게시글입니다.</h3>
					<a type="button" class="btn btn-primary" style="background-color:#1ABC9C;border-color:#1ABC9C;" 
						 href="<c:url value="/workerBoard/list" />">목록</a> 
			</div>	
		</div>
	</div>
</c:if>	  

   <jsp:include page="../zxc30.jsp" flush="true"/>	    

</body> 	  
  	  	   
<script type='text/javascript'> 	
	
	//카톡 공유하기
	Kakao.init('c547590744823ed1e813fdbc7d1d0f9b');
	function sendLink() {
	    Kakao.Link.sendDefault({
	        objectType: 'feed',
	        content: {
	          title: '${workerBoardVO.title}',
	          description: '${workerBoardVO.content}',
	          imageUrl: '이미지 URL',
	          link: {
	            mobileWebUrl: 'http://localhost:8080/interpreter/workerBoard/read/${wbCode}',
	            webUrl: 'http://localhost:8080/interpreter/workerBoard/read/${wbCode}'
	          }
	        },
	        buttons: [
	          {
	            title: '웹으로 보기',
	            link: {
	              mobileWebUrl: 'http://localhost:8080/interpreter/workerBoard/read/${wbCode}',
	              webUrl: 'http://localhost:8080/interpreter/workerBoard/read/${wbCode}'
	            }
	          },
	          {
	            title: '앱으로 보기',
	            link: {
	              mobileWebUrl: 'http://localhost:8080/interpreter/workerBoard/read/${wbCode}',
	              webUrl: 'http://localhost:8080/interpreter/workerBoard/read/${wbCode}'
	            }
	          }
	        ]
	    });
	}

	   
</script>
</html>
