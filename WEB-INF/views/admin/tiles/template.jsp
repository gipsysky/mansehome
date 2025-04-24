<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" ></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<link rel="icon" href="data:,">
	    
	<script type="text/javascript" src="/script/common.js"></script>
	<script type="text/javascript" src="/js/admin/main.js"></script>
	<script type="text/javascript" src="/js/smartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>
	<link rel="stylesheet" href="/css/fontawesome/css/all.css">
	<link rel="stylesheet" href="/css/admin/admin.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Shopping Mall</title> 
	    
	<script>
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		showMonthAfterYear: true,
		yearSuffix: '년' ,
	    beforeShow: function() {
	        setTimeout(function(){
	            $('.ui-datepicker').css('z-index', 99999999999999);
	        }, 0);
	    }
	});
	
	$( function() { 
		$('.datepicker').datepicker({
			dateFormat: "yy-mm-dd" 
		}) ;  
	} ); 
	</script>
	    
</head>
    
<body>

    <tiles:insertAttribute name="header" />
    <tiles:insertAttribute name="left" />  
	    
	<div id="loading" style="display:none;"><img src="/img/loader2.gif"/></div>
	    
	<div class="container-md">
	  <div class="row"> 
		<main class="p-5 ms-sm-auto px-md-4 col-md-10 mx-auto">   
		<tiles:insertAttribute name="body" />
		</main>
		</div>
	</div>
	
    <tiles:insertAttribute name="footer" />

</body>
</html>