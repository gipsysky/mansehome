<!--
 
$(document).ready(function(){
    $(".checkToPrevInput").click(function(){
        $(this).prev().val(this.checked ? "Y" : "N");
    });
});

function InvalidRequest(){
	alert("잘못된 요청입니다");
	history.go(-1);
}

// 쿠키 생성 함수
function setCookie(cName, cValue, cDay){
	var expire = new Date();
	expire.setDate(expire.getDate() + cDay);
	cookies = cName + '=' + cValue + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
	if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
	document.cookie = cookies;
}

// 쿠키 가져오기 함수
function getCookie(cName) {
	cName = cName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue = '';
	if(start != -1){
		start += cName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cValue = cookieData.substring(start, end);
	}
	return cValue;
}
function formatNumber(str){ 
	str = stripNumber(str);
	str = ""+str+"";
	var retValue = "";
	for(i=0; i<str.length; i++){
		if(i > 0 && (i%3)==0) {
			retValue = str.charAt(str.length - i -1) + "," + retValue;
		}
		else {
			retValue = str.charAt(str.length - i -1) + retValue;
		}
	}
	return retValue;
}

function stripNumber(str){
	str = ""+str+"";
	str = str.replace(",","");
	str = str.replace(",","");
	str = str.replace(",","");
	str = str.replace(" ","");
	var retValue = "";
	retValue = str;
	return retValue;
}


function Num_add_commas(v)
{
	v.value=formatNumber(v.value);
}  
 
function LinkPage(str1){
	location.href = "/product/product_list.asp?code1="+str1;
}

function ProdLinkPage(str1, str2){
	location.href = "/web/product/product_list.asp?code1="+str1+"&code2="+str2;
}

function LinkProductView(pNo){
	location.href = "/web/item/product/detail?idProduct="+pNo;
}

function PopWin(url, w, h, sb) {
	var newWin;
	var setting = "width="+w+", height="+h+", top=5, left=20, scrollbars="+sb;
	newWin = window.open (url, "", setting);
	newWin.focus();
}

function ZoomImg(str){
	window.open("/product/zoom_image.asp?product_num="+str,"ZoomImg","width=650, height=680, top=50, left=50, scrollbars=no");
}

function adjustImageW(target_img, mmWid) {
	var newX, newY;
	var newHeight, newWidth;
	var newImg;
	var maxWidth = mmWid;

	newImg = new Image();
	newImg.src = target_img.src;
	imgw = newImg.width;
	imgh = newImg.height;

	if (imgw > maxWidth) {
		newWidth = maxWidth;

		target_img.onload = null;
		target_img.src = newImg.src;
		target_img.width = newWidth;
	} else {
		newWidth = imgw;
		newHeight = imgh;

		target_img.onload = null;
		target_img.src = newImg.src;
		target_img.width = newWidth;
		target_img.height = newHeight;
	}
}

function bookmark(){
	window.external.AddFavorite('http://www.tutto.co.kr', ':: 뚜또 쇼핑몰 ::')
}

function AddToFavorites(obj, url, title){ 
	if(document.all){ 
        window.external.AddFavorite(url, title); 
	// Mozilla Firefox Bookmark 
	} else if(window.sidebar){ 
		window.sidebar.addPanel(title, url,""); 
	// Google Chrome
	} else if(window.chrome){ 
        alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
	// IE Favorite 
	} else if(window.external){ 
        window.external.AddFavorite(url, title); 
	//Opera Hotlist 
	} else if(window.opera && window.print){ 
        obj.setAttribute('href',url); 
        obj.setAttribute('title',title); 
        obj.setAttribute('rel','sidebar'); 
        obj.click(); 
	} 
} 

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}

function goFaceBook(msg, url, img, sum) {
	var href = "http://www.facebook.com/sharer.php?s=100&p[images][0]=" + encodeURIComponent(img) + "&p[url]=" + encodeURIComponent(url) + "&p[title]=" + encodeURIComponent(msg)+ "&p[summary]=" + encodeURIComponent(sum);
	var a = window.open(href, 'facebook', '');
	if (a) {
		a.focus();
	}
}

function goTwitter(msg, url) {
	var href = "http://twitter.com/home?status=" + encodeURIComponent(msg) + " " + encodeURIComponent(url);
	var a = window.open(href, 'twitter', '');
	if (a) {
		a.focus();
	}
}

//-->