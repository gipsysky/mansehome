/* global $ */
function goLogin(return_url){
	if (confirm("로그인이 필요합니다.\n로그인하시겠습니까?")){
		var url = "";
		if (return_url == "" || return_url == undefined)
			url = "/web/member/login";
		else
			url = "/web/member/login?return_url="+return_url;
		top.location.href = url;
	}
}

function sessionCheck(){ 
	var _CONTEXT_PATH = "/";
	var sessionOk = true; 
	$.ajax({
		url : _CONTEXT_PATH + 'sessionCheck.json',
		data : JSON.stringify({}),
		type : 'post', 
		dataType : 'json',
		async : false,
		contentType : "application/json ; charset=UTF-8"
		})
		.done(function(res){  
			if (res.successYN != "Y"){  
				alert("로그인해주십시오");
				sessionOk = false;
			}
		})
		.fail(function(request, error){
			console.log("fail");
			console.log("status : " + request.status);
			console.log("message : " + request.responseText);
			console.log("error : " + error);
			
			sessionOk = false;
		});
	return sessionOk;
}

function getAjax(url){ 
	$("#loading").show();
	
	var result = "";
	$.ajax({
		url : url,
		type : 'get', 
		async : false,
		})
		.done(function(res){  
			result = res;
			$("#loading").hide();
		})
		.fail(function(request, error){
			console.log("fail");
			console.log("request url : " + url);
			console.log("status : " + request.status);
			console.log("message : " + request.responseText);
			console.log("error : " + error);
			$("#loading").hide();			
		});
	return result;
} 


// LAYER POPUP
function openLayer(el) {
    var temp = $('#' + el); //레이어의 id를 temp변수에 저장

    if(!$('.popup:visible').length) {
        $("<div/>", {
            "id": "mask",
        }).appendTo('body').fadeIn(200);
    }
    temp.show();
    //setModalMaxHeight(temp);
    temp.css({
        'left': ($(window).scrollLeft() + ($(window).width() - $(this).outerWidth())/2) + 'px',
        'top': (($(window).height() - temp.outerHeight())/2) + 'px'
    });
    popupPosInit(); 
    //$('body, html').css('overflow','hidden');
}
function hideLayer(el) {
    var temp = $('#' + el); //레이어의 id를 temp변수에 저장
    temp.hide();

	if($('#mask').length) {
		$('#mask').fadeOut(200, function() {
			$(this).remove();
		});
	}
	return false;
}
function flexdestroy(selector) {
    var $els = $(selector);
    $els.each(function () {
        var $el = $(this);
        var $elClean = $el.clone();

        $elClean.find('.flex-viewport').children().unwrap();
        $elClean
            .removeClass('flexslider')
            .find('.clone, .flex-direction-nav, .flex-control-nav')
            .remove()
            .end()
            .find('*').removeAttr('style').removeClass(function (index, css) {
                // If element is SVG css has an Object inside (?)
                if (typeof css === 'string') {
                    return (css.match(/\bflex\S+/g) || []).join(' ');
                }
            });

        $elClean.insertBefore($el);
        $el.remove();
    });
}

function setModalMaxHeight(element) {
    this.$element     = $(element);
    this.$content     = this.$element.find('.popup-body');
    var borderWidth   = this.$content.outerHeight() - this.$content.innerHeight();
    var dialogMargin  = $(window).width() < 992 ? 120 : 100;
    var contentHeight = $(window).height() - (dialogMargin + borderWidth);
    var headerHeight  = this.$element.find('.popup-header').outerHeight() || 0;
    var footerHeight  = this.$element.find('.popup-footer').outerHeight() || 0;
    var maxHeight     = contentHeight - (headerHeight + footerHeight);

    this.$content.css({
        'max-height': maxHeight,
        'overflow-y': 'auto'
    });
}
function inputNumberOnly(el) {
    el.value = el.value.replace(/[^0-9]/g, '');
}

// BOOKMARK
function bookmarksite(title, url) {
    // Internet Explorer
    if (document.all) {
        window.external.AddFavorite(url, title);
    }
    // Google Chrome
    else if (window.chrome) {
        alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
    }
    // Firefox
    else if (window.sidebar) // firefox
    {
        window.sidebar.addPanel(title, url, "");
    }
    // Opera
    else if (window.opera && window.print) { // opera
        var elem = document.createElement('a');
        elem.setAttribute('href', url);
        elem.setAttribute('title', title);
        elem.setAttribute('rel', 'sidebar');
        elem.click();
    }
}

// RESPONSIVE TABLE SCROLL
function hscrollInit(){
    if($('.scrollable.horizontal').length) {
        $('.scrollable.horizontal').each(function() {
            $(this).wrap("<div class='scrollable-container'></div>");
            $(this).append(
            '<div class="slide-control">' +
            '   <button type="button" class="btn prev"><i>이전</i></button>'+
            '   <button type="button" class="btn next"><i>다음</i></button>'+
            '</div>');
            var $scrollx = $(this),
                $sPrev = $scrollx.find('.prev'),
                $sNext = $scrollx.find('.next');

            $sPrev.hide();
            $scrollx.scroll(function() {
                if($scrollx.scrollLeft() > $scrollx.find('table').width()-$scrollx.width() - 30){
                    $sNext.fadeOut();
                    $sPrev.fadeIn();
                }
                if($scrollx.scrollLeft() <= 30){
                    $sPrev.fadeOut();
                    $sNext.fadeIn();
                }

            });
            $sNext.on('touchstart click', function(e){
                e.preventDefault();
                $scrollx.animate({scrollLeft:"+=100px"},600);
                if($scrollx.scrollLeft()> $scrollx.find('table').width()-$scrollx.width() - 30){
                    $sNext.hide();
                }
            });

            $sPrev.on('touchstart click', function(e){
                e.preventDefault();
                $scrollx.animate({scrollLeft:"-=100px"},600);
                if($scrollx.scrollLeft()<= 30){
                    $sPrev.hide();
                }

            });
        });
    }
}

function popupPosInit(){
    if($('.popup').length) {
        $('.popup').each(function() {
            $(this).css({
                'left': ($(window).scrollLeft() + ($(window).width() - $(this).outerWidth())/2) + 'px',
                'top': (($(window).height() - $(this).outerHeight())/2) + 'px'
            });
        });

    }
}

$(function() {

    var $window = $(window);

    $('body').on('click', '.popup .btn-x, .popup .close', function() {
        $(this).parent().parent('.popup').hide();
        if($('#mask').length) {
            $('#mask').fadeOut(200, function() {
                $(this).remove();
            });
        }
        return false;
        //$('body, html').css('overflow','auto');
    });

    var mainSlider = $('.main-visual .flexslider').flexslider({
        animation: 'slide',
        selector: '.slides > .item',
        animationLoop: true,
        slideshow: true,
        directionNav: false,
        controlNav: false,
        touch: true,
        slideshowSpeed: 6000, //슬라이드 반복 속도
        initDelay: 500,
        //smoothHeight: true,
        start: function(slider) {
            slider.css( 'opacity', '1' );
            $('.total-slides').text(slider.count);
        },
        after: function (slider) {
            if (!slider.playing) {
                slider.play();
            }
            $('.current-slide').text(slider.currentSlide + 1);
        }
    });
    $('.special-items .flexslider').flexslider({
        animation: 'fade',
        animationLoop: true,
        slideshow: true,
        directionNav: false,
        controlNav: true,
        touch: true,
        slideshowSpeed: 3000, //슬라이드 반복 속도
        initDelay: 500,
        start: function(slider) {
            slider.css( 'opacity', '1' );
        },
        after: function (slider) {
            if (!slider.playing) {
                slider.play();
            }
        }
    });

    $('.main-visual .go-to-next, .main-visual .btn.next').click(function() {
        mainSlider.flexslider('next');
    });
    $('.main-visual .btn.prev').click(function(){
        mainSlider.flexslider('prev');
    });
    $('.main-visual .btn.stop').click(function(){
        mainSlider.flexslider('pause');
        $('.btn.play').show();
        $('.btn.stop').hide();
    });
    $('.main-visual .btn.play').click(function(){
        mainSlider.flexslider('play');
        $('.btn.stop').show();
        $('.btn.play').hide();
    });

    $('.live-review .owl-carousel').owlCarousel({
        loop: true,
        autoplay: true,
        autoplayTimeout: 6000,
        autoplaySpeed: 600,
        margin: 20,
        nav: true,
        navSpeed: 600,
        navText: ['&#x3c;','&#x3e;'],
        dots: false,
        responsiveClass:true,
        responsive:{
            0:{
                items: 2,
                slideBy: 2
            },
            1000:{
                items: 5,
                slideBy: 5
            }
        },
    });

    $('.tab-contents').each(function() {
        $(this).find('.tab-item').hide();
        $(this).find('.tab-item').eq(0).show();
    });

    function tabContent(selecter, contents) {
        $(selecter).click(function() {
            if (!$(this).hasClass('active')) {
                $(this).addClass('active').siblings(this).removeClass('active');
                $($(this).find('a').attr('href')).show().siblings(contents).hide();
            }

            return false;
        });
    }

    tabContent('.tab-nav.use-tab li', 'div.tab-item');

    // FAQ
    $('.faq-list.use-faq dt').click(function() {

        var myList = $(this).next('dd');

        if(!$(this).hasClass('active')) {
            $('.faq-list dt').removeClass('active');
            $(this).addClass('active');
            $('.faq-list dd').hide();
            myList.show();
        } else {
            $(this).removeClass('active');
            myList.hide();
        }
        return false;
    });

    // CHECKBOX TOGGLE

    $(':checkbox').click(function(){
        var $label = $(this).next('label');
        $(this).is(':checked') ? $label.addClass('active') : $label.removeClass('active');
        $(this).is(':checked') ? $(this).prop('checked', true) : $(this).prop('checked', false);
    });

    // RADIO BUTTON TOGGLE

    $(':radio').click(function(){
        //console.log($(this));
        var $label = $(this).next('label');
        var val = $(this).attr('name');
        var $labelGroup = $('input[name='+val+']').next();
        $labelGroup.removeClass('active');
        if($(this).is(':checked')){
            $('input[name='+val+']').prop('checked',false);
            $(this).prop('checked',true);
            $label.addClass('active');
        }
    });

    // UPLOAD FILE

    var fileTarget = $('.file-upload .upload-hidden');

    fileTarget.on('change', function () { // 값이 변경되면
        if (window.FileReader) { // modern browser
            var filename = $(this)[0].files[0].name;
        } else { // old IE
            var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
        }

        // 추출한 파일명 삽입
        $(this).siblings('.upload-name').val(filename);
    });

    // SCROLL EVENT

   $window.scroll(function() {
        var wScroll = $(this).scrollTop();

        if(wScroll > 100) {
            $('.scroll-top').addClass('is-showing');
        } else {
            $('.scroll-top').removeClass('is-showing');
        }
    });

    // SCROLL TOP BUTTON

    $('.scroll-top').on('click', function() {
        $('html, body').animate({scrollTop:0}, '2000', function() {
            $('.scroll-top').removeClass('is-showing');
        });
        return false;

    });

    $('#wrap').not('.index').find('#toggle-category').click(function() {
        $(this).next('.all-category').toggle();
        return false;
    });
    $('body').click(function(e) {
        if ($('#wrap').not('.index').find('.all-category').css('display') == 'block') {
            if (!$('.all-category').has(e.target).length) {
                $('.all-category').hide();
            };
        };
    });

    $('.toggle-nav .category-nav li.has-sub>a').click(function() {
        if(!$(this).parent().hasClass('active')) {
            $('.toggle-nav .has-sub').removeClass('active');
            $(this).parent().addClass('active');
            $('.toggle-nav .category-nav ul ul').hide();
            $(this).next('ul').show();
            console.log('open');
        } else {
            $(this).parent().removeClass('active');
            $(this).next('ul').hide();
            console.log('close');
        }
        return false;
    });

    $('#toggle-open').click(function() {
        $('.toggle-nav-wrap').fadeIn(100);
        $('.toggle-nav').addClass('active');
    });

    $('body').on('click touchstart', '#toggle-close, .toggle-nav .btn-x', function() {
        $('.toggle-nav').removeClass('active');
        setTimeout(function() {
            $('.toggle-nav-wrap').fadeOut(100);
        }, 300);
    });

    $window.resize(function() {
        //setModalMaxHeight('.popup');
        popupPosInit();
    }).resize();

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



