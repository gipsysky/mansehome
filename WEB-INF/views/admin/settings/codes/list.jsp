<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
        <h1 class="h2">${pageMaker.cri.sType2 eq '' || pageMaker.cri.sType2 eq null ? '코드 관리' : pageMaker.cri.sType2}</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
         
		  <div class="input-group mr-2">
		  	<select id="amount" class="form-control" onChange="list();">
		  		<option value="" <c:out value="${pageMaker.cri.amount eq null? 'selected':'' }"/>>갯수</option>
		  		<option value="20" <c:out value="${pageMaker.cri.amount eq 20? 'selected':''}"/>>20개씩</option>
		  		<option value="50" <c:out value="${pageMaker.cri.amount eq 50? 'selected':''}"/>>50개씩</option>
		  		<option value="100" <c:out value="${pageMaker.cri.amount eq 100? 'selected':''}"/>>100개씩</option>
		  		<option value="200" <c:out value="${pageMaker.cri.amount eq 200? 'selected':''}"/>>200개씩</option>
		  	</select>
		  </div>
		  
          <div class="btn-group mr-2">
            <button type="button" class="btn btn-sm btn-outline-secondary" onClick="javascript:reOrder();">노출순서 일괄적용</button>
          </div> 
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary" onClick="javascript:add();">입력하기</button>
          </div> 
        </div>
      </div>
  
      <div class="table-responsive">
        <table class="table table-striped table-sm border-bottom">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">코드</th>
              <th scope="col">이름</th>
              <th scope="col">카테고리</th>
              <th scope="col">내용</th>
              <th scope="col">노출순서</th>
              <th scope="col">노출여부</th>
              <th scope="col">사용여부</th>
            </tr>
          </thead>
          <form method="post" name="reOrderForm">
          <tbody> 
			<c:forEach items="${codes }" var="list" varStatus="status">
				<input type="hidden" name="codesVOList[${status.index }].idCodes" class="idCodes" value="${list.idCodes }"/>
	            <tr>
	              <td><c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * 10 }"/></td>
	              <td>${list.idCodes }</td>
	              <td><a href="javascript:move('${list.idCodes }');" tabindex="-1">${list.name }</a></td>
					<td><a href="list?pageNum=1&sType=&sWord=&sType2=${list.category1}&idCodes=">${list.category1}</a></td>
	              <td>${list.category2}</td>
	              <td><input name="codesVOList[${status.index }].display_num" class="display_num" type="text" size=3 value="${list.display_num}" style="text-align:center;"/></td>
	              <td>${list.display_flag}</td>
	              <td>${list.use_flag}</td>  
	            </tr>
	        </c:forEach>  
          </tbody>
          </form>
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
		  <div class="input-group-prepend mr-1">     
			  <select name="sType2" id="sType2" class="form-control" onChange="srch();">
			  <option value="">카테고리1</option>
			    <c:forEach items="${codeCategory1Group }" var="code">
					<option value="${code.category1 }" ${code.category1 eq pageMaker.cri.sType2 ? 'selected' :'' }>						
					${code.category1 }</option>
				</c:forEach>
			  </select>
		  </div>
		  <div class="input-group-prepend mr-1">
		    <select id="sType" class="form-control">
					<option value="" <c:out value="${pageMaker.cri.sType eq null?'selected':'' }"/>>선택</option>
					<option value="T" <c:out value="${pageMaker.cri.sType eq 'T'?'selected':'' }"/>>이름</option>
					<option value="C" <c:out value="${pageMaker.cri.sType eq 'C'?'selected':'' }"/>>카테고리1</option>
					<option value="D" <c:out value="${pageMaker.cri.sType eq 'D'?'selected':'' }"/>>카테고리2</option>  
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
<input type="hidden" name="sType2" value="${pageMaker.cri.sType2 }">
<input type="hidden" name="idCodes"> 
<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
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
		srch();
	}); 
});

function add(v){ 
	document.listForm.pageNum.value = 1;
	document.listForm.idCodes.value = "";
	document.listForm.action = "write";
	document.listForm.submit();
}
function move(v){
	document.listForm.reset();
	document.listForm.pageNum.value = 1;
	document.listForm.idCodes.value = v;
	document.listForm.action = "view";
	document.listForm.submit();
}
function list(){
	document.listForm.reset();
	document.listForm.amount.value = $("#amount").val();
	document.listForm.action = "list";
	document.listForm.submit();
}
function reOrder(){ 
	document.reOrderForm.action="./reOrder";
	document.reOrderForm.target="HiddenFrame";
	document.reOrderForm.submit();
}
function srch(){  
	document.listForm.pageNum.value = 1;
	document.listForm.sType.value = $("#sType").val();
	document.listForm.sType2.value = $("#sType2").val();
	document.listForm.sWord.value = $("#sWord").val();
	document.listForm.action = "list";
	document.listForm.submit();			
}
</script>      