<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
 
<script>
function userSrch(){ 
	var f = document.userSrchFrm; 

	if (f.sType.value == "" && f.sType2.value == "" && f.sType4.value == "" && f.sType5.value == "" && f.sWord.value == ""){
		alert("검색조건을 입력해주십시오");
		return;
	}
		
	var param = "";
	param = param + "sType=" + f.sType.value;
	param = param + "&sType2=" + f.sType2.value;
	param = param + "&sType3=" + f.sType3.value;
	param = param + "&sType4=" + f.sType4.value;
	param = param + "&sType5=" + f.sType5.value;
	param = param + "&sWord=" + f.sWord.value; 
	
	//이미 선택한 id를 재선택하지 않기 위한 값
	param = param + "&sType8=" + f.sType8.value; //연관 테이블 
	param = param + "&sType9=" + f.sType9.value; //연관 테이블의 필드명
	param = param + "&sType10=" + f.sType10.value; //연관 테이블의 필드값
 
	var r = getAjax("<c:url value='/admin/'/>/member/user/listPop?"+param);
	if (r!=""){
		$("#memberDiv").html(r);
	}
}
function resetFormUser(){
	var r = getAjax("<c:url value='/admin/'/>/member/user/listPop");
	if (r!=""){
		$("#memberDiv").html(r); 
		document.userSrchFrm.reset();
	}
}
</script>
		  	
	      <!-- Search -->
		  <form method="get" name="userSrchFrm">
		  <input type="hidden" name="sType8" value="${pageMaker.cri.sType8 }">
	 	  <input type="hidden" name="sType9" value="${pageMaker.cri.sType9 }">
		  <input type="hidden" name="sType10" value="${pageMaker.cri.sType10 }">
	
			 <div class="input-group mb-3">  
			  <div class="input-group-prepend">
			    <select id="sType3" class="form-control">
						<option value="1" <c:out value="${pageMaker.cri.sType3 eq '1'?'selected':'' }"/>>가입일</option>
						<option value="2" <c:out value="${pageMaker.cri.sType3 eq '2'?'selected':'' }"/>>탈퇴일</option>  
			    </select>
			  </div> 
			  
			  <input type="text" id="sType4" value="${pageMaker.cri.sType4 }" class="form-control datepicker" autocomplete="off" placeholder="시작일">
			  <input type="text" id="sType5" value="${pageMaker.cri.sType5 }" class="form-control datepicker mr-2" autocomplete="off" placeholder="종료일">
			      
			  <div class="input-group-prepend">
			    <select id="sType2" class="form-control">
			    		<option value="">회원그룹</option>
			    		<c:forEach items="${userGroupList }" var="list">
			    			<option value="${list.group_code }" ${ list.group_code eq pageMaker.cri.sType2 ? "selected":"" }>${list.group_name }</option>
			    		</c:forEach>  
			    </select>
			  </div>      
			  <div class="input-group-prepend">
			    <select id="sType" class="form-control">
						<option value="" <c:out value="${pageMaker.cri.sType == null?'selected':'' }"/>>선택</option>
						<option value="T" <c:out value="${pageMaker.cri.sType eq 'T'?'selected':'' }"/>>이름</option>
						<option value="C" <c:out value="${pageMaker.cri.sType eq 'C'?'selected':'' }"/>>아이디</option>  
			    </select>
			  </div> 
			  <input type="text" id="sWord" value="${pageMaker.cri.sWord }" class="form-control" placeholder="검색어">
			  <div class="input-group-append">
			    <button class="btn  btn-primary" onClick="userSrch();" type="button">검색</button>
			  </div>
			  <div class="input-group-append">
			    <button class="btn btn-outline-secondary" type="button" onClick="resetFormUser();">초기화</button>
			  </div>
			</div> 
		  </form>
	      <!-- /Search -->
	      
	      
	      
      <div class="table-responsive"> 
      
      
        <table class="table table-striped table-sm border-bottom">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">아이디</th>
              <th scope="col">그룹명</th>
              <th scope="col">이름</th> 
              <th scope="col">가입일</th>
              <th scope="col">상태</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody> 
			<c:forEach items="${user}" var="list" varStatus="status">
				<tr>
					<td><c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * 10 }"/></td>
					<td> 
						<c:out value="${list.user_id}"/> 
					</td>
					<td><c:out value="${list.userGroupVO.group_name}"/></td>
					<td><c:out value="${list.name}"/></td>
					<td><c:out value="${list.wdate}"/></td>
					<td><c:out value="${list.del_flag eq 'Y' ? '탈퇴' : '이용중'}"/></td>
		            <td style="text-align:right;">
		           		<button class="btn btn-sm btn-primary" onClick="javascript:memberSelect('${list.idUser }');" style="cursor:pointer" >선택</button>
		            </td>
				</tr>
			</c:forEach>  
          </tbody>
        </table>

      </div>
        
	
<form method="get" name="listForm">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="sType" value="${pageMaker.cri.sType }">
	<input type="hidden" name="sType2" value="${pageMaker.cri.sType2 }">
	<input type="hidden" name="sType3" value="${pageMaker.cri.sType3 }">
	<input type="hidden" name="sType4" value="${pageMaker.cri.sType4 }">
	<input type="hidden" name="sType5" value="${pageMaker.cri.sType5 }">
	<input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
	<input type="hidden" name="idUser"> 
</form>
 