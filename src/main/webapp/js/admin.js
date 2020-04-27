$( document ).ready( function(){
	
	//회원관리 페이지 로딩시 전체회원 표시
	var page = $("#page").val();
	console.log("page:"+page);
	$.ajax({
		url : contextPath+"/admin/userList/"+page,
		type : "GET",
		contentType : "application/json",
		success : function(data){
			$("#userList").html(data);
		}
	});
	
	//검색기능 
	$("#searchUser").click(function(){
		var title = $("#title option:selected").val();
		var content = $("#content").val();
		console.log(title+"/"+content);
		
		var data =
			{
				"title" : title,
				"content" : content
			}
		
		$.ajax({
			url : contextPath+"/admin/userList",
			type : "POST",
			data : JSON.stringify(data),
			contentType : "application/json",
			success : function(data){
				$("#userList").html(data);							
			}
		})
	})
	
	//체크박스 옵션
	//전체선택
	$(document).on("click", "#checkAll", function(){
		console.log("전체선택")
		if($("#checkAll").prop("checked")){
			$("input[type=checkbox]").prop("checked",true)
		}else{
			$("input[type=checkbox]").prop("checked",false)
		}
	})
	
	//개별선택후 경고주기
	$(document).on("click","#warning",function(){
		var array = new Array();		
		$("input:checkbox[id=check]:checked").each(function(){
			array.push($(this).val());
		});
		if(array.length>0){
			console.log(array);
			var data = 
						{
							"array" : array
						}
			$.ajax({
				url : contextPath+"/admin/warning",
				type : "POST",
				data : JSON.stringify(data),
				contentType : "application/json",
				dataType : "text",
				success : function(data){	
					
					/*alert("알럿");*/
					console.log("파싱후")
			   $("input:checkbox[id=check]:checked").each(function(){
				   console.log("함수실행")
				   var tr = $(this).parent().parent();
			       var td = tr.children();
			       console.log("파싱전");
			       var warning =  parseInt(td.eq(3).text());
			       
			       if(warning == 2){
			    	   alert(td.eq(1).text()+" 회원이 경고 3회로 탈퇴되었습니다.");
			    	   location.href=contextPath+"/admin/user/1";
			       }
			       else{
			    	   console.log("warning:"+warning);
			    	   td.eq(3).html(warning+1);
			       }
			       
				});
					  
				}
			        
			      });
		}else{
			alert("경고할 회원을 선택해주세요 ");
		}	
	})
	
	//관리자 회원탈퇴시키기
	$(document).on("click","#deleteUser",function(){
		console.log("탈퇴")
		
		var array = new Array();		
		$("input:checkbox[id=check]:checked").each(function(){
			array.push($(this).val());
		});
		
		if(array.length>0){

			//탈퇴유무 확인창
			var con_test = confirm(array+"님을 탈퇴시키시겠습니까?");
			
			if(con_test == true){
				var data = 
						{
							"array" : array
						}
				$.ajax({
					url : contextPath+"/admin/deleteUser",
					type : "POST",
					data : JSON.stringify(data),
					contentType : "application/json",
					dataType : "text",
					success : function(data){
						alert(data);
						location.href=contextPath+"/admin/user/1";
					}
				})	
			}else{
				alert("최소되었습니다.");
			}	
		}else{
			alert("탈퇴시킬 회원을 선택해주세요")
		}
			
	})
	
	//관리자 채팅
	$(document).on("click","#chat",function(){
		if($("input:checkbox[id=check]:checked").length > 1){
			alert("채팅신청은 한사람만 할 수 있습니다.");
		}else{
			var user = $("input:checkbox[id=check]:checked").val();
			var url = contextPath+ "/chat/"+user;
			 var name = "adminChat";
			 var option = "width = 466, height = 620, top = 100, left = 50, location = no, resize = no, scrollbars = no, toolbar = no, menubar = no";
			    var openWin = window.open(url, name, option);
		}
	})
	
})