<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

<script>
var result = "${result}";

if(result == "writeOk"){
	
	alert("등록되었습니다");
	parent.goForm.action="./list";
	parent.goForm.submit();
	
} else if (result == "modifyOk"){
	
	alert("수정되었습니다");
	parent.goForm.action="./view";
	parent.goForm.submit();

} else if (result == "delOk"){
	
	alert("삭제되었습니다");
	parent.goForm.action="./list";
	parent.goForm.target="_self";
	parent.goForm.submit();

} else if (result == "authOk"){
	
	alert("수정되었습니다");
	parent.location.reload();

} else if (result == "noAuth"){
	
	alert("권한이 없습니다");
	history.go(-1);
 
} else if (result == "duplGroup_code"){
	
	alert("그룹코드가 중복되었습니다"); 
	
}else if (result=="-1"){
	
	alert("오류가 발생했습니다");
	
}else {
	alert(result);
}
</script>

</body>
</html>