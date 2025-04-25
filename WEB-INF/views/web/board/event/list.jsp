<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<c:if test="${cnfVO.header_url ne null }">
<jsp:include page="${cnfVO.header_url }" flush="true">
	<jsp:param name="pageDef" value="${pageMaker.cri.pageDef }"/>
</jsp:include>
</c:if>

<div class="item-list-wrap col-3">
	<ul class="item-list">
			<c:forEach items="${dataList }" var="list" varStatus="status">
				<fmt:parseDate value="${list['fld5']}" var="parsedSdate" pattern="yyyy-MM-dd"/>
				<fmt:parseDate value="${list['fld6']}" var="parsedEdate" pattern="yyyy-MM-dd"/>
				<li onClick="move('${list.idTbl_data}','${list.pw ne null ? 1 : 0}')">
					<div class='thumb'><span><img src='${list['fld4']}' width='355' ></span></div>
					<div class='item-info'>
						<strong>${list['fld2']}</strong>
						<p class='desc'><fmt:formatDate value="${parsedSdate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${parsedEdate}" pattern="yyyy.MM.dd"/> </p>
						<span class='more'>자세히 보기 &gt;</span>
					</div>
				</li>
			</c:forEach>
	</ul>


      </div>
      <!-- /.customer-center -->
    </div>
    <!-- /.sub-content -->
  </div>
  <!-- /.container -->
</div>
<!-- /#content -->  


<!--  비밀번호 입력 창 -->
<div class="popup" id="passPop"> 
	<div class="popup-header">
		<h1>비밀번호를 입력하세요</h1>
		<button type="button" class="btn-x">&times;</button>
	</div>
	<div class="popup-body"> 
		<form name="passForm" method="post" target="HiddenFrame">
		<input type="password" name="pw" class="form-control"/>
		</form>
	</div>
	<div class="popup-footer">
		<button type="button" class="btn lightblue btn-lg" onClick="move('','2')" type="button">확인</button>
		<button type="button" class="btn btn-lg btn-x">닫기</button>
	</div> 
</div>   

<form method="get" name="listForm">
<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
<input type="hidden" name="sType" value="${pageMaker.cri.sType }">
<input type="hidden" name="sType2" value="${pageMaker.cri.sType2 }">
<input type="hidden" name="sType3" value="${pageMaker.cri.sType3 }">
<input type="hidden" name="sType4" value="${pageMaker.cri.sType4 }">
<input type="hidden" name="sType5" value="${pageMaker.cri.sType5 }">
<input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
<input type="hidden" name="idTbl_cnf" value="${cnfVO.idTbl_cnf }">
<input type="hidden" name="pageDef" value="${pageMaker.cri.pageDef }">
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
  
	$(".write").click(function(event){
		event.preventDefault();
		document.listForm.reset();
		document.listForm.action = "/web/board/data/write";
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