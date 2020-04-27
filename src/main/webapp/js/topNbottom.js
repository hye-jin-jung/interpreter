/*
 *top버튼 bottom버튼 스크립트
 */


	$(function() {
		
	        $("#TopButton").click(function() {		//top 클릭시
	            $('html, body').animate({
	                scrollTop : 0					
	            }, 400);
	            return false;
	        })
	        
	        var scrollHeight = $(document).height();	
	        $("#BottomButton").click(function() {    //bottom 클릭시
	            $('html, body').animate({
	                scrollTop : scrollHeight
	            }, 400);
	            return false;
	        })
	    });
 
 
 
	