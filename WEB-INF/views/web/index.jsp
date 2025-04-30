<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>



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

        <div id="content" class="index">
            <section class="main-slide">
                <div class="bn">
                    © Mansecommunication Co.,Ltd.All rights reserved.
                    <a href="/web/board/data/write?pageNum=1&idTbl_cnf=69"><img src="img/bn_request.png" alt="프로젝트문의"></a>
                </div>
                <div class="swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide" id="kintex" onclick="$(location).attr('href', '/web/portfolios?fg=A')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>kintex</small>
                                    <strong>대한민국 최대 컨벤션 센터 <br>킨텍스 공식 APP</strong>
                                    <p>킨텍스 앱은 주최자, 참가업체, 관람객 모두에게 편리한 스마트 전시,<br> 컨벤션 서비스를 제공합니다.</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap" style="background-image: url(img/bg_v7.png)">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v7_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v7_img2.png" alt=""></div>
                                    <div class="img03"><img src="img/v7_img3.png" alt=""></div>
                                    <div class="img04"><img src="img/v7_img4.png" alt=""></div>
                                    <div class="img05"><img src="img/v7_img5.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="maniker" onclick="$(location).attr('href', '/web/portfolios?fg=A')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>maniker</small>
                                    <strong>마니커가 만드는 건강한 닭고기<br>마니커몰 Mobile APP</strong>
                                    <p>대한민국 최초 닭고기 브랜드 마니커!<br class="d-block">마니커몰 반응형 웹(PC+Mobile)+APP 개발</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap" style="background-image: url(img/bg_v5.png)">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v5_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v5_img2.png" alt=""></div>
                                    <div class="img03"><img src="img/v5_img3.png" alt=""></div>
                                    <div class="img04"><img src="img/v5_img4.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="oronamin" onclick="$(location).attr('href', '/web/portfolios?fg=A')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>donga-otsuka</small>
                                    <strong>동아오츠카 2024 <br>오로나민C 구매 인증 이벤트</strong>
                                    <p>오로나민C 10입 1박스 내부 QR코드를 통해<br> 이벤트 페이지로 접속, 프로모션 이벤트 통해<br> 경품 당첨 여부를 확인하는 온. 오프라인 이벤트</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v6_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v6_img2.png" alt=""></div>
                                    <div class="img05"><img src="img/v6_img5.png" alt=""></div>
                                    <div class="img03"><img src="img/v6_img3.png" alt=""></div>
                                    <div class="img04"><img src="img/v6_img4.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="donga" onclick="$(location).attr('href', '/web/portfolios?fg=W')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>donga-otsuka</small>
                                    <strong>동아오츠카</strong>
                                    <p>동아오츠카 공식 사이트 반응형 웹<br class="d-block">UX Strategy Consulting, UI / GUI Design</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap" style="background-image: url(img/bg_v11.png)">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v11_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v11_img2.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="chaesundang" onclick="$(location).attr('href', '/web/portfolios?fg=W')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>chaesundang</small>
                                    <strong>채선당</strong>
                                    <p>채선당 공식 사이트 반응형 웹<br class="d-block">UX Strategy Consulting, UI / GUI Design</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap" style="background-image: url(img/bg_v9.png)">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v9_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v9_img2.png" alt=""></div>
                                    <div class="img03"><img src="img/v9_img3.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="shooting" onclick="$(location).attr('href', '/web/portfolios?fg=A')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>대한사격연맹</small>
                                    <strong>대한사격연맹 공식 APP</strong>
                                    <p>대한사격연맹 소개 및 사격 정보(사격 규정, 종목 소개, 사격장 안내)<br class="d-block"> 경기 일정 및 결과(국내 전문체육 및 국제 대회) 안내, 대한사격연맹 증명서<br> 발급 및 출력, 커뮤니티 등 다양한 사격 관련 정보 제공</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap" style="background-image: url(img/bg_v1.png)">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v1_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v1_img2.png" alt=""></div>
                                    <div class="img03"><img src="img/v1_img3.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="nest" onclick="$(location).attr('href', '/web/portfolios?fg=A')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>nest hotel</small>
                                    <strong>네스트호텔<br>공식 Mobile App</strong>
                                    <p>국내 최초 디자인호텔스 멤버 호텔<br class="d-block">네스트호텔 공식 모바일 애플리케이션</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap" style="background-image: url(img/bg_v10.png)">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v10_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v10_img2.png" alt=""></div>
                                    <div class="img03"><img src="img/v10_img3.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="malpyo" onclick="$(location).attr('href', '/web/portfolios?fg=S')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>malpyo</small>
                                    <strong>말표산업<br>온라인 쇼핑몰</strong>
                                    <p>㈜말표산업 공식 홈페이지&쇼핑몰<br class="d-block">UX Strategy Consulting, UI / GUI Design</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap" style="background-image: url(img/bg_v8.png)">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v8_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v8_img2.png" alt=""></div>
                                    <div class="img03"><img src="img/v8_img3.png" alt=""></div>
                                    <div class="mix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="school" onclick="$(location).attr('href', '/web/portfolios?fg=A')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>School Mom Talk</small>
                                    <strong>스쿨맘톡 등. 하교 위치정보<br class="d-block">알림 서비스 APP</strong>
                                    <p>안전한 학교생활과 일상생활의 안전을 위해 어린이 안심 서비스를<br> 스쿨맘톡 앱을 통해 정보 제공</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v3_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v3_img2.png" alt=""></div>
                                    <div class="img03"><img src="img/v3_img3.png" alt=""></div>
                                    <div class="pin pin01"><img src="img/v3_img4.png" alt=""></div>
                                    <div class="pin pin02"><img src="img/v3_img4.png" alt=""></div>
                                    <div class="pin pin03"><img src="img/v3_img4.png" alt=""></div>
                                    <div class="pin pin04"><img src="img/v3_img4.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide" id="safe" onclick="$(location).attr('href', '/web/portfolios?fg=A')">
                            <div class="slide-txt-wrap">
                                <div class="main-slide-txt" data-swiper-parallax="-500">
                                    <small>recarelab</small>
                                    <strong>지켜준닥<br>간병인 바로 매칭 서비스 APP</strong>
                                    <p>지켜준닥의 매칭 알고리즘을 통한 간병인 바로 매칭 서비스<br>간병 문화를 선도하는 헬스케어 플랫폼</p>
                                    <a href="#"><img src="img/v_arrow.png" alt="바로가기"></a>
                                </div>
                            </div>
                            <div class="slide-bg-wrap">
                                <div class="overlay"></div>
                                <div class="img">
                                    <div class="img01"><img src="img/v4_img1.png" alt=""></div>
                                    <div class="img02"><img src="img/v4_img2.png" alt=""></div>
                                    <div class="img03"><img src="img/v4_img3.png" alt=""></div>
                                    <div class="img04"><img src="img/v4_img4.png" alt=""></div>
                                    <div class="circle circle01"></div>
                                    <div class="circle circle02"></div>
                                    <div class="circle circle03"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-controls">
                        <div class="swiper-pagination"></div>
                        <div class="play-stop">
                            <span class="play"><i class="bi bi-play"></i></span>
                            <span class="pause"><i class="bi bi-pause"></i></span>
                        </div>
                    </div>
                </div>
            </section>
            <script>
                var interleaveOffset = 0.5;
                let indexSwiper = new Swiper(".main-slide .swiper", {
                    direction: "vertical",
                    speed: 1400,
                    loop: true,
                    autoplay: {
                        delay: 3000,
                        disableOnInteraction: false,
                    },			
                    mousewheel: {
                        releaseOnEdges: true,
                    },
                    slidesPerView: 1,
                    spaceBetween: 0,
                    parallax: true,
                    pagination: {
                        el: ".main-slide .swiper-pagination",
                        clickable: true
                    },
                    //autoplay: {
                    //    delay: 8000,
                    //    disableOnInteraction: false
                    //},
                    breakpoints: {
                        992: {
                            //allowTouchMove: false,
                        }
                    },
                    watchSlidesProgress: true,
                    on: {
                        slideChange: function(e) {
                            for (let t = 0; t < e.slides.length; t++) {
                                let i, s = (e.activeIndex == t ? 0 : e.activeIndex - t) * (.5 * e.height);
                                e.slides[t].querySelector(".slide-bg-wrap").style.transform = "translate3d(0, " + s + "px, 0)";
                            }
                        },
                        touchStart: function(e) {
                            for (let t = 0; t < e.slides.length; t++)
                                e.slides[t].style.transition = ""
                        },
                        setTransition: function(e, t) {
                            for (let i = 0; i < e.slides.length; i++)
                                e.slides[i].style.transition = t + "ms",
                                e.slides[i].querySelector(".slide-bg-wrap").style.transition = t + "ms"
                        }
                    }
                });
                $(".main-slide .play-stop .pause").click(function(){
                    indexSwiper.autoplay.stop();
                    $(".main-slide .play-stop .pause").hide();
                    $(".main-slide .play-stop .play").show();
                });

                $(".main-slide .play-stop .play").click(function(){
                    indexSwiper.autoplay.start();
                    $(".main-slide .play-stop .play").hide();
                    $(".main-slide .play-stop .pause").show();
                });
            </script>
        </div>
