<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">IP정보 입력</h1>
</div>

<form method="post" target="HiddenFrame" action="writeOk" class="needs-validation" novalidate name="form"  >
    <input type=hidden name="idAccess_ip" value="${accessIpVO.idAccess_ip}">


    <div class="row mb-3">
        <div class="col-sm-4">비고 <span class="text-muted">(필수)</span></div>
        <div class="col-sm-8">
            <input value="${accessIpVO.name }" type="text" class="form-control" id="name" name="name" required minlength="1">
            <div class="invalid-feedback">필수 정보입니다</div>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-sm-4">아이피 <span class="text-muted">(필수)</span></div>
        <div class="col-sm-8">
            <input value="${accessIpVO.ip }" type="text" class="form-control" id="ip" name="ip" required minlength="1">
            <div class="invalid-feedback">필수 정보입니다</div>
        </div>
    </div>

    <hr class="my-4">

    <div class="col-md-12 text-center">
        <button class="btn btn-primary btn-lg" type="submit" onClick="javascript:ok();">확인</button>
        <c:if test="${accessIpVO.idAccess_ip ne 0 }">
            <button class="btn btn-danger btn-lg" type="button" onClick="javascript:del();">삭제</button>
        </c:if>
        <button class="btn btn-secondary btn-lg" type="button" onClick="javascript:cancel();">취소</button>
    </div>
</form>

<form method="get" name="goForm" action="view">
    <input type=hidden name="idAccess_ip" value="${accessIpVO.idAccess_ip }">
    <input type="hidden" name="pageNum" value="${criteria.pageNum }">
    <input type="hidden" name="sType" value="${criteria.sType}">
    <input type="hidden" name="sType2" value="${criteria.sType2}">
    <input type="hidden" name="sWord" value="${criteria.sWord}">
</form>



<script>
    $(function(){
        var id = "${accessIpVO.idAccess_ip}";
        var result = "${result}";

        //수정일 때, DB에서 가져오는 값이 없으면
        if (id!=0){
            if (result=="noRecord"){
                alert("요청하신 내용이 존재하지 앖습니다");
                history.go(-1);
            }
        }
    });

    function ok(){
        document.form.submit();
    }

    function cancel(){
        document.goForm.action="list";
        document.goForm.submit();
    }
    function del(){
        if (confirm("삭제하시겠습니까?"))
            window.open("delOk?idAccess_ip=${accessIpVO.idAccess_ip}","HiddenFrame");
    }
</script>



