function writeCheck(){
	if(document.form.title.value == ""){
		alert("제목을 입력하세요.");
		document.form.title.focus();
		return false;
	}if(document.form.roadFullAddr.value == ""){
		alert("주소를 입력하세요.");
		document.form.roadFullAddr.focus();
		return false;
	}if(document.form.entX.value == ""){
		alert("주소를 입력하세요.");
		return false;
	}if(document.form.entY.value == ""){
		alert("주소를 입력하세요.");
		return false;
	}if(document.form.workStart.value == ""){
		alert("근무시작일을 입력하세요.");
		document.form.workStart.focus();
		return false;
	}if(document.form.workEnd.value == ""){
		alert("근무종료일을 입력하세요.");
		document.form.workEnd.focus();
		return false;
	}if(document.form.workTime.value == ""){
		alert("근무시간대를 입력하세요.");
		document.form.workTime.focus();
		return false;
	}if(document.form.job.value == ""){
		alert("업직종을 입력하세요.");
		document.form.job.focus();
		return false;
	}if(document.form.salary.value == ""){
		alert("급여를 입력하세요.");
		document.form.salary.focus();
		return false;
	}if(document.form.age.value == ""){
		alert("나이를 입력하세요.");
		document.form.age.focus();
		return false;
	}if(document.form.deadline.value == ""){
		alert("공고마감일을 입력하세요.");
		document.form.deadline.focus();
		return false;
	}if(document.form.content.value == ""){
		alert("내용을 입력하세요.");
		document.form.content.focus();
		return false;
	}
}