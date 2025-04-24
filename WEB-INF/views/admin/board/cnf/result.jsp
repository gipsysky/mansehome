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

if(result == "addFldOk"){

	alert("등록되었습니다"); 
	parent.closeModal();
	parent.getList();
	
} else if (result == "modFldCnfOk"){
	
	alert("수정되었습니다"); 
	parent.closeModal();
	parent.getList();

} else if (result == "delFldOk"){
	
	alert("삭제되었습니다"); 
	parent.closeModal();
	parent.getList();
 
} else if (result == "duplCode"){
	
	alert("같은 카테고리에 동일한 이름을 사용할 수 없습니다"); 

}else if (result == "addCnfOk"){
	
	alert("추가되었습니다");
	parent.location.href="list";

}else if (result == "duplicateOk"){
	
	alert("복사되었습니다");
	parent.location.href="/admin/board/cnf/view/fldCnf?idTbl_cnf=${idTbl_cnf}";

}else if (result == "modCnfOk"){
	
	alert("수정되었습니다");
	parent.location.reload();

}else if (result == "delCnfOk"){
	
	alert("삭제되었습니다");
	parent.location.href='list';

}else if (result == "reOrderFldOk"){
	
	parent.getList();

}else if (result == "reOrderListOk"){
	
	parent.getForm();
	
}else if (result == "fldShowHideOk"){
	
	parent.getList();

}else if (result == "showToggleOk" || result == "reOrderShowOk"){ 
	
}else if (result=="-1"){
	
	alert("오류가 발생했습니다");
	
}else {
	alert(result);
}
</script>

</body>
</html>