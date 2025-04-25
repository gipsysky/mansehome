<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<script>
$(function(){
	var id = "${managerGroupVO.idManager_group}";
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
  <h1 class="h2">${managerGroupVO.group_name } </h1> 
</div>

<div class="row g-5"> 
  <div class="col-md-12 col-lg-12"> 
      <div class="row g-3">
 
        <div class="col-12">
          <label for="name" class="form-label">그룹 코드 : </label>
          ${managerGroupVO.group_code } 
        </div>   

        <div class="col-12">
          <label for="display_flag" class="form-label">이용자에게 노출 :</label>
          <c:choose>
	          <c:when test="${managerGroupVO.display_flag.equals('Y') }">
	          	예
	          </c:when>
	          <c:otherwise>
	          	아니오
	          </c:otherwise>
          </c:choose> 
        </div>  

        <div class="col-12">
          <label for="display_flag" class="form-label">사용 여부 :</label>
          <c:choose>
	          <c:when test="${managerGroupVO.use_flag.equals('Y') }">
	          	예
	          </c:when>
	          <c:otherwise>
	          	아니오
	          </c:otherwise>
          </c:choose> 
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
<input type=hidden name="idManager_group" value="${managerGroupVO.idManager_group }">
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
