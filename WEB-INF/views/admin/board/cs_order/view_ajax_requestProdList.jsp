<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach items="${prodList}" var="orderProdList" varStatus="status">
    <c:if test="${orderProdList.product_type eq 'P'}">
        <TABLE width="100%" border="1" cellspacing="0" cellpadding="0" class="board_list2">
            <tr>
                <td width=95 style="vertical-align:middle;">
                    <a href="/web/item/product/detail?idProduct=${orderProdList.productVO.idProduct}">
                        <img src=${orderProdList.productVO.s_image } width=80 height=80 border=0 ></a>
                </td>
                <td width=90%>
                    <table border=1 cellpadding=0 cellspacing=1 width="100%" bgcolor=#EEEEEE>
                        <tr height=21>
                            <td width=100 bgcolor=#f2f2f2>&nbsp;상품명</td>
                            <td bgcolor=#ffffff>&nbsp; ${orderProdList.productVO.product_name} </td>
                            <td width=100 bgcolor=#f2f2f2>&nbsp;공급사</td>
                            <td bgcolor=#ffffff>&nbsp; ${orderProdList.comp_name} </td>
                        </tr>
                        <tr height=21>
                            <td width=100 bgcolor=#f2f2f2>&nbsp;옵션</td>
                            <td bgcolor=#ffffff colspan=3>&nbsp;
                                <c:out value="${orderProdList.option_desc}"/>
                            </td>
                        </tr>
                        <tr height=21>
                            <td width=100 bgcolor=#f2f2f2>&nbsp;판매가</td>
                            <td width=198 bgcolor=#ffffff>&nbsp; <fmt:formatNumber type="number" value="${orderProdList.sprice}"/>  원 </td>
                            <td width=100 bgcolor=#f2f2f2>&nbsp;구매가</td>
                            <td width=197 bgcolor=#ffffff>&nbsp; <font color=#d06404><fmt:formatNumber type="number" value="${orderProdList.ord_price}"/> 원</font> </td>
                        </tr>
                        <tr height=21>
                            <td width=100 bgcolor=#f2f2f2>&nbsp;수량</td>
                            <td bgcolor=#ffffff>&nbsp; ${orderProdList.cnt} 개 </td>
                            <td width=100 bgcolor=#f2f2f2>&nbsp;적립금</td>
                            <td bgcolor=#ffffff>&nbsp; 0 </td>
                        </tr>
                        <tr height=21>
                            <td width=100 bgcolor=#f2f2f2>&nbsp;배송구분</td>
                            <td bgcolor=#ffffff colspan=3>&nbsp; ${orderProdList.ord_prod_state_name}</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </TABLE>
        <BR>
    </c:if>
</c:forEach>