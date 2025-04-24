<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<h1>금주의 베스트상품 <!-- <a href="#"><img src="/images/btn_main_more.gif" alt="더보기"></a> --></h1>
<ul class="item-list">

  <c:forEach items="${productList}" var="list" varStatus="status">

    <li>
      <div class='thumb'>
			<span><a href='javascript:;' onClick='javascript:LinkProductView("${list.idProduct }");'>
			<img src="${ list.s_image ne null  && list.s_image ne '' ? list.s_image : 'white.jpg' }" width='260' height='260'></a></span>
      </div>
      <div class='item-info'>
        <strong>${list.product_name }</strong>
        <span class='price'><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}"/></b>원</span>

          ${list.display_flag eq "N" ? "중지":""}
          ${list.display_flag eq "I" ? "대기중":""}
      </div>
    </li>

  </c:forEach>

</ul>