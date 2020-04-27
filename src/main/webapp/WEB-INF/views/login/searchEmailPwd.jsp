<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
     <div class="group">
         <input id="phone"  type="text" class="input join" placeholder="-없이 숫자로만 입력">
     </div>
     <div class="group">
     	<input type="button" id="send" class="button" value="인증번호 발송">
     </div>
     <div class="group">
         <input type="text" id="sendPoneCheck" placeholder="인증번호 확인" class="input join">     	
     </div>
     <div class="group">
      	<input type="button" id="SearchEmailPwd" class="button" value="다음">
     </div>
     <div class="hr"></div>
     
<script src="${pageContext.request.contextPath}/js/join.js" charset="UTF-8"></script>
