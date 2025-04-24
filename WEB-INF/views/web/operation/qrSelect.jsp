<%--
http://google.manse.co.kr/qrcode/makeQR.php?folder=codes_lifebutton&filename=member_K_2807634139&print_url=localhost:9090/operation/qrSelect%3Fuserid%3DK_2807634139
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="content">
    <div class="container">
        <div class="sub-top">
            <h1>군인정보/작전투입 </h1>
            <a href="javascript:history.go(-1)" title="뒤로" class="go-back visible-xs"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div><!-- /.sub-top  -->
        <div class="sub-content">
            <div class="mypage-wrap">
                <h2>QR코드 보기</h2>
                <div class="qr-scan">

                    <div class="text-center p-5">
                        <button type="button" class="btn dark btn-block" onClick="document.location.href='/web/operation/showMember/${code}'">군인정보 보기</button>

                        <button type="button" class="btn dark btn-block mt-2" onClick="document.location.href='/web/operation/operationStart?idUser=${code}'">작전 투입</button>

                        <button type="button" class="btn dark btn-block mt-2" onClick="document.location.href='/'">위치 보기</button>
                    </div>
                </div>
            </div>
            <!-- /.mypage-wrap -->
        </div>
        <!-- /.sub-content -->
    </div>
    <!-- /.container -->
</div>