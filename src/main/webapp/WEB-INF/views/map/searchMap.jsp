<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
       <meta charset="utf-8">
       <title>  1MAP 지 도 검 색  </title>
       <link rel="icon" type="image/png" href="./assets/img//favicon1.png">
       <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
       <script type="text/javascript" src="http://jsgetip.appspot.com"></script>
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=187df647b367c95dcb90f3336f3e852b&libraries=clusterer"></script>
       <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
        <script type="text/javascript" src="js/jquery.ajax-cross-origin.min.js"></script>
        
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        
       <!-- 부트스트랩 -->
     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
     <!-- CSS Files -->
     <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
     <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
     <!-- CSS Just for demo purpose, don't include it in your project -->
     <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
       
     <style type="text/css">
     
      #navi{
       /* background:#003E00; */
       margin-top:-15px;
       width:100%;
       height:110px;
       margin:0 auto;
       border-bottom:1px solid #E7E7E7;
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
     
       padding: 30px 0px 0px 35px;
       display: block;
       color: #262626;             /* 글자색 */
       text-decoration: none;  /* 밑줄 없음 */
       font-size:15px;
     }
   
   
     #username{
       margin : 2px 0px 0px 417px;
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
       font-size:13px;
     }
     #username a, #username a:visited {
       padding: 0px 30px 0px 2px;
       display: block;
       color: #262626;             /* 글자색 */
       text-decoration: none;  /* 밑줄 없음 */
     }
   
   
   
   
    
   
   
     #navi .menu1 {
      
       margin : -95px 0px 0px 200px;
       position:absolute;
     }
   
   
   
     #navi .menu2 {
       float: right;
       margin : -95px 0px 0px 1640px;
       position:absolute;
     }
   
     #username{
       position:absolute;
       top: 1px;
       left: 1240px;
   
     }
     
     
   
   
     div .usercode {
     
        font-family-sans-serif: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",
        sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
      font-family-monospace: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace;
       margin : -45px 0px 0px 44px;
       width: 300px;
       left: 1200px;
       font-size:15px;
     }
   
     #logimage{
       margin : 30px 0px 0px -130px;
   
     }
   
     #aa{
       margin : -10px 0px 0px -100px;
     }
     
     
      div .homelogo {
       /* float:left; */
       margin : -2px 0px 0px -100px
       position: absolute;
     }
   
     
     
     
     /*-----------------------*/
     
     
     #header {
       width:100%; 
       height: 105px;
/*        background-color:#E7E7E7; */
       
       
     }
     
     
     #mapimage{
        position:absolute;
        margin : -77px 0px 0px 50px;
        z-index:999;
     }
     
     .search{
       position:absolute;
        height: 60px;
       width:390px; 
       border: 1px solid #E7E7E7;
       background-color: #E7E7E7;
       margin-top: 40px;
       margin-left: 25px;
        z-index:999;
     }
     
     .search input[type="search"] {
        border: 2px solid #1ABC9C;
        border-radius: 30px;
        box-sizing: border-box;
        color: #666;
        font-weight:400;
        height: 40px;
        padding-left: 70px;
        padding-right: 20px;
        -webkit-appearance: none;
        width: 300px;
        margin-top: 9px;
        margin-left: 22px;
      }
           
     .info {
         /* border-top: 1px solid #E7E7E7; */
        border-bottom: 1px solid #E7E7E7;
        /* margin-top: 20px;  */
          padding: 20px 30px;
          
     }        
           
     .info a {
     
       color: #262626; 
       text-decoration: none; 
         
     }
     
     #placesList .h1 {
        
        margin : 40px 0px 20px 180px;
        font-size:22px;
        color: #66615b;
     }
     
     
     #guinTab {
        magin-right:50px;
     }
     
     
     #gujicTab {
        magin-left:20px;
     }
     
     
      #tab {
        position:absolute;
        margin : 28px 0px 0px 25px;
        
     }
      

      .info:hover {
       background: #f4f4f4;
     }
     
     .atag:hover {
        color: #66615b;
          font-weight:bold;
      } 
     
      #get:hover {
        background-color: #048f74;
        border-color: #048f74;
      } 
    
    
    .navbar.navbar-transparent {
	    padding-top: 15px;
	    box-shadow: none;
	    color: black;
	}
    
      
     </style>
       
       
       
       
       
   </head>
   
      <body>
      
      
      <header>
         <nav id="navi">

            <div class="homelogo"> 
               <a href="<c:url value="/index" />"><img src="${pageContext.request.contextPath}/imagefile/maplogo.png" name="select" 
               style="margin-left: 35px;"></a>
            </div>

            <div class="menu1"> <!-- 상단 메뉴 -->
               <ul>
                  <li><a href="<c:url value="/workerBoard/list" />">일프로게시판</a></li>
                  <li><a href="<c:url value="/employerBoard/list" />">일나눔게시판</a></li>
                  <li><a href="<c:url value="/freeList" />">자유게시판</a></li>
                  <li><a href="<c:url value="/map" />">지도검색</a></li>
                  <li><a href="<c:url value="/noticeList" />">고객센터</a></li>
                  <li><a href="<c:url value="/myBlog/main" />">마이블로그</a></li>
               </ul>
            </div>

            <div class="menu2"> <!-- 로그인전 화면 -->
               <ul>
                  <li><a href="<c:url value="/join/step1" />">회원가입</a></li>
                  <li><a href="<c:url value="/login/login" />">로그인</a></li>
               </ul>
            </div>
         </nav>
         
               
          <div id="username"> <!--로그인 후 회원창-->
            <img src="${pageContext.request.contextPath}/imagefile/mini2.png" id="logimage">
              <div id="aa">
                <div class="usercode"><b>${sessionScope.myuserCode}</b>님</div>
            <ul>
              <li><a href="${pageContext.request.contextPath}/chatList" onclick="window.open(this.href,'팝업창','width=430,height=600'); return false;">채팅
              </a></li>
              <li><a href="<c:url value="/mypage/mypageMain" />">마이페이지</a></li>
              <li><a href="<c:url value="/logout" />">로그아웃</a></li>
           </ul>
            </div>
          </div> 
         
         </header>
      
      
       <div id="map" style="width:79%;height:825px;float:left;position:relative;"></div>
        <div class="search">
          <input type="search" name="q" id="q" placeholder="동, 지하철역을 입력하세요" size="25" onKeyDown="onKeyDown()">
          <button ngcontent-c4="" id="get" class="btn btn-danger btn-just-icon" type="button"><i _ngcontent-c4="" class="fas fa-search"></i></button>
        </div>
        
          <!-- 리스트를 띄어줄 div -->
      <div id="placesList" style="width:21%;height:825px;float:left;overflow-y:scroll;position:relative;border-top:1px solid #ececec;">
              <div id="tab">
               <button class="btn btn-outline-default btn-round" id="guinTab" >구인</button>
            <button class="btn btn-outline-default btn-round" id="gujicTab" >구직</button>
            </div>
          <b><p class="h1">&nbsp;&nbsp;&nbsp;이 지역 공고글</p></b>
          <div id="List" style="height: auto; width: 100%; border-top:1px solid #ececec;">
          </div>
      </div>
      
   </body>
      
       

      
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
      
      
      
      
                  //화면 로드되면
                  
                   $(window).load(function(){
                     guinStart()
                  });
            
                  

         
                  //아이피가져오기
          
                  var centerlat = '';
                  var centerlng = '';
                   var clientIp = '';
          
                  $.ajaxSetup({ async: false }); //동기식으로 ajax 실행되게 설정
                  console.log("1");

                  getIp();
                  
                  
                  //사용자 IP 얻어오기 * 자바스크립트내에서 외부 url 요청했었는데 CROS 도메인 에러가 계속..
                  // js플러그인 설치해서 잘되다가 또 안돼서 자바로 받는걸로 최종결정!
                  function getIp(){   
                       $.ajax({
                       url: "${pageContext.request.contextPath}/getip",
                       dataType: "json",
                       asynch: false,
                       success:  function(data) {
                    	   console.log("2");
                           clientIp = data.ip;
                           console.log('사용자ip:' + clientIp);
                       },
                       error: function(errorThrown) {
                      alert('ip갖고오는것 실패')
                          }
                      })     
                   };
                      
                  
                  
                  getUrl();
                  
                  
                  
                  
                  
                  //스크롤 만들어주는 함수 
                  $('#placesList').scroll(function() {
                     var scrollT = $(this).scrollTop(); //스크롤바의 상단위치
                     var scrollH = $(this).height();    //스크롤바를 갖는 div의 높이
                     var contentH = $('#List').height(); //문서 전체 내용을 갖는 div의 높이
                  });
      
                  
                  
                  
                  
                  // 사용자IP위치를 중심좌표로 찍는 함수 
                  function getUrl() {
                     console.log("검색");
                     console.log("3");
                     var apiKey = 'dabe2a7ae025e14feda9f6af1467228c';
                     //var apiKey = 'd0a0b605f0f6eddfe61b6b04ff602d37';   
                     var ipAdd = clientIp;
                     var regUrl = 'http://api.ipstack.com/' + ipAdd + '?access_key=' + apiKey;
                     //var regUrl = 'http://api.ipstack.com/115.90.212.21?access_key=dabe2a7ae025e14feda9f6af1467228c';
                     
                     console.log(regUrl);
                     $.ajax({
                        type : "POST",
                        url : regUrl,
                        dataType : "json",
                        async: false,
                        success : function(json) {
                           console.log("4");
                           console.log(json); // 리턴받은 json
                           centerlat = json.latitude; // 위도
                           centerlng = json.longitude; // 경도
                           //console.log(centerlat);
                           //console.log(centerlng);
                        },
                        error : function(xhr, status, error) {
                           alert(error);
                        }
                     });
                  };
      
      
         
      
         
         
         //지도 생성
          var map = new kakao.maps.Map(document.getElementById('map'), { 
              center : new kakao.maps.LatLng(centerlat, centerlng), // 지도의 중심좌표 : 사용자 아이피를 중심으로
              minLevel: 2,  // 지도 최대 확대레벨
              level : 5      // 지도의 확대 레벨 
          });
          
         
         
         
          //마커 클러스터러 생성 
          var clusterer = new kakao.maps.MarkerClusterer({
              map: map,            // 마커들을 클러스터로 관리하고 표시할 지도 객체 
              averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
              minLevel: 0,         // 클러스터 할 최소 지도 레벨  *이거랑
              gridSize: 50,       
              minClusterSize: 1    // *이거중요 이거 두개를 적용함으로 마커가 정확히 건물 위치에 찍히는것을 숨길 수 있음. 
          });
       
          
          
          
          
          //----------------------------------------------------------          
          
          
          function makeMarker(data) {
             
             
             
              var markers = $(data.positions).map(function(i, position) {
                     return new kakao.maps.Marker({
                         position : new kakao.maps.LatLng(position.lat, position.lng)
                     });
                 });
                 // 클러스터러에 마커들을 추가합니다
                 clusterer.clear();
                 clusterer.addMarkers(markers);
                 
             };
             
             
             
             
             
         //----------------------------------------------------------
         
         //움직일때 구인인지 구직인지 알려주는 변수
         var tabchk ="";
         console.log('tabchk값' + tabchk);
         
          //리스트에 띄울 목록 제이슨으로 가져올 준비
         function getLl(message) {
            console.log('tabchk값2' + tabchk);
            // 지도 영역정보를 얻어오기
            var bounds = map.getBounds();
            // 영역정보의 남서쪽 정보 얻어오기
            var swLatlng = bounds.getSouthWest();
            // 영역정보의 북동쪽 정보 얻어오기
            var neLatlng = bounds.getNorthEast();
            // 남서쪽,북동쪽 각각의 위도 경도 얻어오기
            var swLat = swLatlng.getLat();
            var swLng = swLatlng.getLng();
            var neLat = neLatlng.getLat();
            var neLng = neLatlng.getLng();
            // 현재 지도 영역에 포함되는 글만 갖고오게 범위가 될 파일을 준비(컨트롤러에가서 JSON이 되고 JSON을 HashMap으로 변경됨)
            var tabchk2 = tabchk;
            console.log('tabchk값2' + tabchk2);
            if (message == undefined){
               console.log('1번째 tabchk2값' + tabchk2);
               console.log('1번째 message값' + message);
               var lldata = '{"message":"' + tabchk2 +'","swLat":"'+ swLat +'","swLng":"'+ swLng +'","neLat":"'+neLat+'","neLng":"'+ neLng +'"}';
              }else{
                 console.log('2번째 tabchk2값' + tabchk2);
                 console.log('2번째 message값' + message);
               var lldata = '{"message":"' + message +'","swLat":"'+ swLat +'","swLng":"'+ swLng +'","neLat":"'+neLat+'","neLng":"'+ neLng +'"}';
            }
                     
            console.log('움직인다' + lldata);
            mapList(lldata);
            
         };
         
         
         
         
         
         
         //리스트에 현재지도영역에 포함되는 글만 가져오는 함수
         function mapList(lldata) {
            console.log("계속!"); 
            console.log("제이슨도착~" + lldata);
             $("#placesList").scrollTop(0);   // 스크롤 항상 위로 지정
               $.ajax({
                  url: "${pageContext.request.contextPath}/map2",
                  type: "POST",
                  data: lldata,
                  contentType: "application/json",
                  dataType: "json",
                  success: function(data) {
                       console.log('목록만들기 직전' + data);
                       var list = document.getElementById("List");
                       var itemStr = '';
                       //리스트모양만들기(html코드생성)
                       for(i = 0; i < data.list.length; i++){ 
                            itemStr += '<div class="info">' +
                                        '<b><small>' + data.list[i].usercode + '</b></small><br>' ;
                             if(data.list[i].ebcode != '' || null){
                                itemStr += '<span><a class="atag" href="<c:url value="employerBoard/read/'+ data.list[i].ebcode +'"/>" target="_blank" >' + data.list[i].title + '</a></span>';  //게시글 연결 
                             }else{
                                itemStr += '<span><a class="atag" href="<c:url value="workerBoard/read/'+ data.list[i].wbcode+'"/>" target="_blank">' + data.list[i].title + '</a></span>';  //게시글 연결 
                             }
                            
                            itemStr += '<br><span class="date">' + data.list[i].startdate + ' ~ ' + data.list[i].enddate + '</span>' + '</div>';
                       }  
                       //console.log(itemStr);
                       $("#List").html(itemStr);  
                     },
                      error: function(errorThrown) {
                      console.log(errorThrown.statusText);
                   }
                  })  //ajax
            };
         
         
            var get = document.getElementById("get");  //검색하기버튼
            get.onclick = function() {               //이 클릭되면 
               asyncSend();                     //검색어에 맞는 위도경도 찾아서 움직임
            };
            
            
            //검색 엔터이벤트
            function onKeyDown(){   
                  if (event.keyCode == 13) {
                        asyncSend();
               }   
             };
            
            
              
            
 
            
            
            
            
            
         //----------------------------------------------------------
         
         //검색어 제이슨파일 검색 준비
         function getXHR() {
            var req;
            try {
               req = new XMLHttpRequest();
            } catch (e) {
               try {
                  req = new ActiveXObject("Msxm12.XMLHTTP");
               } catch (e) {
                  req = new ActiveXObject("Microsoft.XMLHTTP");
               }
            }
            return req;
         };
      
         
         
       //검색어 제이슨파일에서 검색
			function asyncSend() {
				var req = getXHR();
				var keyword = $('#q').val(); //검색어
				
				//제이슨파일에 지하철역이름이 '역'붙어있지않아서 검색 시 모두 찾을 수 있게 준비
				if(keyword.indexOf('역') != -1){
					keyword = keyword.substr(0, keyword.length -1);        
				} 
				
				req.onreadystatechange = function() {
					if (req.readyState == 4) {
						if (req.status == 200) {
							jsonData = JSON.parse(req.responseText);
							for (i = 0; i < jsonData.city.length; i++) {
								if (jsonData.city[i].읍면동 == keyword) {   //제이슨에서 검색어 찾기
									lat = jsonData.city[i].위도;
									lng = jsonData.city[i].경도;
									var moveLatLon = new kakao.maps.LatLng(lat, lng);
									panTo(moveLatLon);
									break;
								}
							}
		
						}
					}
				}
				req.open('GET', 'searchJson/city.json');     //이 파일에서 찾겠다.
				req.send(null);
			};
		
      
         
         //----------------------------------------------------------
         
         
         //지도 중심 부드럽게 변경해주는 함수
         function panTo(moveLatLon) {
            map.panTo(moveLatLon);
         };
         
         
         
      
         
         
                            // 지도가,   '움직이면 함수실행',  움직인 좌표에 맞는 리스트 다시 가져옴
         kakao.maps.event.addListener(map, 'bounds_changed', getLl);
            
         
    
         //구직탭 클릭시----------------------------------------------------------
         
      
         $("#gujicTab").click(function(){
            tabchk = "2.2"; 
            var message = "2.2";
             $.ajax({
             url: "${pageContext.request.contextPath}/map1",
             type: "POST",
             data: message,
             contentType: "application/String",
             dataType: "json",
             success:  function(json) {
                     makeMarker(json);
                     getLl("2.2");
             },
             error: function(errorThrown) {
             console.log(errorThrown.statusText);
                }
            })     
          });
         
         
         //구인탭 클릭시----------------------------------------------------------   
         
         
         $("#guinTab").click(function(){
            guinStart();
          });
            
         
         //시작시 구인탭으로 시작하기 위해 빼놓음------------------------------------------
         
         
         function guinStart(){   
         tabchk = "1.1";    
         var message = "1.1";
          $.ajax({
          url: "${pageContext.request.contextPath}/map1",
          type: "POST",
          data: message,
          contentType: "application/String",
          dataType: "json",
          success:  function(json) {
                  makeMarker(json);
                  getLl("1.1");
          },
          error: function(errorThrown) {
          console.log(errorThrown.statusText);
             }
         })     
      };
         
         
                            
                            
      </script>
      
      
</html>