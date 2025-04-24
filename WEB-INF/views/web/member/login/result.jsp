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
	
	//alert("환영합니다! ${login_msg}");
	
	<c:choose>
		<c:when test="${redirectUri eq null || redirectUri eq ''}">
			top.location.href="/";
		</c:when>
		<c:otherwise>
 			top.location.href="${redirectUri}";
		</c:otherwise>
	</c:choose>

} else if(result == "guestLoginOk"){

	<c:choose>
		<c:when test="${redirectUri eq null || redirectUri eq ''}">
			top.location.href="/";
		</c:when>
		<c:otherwise>
 			top.location.href="${redirectUri}";
		</c:otherwise>
	</c:choose>

} else if(result == "snsLogin_join"){

    top.location.href="/web/member/user/join?sns_id=${sns_id}&sns_login_type=${sns_login_type}";

} else if (result=="loginCompleted"){

    top.location.href="/";

} else if (result=="logout"){

    top.location.href="/";

}else if (result=="encryptionTimeOut"){
    alert("페이지를 열어놓은 상태로 시간이 경과되어 새로고침합니다.")
    top.location.reload();

} else if (result=="-1"){
	
	alert("오류가 발생했습니다");
	
}else {
	alert(result); 
}
</script>

</body>
</html>