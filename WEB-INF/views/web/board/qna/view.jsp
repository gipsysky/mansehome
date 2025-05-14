<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("BR","\n"); %>


<div id="content" class="board">
	<div class="container">

		<c:if test="${cnfVO.header_url ne null }">
			<jsp:include page="${cnfVO.header_url }" flush="true">
				<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
				<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
			</jsp:include>
		</c:if>

		<div class="board-view" data-aos="fade-down" data-aos-delay="400">
			<dl>
				<dt>
					<!--제목-->
					${dataVO["fld2"]}

					<!--작성자-->
					<span class="date"> ${dataVO["fld1"]}&nbsp;&nbsp;&nbsp;&nbsp;

						<!--작성일시-->
                    <fmt:parseDate value="${dataVO['fld50']}" var="parseDelv_date" pattern="yyyy-MM-dd"/>
                    <fmt:formatDate value="${parseDelv_date}" pattern="yyyy-MM-dd"/>
                    </span>
				</dt>

				<!--첨부파일-->
				<c:if test="${dataVO['fld5'] ne '' and dataVO['fld5'] ne null and dataVO['fld5'] ne '|null'}">
					<c:set var="fileArr" value="${fn:split(dataVO['fld5'], '|')}"/>
					<dd class="file"><a href="/web/file/download?filename=${fileArr[0]}&realfile=${fileArr[1]}">${fileArr[0]}</a></dd>
				</c:if>
				<c:if test="${dataVO['fld6'] ne '' and dataVO['fld6'] ne null and dataVO['fld6'] ne '|null'}">
					<c:set var="fileArr" value="${fn:split(dataVO['fld6'], '|')}"/>
					<dd class="file"><a href="/web/file/download?filename=${fileArr[0]}&realfile=${fileArr[1]}">${fileArr[0]}</a></dd>
				</c:if>
				<c:if test="${dataVO['fld7'] ne '' and dataVO['fld7'] ne null and dataVO['fld7'] ne '|null'}">
					<c:set var="fileArr" value="${fn:split(dataVO['fld7'], '|')}"/>
					<dd class="file"><a href="/web/file/download?filename=${fileArr[0]}&realfile=${fileArr[1]}">${fileArr[0]}</a></dd>
				</c:if>

				<!--본문-->
				<dd>${fn:replace(dataVO['fld3'], BR, "<br>")}
				

				<!--첨부이미지-->
				<c:if test="${dataVO['fld4'] ne ''}">
					<BR><img src="${dataVO["fld4"] }" class="img-fluid">
				</c:if>
				</dd>

			</dl>
<%--			<div class="prev-next">--%>
<%--				<c:if test="${nextDetail ne null}">--%>
<%--					<a href="view?pageNum=${criteria.pageNum }&idTbl_cnf=${nextDetail['idTbl_cnf']}&idTbl_data=${nextDetail['idTbl_data']}"><i class="bi bi-chevron-left"></i>${nextDetail['fld2']}</a>--%>
<%--				</c:if>--%>
<%--				<c:if test="${prevDetail ne null}">--%>
<%--					<a href="view?pageNum=${criteria.pageNum }&idTbl_cnf=${prevDetail['idTbl_cnf']}&idTbl_data=${prevDetail['idTbl_data']}">${prevDetail['fld2']}<i class="bi bi-chevron-right"></i></a>--%>
<%--				</c:if>--%>
<%--			</div>--%>
			<div class="btn-box">
				<button type="button" class="btn main line" onClick="list();">목록보기</button>
			</div>
		</div>

<%--		<div class="btn-box">--%>
<%--			<c:if test="${auth_write eq 'true'}">--%>
<%--				<c:if test="${!notMyContents}">--%>
<%--					<button type="button" class="btn line" onClick="act('write','${dataVO.pw eq '' || empty dataVO.pw ? '':'1'}');">수정</button>--%>
<%--					<button type="button" class="btn line" onClick="act('del','${dataVO.pw eq '' || empty dataVO.pw ? '':'1'}');">삭제</button>--%>
<%--				</c:if>--%>
<%--				<c:if test="${cnfVO.reply_fg eq 'Y' }">--%>
<%--					<button type="button" class="btn line reply">답글</button>--%>
<%--				</c:if>--%>
<%--			</c:if>--%>
<%--		</div>--%>
	</div>
</div>

<jsp:include page="../include/inc_comment.jsp" flush="true">
	<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
	<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
</jsp:include>

<jsp:include page="../include/inc_detail_actions.jsp" flush="true">
	<jsp:param name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"/>
	<jsp:param name="tbl_name" value="${cnfVO.tbl_name }"/>
</jsp:include>



