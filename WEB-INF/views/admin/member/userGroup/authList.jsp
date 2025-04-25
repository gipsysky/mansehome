<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  


<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
  <h1 class="h2">${userGroupVO.group_name } 게시판권한설정</h1> 
</div>

<div>※ 노출 여부는 아예 보이지 않게되고, 권한은 "권한이 없습니다" 경고창을 띄우게 됨</div>

<div class="row g-5"> 
  <div class="col-md-12 col-lg-12"> 
      <div class="row g-3">  
      
			<div id="detail" class="input-group">
				
				<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">메뉴명</th>
					<th scope="col">노출 여부</th>
					<th scope="col">리스트 권한</th>
					<th scope="col">읽기 권한</th>
					<th scope="col">쓰기 권한</th>
				</tr>
				</thead>
				<tbody>	 				
					<c:forEach items="${userGroupAuthCodesVO}" var="list" varStatus="i"> 
				      	 <c:forEach items="${list.authList }" var="menu" varStatus="j">
				    	  <tr>
				    	  	<td class="pl-5"><c:out value="${menu.menu_name }"/></td>
					    	<td>
								<div class="form-check">
								  <input name="show" value="${menu.idMenu }" class="form-check-input show chk1_show${i.index}" type="checkbox" 
								  id="chk2_show${i.index}_${j.index}" ${menu.auth_show_flag eq 'N' ? '':'checked'}>
								  <label class="form-check-label" for="chk2_show${i.index}_${j.index}">
								    허용
								  </label>
								</div>
					    	</td>
					    	<td>
								<div class="form-check">
								  <input name="list" value="${menu.idMenu }" class="form-check-input list chk1_list${i.index}" type="checkbox" 
								  id="chk2_list${i.index}_${j.index}" ${menu.auth_list_flag eq 'N' ? '':'checked'}>
								  <label class="form-check-label" for="chk2_list${i.index}_${j.index}">
								    허용
								  </label>
								</div>
					    	</td>
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
								    ${menu.menu_name == '상품 권한' ? '주문' : '' } 허용 
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
<input type="hidden" name="idUser_group" value='<c:out value="${userGroupVO.idUser_group}"/>'>
<input type="hidden" name="auth_show">
<input type="hidden" name="auth_list">
<input type="hidden" name="auth_read">
<input type="hidden" name="auth_write">
</form>	     
	 
          
<script> 
  
function ok(){
	var show="";
	$(".show").each(function(){ 
		if ($(this).prop("checked")){
			if(show!="") show = show + ",";
			show = show + $(this).val();
		} 
	}); 
	document.form.auth_show.value = show;

	var list="";
	$(".list").each(function(){ 
		if ($(this).prop("checked")){
			if(list!="") list = list + ",";
			list = list + $(this).val();
		} 
	}); 
	document.form.auth_list.value = list;

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
	
 