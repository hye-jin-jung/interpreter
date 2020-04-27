<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#imgDiv {
	float: left;
	width: 90px;
}

#commDiv {
	width: 800px;
	float: left;
	margin: -25px 0px 0px 120px;
	text-align: left;
}

#imgComm {
	width: 30px;
	padding-bottom: 50px;
}

.card {
	top: 50px;
	left: 250px;
	right: 0px;
	width: 1500px;
	height: 770px;
}

</style>



<!-- 마이페이지 1:1문의 컨텐츠내용 -->
<div style="margin-top: 50px;">
			<!-- 내용 -->
			<table class="table">
				<tr>
					<th style="width: 100px;"><label style="color: black;">제목</label></th>
					<td style="padding-left: 14px;">
						<input type="text" name="title" value="${post[0].title}" readonly="readonly" style="border: none; width:600px; height:30px; background-color:transparent;">
					</td>
				</tr>
				<tr>
					<th style="width: 100px;"><label style="color: black;">작성자</label></th>
					<td style="padding-bottom: 3px; padding-left: 14px;">
						<textarea name="content" cols="100" rows="1" readonly="readonly" style="border: none; background-color:transparent; overflow: auto; text-align: justify">${post[0].writerCode}</textarea>
					</td>
				</tr>
				<tr>
					<th style="width: 100px;"><label style="color: black;">내용</label></th>
					<td style="padding-left: 14px;">
						<textarea name="content" cols="100" rows="10" readonly="readonly" style="border: none; background-color:transparent; overflow: auto; text-align: justify">${post[0].content}</textarea>
					</td>
				</tr>
		<c:if test="${post[0].complain != null}">   
				<tr>
					<th style="width: 100px;"><label style="color: black;">신고 회원</label></th>
					<td style="padding-left: 14px;">
						<textarea name="content" cols="100" rows="1" readonly="readonly" style="border: none; background-color:transparent; overflow: auto; text-align: justify">${post[0].complain}</textarea>
					</td>
				</tr>
		</c:if>
		<c:if test="${post[0].filePath != null}">
				<tr>
					<th style="width: 100px;"><label style="color: black;">첨부 파일</label></th>
					<td style="padding-left: 14px;">
					<c:forEach items = "${post}" var="p">
					<img src="${pageContext.request.contextPath}/adminQnA/${p.filePath}" style="padding-bottom: 50px;">
					</c:forEach>
					</td>
				</tr>
		</c:if>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/admin/qna'" class="button">
						<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/admin/qna/deleteContent?questionNo=${post[0].questionNo}'" class="button">
					</td>
				</tr>
			</table>
			
		<!-- 댓글 -->	
		<input type="hidden" id="questionNo" name ="questionNo" value="${post[0].questionNo}"/>
		<div class="container" >
			<form id="commentListForm" name="commentListForm" method="post">
				<div id="commentList">
	  			</div>
			</form>
	</div>
</div>

<script>
/*
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(document).ready(function(){
    
    getCommentList();
    
});
 
/*
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
	
	var questionNo = $("#questionNo").val();
	console.log(questionNo);
	
    $.ajax({
        type: 'POST',
        url : '${pageContext.request.contextPath}/admin/qna/commentList',
        data: questionNo,
        contentType: "application/String", //보내는 게시글 번호 타입
        dataType : "json", //받는 데이터 타입
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div id='imgComm'>"+
                    "<div id='imgDiv'><img src='${pageContext.request.contextPath}/image/message1.png'/style='width: 30px;'>&nbsp&nbsp" + data[i].writer + "&nbsp;:</div>"
                    +"<div id='commDiv'>"
                    + data[i].comment + "</div></div>"          
                    
                }
                
            } else {
                
                html += "<div style='margin-bottom: 70px;'>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error) {
            
       }
        
    });
}
</script>		
