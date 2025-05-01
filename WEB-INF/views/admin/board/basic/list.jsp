<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
        <h1 class="h2">${cnfVO.tbl_name } </h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2 px-2">
            <button type="button" class="btn btn-primary ml-1 write">입력</button>
          </div>
        </div>
      </div>
      
      <div class="table-responsive">
        <table class="table table-striped table-sm border-bottom">
          <thead>
            <tr>
              <th scope="col" width="10%">#</th>
              <c:forEach items="${fldList }" var="list">
              	<th scope="col">${list.fld_name }</th>
              </c:forEach>
            </tr>
          </thead>
          <tbody>  
			<c:forEach items="${dataList }" var="list" varStatus="status"> 
				<tr onClick="move('${list.idTbl_data}','${list.pw ne null ? 1 : 0}')"> 
					<td>
						<c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount }"/>
						${list.pw ne null ? '비밀글' : ''}
					</td>
					
					<c:forEach items="${fldList }" var="fldList">
						<c:set var="fldcode" value="fld${fldList.fld_code }"/>

						<td ${fldcode eq 'fld2' ? 'style=\'text-align:left\'' : '' }> 
							<c:choose>
								<c:when test="${fldcode eq 'fld2' }"> <!-- fld2는 고정필드 : 제목 -->
									<c:forEach var="i" begin="1" end="${list.levelRef }">
										&nbsp;&nbsp;&nbsp;
									</c:forEach>
									<c:if test="${list.levelRef > 0 }"> <B>ㄴ</B> </c:if>
									
									${list[fldcode]}
								</c:when>
								<c:when test="${fldList.fld_type eq 'date' }">
									<fmt:parseDate value="${list[fldcode]}" var="parseDelv_date" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${parseDelv_date}" pattern="yyyy.MM.dd"/>
								</c:when>
								<c:otherwise>
									${fldList.prefix } 
									${list[fldcode] }
									${fldList.suffix }
								</c:otherwise>
							</c:choose>	 
						</td>
					</c:forEach> 
				</tr>
	        </c:forEach>  
          </tbody>
        </table> 
 
		<!-- pagination -->	
		<div class="col-md-3" style="float:none; margin:0 auto;">        
		<nav aria-label=" ">
		  <ul class="pagination" style="justify-content: center">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a href="${pageMaker.startPage-1}" class='page-link'><span aria-hidden=true>&laquo;</span></a></li>
				</c:if>
				
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}" class='page-link'>${num}</a></li>
				</c:forEach>
				
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a href="${pageMaker.endPage + 1 }" class='page-link'><span aria-hidden=true>&raquo;</span></a></li>
				</c:if>	
		  </ul>
		</nav>
		</div>
		<!-- /pagination -->	 
            
      <!-- Search -->
	  <form method="get" action="?" name="srchForm">
		  <input type="hidden" name="idTbl_cnf" value="${cnfVO.idTbl_cnf}"/>
		  <div class="col-md-8" style="float:none; margin:0 auto;">
			  <div class="input-group">
                  <!--추가 검색-->
                  <c:forEach items="${addSrchList}" var="slist" varStatus="status">
                      <c:choose>
                          <c:when test="${slist.fld_type eq 'sdate'}">
                              <input type="hidden" name="sListType" value="ge_date"/>
                              <button type="button"  class="btn btn-sm">${slist.fld_name}</button>
                              <input type="hidden" name="sListName" value="fld${slist.fld_code}"/>
                              <input type="text" name="sListVal" value="${slist.sVal}" size="10" class="form-control mr-2 datepicker" autocomplete="off"/>
                          </c:when>
                          <c:when test="${slist.fld_type eq 'edate'}">
                              <input type="hidden" name="sListType" value="le_date"/>
                              <button type="button"  class="btn btn-sm">${slist.fld_name}</button>
                              <input type="hidden" name="sListName" value="fld${slist.fld_code}"/>
                              <input type="text" name="sListVal" value="${slist.sVal}" size="10" class="form-control mr-2 datepicker" autocomplete="off"/>
                          </c:when>
                          <c:when test="${slist.fld_type eq 'date'}">
                              <input type="hidden" name="sListType" value="eq_date"/>
                              <button type="button"  class="btn btn-sm">${slist.fld_name}</button>
                              <input type="hidden" name="sListName" value="fld${slist.fld_code}"/>
                              <input type="text" name="sListVal" value="${slist.sVal}" size="10" class="form-control mr-2 datepicker" autocomplete="off"/>
                          </c:when>
                          <c:when test="${slist.fld_type eq 'radio' || slist.fld_type eq 'dropdown'}">
                              <input type="hidden" name="sListType" value="eq"/>
                              <input type="hidden" name="sListName" value="fld${slist.fld_code}"/>
                              <select name="sListVal" class="form-control mr-2">
                                  <option value="">${slist.fld_name}</option>
                                  <c:forEach items="${slist.codesList}" var="clist">
                                      <option value="${clist.idCodes}" ${clist.idCodes eq slist.sVal ? 'selected' : ''}>${clist.name}</option>
                                  </c:forEach>
                              </select>
                          </c:when>
                          <c:otherwise>
                              <input type="hidden" name="sListType" value="eq"/>
                              <button type="button"  class="btn btn-sm">${list.fld_name}</button>
                              <input type="hidden" name="sListName" value="fld${list.fld_code}"/>
                              <input type="text" name="sListVal" size="10" class="form-control mr-2" autocomplete="off"/>
                          </c:otherwise>
                      </c:choose>
                  </c:forEach>

                  <!--기본 검색-->
				  <select name="sType" id="sType" class="form-control">
						<option <c:out value="${pageMaker.cri.sType eq null?'selected':'' }"/> value="">선택</option>
						<c:forEach items="${srchFldList }" var="srchFld">
							<c:set var="fld" value="fld${srchFld.fld_code }"/>
							<option
							<c:out value="${pageMaker.cri.sType eq fld ? 'selected':'' }"/>
							value="fld${srchFld.fld_code }">${srchFld.fld_name } </option>
						</c:forEach>
				  </select>
				  <input name="sWord" type="text" id="sWord" value="${pageMaker.cri.sWord }"  class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
				  <div class="input-group-append">
					<button class="btn btn-outline-secondary" type="submit">검색</button>
				  </div>
				  <div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button" onClick="document.location.href='list?idTbl_cnf=${idTbl_cnf}';">목록</button>
				  </div>
			  </div>
		  </div>
	  </form>
      <!-- /Search -->
		 
	</div>
	

<div id="passPop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
	    <div class="modal-content">
			<form name="passForm" method="post" target="HiddenFrame">
			<input type="hidden" name="idTbl_data" value="${dataVO.idTbl_data}"> 
		    <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">비밀번호 입력</h5>				
			</div>
			<div class="modal-body">
				<input type="password" name="pw" class="form-control"/>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary-line float-right mt-2 " data-dismiss="modal">닫기</button>
				<button class="btn btn-secondary float-right mt-2 " onClick="move('','2')" type="button">확인</button>
			</div>
			</form>
		</div> 
	</div>
</div>

<form method="get" name="listForm">
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
<input type="hidden" name="sType" value="${pageMaker.cri.sType }">
<input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
<input type="hidden" name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"> 
<input type="hidden" name="idTbl_data" >
<input type="hidden" name="pw" >
<input type="hidden" name="view" >
</form>


<script>
$(function(){ 
	$(".pagination a").click(function(event){
		event.preventDefault();
		document.listForm.idTbl_data.value = "";
		document.listForm.pageNum.value = $(this).attr("href");
		document.listForm.action = "list";
		document.listForm.submit();
	});

	$(".write").click(function(event){
		event.preventDefault();
		document.listForm.idTbl_data.value = "";
		document.listForm.action = "write";
		document.listForm.submit();
	}); 
});

function move(v, pass_fg){
	document.listForm.idTbl_data.value = "";
	document.listForm.idTbl_data.value = v;
	document.listForm.action = "view";
	document.listForm.submit();
}
function OLD_move(v, pass_fg){
	if (pass_fg == 1){ 
		document.listForm.method="post"; // 비밀번호가 있는 비밀글인 경우에는 query string 에 pw 값이 보이지않게 하기 위해 post
		document.listForm.idTbl_data.value = v;
		document.listForm.action = "view";
		$("#passPop").modal();
		return;

	}else if (pass_fg == 2){
		if (document.passForm.pw.value == ""){
			alert("비밀번호를 입력해주십시오");
			document.passForm.pw.focus();
			return;
		}else{
			document.listForm.pw.value = document.passForm.pw.value;
		}
	}else{
		document.listForm.reset();
		document.listForm.idTbl_data.value = v;
		document.listForm.action = "view";
	}

	document.listForm.submit();
}
</script>      