function ProdOrder() {
//이름
//	if (checkUserName('document.frmOrder.ord_name') != true) {
//		alert(checkUserName('document.frmOrder.ord_name'));
//		document.frmOrder.ord_name.focus();
//		return;
//	}

	var ord_name = document.frmOrder.ord_name.value
	if (ord_name == "") {
		alert("이름 입력하여 주십시오.");
		document.frmOrder.ord_name.focus();
		return;
	}

//전화번호
/*
	if (checkPhone('document.frmOrder.ord_tel1','document.frmOrder.ord_tel2','document.frmOrder.ord_tel3') == false) {
		alert("전화번호 입력이 잘 못 되었습니다.");
		document.frmOrder.ord_tel1.focus();
		return;
	}
*/
//핸드폰번호
	if (checkPhone('document.frmOrder.ord_htel1','document.frmOrder.ord_htel2','document.frmOrder.ord_htel3') == false) {
		alert("핸드폰번호 입력이 잘 못 되었습니다.");
		document.frmOrder.ord_htel1.focus();
		return;
	}

//이메일
/*
	if (checkEmail('document.frmOrder.ord_email') == false) {
		alert("이메일 입력이 잘 못 되었습니다.");
		document.frmOrder.ord_email.focus();
		return;
	}
*/
//우편번호
	var ord_zip = alltrim(document.frmOrder.ord_zip.value)
	if (ord_zip.length < 5 ) {
		alert("우편번호를 입력해 주십시오.");
		document.frmOrder.ord_zip.focus();
		return;
	}
	if (beNumStr(document.frmOrder.ord_zip.value) == false) {
		alert("우편번호를 숫자로만 입력해 주십시오.");
		document.frmOrder.ord_zip.focus();
		return;
	}

//주소
	var ord_addr = document.frmOrder.ord_addr.value
	if (ord_addr == "") {
		alert("주소를 입력하여 주십시오.");
		document.frmOrder.ord_addr.focus();
		return;
	}

//이름
//	if (checkUserName('document.frmOrder.rev_name') != true) {
//		alert(checkUserName('document.frmOrder.rev_name'));
//		document.frmOrder.rev_name.focus();
//		return;
//	}

	var rev_name = document.frmOrder.rev_name.value
	if (rev_name == "") {
		alert("이름 입력하여 주십시오.");
		document.frmOrder.rev_name.focus();
		return;
	}

//전화번호
/*
	if (checkPhone('document.frmOrder.rev_tel1','document.frmOrder.rev_tel2','document.frmOrder.rev_tel3') == false) {
		alert("전화번호 입력이 잘 못 되었습니다.");
		document.frmOrder.ord_tel1.focus();
		return;
	}
*/
//핸드폰번호
	if (checkPhone('document.frmOrder.rev_htel1','document.frmOrder.rev_htel2','document.frmOrder.rev_htel3') == false) {
		alert("핸드폰번호 입력이 잘 못 되었습니다.");
		document.frmOrder.rev_htel1.focus();
		return;
	}

//우편번호
	var rev_zip = alltrim(document.frmOrder.rev_zip.value)
	if (rev_zip.length < 5 ) {
		alert("우편번호를 입력해 주십시오.");
		document.frmOrder.rev_zip.focus();
		return;
	}
	if (beNumStr(document.frmOrder.rev_zip.value) == false) {
		alert("우편번호를 숫자로만 입력해 주십시오.");
		document.frmOrder.rev_zip.focus();
		return;
	}

//주소
	var rev_addr = document.frmOrder.rev_addr.value
	if (rev_addr == "") {
		alert("주소를 입력하여 주십시오.");
		document.frmOrder.rev_addr.focus();
		return;
	}

//배송시 요구사항
	var desc = alltrim(document.frmOrder.desc.value);
	if (desc.length != 0) {
		if (cal_byte(desc) == false) {
			alert("배송시 요구사항은 300 바이트 이상 입력할 수 없습니다.");
			document.frmOrder.desc.focus();
			return;
		}
	}

//개인정보보호 동의
	if(document.frmOrder.protect != undefined) {
		if(document.frmOrder.protect[0].checked != true) {
			alert("개인정보수집에 동의해주세요.");
		return;}
	}

	if (document.frmOrder.pay_type[3].checked == true) {
		if (document.frmOrder.bank_idx.value == "") {
			alert("입금은행을 선택해 주십시오.");
			document.frmOrder.bank_idx.focus();
			return;
		}
		var ip_name = alltrim(document.frmOrder.ip_name.value);
		if (ip_name.length == 0) {
			alert("입금자명을 입력해 주십시오'");
			document.frmOrder.ip_name.focus();
			return;
		}
	}

//	var iXPos;
//	var iYPos;
//	iXPos = (window.screen.width - 601) / 2;
//	iYPos = (window.screen.height - 650) / 2 - 20;

//	s_win = window.open("about:blank", "settle", "width=625, height=500, scrollbars=no, status=yes, left="+ iXPos +", top="+ iYPos +", scrollbars=yes");
	document.frmOrder.target = "HiddenFrame";
//데이콤
	document.frmOrder.action = "order_settle.asp";
// 이니시스
//	document.frmOrder.action = "order_settle_ini.asp";
	document.frmOrder.submit();
//	s_win.focus();

}
