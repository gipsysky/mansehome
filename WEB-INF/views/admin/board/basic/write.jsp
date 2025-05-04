<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">${cnfVO.tbl_name }</h1>
</div>

<form method="post" target="HiddenFrame" action="writeOk"  name="form" enctype="multipart/form-data" >
<input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf}"> 
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}"> 
<input type=hidden name="isReply" value="${isReply}"> 

<c:set var="textCnt" value="0"/>

<c:forEach items="${list }" var="listCnfFld" varStatus="status"> 
	
  <c:if test="${listCnfFld.fld_code ne '1' }">
   
	<c:set var="fldcode" value="fld${listCnfFld.fld_code }"/> 
	
	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-4">
				${listCnfFld.fld_name}
				<c:if test="${listCnfFld.required_fg eq 'Y'}">
					<span style="color: red; ">*</span>
				</c:if>					
			</div>
			<div class="col-sm-8">
			
			<!-- 여기서부터 writeFormAjax.jsp 와 동일하게 유지 -->
			
			  <div class="input-group">
			
				<c:if test="${listCnfFld.prefix ne '' and listCnfFld.prefix ne null}">
				<span class="input-group-addon mx-3">${listCnfFld.prefix}</span>
				</c:if>
			
				<c:if test="${listCnfFld.fld_type eq 'txt_s'}">
					<input name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}" type="text" class="form-control"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
				</c:if>
				
				<c:if test="${listCnfFld.fld_type eq 'txt_l'}">
					<c:set var="textCnt" value="${textCnt+1}"/>
					<textarea id="ir${textCnt}" name="fld${listCnfFld.fld_code}" class="form-control" style="width:100%"  rows="${listCnfFld.fld_size}">${dataVO[fldcode]}</textarea>
				</c:if>			 
				
				<c:if test="${listCnfFld.fld_type eq 'image'}">
					<input name="upfile" type="file" class="form-control"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
					<input type="hidden" name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}">

					<c:if test="${dataVO[fldcode] ne null && dataVO[fldcode] ne ''}">
						<div><img src="${dataVO[fldcode]}" class="img-fluid"></div>
						<a href="javascript:;" onClick="delAttach('${listCnfFld.fld_code}')">삭제</a>
					</c:if>
			  	</c:if>  
				
				<c:if test="${listCnfFld.fld_type eq 'file'}">
					<input name="upfile" type="file" class="form-control" id="fld${listCnfFld.fld_code}"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
					<input type="hidden" name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}">
					<c:if test="${dataVO[fldcode] ne null && dataVO[fldcode] ne ''}">
						 ${dataVO[fldcode]}
						<a href="javascript:;" onClick="delAttach('${listCnfFld.fld_code}')">삭제</a>
					</c:if>
					
					<script>
						$(function() {
							//==========================================================================================
							// 폼 제출 시 파일 크기 검사
							//==========================================================================================

							const FILE_ALLOWED_MB = ${listCnfFld.fld_size};
							const maxSize = FILE_ALLOWED_MB * 1024 * 1024; // 바이트 단위

							$('form').on('submit', function(e) {
								var isValid = true;

								var file = $('#fld${listCnfFld.fld_code}')[0].files[0];
								if (file){
									if (file.size > maxSize) {
										alert('첨부하신 파일 중에서 10MB를 초과했습니다.');
										e.preventDefault();
										isValid = false;
									}
								} 
								return isValid;
							});
							//========================================================================================== 
						});
					</script>
			  	</c:if>
			  	
			  	<c:if test="${listCnfFld.fld_type eq 'checkbox' }">
			  		<c:forEach items="${listCnfFld.codesList }" var="codesList">
			  			<c:set var="customData" value="(${fn:replace(dataVO[fldcode],',','),(')})"/>
			  			<c:set var="customCode" value="(${codesList.idCodes })"/>
			  			
						<div class="form-check">
						  <input class="form-check-input ckin" type="checkbox" 
						  value="${codesList.idCodes }" id="chk${codesList.idCodes }"  
						  ${fn:contains(customData, customCode) ? "checked" : ""}>
						  <label class="form-check-label" for="chk${codesList.idCodes }">
						    ${codesList.name } 
						  </label>
						</div>
			  		</c:forEach>
			  		<input type="hidden" class="ckval" name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode] }">
			  	</c:if>
			  	
			  	<c:if test="${listCnfFld.fld_type eq 'radio' }">
			  		<c:forEach items="${listCnfFld.codesList }" var="codesList">
						<div class="form-check">
						  <input name="fld${listCnfFld.fld_code}" class="form-check-input" type="radio" 
						  value="${codesList.idCodes }" id="radio${codesList.idCodes}"  
						  ${codesList.idCodes == dataVO[fldcode] ? "checked" : ""}>
						  <label class="form-check-label" for="radio${codesList.idCodes}">
						    ${codesList.name }
						  </label>
						</div>
						&nbsp;&nbsp;
			  		</c:forEach>
			  	</c:if>
			  	
			  	<c:if test="${listCnfFld.fld_type eq 'dropdown' }">
					<select name="fld${listCnfFld.fld_code}" class="form-control">
					<option value="">선택하세요</option>
			  		<c:forEach items="${listCnfFld.codesList }" var="codesList">
						<option value="${codesList.idCodes }"  
						  ${codesList.idCodes == dataVO[fldcode] ? "selected" : ""}>
						  ${codesList.name }</option> 
			  		</c:forEach>
					</select>
			  	</c:if>
			  	
				<c:if test="${listCnfFld.fld_type eq 'date' || listCnfFld.fld_type eq 'sdate' || listCnfFld.fld_type eq 'edate'}">
					<input name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}" type="text" class="form-control --datepicker"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }" autocomplete="off" placeholder="YYYY-MM-DD 형태로만 입력 가능합니다">
				</c:if>
				
				<c:if test="${listCnfFld.suffix ne '' and listCnfFld.suffix ne null}">
				<span class="input-group-addon mx-3">${listCnfFld.suffix}</span>
				</c:if>
			  	 
			  </div>
			  	
			<!-- 여기까지 writeFormAjax.jsp 와 동일하게 유지 -->
			
			</div> 
		</div> 
	</div> 
	
  </c:if>
</c:forEach>

<c:if test="${cnfVO.captcha_use_fg eq 'Y'}">
	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-4">
				보안 문자 입력				
			</div>
			<div class="col-sm-8">
				<!-- CAPTCHA 이미지 -->
				<img src="${pageContext.request.contextPath}/web/etc/captcha.jpg" alt="CAPTCHA"><br>
				<input type="text" name="captchaInput" class="form-control">
			</div> 
		</div> 
	</div>  
</c:if>

<c:if test="${cnfVO.pw_use_fg eq 'Y' && cnfVO.idTbl_cnf eq null}">
	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-4">
				비밀번호				
			</div>
			<div class="col-sm-8">
				<input name="pw" type="password" class="form-control" maxlength=20 size=40 value="${dataVO.pw }"/>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${cnfVO.pw_use_fg eq 'Y' && cnfVO.idTbl_cnf ne null}">
	<input name="pw" type="hidden" class="form-control" maxlength=20 size=40 value="${dataVO.pw }"/> 
</c:if>
	
	<input type="hidden" name="upfile"><!-- 없으면 에러남 --> 

  <hr class="my-4">

  <div class="col-md-12 text-center">
  	<button class="btn btn-primary btn-lg" type="submit" onClick="javascript:ok();">확인</button> 
  	<button class="btn btn-secondary btn-lg" type="button" onClick="javascript:cancel();">취소</button> 
  </div>
   
</form>

<form method="post" name="goForm" action="view">
<input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf}">
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
<input type="hidden" name="pw" value="${dataVO.pw}">
<input type="hidden" name="fld_code" value="">
</form>
 
 
<script type="text/javascript">
//네이버 에디터 
var oEditors = []; 
</script>
<c:forEach begin="1" end="${textCnt}" varStatus="status">
	<script type="text/javascript">
	//네이버 에디터  
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir${status.index}",
		sSkinURI: "/js/smartEditor2/SmartEditor2Skin.html",
		fCreator: "createSEditor2",
		htParams: { fOnBeforeUnload : function(){}}
	});  
	</script>
</c:forEach>         


<script> 
function ok(){ 
	<c:forEach begin="1" end="${textCnt}" varStatus="status">
		oEditors.getById["ir${status.index}"].exec("UPDATE_CONTENTS_FIELD", []);
	</c:forEach> 
	// ↓ 이거는 jQuery submit 이벤트를 타지 않음!
	//document.form.submit();
	$("#form").trigger("submit");
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

<script>
$(function(){
	var id = "${codesVO.idCodes}";
	var result = "${result}";
	
	//수정일 때, DB에서 가져오는 값이 없으면
	if (id!=0){
		if (result=="noRecord"){
			alert("요청하신 내용이 존재하지 앖습니다");
			history.go(-1);
		}		
	}
});

function cancel(){
	var id = "${codesVO.idCodes}";

	//수정일 때, DB에서 가져오는 값이 없으면
	if (id!=0){
		document.goForm.action="view"; 
		document.goForm.submit();
	}else{
		document.goForm.action="list"; 
		document.goForm.submit();
	}
}

function delAttach(v){
	if (confirm("삭제하시겠습니까?")){
		document.goForm.fld_code.value=v;
		document.goForm.target="HiddenFrame";
		document.goForm.action="delAttach";
		document.goForm.submit();
		document.goForm.target="_self";
		document.goForm.action="view";
	}
}
</script>



      