<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
        <h1 class="h2">관리자 </h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary write">입력하기</button>
          </div> 
        </div>
      </div>
  
      <div class="table-responsive">
      
        <table class="table table-striped table-sm border-bottom">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">아이디</th>
              <th scope="col">그룹명</th>
              <th scope="col">이름</th> 
              <th scope="col">등록일</th>
            </tr>
          </thead>
          <tbody> 
			<c:forEach items="${manager}" var="list" varStatus="status">
				<tr>
					<td><c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * 10 }"/></td>
					<td>
						<a class="move" href='${list.idManager}'>
							<c:out value="${list.manager_id}"/>
						</a>
					</td>
					<td><c:out value="${list.managerGroupVO.group_name}"/></td>
					<td><c:out value="${list.name}"/></td>
					<td><c:out value="${list.wdate}"/></td>
				</tr>
			</c:forEach>  
          </tbody>
        </table>

      </div>
      
 
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
		    <select id="sType2" class="form-control">
		    		<option value="">관리자그룹</option>
		    		<c:forEach items="${managerGroupList }" var="list">
		    			<option value="${list.group_code }" ${ list.group_code eq pageMaker.cri.sType2 ? "selected":"" }>${list.group_name }</option>
		    		</c:forEach>  
		    </select>
		  </div>      
		  <div class="input-group-prepend">
		    <select id="sType" class="form-control">
					<option value="" <c:out value="${pageMaker.cri.sType == null?'selected':'' }"/>>선택</option>
					<option value="T" <c:out value="${pageMaker.cri.sType eq 'T'?'selected':'' }"/>>이름</option>
					<option value="C" <c:out value="${pageMaker.cri.sType eq 'C'?'selected':'' }"/>>그룹명</option>  
		    </select>
		  </div> 
		  <input type="text" id="sWord" value="${pageMaker.cri.sWord }" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어를 입력하세요">
		  <div class="input-group-append">
		    <button class="btn btn-outline-secondary sBtn" type="submit">검색</button>
		  </div>
		  <div class="input-group-append">
		    <button class="btn btn-outline-secondary" type="button" onClick="document.location.href='list';">목록</button>
		  </div>
		</div> 
      <!-- /Search -->

	
<form method="get" name="listForm">
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
<input type="hidden" name="sType" value="${pageMaker.cri.sType }">
<input type="hidden" name="sType2" value="${pageMaker.cri.sType2 }">
<input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
<input type="hidden" name="idManager"> 
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
		document.listForm.pageNum.value = 1;
		document.listForm.sType.value = $("#sType").val();
		document.listForm.sType2.value = $("#sType2").val();
		document.listForm.sWord.value = $("#sWord").val();
		document.listForm.action = "list";
		document.listForm.submit();		
	});

	$(".move").click(function(event){
		event.preventDefault();
		document.listForm.reset();
		document.listForm.idManager.value = $(this).attr("href");
		document.listForm.action = "view";
		document.listForm.submit();
	});

	$(".write").click(function(event){
		event.preventDefault();
		document.listForm.reset();
		document.listForm.action = "write";
		document.listForm.submit();
	});
});
</script>      