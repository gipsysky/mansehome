<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

<script>
var result = "${result}";

if(result == "loginOk"){

	<c:if test="${redirectUri eq null}">
	top.location.href="/admin/";
	</c:if>

	<c:if test="${redirectUri ne null}">
	top.location.href="${redirectUri}";
	</c:if>

}else if (result=="authenticationFail"){
    alert("입력하신 로그인 정보에 일치하는 회원이 없습니다.");
    top.location.reload();

}else if (result=="encryptionTimeOut"){
    alert("페이지를 열어놓은 상태로 시간이 경과되어 새로고침합니다.")
    top.location.reload();

} else if (result=="loginCompleted"){

    top.location.href="/admin/";

} else if (result=="adminLogOut"){

    top.location.href="/admin/";

} else if (result=="-1"){

    alert("오류가 발생했습니다");

}else {
	alert(result);
}
</script>

</body>
</html>