<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<script>
$(function(){
	var id = "${managerVO.idManager}";
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
  <h1 class="h2">관리자 보기 </h1> 
</div>

<div class="row mb-3">
	<div class="col-sm-4">그룹명</div>
	<div class="col-sm-8">
	${managerVO.managerGroupVO.group_name } 
	</div> 
</div>  
<div class="row mb-3">
	<div class="col-sm-4">아이디</div>
	<div class="col-sm-8">
	${managerVO.manager_id } 
	</div> 
</div>   
<div class="row mb-3">
	<div class="col-sm-4">이름</div>
	<div class="col-sm-8">
	${managerVO.name } 
	</div> 
</div>  
<div class="row mb-3">
	<div class="col-sm-4">등록일</div>
	<div class="col-sm-8">
	${managerVO.wdate } 
	</div> 
</div>  


<hr class="my-4">

<div class="col-md-12 text-center">
	<button class="btn btn-primary btn-lg" type="button" onClick="modify();">수정</button> 
	<button class="btn btn-secondary btn-lg" type="button" onClick="list();">목록</button> 
	<button class="btn btn-secondary btn-lg" type="button" onClick="del();">삭제</button> 
</div>
  

<form method="get" name="goForm" action="list">
<input type=hidden name="idManager" value="${managerVO.idManager }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
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
