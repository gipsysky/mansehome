<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

     <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">벤더 입력</h1>
      </div>

    <form method="post" target="HiddenFrame" action="writeOk" class="needs-validation" novalidate name="form"  >
    <input type=hidden name="idVendor" value="${vendorVO.idVendor}"> 
	      
	<div class="row mb-3">
		<div class="col-sm-2">그룹 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-4">
		<select class="form-control" id="ven_group" name="ven_group" required minlength="1">
		<c:forEach items="${codesVO }" var="list">
			<option value="${list.idCodes }" ${list.idCodes.equals(vendorVO.ven_group)? "selected":"" }>${list.name }</option>
		</c:forEach>
		</select>
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div> 
 
		<div class="col-sm-2">상태</div>
		<div class="col-sm-4">
			<div class="form-check">
				<input class="form-check-input" value="Y" ${vendorVO.ven_status=="Y"?"checked":"" } type="radio" id="ven_status1" name="ven_status"><label class="form-check-label" for="ven_status1" >진행</label>
			</div> 
			<div class="form-check">
				<input class="form-check-input" value="N" ${vendorVO.ven_status=="N"?"checked":"" } type="radio" id="ven_status2" name="ven_status"><label class="form-check-label" for="ven_status2" >탈퇴</label> 
			</div> 
			<div class="form-check">
				<input class="form-check-input" value="I" ${vendorVO.ven_status=="I"?"checked":"" } type="radio" id="ven_status3" name="ven_status"><label class="form-check-label" for="ven_status3" >승인전</label>
			</div> 
		</div> 
	</div>		
	<div class="row mb-3">
		<div class="col-sm-2">아이디 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-4">
		<input value="${vendorVO.ven_id }" type="text" class="form-control" id="ven_id" name="ven_id" required minlength="1">
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div>  
		<div class="col-sm-2">비밀번호 <span class="text-muted">(수정 시에만 입력)</span></div>
		<div class="col-sm-4">
		<input value="" type="text" class="form-control" id="pw" name="pw" >
		</div> 
	</div> 
	<div class="row mb-3">
		<div class="col-sm-2">회사명 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-4">
		<input value="${vendorVO.comp_name }" type="text" class="form-control" id="comp_name" name="comp_name" required minlength="1">
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div>  
		<div class="col-sm-2">대표자명 <span class="text-muted">(필수)</span></div>
		<div class="col-sm-4">
		<input value="${vendorVO.comp_ceo_name }" type="text" class="form-control" id="comp_ceo_name" name="comp_ceo_name" required minlength="1">
	    <div class="invalid-feedback">필수 정보입니다</div>
		</div> 
	</div>  
	<div class="row mb-3">
		<div class="col-sm-2">대표전화번호 </div>
		<div class="col-sm-4">
		<input value="${vendorVO.tel }"  type="number" pattern="\d*" class="form-control" id="tel" name="tel" placeholder="숫자만 입력해주세요" onKeyDown='onlyNumber();'> 
		</div>  
		<div class="col-sm-2">팩스 </div>
		<div class="col-sm-4">
		<input value="${vendorVO.fax }" type="number" pattern="\d*" class="form-control" id="fax" name="fax" placeholder="숫자만 입력해주세요" onKeyDown='onlyNumber();'> 
		</div> 
	</div>  
	<div class="row mb-3">
		<div class="col-sm-2">업태 </div>
		<div class="col-sm-4">
		<input value="${vendorVO.uptae }" type="text" class="form-control" id="uptae" name="uptae"> 
		</div>  
		<div class="col-sm-2">업종</div>
		<div class="col-sm-4">
		<input value="${vendorVO.upjong }" type="text" class="form-control" id="upjong" name="upjong"> 
		</div> 
	</div> 
	  
	<div class="row mb-3">
		<div class="col-sm-2">사업자번호 </div>
		<div class="col-sm-4">
		<input value="${vendorVO.comp_num }" type="text" class="form-control" id="comp_num" name="comp_num"> 
		</div> 
		<div class="col-sm-2">홈페이지</div>
		<div class="col-sm-4">
		<input value="${vendorVO.homepage }" type="text" class="form-control" id="homepage" name="homepage"> 
		</div> 
	</div> 
	
	<div class="row mb-3">
		<div class="col-sm-2">주소</div>
		<div class="col-sm-4">
		<input value="${vendorVO.address1 }" type="text" class="form-control" id="address1" name="address1" onClick="openDaumPostcode('','wo','address1');" autocomplete="off" readonly> 
		</div> 
		<div class="col-sm-2">우편번호</div>
		<div class="col-sm-4">
		<input value="${vendorVO.wo }" type="text" class="form-control" id="wo" name="wo" autocomplete="off" readonly> 
		</div> 
	</div>
	 
	<div class="row mb-3">
		<div class="col-sm-2">상세주소</div>
		<div class="col-sm-10">
		<input value="${vendorVO.address2 }" type="text" class="form-control" id="address2" name="address2"> 
		</div> 
	</div> 
	
	<div class="row mb-3">
		<div class="col-sm-2">담당자명</div>
		<div class="col-sm-4">
		<input value="${vendorVO.manager_name }" type="text" class="form-control" id="manager_name" name="manager_name"> 
		</div> 
		<div class="col-sm-2">담당자연락처</div>
		<div class="col-sm-4">
		<input value="${vendorVO.manager_htel }" type="text" class="form-control" id="manager_htel" name="manager_htel"> 
		</div> 
	</div>
	<div class="row mb-3">
		<div class="col-sm-2">계좌주</div>
		<div class="col-sm-4">
		<input value="${vendorVO.bank_owner }" type="text" class="form-control" id="bank_owner" name="bank_owner"> 
		</div>
		<div class="col-sm-2">담당자이메일</div>
		<div class="col-sm-4">
		<input value="${vendorVO.manager_email }" type="text" class="form-control" id="manager_email" name="manager_email"> 
		</div> 
	</div>
	<div class="row mb-3">
		<div class="col-sm-2">은행명</div>
		<div class="col-sm-4">
		<input value="${vendorVO.bank_name }" type="text" class="form-control" id="bank_name" name="bank_name"> 
		</div>  
		<div class="col-sm-2">계좌번호</div>
		<div class="col-sm-4">
		<input value="${vendorVO.bank_num }" type="text" class="form-control" id="bank_num" name="bank_num"> 
		</div> 
	</div>
	<c:if test="${DELV_TYPE eq 'VENDOR'}">
	<div class="row mb-3">
		<div class="col-sm-2">배송비 유/무료</div>
		<div class="col-sm-10">
			<div class="form-check">
				<input class="form-check-input" value="Y" ${vendorVO.delv_set=="Y"?"checked":"" } type="radio" id="delv_set1" name="delv_set"><label class="form-check-label" for="delv_set1" >유료</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" value="N" ${vendorVO.delv_set=="N"?"checked":"" } type="radio" class="form-control" id="delv_set2" name="delv_set"><label class="form-check-label" for="delv_set2" >무료</label> 
			</div>
		</div> 
	</div>
	<div class="row mb-3">
		<div class="col-sm-2">배송비</div>
		<div class="col-sm-2">
			<input value="${vendorVO.delv_max }" type="number" pattern="\d*" class="form-control " id="delv_max" name="delv_max" onKeyDown='onlyNumber();'>
		</div>
		<div class="col-sm-8">
			<div class="row">
				<div class="col-sm-4">
				원 이상이면 무료배송, 이하 일 때는 배송비
				</div> 
				<div class="col-sm-4">
				<input value="${vendorVO.delv_price }" type="number" pattern="\d*" class="form-control" id="delv_price" name="delv_price" onKeyDown='onlyNumber();'>
				</div> 
				<div class="col-sm-4">원 부과</div>
			</div>
		</div> 
	</div>
	</c:if>
	<c:if test="${DELV_TYPE ne 'VENDOR'}">
		<input value="${vendorVO.delv_set }" name="delv_set" type="hidden">
		<input value="${vendorVO.delv_max }" name="delv_max" type="hidden">
		<input value="${vendorVO.delv_price }" name="delv_price" type="hidden">
	</c:if>
	<div class="row mb-3">
		<div class="col-sm-2">메모</div>
		<div class="col-sm-10">
		<textarea rows="5" class="form-control" name="memo">${vendorVO.memo}</textarea> 
		</div> 
	</div> 
	<div class="row mb-3">
		<div class="col-sm-4">접속IP</div>
		<div class="col-sm-8">
		${vendorVO.ip} 
		</div> 
	</div> 
	<div class="row mb-3">
		<div class="col-sm-4">최종접속일시</div>
		<div class="col-sm-8">
		${vendorVO.login_date} 
		</div> 
	</div> 
 
      <hr class="my-4">

      <div class="col-md-12 text-center">
      	<button class="btn btn-primary btn-lg" type="submit" onClick="javascript:ok();">확인</button> 
      	<button class="btn btn-secondary btn-lg" type="button" onClick="javascript:cancel();">취소</button> 
      </div>
    </form>

<form method="get" name="goForm">
<input type=hidden name="idVendor" value="${vendorVO.idVendor }">
<input type="hidden" name="pageNum" value="${criteria.pageNum }">
<input type="hidden" name="sType" value="${criteria.sType}">
<input type="hidden" name="sWord" value="${criteria.sWord}">
</form>
 


<script>
$(function(){
	var id = "${vendorVO.idVendor}";
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
	console.log(10);
	document.form.submit();
}

function cancel(){
	var id = "${vendorVO.idVendor}";
	document.goForm.action="list"; 
	document.goForm.submit();
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


