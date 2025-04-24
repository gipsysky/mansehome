<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<div id="content">
    <!-- 메인 이벤트 배너 -->
    <div class="main-visual">
        <div class="flexslider">
            <div class="slides">
                <c:forEach items="${mainTopBanner}" var="list">
                    ${list}
                </c:forEach>
            </div>
        </div>
        <div class="container">
            <div class="prev-next hidden-xs">
                <button type="button" class="btn prev">PREV</button>
                <button type="button" class="btn next">NEXT</button>
            </div>
            <div class="pause-play hidden-xs">
                <button type="button" class="btn play">PLAY</button>
                <button type="button" class="btn stop">STOP</button>
            </div>
        </div>
        <div class="mobile-control visible-xs">
            <div class="slide-counter">
                <div class="current-slide">2</div>
                <div class="total-slides">8</div>
            </div>
            <button class="btn go-to-next"><i class="la la-plus"></i><span class="sr-only"></span></button>
        </div>
    </div>

    <div class="container">
        <div class="best-product-container">
            <section class="hot-deal">
                <div class="inner"></div>
            </section>
            <section class="best-product"></section>
        </div>

        <div class="center-banner">
            <div>${mainCenterLeft[0] }</div>
            <div>${mainCenterRight[0] }</div>
        </div>

        <section class="new-arrival"></section>

        <section class="special-item"></section>

        <section class="md-pick"></section>


        <div class="center-banner">
            ${mainBottom[0]}
        </div>

        <div class="footer-customer">
            <div class="col">
                <strong>공지사항<a href="javascript:MenuLink('21');">더보기 +</a></strong>
                <ul class="notice">
                    <li><a href='/customer/board/board_content.asp?idx=3&t_name=BOARD1'>공지사항 에디터 글 </a><span
                            class='date'>2022.09.02</span></li>
                    <li><a href='/customer/board/board_content.asp?idx=2&t_name=BOARD1'>test</a><span class='date'>2018.11.01</span>
                    </li>
                </ul>
                <strong>계좌안내</strong>
                <div class="bank">
                    610301-04-147712 <small>(예금주:(주)뚜또)</small>
                    <!-- <a href="#">바로가기</a> -->
                </div>
            </div>

            <div class="col">
                <ul class="guide">
                    <li><a href='http://test.msite.co.kr/mypage/order_list.asp'><img
                            src='/images/evt_img/main_bn_order.gif' border=0></a></li>
                    <li><a href='http://test.msite.co.kr/customer/bulk/list.asp'><img
                            src='/images/evt_img/main_bn_purchase.gif' border=0></a></li>
                </ul>
            </div>

            <div class="col">
                <strong>고객지원센터</strong>
                <div class="call">
                    <p><b>080-700-4740</b>054-654-0013</p>
                    <p class="fax">FAX. 054-654-0018</p>
                    <p>AM 09:00 ~ PM 06:00 <span>(토,일,공휴일 휴무)</span></p>
                </div>
            </div>
        </div>

    </div>
    <!-- /#content -->

    <style>
        .pop {z-index:1000; position:absolute; top:50px; left:100px; width:100%;}
    </style>
    <!-- pupup -->
    <div id="pop" class="pop container-fluid"></div>

<script>
	$(function () {
		//BEST
		$.get("/web/design/recmd/list/mainAjax?sType10=21&amount=3&skin=web/design/recmd/mainAjaxBest", function (r) {
			$(".best-product").html(r);
		});
		//핫딜
		$.get("/web/item/product/hotdealMain", function (r) {
			$(".hot-deal").html(r);
		});
		//신상품
		$.get("/web/item/product/list/main?amount=4", function (r) {
			$(".new-arrival").html(r);
		});
		//추천 기획전
		$.get("/web/design/recmd/list/mainAjax?sType10=24&amount=6&skin=web/design/recmd/mainAjaxWithPercent", function (r) {
			$(".special-item").html(r);
		});
		//MD 추천상품
		$.get("/web/design/recmd/list/mainAjax?sType10=22&amount=4&skin=web/design/recmd/mainAjaxWithTab", function (r) {
			$(".md-pick").html(r);
		});

		//S: POPUP
        let today = new Date();
        let year = today.getFullYear();
        let month = today.getMonth() + 1;
        let day = today.getDate();
		var param = "";
		param += "idTbl_cnf=68";
		param += "&sListType=ge_date";
		param += "&sListType=le_date";
		param += "&sListName=fld4";
		param += "&sListName=fld5";
		param += "&sListVal=" + year + "-" + month +"-" + day;
		param += "&sListVal=" + year + "-" + month +"-" + day;
		$.get("/web/board/data/list/?" + param, function (j) {
			var id, img, url, popHtml;
            popHtml = "";
			for (var i = 0; i < j.dataList.length; i++) {
                id = j.dataList[i].idTbl_data;
				img = j.dataList[i].fld6;
				url = j.dataList[i].fld3;
                if (getCookie("C"+id) != "1"){
                    popHtml += "<div id='pop"+ id +"'>";
                    popHtml += "<a href='"+ url +"'><img src='"+ img +"'></a>"
                    popHtml += "<div style='text-decoration:underline' onClick=\"endPop('"+ id +"');\">오늘 하루 열지 않음</div>"
                    popHtml += "<div style='text-decoration:underline' onClick=\"closePop('"+ id +"');\">창 닫기</div>"
                    popHtml += "</div>";
                }
			}
            $("#pop").html(popHtml);
		});
        //E: POPUP
	});

    //POPUP 창 닫기
    function closePop(v){
        $("#pop"+v).remove();
    }
    //POPUP 오늘 하루 열지 않기
    function endPop(v){
        setCookie("C"+v, "1", 1);
        $("#pop"+v).remove();
    }

	function mdTab(v, n) {
		$.get("/web/design/recmd/list/mainAjax?sType10=22&amount=4&skin=web/design/recmd/mainAjaxWithTab&sType2=" + v, function (r) {
			$(".md-pick").html(r);
			$(".mdtab").removeClass("active");
			$("#mdtab" + n).addClass("active");
		});
	}
</script>