/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $('.popover.fade.top').remove();
    $(element).popover("hide");
    console.log("수정 이벤트 발생:");
    console.log(event);
    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    // 업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }

        eventModal.modal('hide');

// event.allDay = statusAllDay;
// event.title = editTitle.val();
// event.start = startDate;
// event.end = displayDate;
// event.type = editType.val();
// event.backgroundColor = editColor.val();
// event.description = editDesc.val();

        $("#calendar").fullCalendar('updateEvent', event);

        editData = {
        		_id: event._id,
        		allDay: statusAllDay,
        		title: editTitle.val(),
        		username: event.username,
        		start: startDate,
        		end: displayDate,
        		type: editType.val(),
        		backgroundColor: editColor.val(),
        		description: editDesc.val(),
        		textColor: '#ffffff'
        };
        data = JSON.stringify(editData);
        
        // 일정 업데이트
        $.ajax({
            type: "POST",
            url: contextPath+"/calendar/update",
            contentType: "application/json",
            data: data,
            success: function (response) {
                alert('수정되었습니다.')
//              DB연동시 중복이벤트 방지를 위한
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            },  
            error: function (errorThrown){
        		alert("실패:error");
        	}
        });

    });

    // 삭제버튼
    $('#deleteEvent').on('click', function () {
        $('#deleteEvent').unbind();
        $("#calendar").fullCalendar('removeEvents', [event._id]);
        eventModal.modal('hide');
        
        console.log("삭제할 아이디"+ event._id);
        deleteid = event._id;
        
        // 삭제시
        $.ajax({
            type: "POST",
            url: contextPath+"/calendar/delete",
            data: deleteid,
            contentType: "application/String",
            success: function (response) {
                alert('삭제되었습니다.');
            },
            error: function (errorThrown){
        		alert("실패:error");
        	}
        });
    });
};