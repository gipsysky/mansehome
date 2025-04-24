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

if(result == "operationOk"){

    alert("투입 처리되었습니다");
    document.location.href="/web/operation/qrSelect/${operationVO.idUser}";

}
else if(result == "endOk"){

    alert("완료 처리되었습니다");
    parent.location.reload();

}
else if(result == "operationExist"){

    if (confirm("완료되지 않은 작전이 있습니다. 기존의 종료되지 않은 작전을 완료처리하고 새로 투입하시겠습니까?")) {
        document.location.href="/web/operation/operationStart?idUser=${operationVO.idUser}&sType3=Y";
    }else{
        document.location.href="/web/operation/qrSelect/${operationVO.idUser}";
    }
}
else if(result == "none"){

}else {
	alert(result);
}
</script>

</body>
</html>