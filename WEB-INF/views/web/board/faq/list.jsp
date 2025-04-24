<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ include file="/WEB-INF/views/global.jsp" %>

<c:if test="${cnfVO.header_url ne null }">
<jsp:include page="${cnfVO.header_url }" flush="true">
	<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
	<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
</jsp:include>
</c:if>


<c:set var="url" value="/web/board/data/list?idTbl_cnf=${G_ID_FAQ }&sType=fld4"/>

        <div class="faq-content">
          <div class="faq-category tab-nav mb-0">
            <!-- [D] 메뉴 활성화시 .active 추가 -->
            <ul>
              <li ${pageMaker.cri.sWord eq null ? 'class="active"' : ''}><a href="${url}">전체</a></li>
              <li ${pageMaker.cri.sWord eq 242 ? 'class="active"' : ''}><a href="${url}&sWord=242">계정 찾기</a></li>
              <li ${pageMaker.cri.sWord eq 243 ? 'class="active"' : ''}><a href="${url}&sWord=243">회원정보</a></li>
              <li ${pageMaker.cri.sWord eq 244 ? 'class="active"' : ''}><a href="${url}&sWord=244">배송관련</a></li>
              <li ${pageMaker.cri.sWord eq 245 ? 'class="active"' : ''}><a href="${url}&sWord=245">상품문의</a></li>
              <li ${pageMaker.cri.sWord eq 246 ? 'class="active"' : ''}><a href="${url}&sWord=246">반품/교환</a></li>
              <li ${pageMaker.cri.sWord eq 247 ? 'class="active"' : ''}><a href="${url}&sWord=247">주문결제</a></li>
              <li ${pageMaker.cri.sWord eq 248 ? 'class="active"' : ''}><a href="${url}&sWord=248">적립금/쿠폰</a></li>
            </ul>
          </div>
          
          <dl class="faq-list use-faq">
			<c:forEach items="${dataList }" var="list" varStatus="status"> 
				<dt><a href='#'>
						<c:set var="fldcode" value="fld2"/>
						${list[fldcode]}
				</a></dt>
				<dd>
						<c:set var="fldcode" value="fld3"/>
						${list[fldcode]}
				</dd> 
	        </c:forEach> 
          </dl>
          
	      <div class="board-list"> 
	 
			<div class="pagination">
				<a href="1" class="first"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<a href="${pageMaker.startPage-1}" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a> 
				</c:if>
				
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<a href='${num}' ${pageMaker.cri.pageNum == num ? 'class=\'active\'':'' }> ${num}</a> 
				</c:forEach>
				
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<a href="${pageMaker.endPage + 1 }" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a> 
				</c:if>	
				<a href="${pageMaker.totalEnd}" class="end"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
			 </div> 
			  

        </div>
        <!-- /.board-list -->
      </div>
      <!-- /.customer-center -->
    </div>
    <!-- /.sub-content -->
  </div>
  <!-- /.container -->
</div>
<!-- /#content -->  

 
<form method="get" name="listForm">
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
<input type="hidden" name="sType" value="${pageMaker.cri.sType }">
<input type="hidden" name="sType2" value="${pageMaker.cri.sType2 }">
<input type="hidden" name="sType3" value="${pageMaker.cri.sType3 }">
<input type="hidden" name="sType4" value="${pageMaker.cri.sType4 }">
<input type="hidden" name="sType5" value="${pageMaker.cri.sType5 }">
<input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
<input type="hidden" name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"> 
<input type="hidden" name="idTbl_data" >  
<input type="hidden" name="pw" > 
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
		document.listForm.sWord.value = $("#sWord").val();
		document.listForm.action = "list";
		document.listForm.submit();		
	});  
}); 

function move(v, pass_fg){  
	if (pass_fg == 1){
		document.listForm.reset();
		document.listForm.method="post"; // 비밀번호가 있는 비밀글인 경우에는 query string 에 pw 값이 보이지않게 하기 위해 post 
		document.listForm.idTbl_data.value = v;
		document.listForm.action = "/web/board/data/view";
		openLayer("passPop");
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
		document.listForm.action = "/web/board/data/view";
	}
	
	document.listForm.submit();
}
</script>      