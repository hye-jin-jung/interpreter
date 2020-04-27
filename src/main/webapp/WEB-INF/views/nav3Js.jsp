<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>      
        <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-switch.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
    <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
    <script src="${pageContext.request.contextPath}/assets/js/plugins/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
    <script src="${pageContext.request.contextPath}/assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
    <script>

    $(document).ready(function() {

      if ($("#datetimepicker").length != 0) {
        $('#datetimepicker').datetimepicker({
          icons: {
            time: "fa fa-clock-o",
            date: "fa fa-calendar",
            up: "fa fa-chevron-up",
            down: "fa fa-chevron-down",
            previous: 'fa fa-chevron-left',
            next: 'fa fa-chevron-right',
            today: 'fa fa-screenshot',
            clear: 'fa fa-trash',
            close: 'fa fa-remove'
          }
        });
      }

      function scrollToDownload() {

        if ($('.section-download').length != 0) {
          $("html, body").animate({
            scrollTop: $('.section-download').offset().top
          }, 1000);
        }
      }
      
      sessionChk()
    });
          
 
    //로그인 확인
    function sessionChk() {
       var id = "${sessionScope.myuserCode}";
       /* alert("??"); */
       console.log('id체크:' + id);
       if (id == '' || null || undefined || 0 || NaN){
          $('#username').hide();
         }else{
         console.log("로그인 됨"); 
         $('#ulmagin').hide();
       }
    };
      
      

 	   </script>
	</body>
</html>

