<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  


<div id="content">
  <div class="container">
    <ol class="breadcrumb">
      <li><img src="/images/ico_home.png" alt="홈"></li>
      <li>마이페이지</li>
      <li>회원정보 수정</li>
    </ol>
    <div class="sub-top">
      <h1>마이페이지</h1>
      <a href="javascript:history.go(-1)" title="뒤로" class="go-back visible-xs"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
    </div>
    <!-- /.sub-top  -->
    <div class="sub-content">
      <h2 class="hidden-xs"><img src="/images/txt_tit_mypage.png" alt="마이페이지"></h2>
      <div class="mypage-wrap">

          <jsp:include page="../../operation/inc_menu.jsp" flush="true">
              <jsp:param name="pageGubun" value="edit"/>
          </jsp:include>
         <div class="board-view member-out">
		
          <h3>회원 탈퇴</h3>
          
		<form name=frmJoin method=post action="secessionOk">
          <table class="table">
          <colgroup>
          <col width="16%">
          </colgroup>
          <tbody>
          <tr>
            <th>탈퇴사유를 선택해 주세요</th>
            <td>
              <c:forEach items="${reasonList }" var="list">
	              <div class="radio">
	                <label><input type="radio" name="sec_reason" value="${list.name }">${list.name }</label>
	              </div> 
              </c:forEach>
              <div class="radio">
                <label><input type="radio" name="sec_reason" value="기타">기타</label>
				<input type=text name='sec_reason_desc' value='' size='50' maxlength='50' class='form-control inline'>
              </div>
            </td>
          </tr>
          <tr>
            <th>비밀번호를 입력해 주세요</th>
            <td>
              <ul> 			
                <li>
                <span class="tit">비밀번호</span>
                <div class="form-group">
                  <div class="col-xs-12"><input type=password name='pw' value='' size='15' maxlength='12' class='form-control inline'></div>
                </div>
                </li>
								
              </ul>
            </td>
          </tr>
          </tbody>
          </table>
          <div class="btn-box">
            <button type="button" class="btn dark" onClick="checkForm();">탈퇴하기</button>
            <button type="button" class="btn line" onClick="history.back();">취소</button>
          </div>
        </form>
        
		</div>
      </div>
      <!-- /.mypage-wrap -->
    </div>
    <!-- /.sub-content -->
  </div>
  <!-- /.container -->
</div>
<!-- /#content -->


<script language=javascript> 
function checkForm(){
	var frm = document.frmJoin; 
	if ($("input[name='sec_reason']:radio:checked").val() == undefined){
		alert("[탈퇴사유]를 체크해주세요.");
		frm.sec_reason.focus();
		return;
	}
	if (EmptyChk(frm.pw.value) < 1) {
		alert("[비밀번호]를 입력해주세요.");
		frm.pw.focus();
		return;
	}   
	frm.target="HiddenFrame";
	frm.submit();
	frm.pw.value="";
}
</script>