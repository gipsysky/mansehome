<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div id="content">
    <div class="container">
        <ol class="breadcrumb">
            <li><img src="/images/ico_home.png" alt="홈"></li>
            <li>생명단추</li>
            <li>위치정보</li>
        </ol>
        <div class="sub-top">
            <li><a href="/web/member/logout">로그아웃</a></li>
        </div>
        <!-- /.sub-top  -->
        <div class="sub-content">
            <h2 class="hidden-xs"><h1>위치정보</h1></h2>
            <div class="mypage-wrap">

                <c:if test="${markJson ne ''}">
                    <div class="map" id="map"></div>
                </c:if>
                <c:if test="${markJson eq ''}">
                    <div style="text-align:center;height:100px"><BR><BR>위치 정보가 없습니다</div>
                </c:if>

                <div class="board-list">

                    <table class="table">
                        <colgroup>
                            <col width="20%">
                            <col width="*">
                            <col width="12%">
                            <col width="20%">
                            <col width="20%">
                            <c:if test="${U_GROUP eq '1000'}">
                            <col width="12%">
                            </c:if>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>투입일</th>
                            <th>이름</th>
                            <th>기기</th>
                            <th>군번</th>
                            <th>종료일</th>
                            <c:if test="${U_GROUP eq '1000'}">
                            <th>완료</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${armyList}" var="list" varStatus="status">
                            <fmt:parseDate value="${list.wdate }" var="wdate" pattern="yyyy-MM-dd H:m"/>
                            <fmt:parseDate value="${list.end_date }" var="edate" pattern="yyyy-MM-dd H:m"/>
                            <tr>
                                <td>
                                    <c:if test="${list.idOperation eq null}">
                                        미투입
                                    </c:if>
                                    <c:if test="${list.idOperation ne null}">
                                        <fmt:formatDate value="${wdate}" pattern="yyyy.MM.dd H:m"/>
                                    </c:if>
                                </td>
                                <td>${list.name }</td>
                                <td>${list.uuid }</td>
                                <td>${list.army_no }</td>
                                <td><fmt:formatDate value="${edate}" pattern="yyyy.MM.dd H:m"/></td>

                                <c:if test="${U_GROUP eq '1000'}">
                                <td>
                                    <c:if test="${list.idOperation ne null and list.end_status eq 'N'}">
                                        <input type="button" value=" 완료 " onCLick="complete('${list.idUser}');">
                                    </c:if>
                                </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
                <!-- /.board-list -->

                <!-- /.join-form -->
            </div>
            <!-- /.mypage-wrap -->
        </div>
        <!-- /.sub-content -->
    </div>
    <!-- /.container -->
</div>
<!-- /#content -->

<form method="get" name="listForm">
    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
    <input type="hidden" name="sType" value="${pageMaker.cri.sType }">
    <input type="hidden" name="sType2" value="${pageMaker.cri.sType2 }">
    <input type="hidden" name="sWord" value="${pageMaker.cri.sWord }">
    <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
</form>

<script>
    $(function() {
        $(".pagination a").click(function (event) {
            event.preventDefault();
            document.listForm.reset();
            document.listForm.pageNum.value = $(this).attr("href");
            document.listForm.action = "?";
            document.listForm.submit();
        });
    });
</script>

<script>
    function complete(v){
        if(confirm("완료처리하시겠습니까?")){
            window.open("endOk?idUser="+v,"HiddenFrame");
        }
    }
</script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e46e47ae549c2e96a023e485e88d0c68"></script>

<script type="text/javascript">

    //기본변수 설정 시작
    var isFirst = true;
    var mylatitude = "${default_lat}";
    var mylongitude = "${default_lng}";
    var positions = new Array();
    var customOverlay = new Array();
    var boundPoints = new Array();
    var linePath  = new Array();
    var polyline = new kakao.maps.Polyline();
    //기본변수 설정 끝


    //기본 지도 보이기 시작
    $('#map').css('height',  500);

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(mylatitude, mylongitude), // 지도의 중심좌표
            level: 3, // 지도의 확대 레벨
            scrollwheel: true
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var zoomControl = new daum.maps.ZoomControl();
    map.addControl(zoomControl, daum.maps.ControlPosition.BOTTOMLEFT);

    // 내위치 마커가 표시될 위치
    var markerPosition = new daum.maps.LatLng(mylatitude, mylongitude);

    // 내위치 마커를 생성
    var marker = new daum.maps.Marker({ position:markerPosition });
    marker.setMap(map);

    //기본 지도 보이기 끝



    function moveToLocation(lat, lng){
        map.setCenter(new kakao.maps.LatLng(lat, lng));
    }

    function moveToMyLocation(lat, lng){
        map.setCenter(new kakao.maps.LatLng(lat, lng));
    }

    //기본적인 다중 마커 보이기
    function refreshMarker(locationJsonStr){
        if (!isFirst)
        {
            for (var i = 0; i < customOverlay.length; i ++) {
                customOverlay[i].setMap(null);
            }
        }

        initArrays();

        // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
        var bounds = new kakao.maps.LatLngBounds();

        //내 위치도 함께 보이도록
        //boundPoints.push(new kakao.maps.LatLng(mylatitude, mylongitude));

        var jsonData = JSON.parse(locationJsonStr);
        for (var i = 0; i < jsonData.marks.length; i++) {
            var item = jsonData.marks[i];

            var data = new Object();
            data.content = item.content;
            data.latlng = new kakao.maps.LatLng(item.lat, item.lng);
            positions.push(data);

            // 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다
            boundPoints.push(new kakao.maps.LatLng(item.lat, item.lng));
        }

        for (var i = 0; i < boundPoints.length; i ++) {
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(boundPoints[i]);
        }

        for (var i = 0; i < positions.length; i ++) {
            // 커스텀 오버레이를 생성합니다

            customOverlay[i] = new kakao.maps.CustomOverlay({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                content : positions[i].content // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            });
        }
        isFirst = false;

        map.setBounds(bounds);

    }

    function initArrays(){

        //초기화
        for (var i = 0; i < customOverlay.length; i ++) {
            customOverlay[i].setMap(null);
        }

        //초기화
        if (polyline.getLength()>0)
        {
            polyline.setMap(null);
        }

        positions = [];
        customOverlay = [];
        linePath = [];
        boundPoints = [];
    }

    //이동경로 보이기
    function showRoute(v){
        var routeJson = "";
        //window.open("ajax_route.asp?idx="+v);
        $.get("ajax_route.asp?uuid="+v, function(routeJson){

            initArrays();

            // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
            var bounds = new kakao.maps.LatLngBounds();

            var jsonData = JSON.parse(routeJson);
            for (var i = 0; i < jsonData.routes.length; i++) {
                var item = jsonData.routes[i];
                var data = new Object();
                data.content = item.content;
                data.latlng = new kakao.maps.LatLng(item.lat, item.lng);
                positions.push(data);

                // 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다
                boundPoints.push(new kakao.maps.LatLng(item.lat, item.lng));

                // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
                linePath.push(new kakao.maps.LatLng(item.lat, item.lng));
            }

            for (var i = 0; i < positions.length; i ++) {
                // 커스텀 오버레이를 생성합니다

                customOverlay[i] = new kakao.maps.CustomOverlay({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커를 표시할 위치
                    content : positions[i].content // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                });

                // LatLngBounds 객체에 좌표를 추가합니다
                bounds.extend(boundPoints[i]);
            }
            isFirst = false;

            // 지도에 표시할 선을 생성합니다
            polyline = new kakao.maps.Polyline({
                path: linePath, // 선을 구성하는 좌표배열 입니다
                strokeWeight: 5, // 선의 두께 입니다
                strokeColor: '#FFAE00', // 선의 색깔입니다
                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다
            });

            // 지도에 선을 표시합니다
            polyline.setMap(map);

            map.setBounds(bounds);

        });
    }


    function markerRepeat(){
        $.get("ajax_index.asp",function(r){
            console.log('reloaded');
            refreshMarker(r);
        });
    }

    $(function(){
        refreshMarker('${markJson}');
        //let it = setInterval(markerRepeat, 60 * 1000);
    });
</script>
