<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
  
<script type ="text/javascript" src ="/js/crypto/jsbn.js"></script>
<script type ="text/javascript" src ="/js/crypto/rsa.js"></script>
<script type ="text/javascript" src ="/js/crypto/prng4.js"></script>
<script type ="text/javascript" src ="/js/crypto/rng.js"></script>
 
<div class="mb-3 w-50 mx-auto" >

		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		  <h1 class="h2">로그인</h1> 
		</div>
   
		
		<form method="post" class="needs-validation" novalidate="" name="form" target="HiddenFrame" action="loginOk">
		<input type="hidden" name="manager_id" id="IDuserid">
		<input type="hidden" name="pw" id="IDpw"> 
	
		<div class="row mb-3">
			<div class="col-sm-4">아이디</div>
			<div class="col-sm-8">
			<input type="text" class="form-control" id="userid" minlength="4" maxlength="12" required value="">
		    <div class="invalid-feedback">정확한 아이디를 (4~12자 이내) 입력해주십시오</div>
			</div> 
		</div>  
			 
		<div class="row mb-3">
			<div class="col-sm-4">비밀번호</div>
			<div class="col-sm-8">
			<input type="password" class="form-control" id="pw" minlength="4" maxlength="12" required value="">
		    <div class="invalid-feedback"> 정확한 비밀번호를 (8자 ~ 20자 이내) 입력해주십시오</div>
			</div> 
		</div>
		   
		   <button id="loginBtn" class="w-100 btn btn-lg btn-primary" type="submit">확인</button> 
		   
		   <%--<ul class="list-inline text-center mt-5 mb-3 text-muted ">
		     <li class="list-inline-item"><a href="./join_form.jsp">회원가입</a></li>  
		     <li class="list-inline-item"><a href="./join_form.jsp">아이디/비번 찾기</a></li>   
		   </ul>--%>
		    
		 </form> 
</div>        
 
<script type = "text/javascript">
$(function(){  
	$("#userid").focus(); 

	$('#loginBtn').click(function(){
		var mem_id = $('#userid').val();
		var mem_pass = $('#pw').val();
		 
		var rsa = new RSAKey(); 
        rsa.setPublic("${RSAModulus}","${RSAExponent}");   
		//평문을 암호문으로 바꾸기
        $("#IDuserid").val(rsa.encrypt_b64(mem_id));
        $("#IDpw").val(rsa.encrypt_b64(mem_pass));
		//return false;
	}); 
});
</script>
 