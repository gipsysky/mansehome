<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


        <div id="content" class="portfolio">
            <div class="container">
                <div class="top-title">
                    <h2 data-aos="fade-left">Create with Passion</h2>
                    <p data-aos="fade-left" data-aos-delay="100">만세커뮤니케이션은 오랜 숙련된 능력과 끊임없는 노력으로 고객 만족에 최선을 다 하고 있습니다.<br>한발 앞선 창의력과 서비스로 최상의 디자인과 사용자 경험을 경험할 수 있습니다.</p>    
                    <div class="tab-nav" data-aos="fade-in" data-aos-delay="300">
                        <ul>
                            <li <c:if test="${fg eq 'A'}">class="active"</c:if>><a href="/web/portfolios?fg=A">ALL</a></li>
                            <li <c:if test="${fg eq 'W'}">class="active"</c:if>><a href="/web/portfolios?fg=W">WEB</a></li>
                            <li <c:if test="${fg eq 'S'}">class="active"</c:if>><a href="/web/portfolios?fg=S">SHOP</a></li>
                        </ul>
                    </div>
                </div>
                <div class="portfolio-list" data-aos="fade-in" data-aos-delay="400">
                    <ul>
						
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio18').modal({fadeDuration: 200});"><img src="/img/pf18.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio5').modal({fadeDuration: 200});"><img src="/img/pf5.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio21').modal({fadeDuration: 200});"><img src="/img/pf21.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio2').modal({fadeDuration: 200});"><img src="/img/pf2.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio7').modal({fadeDuration: 200});"><img src="/img/pf7.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio10').modal({fadeDuration: 200});"><img src="/img/pf10.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio17').modal({fadeDuration: 200});"><img src="/img/pf17.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio1').modal({fadeDuration: 200});"><img src="/img/pf1.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio4').modal({fadeDuration: 200});"><img src="/img/pf4.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio8').modal({fadeDuration: 200});"><img src="/img/pf8.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio6').modal({fadeDuration: 200});"><img src="/img/pf6.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio12').modal({fadeDuration: 200});"><img src="/img/pf12.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio9').modal({fadeDuration: 200});"><img src="/img/pf9.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio3').modal({fadeDuration: 200});"><img src="/img/pf3.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio14').modal({fadeDuration: 200});"><img src="/img/pf14.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio15').modal({fadeDuration: 200});"><img src="/img/pf15.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio11').modal({fadeDuration: 200});"><img src="/img/pf11.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio23').modal({fadeDuration: 200});"><img src="/img/pf23.jpg" alt=""></a></li>
                        <li data-aos="fade-down"><a href="javascript:;" onclick="$('#portfolio19').modal({fadeDuration: 200});"><img src="/img/pf19.jpg" alt=""></a></li>
						
                    </ul>
                    <div class="btn-box">
                        <!-- 클릭할때마다 포폴이미지 4개씩 추가 -->
                        <button type="button" class="btn main line" onclick="goPortfolioList()" id="goPortfolioList">MORE</button>
                        <button type="button" class="btn main line" onclick="goToTop()" id="goToTop" style="display: none;">TOP</button>
                    </div>
                </div>
            </div>
        </div>
        
        <link rel="stylesheet" href="https://manse.co.kr/css/jquery.modal.css">
        <script src="https://manse.co.kr/js/jquery.modal.js"></script>
        <script>
            function goToTop() {
                $('body, html').animate({scrollTop:0}, '1000');
            }
        </script>
        
        <!-- 네스트호텔 -->
        <div class="modal" id="portfolio1">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf1.png)">
                <div class="main-slide-txt">
                    <small>NEST HOTEL</small>
                    <strong>네스트호텔<br>공식 홈페이지 App</strong>
                    <p>국내 최초 디자인호텔스 멤버 호텔<br>네스트호텔 공식 모바일 애플리케이션</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf1_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail1_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail1_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail1_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 동아오츠카 -->
        <div class="modal" id="portfolio2">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf2.png)">
                <div class="main-slide-txt">
                    <small>donga-otsuka</small>
                    <strong>동아오츠카<br>공식 쇼핑몰 APP</strong>
                    <p>정기배송, 대량 구매, 골라 담기 등 다양한 콘텐츠를 제공하여<br>방문자에게 체류시간을 연장하고 구매욕을 높일 수 있도록 구현</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf2_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail2_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail2_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail2_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 라팔라코리아 -->
        <div class="modal" id="portfolio3">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf3.png)">
                <div class="main-slide-txt">
                    <small>RAPALA KOREA</small>
                    <strong>라팔라코리아 공식 쇼핑몰 APP</strong>
                    <p>라팔라브이엠씨코리아(주)<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf3_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail3_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail3_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail3_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 랜드로버 -->
        <div class="modal" id="portfolio4">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf4.png)">
                <div class="main-slide-txt">
                    <small>LAND-ROVER KOREA</small>
                    <strong>랜드로버</strong>
                    <p>랜드로버 공식 홈페이지 APP<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf4_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail4_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail4_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail4_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 마니커 -->
        <div class="modal" id="portfolio5">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf5.png)">
                <div class="main-slide-txt">
                    <small>maniker</small>
                    <strong>마니커가 만드는 건강한 닭고기<br>마니커몰 Mobile APP</strong>
                    <p>대한민국 최초 닭고기 브랜드 마니커!<br>마니커몰 반응형 웹(PC+Mobile)+APP 개발</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf5_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail5_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail5_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail5_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 말표산업 -->
        <div class="modal" id="portfolio6">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf6.png)">
                <div class="main-slide-txt">
                    <small>malpyo</small>
                    <strong>말표산업 주식회사</strong>
                    <p>㈜말표산업 공식 APP<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf6_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail6_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail6_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail6_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 스웨트마켓 -->
        <div class="modal" id="portfolio7">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf7.png)">
                <div class="main-slide-txt">
                    <small>donga-otsuka</small>
                    <strong>동아오츠카<br>스웨트마켓 공식 APP</strong>
                    <p>내가 흘린 땀이 돈이 되는 신개념 땀테크앱 스웨트마켓<br>걷기, 달리기, 자전거 타기 등 다양한 미션 제공</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf7_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail7_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail7_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail7_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 스쿨맘톡 -->
        <div class="modal" id="portfolio8">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf8.png)">
                <div class="main-slide-txt">
                    <small>School Mom Talk</small>
                    <strong>스쿨맘톡 등. 하교 위치정보<br>알림 서비스 APP</strong>
                    <p>안전한 학교생활과 일상생활의 안전을 위해 어린이 안심 서비스를<br> 스쿨맘톡 앱을 통해 정보 제공</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf8_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail8_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail8_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail8_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 스튜디오 드래곤 -->
        <div class="modal" id="portfolio9">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf9.png)">
                <div class="main-slide-txt">
                    <small>studio dragon</small>
                    <strong>스튜디오 드래곤</strong>
                    <p>스튜디오 드래곤 공식 홈페이지 APP<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf9_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail9_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail9_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail9_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        <!-- 엔픽플 -->
        <div class="modal" id="portfolio10">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf10.png)">
                <div class="main-slide-txt">
                    <small>NPICK</small>
                    <strong>엔픽플<br>공식 App</strong>
                    <p>저작권을 보유한 오리지널 영화와 웹드라마, 웹 예능<br>다양한 VOD 제공 애플리케이션</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf10_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail10_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail10_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail10_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 잇잡 -->
        <div class="modal" id="portfolio11">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf11.png)">
                <div class="main-slide-txt">
                    <small>ITJOB</small>
                    <strong>잇잡<br>IT 채용 전문 플랫폼 </strong>
                    <p>한국취업센터<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf11_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail11_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail11_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail11_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 재키 -->
        <div class="modal" id="portfolio12">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf12.png)">
                <div class="main-slide-txt">
                    <small>JACKIE CYCLE</small>
                    <strong>재키 사이클 공식 APP</strong>
                    <p>제이핏네트워크<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf12_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail12_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail12_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail12_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 채선당 -->
        <div class="modal" id="portfolio14">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf14.png)">
                <div class="main-slide-txt">
                    <small>chaesundang</small>
                    <strong>채선당</strong>
                    <p>채선당 공식 홈페이지 APP<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf14_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail14_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail14_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail14_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- AGCIA -->
        <div class="modal" id="portfolio15">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf15.png)">
                <div class="main-slide-txt">
                    <small>AGCIA</small>
                    <strong>AGCIA<br>아시아보증·신용보험협회</strong>
                    <p>AGCIA 공식 홈페이지 APP<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf15_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail15_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail15_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail15_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 대한사격연맹 -->
        <div class="modal" id="portfolio17">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf17.png)">
                <div class="main-slide-txt">
                    <small>대한사격연맹</small>
                    <strong>대한사격연맹 공식 홈페이지 APP</strong>
                    <p>대한사격연맹 소개 및 사격 정보(사격 규정, 종목 소개, 사격장 안내), <br>경기 일정 및 결과(국내 전문체육 및 국제 대회) 안내</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf17_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail17_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail17_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail17_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        <!-- KINTEX -->
        <div class="modal" id="portfolio18">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf18.png)">
                <div class="main-slide-txt">
                    <small>KINTEX</small>
                    <strong>대한민국 최대 컨벤션 센터<br>킨텍스 공식 홈페이지 APP</strong>
                    <p>킨텍스 앱은 주최자, 참가업체, 관람객 모두에게 편리한 스마트 전시,<br> 컨벤션 서비스를 제공합니다.</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf18_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail18_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail18_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail18_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        <!-- 모아베베 -->
        <div class="modal" id="portfolio19">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf19.png)">
                <div class="main-slide-txt">
                    <small>MOABEBE</small>
                    <strong>출산육아의 모든것<br>모아베베 APP</strong>
                    <p>초음파영상은 기본, 수유, 수면, 이유식 기록부터 성장정보,<br>건강정보까지 육아수첩에 우리 아이의 매일 매일을 기록</p>
                    <a href="#"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf19_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left"><img src="/img/pf_detail19_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail19_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail19_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div>
        </div>
        
        <!-- 오로나민C -->
        <div class="modal" id="portfolio21">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <style>
                @media (min-width: 992px) {
                    #portfolio21 .detail-images .grid {
                        padding-right: 450px;
                    }

                    #portfolio21 .detail-images .grid .left {
                        margin-top: 0
                    }

                    #portfolio21 .detail-images .grid .right {
                        position: absolute;
                        right: 0;
                        top: 0;
                    }
                }
            </style>
            <div class="top-visual" style="background-image: url(img/bg_pf21.png)">
                <div class="main-slide-txt">
                    <small>donga-otsuka</small>
                    <strong>오로나민C 구매 인증 이벤트</strong>
                    <p>동아오츠카 주관<br>오로나민C 구매 인증 이벤트 응모 모바일 APP</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf21_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="movie">
                        <div class="frame">
                            <iframe width="1250" height="703" src="https://www.youtube.com/embed/DXHtn76KmdA" title="[30초] 2016년 오로나민C 광고! 전현무+홍진영" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen=""></iframe>
                        </div>
                    </div>
                    <div class="left"><img src="/img/pf_detail21_1.png" alt=""></div>
                    <div class="center"><img src="/img/pf_detail21_2.png" alt=""></div>
                    <div class="right"><img src="/img/pf_detail21_3.png" alt=""></div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div><a href="#close-modal" rel="modal:close" class="close-modal ">Close</a>
        </div>
        
        <!-- 파주 출판도시 -->
        <div class="modal" id="portfolio23">
            <div class="back"><a href="javascript:;" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a></div>
            <div class="top-visual" style="background-image: url(img/bg_pf23.png)">
                <div class="main-slide-txt">
                    <small>pajubookcity</small>
                    <strong>파주 출판도시</strong>
                    <p>파주 출판도시 북시티투어 공식 APP<br>UX Strategy Consulting, UI / GUI Design</p>
                    <a href="/web/portfolio/web/portfolio.asp?fg=A"><img src="/img/v_arrow.png" alt="바로가기"></a>
                </div>
                <div class="mobile-image"><img src="/img/bg_pf23_m.png" alt=""></div>
            </div>
            <div class="detail-images">
                <div class="grid">
                    <div class="left">
                        <img src="/img/pf_detail23_1.png" alt="">
                    </div>
                    <div class="center">
                        <img src="/img/pf_detail23_2.png" alt="">
                    </div>
                    <div class="right">
                        <img src="/img/pf_detail23_3.png" alt="">
                    </div>
                </div>
                <div class="btn-box">
                    <a href="#" class="btn main line" rel="modal:close"><i class="bi bi-arrow-left"></i>닫기</a>
                </div>
                <div class="top-btns">
                    <a href="javascript:;" title="맨위로" onclick="$('#portfolio').animate({ scrollTop: 0 }, 600);"><img src="/img/q_top.png" alt=""></a>
                </div>
            </div>
        </div>
