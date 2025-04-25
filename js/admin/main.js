/* global $ */


function sessionCheck(){ 
	var _CONTEXT_PATH = "/admin/";
	var sessionOk = true; 
	$.ajax({
		url : _CONTEXT_PATH + 'sessionCheck.json',
		data : JSON.stringify({}),
		type : 'post', 
		dataType : 'json',
		async : false,
		contentType : "application/json ; charset=UTF-8"
		})
		.done(function(res){  
			if (res.successYN != "Y"){  
				alert("로그인해주십시오");
				sessionOk = false;
			}
		})
		.fail(function(request, error){
			console.log("fail");
			console.log("status : " + request.status);
			console.log("message : " + request.responseText);
			console.log("error : " + error);
			
			sessionOk = false;
		});
	return sessionOk;
}

function getAjax(url){
	if (!sessionCheck()) return "";
	$("#loading").show();
	
	var result = "";
	$.ajax({
		url : url,
		type : 'get', 
		async : false,
		})
		.done(function(res){  
			result = res;
			$("#loading").hide();
		})
		.fail(function(request, error){
			console.log("fail");
			console.log("request url : " + url);
			console.log("status : " + request.status);
			console.log("message : " + request.responseText);
			console.log("error : " + error);
			$("#loading").hide();			
		});
	return result;
} 

