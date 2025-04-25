<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
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

<c:forEach items="${list }" var="listCnfFld">
 
	<c:if test="${listCnfFld.fld_code ne '1' }"> 
	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-4">
				${listCnfFld.fld_name}
				<c:if test="${listCnfFld.required_fg eq 'Y'}">
					<font color="red">*</font>
				</c:if>					
			</div>
			<div class="col-sm-8">
			
			  <div class="input-group">
			
				<c:if test="${listCnfFld.prefix ne '' and listCnfFld.prefix ne null}">
				<span class="input-group-addon mx-3">${listCnfFld.prefix}</span>
				</c:if>
			
				<c:if test="${listCnfFld.fld_type eq 'txt_s'}">
					<input name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}" type="text" class="form-control"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
				</c:if>
				
				<c:if test="${listCnfFld.fld_type eq 'txt_l'}">
					<textarea name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}" class="form-control"   rows="${listCnfFld.fld_size}" ></textarea>
				</c:if>			 
				
				<c:if test="${listCnfFld.fld_type eq 'image'}">
					<input name="upfile" type="file" class="form-control"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
					<!-- 파일 업로드시 파일명 생성용 -->
					<input type="hidden" name="idCodes" value="${listCnfFld.idTbl_cnf_fld }">
					<input type="hidden" name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}">
					 ${dataVO[fldcode]}
			  	</c:if>  
				
				<c:if test="${listCnfFld.fld_type eq 'file'}">
					<input name="upfile" type="file" class="form-control"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
					<!-- 파일 업로드시 파일명 생성용 -->
					<input type="hidden" name="idCodes" value="${listCnfFld.idTbl_cnf_fld }">
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
			  	
				<c:if test="${listCnfFld.fld_type eq 'date' || listCnfFld.fld_type eq 'sdate' || listCnfFld.fld_type eq 'edate'}">
					<input name="fld${listCnfFld.fld_code}" value="${dataVO[fldcode]}" type="text" class="form-control datepicker"  maxlength="${listCnfFld.fld_size}"  size="${listCnfFld.fld_size + 2 }">
				</c:if>
				
				<c:if test="${listCnfFld.suffix ne '' and listCnfFld.suffix ne null}">
					<span class="input-group-addon mx-3">${listCnfFld.suffix}</span>
				</c:if>
			  	 
			  </div>
			
			</div> 
		</div> 
	</div>
	
	</c:if>
</c:forEach>
