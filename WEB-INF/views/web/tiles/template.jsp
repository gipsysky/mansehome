<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
    <title>만세커뮤니케이션</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, minimum-scale=1, user-scalable=no">
    <meta charset="UTF-8">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link rel="stylesheet" href="/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/css/aos.css">
    <link rel="stylesheet" href="/css/swiper-bundle.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/js/jquery-3.6.0.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>

    <script src="/js/swiper-bundle.min.js"></script>
    <script src="/js/aos.js"></script>
    <script src="/js/ScrollTrigger.js"></script>
    <script src="/js/gsap.js"></script>
    <script src="https://manse.co.kr/js/jquery.modal.js"></script>
    <script src="/js/main.js"></script>
    <script type="text/javascript" src="/js/smartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>


<tiles:insertAttribute name="header" />
<%--<tiles:insertAttribute name="left" />--%>
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="footer" />
