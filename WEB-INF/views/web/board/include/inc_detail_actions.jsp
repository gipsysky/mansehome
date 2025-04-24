<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/global.jsp" %>

<!--  비밀번호 입력 창 -->
<div class="popup" id="passPop" style="display:none">
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
        <button type="button" class="btn lightblue btn-lg" onClick="act('','2')" type="button">확인</button>
        <button type="button" class="btn btn-lg btn-x">닫기</button>
    </div>
</div>

<form method="post" name="goForm">
    <input type=hidden name="idTbl_cnf" value="${dataVO.idTbl_cnf}">
    <input type=hidden name="idTbl_data" value="${dataVO.idTbl_data}">
    <input type="hidden" name="pageNum" value="${criteria.pageNum }">
    <input type="hidden" name="sType" value="${criteria.sType}">
    <input type="hidden" name="sWord" value="${criteria.sWord}">
    <input type="hidden" name="gubun" value="web">
    <input type="hidden" name="pw" value="">
    <input type="hidden" name="isReply" value="N">
</form>


<script>
    $(function(){
        $(".reply").click(function(event){
            event.preventDefault();
            document.goForm.reset();
            document.goForm.isReply.value = "Y";
            document.goForm.action = "write";
            document.goForm.target="_self";
            document.goForm.submit();
        });
    });
    function list(){
        document.goForm.action="/web/board/data/list";
        document.goForm.idTbl_data.value=""; // 리스트에 갈 때 id 값을 가지고 가면 안됨
        document.goForm.action="list";
        document.goForm.target="_self";
        document.goForm.submit();
    }
    function act(job,pass_fg){
        if (job!=""){
            document.goForm.action = job;

            if (job == "write") {
                document.goForm.target = "_self";
            }else {
                document.goForm.target = "HiddenFrame";
            }
        }
        if (pass_fg == 1){
            document.goForm.method="post"; // 비밀번호가 있는 비밀글인 경우에는 query string 에 pw 값이 보이지않게 하기 위해 post
            openLayer("passPop");
            document.passForm.pw.focus();
            return;

        }else if (pass_fg == 2){
            if (document.passForm.pw.value == ""){
                alert("비밀번호를 입력해주십시오");
                document.passForm.pw.focus();
                return;
            }
            document.goForm.pw.value = document.passForm.pw.value;

        }else if(job == "del"){
            if (!confirm("삭제하시겠습니까?")){
                return;
            }
        }

        document.goForm.submit();
        document.goForm.pw.value = "";
    }
</script>
