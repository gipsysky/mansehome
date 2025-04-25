<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

     <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">코드 입력</h1>
      </div>

    <form method="post" target="HiddenFrame" action="writeOk" class="needs-validation" novalidate name="form"  >
    <input type=hidden name="idCodes" value="${codesVO.idCodes}">
    <input type=hidden name="display_num" value="${codesVO.display_num}">
	             
				
	<div class="row mb-3">
		<div class="col-sm-4">이름 <font color="red">*</font></div>
		<div class="col-sm-8">
		<input value="${codesVO.name }" type="text" class="form-control" id="name" name="name" required minlength="1">
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div> 
	</div>  
	<div class="row mb-3">
		<div class="col-sm-4">카테고리<font color="red">*</font></div>
		<div class="col-sm-8">
		<input value="${codesVO.category1 }" type="text" class="form-control" id="category1" name="category1" required minlength="1"
		${codesVO.idCodes eq '' ? '' : 'readonly' }>
		<BR>※ 카테고리는 최초 입력 후 변경이 불가합니다
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div> 
	</div>  
	<div class="row mb-3">
		<div class="col-sm-4">내용</div>
		<div class="col-sm-8">
		<input value="${codesVO.category2 }" type="text" class="form-control" id="category2" name="category2" > 
	    </div> 
	</div>  
	<div class="row mb-3">
		<div class="col-sm-4">노출여부</div>
		<div class="col-sm-8">
		            <div class="form-check">
		              <input ${codesVO.display_flag == "on" ? "checked" : "" } id="display_flag" name="display_flag" type="radio" class="form-check-input" value="on" checked >
		              <label class="form-check-label" for="display_flag">노출</label>
		            </div>
		            <div class="form-check">
		              <input ${codesVO.display_flag == "off" ? "checked" : "" } id="display_flag2" name="display_flag" type="radio" class="form-check-input" value="off" >
		              <label class="form-check-label" for="display_flag2">미노출</label>
		            </div>
			<BR>※ 프로그램설정에 따라 관리자 또는 사용자에 적용됨
		</div> 
	</div>  
	<div class="row mb-3">
		<div class="col-sm-4">사용여부</div>
		<div class="col-sm-8">
		            <div class="form-check">
		              <input ${codesVO.use_flag == "on" ? "checked" : "" } id="use_flag" name="use_flag" type="radio" class="form-check-input" value="on" checked >
		              <label class="form-check-label" for="use_flag">사용</label>
		            </div>
		            <div class="form-check">
		              <input ${codesVO.use_flag == "off" ? "checked" : "" } id="use_flag2" name="use_flag" type="radio" class="form-check-input" value="off">
		              <label class="form-check-label" for="use_flag2">미사용</label>
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
<input type=hidden name="idCodes" value="${codesVO.idCodes }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sType2" value="${criteria.sType2}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>
 


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

function ok(){
	if (document.form.display_flag.value==""){
		alert("노출여부를 선택해주세요");
		return;
	}
	if (document.form.use_flag.value==""){
		alert("사용여부를 선택해주세요");
		return;
	}
	document.form.submit();
}

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
</script>



