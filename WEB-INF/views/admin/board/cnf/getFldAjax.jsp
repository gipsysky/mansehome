<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<c:forEach items="${list }" var="list">	
	<div class="input-group mb-3 rounded catWrap${list.idTbl_cnf }" id="${list.idTbl_cnf_fld }" >  
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary" type="button"><i class="fas fa-arrows-alt"></i></button>
	  </div>   	
	  
	  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" 
	  readonly value="${list.fld_name eq '' ? '' : list.fld_name}">
	  
	  <div class="input-group-append">
	    <button class="btn btn-outline-secondary" data-toggle="modal" data-target="#modPop"
	     	data-v1="${list.idTbl_cnf_fld}" 
	     	data-v2="${list.fld_type}" 
	    ><i class="fas fa-edit"></i></button>
	  </div>	  
	</div>
</c:forEach>	
