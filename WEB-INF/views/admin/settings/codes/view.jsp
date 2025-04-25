<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<script>
$(function(){
	var id = "${codesVO.idCodes}";
	var result = "${result}";
	
	//DB에서 가져오는 값이 없으면
	if (id!=0){
		if (result=="noRecord"){
			alert("요청하신 내용이 존재하지 앖습니다");
			history.go(-1);
		}		
	}
});
</script>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
	<h1 class="h2">${codesVO.name } </h1> 
</div>

<div class="row mb-3">
	<div class="col-sm-4">코드</div>
	<div class="col-sm-8">
	${codesVO.idCodes } 
	</div> 
</div>  
<div class="row mb-3">
	<div class="col-sm-4">카테고리</div>
	<div class="col-sm-8">
	${codesVO.category1 } 
	</div> 
</div>  
<div class="row mb-3">
	<div class="col-sm-4">내용</div>
	<div class="col-sm-8">
	${codesVO.category2 } 
	</div> 
</div>  
<div class="row mb-3">
	<div class="col-sm-4">노출여부</div>
	<div class="col-sm-8">
	${codesVO.display_flag } 
	</div> 
</div>  
<div class="row mb-3">
	<div class="col-sm-4">사용여부</div>
	<div class="col-sm-8">
	${codesVO.use_flag } 
	</div> 
</div>  
  
      <hr class="my-4">

      <div class="col-md-12 text-center">
      	<button class="btn btn-primary btn-lg" type="button" onClick="modify();">수정</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="list();">목록</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="del();">삭제</button> 
      </div>
 
  </div>
</div>    

<form method="get" name="goForm" action="list">
<input type=hidden name="idCodes" value="${codesVO.idCodes }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sType2" value="${criteria.sType2}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
<input type="hidden" name="amount" value="${criteria.amount}">
</form>

<script>
function modify(){
	document.goForm.action="write";
	document.goForm.target="_self";
	document.goForm.submit();
}

function del(){
	if (confirm("삭제하시겠습니까?")){
		document.goForm.action="del";
		document.goForm.target="HiddenFrame";
		document.goForm.submit();	
	}
}

function list(){
	document.goForm.action="list";
	document.goForm.target="_self";
	document.goForm.submit();
}
</script>
