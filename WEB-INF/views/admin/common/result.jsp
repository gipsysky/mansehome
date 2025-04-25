<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
  

<script>
var result = "${result}";

if(result == "NoAuth"){
	
	alert("권한이 없습니다"); 
	if(self == top) { history.go(-1); }

} else if(result == "NoAuthIp"){

    alert("허용되지 않는 IP입니다");
    top.location.href="/admin/member/logout";

} else if(result == "wrongCall"){

    top.location.href="/";

} else if (result=="-1"){
	
	alert("잘못된 요청입니다");
	if(self == top) { history.go(-1); }
	
}else {
	alert(result);
}
</script>  