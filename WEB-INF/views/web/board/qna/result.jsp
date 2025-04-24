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

    if (result=="-1") {

        alert("오류가 발생했습니다");

    }else if (result=="noAuth"){

        alert("권한이 없습니다");
        history.go(-1);

    }else if (result=="wrong_password"){

        alert("잘못된 비밀번호입니다");
        history.go(-1);

    }else if (result=="delOk"){

        alert("삭제되었습니다");
        parent.list();

    }else if (result=="writeOk"){

        alert("등록되었습니다");
        parent.goForm.action="./list";
        parent.goForm.submit();

    }else {
        alert(result);
    }
</script>

</body>
</html>