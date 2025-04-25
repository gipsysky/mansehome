<!--
function onlyNumber() {
	if((event.keyCode < 48) || (event.keyCode > 57))
	event.returnValue=false;
}

function ltrim(str) {
	var i;
	var ch;
	var retStr = '';
	if (str.length == 0)
		return str;
	for (i=0;i<str.length;i++) {
		ch = str.charAt(i);
		if (retStr.length == 0 && (ch == ' ' || ch == '\r' || ch == '\n')) 
			continue;
		retStr += ch;
	}
	return retStr;
}

function rtrim(str) {
	var i;
	var ch;
	var retStr = '';
	if (str.length == 0)
		return str;
	for (i=str.length-1;i>=0;i--) {
		ch = str.charAt(i);
		if (ch != ' ' && ch != '\r' && ch != '\n') {
			break;
		}
	}
	retStr = str.substring(0, i+1);
	return retStr;
}

function trim(str) {
	var retStr;
	retStr = ltrim(str);
	retStr = rtrim(retStr);
	return retStr;
}

function alltrim(str) {
	var i;
	var ch;
	var retStr = '';
	var retStr1 = '';
	if (str.length == 0)
		return str;
	for (i=0;i<str.length;i++) {
		ch = str.charAt(i);
		if (ch == ' ' || ch == '\r' || ch == '\n') 
			continue;
		retStr += ch;
	}
	return retStr;
}

function beNum(ch) {
	return (ch >= '0' && ch <= '9');
}

function beNumStr(str) {
	var i;
	var ch;
	for (i=0;i<str.length;i++) {
		ch = str.charAt(i);
		if (beNum(ch) == false) {
			return false;
		}
	}
	return true;
}

function beAlphaNum(ch) {
	return ((ch >= 'a' && ch <= 'z') ||  (ch >= 'A' && ch <= 'Z') || (ch >= '0' && ch <= '9'));
}

function beAlphaNumStr(str) {
	var i;
	var ch;
	for (i=0;i<str.length;i++) {
		ch = str.charAt(i);
		if (beAlphaNum(ch) == false) {
			return false;
		}
	}
	return true;
}

function beAllowStr(str, allowStr) {
	var i;
	var ch;
	for (i=0;i<str.length;i++) {
		ch = str.charAt(i);
		if (allowStr.indexOf(ch) < 0) {
			return false;
		}
	}
	return true;
}

function strCharByte(chStr) {
	if (chStr.substring(0, 2) == '%u') {
		 if (chStr.substring(2,4) == '00')
			return 1;
		else
			return 2;
	}
	else if (chStr.substring(0,1) == '%') {
		if (parseInt(chStr.substring(1,3), 16) > 127)
			return 2;
		else
			return 1;
	}
	else
		return 1;
}

function strLengthByte(str)  {
	var totLength = 0;
	for (var i=0;i<str.length;i++)
		totLength += strCharByte(escape(str.charAt(i)));
	return totLength;
}
	
function beHangul(chStr) {
	if (strCharByte(chStr) == 2)
		return true;
	else
		return false;
}

function beAllHangulStr(str) {
	var i;
	var ch;
	for (i=0;i<str.length;i++) {
		ch = escape(str.charAt(i));
		if (beHangul(ch) == false) {
			return false;
		}
	}
	return true;
}
function checkDate(v_year,v_month,v_day ){

	var err=0
	if ( v_year.length != 4) err=1
	if ( v_month.length != 1 &&  v_month.length !=  2 ) err=1
	if ( v_day.length != 1  &&  v_day.length !=  2) err=1


	r_year = eval(v_year) ; 
	r_month = eval(v_month); 
	r_day = eval(v_day)  ; 

	if (r_month<1 || r_month>12) err = 1
	if (r_day<1 || r_day>31) err = 1
	if (r_year<0 ) err = 1


	if (r_month==4 || r_month==6 || r_month==9 || r_month==11){
		if (r_day==31) err=1
	}

	// 2,윤년체크
	if (r_month==2){
		var g=parseInt(r_year/4)

		if (isNaN(g)) {
			err=1
		}
		if (r_day>29) err=1
		if (r_day==29 && ((r_year/4)!=parseInt(r_year/4))) err=1
	}

	if (err==1){
		return false
	}else{
	               return true;

	}
}

function cal_byte(aquery) {
	var tmpStr;
	var temp=0;
	var onechar;
	var tcount;
	tcount = 0;
	 
	tmpStr = new String(aquery);
	temp = tmpStr.length;

	for (k=0; k<temp; k++) {
		onechar = tmpStr.charAt(k);

		if (escape(onechar).length > 4) {
			tcount += 2;
		}
		else if (onechar!='\r') {
			tcount++;
		}
	}
	if(tcount > 300) { return false; }
	else { return true; }
}
-->