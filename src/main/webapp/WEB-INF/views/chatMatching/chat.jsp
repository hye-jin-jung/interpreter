<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<% String sessionCode = (String)session.getAttribute("myuserCode"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href=".//assets/img//apple-icon.png">
  <link rel="icon" type="image/png" href=".//assets/img//favicon.png">
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
<style type="text/css">  
   html {overflow:hidden;}
   body {margin : 0 0 0 0;
   font-weight: 500;}
   #sendBt{
   color: #9e9e9e;
   width: 50px;
   text-align: center;
    padding: 2px;
    margin-top: 5px; 
   }
   #sendBt:hover{
   color: #383737;}
   *, ::after, ::before {
   }
	
   @-ms-viewport { width: device-width; } 
</style>     
<title>1:1채팅</title>
</head>
<body onload = "scrollChange()" onkeydown ="onKeyDown()">
    
    <div class="mesgs">
       <div class = "name">
          <span id = "name">${fromCode}</span>
       <c:if test="${fromCode != 'admin'}" >
              <button id = "matchingBt"></button>
             <button id = "roadMapBt"></button>
        </c:if>     
       </div>
          <div class="msg_history">
          <c:forEach var = "chat" items = "${oneChatVoList}" varStatus = "Loop">
            <c:if test="${sessionScope.myuserCode != chat.fromCode }">
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="${pageContext.request.contextPath}/imagefile/mini1.png" alt="sunil"> </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>${chat.chatContent}</p>
                  <span class="time_date">${chat.chatTime}</span></div>
              </div>
            </div>
           
            </c:if>
             <c:if test="${sessionScope.myuserCode == chat.fromCode}">
            
            <div class="outgoing_msg">
            <c:if test="${chat.readCheck =='1'}">
            	<span class = "readCheck">${chat.readCheck}</span>
            </c:if>
              <div class="sent_msg">
                <p>${chat.chatContent}</p>
                <span class="time_date">${chat.chatTime}</span> </div>
            </div>
            </c:if>
            </c:forEach>
           
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <c:if test="${fromCode != 'admin'}" >
              <input type="text" class="write_msg" id="messageinput" placeholder="Type a message" />
              <button type="button" id ="sendBt" class="btn btn-outline-dark btn-sm">send</button>
              </c:if>
            </div>
          </div>
        </div>
      
      
    

</body>
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
    <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>

   <script>
   var wsocket;
   var employeeCode = $("#anotherCode").val();
   
    $(document).ready(function(){
    	if(<%=sessionCode== null%>){
    		alert("로그인이 필요한 서비스입니다.");
    		window.open('', '_self', '');
    		window.close();
    	}
      wsocket = new WebSocket("ws://192.168.30.72:8080<c:url value='/echo'/>");
      wsocket.onmessage = onMessage;
      wsocket.onclose = onClose;
      wsocket.onopen = onOpen;
      
      $("#sendBt").click(function(){
    	  var message = "1" + $("#messageinput").val();
   	   	  if(message == "1"){
   		  	return ;
   	   	  }
   	  	  sendMessage(message);
          $("#messageinput").val('');
      });
      
      $("#matchingBt").click(function(){
         openChildMatching();
      });
      
      $("#roadMapBt").click(function(){
         openRoadMap();         
      });
       
   });
 
   /* 상대방접속시 읽음 체크  바꾸기*/
    function onReadCheck(){ 
	 /*   alert("gogogo"); */
    	var message = "3"; 
    	sendMessage(message);
   	}
	   
    function onKeyDown(){   
       if (event.keyCode == 13) {
    	   var message = "1" + $("#messageinput").val();
    	   if(message == "1"){
    		   return ;
    	   }
    	   sendMessage(message);
           $("#messageinput").val('');
    }   
   }; 
  
   function scrollChange(){
      var scrollH = $(".msg_history").prop('scrollHeight');
      $(".msg_history").scrollTop(scrollH)
   };
   
   function sendMessage(message){
      wsocket.send(message);      
   };
      
   function onOpen(e){
      console.log(e);
   /*    alert("소켓 연결"); */
      onReadCheck();
   };
            
   function onMessage(i){
      var f = i.data
      console.log(f);
      var e = JSON.parse(f)
      
      if(e.hasOwnProperty('readUser')){
    	  var readUser = e.readUser;
    	  if(readUser == "${sessionScope.myuserCode}"){
    		  $(".readCheck").html('');  
    	  }
      }else{      
      	var fromCode = e.fromCode;
      	var chatContent = e.chatContent;
     	var chatTime = e.chatTime;
      	var readCheck = e.readCheck;

      	var chatContents = "";

 	    if(fromCode == "${sessionScope.myuserCode}"){
    		chatContents = '<div class="outgoing_msg">';
       	 	if( readCheck != 0){
        		chatContents += '<span class = "readCheck">'+readCheck+'</span>';
         	}
        chatContents += '<div class="sent_msg"><p>'+ chatContent+'</p>';
        chatContents += '<span class="time_date">' +chatTime+ '</span></div></div>';  
          
          
      	}else if(fromCode == "${fromCode}"){
    		chatContents = '<div class="incoming_msg"><div class="incoming_msg_img">';
    		chatContents += '<img src="${pageContext.request.contextPath}/imagefile/mini1.png" alt="sunil"> </div>';
    		chatContents += '<div class="received_msg"><div class="received_withd_msg">';
    		chatContents += '<p>'+chatContent+'</p><span class="time_date">'+chatTime+'</span></div></div></div>';
      	}
    	       
    	$(".msg_history").append(chatContents);
      	scrollChange();
     }
   };
   
   function onClose(e){
   };
   
   function openChildMatching(){      
      var url = "${pageContext.request.contextPath}/matching/${employeeCode}";
      alert(url);
        var name = "matching";
        var option = "width = 600, height = 350, top = 100, left = 200, location = no"
        window.open(url, name, option);
   };
   
   function openRoadMap (){
      var url = "${pageContext.request.contextPath}/roadMap";
        var name = "readMap";
        var option = "width = 800, height = 600, top = 100, left = 200, location = no"
        window.open(url, name, option);
   };
   
</script>



</html>