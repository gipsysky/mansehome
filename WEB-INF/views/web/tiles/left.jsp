<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<aside class="side-banner hidden-xs">
    <ul>
        <li><img src="/images/evt_img/side_bn1.png" border="0"></li>
        <li><img src="/images/evt_img/side_bn2.png" border="0"></li>
        <li><img src="/images/evt_img/side_bn3.png" border="0"></li>
    </ul>
</aside><!-- /.side-banner -->

<aside id="side_cart" class="side-quick-banner hidden-xs"></aside>
</div>
<!-- /#wrap -->

<!--퀵메뉴 불러오기-->
<script>
    $(function(){
        $.get("/web/sale/order/quickmenu",function(r){
            $("#side_cart").html(r);
        });
    });
</script>
<!--/퀵메뉴 불러오기-->

<script>
    $(function(){
        var bnTop = $('.side-quick-banner').offset().top;
        $window.scroll(function(){
            var scrollTop = $(document).scrollTop();
            var hval = $(document).height();
            if (scrollTop < bnTop) {
                if($('.top-event-banner').length) {
                    scrollTop = bnTop- $('.top-event-banner').outerHeight();
                }else {
                    scrollTop = bnTop
                }
            }else {
                if($('.top-event-banner').length) {
                    scrollTop = scrollTop- $('.top-event-banner').outerHeight()
                }else {
                    scrollTop = scrollTop
                }
            }

            $(".side-quick-banner, .side-banner").stop();
            $(".side-quick-banner, .side-banner").animate( { "top" : scrollTop });
        });
    });
</script>