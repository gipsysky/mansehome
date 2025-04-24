<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/global.jsp" %>


<div class="pagination">
    <a href="1" class="first"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
    <!-- 이전페이지 버튼 -->
    <c:if test="${pageMaker.prev}">
        <a href="${pageMaker.startPage-1}" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
    </c:if>

    <!-- 각 번호 페이지 버튼 -->
    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
        <a href='${num}' ${pageMaker.cri.pageNum == num ? 'class=\'active\'':'' }> ${num}</a>
    </c:forEach>

    <!-- 다음페이지 버튼 -->
    <c:if test="${pageMaker.next}">
        <a href="${pageMaker.endPage + 1 }" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
    </c:if>
    <a href="${pageMaker.totalEnd}" class="end"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
</div>
