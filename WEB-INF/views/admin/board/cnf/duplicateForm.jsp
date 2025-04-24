<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

     <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">게시판 복사 </h1>
      </div>

    <form method="post" target="HiddenFrame" class="needs-validation" novalidate name="form"  >
    <input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf}"> 
	<input type="hidden" name="tbl_skin" value="${cnfVO.tbl_skin }"/>
	<input type="hidden" name="tbl_web_skin" value="${cnfVO.tbl_web_skin }"/> 
	             
				
	<div class="row mb-3">
		<div class="col-sm-4">게시판명 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-8">
		<input type="text" class="form-control" id="name" name="tbl_name" required minlength="1">
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div> 
	</div>  	  
	  
 
      <hr class="my-4">

      <div class="col-md-12 text-center">
      	<button class="btn btn-primary btn-lg" type="submit" onClick="javascript:ok();">확인</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="javascript:document.location.href='list';">취소</button> 
      </div>
    </form>

<form method="get" name="goForm" action="view">
<input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>
 


<script>  
function ok(){
	if (document.form.tbl_name.value==""){
		alert("게시판명을 입력해주세요");
		return;
	} 
	document.form.action="/admin/board/cnf/duplicate";
	document.form.submit();
}  
</script>



