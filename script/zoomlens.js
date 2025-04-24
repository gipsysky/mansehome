jQuery(function() {
    if (jQuery("#zoom_area").html() == undefined) {
        return false;
    }
    var lensimg_size_x  = jQuery("#lens_img").width();   // 기본이미지 가로사이즈
    var lensimg_size_y  = jQuery("#lens_img").height();   // 기본이미지 세로사이즈
    var lensarea_size   = Math.floor(zoomarea_size_x * lensimg_size_x / zoomimg_size_x); // 렌즈의 크기 (가변)
    var zoom_rate       = zoomimg_size_x / lensimg_size_x; // 확대이미지와 기본이미지 사이의 비율
    var lensimg_offset  = jQuery("#lens_img").offset(); // lens이미지의 현재 위치값
    var zoom_flag       = true;                 //줌 작동 플래그
    var lens_flag       = true;                 //렌즈 작동 플래그
    var water_pos_x     = 0;    // 워터마크 가로 위치
    var water_pos_y     = 0;    // 워터마크 세로 위치
    var zoombg_size_x   = zoomarea_size_x;    // 그림자 가로사이즈
    var zoombg_size_y   = zoomarea_size_x;    // 그림자 세로사이즈

    jQuery("#lens_area").mouseover(function() {
        jQuery("#watermark_area").hide();
        jQuery("#zoom_area").show();
        jQuery("#lens_area").show();
        jQuery.setSelectDp('hidden');
    }).mousemove(function(e) {
        jQuery.moveLens(e);
    }).mouseout(function() {
        jQuery.initialize();
    });

    jQuery("#lens_img").mouseover(function() {
        //jQuery("#watermark_area").hide();
        lensimg_offset  = jQuery("#lens_img").offset(); // lens이미지의 현재 위치값을 다시 세팅한다. 윈도우 리사이징을 했을 경우에 대비해서...
        if (zoom_flag !== false) {
            jQuery("#zoom_area").fadeIn("slow");
            jQuery.setSelectDp('hidden');
        }
        if (lens_flag !== false && zoom_flag !== false) {
            jQuery("#lens_area").show();
        } else {
            jQuery("#watermark_area").hide();
        }
        if (jQuery("#zoom_img").attr("src").length === 0 || jQuery("#zoom_img").attr("src") === "undefiend") {
            jQuery("#zoom_img").attr("src", maximage_url);
        }
    }).mouseout(function() {
        jQuery.initialize();
    }).mousemove(function(e) {
        if (jQuery("#zoom_img").attr("src").length === 0 || jQuery("#zoom_img").attr("src") === "undefiend") {
            jQuery("#zoom_img").attr("src", maximage_url);
        }
        if (zoom_flag !== false) {
            jQuery.moveLens(e);
        }
    });

    jQuery("#watermark_area").mouseover(function() {
        jQuery(this).hide();
    });

    
    jQuery.extend({
        moveZoom : function () {
            var lens_pos = jQuery.getLensPosition();
            if (lens_pos === false) {
                return false;
            }

            zoom_x = Math.floor(-zoom_rate * lens_pos[0]);
            zoom_y = Math.floor(-zoom_rate * lens_pos[1]);

            jQuery("#zoom_img").css({left : zoom_x, top : zoom_y});
        },
        // lens_area의 위치값과 이미지의 위치값을 가지고 현재 레이어의 좌상단이 이미지에서 얼마나 떨어져 있는지 계산해야 한다.
        getLensPosition : function () {
            var lens_offset = jQuery("#lens_area").offset(); // lens_area의 현재 위치값 
            var lens_pos_lx = lens_offset.left - lensimg_offset.left; // lens_area의 lens_img에 대한 좌측 상대값
            var lens_pos_rx = (lensimg_offset.left + lensimg_size_x) - (lens_offset.left + lensarea_size); // lens_area의 lens_img에 대한 우측 상대값
            var lens_pos_ly = lens_offset.top - lensimg_offset.top; // lens_area의 lens_img에 대한 상단 상대값
            var lens_pos_ry = (lensimg_offset.top + lensimg_size_y) - (lens_offset.top + lensarea_size); // lens_area의 lens_img에 대한 하단 상대값

            if (lens_pos_lx < 0 || lens_pos_rx < 0 || lens_pos_ly < 0 || lens_pos_ry < 0) {
                return false;
            } else {
                return new Array(lens_pos_lx, lens_pos_ly);
            }
        },

        moveLens : function(m_obj) {
            //렌즈의 절대적 위치
            var lens_temp   = Math.floor(lensarea_size / 2);
            var lens_X0     = m_obj.pageX - lens_temp;
            var lens_Y0     = m_obj.pageY - lens_temp;
            var lens_X1     = m_obj.pageX + lens_temp;
            var lens_Y1     = m_obj.pageY + lens_temp;

            //이미지의 절대적위치 
            var img_X0      = lensimg_offset.left;
            var img_Y0      = lensimg_offset.top;
            var img_X1      = img_X0 + lensimg_size_x;
            var img_Y1      = img_Y0 + lensimg_size_y;

            //X축, Y축 범위를 벗어나지 않는다면 렌즈위치 이동
            if ((img_X0 < lens_X0) && (img_Y0 < lens_Y0) && (img_X1 > lens_X1) && (img_Y1 > lens_Y1)) { 
                left_pos    = lens_X0;
                top_pos     = lens_Y0;
            //X축 범위는 벗어나고 Y축의 범위는 벗어나지 않았을경우  
            } else if ((img_X0 > lens_X0 || img_X1 < lens_X1) && (img_Y0 < lens_Y0 && img_Y1 > lens_Y1)) {
                if (img_X0 > lens_X0) {
                    left_pos= img_X0;
                } else {
                    left_pos= img_X1 - lensarea_size;
                }
                top_pos     = lens_Y0;
            //Y축 범위는 벗어나고 X축의 범위는 벗어나지 않았을경우 
            } else if ((img_X0 < lens_X0 && img_X1 > lens_X1) && (img_Y0 > lens_Y0 || img_Y1 < lens_Y1)) {
                if (img_Y0 > lens_Y0) {
                    top_pos = img_Y0; 
                } else {
                    top_pos = img_Y1 - lensarea_size;
                }
                left_pos    = lens_X0;
            //오른쪽 하단 모서리 
            } else if (img_X1 < lens_X1 && img_Y1 < lens_Y1 ) {
                left_pos    = img_X1 - lensarea_size;
                top_pos     = img_Y1 - lensarea_size;
            //왼쪽 하단 모서리
            } else if (img_X0 > lens_X0 && img_Y1 < lens_Y1 ) {
                left_pos    = img_X0;
                top_pos     = img_Y1 - lensarea_size;
            //오른쪽 상단 모서리
            } else if (img_X1 < lens_X1 && img_Y0 > lens_Y0 ) {
                left_pos    = img_X1 - lensarea_size;
                top_pos     = img_Y0;
            //왼쪽 상단 모서리 
            } else if (img_X0 > lens_X0 && img_Y0 > lens_Y0 ) {
                left_pos    = img_X0;
                top_pos     = img_Y0;
            }
            jQuery("#lens_area").css({left : left_pos , top : top_pos});
            jQuery.moveZoom();
        }, 

        //익스 6.0일경우만 적용한다  
        setSelectDp : function (mode) {
            browser = jQuery.browser;
            if (browser.msie && browser.version === "6.0") {
                zoom_offset = jQuery("#zoom_area").offset();
                zoom_btm_pos    = jQuery("#zoom_area").height() + zoom_offset.top;
                jQuery("form['name=form'] select").each(function() {
                    if (mode === "hidden") {
                        select_offset = jQuery(this).offset();
                        if (zoom_btm_pos > select_offset.top) {
                            jQuery(this).css('visibility', mode);
                        }
                    } else {
                        jQuery(this).css('visibility', mode);
                    }
                });
            }
        },
        // 초기상태를 세팅한다.
        initialize : function (mode) {
            // mode = start : 최초 1회만 실행
            if (mode == "start") {
                //확대 이미지 크기 지정
                var zoomarea_width  = zoomarea_size_x;
                var zoomarea_height = zoomarea_size_x;

                //예외처리 이미지 
                //확대이미지 크기가 기본이미지 크기보다 작거나 확대영역보다 작은경우 
                if ((zoomimg_size_x <= lensimg_size_x && zoomimg_size_y <= lensimg_size_y) || ( zoomimg_size_x <= zoomarea_size_x && zoomimg_size_y <= zoomarea_size_x)) {
                    lens_flag = false;
                    zoomarea_width  = zoomimg_size_x;
                    zoomarea_height = zoomimg_size_y;
                    zoombg_size_x = zoomimg_size_x;
                    zoombg_size_y = zoomimg_size_y;
                //기본이미지와 확대이미지 비율이 틀린경우 
                } else if (Math.floor(zoomimg_size_x/zoomimg_size_y) !== Math.floor(lensimg_size_x/lensimg_size_y)) {
                    zoom_flag = false;
                } else {
                    if (zoomimg_size_x < lensimg_size_x) {
                        lensarea_size   = lensimg_size_x;
                    } else if (zoomimg_size_y < lensimg_size_y) {
                        lensarea_size   = lensimg_size_y;
                    } else if (zoomimg_size_x < zoomarea_size_x) {
                        lensarea_size   = lensimg_size_x;
                        zoomarea_width  = zoomimg_size_x;
                        zoomarea_height = zoomimg_size_x;
                        zoombg_size_x = zoomimg_size_x;
                        zoombg_size_y = zoomimg_size_x;
                    } else if (zoomimg_size_y < zoomarea_size_x) {
                        lensarea_size   = lensimg_size_y;
                        zoomarea_width  = zoomimg_size_y;
                        zoomarea_height = zoomimg_size_y;
                        zoombg_size_x = zoomimg_size_y;
                        zoombg_size_y = zoomimg_size_y;
                    }
                }
                
                // 로딩 후 zoomarea의 크기를 해당 크기로 고정한다.
                jQuery("#zoom_area").css({width : zoomarea_width, height : zoomarea_height});
                jQuery("#zoomimg_area").css({width : zoomarea_width, height : zoomarea_height, border : "solid 1px #" + zoomimg_border});
                jQuery("#lens_area").css("border","solid 1px #" + lensimg_border);
                
                if (zoom_shadow == "Y") {
                    jQuery("#zoom_img_bg").css({width : zoombg_size_x, height : zoombg_size_y, display : "block"});
                }

                // lens_area의 크기를 정한다.
                if (zoom_flag !== false) {
                    jQuery("#lens_area").css({width : lensarea_size, height : lensarea_size});
                }

                // water mark 위치 설정
                if (zoom_flag !== false && water_mark == "Y") {
                    jQuery.setWatermark();
                }
            }

            // 항상 초기값으로 만든다.
            jQuery("#zoom_area").hide();
            jQuery("#lens_area").hide();
            jQuery.setSelectDp('visible');
            // 워터마크 노출
            if (zoom_flag !== false && water_mark == "Y") {
                jQuery("#watermark_area").css("display","block");
            }
        },
        setWatermark : function (lens_obj) {
            //var lensimg_half_y = Math.floor(lensimg_size_y / 2);
            var water_width = jQuery("#watermark_area").width();

            if (typeof lens_obj != "undefined") {
                lensimg_offset = lens_obj;
            }
            if (lensimg_size_x <= water_width) {
                // ie의 경우 padding 및 border 계산이 fx와 다름
                var resize_width = (jQuery.browser.msie === true) ? lensimg_size_x : (lensimg_size_x - 16);
                jQuery("#watermark_area").width(resize_width);
                water_pos_x = lensimg_offset.left;
            } else {
                // 16을 더 빼는 이유는 watermark_area의 양옆 padding이 5px 씩 있고 border가 3px이기 때문에
                water_pos_x = Math.floor((lensimg_size_x - water_width - 16) / 2) + lensimg_offset.left;
            }
            //water_pos_y = lensimg_offset.top + (lensimg_half_y - 20);
            water_pos_y = lensimg_offset.top + (lensimg_size_y - 50);

            jQuery("#watermark_area").css({left : water_pos_x, top : water_pos_y, color : "#" + water_mark_color, border : "solid 3px #" + water_mark_color});
        }
    });

    // 로딩 시 최초 실행
    jQuery.initialize('start');

});

// 화면의 사이즈가 변경되면 레이어의 위치를 다시 잡음.
jQuery(window).resize(function() {
    lensimg_offset  = jQuery("#lens_img").offset(); // lens이미지의 현재 위치값
    jQuery("#lens_area").css({left : lensimg_offset.left, top : lensimg_offset.top});
    jQuery.setWatermark(lensimg_offset);
});

