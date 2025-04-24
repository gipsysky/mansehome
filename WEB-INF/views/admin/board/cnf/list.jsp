<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
        <h1 class="h2">게시판 설정</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary" onClick="javascript:document.location.href='./write';">게시판 추가</button>
          </div> 
        </div>
      </div>
  
      <div class="table-responsive">
        <table class="table table-striped table-sm border-bottom">
          <thead>
            <tr>
              <th scope="col" width=10%>#</th>
              <th scope="col" width=*>게시판명</th>
				<th scope="col" width=*>작업폴더(사용자)</th>
				<th scope="col" width=*>작업폴더(관리자)</th>
              <th scope="col" width=10%>게시판관리</th>
              <th scope="col" width=10%>항목관리</th>
              <th scope="col" width=10%>노출/순서</th> 
              <th scope="col" width=10%>복사</th>
            </tr>
          </thead>
          <tbody> 
			<c:forEach items="${list }" var="list" varStatus="status">
	            <tr>
	              <td><c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount }"/></td>
	              <td><a href="../data/list?idTbl_cnf=${list.idTbl_cnf}">${list.tbl_name}</a></td>
				  <td>web/board/${list.tbl_web_skin} </td>
				  <td>admin/board/${list.tbl_skin}</td>
	              <td><a href="write?idTbl_cnf=${list.idTbl_cnf}">관리</a></td>
	              <td><a href="view/fldCnf?idTbl_cnf=${list.idTbl_cnf}">항목</a></td>
	              <td><a href="list/fldShow?idTbl_cnf=${list.idTbl_cnf}">노출/순서</a></td>
	              <!-- 
	              <td><a href="list/fldWebShowList?idTbl_cnf=${list.idTbl_cnf}">사용자목록</a></td>
	              <td><a href="list/fldWebShowDetail?idTbl_cnf=${list.idTbl_cnf}">사용자내용</a></td>
	              <td><a href="list/fldShowList?idTbl_cnf=${list.idTbl_cnf}">관리자목록</a></td>
	               -->
	              <td><a href="duplicateForm?idTbl_cnf=${list.idTbl_cnf}">복사</a></td>
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
		 <div class="input-group col-md-6" style="float:none; margin:0 auto;">     
		  <div class="input-group-prepend">
		    <select id="sType" class="form-control">
					<option value="" <c:out value="${pageMaker.cri.sType == null?'selected':'' }"/>>선택</option>
					<option value="T" <c:out value="${pageMaker.cri.sType eq 'T'?'selected':'' }"/>>게시판명</option>  
		    </select>
		  </div>      
		  <input type="text" id="sWord" value="${pageMaker.cri.sWord }"  class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
		  <div class="input-group-append">
		    <button class="btn btn-outline-secondary sBtn" type="submit">검색</button>
		  </div>
		  <div class="input-group-append">
		    <button class="btn btn-outline-secondary" type="button" onClick="document.location.href='list';">목록</button>
		  </div>
		</div> 
      <!-- /Search -->
		 
	</div>
	
<form method="get" name="listForm">
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
<input type="hidden" name="sType" value="${pageMaker.cri.sType }">
<input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
<input type="hidden" name="idCodes"> 
</form>


<script>
$(function(){ 
	$(".pagination a").click(function(event){
		event.preventDefault();
		document.listForm.reset();
		document.listForm.pageNum.value = $(this).attr("href");
		document.listForm.action = "list";
		document.listForm.submit();
	});
	
	$(".sBtn").click(function(event){
		event.preventDefault();
		document.listForm.reset();
		document.listForm.sType.value = $("#sType").val();
		document.listForm.sWord.value = $("#sWord").val();
		document.listForm.action = "list";
		document.listForm.submit();		
	});
  
	$(".write").click(function(event){
		event.preventDefault();
		document.listForm.reset();
		document.listForm.action = "write";
		document.listForm.submit();
	});
});

function move(v){
	document.listForm.reset();
	document.listForm.idCodes.value = v;
	document.listForm.action = "view";
	document.listForm.submit();
}
</script>      