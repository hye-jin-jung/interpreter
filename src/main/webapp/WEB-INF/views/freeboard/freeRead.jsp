<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 제이쿼리 -->
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script src="${pageContext.request.contextPath }/js/function.js"></script>
<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>

<title>일 맺 다 자 유 게 시 판</title>


   <style>
   
  	
	
      #topAndBot{
      
        position:fixed;
		width:175px;
		display:inline-block;
		right:0px; /* 창에서 오른쪽 길이 */
		top:94%; /* 창에서 위에서 부터의 높이 */
		background-color: transparent;
		margin:0;
		z-index: 999;
      
      }


      #buje {
      
         margin: -15px 30px 0px 5px;
         color : #b2b0b0;;
         font-weight: bold;
      }
   
      
      #freetitle {
      
         width: 1060px;
         color : #454545;
         font-weight: bold;
         border-bottom: 2px solid #E7E7E7;
         position:relative;
      }
      
      #freetitle,#freeContent, #userimage {
      
         margin: 20px 0px 10px 445px;
      }
      
      #freeWriter{
         font-size: 17px;
         margin: -40px 0px 10px 505px;
      }
      
      #freeRegdate {
         font-size: 17px;
         margin: -30px 0px 10px 1415px;
      }
   

      
      .comment {
      
         margin: 400px 0px 10px 445px;
         width: 1060px;
         color : #454545;
         font-weight: bold;
      }
   
      #dat{
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
         border : 2px solid #989898;
         color : #66615b;
         font-family:sans-serif;
         font-size: 15px;
         width: 90px;
         height: 35px;
         margin-left:500px;
      }
      
     #addComments:hover{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color:  #989898;
         border : 2px solid #989898;
         color : #fdf9ec;
         font-family:sans-serif;
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
      height : 2px;
      border-bottom: 1px solid #E7E7E7;
   }    
   
   #ediAndDel{
	
		position:absolute; 
		margin: -70px 0px 0px 1350px;
		
	}
   
   	 .nav-item a{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color: transparent;
         border : 2px solid #66615B;
         color : #66615B;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 88px;
         height: 40px;
         
      }
      
      .nav-item a:hover{         
         border-top-left-radius: 20px;
         border-top-right-radius: 20px;
         border-bottom-left-radius: 20px;
         border-bottom-right-radius: 20px;
         background-color:  #66615B;
         border : 2px solid #66615B;
         color : #fdf9ec;
         font-family:sans-serif;
         font-size: 12px;
         font-weight: bold;
         width: 88px;
          height: 40px;
       
      }
     .navbar-nav > li > a {
    	padding-top: 7px;
	}
	
	.navbar-nav{
		padding-top:20px;
		padding-left:360px;
		list-style:none;
	}
	.navbar-toggler{
		display:none;
	}
	
   
      .navbar-translate {
   
    margin-left: 35px;
    margin-bottom: 5px;
    
	}
	
	.navbar.navbar-transparent {
    box-shadow: none;
    color: black;
	}


	.navbar.navbar-transparent {
    /* background: transparent !important; */
    padding-top: 20px;
    box-shadow: none;
    color: black;
}

   
     #loginBtn{
      	width: 76px;
      	margin-left: 5px;
      }
   
   	    #headerr {
         margin: 20px 0px 10px 445px;
      }
   

	
	  #commentListForm {
	    margin-left: 50px;
	  }
		
	
   </style>
   
 <jsp:include page="../zxc20.jsp" flush="true"/>

   
   <div id="topAndBot">
   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
   </div>

      <section id="container">
         <div id="headerr">
            <br>
            <br>
            <a href="<c:url value="/freeList"/>" style="text-decoration: none;  color: black;"><h2>일맺다 자유게시판</h2></a>
            <br>
            <div id="buje">일프로 ㆍ 일나눔 ㆍ 소통을 위한 통합게시판</div>
            <br>
            <br>
            <br>
            <br>
         </div>
         
         
         <form method="post"
            action="${pageContext.request.contextPath}/delete/${freeBoardVo.freecode}"
            name="removefrm">
            
            <!-- 글번호 -->
            <input type="hidden" id="writercode" name="bno" value="${freeBoardVo.freecode}">
            
            <div id="freetitle">
               <h3 style="
                         padding-top: 10px;
                         padding-bottom: 20px;
                         padding-left: 20px;">
               ${freeBoardVo.title}</h3>
            </div>
            
            <c:if test="${myuserCode eq freeBoardVo.writercode}"> 
            <div id="ediAndDel">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
            <button id="editAtc">
               <a href="<c:url value="/edit/${freeBoardVo.freecode}" />">수정하기</a>
            </button>
             <button id="delAtc">
               <a href="<c:url value="/freeBoard/delete/${freeBoardVo.freecode}" />">삭제하기</a>
            </button>
            <!-- <input id="delAtc" type="button" value="삭제하기"
               onclick="removeCheck()"> -->
            </div>
            </c:if>
            
            
            <i id="userimage" class="fas fa-user-circle fa-3x"></i>
            
            <div id="freeWriter">
               <%-- <a> ${freeBoardVo.writercode} </a> --%>
               <td class="dropdown">
                                    <a href="#" class="dropdown-toggle" id="amit"
                                       data-toggle="dropdown" aria-haspopup="true"
                            		   aria-expanded="false">${freeBoardVo.writercode}</a>
                                 <ul class="dropdown-menu">
                                     <li><a href="${pageContext.request.contextPath}/myBlog/main/${list.writercode}">회원블로그</a></li>
                                     <li><a href="${pageContext.request.contextPath}/chat/${list.writercode}"
                                     onclick="window.open(this.href,'팝업창','width=466,height=620'); return false;">채팅하기</a></li>
                                     <li><a href="#" id="lover" onclick="lover('${myuserCode}', '${list.writercode}');" >찜하기</a></li>
                                     <li><a href="${pageContext.request.contextPath}/qnaStep1">신고하기</a></li>
                                  </ul>
                         </td> 
            </div>
            
            
            <div id="freeRegdate">
               ${freeBoardVo.regdate}
            </div>
        	<br><br>
         
            <div id="freeContent" style="margin-left:500px; width:1000px;">
               ${freeBoardVo.content}
            </div>
            
               
         </form>
      </section>
   </div>

   <div class="comment">
      <form id="commentForm" name="commentForm" method="post">
         <input type="hidden" id="articleCode" name="articleCode"
            value="${freeBoardVo.freecode}"> <br> <br>
         <div>
            <div>
               <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
               <table class="table">
                  <tr>
                     <td>
                     <textarea class="form-control" id="comments"  name="comments" rows="3" 
                     style="width: 1050px" placeholder="댓글을 입력하세요"></textarea>
                        <br>
                        <div id="dat">
                        <input type="button" id="addComments" value="등록" onclick="addComment()">
                     
                        </div></td>
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

   $(window).load(function() {
      getCommentList()
   });
 
 
   /* 댓글 등록하기(Ajax)*/
   function addComment() {
      
      var id = "${sessionScope.myuserCode}";
      var comments = $('#comments');
      var commentVal = $('#comments').val();
      
      if (commentVal == '' || null || undefined || 0 || NaN){
         alert('댓글을 입력하세요.')
        } else {
           
         var articleCode = $('#articleCode');
         
         if (id == '' || null || undefined || 0 || NaN){
            alert('로그인 후 이용가능합니다.')
           } else {
   
              var obj = {
            "articleCode" : articleCode.val(),
            "comments" : comments.val()
         };
         obj = JSON.stringify(obj);
   
         $.ajax({
            type : 'POST',
            url : '${pageContext.request.contextPath}/freeboard/addComment',
            data : obj,
            contentType : "application/json",
            success : function(data) {
               if (data == "success") {
                  getCommentList();
                  $("#comment").val("");
               }
            },
            error : function(request, status, error) {
               alert("code:" + request.status + "\n" + "message:"
                     + request.responseText + "\n" + "error:" + error);
            }
   
              })
           }
        }
   };

   
   /* 댓글 불러오기(Ajax)*/
   function getCommentList() {
      var articleCode = $('#articleCode');

      $
            .ajax({
               type : 'post',
               url : '${pageContext.request.contextPath}/freeboard/commentList',
               dataType : "json",
               data : articleCode.val(),
               contentType : "application/String",
               success : function(data) {

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
                           console.log('글쓴이' + id);
                           console.log(a);
                           if (id == a) {
                              html += "<div id='editdel'><button id='edit"
                                    + [ i ]
                                    + "' type='button' name='"
                                    + data[i].num
                                    + "' value='"
                                    + data[i].comment
                                    + "' onclick='modifyCmt(this)'>수정</button>";
                              html += "<button id='del"
                                    + [ i ]
                                    + "' type='button' value='"
                                    + data[i].num
                                    + "' onclick='deleteCmt(this)'>삭제</button></div>";
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
                     html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                     html += "</table></div>";
                     html += "</div>";

                  }

                  $("#cCnt").html(cCnt);
                  $("#commentList").html(html);

               },
               error : function(request, status, error) {

               }

            });
   }

   /*자기가 쓴 댓글만 수정 삭제 할 수 있도록 확인하는 함수*/
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

   //댓글 수정 시작 함수
   function modifyCmt(e) {
      var comment = e.value; //댓글내용
      var name = e.id; // 그 버튼의 id 
      var commentId = name.replace('edit', 'comment');

      var editSucessId = name.replace('edit', 'editSucess');
      var textareaId = name.replace('edit', 'textarea');
      $('#' + name).hide();
      $("#" + commentId).html(
            "<textarea id='test'>" + comment + "</textarea><button id='"
                  + editSucessId
                  + "' onclick='editSucess(this)'>등록</button>");

   }

   //댓글 수정 완료 함수
   function editSucess(e) {

      var newCmt = $('#test').val();//새로 작성한 댓글 내용

      var str = e.id;
      var i = str.substring(10);
      var num = $('#del' + i).val();//정렬번호

      var obj = {
         "num" : num,
         "comments" : newCmt
      };
      obj = JSON.stringify(obj);
      var url = '${pageContext.request.contextPath}/freeboard/editComment';
      editDel(url, obj);
   }

   //댓글 삭제 함수
   function deleteCmt(e) {
      var num = e.value;//정렬번호

      var obj = {
         "num" : num
      };

      obj = JSON.stringify(obj);
      var url = '${pageContext.request.contextPath}/freeboard/deleteCmt';
      editDel(url, obj);

   }

   function editDel(ajaxUrl, ajaxData) {

      $.ajax({
         type : 'POST',
         url : ajaxUrl,
         data : ajaxData,
         contentType : "application/json",
         success : function(data) {
            if (data == "success") {
               getCommentList();
               /* $("#comment").val(""); */
            }
         },
         error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:"
                  + request.responseText + "\n" + "error:" + error);
         }

      });

   }
   
   
</script>

	<style>
	
		    div .homelogo {
			    position: absolute;
			    margin: 16px 0px 0px -86px;
			}
	
	</style>


 <jsp:include page="../zxc30.jsp" flush="true"/>
</body>
</html>
