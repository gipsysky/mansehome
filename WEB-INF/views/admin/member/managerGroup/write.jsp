<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
  <h1 class="h2">관리자그룹 입력</h1> 
</div>

<div class="row g-5"> 
  <div class="col-md-12 col-lg-12"> 
    <form method="post" target="HiddenFrame" action="writeOk" class="needs-validation" novalidate name="form"  >
    <input type=hidden name="idManager_group" value="${managerGroupVO.idManager_group }">
      <div class="row g-3">

        <div class="col-6">
          <label for="category1" class="form-label">그룹명 <span class="text-muted">(필수)</span></label>
          <input type="text" class="form-control" id="group_name" name="group_name" required minlength="1" value="${managerGroupVO.group_name }">
          <div class="invalid-feedback">
            필수 정보입니다
          </div>
        </div> 
        <div class="col-6">
          <label for="name" class="form-label">그룹 코드 <span class="text-muted">(필수)</span></label>
          <input type="text" class="form-control" id="group_code" name="group_code" required minlength="1" value="${managerGroupVO.group_code }">
          <div class="invalid-feedback">
            필수 정보입니다
          </div>
        </div>  

        <div class="col-6">
          <label for="display_flag" class="form-label">노출 여부 </label>
         <div class="form-check">
           	<input id="display_flag" name="display_flag" type="radio" class="form-check-input" value="Y" 
           	${managerGroupVO.display_flag == "Y" ? "checked" : "" }>
           <label class="form-check-label" for="display_flag">이용자에게 노출</label>
         </div>
         <div class="form-check"> 
           <input id="display_flag" name="display_flag" type="radio" class="form-check-input" value="N" 
           ${managerGroupVO.display_flag == "N" ? "checked" : "" }>
           <label class="form-check-label" for="display_flag2">이용자에게 미노출</label>
         </div>
        </div>  
 
        <div class="col-6">
          <label for="use_flag" class="form-label">사용 여부 </label> 
         <div class="form-check">
           <input id="use_flag" name="use_flag" type="radio" class="form-check-input" value="Y" 
           ${managerGroupVO.use_flag == "Y" ? "checked" : "" }>
           <label class="form-check-label" for="use_flag">사용</label>
         </div>
         <div class="form-check">
           <input id="use_flag2" name="use_flag" type="radio" class="form-check-input" value="N"
           ${managerGroupVO.use_flag == "N" ? "checked" : "" }>
           <label class="form-check-label" for="use_flag2">미사용</label>
         </div>
        </div> 

      </div> 
      <hr class="my-4">

      <div class="col-md-12 text-center">
      	<button class="btn btn-primary btn-lg" type="button" onClick="javascript:ok();">확인</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="javascript:cancel();">취소</button> 
      </div>
    </form>
  </div>
</div>    

<form method="get" name="goForm" action="view">
<input type=hidden name="idManager_group" value="${managerGroupVO.idManager_group }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>
 


<script>
$(function(){
	var id = "${managerGroupVO.idManager_group}";
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
	var id = "${managerGroupVO.idManager_group}";

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



