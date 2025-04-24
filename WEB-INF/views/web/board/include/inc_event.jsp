<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/global.jsp" %>


<div id="content">
  <div class="container">
    <ol class="breadcrumb">
      <li><img src="/images/ico_home.png" alt="홈"></li>
      <li>이벤트</li>
    </ol>
    <!-- /.location -->
    <div class="sub-top">
      <h1>이벤트</h1>
      <a href="javascript:history.go(-1)" title="뒤로" class="go-back"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
    </div>
    <!-- /.sub-top  -->
    <div class="sub-content">
      <div class="event-wrap special-items">
        <h2 class="hidden-xs">이벤트<small>뚜또 쇼핑몰을 더욱 즐길 수 있는 공간! </small></h2>
        <div class="tab-nav mt-0">
          <ul>
            <li ${param.pageDef eq 'inEvent' || param.pageDef eq null ? 'class="active"' : ''}><a href="/web/board/custom/list?pageDef=inEvent&idTbl_cnf=66">진행중 이벤트</a></li>
            <li ${param.pageDef eq 'endEvent' ? 'class="active"' : ''}><a href="/web/board/custom/list?pageDef=endEvent&idTbl_cnf=66">종료된 이벤트</a></li>
            <li ${param.pageDef eq 'winnerEvent' ? 'class="active"' : ''}><a href="/web/board/data/list?pageDef=winnerEvent&idTbl_cnf=67">당첨자 확인</a></li>
          </ul>
        </div>


