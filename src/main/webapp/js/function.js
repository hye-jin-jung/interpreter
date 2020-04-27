
	//페이스북 공유하기
	function fb(){
		window.open(
				'https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 
						'facebooksharedialog',
						'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
				return false;
	}	

	
	//트위터 공유하기
	function twt(){
		window.open(
				'https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 
						'twittersharedialog', 
						'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
				return false;
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
	
