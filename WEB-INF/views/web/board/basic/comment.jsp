<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<% pageContext.setAttribute("BR","\n"); %>
 
  <table class="table">
  <colgroup>
  <col width="8%">
  <col width="*">
  <col width="10%">
  <col width="10%">
  </colgroup>
  <thead>
  <tr>
    <th>번호</th>
    <th>댓글</th>
    <th>작성자</th>
    <th>등록일</th>
  </tr>
  </thead>
  <tbody>
	<c:set var="replyPadding" value="0"/> 
    
	<c:forEach items="${dataList }" var="list" varStatus="status"> 
	  <tr>
	    <td><c:out value="${ pageMaker.total - (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount  - status.index}"/></td>
		
	    <td style="cursor:pointer;text-align:left;${replyPadding > 0 ? 'padding-left:':''}${replyPadding > 0 ? replyPadding * 10 : ''}">
		    
			<c:set var="replyPadding" value="0"/>
			<c:forEach var="i" begin="1" end="${list.levelRef }">
				<c:set var="replyPadding" value="${replyPadding + 1 }"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			</c:forEach> 
	    	<c:if test="${list.levelRef > 0 }"> <B>ㄴ</B> </c:if>
	    	
	    	${fn:replace(list.comment,BR,"<BR>")}

			<c:if test="${sessionScope.U_LOGIN eq 'Y' && auth_write eq 'true' && list.comment ne '삭제되었습니다'}">
	    		<div style="float:right;">
		    		&nbsp; <i class="fa fa-comment-dots" onClick="replyComment('${list.idTbl_comment}');"></i>
	    			<c:if test="${writer_idx eq list.userIdx && 'user' eq list.userTbl}">
		    		&nbsp; <i class="fa fa-pen" onClick="editComment('${list.idTbl_comment}');"></i>  
		    		&nbsp; <i class="fa fa-trash" onClick="delComment('${list.idTbl_comment}');"></i>
	    			</c:if> 
	    		</div>
	    	</c:if>
	    	
	    </td>
	    <td>${list.userName }</td>
	    <fmt:parseDate value="${list.wdate}" var="parsed_date" pattern="yyyy-MM-dd"/>
	    <td><fmt:formatDate value="${parsed_date}" pattern="yyyy-MM-dd"/></td>
	  </tr>
	</c:forEach>
  </tbody>
  </table>  

<jsp:include page="../../common/paging.jsp" flush="true">
	<jsp:param name="prev" value="${pageMaker.prev}"/>
	<jsp:param name="startPage" value="${pageMaker.startPage}"/>
	<jsp:param name="endPage" value="${pageMaker.endPage}"/>
	<jsp:param name="pageNum" value="${pageMaker.cri.pageNum}"/>
	<jsp:param name="endPage" value="${pageMaker.endPage}"/>
	<jsp:param name="next" value="${pageMaker.next}"/>
	<jsp:param name="totalEnd" value="${pageMaker.totalEnd}"/>
	<jsp:param name="funcName" value="comment_list"/>
</jsp:include> 
