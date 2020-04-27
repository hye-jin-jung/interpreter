<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/assets2/css/material-dashboard.css" rel="stylesheet"/>
<style>
	.dropdown-item {
		color: #000000;
	}
	
	.dropdown-item:hover {
		color: #ffffff;
		background-color: #1ABC9C !important;
	}

	.table {
		width: 60%;
		margin-left: auto;
		margin-right: auto;
	}
	
	.btn-outline-button {
		color: #1ABC9C;
		background-color: transparent;
		background-image: none;
		border-color: #1ABC9C;
		border-style: solid;
		border-width: 2px;
	}

	.btn-outline-button:hover {
		color: #ffffff;
		background-color: #1ABC9C;
		border-color: #1ABC9C;
	}
</style>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets2/img/favicon1.png">
<title>일맺다 관리자 페이지</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-info" style="background-color: #1ABC9C !important;">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index" target="_blank">일맺다</a>
			
			<div class="collapse navbar-collapse" id="navbar-info">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/user/1">회원관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/notice">공지사항 관리</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/qna">1:1 문의 관리</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" href="#pk" role="button" aria-haspopup="true" aria-expanded="false">광고 관리</a>
							<ul class="dropdown-menu dropdown-info" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/ad">광고 관리</a>
								<a class="dropdown-item" href="${pageContext.request.contextPath}/admin/adApp">광고 문의 관리</a>
							</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/LogOut">로그아웃</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="margin-top: 50px;">
	<form action="${pageContext.request.contextPath}/admin/ad/writeContent" method="post">
		<table class="table">
			<tr>
				<th style="width: 100px;"><label style="color: black;">닉네임</label></th>
				<td style="padding-left: 14px;">
					<input type="text" value="${content.userCode}" readonly="readonly" style="border: none; width:600px; height:30px; background-color:transparent;">
				</td>
			</tr>
<c:if test="${content.title != null}">
			<tr>
				<th style="width: 100px;"><label style="color: black;">제목</label></th>
				<td style="padding-left: 14px;">
					<input type="text" value="${content.title}" readonly="readonly" style="border: none; width:600px; height:30px; background-color:transparent;">
				</td>
			</tr>
</c:if>
<c:if test="${content.enterprise != null}">
			<tr>
				<th style="width: 100px;"><label style="color: black;">업체명</label></th>
				<td style="padding-left: 14px;">
					<input type="text" value="${content.enterprise}" readonly="readonly" style="border: none; width:600px; height:30px; background-color:transparent;">
				</td>
			</tr>
</c:if>
<c:if test="${content.image != null}">
				<tr>
					<th style="width: 100px;"><label style="color: black;">업체 로고</label></th>
					<td style="padding-left: 14px;">
					<img src="${pageContext.request.contextPath}/companyLogo/${content.image}">
					</td>
				</tr>
</c:if>
<c:if test="${content.phone != null}">
			<tr>
				<th style="width: 100px;"><label style="color: black;">연락처</label></th>
				<td style="padding-left: 14px;">
					<input type="text" value="${content.phone}" readonly="readonly" style="border: none; width:600px; height:30px; background-color:transparent;">
				</td>
			</tr>
</c:if>
<c:if test="${content.email != null}">
			<tr>
				<th style="width: 100px;"><label style="color: black;">이메일</label></th>
				<td style="padding-left: 14px;">
					<input type="text" value="${content.email}" readonly="readonly" style="border: none; width:600px; height:30px; background-color:transparent;">
				</td>
			</tr>
</c:if>
			<tr>
				<th style="width: 100px;"><label style="color: black;">건의사항</label></th>
				<td>
					<textarea cols="100" rows="10" readonly="readonly" style="border: none; background-color:transparent; overflow: auto; text-align: justify">${content.content}</textarea>
				</td>
			</tr>
			<tr>
				<td style="border: none;">
					<input type="hidden" name="pageNo" value="${content.pageNo}">
					<input type="hidden" name="adCategory" value="${content.adCategory}">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="left">
					<a href="${pageContext.request.contextPath}/admin/adApp" class="btn btn-outline-button btn-round">목록</a>
				</td>
				<td colspan="2" align="right">
					<input type="submit" class="btn btn-outline-button btn-round" value="광고글로 이동">
				</td>
			</tr>
			
		</table>
		
		</form>
	</div>

<%-- <button type="button" class="btn btn-outline-button btn-round" id="adButton" name="${content.pageNo}" value="${content.adCategory}" onclick="adMove(this)">광고글로 이동</button> --%>



<script>
	function adMove(ad) {
		var pageNo = ad.name;
		var adCategory = ad.value;
		alert(pageNo);
		alert(adCategory);
		
		var obj = {
				"pageNo": pageNo,
				"adCategory": adCategory
			}
		
		obj = JSON.stringify(obj);
		
		var url = '${pageContext.request.contextPath}/admin/ad/writeContent';
		adWrite(url, obj);
	}
	
	function adWrite(ajaxUrl, ajaxData) {
		$.ajax({
			type: 'POST',
			url: ajaxUrl,
			data: ajaxData,
			contentType: "application/json"
			
		});

	}
	
	
	
	
	
</script>







<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/assets2/js/core/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/js/core/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/js/core/bootstrap-material-design.min.js"></script>
<script src="${pageContext.request.contextPath}/assets2/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Plugin for the momentJs  -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/moment.min.js"></script>
<!--  Plugin for Sweet Alert -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/sweetalert2.js"></script>
<!-- Forms Validations Plugin -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/jquery.validate.min.js"></script>
<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/jquery.bootstrap-wizard.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/bootstrap-selectpicker.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/bootstrap-datetimepicker.min.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/jquery.dataTables.min.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/jquery-jvectormap.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/nouislider.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/arrive.min.js"></script>
<!-- Chartist JS -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/assets2/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/assets2/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/assets2/demo/demo.js"></script>

<!-- <script>
	$(document).ready(function() {
		if($("#datetimepicker").length != 0) {
			$('#datetimepicker').datetimepicker(
				{icons: {
					time: "fa fa-clock-o",
					date: "fa fa-calendar",
					up: "fa fa-chevron-up",
					down: "fa fa-chevron-down",
					previous: 'fa fa-chevron-left',
					next: 'fa fa-chevron-right',
					today: 'fa fa-screenshot',
					clear: 'fa fa-trash',
					close: 'fa fa-remove'
				}});
        }

		function scrollToDownload() {
			if ($('.section-download').length != 0) {
				$("html, body").animate({scrollTop: $('.section-download').offset().top}, 1000);
			}
		}
	});
</script> -->
    <!-- <script>
      $(document).ready(function() {

        // Facebook Pixel Code Don't Delete
        ! function(f, b, e, v, n, t, s) {
          if (f.fbq) return;
          n = f.fbq = function() {
            n.callMethod ?
              n.callMethod.apply(n, arguments) : n.queue.push(arguments)
          };
          if (!f._fbq) f._fbq = n;
          n.push = n;
          n.loaded = !0;
          n.version = '2.0';
          n.queue = [];
          t = b.createElement(e);
          t.async = !0;
          t.src = v;
          s = b.getElementsByTagName(e)[0];
          s.parentNode.insertBefore(t, s)
        }(window,
          document, 'script', '//connect.facebook.net/en_US/fbevents.js');

        try {
          fbq('init', '111649226022273');
          fbq('track', "PageView");

        } catch (err) {
          console.log('Facebook Track Error:', err);
        }

      });
    </script> -->
    <noscript>
      <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
    </noscript>
    <script>
      $(document).ready(function() {

        $sidebar = $('.sidebar');
        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

         if( window_width > 767 && fixed_plugin_open == 'Dashboard' ){
             if($('.fixed-plugin .dropdown').hasClass('show-dropdown')){
                 $('.fixed-plugin .dropdown').addClass('show');
             }
        
         }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-active-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('data-active-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-active-color', new_color);
          }
        });

        $('.fixed-plugin .background-color span').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').on("switchChange.bootstrapSwitch", function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });


        $('.switch-mini input').on("switchChange.bootstrapSwitch", function() {
          $body = $('body');

          $input = $(this);

          if (paperDashboard.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            paperDashboard.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              paperDashboard.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });

      });
    </script>
</body>
</html>