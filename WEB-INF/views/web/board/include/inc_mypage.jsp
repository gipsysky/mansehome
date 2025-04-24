<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="tab-nav col-7">
<ul>
  <li ${param.pageGubun eq 'myOrderList' || param.pageGubun eq 'myOrderDetail' ? 'class="active"' : ''}><a href="/web/u/sale/order/myOrderList">주문/배송조회</a></li>
  <li ${param.pageGubun eq 'myReturnList' || param.pageGubun eq 'myReturnDetail' ? 'class="active"' : ''}><a href="/web/u/sale/order/myReturnList">취소/교환/반품조회</a></li>
  <li ${param.pageGubun eq 'shippingAddr' ? 'class="active"' : ''}><a href="/web/u/sale/order/list/shippingAddr">배송지관리</a></li>
  <li ${param.pageGubun eq 'point' ? 'class="active"' : ''}><a href="/web/u/sale/point/list/myPoint">나의 적립금</a></li>
  <li ${param.pageGubun eq 'coupon' ? 'class="active"' : ''}><a href="/web/u/pr/coupon/list/myCoupon">나의 쿠폰</a></li>
  <li ${param.pageGubun eq 'wish' ? 'class="active"' : ''}><a href="/web/u/item/product/list/wish">나의 위시리스트</a></li> 
  <li ${param.pageGubun eq 'edit' ? 'class="active"' : ''}><a href="/web/u/member/user/edit">회원정보 수정</a></li> 
</ul>
</div>