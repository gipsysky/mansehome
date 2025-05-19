<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
    <h1 class="h2">홈페이지 접속로그</h1>
</div>

<div class="table-responsive">
    <table class="table table-striped table-sm border-bottom">
        <thead>
        <tr>
            <th>#</th>
            <th>날짜</th>
            <th>시간</th>
            <th>페이지 URL</th>
            <th>IP 주소</th> 
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${accessList}" var="log" varStatus="status">
            <tr>
                <td><c:out value="${(pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * 10}"/></td>
                <td><c:out value="${log.access_Date}"/></td>
                <td><c:out value="${log.access_Time}"/></td>
                <td><c:out value="${log.url_desc}"/></td>
                <td><c:out value="${log.ip_Address}"/></td> 
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- pagination -->
    <div class="col-md-3" style="float:none; margin:0 auto;">
        <nav aria-label="Page navigation">
            <ul class="pagination" style="justify-content: center">
                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a href="${pageMaker.startPage - 1}" class="page-link"><span aria-hidden="true">&laquo;</span></a>
                    </li>
                </c:if>

                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                        <a href="${num}" class="page-link">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="page-item">
                        <a href="${pageMaker.endPage + 1}" class="page-link"><span aria-hidden="true">&raquo;</span></a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
    <!-- /pagination -->
</div>


<form method="get" name="listForm">
    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    <input type="hidden" name="sType" value="${pageMaker.cri.sType }">
    <input type="hidden" name="sType2" value="${pageMaker.cri.sType2 }">
    <input type="hidden" name="sType3" value="${pageMaker.cri.sType3 }">
    <input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
    <input type="hidden" name="idVendor">
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
            document.listForm.sWord.value = $("#sWord").val();
            document.listForm.action = "list";
            document.listForm.submit();
        });

        $(".write").click(function(event){
            event.preventDefault();
            document.listForm.reset();
            document.listForm.action = "write";
            document.listForm.submit();
        });
    });

    function move(v){
        document.listForm.reset();
        document.listForm.idVendor.value = v;
        document.listForm.action = "write";
        document.listForm.submit();
    }
</script>