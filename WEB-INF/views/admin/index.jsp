<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href='<c:url value='/'/>'>홈페이지</a>
   
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto"> 
    	<c:forEach items="${menuCodeList }" var="parentMenu">
			<BR>
		    <c:if test="${fn:length(parentMenu.subList) > 0 }"> 
			      <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			          <c:out value="${parentMenu.name }"/>
			        </a> 
	        		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
	        		  <c:forEach items="${parentMenu.subList }" var="subList">
	        		  	<a href="<c:url value='/admin/'/>${subList.url }" class="dropdown-item"><c:out value="${subList.menu_name }"/></a>
	        		  </c:forEach>
	        		</div>
	        	  </li>
		    </c:if>
    	</c:forEach>
    </ul>
  </div>
    
</nav>


<script>
function Link(v){
	document.location.href=v;
}
function ELink(v){
	window.open(v,"_blank");
}
</script>