<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>나의 일정</title>
    <script>var contextPath = "${pageContext.request.contextPath}";</script>
    
    <link rel=" shortcut icon" href="${pageContext.request.contextPath}/calendar/image/favicon.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='${pageContext.request.contextPath}/calendar//vendor/css/select2.min.css' />
    <link rel="stylesheet" href='${pageContext.request.contextPath}/calendar/vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/css/main.css">

	<!-- 사이드바 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200&display=swap" rel="stylesheet">
<style>

   #mainimageblk{
   
       width:100%; 
       height: 106px;
      
       
    }

	body{
		padding-left: 0px;
	    padding-right: 0px;
	    height: 960px;
	}

  #navi{
       /* background:#003E00; */
       margin-top:-15px;
       width:100%;
       height:110px;
       margin:0 auto;
       position:relative;
     }
   
     #navi ul{
       list-style: none;
       height:40px;
       padding-top:30px;
     }
     
     #navi ul li {
       display:inline;
       float:left;
       text-align: center;
       font-size:20px;
     }
     #navi a, #navi a:visited {
     
       padding: 30px 0px 0px 33px;
       display: block;
       color: #262626;             /* 글자색 */
       text-decoration: none;  /* 밑줄 없음 */
       font-size:15px;
     }
   
   
     #username{
       margin : 0px 0px 0px 417px;
     }
   
   
     #username ul{
       margin-top: 4px;
       list-style: none;
       height:0px;
     }
     
     #username ul li {
       display:inline;
       float:left;
       text-align: center;
       font-size:14px;
     }
     #username a, #username a:visited {
       padding: 0px 28px 0px 1px;
       display: block;
       color: #262626;             /* 글자색 */
       text-decoration: none;  /* 밑줄 없음 */
     }
   
   
   
   
    
   
   
     #navi .menu1 {
      
       margin : -10px 0px 0px 374px;
       position:absolute;
     }
   
   
   
     #navi .menu2 {
       float: right;
       margin : -95px 0px 0px 1640px;
       position:absolute;
     }
   
     #username{
       position:absolute;
       top: 86px;
       left: 945px;
   
     }
     
      #logimage{
      
      position: absolute;
       margin : -50px 0px 0px -30px;
       
     }
     
     
   
   
     div .usercode {
     
        font-family-sans-serif: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",
        sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
      font-family-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
       margin : -50px 0px 0px 41px;
       width: 300px;
       left: 1200px;
       font-size:15px;
     }
   
    
    
     div .homelogo {

       position:absolute;
 	   margin: 7px 0px 0px 246px;
       
     }
   
	#nv{
		bottom: -5px;
	}
	.menuTitle p {

    font-family: 'Montserrat', sans-serif;
	}



</style>
<!-- 사이드바 -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">

</head>

<body style="padding-top: 0px;">
<div id="mainimageblk">
         <nav id="navi">

            <div class="homelogo"> 
               <a href='<c:url value="/index" />'><img src="${pageContext.request.contextPath}/imagefile/1.png" name="select" 
               style="margin-left: 35px;"></a>
            </div>

            <div class="menu1"> <!-- 상단 메뉴 -->
               <ul>
                  <li><a href='<c:url value="/workerBoard/list" />'>일프로게시판</a></li>
                  <li><a href='<c:url value="/employerBoard/list" />'>일나눔게시판</a></li>
                  <li><a href='<c:url value="/freeList" />'>자유게시판</a></li>
                  <li><a href='<c:url value="/map" />'>지도검색</a></li>
                  <li><a href='<c:url value="/noticeList" />'>고객센터</a></li>
                  <li><a href='<c:url value="/myBlog/main" />'>마이블로그</a></li>
               </ul>
            </div>

            <div class="menu2"> <!-- 로그인전 화면 -->
               <ul>
                  <li><a href='<c:url value="/join/step1" />'>회원가입</a></li>
                  <li><a href='<c:url value="/login/login" />'>로그인</a></li>
               </ul>
            </div>
         </nav>
         
               
          <div id="username"> <!--로그인 후 회원창-->
            <img src="${pageContext.request.contextPath}/imagefile/mini2.png" id="logimage">
              <div id="aa">
                <div class="usercode"><b>${sessionScope.myuserCode}</b>님</div>
            <ul>
              <li><a href='${pageContext.request.contextPath}/chatList" onclick="window.open(this.href,'팝업창','width=430,height=600'); return false;'>채팅
              </a></li>
              <li><a href='<c:url value="/mypage/mypageMain" />'>마이페이지</a></li>
              <li><a href='<c:url value="/logout" />'>로그아웃</a></li>
           </ul>
            </div>
          </div> 
         
         </div>
      
<jsp:include page="../mypage/mypageMain.jsp" flush="true"/>

<div id="move" style="margin-left: 200px; width: 1500px;"> 
    <div class="container" style=" height: 500px; width: 850px;">


        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                	  일정추가
                <li><a tabindex="-1" href="#">내 일정</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <input type="hidden" id="myuserCode" value="${myuserCode}"> 
         
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                               <!-- 
                               <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="카테고리1">매칭된 일정</option>
                                    <option value="카테고리2">내일정</option>
                                </select> 
                                 --> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="매칭">매칭된 일정</option>
                            <option value="내 일정">내 일정</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view"></label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="hidden" value="정연"
                                checked></label>
                        <label class="checkbox-inline"><input class='filter' type="hidden" value="다현"
                                checked></label>
                        <label class="checkbox-inline"><input class='filter' type="hidden" value="사나"
                                checked></label>
                        <label class="checkbox-inline"><input class='filter' type="hidden" value="나연"
                                checked></label>
                        <label class="checkbox-inline"><input class='filter' type="hidden" value="지효"
                                checked></label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
</div>
    <script src="${pageContext.request.contextPath}/calendar/vendor/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/vendor/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/vendor/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/vendor/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/vendor/js/ko.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/vendor/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/js/addEvent.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/js/editEvent.js"></script>
    <script src="${pageContext.request.contextPath}/calendar/js/etcSetting.js"></script>
    
    <script>
    
    $(document).ready(function(){
        sessionChk()
        
     });
     
  //로그인 확인
    function sessionChk() {
       var id = "${sessionScope.myuserCode}";
       /* alert("??");  */
       console.log('id체크:' + id);
       if (id == '' || null || undefined || 0 || NaN){
          $('#username').hide();
         }else{
         console.log("로그인 됨"); 
         $('.menu2').hide();
       }
    };
    </script>
</body>

</html>