
	$("#plusCareer").click(function(){
		var check = '1';	
		editCareerForm(check);
	});
		
	$("#minusCareer").click(function(){
		var check = '0';	
		editCareerForm(check);
	});
		 
	$("#close").click(function(){
		window.location.replace(ajaxUrl);
	});
		 
	$("#submit").click(function(){
		submitCheck(); 
	});
	
	function editCareerForm(e){
		var editForm = '';
		var  num = $(".career").children().length;
	    if(e =='1'){
			editForm = '<li><div class="form-group has-success" style="float:left;"><div class = "birth" style="padding-top:10px;"><input type = "text" name = "company" class="form-control form-control-success join " placeholder = "회사명"></div>';
			editForm += '<div class = "birth" style="padding-top:15px;margin-left:10px;">재직시작일</div><div class = "birth"><select id = "firstStart'+ num +'" name = "year" class="form-control birthdate" style="margin:10px;"></select></div>';
			editForm +=	'<div class = "birth" style="margin-left:10px;"><select id = "secondStart' + num + '" name = "month" class="form-control birthdate" style="margin:10px;"></select></div>';
			editForm += '<div class = "birth" style="padding-top:15px;margin-left:20px;">재직종료일</div><div class = "birth"><select id = "firstEnd'+ num +'" name = "year" class="form-control birthdate" style="margin:10px;"></select></div>';
			editForm +=	'<div class = "birth"style="margin-left:10px;"><select id = "secondEnd' + num + '" name = "month" class="form-control birthdate" style="margin:10px;"></select></div><div></li>';
			$(".career").append(editForm);
			
			var targetYear = $("#firstStart"+ num);
			dateYear(targetYear);
			targetYear = $("#firstEnd"+ num);
			dateYear(targetYear);
			
			var targetMonth = $("#secondStart"+ num);
			dateMonth(targetMonth);
			targetMonth = $("#secondEnd"+ num);
			dateMonth(targetMonth);
	 	}else{
			 if($(".career").children().length != 0){
				$(".career").children().last().remove();		 	
		 	}
	 	}
 }

	 
	function submitCheck(){
		if($("#sido1").val().length == 0 || $("#gugun1").val().length == 0 || $("#contents").val().length == 0){
				alert("빈항목을 입력해주세요")
				if($("#sido1").val().length == 0){
					$("#sido1").focus();
				}else if($("#gugun1").val().length == 0){
					$("#gugun1").focus();
				}else{
					$("#contents").focus();
				}
				return ;
		}
		
		else{	
 			var adr = $("#sido1").val() + " " + $("#gugun1").val(); 
			$("input[name = workspace]").val(adr);
			
			var CareerList = new Array() ;
			
			var workspace = $("input[name = workspace]").val();
			var contents = $("#contents").val();
			
			var data = new Object();
			 
			data.userCode = thisuserCode;
	        data.category = thiscategory;
	        data.openCheck = thisopenCheck;  
	        data.workspace = workspace;
	        data.contents = contents;
			
	    	CareerList.push(data) ; 

	        var Csize = $(".career").children().length;
			
			if(Csize != 0){
				alert(Csize);	//지우기 
				for(var i=0 ; i< Csize; i++){
					var company = document.getElementsByName("company")[i].value;
					var start = $("#firstStart" + i).val() + "/" + $("#secondStart" + i).val() + "/01"; 
					var end = $("#firstEnd" + i).val() + "/" + $("#secondEnd" + i).val() + "/01";
					
					if(company == '' || $("#firstStart" + i).val() == '0' ||$("#secondStart" + i).val() == '0'||
							$("#firstEnd" + i).val() == '0' || $("#secondEnd" + i).val() == '0'){
						alert("경력사항 빈항목을 채워주세요");
						if(company == ''){
							document.getElementsByName("company")[i].focus();
						}else if($("#firstStart" + i).val() == '0'){
							$("#firstStart" + i).focus();
						}else if($("#secondStart" + i).val() == '0'){
							$("#secondStart" + i).focus();
						}else if($("#firstEnd" + i).val() == '0'){
							$("#firstEnd" + i).focus();
						}else if($("#secondEnd" + i).val() == '0'){
							$("#secondEnd" + i).focus();
						}
						return ;
					}		 
					console.log(company+start+end);
					var data = new Object();
					 
					data.company = company;
			        data.startDate = start;
			        data.endDate = end;  
			            
			        CareerList.push(data);// 리스트에 생성된 객체 삽입
				}		     		            
			} 
			submitSuccess(CareerList);
	 	}
	}
		
