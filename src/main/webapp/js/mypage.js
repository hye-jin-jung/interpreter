window.onload = function(){
	//수정 생략을 위한 checkbox 체크
	$('#emailConfirm').prop("checked",true);
	$('#usercodeConfirm').prop("checked",true);
	
	//비밀번호 변경페이지 submit활성화 설정
	$("#updatePwdBtn").attr('disabled','disabled');
}


//회원정보 수정
	function updateInfo(){
		console.log("업데이트 중복확인 체크확인");
		if ($("input:checkbox[id=usercodeConfirm]").is(":checked")) {
			console.log("중복체크 OK");
			//휴대폰번호 수정도 할 경우
			if($("#phone").val().length > 0){
				var bool = CheckRan();
				console.log("bool:"+bool);
				if (bool) {
					console.log("ran트루옴")
					var phone = $("#phone").val();
					console.log("휴대폰번호->"+phone);
					$("input:hidden[name=phone]").val(phone);
					console.log("true리턴");
					return true;
				} else {
					alert("인증번호를 확인해주세요");
					return false;
				}
			}	
		} else if ($("input:checkbox[id=usercodeConfirm]")
				.is(":checked") == false) {
			alert("닉네임 중복확인을 확인 해주세요.")
			console.log("false리턴");
			return false;
		}
		//생년월일만 수정시
		return true;
	}

	//발송된 인증번호 검사
	function CheckRan(){
		var ret = false;
		console.log("인증번호검사")
		//사용자가 입력한 인증번호
		var sendCheck = $("#sendCheck").val();
		$.ajax({
			url : contextPath+"/login/CheckRanPhone",
			type : "POST",
			data : sendCheck,
			contentType : "application/String",
			async: false,
			dataType : "text",
			success : function(data){
				console.log("data:"+data)
				if(data == 0){
					ret = true;
				}else{
					ret = false;
				}
			}
		});
		return ret;
	}
	
	//1:1문의 컨텐츠 view
	function QnaContent(e){
		console.log("함수실행");
		//특정문의글을 보여주기 위한 글번호
		var contentNum = e;
		console.log("글번호:"+contentNum);
		$.ajax({
			url : contextPath+"/mypage/myQnaContent?questionNo="+contentNum,
			type : "GET",
			dataType : "text",
			success : function(data){
				$("#content").html(data);
				return true;
			}
		})
	}

$( document ).ready( function() {
	//회원 비밀번호 일치 검증
	$("#pwdCheckBtn").click(function(){
		var password = $("#password").val();
		console.log("비밀번호:"+password);
		$.ajax({
			url : contextPath+"/mypage/checkPwd",
			type : "POST",
			data : password,
			contentType : "application/String",
			dataType : "text",
			success : function(data){
				console.log("data :" + data);
				if(data == 0){
					location.href=contextPath+"/mypage/updateInfo";
				}else if(data == 1){
					alert("가입된 회원정보가 없습니다.")
				}else{
					alert("입력하신 정보를 다시 확인해주세요.")
				}
			}
		});
	})
	

	//비밀번호 수정
	$("#updatePwdBtn").click(function(){
		console.log("업뎃함수실행");
		if(pwdCheck()){			
			var oldPwd = $("#oldpassword").val();
			var newPwd = $("#password1").val();
			var updateData =
						{
							"oldPassword" : oldPwd,
							"newPassword" : newPwd
						}
			console.log("updateData:"+updateData);
			$.ajax({
				url : contextPath+"/mypage/updatePwd",
				type : "POST",
				data : JSON.stringify(updateData),
				contentType : "application/json",
				dataType : "text",
				success : function(data){
					console.log("check :"+data)
					if(data ==0){
						location.href=contextPath+"/mypage/updatePwdComplite";
					}else{
						alert("현재 비밀번호를 다시 확인해주세요.")
					}
				}					
			})
		}	
	})
	
	//회원 탈퇴
	$("#deleteAccount").click(function(){
		//약관동의 확인
		if($("input:checkbox[id=check]").is(":checked")){
			console.log("회원탈퇴")
			var password = $("#password").val();
			console.log(password)
			$.ajax({
				url : contextPath+"/mypage/deleteAccount",
				type : "POST",
				data : password,
				contentType : "application/String",
				dataType : "text",
				success : function(data){
					console.log("check :"+data)
					if(data ==0){
						location.href=contextPath+"/mypage/deleteAccountComplite";
					}else{
						alert("현재 비밀번호를 다시 확인해주세요.")
					}
				}
			})
		}else{
			alert("약관에 동의해주세요.")
		}

	})
	
	
})

/*사이드바 js*/
$(window).resize(function() {
	var path = $(this);
	var contW = path.width();
	if(contW >= 751){
		document.getElementsByClassName("sidebar-toggle")[0].style.left="200px";
	}else{
		document.getElementsByClassName("sidebar-toggle")[0].style.left="-200px";
	}
});
$(document).ready(function() {
	$('.dropdown').on('show.bs.dropdown', function(e){
	    $(this).find('.dropdown-menu').first().stop(true, true).slideDown(300);
	});
	$('.dropdown').on('hide.bs.dropdown', function(e){
		$(this).find('.dropdown-menu').first().stop(true, true).slideUp(300);
	});
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		var elem = document.getElementById("sidebar-wrapper");
		left = window.getComputedStyle(elem,null).getPropertyValue("left");
		if(left == "200px"){
			document.getElementsByClassName("sidebar-toggle")[0].style.left="-200px";
		}
		else if(left == "-200px"){
			document.getElementsByClassName("sidebar-toggle")[0].style.left="200px";
		}
	});
});