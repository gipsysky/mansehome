<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">관리자 입력</h1> 
      </div>

    <div class="row g-5"> 
      <div class="col-md-12 col-lg-12">  
	    <form method="post" target="HiddenFrame" action="writeOk" class="needs-validation" novalidate name="form"  >
	    <input type=hidden name="idManager" value="${managerVO.idManager}">
          <div class="row g-3">
			
            <div class="col-6">
              <label for="name" class="form-label">관리자 그룹 <span class="text-muted">(필수)</span></label>
 	 
				<select name="group_code" class="form-control" required>
					<option value="">선택하세요</option>
					<c:forEach items="${managerGroupList}" var = "list">
						<option value="${list.group_code }" ${list.group_code.equals( managerVO.group_code )? "selected" : "" }>${list.group_name }</option>
					</c:forEach>       
				</select>
							
              <div class="invalid-feedback">
                필수 정보입니다
              </div>
            </div>  
            <div class="col-6">
              <label for="manager_id" class="form-label">아이디 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="manager_id" name="manager_id" required minlength="1" value="${managerVO.manager_id }">
              <div class="invalid-feedback">
                필수 정보입니다
              </div>
            </div> 
            
            <c:if test="${managerVO.idManager eq null }">
            <div class="col-6">
              <label for="pw" class="form-label">비밀번호 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="pw" name="pw" required minlength="1" value="">
              <div class="invalid-feedback">
                필수 정보입니다
              </div>
            </div>
            </c:if>
            
            <c:if test="${managerVO.idManager ne null }">
            <div class="col-6">
              <label for="pw" class="form-label">비밀번호 </label>
              <input type="text" class="form-control" id="pw" name="pw" value="">
              <div class="invalid-feedback">
                필수 정보입니다
              </div>
            </div>
            </c:if>
            
            <div class="col-6">
              <label for="name" class="form-label">관리자명 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="name" name="name" required minlength="1" value="${managerVO.name }">
              <div class="invalid-feedback">
                필수 정보입니다
              </div>
            </div>  

          </div> 
          <hr class="my-4">

          <div class="col-md-12 text-center">
          	<button class="btn btn-primary btn-lg" type="submit" onClick="javascript:ok();">확인</button> 
          	<button class="btn btn-secondary btn-lg" type="button" onClick="javascript:cancel();">취소</button> 
          </div>
        </form>
      </div>
    </div>
     

<form method="get" name="goForm" action="view">
<input type=hidden name="idManager" value="${managerVO.idManager }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>
 


<script>
$(function(){
	var id = "${managerVO.idManager}";
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
	var id = "${managerVO.idManager}";

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



