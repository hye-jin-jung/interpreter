<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>일 맺 다 자 유 게 시 판</title>

   <!-- 제이쿼리 -->
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   
   <!-- 부가적인 테마 -->
   <link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
      
   <!--     Fonts and icons     -->
   <link rel="stylesheet" type="text/css"
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />   
 	
 	<style>
 	
   	#ntop {
		margin-top: 25px;
		margin-left: -16px;
	}
	</style>
	
      <jsp:include page="../zxc20.jsp" flush="true"/>	
      
   <style>
    
   
   #header {
   margin-top: -32px;
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
      color: #FFFFFF;
   }
   
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
   
   #page{
   
      margin-left: 210px;
       margin-top: 50px;
   
   }
   
   
     #newBtn {         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color: transparent;
         border : 2px solid #E7E7E7;
         color : #E7E7E7;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 70px;
         height: 35px;
         margin-left:1040px;
      }
      
     #newBtn:hover{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color:  #E7E7E7;
         border : 2px solid #E7E7E7;
         color : #fdf9ec;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 70px;
         height: 35px;
      }
   
       #loginBtn{
      	width: 76px;
      	margin-left: 5px;
      }
      
   
   
   
   a {
   
   color: #66615b;             /* 글자색 */
    text-decoration: none !important;  /* 밑줄 없음 */
   
   }
   
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
     .navbar-nav > li > a {
    	padding-top: 7px;
	}
	
	.navbar-nav{
		padding-top:20px;
		padding-left:360px;
		list-style:none;
	}
	.navbar-toggler{
		display:none;
	}
	
   
   #topAndBot{
   
      margin: 39% 30px 0px 0px;
      float : right;
      z-index: 999;
   }
   
   #buje {
   
      margin: -15px 30px 0px 5px;
   
       
   #blk {
      height : 2px;
      border-bottom: 1px solid #E7E7E7;
   }   
   
   
   .navbar-translate {
   
    margin-left: 35px;
    margin-bottom: 19px;
    
	}
	
	.navbar.navbar-transparent {
    box-shadow: none;
    color: black;
	}


	.navbar.navbar-transparent {
    /* background: transparent !important; */
    padding-top: 20px;
    box-shadow: none;
    color: black;
	}

	

   </style>
   
   <div id="navLine" style="height: 1px; border-bottom: 1px solid #E7E7E7;"></div>
   <div id="header"></div>	
   
   <div id="blk"></div>
   <div class="container">
      <header>
         <br>
         <br>
         <h2>일맺다 자유게시판</h2>
         <br>
         <div id="buje">일프로 ㆍ 일나눔 ㆍ 소통을 위한 통합게시판</div>
         <br>
         <br>
      </header>
      <section>
         <br>
         <button id="newBtn" type="button">
            <a class="amit" href="<c:url value="/freeWrite"/>">글쓰기</a> 
         </button>
         <br>
         <br>
         <table class="table table-hover">
            <thead>
               <tr>
                  <th style="width:30px">no.</th>
                  <th style="width:550px">제목</th>
                  <th style="width:60px">작성자</th>
                  <th style="width:40px">작성일</th>
                  <th style="width:30px">조회수</th>
               </tr>
            </thead>

            <!-- 목록 시작 -->
            <c:forEach items="${freeList}" var="list">
               <tr>
                  <td>${list.freecode}</td>
                  <td><a class="amit" href="<c:url value="/freeList/read/${list.freecode}" />">
                     ${list.title}</a></td>
                  <td class="dropdown">
                                    <a href="#" class="dropdown-toggle" id="amit"
                                       data-toggle="dropdown" aria-haspopup="true"
                              aria-expanded="false">${list.writercode}</a>
                                 <ul class="dropdown-menu">
                                     <li><a href="${pageContext.request.contextPath}/myBlog/main/${list.writercode}">회원블로그</a></li>
                                     <li><a href="${pageContext.request.contextPath}/chat/${list.writercode}"
                                     onclick="window.open(this.href,'팝업창','width=466,height=620'); return false;">채팅하기</a></li></li>
                                     <li><a href="#" id="lover" onclick="lover('${myuserCode}', '${list.writercode}');" >찜하기</a></li>
                                     <li><a href="${pageContext.request.contextPath}/qnaStep1">신고하기</a></li>
                                  </ul>
                         </td> 
                  <td>${list.regdate}</td>
                  <td>${list.hit}</td>
               </tr>
            </c:forEach>
            <!-- 목록 끝 -->
         </table>

         <!-- 검색창 -->
         <div class="search row">
            <div class="col-xs-2 clo-sm-2">
               <select name="searchType" class="form-control">
                  <option value="t"
                     <c:out value="${sc.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
                  <option value="c"
                     <c:out value="${sc.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
                  <option value="w"
                     <c:out value="${sc.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
                  <option value="tc"
                     <c:out value="${sc.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
               </select>
            </div>

            <div class="col-xs-10 clo-sm-10">
               <div class="input-group">
                  <input type="text" name="keyword" id="keywordInput"
                     value="${sc.keyword}" class="form-control" onKeyDown="ondown()" placeholder="검색어를 입력하세요" /> <span
                     class="input-group-btn">
                     <button id="searchBtn" class="btn btn-default">검색</button>
                  </span>
               </div>
            </div>


            <script>
               $(function() {
                  $('#searchBtn').click(
                        function() {
                           self.location = "freeList"
                                 + '${pageMaker.makeQuery(1)}'
                                 + "&searchType="
                                 + $("select option:selected").val()
                                 + "&keyword="
                                 + encodeURIComponent($(
                                       '#keywordInput').val());
                        });
               });
            </script>
         </div>


         <!-- 페이징 -->
         <div id="page">
         <div class="col-md-offset-3">
            <ul class="pagination">
               <c:if test="${pageMaker.prev}">
                   <li class="page-item">
                   <a class="page-link" 
                     href="freeList${pageMaker.makeSearch(pageMaker.startPage - 1)}">&lt</a></li>
               </c:if>

               <c:forEach begin="${pageMaker.startPage}"
                  end="${pageMaker.endPage}" var="idx">
                  <li
                     <c:out value="${pageMaker.pagerd.page == idx ? 'class=active' : ''}"/>>
                     <a href="freeList${pageMaker.makeSearch(idx)}">${idx}</a>
                  </li>
               </c:forEach>

               <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                    <li class="page-item">
                        <a class="page-link" 
                     href="freeList${pageMaker.makeSearch(pageMaker.endPage + 1)}">&gt</a></li>
               </c:if>
            </ul>
         </div>
         </div>
      </section>
   </div>
   
   <style>

	#conId{
		margin-left: 382px;
	}

	
	#username {
    z-index: 99999;
    margin: 10px 0px 0px 1481px;
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
	
</body>

   <script>
   
   //브라우저 뒤로가기하면 리스트 새로고침
   window.onpageshow = function(event) {
      if (event.persisted
            || (window.performance && window.performance.navigation.type == 2)) {
         // Back Forward Cache로 9 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우 하고싶은거 밑에 쓰세용
         document.location.reload();
         //저는 새로고침하게 만들어놨어유
      }
   }
     
   
    //닉네임 클릭 시 사용자찜하기 (추가 또는 제거)       
    function lover(myuserCode, loverCode){
      console.log("함수 함수 실행");
      
      var data = {"userCode" : myuserCode, "loverCode" : loverCode};
      console.log(data);
      
      $.ajax({
         url: "/interpreter/lover/lover",
         type:"POST",
         //json을 String으로 변환
         data: JSON.stringify(data),
         //Controller로 보내줄 타입
         contentType:"application/json",
         //Controller에서 반환해줄 타입
         dataType:"text",
         success:function(data){
            console.log("돌아온 data"+ data);
            if(data == "전데요"){
               alert("본인은 찜할 수 없습니다.");
             }else if(data == "없어요"){
                alert("찜하기 추가");
             }else if(data == "있어요"){
                alert("찜하기 삭제");
             }else if(data == "notSession"){
                alert("로그인이 필요한 서비스입니다.");
             }
          },
          erro:function(errorThrown){
             console.log(errorThrown.statusText);
          }
       });
   }; 
   
   
   //검색 엔터이벤트
   function ondown(){   
         if (event.keyCode == 13) {
            freesearch(); // 엔터 시 실행할 것
      }   
    };
   
    
    function freesearch() {
      self.location = "freeList"
            + '${pageMaker.makeQuery(1)}'
            + "&searchType="
            + $("select option:selected").val()
            + "&keyword="
            + encodeURIComponent($(
                  '#keywordInput').val());
   };
   
   
   
   
   </script>

</html>