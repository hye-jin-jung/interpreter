<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../navigator1.jsp" flush="true" />

<!-- �������� -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script src="${pageContext.request.contextPath }/js/function.js"></script>

<title>�� �� �� �� �� �� �� ��</title>


<style>
	#topAndBot {

		margin: 39% 30px 0px 0px;
		position: fixed;
		/* ��ư�� ��ġ ���� */
		right: 25px;
		/* x ��ġ �Է� */
		float: right;
		z-index: 999;
	}


	#buje {

		margin: -15px 30px 0px 5px;
		color: #b2b0b0;
		;
		font-weight: bold;
	}


	#headerr {
		margin: 20px 0px 10px 445px;
	}


	#bbomtitle {

		width: 1060px;
		color: #454545;
		font-weight: bold;
		border-bottom: 2px solid #E7E7E7;
		position: relative;

	}

	#bbomtitle,
	#bbomContent {

		margin: 20px 0px 10px 445px;
	}



	#bbomHit {
		font-size: 17px;
		margin: 0px 0px 10px 1415px;
	}



	.comment {

		margin: 400px 0px 10px 445px;
		width: 1060px;
		color: #454545;
		font-weight: bold;
	}

	#dat {
		margin: -10px 0px 10px 460px;
	}

	#commentList {

		margin: 0px 0px 0px 18px;
		width: 1060px;
	}


	#addComments {
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		background-color: transparent;
		border: 2px solid #989898;
		color: #66615b;
		font-family: sans-serif;
		font-size: 15px;
		width: 90px;
		height: 35px;
		margin-left: 500px;
	}

	#addComments:hover {
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		background-color: #989898;
		border: 2px solid #989898;
		color: #fdf9ec;
		font-family: sans-serif;
		font-size: 15px;
		font-weight: bold;
		width: 90px;
		height: 35px;
	}

	#editdel {
		margin-left: 965px;
		border-bottom-width: 10px;
		padding-bottom: 15px;
	}


	#blk {
		height: 2px;
		border-bottom: 1px solid #E7E7E7;
	}


	#ediAndDel {

		position: absolute;
		margin: -140px 0px 0px 1350px;

	}
</style>

<jsp:include page="../navigator2.jsp" flush="true" />


<div id="topAndBot">
	<a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
	<a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
</div>

<div id="blk"></div>
<section id="container">
	<div id="headerr">
		<br>
		<br>
		<a href="${pageContext.request.contextPath}/myBlog/bbomGeMain/${blogMaster}" style="text-decoration: none; color: black;"><h2>�ϸδ� �˰� BBomGe
		</h2></a>
		<br>
		<div id="buje">������ �� �ϳ��� �� �˳��� �Խ���</div>
		<br>
		<br>
		<br>
		<br>
	</div>


	<form method="post" action="bbomGeModify" name="modifyfrm">

		<!-- �۹�ȣ -->
		<input type="hidden" id="showCode" name="showCode" value="${content.showCode}">
		<input type="hidden" id="writerAtc" name="writerAtc" value="${content.writerCode}">

		<div id="bbomtitle" style="display:flex;">
			<h3 style="padding-top: 10px; padding-bottom: 20px; padding-left: 20px;">${content.title}</h3>
			
			<c:if test="${sessionScope.blogMaster eq content.writerCode}">
				<div id="ediAndDel">
					<input id="editAtc" type="button" value="�����ϱ�">
					<button id="delAtc" type="button">�����ϱ�</button>
				</div>
			</c:if>
		</div>


		<div id="bbomHit">
			��ȸ��&nbsp;&nbsp; ${content.hit}
		</div>


		<div id="bbomContent">
			${content.contents}
		</div>

	</form>
</section>
</div>

<div class="comment">
	<form id="commentForm" name="commentForm" method="post">
		<input type="hidden" id="articleCode" name="articleCode" value="${content.showCode}"> <br> <br>
		<div>
			<div>
				<span><strong>Comments</strong></span> <span id="cCnt"></span>
			</div>
			<div>
				<table class="table">
					<tr>
						<td>
							<textarea class="form-control" id="comments" name="comments" rows="3" style="width: 1050px"
								placeholder="����� �Է��ϼ���"></textarea>
							<br>
							<div id="dat">
								<input type="button" id="addComments" value="���" onclick="addComment()">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="container">
	<form id="commentListForm" name="commentListForm" method="post">
		<div id="commentList"></div>
	</form>
</div>

<script>

	$(window).load(function () {
		/*   alert('�ۼ���' + '${content.writerCode}'); */
		atcidcheck()
		getCommentList()
		sessionChk()
		$("#delAtc").click(function () {
			goDel();
		})
	});

	function goDel() {
		window.location.replace("${pageContext.request.contextPath}/myBlog/delete?showCode=${content.showCode}");
	}

	//�α��� Ȯ��
	function sessionChk() {
		var id = "${sessionScope.myuserCode}";
		/* alert("??"); */
		console.log('idüũ:' + id);
		if (id == '' || null || undefined || 0 || NaN) {
			$('#username').hide();
		} else {
			console.log("�α��� ��");
			$('#ulmagin').hide();

		}
	};



/* 	//���α� ����,������ư ����
	function atcidcheck() {
		var id = "${sessionScope.blogMaster}";
		var writer = $('#writerAtc').val();
		console.log('��α�����' + id);
		console.log('�ۼ�' + writer);
		if (id == writer) {
			$('#editAtc').show();
			$('#delAtc').show();
		} else {
			$('#editAtc').hide();
			$('#delAtc').hide();
		}
	}; */



	function bbomEdit() {
		document.modifyfrm.submit();
	};




	/* ��� ����ϱ�(Ajax)*/
	function addComment() {

		var id = "${sessionScope.myuserCode}";
		var comments = $('#comments');
		var commentVal = $('#comments').val();

		if (commentVal == '' || null || undefined || 0 || NaN) {
			alert('����� �Է��ϼ���.')
		} else {

			var articleCode = $('#articleCode');

			if (id == '' || null || undefined || 0 || NaN) {
				alert('�α��� �� �̿밡���մϴ�.')
			} else {

				var obj = {
					"articleCode": articleCode.val(),
					"comments": comments.val()
				};
				obj = JSON.stringify(obj);

				$.ajax({
					type: 'POST',
					url: '${pageContext.request.contextPath}/freeboard/addComment',
					data: obj,
					contentType: "application/json",
					success: function (data) {
						if (data == "success") {
							getCommentList();
							$("#comment").val("");
						}
					},
					error: function (request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
					}

				})
			}
		}
	};


	/* ��� �ҷ�����(Ajax)*/
	function getCommentList() {
		var articleCode = $('#articleCode');

		$
			.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath}/freeboard/commentList',
				dataType: "json",
				data: articleCode.val(),
				contentType: "application/String",
				success: function (data) {

					var html = "";
					var cCnt = data.length;

					if (data.length > 0) {
						var arr = new Array();
						for (i = 0; i < data.length; i++) {

							html += "<div>";
							html += "<div><table class='table'><h4><strong>"
								+ data[i].userCode + "</strong></h4>";
							html += "<div style='font-size: 15px;' id='comment" + [i] + "' value='" + data[i].num + "' >"
								+ data[i].comment
								+ "</div><tr><td></td></tr>";

							arr.push(data[i].userCode);
							for (var j = i; j < arr.length; j++) {
								var id = "${myuserCode}";
								var a = arr[j];
								console.log('�۾���' + id);
								console.log(a);
								if (id == a) {
									html += "<div id='editdel'><button id='edit"
										+ [i]
										+ "' type='button' name='"
										+ data[i].num
										+ "' value='"
										+ data[i].comment
										+ "' onclick='modifyCmt(this)'>����</button>";
									html += "<button id='del"
										+ [i]
										+ "' type='button' value='"
										+ data[i].num
										+ "' onclick='deleteCmt(this)'>����</button></div>";
									html += "</table></div>";
									html += "</div>";
									break;

								} else if (id != a) {
									html += "</table></div>";
									html += "</div>";
								}

							}

						}

					} else {

						html += "<div>";
						html += "<div><table class='table'><h6><strong>��ϵ� ����� �����ϴ�.</strong></h6>";
						html += "</table></div>";
						html += "</div>";

					}

					$("#cCnt").html(cCnt);
					$("#commentList").html(html);

				},
				error: function (request, status, error) {

				}

			});
	}

	/*�ڱⰡ �� ��۸� ���� ���� �� �� �ֵ��� Ȯ���ϴ� �Լ�*/
	function idcheck() {
		var id = "${myuserCode}";
		var a = $('.writer').val();
		console.log(id);
		console.log(a);
		if (id == a) {
			$('#edit').show();
			$('#del').show();
		} else {
			$('#edit').hide();
			$('#del').hide();
		}
	};

	//��� ���� ���� �Լ�
	function modifyCmt(e) {
		var comment = e.value; //��۳���
		var name = e.id; // �� ��ư�� id 
		var commentId = name.replace('edit', 'comment');

		var editSucessId = name.replace('edit', 'editSucess');
		var textareaId = name.replace('edit', 'textarea');
		$('#' + name).hide();
		$("#" + commentId).html(
			"<textarea id='test'>" + comment + "</textarea><button id='"
			+ editSucessId
			+ "' onclick='editSucess(this)'>���</button>");

	}

	//��� ���� �Ϸ� �Լ�
	function editSucess(e) {

		var newCmt = $('#test').val();//���� �ۼ��� ��� ����

		var str = e.id;
		var i = str.substring(10);
		var num = $('#del' + i).val();//���Ĺ�ȣ

		var obj = {
			"num": num,
			"comments": newCmt
		};
		obj = JSON.stringify(obj);
		var url = '${pageContext.request.contextPath}/freeboard/editComment';
		editDel(url, obj);
	}

	//��� ���� �Լ�
	function deleteCmt(e) {
		var num = e.value;//���Ĺ�ȣ

		var obj = {
			"num": num
		};

		obj = JSON.stringify(obj);
		var url = '${pageContext.request.contextPath}/freeboard/deleteCmt';
		editDel(url, obj);

	}

	function editDel(ajaxUrl, ajaxData) {

		$.ajax({
			type: 'POST',
			url: ajaxUrl,
			data: ajaxData,
			contentType: "application/json",
			success: function (data) {
				if (data == "success") {
					getCommentList();
					/* $("#comment").val(""); */
				}
			},
			error: function (request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
			}

		});

	}


</script>

<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<jsp:include page="../footer.jsp" flush="true" />
</body>

</html>