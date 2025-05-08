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
            <div class="board-header">
                <ul>
                    <li> </li>
                    <c:forEach items="${fldList }" var="fldList">
                        <li>${fldList.fld_name }</li>
                    </c:forEach>
                </ul>
            </div>
            <ul class="board3">
              <c:forEach items="${dataList }" var="list" varStatus="status">
                  <li onClick="move('${list.idTbl_data}','${list.pw ne null && list.pw ne '' ? 1 : 0}')">

                      <!--번호
                      <a href=""><c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount }"/></a>
					  -->

                  <c:set var="v" value=""/>
                  <c:forEach items="${fldList }" var="fldList">
                    <c:set var="fldcode" value="fld${fldList.fld_code }"/>

                      <c:choose>
                        <c:when test="${fldcode eq 'fld2' }">

                          <!-- fld2는 고정필드 : 제목 -->
                          <a href="javascript:;">
                          <strong>
                          <c:forEach var="i" begin="1" end="${list.levelRef }">
                            &nbsp;&nbsp;&nbsp;
                          </c:forEach>
                          <c:if test="${list.levelRef > 0 }"> <img src="/images/common/reply.gif" border="0" align="absmiddle"> </c:if>

                          <img src="/images/common/lock.gif"> ${list[fldcode]}

                          ${list.isLocked eq 'Y' || list.pw ne null ? '<!--i class="fa fa-lock"></i-->' : ''}
                          </strong>
                          </a>
                        </c:when>
                        <c:when test="${fldcode eq 'fld1' }">
                          <!-- fld2는 고정필드 : 글쓴이 -->
                          <span class="writer"> 
                          <img src="/images/common/lock.gif"> ${list[fldcode]} 
                          </span> 
                        </c:when>
                        <c:when test="${fldList.fld_type eq 'date' || fldList.fld_type eq 'sdate' || fldList.fld_type eq 'edate' }">
                          <!--작성일-->
                          <span class="date">
                          <fmt:parseDate value="${list[fldcode]}" var="parseDelv_date" pattern="yyyy-MM-dd"/>
                          <fmt:formatDate value="${parseDelv_date}" pattern="yyyy.MM.dd"/>
                          </span>
                        </c:when>
                        <c:otherwise> 
                              ${fldList.prefix }
                              ${list[fldcode] }
                              ${fldList.suffix }
                        </c:otherwise>

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


<div id="passPop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog custom-modal-sm" role="document">
        <div class="modal-content">
            <form name="passForm" method="post" target="HiddenFrame">
                <input type="hidden" name="idTbl_data" value="${dataVO.idTbl_data}">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">비밀번호 입력</h5>
                </div>
                <div class="modal-body">
                    <input type="password" name="pw" class="form-control"/>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary-line float-right mt-2 " data-dismiss="modal">닫기</button>
                    <button class="btn btn-secondary float-right mt-2 " onClick="move('','2')" type="button">확인</button>
                </div>
            </form>
        </div>
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
            document.listForm.pw.value ="";
            document.listForm.idTbl_data.value ="";
            document.listForm.submit();
        });
    });


    function move(v, pass_fg){
        if (pass_fg == 1){
            document.listForm.reset();
            document.listForm.method="post"; // 비밀번호가 있는 비밀글인 경우에는 query string 에 pw 값이 보이지않게 하기 위해 post
            document.listForm.idTbl_data.value = v;
            document.listForm.action = "/web/board/data/view";
            $("#passPop").modal();
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
            document.listForm.action = "view";
        }

        document.listForm.submit();
    }
</script>