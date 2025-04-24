<!--
function MakeFlashString(source,id,width,height,wmode, otherParam) {	
	return "<embed src="+source+" quality=high wmode="+wmode+" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash\" width="+width+" height="+height+"></embed>";
}

function MakeObjectString(classid, codebase, name, id, width,height, param) {
	return "<object classid="+classid+" codebase="+codebase+" name="+name+" width="+width+" height="+height+" id="+id+"><param name=wmode value="+wmode+" />"+param+"</object>";
}

// innerHTML Type
function SetInnerHTML(target, code) { 
	target.innerHTML = code; 
}

// Direct Write Type
function DocumentWrite(src) {
	document.write(src);
}

function ShowFlash(url, width, height){ 
document.write('<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="' + width + '" height="' + height + '" VIEWASTEXT>'); 
document.write('<param name="movie" value="' + url + '">'); 
document.write('<param name="quality" value="high">'); 
document.write('<param name="wmode" value="Transparent">'); 
document.write('<embed src="' + url + '" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="' + width + '" height="' + height + '"></embed>'); 
document.write('</object>');
} 

var xmlHttp;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}
//-->