<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="content" class="board">
    <div class="container">

        <c:if test="${cnfVO.header_url ne null }">
            <jsp:include page="${cnfVO.header_url }" flush="true">
                <jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
                <jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
            </jsp:include>
        </c:if>

        <div class="board-list" data-aos="fade-down" data-aos-delay="400">
            <ul>
              <c:forEach items="${dataList }" var="list" varStatus="status">
                <li>
                  <c:set var="v" value=""/>
                  <c:forEach items="${fldList }" var="fldList">
                    <c:set var="fldcode" value="fld${fldList.fld_code }"/>

                      <c:choose>
                        <c:when test="${fldcode eq 'fld2' }"> <!-- fld2는 고정필드 : 제목 -->

                          <a href="javascript:;" onClick="move('${list.idTbl_data}','${list.pw ne null && list.pw ne '' ? 1 : 0}')">
                          <strong>
                          <c:forEach var="i" begin="1" end="${list.levelRef }">
                            &nbsp;&nbsp;&nbsp;
                          </c:forEach>
                          <c:if test="${list.levelRef > 0 }"> <B>ㄴ</B> </c:if>

                          ${list[fldcode]}

                          ${list.isLocked eq 'Y' || list.pw ne null ? '<!--i class="fa fa-lock"></i-->' : ''}
                          </strong>
                          </a>
                        </c:when>
                        <c:when test="${fldList.fld_type eq 'date' || fldList.fld_type eq 'sdate' || fldList.fld_type eq 'edate' }">

                          <span class="date">
                            <!--작성자-->${list["fld1"]}&nbsp;&nbsp;&nbsp;&nbsp;
                          <fmt:parseDate value="${list[fldcode]}" var="parseDelv_date" pattern="yyyy-MM-dd"/>
                          <fmt:formatDate value="${parseDelv_date}" pattern="yyyy.MM.dd"/>
                          </span>
                        </c:when>

                      </c:choose>

                  </c:forEach>
                </li>
              </c:forEach>
            </ul>
        </div>

      <jsp:include page="../include/inc_paging.jsp" flush="true">
        <jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
        <jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
      </jsp:include>


            <c:if test="${auth_write eq 'true'}">
                <c:if test="${sessionScope.U_LOGIN eq 'Y' || cnfVO.private_fg eq 'N'}">
                    <div class="btn-box">
                        <button type="button" class="btn line gray write">글쓰기</button>
                    </div>
                </c:if>
            </c:if>


</div>
</div>



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