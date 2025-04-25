<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/global.jsp" %>

<!-- 댓글 목록 -->
<div class="board-list">
    <div id="comment_list">
    </div>

<c:if test="${sessionScope.U_LOGIN eq 'Y' && auth_write eq 'true'}">
    <div class="btn-box">
        <c:if test="${cnfVO.comment_fg eq 'Y' }">
            <button type="button" class="btn line" onClick="comment();">댓글작성</button>
        </c:if>
    </div>
</c:if>
</div>
<form name="commentFrm" method="post" target="HiddenFrame" enctype="multipart/form-data">
<input type="hidden" name="idTbl_comment">
<input type="hidden" name="idTbl_data" value="${dataVO.idTbl_data }">
<input type="hidden" name="idTbl_cnf" value="${dataVO.idTbl_cnf }">
<input type="hidden" name="upfile"><!-- 파일첨부 -->
<input type="hidden" name="gubun" value="web">
<input type="hidden" name="isReply" value="N">
<c:if test="${sessionScope.U_LOGIN ne 'Y' || auth_write ne 'true'}">
    <input type="hidden" name="comment" value="">
</c:if>
<c:if test="${sessionScope.U_LOGIN eq 'Y' && auth_write eq 'true'}">
    <!--  댓글달기  창 -->
    <div class="popup" id="commentPop">
        <div class="popup-header">
            <h1>댓글을 입력하세요</h1>
            <button type="button" class="btn-x">&times;</button>
        </div>
        <div class="popup-body">
                <textarea name="comment" width="100%" rows=10 class="form-control"></textarea>
        </div>
        <div class="popup-footer">
            <button type="button" class="btn lightblue btn-lg" onClick="commentOk();" type="button">확인</button>
            <button type="button" class="btn btn-lg btn-x">닫기</button>
        </div>
    </div>

</c:if>
</form>

<form method="get" name="commentGoForm">
    <input type="hidden" name="page" value="1">
</form>
<script>
//*******************************************************************
//  댓글
//*******************************************************************
$(function(){
    comment_list(1);
});
function comment_list(page){
    $.get("/web/board/data/list/comment?pageNum="+page+"&idTbl_data=${dataVO.idTbl_data}&idTbl_cnf=${dataVO.idTbl_cnf}", function(r){
        hideLayer("commentPop");
        document.commentFrm.comment.value="";
        $("#comment_list").html(r);
    });
    document.commentGoForm.page.value = page;
}
function comment(){
    document.commentFrm.comment.value="";
    document.commentFrm.idTbl_comment.value="";
    document.commentFrm.isReply.value="N";
    openLayer("commentPop");
}
function editComment(v){
    $.get("/web/board/data/view/jsonComment?idTbl_comment="+v, function(r){
        document.commentFrm.comment.value= r.data.comment;
        document.commentFrm.idTbl_comment.value= r.data.idTbl_comment;
        document.commentFrm.isReply.value="N";
        openLayer("commentPop");
    });
}
function replyComment(v){
    document.commentFrm.comment.value="";
    document.commentFrm.idTbl_comment.value=v;
    document.commentFrm.isReply.value="Y";
    openLayer("commentPop");
}
function commentOk(){
    var f = document.commentFrm;
    if (f.comment.value==""){
        alert('내용을 입력해주십시오');
        return;
    }
    f.action="commentOk";
    f.target="HiddenFrame";
    f.submit();
}
function delComment(v){
    if (confirm("삭제하시겠습니까?")){
        document.commentFrm.idTbl_comment.value=v;
        document.commentFrm.action="delComment";
        document.commentFrm.target="HiddenFrame";
        document.commentFrm.submit();
    }
}
</script>