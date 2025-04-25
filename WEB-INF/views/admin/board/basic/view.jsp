<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("BR","\n"); %>
     <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">상세보기</h1>
      </div>
 

<c:forEach items="${fldList }" var="list">   
	<div class="container">
		<div class="row mb-3">
			<div class="col-sm-4">
				${list.fld_name}
				
				<c:if test="${list.required_fg eq 'Y'}">
					<font color="red">*</font>
				</c:if>					
			</div>
			<div class="col-sm-8">
	
				<c:set var="fldcode" value="fld${list.fld_code }"/>

				${list.prefix }
				<c:choose>				
					<c:when test="${list.fld_type eq 'image' and dataVO[fldcode] ne '' }">
						<img src="${dataVO[fldcode] }" class="img-fluid">
					</c:when>
					<c:when test="${list.fld_type eq 'file' and dataVO[fldcode] ne '' }">
						<c:set var="fileArr" value="${fn:split(dataVO[fldcode], '|')}"/>
						<c:if test="${fileArr[0] ne 'null' }">
							<a href="${fileArr[1]}">${fileArr[0]}</a>
						</c:if>
					</c:when>
					<c:otherwise>
						${fn:replace(dataVO[fldcode], BR, "<br>")}
					</c:otherwise>
				</c:choose>
				${list.suffix }
	  	 
			</div> 
		</div> 
	</div> 
</c:forEach>

	
      <hr class="my-4">

      <div class="col-md-12 text-center"> 
		<c:if test="${cnfVO.reply_fg eq 'Y' }">
			<button class="btn btn-secondary btn-lg" type="button" onClick="reply();">답글</button> 
		</c:if>	
      	
      	<button class="btn btn-secondary btn-lg" type="button" onClick="modify();">수정</button> 
      	<button class="btn btn-primary btn-lg" type="button" onClick="list();">목록</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="del();">삭제</button> 
	
	<c:if test="${cnfVO.comment_fg eq 'Y' }">
      	<button class="btn btn-secondary btn-lg" type="button" onClick="comment();">댓글</button> 
	</c:if>	 
 	  </div>

<c:if test="${cnfVO.comment_fg eq 'Y'}">
<!-- 댓글 목록 -->
	<BR><BR>
	<div id="comment_list" class="mt-20"></div>

	<!--  댓글달기  창 -->
	<div class="modal fade" id="commentPop" tabindex="-1" role="dialog" aria-labelledby="modPopLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">	
		<div class="modal-header">
        	<h5 class="modal-title" id="modPopLabel">댓글을 입력하세요</h5>		
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>	
		</div>
		<div class="modal-body"> 
			<form name="commentFrm" method="post" target="HiddenFrame" enctype="multipart/form-data">
			<input type="hidden" name="idTbl_comment"> 
			<input type="hidden" name="idTbl_data" value="${dataVO.idTbl_data }">
			<input type="hidden" name="idTbl_cnf" value="${dataVO.idTbl_cnf }"> 	
			<input type="hidden" name="upfile"><!-- 파일첨부 -->
			<input type="hidden" name="gubun" value="web">
			<input type="hidden" name="isReply" value="N">
			<textarea name="comment" width="100%" rows=10 class="form-control"></textarea>
			</form>
		</div>
		<div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" onClick="commentOk();">저장</button>
		</div> 
		</div>
	  </div>
	</div>    

	<form method="get" name="commentGoForm">
	<input type="hidden" name="page" value="1">
	</form>

    <script>

        //*******************************************************************
        //댓글 시작
        //*******************************************************************
        $(function(){
            comment_list(1);
        });
        function comment_list(page){
            $.get("/admin/board/data/list/comment?pageNum="+page+"&idTbl_data=${dataVO.idTbl_data}&idTbl_cnf=${dataVO.idTbl_cnf}", function(r){
                $("#commentPop").modal('hide');
                document.commentFrm.comment.value="";
                $("#comment_list").html(r);
            });
            document.commentGoForm.page.value = page;
        }
        function comment(){
            document.commentFrm.comment.value="";
            document.commentFrm.idTbl_comment.value="";
            document.commentFrm.isReply.value="N";
            $("#commentPop").modal();
        }
        function editComment(v){
            $.get("/web/board/data/view/jsonComment?idTbl_comment="+v, function(r){
                document.commentFrm.comment.value= r.data.comment;
                document.commentFrm.idTbl_comment.value= r.data.idTbl_comment;
                document.commentFrm.isReply.value="N";
                $("#commentPop").modal();
            });
        }
        function replyComment(v){
            document.commentFrm.comment.value="";
            document.commentFrm.idTbl_comment.value=v;
            document.commentFrm.isReply.value="Y";
            $("#commentPop").modal();
        }
        function commentOk(){
            var f = document.commentFrm;
            if (f.comment.value==""){
                alert('내용을 입력해주십시오');
                return;
            }
            f.action="/admin/board/data/commentOk";
            f.target="HiddenFrame";
            f.submit();
        }
        function delComment(v){
            if (confirm("삭제하시겠습니까?")){
                document.commentFrm.idTbl_comment.value=v;
                document.commentFrm.action="/web/board/data/delComment";
                document.commentFrm.target="HiddenFrame";
                document.commentFrm.submit();
            }
        }

        //*******************************************************************
        //댓글 끝
        //*******************************************************************
    </script>

</c:if>

<form method="post" name="goForm" action="list">
<input type=hidden name="idTbl_cnf" value="${dataVO.idTbl_cnf}">
<input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
<input type="hidden" name="pw" value="${dataVO.pw}">
<input type="hidden" name="isReply" value="N">
</form> 


<script>
function modify(){
	document.goForm.action="write";
	document.goForm.target="_self";
	document.goForm.submit();
}

function reply(){
	document.goForm.isReply.value = "Y";
	document.goForm.action="write";
	document.goForm.target="_self";
	document.goForm.submit();
}

function del(){
	if (confirm("삭제하시겠습니까?")){
		document.goForm.action="del";
		document.goForm.target="HiddenFrame";
		document.goForm.submit();	
	}
}

function list(){
	document.goForm.action="list";
	document.goForm.target="_self";
	document.goForm.submit();
}
</script>



      