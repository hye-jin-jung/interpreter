<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
    <div class="group" >
        <input id="SearchEmail" type="email" name="email" class="input" placeholder="이메일 입력" required style="display:inline">
    </div>
    <div class="group"> 
    	 <input type="button" id="sendEmail" class="button" value="인증번호 발송" >
    </div>
    <div class="group">                      
        <input id="sendCheck" type="text" class="input" placeholder="인증번호 입력" required>
    	<input type="checkbox" id="emailConfirm" style="display:none">
    </div>
    <div class="group">
        <input type="button" id="SearchPwd" class="button" value="다음">
    </div>
    <div class="hr"></div>
