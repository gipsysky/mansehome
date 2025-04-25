<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <title>만세커뮤니케이션</title>
  <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, minimum-scale=1, user-scalable=no">
  <meta charset="UTF-8">
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" ></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="icon" href="data:,">

  <script type="text/javascript" src="/script/common.js"></script>
  <script type="text/javascript" src="/js/admin/main.js"></script>
  <script type="text/javascript" src="/js/smartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>
  <link rel="stylesheet" href="/css/fontawesome/css/all.css">
  <link rel="stylesheet" href="/css/admin/admin.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <!-- Popper.js (필수) -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

  <!-- Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrap">
  <header>
    <div class="container">
      <div class="gnb-area">
        <h1>
          <a href="/">만세커뮤니케이션</a>
        </h1>
        <div id="gnb">
          <!-- 해당페이지 진입시 li .active 추가 -->
          <ul>
            <li>
              <a href="/company">회사소개</a>
            </li>
            <li>
              <a href="/portfolio">포트폴리오</a>
            </li>
            <li>
              <a href="/request">프로젝트 의뢰</a>
            </li>
            <li>
              <a href="/web/board/data/list?idTbl_cnf=60">고객센터</a>
            </li>
            <li class="toggle-gnb">
              <a href="#">MENU <span></span>
                <span></span>
                <span></span>
              </a>
            </li>
          </ul>
        </div>
        <!-- /#gnb -->
      </div>
    </div>
  </header>
  <!-- /header -->
  <!-- 전체메뉴 -->
  <div id="nav-mask"></div>
  <aside id="nav">
    <div class="container">
      <div class="inner">
        <button type="button" class="btn icon">
          <i class="bi bi-x-lg"></i>
        </button>
        <div class="left">
          <dl>
            <dt>최근 프로젝트</dt>
            <dd>
                  <span class="thumb">
                    <img src="img/recent.png" alt="">
                  </span>
              <span class="title">2024 오로나민C 구매인증 이벤트</span>
            </dd>
            <dd class="view">
              <a href="#">
                <u>바로가기</u>
              </a>
            </dd>
          </dl>
        </div>
        <div class="right">
          <ul>
            <li>
              <a href="/company">회사소개</a>
            </li>
            <li>
              <a href="/portfolio">포트폴리오</a>
            </li>
            <li>
              <a href="/request">프로젝트 의뢰</a>
            </li>
            <li>
              <a href="/web/board/data/list?idTbl_cnf=60">고객센터</a>
            </li>
          </ul>
          <span>회사 소개서 다운로드하기</span>
        </div>
      </div>
    </div>
  </aside>

  <div id="content" class="board">
    <div class="container">
      <div class="top-title">
        <h2 data-aos="fade-left">CS Center</h2>
        <p data-aos="fade-left" data-aos-delay="100">만세를 찾아주셔서 감사드립니다. <br>궁금하신 사항은 언제든지 문의하시기 바랍니다. </p>
        <div class="tab-nav" data-aos="fade-in" data-aos-delay="300">
          <ul>
            <li>
              <a href="/web/board/data/list?idTbl_cnf=60">NOTICE</a>
            </li>
            <li>
              <a href="/web/board/data/list?idTbl_cnf=68">DATA</a>
            </li>
            <li class="active">
              <a href="/web/board/data/list?idTbl_cnf=61">Q&A</a>
            </li>
          </ul>
        </div>
      </div>
      <!-- /.top-title -->
      <div class="board-list" data-aos="fade-down" data-aos-delay="400">
        <div class="board-header">
          <ul>
            <li>번호</li>
            <li>제목</li>
            <li>글쓴이</li>
            <li>등록일</li>
          </ul>
        </div>
        <ul class="board3">
          <li onClick="move('648','1')">
            <!--번호-->
            <a href="">45</a>
            <!-- fld2는 고정필드 : 제목 -->
            <a href="javascript:;">
              <strong>
                <img src="/images/common/lock.gif"> bbb
                <!--i class="fa fa-lock"></i-->
              </strong>
            </a> aaa
            <!--작성일-->
            <span class="date"> 2025.04.18 </span>
          </li>
        </ul>
      </div>
      <div class="pagination">
        <a href="1" class="first">
          <i class="fa fa-angle-double-left" aria-hidden="true"></i>
        </a>
        <!-- 이전페이지 버튼 -->
        <!-- 각 번호 페이지 버튼 -->
        <a href='1' class='active'> 1</a>
        <a href='2'> 2</a>
        <a href='3'> 3</a>
        <!-- 다음페이지 버튼 -->
        <a href="3" class="end">
          <i class="fa fa-angle-double-right" aria-hidden="true"></i>
        </a>
      </div>
      <div class="btn-box">
        <button type="button" class="btn line gray write">글쓰기</button>
      </div>
    </div>
  </div>
  <div id="passPop" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden=" ">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <form name="passForm" method="post" target="HiddenFrame">
          <input type="hidden" name="idTbl_data" value="">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">비밀번호 입력</h5>
          </div>
          <div class="modal-body">
            <input type="password" name="pw" class="form-control" />
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary-line float-right mt-2 " data-dismiss="modal">닫기</button>
            <button class="btn btn-secondary float-right mt-2 " onClick="move('','2')" type="button">확인</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <form method="get" name="listForm">
    <!--get 안하면 로그인 후 이 위치로 이동 시 에러-->
    <input type="hidden" name="pageNum" value="1">
    <input type="hidden" name="sType" value="">
    <input type="hidden" name="sType2" value="">
    <input type="hidden" name="sType3" value="">
    <input type="hidden" name="sType4" value="">
    <input type="hidden" name="sType5" value="">
    <input type="hidden" name="sWord" value="">
    <input type="hidden" name="idTbl_cnf" value="61">
    <input type="hidden" name="idTbl_data">
    <input type="hidden" name="pw">
  </form>
  <script>
    $(function() {
      $(".pagination a").click(function(event) {
        event.preventDefault();
        document.listForm.pageNum.value = $(this).attr("href");
        document.listForm.action = "list";
        document.listForm.method = "get";
        document.listForm.submit();
      });
      $(".sBtn").click(function(event) {
        event.preventDefault();
        document.listForm.pageNum.value = 1;
        document.listForm.action = "list";
        document.listForm.method = "get";
        document.listForm.submit();
      });
      $(".write").click(function(event) {
        event.preventDefault();
        document.listForm.action = "/web/board/data/write";
        document.listForm.submit();
        document.listForm.pw.value = "";
        document.listForm.idTbl_data.value = "";
      });
    });

    function OLD_move(v, pass_fg) {
      document.listForm.idTbl_data.value = v;
      document.listForm.action = "/web/board/data/view";
      document.listForm.submit();
      document.listForm.pw.value = "";
      document.listForm.idTbl_data.value = "";
    }

    function move(v, pass_fg) {
      if (pass_fg == 1) {
        document.listForm.reset();
        document.listForm.method = "post"; // 비밀번호가 있는 비밀글인 경우에는 query string 에 pw 값이 보이지않게 하기 위해 post
        document.listForm.idTbl_data.value = v;
        document.listForm.action = "/web/board/data/view";
        $("#passPop").modal();
        return;
      } else if (pass_fg == 2) {
        if (document.passForm.pw.value == "") {
          alert("비밀번호를 입력해주십시오");
          document.passForm.pw.focus();
          return;
        } else {
          document.listForm.pw.value = document.passForm.pw.value;
        }
      } else {
        document.listForm.reset();
        document.listForm.idTbl_data.value = v;
        document.listForm.action = "view";
      }
      document.listForm.submit();
    }
  </script>
  <footer>
