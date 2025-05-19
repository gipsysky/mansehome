<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/global.jsp" %>

<style>
	.top-title .tab-nav li {font-size:1.125rem;font-weight: bold;}
</style>

<div class="top-title">
    <h2 data-aos="fade-left">CS Center</h2>
    <p data-aos="fade-left" data-aos-delay="100">만세를 찾아주셔서 감사드립니다.<br>궁금하신 사항은 언제든지 문의하시기 바랍니다.</p>
    <div class="tab-nav" data-aos="fade-in" data-aos-delay="300">
        <ul>
            <li ${param.idTbl_cnf eq '60' || param.idTbl_cnf eq null ? 'class="active"' : ''}><a href="/web/board/data/list?idTbl_cnf=60">NOTICE</a></li>
            <li ${param.idTbl_cnf eq '68' ? 'class="active"' : ''}><a href="/web/board/data/list?idTbl_cnf=68">DATA</a></li>
            <li ${param.idTbl_cnf eq '61' ? 'class="active"' : ''}><a href="/web/board/data/list?idTbl_cnf=61">Q&A</a></li>
        </ul>
    </div>
</div><!-- /.top-title -->