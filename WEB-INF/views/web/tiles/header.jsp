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
                        <li><a href="/web/company">회사소개</a></li>
                        <li><a href="/web/portfolios">포트폴리오</a></li>
                        <li><a href="/web/board/data/write?pageNum=1&idTbl_cnf=69">프로젝트 의뢰</a></li>
                        <li><a href="/web/board/data/list?idTbl_cnf=61">고객센터</a></li>
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
							<div class="swiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide"><span class="thumb"><img src="/img/000501_1.png" class="d-none d-sm-block"><img src="/img/000501_2.png" class="d-sm-none"></span><span class="title">KINTEX 전시장 공식APP</span><a href="/web/portfolios" target="_blank"><u>바로가기</u></a></div>
									<div class="swiper-slide"><span class="thumb"><img src="/img/000502_1.png" class="d-none d-sm-block"><img src="/img/000502_2.png" class="d-sm-none"></span><span class="title">동아오츠카 공식 사이트 반응형 웹</span><a href="/web/portfolios" target="_blank"><u>바로가기</u></a></div>
									<div class="swiper-slide"><span class="thumb"><img src="/img/000503_1.png" class="d-none d-sm-block"><img src="/img/000503_2.png" class="d-sm-none"></span><span class="title">2024 오로나민C 구매인증 이벤트</span><a href="/web/portfolios" target="_blank"><u>바로가기</u></a></div>
								</div>
							</div>
                        </dd>
						<dd class="view">
							<div class="swiper-controls">
								<div class="swiper-pagination"></div>
								<div class="play-stop">
									<span class="play"><i class="bi bi-play"></i></span>
									<span class="pause"><i class="bi bi-pause"></i></span>
								</div>
							</div>
						</dd>
                    </dl>
                </div>
                <div class="right">
                    <ul>
                        <li><a href="/web/company">회사소개</a></li>
                        <li><a href="/web/portfolios">포트폴리오</a></li>
                        <li><a href="/web/board/data/write?pageNum=1&idTbl_cnf=69">프로젝트 의뢰</a></li>
                        <li><a href="/web/board/data/list?idTbl_cnf=61">고객센터</a></li>
                    </ul>
                    <span><a href='/web/file/download?filename=portfolio'>회사 소개서 다운로드하기</a></span>
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