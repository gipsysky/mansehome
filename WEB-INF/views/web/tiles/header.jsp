<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<body>
<div id="wrap">
    <header>
        <div class="container">
            <div class="gnb-area">
                <h1><a href="/">만세커뮤니케이션</a></h1>
                <div id="gnb">
                    <!-- 해당페이지 진입시 li .active 추가 -->
                    <ul>
                        <li><a href="/company">회사소개</a></li>
                        <li><a href="/portfolios">포트폴리오</a></li>
                        <li><a href="/web/board/data/write?pageNum=1&idTbl_cnf=69">프로젝트 의뢰</a></li>
                        <li><a href="/web/board/data/list?idTbl_cnf=60">고객센터</a></li>
                        <li class="toggle-gnb"><a href="#">MENU<span></span><span></span><span></span></a></li>
                    </ul>
                </div><!-- /#gnb -->
            </div>
        </div>
    </header><!-- /header -->


    <!-- 전체메뉴 -->
    <div id="nav-mask"></div>
    <aside id="nav">
        <div class="container">
            <div class="inner">
                <button type="button" class="btn icon"><i class="bi bi-x-lg"></i></button>
                <div class="left">
                    <dl>
                        <dt>최근 프로젝트</dt>
                        <dd>
                            <span class="thumb"><img src="img/recent.png" alt=""></span>
                            <span class="title">2024 오로나민C 구매인증 이벤트</span>
                        </dd>
                        <dd class="view"><a href="#"><u>바로가기</u></a></dd>
                    </dl>
                </div>
                <div class="right">
                    <ul>
                        <li><a href="/company">회사소개</a></li>
                        <li><a href="/portfolios">포트폴리오</a></li>
                        <li><a href="/web/board/data/write?pageNum=1&idTbl_cnf=69">프로젝트 의뢰</a></li>
                        <li><a href="/web/board/data/list?idTbl_cnf=60">고객센터</a></li>
                    </ul>
                    <span><a href="#">회사 소개서 다운로드 하기</a></span>
                </div>
            </div>
        </div>
    </aside>


    <script>
        let navSwiper = new Swiper("#nav .swiper", {
            speed: 1400,
            loop: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            pagination: {
                el: "#nav .swiper-pagination",
                clickable: true
            },
        });
        $("#nav .play-stop .pause").click(function(){
            navSwiper.autoplay.stop();
            $("#nav .play-stop .pause").hide();
            $("#nav .play-stop .play").show();
        });

        $("#nav .play-stop .play").click(function(){
            navSwiper.autoplay.start();
            $("#nav .play-stop .play").hide();
            $("#nav .play-stop .pause").show();
        });
    </script>