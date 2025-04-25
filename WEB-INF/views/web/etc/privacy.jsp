<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ include file="/WEB-INF/views/global.jsp" %>
 
<jsp:include page="../board/include/inc_customer_center.jsp" flush="true">
	<jsp:param name="idTbl_cnf" value="10001"/>
	<jsp:param name="tbl_name" value="개인정보처리방침"/>
</jsp:include> 
 
        <div class="terms">
          <div class="scrollable contents">${vo.fld3 }</div>
        </div> 
        
      </div>
      <!-- /.customer-center -->
    </div>
    <!-- /.sub-content -->
  </div>
  <!-- /.container -->
</div>
<!-- /#content -->  