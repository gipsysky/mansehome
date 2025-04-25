<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">회원 ${userVO.idUser eq null ? '입력' : '수정' }</h1> 
      </div>

    <div class="row g-5"> 
      <div class="col-md-12 col-lg-12">  
	    <form method="post" target="HiddenFrame" action="writeOk" class="needs-validation" novalidate name="form"  >
	    <input type=hidden name="idUser" value="${userVO.idUser}">
	    <input type="hidden" name="del_flag" value="${del_flag eq 'Y' ? 'Y' : 'N' }"> 
          <div class="row g-3">
			
            <div class="col-6">
              <label for="name" class="form-label">회원 그룹 <span class="text-muted">(필수)</span></label>
 	 
				<select name="group_code" class="form-control" required>
					<option value="">선택하세요</option>
					<c:forEach items="${userGroupList}" var = "list">
						<option value="${list.group_code }" ${list.group_code.equals( userVO.group_code )? "selected" : "" }>${list.group_name }</option>
					</c:forEach>       
				</select>
							
              <div class="invalid-feedback">
                                필수 정보입니다
              </div>
            </div>  
         <c:if test="${userVO.idUser eq null }">
            <div class="col-6">
              <label for="user_id" class="form-label">아이디 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="user_id" name="user_id" required minlength="1" value="${userVO.user_id }">
              <div class="invalid-feedback">
                                필수 정보입니다
              </div>
            </div> 
         </c:if>
            
            <c:if test="${userVO.idUser eq null }">
            <div class="col-6">
              <label for="pw" class="form-label">비밀번호 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="pw" name="pw" required minlength="1" value="">
              <div class="invalid-feedback">
                                필수 정보입니다
              </div>
            </div>
            </c:if>
            
            <c:if test="${userVO.idUser ne null }">
            <div class="col-6">
              <label for="pw" class="form-label">비밀번호 </label>
              <input type="text" class="form-control" id="pw" name="pw" value="">
              <div class="invalid-feedback">
                                필수 정보입니다
              </div>
            </div>
            </c:if>
            
            <div class="col-6">
              <label for="name" class="form-label">회원명 <span class="text-muted">(필수)</span></label>
              <input type="text" class="form-control" id="name" name="name" required minlength="1" value="${userVO.name }">
              <div class="invalid-feedback">
                                필수 정보입니다
              </div>
            </div> 
            
            <div class="col-6">
              <label for="name" class="form-label">비상연락처 </label>
              <input value="${userVO.htel }"  type="number" pattern="\d*" class="form-control" id="htel" name="htel" placeholder="숫자만 입력해주세요" onKeyDown='onlyNumber();'>
              <div class="invalid-feedback">
                                필수 정보입니다
              </div>
            </div>
            
            
		            
		
			<div class="col-12 mt-5 mb-3 row">
				<h3>군인정보</h3>
			</div>
		
			<div class="col-12 mb-3 row">
				<div class="col-2">소속 </div>
				<div class="col-4">
                    <div class="input-group">
                        <select name="code2" class="form-control">
                            <option value="1" ${userVO.code2=="1"?"selected":""}>1대대</option>
                            <option value="2" ${userVO.code2=="2"?"selected":""}>2대대</option>
                            <option value="3" ${userVO.code2=="3"?"selected":""}>3대대</option>
                            <option value="4" ${userVO.code2=="4"?"selected":""}>4대대</option>
                        </select>
                        <select name="code3" class="form-control">
                            <option value="1" ${userVO.code3=="1"?"selected":""}>1중대</option>
                            <option value="2" ${userVO.code3=="2"?"selected":""}>2중대</option>
                            <option value="3" ${userVO.code3=="3"?"selected":""}>3중대</option>
                            <option value="4" ${userVO.code3=="4"?"selected":""}>4중대</option>
                        </select>
                        <select name="code4" class="form-control">
                            <option value="1" ${userVO.code4=="1"?"selected":""}>1소대</option>
                            <option value="2" ${userVO.code4=="2"?"selected":""}>2소대</option>
                            <option value="3" ${userVO.code4=="3"?"selected":""}>3소대</option>
                            <option value="4" ${userVO.code4=="4"?"selected":""}>4소대</option>
                        </select>
                    </div>


				</div>
				<div class="col-2">군번 </div>
				<div class="col-4">
					<input value="${userVO.army_no }" type="text" class="form-control" id="army_no" name="army_no">
				</div>
			</div>  
			<div class="col-12 mb-3 row">
                <div class="col-2">기기아이디 </div>
                <div class="col-4">
                    <input value="${userVO.uuid }" type="text" class="form-control" id="uuid" name="uuid">
                </div>
                <div class="col-2">혈액형 </div>
                <div class="col-4">
                    <input value="${userVO.blood_type }" type="text" class="form-control" id="blood_type" name="blood_type">
                </div>
			</div>
			<div class="col-12 mb-3 row">
				<div class="col-2">특이사항</div>
				<div class="col-10">
				<textarea rows="5" class="form-control" name="memo">${userVO.memo}</textarea> 
				</div> 
			</div>  
			<div class="col-12 mb-3 row">
				<div class="col-4">최종접속일시</div>
				<div class="col-8">
				${userVO.login_date} 
				</div> 
			</div> 
 
          </div> 
          <hr class="my-4">

          <div class="col-md-12 text-center">
          	<button class="btn btn-primary btn-lg" type="submit" onClick="javascript:ok();">확인</button> 
          	<button class="btn btn-secondary btn-lg" type="button" onClick="javascript:cancel();">취소</button> 
          </div>
        </form>
      </div>
    </div>
     

<form method="get" name="goForm" action="view">
<input type=hidden name="idUser" value="${userVO.idUser }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>
 


<script>
$(function(){
	var id = "${userVO.idUser}";
	var result = "${result}";
	
	//수정일 때, DB에서 가져오는 값이 없으면
	if (id!=0){
		if (result=="noRecord"){
			alert("요청하신 내용이 존재하지 앖습니다");
			history.go(-1);
		}		
	}
});

function ok(){ 
	document.form.submit();
}

function cancel(){
	var id = "${userVO.idUser}";

	//수정일 때, DB에서 가져오는 값이 없으면
	if (id!=0){
		document.goForm.action="view"; 
		document.goForm.submit();
	}else{
		document.goForm.action="list"; 
		document.goForm.submit();
	}
}
</script>

 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<div id="postlayer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;"><img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼"></div>
<script type="text/javascript">
// 우편번호 찾기 화면을 넣을 element
var element_layer = "";

function closeDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
}

function openDaumPostcode(num, wo, addr) {
	element_layer = document.getElementById('postlayer' + num);
	new daum.Postcode({
		oncomplete: function(data) {
			if (data.userSelectedType=="R") {
				document.getElementById(wo).value = data.zonecode;
				document.getElementById(addr).value = data.roadAddress;
			} else {
				document.getElementById(wo).value = data.zonecode;
				document.getElementById(addr).value = data.jibunAddress;
			}

			// iframe을 넣은 element를 안보이게 한다.
			// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
			element_layer.style.display = 'none';
		},
		width : '100%',
		height : '100%'
	}).embed(element_layer);

	// iframe을 넣은 element를 보이게 한다.
	element_layer.style.display = 'block';

	// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
	var width = 300; //우편번호서비스가 들어갈 element의 width
	var height = 420; //우편번호서비스가 들어갈 element의 height
	var borderWidth = 5; //샘플에서 사용하는 border의 두께
    var posTop = "";

	// 위에서 선언한 값들을 실제 element에 넣는다.
	element_layer.style.width = width + 'px';
	element_layer.style.height = height + 'px';
	element_layer.style.border = borderWidth + 'px solid';
	// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2) + 'px';
	//element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
	element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2) + 'px';
	//element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	//element_layer.style.top = posTop;
}
</script>


