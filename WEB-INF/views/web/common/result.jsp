<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body> 



<script>
var result = "${result}";

if(result == "noAuth"){
	
	alert("권한이 없습니다.");
	history.go(-1);
	
} else if (result == "isSecret") {

    alert("비밀글입니다");
    history.go(-1);

} else if(result == "illegalFile"){

    alert("업로드한 파일이 허용된 파일확장자가 아닙니다.");

} else if(result == "illegalFileReloadBut"){

    alert("업로드한 파일이 허용된 파일확장자가 아닙니다.");

	parent.$(".okBut").show();
	parent.$(".noBut").hide();

} else if(result == "wrongCaptcha"){

    alert("보안문자가 일치하지 않습니다.");

	parent.$(".okBut").show();
	parent.$(".noBut").hide();
 
} else if(result == "writeOk"){
	
	alert("등록되었습니다");
	parent.goForm.action="/web/board/data/list";
	parent.goForm.submit();
	
} else if (result == "replyOk"){

	alert("등록되었습니다");
	parent.goForm.action="/web/board/data/list";
	parent.goForm.submit();

} else if (result == "editOk"){
	
	alert("수정되었습니다");
	parent.goForm.action="./view";
	parent.goForm.submit();

} else if (result == "writeCommentOk"){
	
	alert("입력되었습니다");
	parent.comment_list(1);

} else if (result == "editCommentOk"){
	
	alert("수정되었습니다");
	parent.comment_list(parent.commentGoForm.page.value);

} else if (result == "delCommentOk"){
	 
	parent.comment_list(parent.commentGoForm.page.value);

} else if (result == "replyCommentOk"){
	
	alert("입력되었습니다");
	parent.comment_list(parent.commentGoForm.page.value);

} else if (result == "delOk"){
	 
	parent.goForm.action="./list";
	parent.goForm.target="_self";
	parent.goForm.submit();

} else if (result == "duplCode"){
	
	alert("같은 카테고리에 동일한 이름을 사용할 수 없습니다"); 

} else if (result == "wrong_password"){
	
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);

} else if (result == "deleted") {

    alert("삭제된 게시물입니다");
    history.go(-1);

} else if (result == "noLogin_alertOnly") {

    alert("로그인해주세요");

} else if (result == "noLogin_reload") {

    alert("로그인해주세요");
    top.location.reload();

} else if (result == "noLogin_redirect") {

    alert("로그인해주세요");
    top.location.href="/web/member/login?referer=/web/sale/order/orderForm?dFlag=C";

} else if(result == "returnFunction"){
 
	<c:if test="${returnFunction ne null}">
		parent.${returnFunction};
	</c:if>

}else if (result=="noBoardCnf"){

	alert("잘못된 호출입니다");
	history.go(-1);

	 
}else if (result=="-1"){

    alert("잘못된 요청입니다");
	
}else {
	alert(result);
}
</script>

</body>
</html>