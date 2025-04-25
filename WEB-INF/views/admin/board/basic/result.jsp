<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
	
} else if(result == "replyOk"){
	
	alert("등록되었습니다");
	parent.goForm.action="./list";
	parent.goForm.submit();

} else if (result == "updateOk"){

    alert("수정되었습니다");
    parent.goForm.action="./view";
    parent.goForm.submit();

} else if (result == "delAttachOk"){

    alert("삭제되었습니다");
    parent.goForm.action="./view";
    parent.goForm.submit();

} else if (result == "delOk"){
	
	alert("삭제되었습니다");
	parent.goForm.action="./list";
	parent.goForm.target="_self";
	parent.goForm.submit();

} else if (result == "duplCode"){
	
	alert("같은 카테고리에 동일한 이름을 사용할 수 없습니다"); 

} else if (result == "wrong_password"){
	
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);

} else if(result == "returnFunction"){

	alert("등록되었습니다");
	<c:if test="${returnFunction ne null}">
		parent.${returnFunction};
	</c:if>
	
} else if (result == "noAuth"){
	
	alert("권한이 없습니다"); 
	history.go(-1);
	
}else if (result=="-1"){
	
	alert("오류가 발생했습니다");
	
}else {
	alert(result);
}
</script>

</body>
</html>