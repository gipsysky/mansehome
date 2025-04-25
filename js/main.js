$(document).ready(function () {
    checkClass();
    AOS.init({
        duration: 600,
        once: true
    });
    
    gsap.registerPlugin(ScrollTrigger);
    gsap.from('.counter .data', {
        scrollTrigger: {
            trigger: ".counter-section",
        },
        textContent: 0,
        duration: 2,
        ease: Power1.easeIn,
        snap: {
            textContent: 1
        },
    });
    const items = document.querySelectorAll('.data2');

    gsap.from(items, {
        scrollTrigger: {
            trigger: ".counter-section",
        },
        textContent: 0,
        duration: 3,
        ease: Power1.easeIn,
        snap: {
            textContent: 1
        },
        stagger: {
            onUpdate: function() {
                this.targets()[0].innerHTML = numberWithCommas(Math.ceil(this.targets()[0].textContent));
            },
        }
    });


    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    $('.tab a').click(function() {
        var ac = $(this).attr('href');
        $('.history-list .container>div').removeClass('active');
        $(ac).addClass('active');
        $('.tab li').removeClass('active');
        $(this).closest('li').addClass('active');
    });

    $(window).on("scroll", function () {
        let e = $(window).scrollTop()
        e >= 200 ? $("#quick-btns").addClass("show") : $("#quick-btns").removeClass("show");
        if (e > 50) {
            $("body").addClass("scroll");
            $('#nav-mask').fadeOut(400, function() {
                $('body').removeClass('show');
            });
        } else {
            $("body").removeClass("scroll");
        }
    });
    $('header .toggle-gnb a').click(function() {
        if($('body').hasClass('show')) {
            $('#nav-mask').fadeOut(400, function() {
                $('body').removeClass('show');
            });
        }else {
            $('#nav-mask').fadeIn(300, function() {
                $('body').addClass('show');
            });
        };
        return false;
    });
    $('#nav .btn').click(function() {
        $('#nav-mask').fadeOut(400, function() {
            $('body').removeClass('show');
        });
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

});

let lastScrollY = 0;
window.addEventListener('scroll', e => {
    const scrollY = window.scrollY;
    const scrollUp = scrollY < lastScrollY;

    if (scrollY > 50 && scrollUp) {
        $('body').addClass('scroll-up');
    } else {
        $('body').removeClass('scroll-up');
    }
    lastScrollY = scrollY;
});

function checkClass() {
    if ($('#content').length != 0) {
        var wClass = $('#content').attr('class');
        $('body').addClass('body-' + wClass);
        console.log(wClass);
    }
}

