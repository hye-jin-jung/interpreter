<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html>
<head>
	<meta http-equiv ="Content-Type" content = "text/html; charset=UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
 		src="https://code.jquery.com/jquery-2.2.4.min.js"
  		integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  		crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">
	<title>채팅목록</title>
</head>
<body>
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>${myuserCode}</h4>
            </div>
            
          </div>
          <div class="inbox_chat">

       </div>
	
<script type="text/javascript">

	function deleteBtHide(e){
		$("#delete" + e).hide();
	}
	
	function deleteBtShow(e){
		$("#delete" + e).show();
	}
	
	$(document).ready(function(){
		updateChatList();
		startAjax();	
	});	
		
	$(".deleteBt").hide();

	function updateChatList(){
		$.ajax({
			type : "POST",
		    url : "${pageContext.request.contextPath}/newChatList",
		    dataType: "json",
		    error : function() {
		    	alert('통신실패!!');
		    },
		    success : function(data) {
		        var newList = '';
 		        for(i = 0; i < data.newChatList.length; i++){
 		        	var newChat = data.newChatList[i];
		        	if(data.newChatList[i].myuserCode == data.newChatList[i].fromCode){
		        		var code = newChat.toCode;
		        	}else if(data.newChatList[i].myuserCode == data.newChatList[i].toCode){
		        		var code = newChat.fromCode;	
		        	}
		        	var chatContentResult = newChat.chatContent;
		        	var brIndex = chatContentResult.indexOf('<br/>');
		        	
		        	if(brIndex != -1){
		        		chatContentResult = chatContentResult.substring(0, brIndex) + '...';
		        	}
		        	
		        	if(chatContentResult.length >17){
		        		chatContentResult = chatContentResult.substring(0, 15) + '...';
		        	}
		        	newList += "<div class='chat_list' id = 'chat" + (i+1) + "' onmouseover = 'deleteBtShow(" + (i+1) + ")' onmouseout ='deleteBtHide("+ (i+1)+")'>";
		        	newList +="<span class = 'space'>space</span><button class = 'deleteBt' id = 'delete"+(i+1)+"' name = '"+ code; 
		 		    newList +="' value = '"+code+"' onclick='goDelete(this.name)'></button>";   	
		        	newList +="<div class='chat_people'>";
		        	newList +="<div class='chat_img'><img src='${pageContext.request.contextPath}/imagefile/mini2.png' alt='sunil' style='margin-top:5px;'> </div>";
		        	newList +="<div class='chat_ib' id = '"+ code + "' value = '"+code+"'onclick='goChat(this.id)'>";
		        	newList +="<h5>"+code+"<span class='chat_date'>" + newChat.chatTime + "</span></h5>";
		        	newList +="<div class = 'chatContent'>" + chatContentResult + "<span class = 'readCount'>" + newChat.readCheck + "</span></div></div></div></div>";
		        }
 		        $('.inbox_chat').html(newList);
 		   		$(".deleteBt").hide();
 		    }
		});
	}
	
	function startAjax(){
		setInterval(function(){updateChatList()}, 3000);
	}
		
	function goChat(e){
		var url = "${pageContext.request.contextPath}/chat/" + e;
	    var name = "chat";
	    var option = "width = 466, height = 620, top = 100, left = 50, location = no, resize = no, scrollbars = no, toolbar = no, menubar = no";
	    var openWin = window.open(url, name, option);
	}
		
	function goDelete(e){
		window.location.replace("${pageContext.request.contextPath}/delete/" + e);
	}
		
	</script>		
	<style>
	html {overflow:hidden;}
	</style>
</body>
</html>