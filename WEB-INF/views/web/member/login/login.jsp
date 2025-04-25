<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type ="text/javascript" src ="/js/crypto/jsbn.js"></script>
<script type ="text/javascript" src ="/js/crypto/rsa.js"></script>
<script type ="text/javascript" src ="/js/crypto/prng4.js"></script>
<script type ="text/javascript" src ="/js/crypto/rng.js"></script>

<div id="content">
  <div class="container">
    <ol class="breadcrumb">
      <li><img src="/images/ico_home.png" alt="홈"></li>
      <li>로그인</li>
    </ol>
    <div class="sub-top">
      <h1>로그인</h1>
      <a href="javascript:history.go(-1)" title="뒤로" class="go-back visible-xs"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
    </div>
    <!-- /.sub-top  -->
    <div class="sub-content">
      <div class="login-form">
        <h2 class="center hidden-xs"><img src="/images/txt_tit_login.png" alt="LOGIN"></h2>

        <section class="pull-left">
        <div class="tab-contents">
          <div class="tab-item" id="tab1">
	
			<form method="post" action="loginOk" class="needs-validation" novalidate="" name="form" target="HiddenFrame">
			<input type="hidden" name="user_id" id="IDuserid">
			<input type="hidden" name="pw" id="IDpw"> 
			<input type="hidden" name="referer" value="${referer }"/>
			
            <div class="form-group" id="login_form">
              <input type=text id="userid" minlength="4" maxlength="12" required class='form-control' 
              autocomplete='off' placeholder='아이디' tabindex=1> 
              <input type=password size='12' class='form-control' placeholder='비밀번호' tabindex=2
               id="pw" minlength="4" maxlength="12" required>
              <button type="button" class="btn dark" id="loginBtn">로그인</button>
            </div> 
<%--            <ul>--%>
<%--				<li>--%>
<%--					<span class="checkbox inline"> --%>
<%--					<label><input type="checkbox" name="autoLogin" value="Y" ${autoLogin}> 자동로그인</label>--%>
<%--					</span><span class="var"></span><a href="/web/member/login/findIdPwd">아이디/비밀번호 찾기</a>--%>
<%--				</li>--%>
<%--            </ul>--%>
            </form>
          </div>
        </div>

        </section>

      </div>
      <!-- /.login-form -->
    </div>
    <!-- /.sub-content -->
  </div>
  <!-- /.container -->
</div>
<!-- /#content -->


<script type = "text/javascript">
$(function(){ 
	$('#loginBtn').click(function(){
		var mem_id = $('#userid').val();
		var mem_pass = $('#pw').val();

		var str = EmptyChk(mem_id);
		if (str < 3) {
			alert("아이디를 입력하여 주십시오.");
			$('#userid').focus();
			return;
		}
		str = EmptyChk(mem_pass);
		if (str < 3) {
			alert("비밀번호를 입력하여 주십시오.");
			$('#pw').focus();
			return;
		}

		var rsa = new RSAKey(); 
        rsa.setPublic("${RSAModulus}","${RSAExponent}");      
		//평문을 암호문으로 바꾸기 
        //$("#IDuserid").val(rsa.encrypt(mem_id));
        //$("#IDpw").val(rsa.encrypt(mem_pass));
        $("#IDuserid").val(rsa.encrypt_b64(mem_id));
        $("#IDpw").val(rsa.encrypt_b64(mem_pass));
        document.form.submit();
	});
});
</script>

