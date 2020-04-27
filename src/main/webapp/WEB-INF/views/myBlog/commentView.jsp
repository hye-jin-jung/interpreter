<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${hmlist}" var="hm">
	<div>
		<div>
			<table class="table">
				<h6>
					<strong>${hm.userCode}</strong>
				</h6>
				<div style="float: left; margin-top: 15px;">${hm.comment}</div>
				<div style="float: right; margin-top: 15px;">${hm.registDate}</div>
				
				<c:if test="${sessionScope.myuserCode eq hm.userCode}">
				<div style="float: right; margin-right: 10px;">
					<div style="float: right">
						<button type="button"  class="btn btn-info btn-round" onclick="deleteCmt()" style="background-color: #1ABC9C; border-color: transparent; box-shadow: none;"><i class="fas fa-trash-alt"></i>  삭제</button>
					</div>
					<div style="float: right">
						<button type="button" class="btn btn-info btn-round" data-toggle="modal" data-target="#myModal" style="background-color: #1ABC9C; border-color: transparent; box-shadow: none;"><i class="fas fa-edit"></i>  수정</button>
					</div>
				</div>
					<!-- Modal -->
					<div class="modal fade bd-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">댓글 수정하기</h5>
								</div>
								<div class="modal-body">

										<textarea style="width: 700px; margin-top: 15px;" rows="3" cols="30" id="cmtContent" name="cmtContent">${hm.comment}</textarea>
										<input type="hidden" id="cmtNum" name="${hm.num}" value="${hm.num}">

										<div>
											<div style="float: right;">
												<button type="button" class="btn btn-default btn-link" data-dismiss="modal">취소</button>
											</div>
											<div style="float: right;">
												<button type="button" class="btn btn-danger btn-link" onclick="modifyCmt()">수정</button>
											</div>
										</div>
										

								</div>
							</div>
						</div>
					</div>
				</c:if>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</c:forEach>

<script>

	//댓글 수정 함수
	function modifyCmt() {
		var comments = $("textarea#cmtContent").val();
		var num = $('#cmtNum').attr('name');
	
		var obj = {
			"num" : num,
			"comments" : comments
		};
		obj = JSON.stringify(obj);

		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/myBlog/modifyCmt',
			data : obj,
			contentType : "application/json",
			success : function(data) {
				if (data == "success") {
					window.location.reload()
					getCommentList();
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
	
		});
	
	}
	
	
	//댓글 삭제 함수
	function deleteCmt() {
		var num = $('#cmtNum').attr('name');
		/* alert(num); */
		
		var obj = {
				"num" : num
			};
		obj = JSON.stringify(obj);
		
		$.ajax({
			type : 'POST',
			url : '${pageContext.request.contextPath}/myBlog/deleteCmt',
			data : obj,
			contentType : "application/json",
			success : function(data) {
				if (data == "success") {
					getCommentList();
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
	
		});
	}
	
</script>