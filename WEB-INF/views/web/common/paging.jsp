<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
      
<!-- pagination -->	
<div class="pagination">
	<a href="javascript:${param.funcName}(1);" class="first"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
	<!-- 이전페이지 버튼 -->
	<c:if test="${param.prev}">
		<a href="javascript:${param.funcName}(${param.startPage-1});" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a> 
	</c:if>
	
	<!-- 각 번호 페이지 버튼 -->
	<c:forEach var="num" begin="${param.startPage}" end="${param.endPage}">
		<a href='javascript:${param.funcName}(${num});' ${param.pageNum == num ? 'class=\'active\'':'' }> ${num}</a> 
	</c:forEach>
	
	<!-- 다음페이지 버튼 -->
	<c:if test="${param.next}">
		<a href="javascript:${param.funcName}(${param.endPage + 1 });" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a> 
	</c:if>	
	<a href="javascript:${param.funcName}(${param.totalEnd});" class="end"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
 </div>
<!-- /pagination -->