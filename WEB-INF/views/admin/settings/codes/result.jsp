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

} else if (result == "duplCode"){
	
	alert("같은 카테고리에 동일한 이름을 사용할 수 없습니다"); 

} else if (result == "reOrderOk"){
	
	alert("순서가 적용되었습니다");
	parent.location.reload();
	
}else if (result=="-1"){
	
	alert("오류가 발생했습니다");
	
}else {
	alert(result);
}
</script>

</body>
</html>