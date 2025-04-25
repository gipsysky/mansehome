<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script type ="text/javascript" src ="/js/crypto/jsbn.js"></script>
<script type ="text/javascript" src ="/js/crypto/rsa.js"></script>
<script type ="text/javascript" src ="/js/crypto/prng4.js"></script>
<script type ="text/javascript" src ="/js/crypto/rng.js"></script>

<div id="content">
    <div class="container">
        <ol class="breadcrumb">
            <li><img src="/images/ico_home.png" alt="홈"></li>
            <li>ID/PW 찾기</li>
        </ol>
        <div class="sub-top">
            <h1>ID/PW 찾기</h1>
            <a href="javascript:history.go(-1)" title="뒤로" class="go-back visible-xs"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
        <!-- /.sub-top  -->
        <div class="sub-content">
            <div class="login-form">
                <h2 class="center hidden-xs"><img src="/images/txt_tit_pw.png" alt="ID/PW 찾기"></h2>

                <section class="pull-left">
                    <form NAME="frmSID" METHOD="post">
                        <h3>아이디 찾기</h3>
                        <form NAME="frmSID" METHOD="post">
                        <div class="form-group">
                            <input type=text name='name' value='' size='12' maxlength='20' style='ime-mode:active;' class='form-control' autocomplete='off' placeholder='이름' tabindex=1><input type=text name='email' value='' size='30' maxlength='50' style='ime-mode:inactive;' class='form-control' autocomplete='off' placeholder='이메일' tabindex=2>
                            <button type="button" class="btn orange" onClick="SearchID()">확인</button>
                        </div>
                        </form>
                    </form>
                </section>
                <section class="pull-right">
                    <FORM NAME="frmSPWD" METHOD="post">
                        <h3>비밀번호 찾기</h3>
                        <FORM NAME="frmSPWD" METHOD="post">
                        <div class="form-group">
                            <input type=text name='userid' value='' size='12' maxlength='20' style='ime-mode:inactive;' class='form-control' autocomplete='off' placeholder='아이디' tabindex=4><input type=text name='email' value='' size='30' maxlength='50' style='ime-mode:inactive;' class='form-control' autocomplete='off' placeholder='이메일' tabindex=5>
                            <button type="button" class="btn orange" onClick="SearchPWD()">확인</button>
                        </div>
                        </FORM>
                    </form>
                </section>
                <br>
                <div class="login-footer">
                    <p class="lead text-md">아직 뚜또 회원이 아니세요?</p>
                    <span>회원이 되시면 다양한 혜택을 누리실 수 있습니다.</span>
                    <div class="btns">
                        <a href="/member/join_form.asp" class="btn dark">신규회원가입</a>
                        <!-- <a href="#" class="btn line gray">이메일 간편가입</a> -->
                    </div>
                </div>

            </div>
            <!-- /.login-form -->
        </div>
        <!-- /.sub-content -->
    </div>
    <!-- /.container -->
</div>
<!-- /#content -->

<script type="text/javascript">
    function SearchID() {
        var uname = document.frmSID.name.value;
        var email = document.frmSID.email.value;
        if (EmptyChk(uname) < 2) {
            alert("이름을 입력해 주십시오.");
            document.frmSID.name.focus();
            return;
        }
        if (EmptyChk(email)	< 5) {
            alert("이메일을 입력해 주십시오.");
            document.frmSID.email.focus();
            return;
        }

        //	SearchID = window.open("blank.html", "SearchID", "width=450, height=250, top=100, left=100, scrollbars=no, status=no");
        //	document.frmSID.target = "SearchID";
        document.frmSID.action = "search_id.asp";
        document.frmSID.submit();
    }

    function SearchPWD() {
        var userid = document.frmSPWD.userid.value;
        var email  = document.frmSPWD.email.value;

        if (EmptyChk(userid) < 2) {
            alert("아이디를 입력해 주십시오.");
            document.frmSPWD.userid.focus();
            return;
        }
        if (EmptyChk(email)	< 5) {
            alert("이메일을 입력해 주십시오.");
            document.frmSPWD.email.focus();
            return;
        }

        //	SearchPWD = window.open("blank.html", "SearchPWD", "width=450, height=250, top=100, left=100, scrollbars=no, status=no");
        //	document.frmSPWD.target = "SearchPWD";
        document.frmSPWD.action = "search_pwd.asp";
        document.frmSPWD.submit();
    }
</script>
