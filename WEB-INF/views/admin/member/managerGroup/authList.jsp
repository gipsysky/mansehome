<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  


<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
  <h1 class="h2">${managerGroupVO.group_name } 권한설정 </h1> 
</div>

<div class="row g-5"> 
  <div class="col-md-12 col-lg-12"> 
      <div class="row g-3">  
      
			<div id="detail" class="input-group">
				
				<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">메뉴명</th>
					<th scope="col">읽기</th>
					<th scope="col">쓰기</th>
				</tr>
				</thead>
				<tbody>	 				
					<c:forEach items="${managerGroupAuthCodesVO}" var="list" varStatus="i">

				     	 <tr class="thead-light">
				        	<th>${list.name}</th>
					    	<th><input type="checkbox" class="chkAll" alt="chk1_read${i.index}" id="chkAllr${i.index}"> <label for="chkAllr${i.index}"><i class="fas fa-list-ul"></i></label></td>
					    	<th><input type="checkbox" class="chkAll" alt="chk1_write${i.index}" id="chkAllw${i.index}"> <label for="chkAllw${i.index}"><i class="fas fa-list-ul"></i></label></td>
				    	 </tr>
				      
				      	 <c:forEach items="${list.authList }" var="menu" varStatus="j">
				    	  <tr>
				    	  	<td class="pl-5"><c:out value="${menu.menu_name }"/></td>
					    	<td>
								<div class="form-check">
								  <input name="read" value="${menu.idMenu }" class="form-check-input read chk1_read${i.index}" type="checkbox" 
								  id="chk2_read${i.index}_${j.index}" ${menu.auth_read_flag eq 'N' ? '':'checked'}>
								  <label class="form-check-label" for="chk2_read${i.index}_${j.index}">
								    허용
								  </label>
								</div>
					    	</td>
					    	<td>
								<div class="form-check">
								  <input name="write" value="${menu.idMenu }" class="form-check-input write chk1_write${i.index}" type="checkbox" 
								  id="chk2_write${i.index}_${j.index}" ${menu.auth_write_flag  eq 'N' ? '':'checked'}>
								  <label class="form-check-label" for="chk2_write${i.index}_${j.index}">
								    허용
								  </label>
								</div>
					    	</td> 
					      </tr>
					      </c:forEach>
					      
					</c:forEach>	     
				 
				</tbody>
				</table>    
				
				<div class="col-md-12 text-center mt-3">
					<button class="btn btn-primary btn-lg" type="button" onClick="ok();">확인</button>  
      				<button class="btn btn-secondary btn-lg" type="button" onClick="document.location.href='../../list';">목록</button> 
				</div> 
			</div>  
		    
		</div>   
	</div>   
</div> 
   
<form name="form" method="get" action="../../authOk" class="col-md-12">
<input type="hidden" name="idManager_group" value='<c:out value="${managerGroupVO.idManager_group}"/>'>
<input type="hidden" name="auth_read">
<input type="hidden" name="auth_write">
</form>	     
	 
          
<script>
$(function(){
	$(".chkAll").on("click", function(){
		var v = $(this).attr("alt");
		if ($(this).prop("checked")){
			$("." + v).prop("checked", "checked");	
		}else{
			$("." + v).prop("checked", "");
		}
	});
});
  
function ok(){
	var read="";
	$(".read").each(function(){ 
		if ($(this).prop("checked")){
			if(read!="") read = read + ",";
			read = read + $(this).val();
		} 
	}); 
	document.form.auth_read.value = read;

	var write="";
	$(".write").each(function(){ 
		if ($(this).prop("checked")){
			if(write!="") write = write + ",";
			write = write + $(this).val();
		} 
	});
	document.form.auth_write.value = write;
	
	document.form.target="HiddenFrame";
	document.form.submit();
}
</script>
	
 