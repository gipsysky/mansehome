<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="content" class="request">
	<div class="container">


<form method="post" target="HiddenFrame" action="/web/board/data/writeOk" class="needs-validation"
novalidate name="form" id="form" enctype="multipart/form-data" >
<input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf}"> 
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}"> 
<input type=hidden name="isReply" value="${isReply}">



	<div class="top-title">
		<h2 data-aos="fade-left">Project Request</h2>
		<p data-aos="fade-left" data-aos-delay="100">24년째 꾸준히 성장하는 만세커뮤니케이션!<br>회사설립 2001년 02월부터 현재까지 꾸준히 성장하고 있습니다.</p>
		<div class="request-info" data-aos="fade-in" data-aos-delay="300">
			<ul>
				<li><span>TEL</span> 02-2088-2110</li>
				<li><span>H.P</span> 010-8822-1126</li>
				<li><span>MAIL</span> pm@manse.co.kr</li>
			</ul>
		</div>
	</div>

	<div class="form" data-aos="fade-down" data-aos-delay="400">
			<fieldset>
				<dl>
					<dt>어떤 프로젝트를 문의하고 싶으신가요?</dt>
					<dd class="check-group">
						<p>비즈니스 영역에 따라 담당자가 확인 후 빠른 회신 드리겠습니다.</p>
						<c:forEach items="${list}" var="listCnfFld" varStatus="status">
							<c:set var="fldcode" value="fld${listCnfFld.fld_code}" />
							<c:if test="${listCnfFld.fld_type eq 'radio'}">
								<c:forEach items="${listCnfFld.codesList}" var="codesList" varStatus="codeStatus">
									<div class="radio">
										<input name="fld${listCnfFld.fld_code}" class="form-check-input" type="radio"
											   value="${codesList.idCodes}" id="radio${codesList.idCodes}"
										<c:choose>
										<c:when test="${not empty dataVO[fldcode]}">
											${codesList.idCodes == dataVO[fldcode] ? "checked" : ""}
										</c:when>
										<c:otherwise>
											   <c:if test="${codeStatus.first}">checked</c:if>
										</c:otherwise>
										</c:choose>
										>
										<label class="form-check-label" for="radio${codesList.idCodes}">
												${codesList.name}
										</label>
									</div>
								</c:forEach>
							</c:if>
						</c:forEach>
					</dd>

					<dt>프로젝트에 대해 이야기해주세요.</dt>
					<dd><textarea name="fld3" id="" cols="30" rows="20" class="form-control"></textarea></dd>
					<dd>
						<div class="row">
							<div class="col-12 col-md">
									<c:forEach items="${list }" var="listCnfFld" varStatus="status">
										<c:set var="fldcode" value="fld${listCnfFld.fld_code }"/>
										<c:if test="${listCnfFld.fld_type eq 'dropdown' }">
											<select name="fld${listCnfFld.fld_code}" class="form-control">
												<option value="">프로젝트 예산을 알려주세요.</option>
												<c:forEach items="${listCnfFld.codesList }" var="codesList">
													<option value="${codesList.idCodes }"
														${codesList.idCodes == dataVO[fldcode] ? "selected" : ""}>
															${codesList.name }</option>
												</c:forEach>
											</select>
										</c:if>
									</c:forEach>
							</div>
							<div class="col-12 col-md">
								<div class="file-upload">
									<input type="text" class="form-control upload-name" placeholder="">
									<label for="file1">파일첨부 <img src="/img/file_add.png" alt=""></label>
									<input type="file" name="upfile" id="file1" class="upload-hidden">
								</div>
								
								<script>
									$(function() {
										//==========================================================================================
										// 폼 제출 시 파일 크기 검사
										//==========================================================================================

										const FILE_ALLOWED_MB = ${list.get(7).fld_size}; // 소스 보고 파악해서 강제지정
										const maxSize = FILE_ALLOWED_MB * 1024 * 1024; // 바이트 단위

										$('form').on('submit', function(e) {
											var isValid = true;

											var file = $('#file1')[0].files[0];
											if (file){
												if (file.size > maxSize) {
													alert('첨부하신 파일 중에서 10MB를 초과했습니다.');
													e.preventDefault();
													isValid = false;
												}
											}
											if (!isValid){
												$(".okBut").show();
												$(".noBut").hide();
											}
											return isValid;
										});
										//==========================================================================================

										//파일찾기할 때마다 입력값 초기화
										$('#file1').on('click', function () {
											$(this).val('');
											$(this).parent().find('.upload-name').val("");
										});
									});
								</script>
							</div>
							<div class="col-12 col-md">
								<div class="file-upload">
									<input type="text" class="form-control upload-name" placeholder="">
									<label for="file2">파일첨부 <img src="/img/file_add.png" alt=""></label>
									<input type="file" name="upfile" id="file2" class="upload-hidden">
								</div>
								<script>
									$(function() {
										//==========================================================================================
										// 폼 제출 시 파일 크기 검사
										//==========================================================================================

										const FILE_ALLOWED_MB = ${list.get(2).fld_size}; // 소스 보고 파악해서 강제지정
										const maxSize = FILE_ALLOWED_MB * 1024 * 1024; // 바이트 단위

										$('form').on('submit', function(e) {
											var isValid = true;

											var file = $('#file2')[0].files[0];
											if (file){
												if (file.size > maxSize) {
													alert('첨부하신 파일 중에서 10MB를 초과했습니다.');
													e.preventDefault();
													isValid = false;
												}
											}
											if (!isValid){
												$(".okBut").show();
												$(".noBut").hide();
											}
											return isValid;
										});
										//==========================================================================================

										//파일찾기할 때마다 입력값 초기화
										$('#file2').on('click', function () {
											$(this).val('');
											$(this).parent().find('.upload-name').val("");
										});
									});
								</script>
							</div>
						</div>
					</dd>
					<dt>담당자를 소개해 주세요. </dt>
					<dd>
						<div class="row">
							<div class="col-12 col-md-6"><input type="text" name="fld2" placeholder="회사명" class="form-control"></div>
							<div class="col-12 col-md-6"><input type="text" name="fld1" placeholder="담당자 이름" class="form-control"></div>
							<div class="col-12 col-md-6"><input type="text" name="fld5" placeholder="연락처" class="form-control"></div>
							<div class="col-12 col-md-6"><input type="text" name="fld6" placeholder="이메일" class="form-control"></div>
						</div>
					</dd>
					<div class="checkbox">
						<input type="checkbox" class="comm_check" id="protect1" name="agree" value="Y"><label class="comm_check_label" for="protect1"><a href="#popPrivacy" rel="modal:open"><u>개인정보보호 정책</u></a>에 동의 합니다.</label>
					</div>
					<p style="padding-left: 1rem;padding-top: 5px;">※ 상담 신청하시면 1시간 이내로 신속히 상담해 드리겠습니다.</p>
				</dl>
				<div class="btn-box okBut">
					<button type="button" class="btn main line " onclick="javascript:ok();">상담 신청</button>
				</div>
				<div class="btn-box noBut" style="display:none">
					<button type=button class='btn main line' onclick="javascript:alert('처리중입니다');">처리중</button> 
				</div>
			</fieldset>

		<input type="hidden" name="upfile"><!-- 없으면 에러남 -->

	</div>
</form>
	</div>
</div>

<form method="get" name="goForm" action="view">
<input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf}">
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>
 

<script> 
function ok(){

	<c:if test="${sessionScope.U_LOGIN ne 'Y' && auth_write eq 'true' && dataVO.idTbl_data eq null && sessionScope.U_LOGIN ne 'Y'}">
	if (document.form.fld2.value == "")
	{
		alert("회사명을 입력해주십시오");
		document.form.fld2.focus();
		return;
	}
	if (document.form.fld1.value == "")
	{
		alert("담당자 이름을 입력해주십시오");
		document.form.fld1.focus();
		return;
	}
	if (document.form.fld5.value == "")
	{
		alert("연락처를 입력해주십시오");
		document.form.fld5.focus();
		return;
	}
	if (document.form.fld6.value == "")
	{
		alert("이메일을 입력해주십시오");
		document.form.fld6.focus();
		return;
	}
	if (document.form.fld3.value.length < 20) {
		alert("내용을 20자 이상 입력해주십시오");
		document.form.fld3.focus();
		return;
	}
	const agreeCheckbox = document.querySelector('input[name="agree"]');
	if (!agreeCheckbox.checked) {
		alert("개인정보보호 정책에 동의해 주세요.");
		return false; // 폼 제출 막기
	}

	//일단은 막아놓고, 이후 체크(파일크기, 보안문자 등)에서 걸리면 다시 submit할 수 있게 해제한다.
	$(".okBut").hide();
	$(".noBut").show();

	// ↓ 이거는 jQuery submit 이벤트를 타지 않음!
	//document.form.submit();
	$("#form").trigger("submit");
	</c:if>
}
$(function(){
	
	//fld_type이 checkbox 인 경우를 위한 부분
	$(".ckin").click(function(){
		var chkd = $(this).parent().parent().find("input.ckval").val();
		var chki = $(this).val();
		var chkt = $(this).prop("checked");
		var chkr = "";
		var chk = chkd.split(",");

		//중복을 제거
		for(var i=0;i<chk.length;i++){
			if (chk[i] != chki) {
				if (chkr!="") chkr = chkr + ",";
				chkr = chkr + chk[i];				
			}
		}
		
		//추가 시 새로운걸 맨 뒤에 추가 (삭제시는 위에서 중복제거한 그대로 두면 됨)
		if (chkt){	 
			if (chkr!="") chkr = chkr + ",";
			chkr = chkr + chki;
		}

		$(this).parent().parent().find("input.ckval").val(chkr);
	});
});
</script> 