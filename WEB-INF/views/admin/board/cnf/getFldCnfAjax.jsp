<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

	<input type="hidden" name="fld_code" value="${cnfFldVO.fld_code }">
	<input type="hidden" name="idTbl_cnf" value="${cnfFldVO.idTbl_cnf}">

	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-4">타입</div>
			<div class="col-sm-8">
			  <c:out value="${cnfFldVO.fld_type }"/> 
			  ${cnfFldVO.fld_code }
			</div> 
		</div>
		<div class="row mb-3">
			<div class="col-sm-4">필드명</div>
			<div class="col-sm-8">
			  <input name="fld_name" type="text" class="form-control"  value="${cnfFldVO.fld_name}">
			</div> 
		</div>
		<div class="row mb-3">
			<div class="col-sm-4">길이 / 파일크기(MB)</div>
			<div class="col-sm-8">
			  <input name="fld_size" type="text" class="form-control"  value="${cnfFldVO.fld_size}">
			</div> 
		</div> 
		<c:if test="${cnfFldVO.fld_type eq 'checkbox' or cnfFldVO.fld_type eq 'radio' or cnfFldVO.fld_type eq 'dropdown'}">
			<div class="row mb-3">
				<div class="col-sm-4">입력코드</div>
				<div class="col-sm-8">
				  <select name="codes_category1" class="form-control">
				  <option value="">카테고리를 선택하세요</option>
				    <c:forEach items="${codeCategory1Group }" var="code">
						<option value="${code.category1 }" ${code.category1 eq cnfFldVO.codes_category1 ? 'selected' :'' }>						
						${code.category1 }</option>
					</c:forEach>
				  </select>
				</div> 
			</div>
		</c:if> 
		<div class="row mb-3">
			<div class="col-sm-4">필수 여부</div>
			<div class="col-sm-8">			  
			  <div class="form-check-inline">
			  	  <input name="required_fg" type="radio" class="form-check-input"  value="Y" ${cnfFldVO.required_fg eq 'Y' ? 'checked' : ''} id="required_fg1">
			  	  <label for="required_fg1" class="form-check-label">예 </label>
			    </div> 
				  
				<div class="form-check-inline">	
			  	  <input name="required_fg" type="radio" class="form-check-input"  value="N" ${cnfFldVO.required_fg eq 'N' ? 'checked' : ''} id="required_fg2">
			  	  <label for="required_fg2" class="form-check-label">아니오 </label>
			  </div>
			</div> 
		</div> 
		<c:if test="${dataTotal eq 0 }">
			<div class="row mb-3">
				<div class="col-sm-4">암호화 여부</div>
				<div class="col-sm-8">			  
				  <div class="form-check-inline">
				  	  <input name="crypto_fg" type="radio" class="form-check-input"  value="Y" ${cnfFldVO.crypto_fg eq 'Y' ? 'checked' : ''} id="crypto_fg1">
				  	  <label for="crypto_fg1" class="form-check-label">예 </label>
				    </div> 
					  
					<div class="form-check-inline">	
				  	  <input name="crypto_fg" type="radio" class="form-check-input"  value="N" ${cnfFldVO.crypto_fg eq 'N' ? 'checked' : ''} id="crypto_fg2">
				  	  <label for="crypto_fg2" class="form-check-label">아니오 </label>
				  </div>
				</div> 
			</div>
		</c:if>
		<div class="row mb-3">
			<div class="col-sm-4">검색 선택항목</div>
			<div class="col-sm-8">
				<div class="form-check-inline">
					<input name="sword_fg" type="radio" class="form-check-input"  value="Y" ${cnfFldVO.sword_fg eq 'Y' ? 'checked' : ''} id="sword_fg1">
					<label for="sword_fg1" class="form-check-label">예 </label>
				</div>

				<div class="form-check-inline">
					<input name="sword_fg" type="radio" class="form-check-input"  value="N" ${cnfFldVO.sword_fg ne 'Y' ? 'checked' : ''} id="sword_fg2">
					<label for="sword_fg2" class="form-check-label">아니오 </label>
				</div>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-sm-4">별도검색 선택항목</div>
			<div class="col-sm-8">
				<div class="form-check-inline">
					<input name="search_fg" type="radio" class="form-check-input"  value="Y" ${cnfFldVO.search_fg eq 'Y' ? 'checked' : ''} id="search_fg1">
					<label for="search_fg1" class="form-check-label">예 </label>
				</div>

				<div class="form-check-inline">
					<input name="search_fg" type="radio" class="form-check-input"  value="N" ${cnfFldVO.search_fg eq 'N' ? 'checked' : ''} id="search_fg2">
					<label for="search_fg2" class="form-check-label">아니오 </label>
				</div>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col-sm-4">앞 표시말</div>
			<div class="col-sm-8">
			  <input name="prefix" type="text" class="form-control"  value="${cnfFldVO.prefix}">
			</div> 
		</div>
		<div class="row mb-3">
			<div class="col-sm-4">뒷 표시말</div>
			<div class="col-sm-8">
			  <input name="suffix" type="text" class="form-control"  value="${cnfFldVO.suffix}">
			</div> 
		</div> 
	</div> 	  