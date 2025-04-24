<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<script>
$(function(){
	var id = "${userVO.idUser}";
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
  <h1 class="h2">회원 보기
	  <c:if test="${pointButtonView}">
  		<button class="btn btn-light" onClick="javascript:document.location.href='/admin/sale/point/list/one?sType2=${userVO.idUser }'">적립금</button>
	  </c:if>
	  <c:if test="${couponButtonView}">
	  	<button class="btn btn-light" onClick="javascript:document.location.href='/admin/pr/coupon/list/one?idUser=${userVO.idUser }'">쿠폰</button>
	  </c:if>
  </h1>
</div>
 
    <div class="row g-5"> 
      <div class="col-md-12 col-lg-12">   
          <div class="row g-3 table">
			  
		
			<div class="col-12 mb-3 row">
				<div class="col-2">회원 그룹 </div>
				<div class="col-4">
				${userVO.userGroupVO.group_name } 
				</div>  
				<div class="col-2">아이디 </div>
				<div class="col-4">
				${userVO.user_id }
				</div> 
			</div>  
		
			<div class="col-12 mb-3 row">
				<div class="col-2">회원명 </div>
				<div class="col-4">
				${userVO.name }
				</div>  
				<div class="col-2">회원상태</div>
				<div class="col-4">
				<c:choose>
				<c:when test="${userVO.del_flag eq 'Y'}">
					탈퇴 (${userVO.mdate })
					
					<font color=red>
					<c:if test="${secessionVO.sec_by ne null && secessionVO.sec_by ne 'user' }">
						관리자 삭제
					</c:if>
					<c:if test="${secessionVO.sec_by ne null && secessionVO.sec_by eq 'user' }">
						<BR>사용자탈퇴
						<BR>탈퇴사유 : ${secessionVO.sec_reason }
						<BR>기타 탈퇴사유 : ${secessionVO.sec_reason_desc }
					</c:if>
					</font>
				</c:when>
				<c:when test="${userVO.del_flag eq 'X'}">
					정지 (${userVO.mdate })
				</c:when>
				<c:otherwise>
					이용중
				</c:otherwise>
				</c:choose>
				</div> 
			</div>  
		
			<div class="col-12 mb-3 row">
				<div class="col-2">비상연락처 </div>
				<div class="col-4">
				${userVO.htel }
				</div>
				<div class="col-2">혈액형 </div>
				<div class="col-4">
					${userVO.blood_type}
				</div>
			</div>  

			<div class="col-12 mb-3 row">
				<div class="col-2">소속 </div>
				<div class="col-4">
				${userVO.code2 }대대 ${userVO.code3 }중대 ${userVO.code4 }소대
				</div>  
				<div class="col-2">군번 </div>
				<div class="col-4">
				${userVO.army_no }
				</div> 
			</div>
			  <div class="col-12 mb-3 row">
				  <div class="col-2">기기아이디 </div>
				  <div class="col-4">
					  ${userVO.uuid}
				  </div>
			  </div>
			  <div class="col-12 mb-3 row">
				  <div class="col-2">특이사항 </div>
				  <div class="col-4">
					  ${userVO.memo}
				  </div>
			  </div>
 
          </div> 
          <hr class="my-4">
			
			<div class="col-md-12 text-center">
				<button class="btn btn-primary btn-lg" type="button" onClick="modify();">수정</button> 
				<button class="btn btn-secondary btn-lg" type="button" onClick="list();">목록</button>
				<!-- <button class="btn btn-warning btn-lg" type="button" onClick="out();">${userVO.del_flag eq 'Y' ? '복원' : '정지' }</button>-->
				<c:if test="${userVO.del_flag eq 'N' }"> 
				<button class="btn btn-dark btn-lg" type="button" onClick="del();">삭제</button>
				</c:if> 
			</div> 
      </div>
    </div>
      
  

<form method="get" name="goForm" action="list">
<input type=hidden name="idUser" value="${userVO.idUser }">
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
	if (confirm("삭제하시겠습니까?\n복원이 불가능합니다")){
		document.goForm.action="del";
		document.goForm.target="HiddenFrame";
		document.goForm.submit();	
	}
}

function out(){
	if (confirm("${userVO.del_flag eq 'X' ? '복원하시겠습니까?' : '정지하시겠습니까? \\n복원이 가능합니다' }")){ 
		window.open("out?idUser=${userVO.idUser}&del_flag=${userVO.del_flag}","HiddenFrame");
	}
}

function list(){
	document.goForm.action="list";
	document.goForm.target="_self";
	document.goForm.submit();
}
</script>
