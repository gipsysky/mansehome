<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("BR","\n"); %>
 
<c:if test="${cnfVO.header_url ne null }">
<jsp:include page="${cnfVO.header_url }" flush="true">
	<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
	<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
</jsp:include>
</c:if>
 

<div class="board-view">
	<table class="table">
		<colgroup> 
		<col width="15%">
		<col width="*">
		<col width="15%">
		<col width="*">
		<col width="15%">
		<col width="*">
		</colgroup>
		<tbody>
		<tr>
		  <th class="hidden-xs">제목</th>
		  <td colspan="5" class="title">${dataVO['fld2']}</td>
		</tr>
		<tr class="board-info">
		  <th>작성자</th>
		  <td>${dataVO['fld1']}</td>
		  <th>작성일</th>
		  <td>
			<fmt:parseDate value="${dataVO['fld50']}" var="parseDelv_date" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${parseDelv_date}" pattern="yyyy년 MM월 dd일"/>
		  </td>
		  <th>조회</th>
		  <td>${dataVO['readNum'] }</td>
		</tr>   
		
		<tr>
		  <td colspan="6">
		    <div class="board-con">
		    	${fn:replace(dataVO['fld3'], BR, "<br>")}
		    </div>
		  </td>
		</tr> 
		
		<c:if test="${dataVO['fld4'] ne null }">
		<tr class="board-info">
		  <th>답변</th>
		    <td colspan="5">
		    	${fn:replace(dataVO['fld4'], BR, "<br>")}
		    </div>
		  </td>
		</tr> 
		</c:if>
		
	</tbody>
	</table>

	<div class="btn-box"> 
		<c:if test="${auth_write eq 'true'}">
			<c:if test="${!notMyContents}">
				<button type="button" class="btn line" onClick="modify();">수정</button>
				<button type="button" class="btn line" onClick="del();">삭제</button>
			</c:if>   
			<c:if test="${cnfVO.reply_fg eq 'Y' }">
				<button type="button" class="btn line reply">답글</button>
			</c:if>	
		</c:if>
		<button type="button" class="btn dark" onClick="list();">목록</button>  
	</div>
</div> 

<form method="post" name="goForm" action="list">
<input type=hidden name="idTbl_cnf" value="${dataVO.idTbl_cnf}">
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sType2" value="${criteria.sType2}">
<input type="hidden" name="sType3" value="${criteria.sType3}">
<input type="hidden" name="sType4" value="${criteria.sType4}">
<input type="hidden" name="sType5" value="${criteria.sType5}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
<input type="hidden" name="gubun" value="web">
<input type="hidden" name="isReply" value="N">
</form> 


<script>
$(function(){	  
	$(".reply").click(function(event){
		event.preventDefault();
		document.goForm.reset();
		document.goForm.isReply.value = "Y";
		document.goForm.action = "write";
		document.goForm.submit(); 
	}); 
});
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
	document.goForm.action="/web/board/data/list";
	document.goForm.idTbl_data.value=""; // 리스트에 갈 때 id 값을 가지고 가면 안됨
	document.goForm.target="_self";
	document.goForm.submit();
} 
</script>



      