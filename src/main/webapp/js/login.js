$( window ).load(function(){
	//비밀번호 찾기
	$.ajax({
		url : contextPath+"/login/searchPwd",
		type : "GET",
		dataType : "text",
		success : function(data){
			$(".for-pwd-htm").html(data);
		}
	});
})

$( window ).load(function(){
	//아이디 & 비밀번호 찾기
	$.ajax({
		url : contextPath+"/login/searchEmailPwd",
		type : "GET",
		dataType : "text",
		success : function(data){
			$(".for-email-htm").html(data);
		}
	});
})

	//엔터로 로그인
	function enter(){
		console.log("엔터이벤트")
		if(event.keyCode == 13){
			login();
		}
	};
	
	


	
	//로그인 회원 검증
	function login(){
		console.log("함수실행")
		var email = $("input[name=email]").val();
		var password = $("input[name=password]").val();
		console.log(email+"/"+password);
		
		var data = JSON.stringify(
				{
				"email" : email,
				"password" : password
			});
		console.log(data);
		$.ajax({
			url : contextPath +"/login/login",
			type : "POST",
			data : data,
			contentType : "application/json",
			dataType : "text",
			success : function(data){
				console.log("data :" + data);
				if(data == 0){
					 location.href=document.referrer;
				}else if(data == 1){
					alert("가입된 회원정보가 없습니다.")
				}else{
					alert("입력하신 정보를 다시 확인해주세요.")
				}
			}
		});
	};
	
$( document ).ready( function() {

	
	//아이디 기억하기
	
	//(아이디 입력후 체크박스 체크)
	var cookie = getCookie("key");
	console.log("쿠키:"+cookie);
	$("#email").val(cookie);
	
	//저장되어있는 쿠키가 있다면 '아이디기억하기'체크박스 기본표시
	if(cookie.length != 0){
		$("input:checkbox[id=emailSave]").attr("checked",true);
	}else{
		$("input:checkbox[id=emailSave]").prop("checked",false);
	}
	
	$("#emailSave").click(function(){
		if($("input:checkbox[id=emailSave]").is(":checked")){
			console.log("이메일:"+$("#email").val());
			setCookie("key",$("#email").val(),7); //7일동안 쿠키저장			
		//아이디 기억하기 해제시
		}else{
			deleteCookie("key");
		}
	})
	//(체크박스 먼저 체크후 아이디 입력)
	$("#email").keyup(function(){
		if($("input:checkbox[id=emailSave]").is(":checked")){
			setCookie("key",$("#email").val(),7); //7일동안 쿠키저장	
		}
	})
	
	//쿠키저장
	function setCookie(cookieName,value,exdays){
		console.log("쿠키저장");
		//만료일
		var exdate = new Date();
		exdate.setDate(exdate.getDate()+exdays);
		var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + 
			    exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
		console.log(cookieValue);
	}
	
	//쿠키 삭제
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}

	//쿠키 가져오기
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	
	//아이디 & 비밀번호 찾기 (인증번호 검사)
	$(document).on("click","#SearchEmailPwd",function(){
			console.log("검사 함수실행")
			var sendCheck = $("#sendPoneCheck").val();
			console.log(sendCheck);
			$.ajax({
				url : contextPath+"/login/CheckRanPhone",
				type : "POST",
				data : sendCheck,
				contentType : "application/String",
				success : function(data){
					console.log("data:"+data)
					if(data == 0){
						location.href=contextPath+"/login/searchEmailComplite";
						return true;
					}else{
						alert("인증번호를 다시한번 확인해주세요.")
						return false;
					}
				}
			});
		});	
	
	//비밀번호 찾기 (인증번호 검사)
	$(document).on("click","#SearchPwd",function(){
		console.log("검사 함수실행")
		var sendCheck = $("#sendCheck").val();
		console.log(sendCheck);
		$.ajax({
			url : contextPath+"/join/CheckRanEmail",
			type : "POST",
			data : sendCheck,
			contentType : "application/String",
			success : function(data){
				console.log(data)
				if(data == 0){
					location.href=contextPath+"/login/searchPwdComplite";
					return true;
				}else if(data == 1){
					alert("인증번호를 다시한번 확인해주세요.")
					return false;
				}else if(data == 2){
					alert("가입된 회원 정보가 없습니다.")
				}
			}
		});
	});	
	
	//이메일 전송
	$(document).on("click","#sendEmail",function(){
		var email = $("#SearchEmail").val();
		console.log("이메일 전송 :"+email);
		
		$.ajax({
			url : contextPath+"/login/sendEmail",
				type : "POST",
				data : email,
				contentType : "application/String",
				success : function(){
					alert("이메일 전송 완료.")
			}
		})
		
	})
})