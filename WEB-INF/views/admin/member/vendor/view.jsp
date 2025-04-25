<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<script>
$(function(){
	var id = "${vendorVO.idVendor}";
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
		<h1 class="h2">공급사 상세 </h1> 
	</div>

 
	<div class="row mb-3">
		<div class="col-sm-2">그룹 </div>
		<div class="col-sm-4">
		${vendorVO.codesVO.name }
	    
		</div> 
 
		<div class="col-sm-2">상태</div>
		<div class="col-sm-4">
			${vendorVO.ven_status=="Y"?"진행중":"" }
			${vendorVO.ven_status=="N"?"중지":"" }
			${vendorVO.ven_status=="I"?"승인전":"" }
		</div> 
	</div>		
	<div class="row mb-3">
		<div class="col-sm-2">아이디 </div>
		<div class="col-sm-4">
		${vendorVO.ven_id }
	    
		</div>  
		<div class="col-sm-2">비밀번호 </div>
		<div class="col-sm-4">
		****
	    
		</div> 
	</div> 
	<div class="row mb-3">
		<div class="col-sm-2">회사명 </div>
		<div class="col-sm-4">
		${vendorVO.comp_name }
	    
		</div>  
		<div class="col-sm-2">대표자명 </div>
		<div class="col-sm-4">
		${vendorVO.comp_ceo_name }
	    
		</div> 
	</div>  
	<div class="row mb-3">
		<div class="col-sm-2">대표전화번호 </div>
		<div class="col-sm-4">
		${vendorVO.tel } 
		</div>  
		<div class="col-sm-2">팩스 </div>
		<div class="col-sm-4">
		${vendorVO.fax } 
		</div> 
	</div>  
	<div class="row mb-3">
		<div class="col-sm-2">업태 </div>
		<div class="col-sm-4">
		${vendorVO.uptae } 
		</div>  
		<div class="col-sm-2">업종</div>
		<div class="col-sm-4">
		${vendorVO.upjong } 
		</div> 
	</div> 
	  
	<div class="row mb-3">
		<div class="col-sm-2">사업자번호 </div>
		<div class="col-sm-4">
		${vendorVO.comp_num } 
		</div> 
		<div class="col-sm-2">홈페이지</div>
		<div class="col-sm-4">
		${vendorVO.homepage } 
		</div> 
	</div> 
	
	<div class="row mb-3">
		<div class="col-sm-2">주소</div>
		<div class="col-sm-4">
		${vendorVO.address1 } 
		</div> 
		<div class="col-sm-2">우편번호</div>
		<div class="col-sm-4">
		${vendorVO.wo } 
		</div> 
	</div>
	 
	<div class="row mb-3">
		<div class="col-sm-2">상세주소</div>
		<div class="col-sm-10">
		${vendorVO.address2 } 
		</div> 
	</div> 
	
	<div class="row mb-3">
		<div class="col-sm-2">담당자명</div>
		<div class="col-sm-4">
		${vendorVO.manager_name } 
		</div> 
		<div class="col-sm-2">담당자연락처</div>
		<div class="col-sm-4">
		${vendorVO.manager_htel } 
		</div> 
	</div>
	<div class="row mb-3">
		<div class="col-sm-2">계좌주</div>
		<div class="col-sm-4">
		${vendorVO.bank_owner } 
		</div>
		<div class="col-sm-2">담당자이메일</div>
		<div class="col-sm-4">
		${vendorVO.manager_email } 
		</div> 
	</div>
	<div class="row mb-3">
		<div class="col-sm-2">은행명</div>
		<div class="col-sm-4">
		${vendorVO.bank_name } 
		</div>  
		<div class="col-sm-2">계좌번호</div>
		<div class="col-sm-4">
		${vendorVO.bank_num } 
		</div> 
	</div>
	<div class="row mb-3">
		<div class="col-sm-2">배송비 유/무료</div>
		<div class="col-sm-10">
			${delv_set=="P"?"유료":"무료" } 
		</div> 
	</div>
	<div class="row mb-3">
		<div class="col-sm-2">배송비</div>
		<div class="col-sm-10">
			${vendorVO.delv_max }원 이상이면 무료배송, 이하 일 때는 배송비 ${vendorVO.delv_price }원 
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-sm-2">메모</div>
		<div class="col-sm-10">
		<textarea rows="5" class="form-control" name="memo">${vendorVO.memo}</textarea> 
		</div> 
	</div> 
	<div class="row mb-3">
		<div class="col-sm-4">접속IP</div>
		<div class="col-sm-8">
		${vendorVO.ip} 
		</div> 
	</div> 
	<div class="row mb-3">
		<div class="col-sm-4">최종접속일시</div>
		<div class="col-sm-8">
		${vendorVO.login_date} 
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
<input type=hidden name="idVendor" value="${vendorVO.idVendor }">
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
