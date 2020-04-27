 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <!-- footer  -->  <!-- 수현 푸터 적용 이상해져서 이거 씀 -->
  <div id="blkw"></div> 
  	<p style="text-align: center;">
    	<img src="${pageContext.request.contextPath}/imagefile/mini1.png"/>
  	</p><br>
	  <div class="footer">
	    (주)일맺다(대표: 김지영)  |  개인정보보호관리자: 김지영<br>     
	    서울 중구 남대문로 120 대일빌딩 2층  |    대표번호: 02-1544-9970 광고문의: 02-1544-9970<br>    
	    사업자등록: 138-87-00058  |  직업정보제공사업: J1200020160017 |  통신판매업: 2016-서울종로-00784<br>     
	    Copyright Anchoreer Co., Inc. All rights reserved.<br><br> 
  </div>   
        <!--   Core JS Files   -->
    <script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
    <script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
    <script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="./assets/js/plugins/bootstrap-switch.js"></script>
    <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
    <script src="./assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
    <!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
    <script src="./assets/js/plugins/moment.min.js"></script>
    <script src="./assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
    <!-- Control Center for Paper Kit: parallax effects, scripts for the example pages etc -->
    <script src="./assets/js/paper-kit.js?v=2.2.0" type="text/javascript"></script>
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
        
      
      });
            
 
      
 	   </script>

 