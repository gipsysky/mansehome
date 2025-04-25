<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

     <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">게시판 ${cnfVO.idTbl_cnf eq null ? "추가" : "관리" } <span>${cnfVO.idTbl_cnf eq null ? "" : cnfVO.tbl_name }</span></h1>
      </div>

    <form method="post" target="HiddenFrame" class="needs-validation" novalidate name="form"  >
    <input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf}">
	             
				
	<div class="row mb-3">
		<div class="col-sm-4">게시판명 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-8">
		<input value="${cnfVO.tbl_name }" type="text" class="form-control" id="name" name="tbl_name" required minlength="1">
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div> 
	</div>   
				
	<div class="row mb-3">
		<div class="col-sm-4">권한 설정 선택</div>
		<div class="col-sm-8">
			<select name="auth_code" class="form-control">
			<option value="">권한 설정을 선택해주세요</option>
			<c:forEach items="${authCodeList }" var="list">
			<option value="${list.idCodes }" ${list.idCodes eq cnfVO.auth_code ? 'selected':'' }>${list.name }</option>
			</c:forEach>
			</select>
		</div> 
	</div>  
				
	<div class="row mb-3">
		<div class="col-sm-4">댓글 사용</div>
		<div class="col-sm-8">
			<input type="radio" name="comment_fg" value="Y" id="comment_fg2" ${cnfVO.comment_fg eq 'Y'? 'checked' :''}> <label for="comment_fg2">사용</label>
			<input type="radio" name="comment_fg" value="N" id="comment_fg1" ${cnfVO.comment_fg eq 'N'? 'checked' :''}> <label for="comment_fg1">사용안함</label>
		</div> 
	</div>  
				
	<div class="row mb-3">
		<div class="col-sm-4">답글 사용</div>
		<div class="col-sm-8">
			<input type="radio" name="reply_fg" value="Y" id="reply_fg2" ${cnfVO.reply_fg eq 'Y'? 'checked' :''}> <label for="reply_fg2">사용</label>
			<input type="radio" name="reply_fg" value="N" id="reply_fg1" ${cnfVO.reply_fg eq 'N'? 'checked' :''}> <label for="reply_fg1">사용안함</label>
		</div> 
	</div>   
				
	<div class="row mb-3">
		<div class="col-sm-4">내 글만 읽기</div>
		<div class="col-sm-8">
			<input type="radio" name="private_fg" value="Y" id="private_fg2" ${cnfVO.private_fg eq 'Y'? 'checked' :''}> <label for="private_fg2">사용</label>
			<input type="radio" name="private_fg" value="N" id="private_fg1" ${cnfVO.private_fg eq 'N'? 'checked' :''}> <label for="private_fg1">사용안함</label>
			<div>※ 사용되면 비회원 글쓰기는 제한됩니다.</div>
		</div> 
	</div>
				
	<div class="row mb-3">
		<div class="col-sm-4">게시판 삭제금지</div>
		<div class="col-sm-8">
			<input type="radio" name="tbl_lock" value="N" id="tbl_lock1" ${cnfVO.tbl_lock eq 'N'? 'checked' :''}> <label for="tbl_lock1">삭제 가능</label>
			<input type="radio" name="tbl_lock" value="Y" id="tbl_lock2" ${cnfVO.tbl_lock eq 'Y'? 'checked' :''}> <label for="tbl_lock2">삭제 금지</label>
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div> 
	</div>  
 		
	<div class="row mb-3">
		<div class="col-sm-4">사용자 헤더(jsp)</div>
		<div class="col-sm-8">
		<input value="${cnfVO.header_url }" type="text" class="form-control" name="header_url">
		</div> 
	</div>

	<div class="row mb-3">
		<div class="col-sm-4">사용자 푸터(jsp)</div>
		<div class="col-sm-8">
			<input value="${cnfVO.footer_url }" type="text" class="form-control" name="footer_url">
		</div>
	</div>

	<div class="row mb-3">
		<div class="col-sm-4">웹 스킨(폴더명)</div>
		<div class="col-sm-8">
			<input value="${cnfVO.tbl_web_skin }" type="text" class="form-control" name="tbl_web_skin">
		</div>
	</div>

	<div class="row mb-3">
		<div class="col-sm-4">관리자 스킨(폴더명)</div>
		<div class="col-sm-8">
			<input value="${cnfVO.tbl_skin }" type="text" class="form-control" name="tbl_skin">
		</div>
	</div>


		<hr class="my-4">

      <div class="col-md-12 text-center">
      	<button class="btn btn-primary btn-lg" type="submit" onClick="javascript:ok();">확인</button> 
      	<c:if test="${cnfVO.idTbl_cnf ne '' && cnfVO.tbl_lock ne 'Y'}">
      		<button class="btn btn-secondary btn-lg" type="submit" onClick="javascript:del();">삭제</button>
      	</c:if> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="javascript:document.location.href='list';">목록</button> 
      </div>
    </form>

<form method="get" name="goForm" action="view">
<input type=hidden name="idTbl_cnf" value="${cnfVO.idTbl_cnf }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>
 


<script>
$(function(){
	var id = "${cnfVO.idTbl_cnf}";
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
	if (document.form.tbl_name.value==""){
		alert("게시판명을 입력해주세요");
		return;
	}

	var id = "${cnfVO.idTbl_cnf}";
	if (id=="")
		document.form.action="addCnf";
	else
		document.form.action="modCnf";
		
	document.form.submit();
} 

function del(){
	if (confirm("삭제하시면 게시판설정과 데이터가 모두 삭제됩니다. \n삭제하시겠습니까?")){
		document.form.action="delCnf";
		document.form.submit();
	}
}
</script>



