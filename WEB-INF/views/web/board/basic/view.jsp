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
		</colgroup>
		<tbody>  
		
	<c:forEach items="${fldList }" var="list">  
		<c:set var="fldcode" value="fld${list.fld_code }"/> 
		<c:choose>
			<c:when test="${list.fld_type eq 'image'}">
				<c:if test="${dataVO[fldcode] ne ''}">
					<tr>
						<td colspan=6>
							<img src="${dataVO[fldcode] }" class="img-fluid">
						</td>
					</tr>
				</c:if>
			</c:when>
			<c:when test="${list.fld_type eq 'txt_l'}">
				<c:if test="${dataVO[fldcode] ne ''}">
				<tr> 
					<td colspan=6>
						${fn:replace(dataVO[fldcode], BR, "<br>")}
					</td> 
				</tr>
				</c:if>
			</c:when>			
			<c:when test="${list.fld_type eq 'file' and dataVO[fldcode] ne '' }">
				<tr>
					<th>
						${list.fld_name} 
					</th>
					<td colspan=5>
						<a href="${dataVO[fldcode] }">다운로드</a>
					</td> 
				</tr>  
			</c:when>		
			<c:when test="${list.fld_type eq 'date' and dataVO[fldcode] ne '' }">
				<fmt:parseDate value="${dataVO[fldcode]}" var="parseDelv_date" pattern="yyyy-MM-dd"/> 
				<tr>
					<th>
						${list.fld_name} 
					</th>
					<td colspan=5>
						<fmt:formatDate value="${parseDelv_date}" pattern="yyyy년 MM월 dd일"/>
					</td> 
				</tr>  
			</c:when>
			<c:otherwise>
				<tr>
					<th>
						${list.fld_name} 
					</th>
					<td colspan=5>
						${list.prefix }
						${fn:replace(dataVO[fldcode], BR, "<br>")}
						${list.suffix }
					</td> 
				</tr>  
			</c:otherwise>
		</c:choose> 
	</c:forEach>
 
	</tbody>
	</table>

	<div class="btn-box">
		<c:if test="${auth_write eq 'true'}">
			<c:if test="${!notMyContents}">
				<button type="button" class="btn line" onClick="act('write','${dataVO.pw eq '' || empty dataVO.pw ? '':'1'}');">수정</button>
				<button type="button" class="btn line" onClick="act('del','${dataVO.pw eq '' || empty dataVO.pw ? '':'1'}');">삭제</button>
			</c:if>
			<c:if test="${cnfVO.reply_fg eq 'Y' }">
				<button type="button" class="btn line reply">답글</button>
			</c:if>
		</c:if>
		<button type="button" class="btn dark" onClick="list();">목록</button>
	</div>
</div>

<jsp:include page="../include/inc_comment.jsp" flush="true">
	<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
	<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
</jsp:include>

<jsp:include page="../include/inc_detail_actions.jsp" flush="true">
	<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
	<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
</jsp:include>



      