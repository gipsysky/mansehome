<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="content">
    <div class="container">
        <div class="sub-top">
            <h1>군인정보 </h1>
            <a href="javascript:history.go(-1)" title="뒤로" class="go-back visible-xs"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div><!-- /.sub-top  -->
        <div class="sub-content">
            <div class="mypage-wrap">
                <h2>군인정보</h2>
                <div class="qr-scan">
                    <table class="table">
                        <colgroup>
                            <col width="20%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>· 이름</th>
                            <td>${userVO.name }</td>
                        </tr>
                        <tr>
                            <th>· 군번</th>
                            <td>${userVO.army_no }</td>
                        </tr>
                        <tr>
                            <th>· 비상 연락처</th>
                            <td>${userVO.htel }</td>
                        </tr>
                        <tr>
                            <th>· 혈액형 </th>
                            <td>${userVO.blood_type }</td>
                        </tr>
                        <tr>
                            <th>· 소속 </th>
                            <td>${userVO.code2 }대대 ${userVO.code3 }중대 ${userVO.code4 }소대</td>
                        </tr>
                        <tr>
                            <th>· 특이사항</th>
                            <td>${userVO.memo }</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.mypage-wrap -->
        </div>
        <!-- /.sub-content -->
    </div>
    <!-- /.container -->
</div>