<!--
//고객 아이디
function checkCustID(val) {
	var str = alltrim(eval(val+".value"));
	if (str.length == 0)  { return false; }

	if (beAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz") == false) { return false; }

	return true;
}

//유저아이디 
function checkUserID(val) {
	var str = alltrim(eval(val+".value"));
	if (str.length == 0) { return "아이디를 입력하여 주십시오." }

	if (beAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz") == false)  { return  "아이디는 숫자, 영문 조합으로 6자 이상 12자 이하로 입력하여 주십시오." }
	
	if (str.length < 6 || str.length > 12)  { return  "아이디는 숫자, 영문 조합으로 6자 이상 12자 이하로 입력하여 주십시오." }

	return true;
}

//벤더코드
function checkVendorCode(val) {
	var str = alltrim(eval(val+".value"));
	if (str.length == 0) { return "업체코드를 입력하여 주십시오." }

	if (beAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz") == false)  { return  "아이디는 숫자, 영문 조합으로 4자 이상 8자 이하로 입력하여 주십시오." }
	
	if (str.length < 4 || str.length > 8)  { return  "업체코드는 숫자, 영문 조합으로 4자 이상 8자 이하로 입력하여 주십시오." }

	return true;
}

//이름확인
function checkUserName(val) {
	var str = alltrim(eval(val+".value"));
	if (str.length == 0)  { return "이름을 입력하여 주십시오." }
		
	if (beAllHangulStr(str) == false) { return "이름은 한글로 10자까지 입력가능합니다." }

	var chkStr1 = "가나"
	var chkStr2 = "가나다라마바사아자차"
	if (str.length < chkStr1.length || str.length > chkStr2.length) { return "이름은 한글로 10자까지 입력가능합니다." }

	return true;
}

//비밀번호
function checkPassword(val1, val2) {
	var str1 = eval(val1+".value");
	var str2 = eval(val2+".value");
	if (str1.length == 0) { return "비밀번호를 입력해 주십시오." }
		
	if (str1.length < 6 || str1.length > 12)	{ return "비밀번호는 영문 숫자 조합으로 6자리 이상 12자리 이하이어야 합니다." }

	if (str2.length == 0) { return "비밀번호 확인을 위해 다시 한번 입력해 주십시오." }

	if (beAllowStr(str1, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz") == false) { return "비밀번호는 영문 숫자 조합으로 6자리 이상 12자리 이하이어야 합니다." }

	if (str1 != str2) { return "비밀번호가 일치하지 않았습니다." }
		
	return true;
}

//주민번호 확인 
function checkRegID(val1, val2) {
	var today = new Date();
	var chkYear1 = today.getYear();
	var chkYear2 = 0;
	
	if (chkYear1 < 2000) chkYear1 += 1900;
	
	var chk = 0;
	var chk2 = 0;
	var chk3 = 0;
	var yy = eval(val1+".value").substring(0,2);
	var mm = eval(val1+".value").substring(2,4);
	var dd = eval(val1+".value").substring(4,6);
	var chkSex = eval(val2+".value").substring(0,1);
 
	if ((eval(val1+".value").length != 6 ) ||  (mm < 1 || mm > 12 || dd < 1) ) { return "주민등록번호 입력이 잘 못 되었습니다." }
 
	if ((chkSex != 1 && chkSex !=2 && chkSex !=3 && chkSex !=4) || (eval(val2+".value").length != 7 )) {
		return "주민등록번호 입력이 잘 못 되었습니다.";
	}
		
	// 주민등록번호 validation check
 
	for (var i = 0; i <=5 ; i++) { 
		chk = chk + ((i%8+2) * parseInt(eval(val1+".value").substring(i,i+1)));
	}
	for (var i = 6; i <=11 ; i++){ 
		chk = chk + ((i%8+2) * parseInt(eval(val2+".value").substring(i-6,i-5)));
	}
 
	chk = 11 - (chk %11)
	chk = chk % 10
 
	 if (chk != eval(val2+".value").substring(6,7))  { return "주민등록번호 입력이 잘 못 되었습니다." }  

	 return true;
}  


//이메일
function checkEmail(val) {
	var str = alltrim(eval(val+".value"));
	if (str.length == 0) { return false; }

	if (beAllowStr(str, "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@.-_") == false) { return false; }

	var atCnt = 0;
	var dotCnt = 0;
	for (i = 0; i < str.length ; i++)  { 
		ch = str.charAt(i);
		if (ch == "@") { atCnt++; }
		if (ch == ".") { dotCnt++; }
	}

	if (atCnt != 1 || dotCnt < 1) { return false; }

	var atIndex = 0;
	atIndex = str.indexOf("@");
	if (atIndex <= 0) { return false; }

	return true;
}


//전화
function checkPhone(val1, val2, val3) {
	var pval1 = alltrim(eval(val1+".value"));
	var pval2 = alltrim(eval(val2+".value"));
	var pval3 = alltrim(eval(val3+".value"));
 
	if (pval1.length == 0)		 { return false; }

	if (beNumStr(pval1) == false)	 { return false; }

	//if (pval1.charAt(0) != "0")	 { return false; }

	if (pval1.length < 2)		 { return false; }

	if (pval2.length == 0)		 { return false; }

	if (beNumStr(pval2) == false)	 { return false; }

	if (pval2.length < 2)		 { return false; }

	if (pval2.length == 0)		 { return false; }
	
	if (beNumStr(pval3) == false)	 { return false; }

	if (pval3.length != 4)		 { return false; }

	return true;
}


//우편번호
function checkZip(val) {
	var zip_code = alltrim(eval(val+".value"));

	if (zip_code.length == 0) { return false; }

	if (beAllowStr(zip_code, "1234567890-") == false) { return false; }

	var si_do = zip_code.substring(0,3);
	var gubun = zip_code.substring(3,4);
	var dong = zip_code.substring(4,7);

	if (beAllowStr(si_do, "1234567890") == false) { return false; }	

	if (gubun != "-") { return false; }		

	if (beAllowStr(dong, "1234567890") == false) { return false; }	

	return true;
}


//주소
function checkAddr(val1,val2) {
	var addr1 = alltrim(eval(val1+".value"));
	var addr2 = alltrim(eval(val2+".value"));

	if (addr1.length == 0 || addr2.length == 0) { return false; }

	return true;
}


//사업자등록번호
function checkBizNum(val1, val2, val3) {
	var val1 = alltrim(eval(val1+".value"));
	var val2 = alltrim(eval(val2+".value"));
	var val3 = alltrim(eval(val3+".value"));
 
	if (val1.length == 0)		 { return false; }

	if (beNumStr(val1) == false)	 { return false; }

	if (val1.length != 3)		 { return false; }

	if (val2.length == 0)		 { return false; }

	if (beNumStr(val2) == false)	 { return false; }

	if (val2.length != 2)		 { return false; }

	if (val3.length == 0)		 { return false; }
	
	if (beNumStr(val3) == false)	 { return false; }

	if (val3.length != 4)		 { return false; }

	return true;
}


//우편번호검색
function FindZip(zip, addr) {
	val = "zip=" + zip + "&addr=" + addr;
	window.open("/zipcode/zipcode.asp?"+val, "", "resizable=yes,scrollbars=no,width=500,height=150");
}

//아이디중복체크
function CheckID() {
	val = document.form.userid.value;
	window.open("/member/checkid.asp?userid="+val,"NewWin","menubar=no,width=550,height=280");
}

//아이디/비번찾기
function SearchID() {
	window.open("/login/searchid.asp","NewWin","menubar=no,width=550,height=280");
}
-->