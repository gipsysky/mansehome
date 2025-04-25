<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
        <h1 class="h2">${pageMaker.cri.sType6 eq 'Y' ? "삭제회원 리스트" : "회원관리"}  </h1>
        <div class="btn-toolbar mb-2 mb-md-0">
			<c:if test="${pageMaker.cri.sType6  ne 'Y'}">
				<div class="btn-group me-2">
					<button type="button" class="btn btn-sm btn-outline-secondary delAll">일괄삭제</button>
				</div>
				&nbsp;
				<div class="btn-group me-2">
					<button type="button" class="btn btn-sm btn-outline-secondary write">입력하기</button>
				</div>
			</c:if>
        </div>
      </div>
  
      <div class="table-responsive">
      
        <table class="table table-striped table-sm border-bottom">
          <thead>
            <tr>
              <th scope="col">#</th>
				<th scope="col"><form name = "frmChk"><input type = "checkbox" name = "all_chk" onclick = "CheckV(this, '${pageMaker.total}')"></form></th>
              <th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">군번</th>
				<th scope="col">비상연락처</th>
				<th scope="col">기기</th>
				<th scope="col">대대</th>
				<th scope="col">중대</th>
				<th scope="col">소대</th>
				<th scope="col">특이사항</th>
				<th scope="col">그룹명</th>
				<th scope="col">QR보기</th>
            </tr>
          </thead>
          <tbody> 
			<c:forEach items="${user}" var="list" varStatus="status">
				<tr>
					<td><c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * 10 }"/></td>
					<td><INPUT TYPE="checkbox" CLASS="idx" NAME="idUser" VALUE="${list.idUser}"></td>
					<td>
						<a class="move" href='${list.idUser}'>
							<c:out value="${list.user_id}"/>
						</a>
					</td>
					<td><c:out value="${list.name}"/></td>
					<td><c:out value="${list.army_no}"/></td>
					<td><c:out value="${list.htel}"/></td>
					<td><c:out value="${list.uuid}"/></td>
					<td><c:out value="${list.code2}"/></td>
					<td><c:out value="${list.code3}"/></td>
					<td><c:out value="${list.code4}"/></td>
					<td><c:out value="${list.memo}"/></td>
					<td><c:out value="${list.userGroupVO.group_name}"/></td>
					<td><a href="javascript:;" onClick="myQR('${list.idUser}')">QR</a></td>
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
		 <div class="input-group col-md-10" style="float:none; margin:0 auto;">  
		    
		  <div class="input-group-prepend">
			  <select id="sType8" class="form-control">
				  <option ${ '' eq pageMaker.cri.sType8 ? "selected":"" } value="" <c:out value="${pageMaker.cri.sType8 == null?'selected':'' }"/>>대대</option>
				  <option ${ 1 eq pageMaker.cri.sType8 ? "selected":"" } value="1" <c:out value="${pageMaker.cri.sType8 eq '1'?'selected':'' }"/>>1대대</option>
				  <option ${ 2 eq pageMaker.cri.sType8 ? "selected":"" } value="2" <c:out value="${pageMaker.cri.sType8 eq '2'?'selected':'' }"/>>2대대</option>
				  <option ${ 3 eq pageMaker.cri.sType8 ? "selected":"" } value="3" <c:out value="${pageMaker.cri.sType8 eq '3'?'selected':'' }"/>>3대대</option>
				  <option ${ 4 eq pageMaker.cri.sType8 ? "selected":"" } value="4" <c:out value="${pageMaker.cri.sType8 eq '4'?'selected':'' }"/>>4대대</option>
			  </select>
			  <select id="sType9" class="form-control">
				  <option ${ '' eq pageMaker.cri.sType9 ? "selected":"" } value="" <c:out value="${pageMaker.cri.sType9 == null?'selected':'' }"/>>중대</option>
				  <option ${ 1 eq pageMaker.cri.sType9 ? "selected":"" } value="1" <c:out value="${pageMaker.cri.sType9 eq '1'?'selected':'' }"/>>1중대</option>
				  <option ${ 2 eq pageMaker.cri.sType9 ? "selected":"" } value="2" <c:out value="${pageMaker.cri.sType9 eq '2'?'selected':'' }"/>>2중대</option>
				  <option ${ 3 eq pageMaker.cri.sType9 ? "selected":"" } value="3" <c:out value="${pageMaker.cri.sType9 eq '3'?'selected':'' }"/>>3중대</option>
				  <option ${ 4 eq pageMaker.cri.sType9 ? "selected":"" } value="4" <c:out value="${pageMaker.cri.sType9 eq '4'?'selected':'' }"/>>4중대</option>
			  </select>
			  <select id="sType10" class="form-control">
				  <option ${ '' eq pageMaker.cri.sType10 ? "selected":"" } value="" <c:out value="${pageMaker.cri.sType10 == null?'selected':'' }"/>>소대</option>
				  <option ${ 1 eq pageMaker.cri.sType10 ? "selected":"" } value="1" <c:out value="${pageMaker.cri.sType10 eq '1'?'selected':'' }"/>>1소대</option>
				  <option ${ 2 eq pageMaker.cri.sType10 ? "selected":"" } value="2" <c:out value="${pageMaker.cri.sType10 eq '2'?'selected':'' }"/>>2소대</option>
				  <option ${ 3 eq pageMaker.cri.sType10 ? "selected":"" } value="3" <c:out value="${pageMaker.cri.sType10 eq '3'?'selected':'' }"/>>3소대</option>
				  <option ${ 4 eq pageMaker.cri.sType10 ? "selected":"" } value="4" <c:out value="${pageMaker.cri.sType10 eq '4'?'selected':'' }"/>>4소대</option>
			  </select>
		  </div>

			 &nbsp;&nbsp;&nbsp;

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
					<option value="A" <c:out value="${pageMaker.cri.sType eq 'A'?'selected':'' }"/>>군번</option>
					<option value="H" <c:out value="${pageMaker.cri.sType eq 'H'?'selected':'' }"/>>비상연락처</option>
			</select>
		  </div> 
		  <input type="text" id="sWord" value="${pageMaker.cri.sWord }" class="form-control" aria-label="Text input with dropdown button" placeholder="검색어">
		</div>

		<div class="input-group col-md-10" style="float:none; margin:0 auto;">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary sBtn" type="submit">검색</button>
			</div>
			&nbsp;
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" onClick="document.location.href='list';">목록</button>
			</div>
			 &nbsp;
			 <div class="input-group-append">
				 <button type="button" class="btn btn-sm btn-outline-secondary excelDown">엑셀다운</button>
			 </div>
			 &nbsp;
			 <div class="input-group-append">
				 <button type="button" class="btn btn-sm btn-outline-secondary location">위치보기</button>
			 </div>
		</div> 
      <!-- /Search -->

<!-- 엑셀 업로드 -->
<BR><BR>
<!-- 입력 -->
<form method="post" id="frm" enctype="multipart/form-data" target="HiddenFrame" action="userExcelUpload">
	<input type="hidden" name="job" value="add">
	<div class="input-group col-md-10" style="float:none; margin:0 auto;">
		<div class="input-group-prepend">
			신규 입력
		</div>
		<div class="input-group-prepend">
			<input type="file"  name="files" class="form-control">
		</div>
		<div class="input-group-prepend">
			<button type="submit"  class="btn btn-outline-secondary">파일 업로드</button>
		</div>
		<div class="input-group-prepend">
			<a href="/uploadFile/sampleInsert.xlsx">샘플파일 다운로드</a>
		</div>
	</div>
</form>
<!-- 수정 -->
<form method="post" id="frm2" enctype="multipart/form-data" target="HiddenFrame" action="userExcelUpload">
	<input type="hidden" name="job" value="edit">
	<div class="input-group col-md-10" style="float:none; margin:0 auto;">
		<div class="input-group-prepend">
			정보 수정
		</div>
		<div class="input-group-prepend">
			<input type="file" name="files" class="form-control">
		</div>
		<div class="input-group-prepend">
			<button type="submit" class="btn btn-outline-secondary">파일 업로드</button>
		</div>
		<div class="input-group-prepend">
			<a href="/uploadFile/sampleUpdate.xlsx">샘플파일 다운로드</a>
		</div>
	</div>
</form>
<!--/엑셀 업로드 -->
	
<form method="get" name="listForm">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="sType" value="${pageMaker.cri.sType }">
	<input type="hidden" name="sType2" value="${pageMaker.cri.sType2 }">
	<input type="hidden" name="sType3" value="${pageMaker.cri.sType3 }">
	<input type="hidden" name="sType4" value="${pageMaker.cri.sType4 }">
	<input type="hidden" name="sType5" value="${pageMaker.cri.sType5 }">
	<input type="hidden" name="sType8" value="${pageMaker.cri.sType8 }">
	<input type="hidden" name="sType9" value="${pageMaker.cri.sType9 }">
	<input type="hidden" name="sType10" value="${pageMaker.cri.sType10 }">
	<input type="hidden" name="sType11">
	<input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
	<input type="hidden" name="idUser"> 
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
		document.listForm.sType3.value = $("#sType3").val();
		document.listForm.sType4.value = $("#sType4").val();
		document.listForm.sType5.value = $("#sType5").val();
		document.listForm.sType8.value = $("#sType8").val();
		document.listForm.sType9.value = $("#sType9").val();
		document.listForm.sType10.value = $("#sType10").val();
		document.listForm.sWord.value = $("#sWord").val();
		document.listForm.action = "list";
		document.listForm.submit();		
	});

	$(".move").click(function(event){
		event.preventDefault();
		document.listForm.reset();
		document.listForm.idUser.value = $(this).attr("href");
		document.listForm.action = "view";
		document.listForm.submit();
	});

	$(".write").click(function(event){
		event.preventDefault();
		document.listForm.reset();
		document.listForm.action = "write";
		document.listForm.submit();
	});

	$(".excelDown").click(function(event){
		event.preventDefault();
		document.listForm.action = "excelDown";
		document.listForm.submit();
	});

	$(".location").click(function(event){
		event.preventDefault();
		if ($("#sType8").val()=="" || $("#sType9").val()=="" || $("#sType10").val()=="") {
			alert("대대/중대/소대 를 모두 선택해주십시오");
			return;
		}
		document.listForm.sType8.value = $("#sType8").val();
		document.listForm.sType9.value = $("#sType9").val();
		document.listForm.sType10.value = $("#sType10").val();
		document.listForm.action = "/admin/location/list";
		document.listForm.submit();
	});

	$(".delAll").click(function(event){
		event.preventDefault();
		var str="";
		$(".idx").each(function(){
			if ($(this).prop("checked")){
				if (str!="") {str = str + ","}
				str = str + $(this).val();
			}
		});
		if (str==""){
			alert("체크해주십시오");
			return;
		}
		if (confirm("삭제하시겠습니까?")){
			document.listForm.reset();
			document.listForm.sType11.value = str;
			document.listForm.target = "HiddenFrame";
			document.listForm.action = "delAll";
			document.listForm.submit();
		}
	});
});

function CheckV(e, cnt) {
	if (cnt > 0) {
		if (e.checked) {
			$(".idx").each(function(){
				$(this).attr("checked",true);
			});
		}
		else {
			$(".idx").each(function(){
				$(this).attr("checked",false);
			});
		}
	}
}

function myQR(id){
	window.open("http://google.manse.co.kr/qrcode/makeQR.php?folder=codes_lifebutton&filename=member_"+id+"&print_url=${URL}/web/operation/qrSelect/"+id,"qrFrame","width=500,height=500");
	openLayer('qr-img');
}
</script>      