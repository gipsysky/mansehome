<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  


<c:set var="id" value="${gubun }_${job}"/>

<c:forEach items="${list }" var="list">	
	<div class="input-group mb-3 rounded catWrap${list.idTbl_cnf }" id="${list.idTbl_cnf_fld }">  
	  <div class="input-group-prepend">
	    <button class="btn btn-outline-secondary" type="button"><i class="fas fa-arrows-alt"></i></button>
	  </div>   	
	  
	  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" 
	  readonly value="${list.fld_name eq '' ? '' : list.fld_name}">
	  
	  <div class="input-group-append">
	    <button class="btn btn-outline-secondary showToggle${id}" data-idtbl_cnf_fld="${list.idTbl_cnf_fld}"
	     data-show_fg="${list.show_fg}">
	    <i style="width:10pt" class="fas fa-${list.show_fg eq 'Y' ? 'circle' : 'xmark' }"></i></button>
	  </div>	  
	</div>
</c:forEach>	


<script>
$(function(){ 
	$(".showToggle${id}").click(function(){ 
		var pref = "${id}";
		var idTbl_cnf_fld = $(this).data("idtbl_cnf_fld");
		var show_fg = $(this).data("show_fg"); 
 		
		if(show_fg=="Y"){ 
			$(this).find(".fas").removeClass("fa-circle");
			$(this).data("show_fg","N");
		}else{
			$(this).find(".fas").addClass("fa-circle"); 
			$(this).data("show_fg","Y");
		}
					
		window.open("../fldShowToggle?fld="+pref+"_fg&idTbl_cnf_fld="+idTbl_cnf_fld+"&show_fg="+show_fg
				, "HiddenFrame");
	});
});
</script>
