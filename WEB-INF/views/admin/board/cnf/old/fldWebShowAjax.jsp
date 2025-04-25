<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
 
 <c:forEach items="${showList}" var="list"> 
	<span data-idTblCnf="${list.idTbl_cnf_fld }" id="${list.idTbl_cnf_fld }">
	    <button class="btn btn-outline-secondary" type="button" 
	    onClick="toggleShowFg('${list.idTbl_cnf_fld }');">${list.fld_name }</button> 
	</span>
 </c:forEach>