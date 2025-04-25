<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/global.jsp" %>


<form method="get" name="listForm"> <!--get 안하면 로그인 후 이 위치로 이동 시 에러-->
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

<div class="board-search">
    <div class="row">
        <!--추가 검색-->
        <c:forEach items="${addSrchList}" var="slist" varStatus="status">
            <c:choose>
                <c:when test="${slist.fld_type eq 'sdate'}">
                    <input type="hidden" name="sListType" value="ge_date"/>
                    <input type="hidden" name="sListName" value="fld${slist.fld_code}"/>
                    <input type="text" name="sListVal" value="${slist.sVal}" placeholder="${slist.fld_name}" size="10" class="form-control mr-2 datepicker" autocomplete="off"/>
                </c:when>
                <c:when test="${slist.fld_type eq 'edate'}">
                    <input type="hidden" name="sListType" value="le_date"/>
                    <input type="hidden" name="sListName" value="fld${slist.fld_code}"/>
                    <input type="text" name="sListVal" value="${slist.sVal}" placeholder="${slist.fld_name}" size="10" class="form-control mr-2 datepicker" autocomplete="off"/>
                </c:when>
                <c:when test="${slist.fld_type eq 'date'}">
                    <input type="hidden" name="sListType" value="eq_date"/>
                    <input type="hidden" name="sListName" value="fld${slist.fld_code}"/>
                    <input type="text" name="sListVal" value="${slist.sVal}" placeholder="${slist.fld_name}" size="10" class="form-control mr-2 datepicker" autocomplete="off"/>
                </c:when>
                <c:when test="${slist.fld_type eq 'radio' || slist.fld_type eq 'dropdown'}">
                    <input type="hidden" name="sListType" value="eq"/>
                    <input type="hidden" name="sListName" value="fld${slist.fld_code}"/>
                    <select name="sListVal" class="form-control mr-2">
                        <option value="">${slist.fld_name}</option>
                        <c:forEach items="${slist.codesList}" var="clist">
                            <option value="${clist.idCodes}" ${clist.idCodes eq slist.sVal ? 'selected' : ''}>${clist.name}</option>
                        </c:forEach>
                    </select>
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="sListType" value="eq"/>
                    <input type="hidden" name="sListName" value="fld${list.fld_code}"/>
                    <input type="text" name="sListVal" placeholder="${slist.fld_name}" size="10" class="form-control mr-2" autocomplete="off"/>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!--기본 검색-->
        <div class="col-xs-4">
            <select id="sType" class="form-control">
                <option <c:out value="${pageMaker.cri.sType eq null?'selected':'' }"/> value="">선택</option>
                <c:forEach items="${srchFldList }" var="srchFld">
                    <c:set var="fld" value="Fld${srchFld.fld_code }"/>
                    <option
                            <c:out value="${pageMaker.cri.sType eq fld ? 'selected':'' }"/>
                            value="fld${srchFld.fld_code }">${srchFld.fld_name } </option>
                </c:forEach>
            </select>
        </div>
        <div class="col-xs-8 search-key">
            <input type="text" id="sWord" class="form-control" value="" maxlength="50" value="${pageMaker.cri.sWord }">
            <button type="button" class="btn gray sBtn">검색</button>
            <%-- <button type="button" class="btn " onClick="document.location.href='list?idTbl_cnf=${cnfVO.idTbl_cnf}';">초기화</button> --%>
        </div>
    </div>
</div>
</form>

<script>
    $(function(){
        $(".pagination a").click(function(event){
            event.preventDefault();
            document.listForm.pageNum.value = $(this).attr("href");
            document.listForm.action = "list";
            document.listForm.method = "get";
            document.listForm.submit();
        });

        $(".sBtn").click(function(event){
            event.preventDefault();
            document.listForm.pageNum.value = 1;
            document.listForm.action = "list";
            document.listForm.method = "get";
            document.listForm.submit();
        });

        $(".write").click(function(event){
            event.preventDefault();
            document.listForm.action = "/web/board/data/write";
            document.listForm.submit();
            document.listForm.pw.value ="";
            document.listForm.idTbl_data.value ="";
        });
    });

    function move(v, pass_fg){
        document.listForm.idTbl_data.value = v;
        document.listForm.action = "/web/board/data/view";
        document.listForm.submit();
        document.listForm.pw.value ="";
        document.listForm.idTbl_data.value ="";
    }
</script>