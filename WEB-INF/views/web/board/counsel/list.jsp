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
			<thead>
			<tr>
              <th scope="col" width="10%">번호</th>
              <th scope="col" width="10%">문의구분</th>
              <th scope="col" width="*">제목</th>
              <th scope="col" width="15%">작성자명</th>
              <th scope="col" width="10%">등록일</th>
              <th scope="col" width="10%">답변여부</th>
			</tr>
			</thead>
			<tbody> 
			<c:forEach items="${dataList }" var="list" varStatus="status"> 
				<tr onClick="move('${list.idTbl_data}','${list.pw ne null ? 1 : 0}')"> 
					<td>
						<c:out value="${ (pageMaker.total - status.index) - (pageMaker.cri.pageNum - 1) * pageMaker.cri.amount }"/>
					</td>
					<td>
						<c:set var="fldcode" value="fld12"/>
						${list[fldcode]}
					</td>
					<td style="text-align:left">
						<c:set var="fldcode" value="fld2"/>
						<c:forEach var="i" begin="1" end="${list.levelRef }">
							&nbsp;&nbsp;&nbsp;
						</c:forEach>
						<c:if test="${list.levelRef > 0 }"> <B>ㄴ</B> </c:if>
						
						${list[fldcode]} 
					</td>
					<td>
						<c:set var="fldcode" value="fld1"/>
						${list[fldcode]}
					</td>
					<td>
						<c:set var="fldcode" value="fld50"/>
						<c:set var="data" value=""/>
						<fmt:parseDate value="${list[fldcode]}" var="parseDelv_date" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${parseDelv_date}" pattern="yyyy.MM.dd"/>
					</td> 
					<td>
						<c:set var="fldcode" value="fld11"/>
						${list[fldcode] eq '' ? '답변대기' : list[fldcode]}
					</td>
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
        <!-- /.board-list -->
      </div>
      <!-- /.customer-center -->
    </div>
    <!-- /.sub-content -->
  </div>
  <!-- /.container -->
</div>
<!-- /#content -->  

