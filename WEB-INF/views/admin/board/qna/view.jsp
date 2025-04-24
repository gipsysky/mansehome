<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="/WEB-INF/views/global.jsp" %>

<% pageContext.setAttribute("BR","\n"); %>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
   <h1 class="h2">상세보기</h1>
</div>

<c:set var="answer" value=""/>   

<c:forEach items="${fldList }" var="list">   
	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-4">
				${list.fld_name}
				
				<c:if test="${list.required_fg eq 'Y'}">
					<font color="red">*</font>
				</c:if>					
			</div>
			<div class="col-sm-8">
	
				<c:set var="fldcode" value="fld${list.fld_code }"/>
				
				${list.prefix }
				<c:choose>				
					<c:when test="${list.fld_type eq 'image' and dataVO[fldcode] ne '' }">
						<img src="${dataVO[fldcode] }">
					</c:when>
					<c:when test="${list.fld_type eq 'file' and dataVO[fldcode] ne '' }">
						<c:set var="fileArr" value="${fn:split(dataVO[fldcode], '|')}"/>
						<c:if test="${fileArr[0] ne 'null' }">
							<a href="${fileArr[1]}">${fileArr[0]}</a>
						</c:if>
					</c:when>
					<c:otherwise>
						${fn:replace(dataVO[fldcode], BR, "<br>")}
					</c:otherwise>
				</c:choose>
				${list.suffix }
	  	 
	  	 		<!-- 답변값을 저장 -->
	  	 		<c:if test="${list.fld_code eq 4 }">
	  	 			<c:set var="answer" value="${dataVO[fldcode] }"/>
	  	 		</c:if>
			</div> 
		</div> 
	</div> 
</c:forEach>

	
      <hr class="my-4">

      <div class="col-md-12 text-center">
      	<button class="btn btn-primary btn-lg" type="button" data-target="#orderMemoInput" data-toggle="modal">답변하기</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="modify();">수정</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="list();">목록</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="del();">삭제</button> 
      </div> 

<div id="orderMemoInput" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	    <div class="modal-content">
			<form name="memoForm" method="post" action="replyQna" target="HiddenFrame">
				<input type=hidden name="idTbl_cnf" value="${dataVO.idTbl_cnf}">
			<input type="hidden" name="idTbl_data" value="${dataVO.idTbl_data}">
			<input type="hidden" name="fld11" value="${G_CODE_YES}"/>
		    <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">관리자 답변 입력</h5>				
			</div>
			<div class="modal-body">
				<textarea name="fld4" class="form-control" rows=7>${answer }</textarea>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary-line float-right mt-2 " data-dismiss="modal">닫기</button>
				<button class="btn btn-secondary float-right mt-2 ">입력</button>
			</div>
			</form>
		</div> 
	</div>
</div>

<form method="get" name="goForm" action="list">
<input type=hidden name="idTbl_cnf" value="${dataVO.idTbl_cnf}">
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}">
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



      