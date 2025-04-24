<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  


<div id="content">
  <div class="container">
    <ol class="breadcrumb">
      <li><img src="/images/ico_home.png" alt="홈"></li>
      <li>마이페이지</li>
      <li>회원정보 수정</li>
    </ol>
    <div class="sub-top">
      <h1>마이페이지</h1>
      <a href="javascript:history.go(-1)" title="뒤로" class="go-back visible-xs"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
    </div>
    <!-- /.sub-top  -->
    <div class="sub-content">
      <h2 class="hidden-xs"><img src="/images/txt_tit_mypage.png" alt="마이페이지"></h2>
      <div class="mypage-wrap">

          <jsp:include page="../../operation/inc_menu.jsp" flush="true">
              <jsp:param name="pageGubun" value="edit"/>
          </jsp:include>

        <div class="join-form">
		
		<form name="frmJoin" method="post" action="/web/u/member/user/editOk">
		
          <h3>회원 정보 수정</h3>
          
          <table class="table table-bordered">
          <colgroup>
          <col width="170px">
          <col width="*">
          </colgroup>
          <tbody>
          <tr>
            <th><span>*</span>성명</th>
            <td>${userVO.name }</td>
          </tr>

<c:if test="${userVO.pw ne null}">
          <tr>
            <th><span>*</span>아이디</th>
            <td>${userVO.user_id }</td>
          </tr>
          <tr>
            <th><span>*</span>비밀번호</th>
            <td>
              <div class="form-group">
                <div class="col-xs-12 col-md-4"><input type=password name='pw' value='' size='15' maxlength='12' class='form-control'></div>
              </div>
            </td>
          </tr>
          <tr>
            <th><span>*</span>새 비밀번호</th>
            <td>
              <div class="form-group">
                <div class="col-xs-12 col-md-4"><input type=password name='pwd1' value='' size='15' maxlength='12' class='form-control'></div>
                <!--p class="help-block">4~8자 영문 대 소문자, 숫자, 특수문자를 사용해 주십시오.</p-->
				<p class="help-block">* 영문,숫자, 특수문자(().[]^{}|/_:!~`@$)를 혼합하여 8~12자를 입력해주세요.</p>
              </div>
            </td>
          </tr>
          <tr>
            <th><span>*</span>새 비밀번호 확인</th>
            <td>
              <div class="form-group">
                <div class="col-xs-12 col-md-4"><input type=password name='pwd2' value='' size='15' maxlength='12' class='form-control'></div>
              </div>
            </td>
          </tr>
</c:if>
					<tr>
						<th><span>*</span>성별</th>
						<td>
							<span class="radio inline"><label for="gender1"><input ${userVO.sex == 'M' ? 'checked' : '' } type="radio" name="sex" id="gender1" checked value="M">남성</label></span> &nbsp;&nbsp;
							<span class="radio inline"><label for="gender2"><input ${userVO.sex == 'F' ? 'checked' : '' } type="radio" name="sex" id="gender2"  value="F">여성</label></span>
						</td>
					</tr>
					<tr>
						<th><span>*</span>휴대폰번호</th>
						<td>	
              				<div class="form-group">				
                				<div class="col-xs-7 col-md-4"><input type=text name='htel' onKeyUp="checkNumber(this);"
                				value='${userVO.htel }' size='15' maxlength='12' class='form-control'></div>
                                <div class="col-xs-5 col-md-2"><button type="button" class="btn lightgray" onClick="htel_search();">중복확인</button></div>
                			</div>
						</td>
					</tr>
					<tr>
						<th><span>*</span>이메일</th>
						<td>
							<div class="form-group">
                				<div class="col-xs-12 col-md-4"><input type=text name='email' 
                				value='${userVO.email }' size='50' maxlength='50' class='form-control'></div>
							</div>
						</td>
					</tr>
					<tr>
						<th><span>*</span>주소</th>
						<td>
							<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;"><img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼"></div>
							<div class="form-group">
								<div class="col-xs-7 col-md-3"><input type=text name='wo' value='${userVO.wo }' size='6' maxlength='6' class='form-control' id=wo></div>
								<div class="col-xs-5 col-md-2"><button type="button" class="btn lightgray" onClick="openDaumPostcode('wo','address1');">우편번호찾기</button></div>
							</div>
							<div class="form-group">
								<div class="col-xs-12 col-md-7"><input type=text name='address1' value='${userVO.address1 }' size='60' maxlength='200' class='form-control' id=address1></div>
								<div class="col-xs-12 col-md-5"><input type=text name='address2' value='${userVO.address2 }' size='60' maxlength='200' class='form-control' style='ime-mode:active;'></div>
							</div>
						</td>
					</tr>
					<tr>
						<th>정보수신 동의</th>
						<td>
							<span class="checkbox inline"><label for="email_yn">
							<input type="checkbox" name="email_yn" id="email_yn" value="Y" ${userVO.email_yn eq 'Y' ? 'checked' :'' }>E-mail</label></span>
							<span class="checkbox inline"><label for="sms">
							<input type="checkbox" name="sms_yn" id="sms" value="Y" ${userVO.sms_yn eq 'Y' ? 'checked' :'' } >SMS</label></span>
							<span class="checkbox inline"><label for="push">
							<input type="checkbox" name="push_yn" id="push" value="Y" ${userVO.push_yn eq 'Y' ? 'checked' :'' } >PUSH</label></span>
							<p class="help-block">정보수신을 동의하시면 다양한 소식과 혜택을 가장 먼저 받아보실 수 있습니다. </p>
						</td>
					</tr>
          </tbody>
          </table>
          <div class="btn-box">
            <button type="button" class="btn dark" onClick="checkForm();">정보수정</button>
            <button type="button" class="btn line" onClick="document.frmJoin.reset();">취소</button>
            <button type="button" class="btn line" onClick="javascript:document.location.href='secession';">회원탈퇴</button>
          </div>
        </form>
				</div>
        <!-- /.join-form -->
      </div>
      <!-- /.mypage-wrap -->
    </div>
    <!-- /.sub-content -->
  </div>
  <!-- /.container -->
</div>
<!-- /#content -->


<script language=javascript> 
function checkForm(){
	var frm = document.frmJoin;
	/*
	if (EmptyChk(frm.pw.value) < 8) {
		alert("[비밀번호]는 공백없이 8자리 이상 입력되어야 합니다.");
		frm.pwd.focus();
		return;
	}
	*/

<c:if test="${userVO.pw ne null}">

	if (EmptyChk(frm.pwd1.value) > 0) {

		if (!chkPwd(frm.pwd1.value)) {
			frm.pwd1.value.focus();
			return;
		}

		if (EmptyChk(frm.pwd1.value) < 8) {
			alert("[비밀번호]는 공백없이 8자리 이상 입력되어야 합니다.");
			return;
		}
		if (frm.pwd1.value !== frm.pwd2.value) {
			alert("변경하실 [비밀번호]가 일치하지 않습니다.");
			return;
		}
	}
</c:if>

	if (frm.htel.value == "") {
		alert("[핸드폰번호]를 입력하세요.");
		frm.htel.focus();
		return;
	}
	if (frm.email.value == "") {
		alert("[이메일]을 입력하세요.");
		frm.email.focus();
		return;
	}
	if (frm.address1.value == "") {
		alert("[주소]를 입력하세요.");
		frm.address1.focus();
		return;
	}
	/*
	if (CheckEmailTail(frm.email.value) == false) {
		alert("[이메일] 형식이 맞지 않습니다."); 
		frm.email.focus();
		return;
	}
	*/
	frm.target="HiddenFrame";
	frm.submit();
}
function htel_search(){
    var htel = document.frmJoin.htel.value;
    if (htel != ""){
        window.open("/web/member/user/userExistChk?fld=hp&sword="+htel, "HiddenFrame");
    }
}
</script>