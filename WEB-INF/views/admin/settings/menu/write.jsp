
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">코드 입력</h1>
</div>

<form method="post" target="HiddenFrame" action="writeOk" class="needs-validation" novalidate name="form"  >
	<input type=hidden name="idMenu" value="${menuVO.idMenu}">


	<div class="row mb-3">
		<div class="col-sm-4">메뉴명 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-8">
			<input value="${menuVO.menu_name }" type="text" class="form-control" id="menu_name" name="menu_name" required minlength="1">
			<div class="invalid-feedback">필수 정보입니다</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-sm-4">상위메뉴 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-8">
			<select class="form-control" id="parent_menu" name="parent_menu" required minlength="1">
				<c:forEach items="${codesVO }" var="list">
					<option value="${list.idCodes }" ${list.idCodes.equals(menuVO.parent_menu)? "selected":"" }>${list.name }</option>
				</c:forEach>
			</select>
			<div class="invalid-feedback">필수 정보입니다</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-sm-4">url <span class="text-muted">(필수)</span></div>
		<div class="col-sm-8">
			<input value="${menuVO.url }" type="text" class="form-control" id="url" name="url" required minlength="1">
			<div class="invalid-feedback">필수 정보입니다</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-sm-4">노출순서 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-8">
			<input value="${menuVO.display_num }" type="text" class="form-control" id="display_num" name="display_num" minlength="1">
			<div class="invalid-feedback">필수 정보입니다</div>
		</div>
	</div>

	<div class="row mb-3">
		<div class="col-sm-4">노출여부</div>
		<div class="col-sm-8">
			<div class="form-check">
				<input ${menuVO.display_flag == "Y" ? "checked" : "" } id="display_flag" name="display_flag" type="radio" class="form-check-input" value="Y" checked >
				<label class="form-check-label" for="display_flag">노출</label>
			</div>
			<div class="form-check">
				<input ${menuVO.display_flag == "N" ? "checked" : "" } id="display_flag2" name="display_flag" type="radio" class="form-check-input" value="N" >
				<label class="form-check-label" for="display_flag2">미노출 (권한 관리에만 사용 용도)</label>
			</div>
		</div>
	</div>

	<hr class="my-4">

	<div class="col-md-12 text-center">
		<button class="btn btn-primary btn-lg" type="submit" onClick="javascript:ok();">확인</button>
		<button class="btn btn-secondary btn-lg" type="button" onClick="javascript:cancel();">취소</button>
	</div>
</form>

<form method="get" name="goForm" action="view">
	<input type=hidden name="idMenu" value="${menuVO.idMenu }">
	<input type="hidden" name="pageNum" value="${criteria.pageNum }">
	<input type="hidden" name="sType" value="${criteria.sType}">
	<input type="hidden" name="sType2" value="${criteria.sType2}">
	<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>



<script>
	$(function(){
		var id = "${menuVO.idMenu}";
		var result = "${result}";

		//수정일 때, DB에서 가져오는 값이 없으면
		if (id!=0){
			if (result=="noRecord"){
				alert("요청하신 내용이 존재하지 앖습니다");
				history.go(-1);
			}
		}
	});

	function ok(){
		document.form.submit();
	}

	function cancel(){
		var id = "${menuVO.idMenu}";

		//수정일 때, DB에서 가져오는 값이 없으면
		if (id!=0){
			document.goForm.action="view";
			document.goForm.submit();
		}else{
			document.goForm.action="list";
			document.goForm.submit();
		}
	}
</script>



