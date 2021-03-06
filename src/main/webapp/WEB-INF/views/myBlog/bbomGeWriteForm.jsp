<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script src="${pageContext.request.contextPath}/js/topNbottom.js" charset="UTF-8"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<style>
    body {
        background-color: #EAEAEA !important;
    }
    
    
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

    #mainimageblk {

        width: 100%;
        height: 106px;
        border-bottom: 1px solid #E7E7E7;

    }





    #navi {
        background-color: white;
        margin-top: -15px;
        width: 100%;
        height: 110px;
        margin: 0 auto;
        position: relative;
    }

    #navi ul {
        list-style: none;
        height: 40px;
        padding-top: 30px;
    }

    #navi ul li {
        display: inline;
        float: left;
        text-align: center;
        font-size: 20px;
    }

    #navi a,
    #navi a:visited {

        padding: 30px 0px 0px 33px;
        display: block;
        color: #262626;
        /* 글자색 */
        text-decoration: none;
        /* 밑줄 없음 */
        font-size: 15px;
    }


    #username {
        margin: 2px 0px 0px 417px;
    }


    #username ul {
        margin-top: 4px;
        list-style: none;
        height: 0px;
    }

    #username ul li {
        display: inline;
        float: left;
        text-align: center;
        font-size: 13px;
    }

    #username a,
    #username a:visited {
        padding: 0px 30px 0px 2px;
        display: block;
        color: #262626;
        /* 글자색 */
        text-decoration: none;
        /* 밑줄 없음 */
    }







   #navi .menu1 {
    margin: -10px 0px 0px 373px;
    position: absolute;
}


    #navi .menu2 {
        float: right;
        margin: -95px 0px 0px 1640px;
        position: absolute;
    }

    #username {
        position: absolute;
        top: 86px;
        left: 945px;

    }

    #logimage {

        position: absolute;
        margin: -50px 0px 0px -30px;

    }




    div .usercode {

        font-family-sans-serif: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans",
            sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        font-family-monospace: SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
        margin: -45px 0px 0px 41px;
        width: 300px;
        left: 1200px;
        font-size: 15px;
    }



	div .homelogo {
	    position: absolute;
	    margin-top: 7px;
	    margin-left: 245px;
	}

    #subBtn,
    #listBtn {
        background-color: #1ABC9C;
        color: #FFFFFF;
        border-color: #1ABC9C;
        box-shadow: none;
        margin: 20px 0px 0px 5px;
    }

    #subBtn:hover,
    #listBtn:hover {
        background-color: #048f74;
        color: #FFFFFF;
        border-color: #048f74;
        box-shadow: none;
    }
</style>









<script>




    $(document).ready(function () {
        sessionChk()

    });


    //로그인 확인
    function sessionChk() {
        var id = "${sessionScope.myuserCode}";
        /* alert("??");  */
        console.log('id체크:' + id);
        if (id == '' || null || undefined || 0 || NaN) {
            $('#username').hide();
        } else {
            console.log("로그인 됨");
            $('.menu2').hide();
        }
    };









    $(function () {
        $('#summernote').summernote(
            {
                placeholder: '내용을 입력하세요',
                lang: 'ko-KR',
                minHeight: 370,
                maxHeight: null,
                fontNames: ['맑은고딕', 'Arial', 'Arial Black',
                    'Comic Sans MS', 'Courier New',],
                fontNamesIgnoreCheck: ['맑은고딕'],
                focus: true,

                callbacks: {   //여기 부분이 이미지를 첨부하는 부분
                    onImageUpload: function (files) {
                        uploadSummernoteImageFile(files[0], this);
                    }
                }

            });

        /**
        * 이미지 파일 업로드
        */
        function uploadSummernoteImageFile(file, editor) {
            data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: "${pageContext.request.contextPath}/uploadSummernoteImageFile",
                contentType: false,
                processData: false,
                dataType: "json",
                success: function (data) {
                    //항상 업로드된 파일의 url이 있어야 한다.
                    /* alert(data);
                    alert(data.url); */
                    $(editor).summernote('insertImage', data.url);
                }
            });
        }

    })

</script>

<body>

   <div id="topAndBot">
   <a id="TopButton" href="#"><i class="fas fa-chevron-circle-up fa-2x "></i></a>
   <a id="BottomButton" href="#"><i class="fas fa-chevron-circle-down fa-2x "></i></a>
   </div>

    <div id="mainimageblk">
        <nav id="navi">

            <div class="homelogo">
                <a href='<c:url value="/index" />'><img src="${pageContext.request.contextPath}/imagefile/1.png"
                        name="select" style="margin-left: 35px;"></a>
            </div>

            <div class="menu1">
                <!-- 상단 메뉴 -->
                <ul>
                    <li><a href="<c:url value="/workerBoard/list" />">일프로게시판</a></li>
					<li><a href="<c:url value="/employerBoard/list" />">일나눔게시판</a></li>
                    <li><a href='<c:url value="/freeList" />'>자유게시판</a></li>
                    <li><a href='<c:url value="/map" />'>지도검색</a></li>
                    <li><a href='<c:url value="/noticeList" />'>고객센터</a></li>
                    <li><a href='${pageContext.request.contextPath}/myBlog/main/${myuserCode}'>마이블로그</a></li>
                </ul>
            </div>

            <div class="menu2">
                <!-- 로그인전 화면 -->
                <ul>
                    <li><a href='<c:url value="/join/step1" />'>회원가입</a></li>
                    <li><a href='<c:url value="/login/login" />'>로그인</a></li>
                </ul>
            </div>
        </nav>


        <div id="username">
            <!--로그인 후 회원창-->
            <img src="${pageContext.request.contextPath}/imagefile/mini2.png" id="logimage">
            <div id="aa">
                <div class="usercode"><b>${sessionScope.myuserCode}</b>님</div>
                <ul>
                    <li><a href='${pageContext.request.contextPath}/chatList" onclick="window.open(this.href,'팝업창','width=430,height=600'); return false;'>채팅
                        </a></li>
                    <li><a href='<c:url value="/mypage/mypageMain" />'>마이페이지</a></li>
                    <li><a href='<c:url value="/logout" />'>로그아웃</a></li>
                </ul>
            </div>
        </div>

    </div>


    <br>
    <br>
    <br>
    <br>
    <h2 style="margin-left:405px;">뽐게 글쓰기</h2>
    <br>
    <br>
    <br>

    <div style="width: 60%; margin: auto;">
        <form method="post" action="${pageContext.request.contextPath}/myBlog/write" onsubmit="return goWrite();">
            <input type="text" id="title" name="title" class="form-control form-control-success" style="width: 40%;"
                placeholder="제목을 입력하세요." required>
            <br> <br>
            <textarea id="summernote" name="content"></textarea>
            <input type="button" class="btn btn-success btn-round" id="listBtn" style="float: right;"
                onclick="location.href='${pageContext.request.contextPath}/myBlog/bbomGeMain/${blogMaster}' " value="목록으로">
            <input type="button" class="btn btn-success btn-round" id="subBtn" style="float: right;"
                onclick="goWrite(this.form)" value="글 작성">
        </form>
    </div>

    <script>
        function goWrite(frm) {
            var title = frm.title.value;
            var content = frm.content.value;

            if (title.trim() == '') {
                alert("제목을 입력해주세요");
                return false;
            }
            if (content.trim() == '') {
                alert("내용을 입력해주세요");
                return false;
            }
            frm.submit();
        }
    </script>
</body>

</html>