<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${cnfVO.header_url ne null }">
<jsp:include page="${cnfVO.header_url }" flush="true">
	<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
	<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
</jsp:include>
</c:if>

	      <div class="board-list">
			<table class="table">
			<colgroup>
              <col width="10%"/>
              <c:forEach items="${fldList }" var="list">
              	<col width="*"/>
              </c:forEach> 
			</colgroup>
			<thead>
			<tr>
              <th scope="col" width="10%">번호</th>
              <c:forEach items="${fldList }" var="fldList">
              	<c:choose>
	              	<c:when test="${fldList.fld_code eq '2' }">
	              		<th width="*" scope="col">${fldList.fld_name }</th>
	              	</c:when>
	              	<c:otherwise>
	              		<th width="15%" scope="col">${fldList.fld_name }</th>
	              	</c:otherwise>
              	</c:choose>
              </c:forEach>
			</tr>
			</thead>
			<tbody> 
			<c:forEach items="${dataList }" var="list" varStatus="status"> 
				<tr onClick="move('${list.idTbl_data}','${list.pw ne null && list.pw ne '' ? 1 : 0}')">
					<td>
						<c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount }"/>
					</td>
					
					<c:set var="data" value=""/>
					<c:forEach items="${fldList }" var="fldList">
						<c:set var="fldcode" value="fld${fldList.fld_code }"/>
						<td ${fldcode eq 'fld2' ? 'style=\'text-align:left\'' : '' }>
							
							<c:choose>
								<c:when test="${fldcode eq 'fld2' }"> <!-- fld2는 고정필드 : 제목 -->
									<c:forEach var="i" begin="1" end="${list.levelRef }">
										&nbsp;&nbsp;&nbsp;
									</c:forEach>
									<c:if test="${list.levelRef > 0 }"> <B>ㄴ</B> </c:if>
									
									${list[fldcode]}
									
									${list.isLocked eq 'Y' || list.pw ne null ? '<!--i class="fa fa-lock"></i-->' : ''}
								</c:when>
								<c:when test="${fldList.fld_type eq 'date' || fldList.fld_type eq 'sdate' || fldList.fld_type eq 'edate' }">
									<fmt:parseDate value="${list[fldcode]}" var="parseDelv_date" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${parseDelv_date}" pattern="yyyy.MM.dd"/>
								</c:when>
								<c:otherwise>
									${fldList.prefix } 
									${list[fldcode] }
									${fldList.suffix }
								</c:otherwise>
							</c:choose>							
							
						</td>
					</c:forEach> 
				</tr>
	        </c:forEach>    
			</tbody>
			</table>

			  <jsp:include page="../include/inc_paging.jsp" flush="true">
				  <jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
				  <jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
			  </jsp:include>

			  <jsp:include page="../include/inc_list_actions.jsp" flush="true">
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
      <!-- /.customer-center -->
    </div>
    <!-- /.sub-content -->
  </div>
  <!-- /.container -->
</div>
<!-- /#content -->

