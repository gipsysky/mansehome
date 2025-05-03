<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${cnfVO.header_url ne null }">
<jsp:include page="${cnfVO.header_url }" flush="true">
	<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
	<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
</jsp:include>
</c:if>
 
<div class="board-write">
<table class="table">
<colgroup>
<col width="180px">
<col width="*">
</colgroup>
<tbody>

<form method="post" target="HiddenFrame" action="/web/board/data/writeOk" class="needs-validation" 
novalidate name="form" id="form" enctype="multipart/form-data" >
<input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf}"> 
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}"> 
<input type=hidden name="isReply" value="${isReply}"> 

<c:set var="textCnt" value="0"/>

<!-- 비회원 작성시 작성자명-->
<c:if test="${sessionScope.U_LOGIN ne 'Y' && auth_write eq 'true'}">
	<c:choose>
		<c:when test="${dataVO.idTbl_data eq null}">
			<tr>
				<th>
					작성자명
				</th>
				<td>
					<input name="fld1" type="text" class="form-control" maxlength=40 size=40 value="${dataVO.fld1 }"/>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<input name="fld1" type="hidden" class="form-control" maxlength=40 size=40 value="${dataVO.fld1 }"/>
		</c:otherwise>
	</c:choose>
</c:if>
<!-- /비회원 작성시 작성자명-->

<c:forEach items="${list }" var="listCnfFld" varStatus="status">

  <c:if test="${listCnfFld.fld_code ne '1' }">

	<c:set var="fldcode" value="fld${listCnfFld.fld_code }"/>
	<tr>
			<th>
				${listCnfFld.fld_name}
				<c:if test="${listCnfFld.required_fg eq 'Y'}">
					<font color="red">*</font>
				</c:if>					
			</th>
			<td> 
			
			  <div class="input-group" style="width:100%">
			
				<c:if test="${listCnfFld.prefix ne '' and listCnfFld.prefix ne null}">
				<span class="input-group-addon mx-3">${listCnfFld.prefix}</span>
				</c:if>
			
				<c:if test="${listCnfFld.fld_type eq 'txt_s'}">
					<input name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}" type="text" class="form-control"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
				</c:if>
				
				<c:if test="${listCnfFld.fld_type eq 'txt_l'}">
					<c:set var="textCnt" value="${textCnt+1}"/>
					<textarea id="ir${textCnt}" name="fld${listCnfFld.fld_code}" rows="${listCnfFld.fld_size}" class="form-control" style="width:100%">${dataVO[fldcode]}</textarea>
				</c:if>			 
				
				<c:if test="${listCnfFld.fld_type eq 'image'}">
					<input name="upfile" type="file" class="form-control"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
					<input type="hidden" name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}">
					<c:if test="${dataVO[fldcode] ne null}">
						<div><img src="${dataVO[fldcode]}" class="img-fluid"></div>
					</c:if>
			  	</c:if>  
				
				<c:if test="${listCnfFld.fld_type eq 'file'}">
					<input name="upfile" type="file" class="form-control"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
					<input type="hidden" name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}">
					 ${dataVO[fldcode]}
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
			  	
				<c:if test="${listCnfFld.fld_type eq 'date'}">
					<input name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}" type="text" class="form-control datepicker"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
				</c:if>
				
				<c:if test="${listCnfFld.suffix ne '' and listCnfFld.suffix ne null}">
				<span class="input-group-addon mx-3">${listCnfFld.suffix}</span>
				</c:if>
			  	 
			  </div> 
			
			</td>
	</tr> 

  </c:if>
</c:forEach>


	<c:if test="${cnfVO.captcha_use_fg eq 'Y'}">
		<tr>
			<th>
				보안 문자 입력
			</th>
			<td>
				<!-- CAPTCHA 이미지 -->
				<img src="${pageContext.request.contextPath}/web/etc/captcha.jpg" alt="CAPTCHA"><br>
				<input type="text" name="captchaInput" class="form-control">
			</td>
		</tr>
	</c:if>
	
<!-- 비밀번호-->
<c:if test="${sessionScope.U_LOGIN ne 'Y' && auth_write eq 'true'}">
	<c:choose>
		<c:when test="${dataVO.idTbl_data eq null}">
			<tr>
				<th>
					비밀번호
				</th>
				<td>
					<input name="pw" type="password" class="form-control" maxlength=20 size=40 value="${dataVO.pw }"/>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<input name="pw" type="hidden" class="form-control" maxlength=20 size=40 value="${dataVO.pw }"/>
		</c:otherwise>
	</c:choose>
</c:if>
<!-- /비밀번호-->

	
	<input type="hidden" name="upfile"><!-- 없으면 에러남 -->
	 
</form>
</tbody>
</table>

<div class="btn-box">
  <button type="button" class="btn dark" onClick="javascript:ok();">글작성</button>
  <c:if test="${dataVO.idTbl_data eq null }">
  <button type="button" class="btn line" onClick="javascript:cancel();">목록</button>
  </c:if>
  <c:if test="${dataVO.idTbl_data ne null }">
  <button type="button" class="btn line" onClick="javascript:history.go(-1);">취소</button>
  </c:if>
</div>  

<form method="get" name="goForm" action="view">
<input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf}">
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
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

	<c:if test="${sessionScope.U_LOGIN ne 'Y' && auth_write eq 'true' && dataVO.idTbl_data eq null && sessionScope.U_LOGIN ne 'Y'}">
		if (document.form.fld1.value == "")
		{
			alert("작성자명을 입력해주십시오");
			document.form.fld1.focus();
			return;
		}
		if (document.form.pw.value == "")
		{
			alert("비밀번호를 입력해주십시오");
			document.form.pw.focus();
			return;
		}
	</c:if>
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
		document.goForm.action="/web/board/data/view"; 
		document.goForm.submit();
	}else{
		document.goForm.action="/web/board/data/list"; 
		document.goForm.submit();
	}
}
</script>


	<!-- 파일 용량 체크 시작 -->
	<%@ page import="com.manse.common.Constants" %>
	<script>
		$(function() {
			const FILE_ALLOWED_MB = <%= Constants.FILE_ALLOWED_MB %>;
			const maxSize = FILE_ALLOWED_MB * 1024 * 1024; // 바이트 단위

			// 폼 제출 시 파일 크기 검사
			$('form').on('submit', function(e) {
				var isValid = true;
				$('input[type="file"]').each(function(index) {
					var file = this.files[0];
					if (file && file.size > maxSize) {
						alert('첨부하신 파일 중에서 10MB를 초과했습니다.');
						e.preventDefault();
						isValid = false;
						return false; // each 루프 중단
					}
				});

				return isValid;
			});
		});
	</script>
	<!-- 파일 용량 체크 끝 -->


      