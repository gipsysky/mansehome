<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
 <div class="pagination">
 <a href="javascript:void(0);" class="first"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
 <a href="javascript:void(0);" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
 <a href='javascript:void(0);' class="active"> 1</a>
 <a href="javascript:void(0);" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
 <a href="javascript:void(0);" class="end"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
 </div>
  
<!-- pagination -->	
<div class="col-md-3" style="float:none; margin:0 auto;">        
<nav aria-label=" ">
  <ul class="pagination" style="justify-content: center">
		<!-- 이전페이지 버튼 -->
		<c:if test="${param.prev}">
			<li class="page-item"><a href="${param.startPage-1}" class='page-link'><span aria-hidden=true>&laquo;</span></a></li>
		</c:if>
		
		<!-- 각 번호 페이지 버튼 -->
		<c:forEach var="num" begin="${param.startPage}" end="${param.endPage}">
			<li class="page-item ${param.pageNum == num ? 'active':'' }"><a href="${num}" class='page-link'>${num}</a></li>
		</c:forEach>
		
		<!-- 다음페이지 버튼 -->
		<c:if test="${param.next}">
			<li class="page-item"><a href="${param.endPage + 1 }" class='page-link'><span aria-hidden=true>&raquo;</span></a></li>
		</c:if>	
  </ul>
</nav>
</div>
<!-- /pagination -->