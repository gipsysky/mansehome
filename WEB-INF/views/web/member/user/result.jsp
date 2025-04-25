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

if(result == "noAuth"){
	
	alert("권한이 없습니다.");
	history.go(-1);

} else if (result == "modifyOk"){

    alert("수정되었습니다");
    parent.location.reload();

} else if (result == "writeOk"){

    alert("가입이 완료되었습니다");
    parent.location.href="/web/member/login?return_url=/";

} else if (result == "duplId"){

    alert("이미 사용중인 아이디입니다");

} else if (result == "duplHp"){

    alert("이미 사용중인 휴대폰입니다");
	 
} else if (result == "secessionOk"){
	
	alert("회원탈퇴 되었습니다. 이용에 감사드립니다.");
	top.location.href="/web/member/logout";
	 
} else if (result == "wrongPassword"){
	
	alert("비밀번호가 맞지 않습니다.");
  
}else if (result=="-1"){
	
	alert("오류가 발생했습니다");
	
}else {
	alert(result);
}
</script>

</body>
</html>