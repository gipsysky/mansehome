<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
        <h1 class="h2">노출 및 순서 관리 <span>${cnfVO.tbl_name } </h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <!-- <div class="btn-group me-2 px-2">
            <button type="button" class="btn btn-sm btn-primary" onClick="$('#modCnfPop').modal();">수정</button>
          </div> --> 
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary" onClick="javascript:document.location.href='../list';">목록</button>
          </div> 
        </div>
      </div>
 
      
      <div class="row"> 
	      <div class="col-md-2 p-3"> 
    	  		<h4>사용자 목록</h4>   
				<div id="web_list" class="input-group mb-3 sortable_web_list"></div>  
	      </div> 
	      <div class="col-md-2 p-3"> 
    	  		<h4>사용자 내용</h4>   
				<div id="web_detail" class="input-group mb-3 sortable_web_detail"></div>  
	      </div> 
	      <div class="col-md-2 p-3"> 
    	  		<h4>사용자 작성</h4>   
				<div id="web_write" class="input-group mb-3 sortable_web_write"></div>  
	      </div> 
	      <div class="col-md-2 p-3"> 
    	  		<h4>관리자 목록</h4>   
				<div id="admin_list" class="input-group mb-3 sortable_admin_list"></div>  
	      </div> 
	      <div class="col-md-2 p-3"> 
    	  		<h4>관리자 내용</h4>   
				<div id="admin_detail" class="input-group mb-3 sortable_admin_detail"></div>  
	      </div>   
	      <div class="col-md-2 p-3"> 
    	  		<h4>관리자 작성</h4>   
				<div id="admin_write" class="input-group mb-3 sortable_admin_write"></div>  
	      </div>   
	  </div>

<script>
$(function(){
	getList("web", "list");
	getList("web", "detail"); 
	getList("web", "write"); 
	getList("admin", "list"); 
	getList("admin", "detail"); 
	getList("admin", "write"); 
}); 

function getList(gubun, job){ 
	var url = "../view/getShowAjax?idTbl_cnf=${cnfVO.idTbl_cnf}&gubun="+gubun+"&job="+job;
	$.get(url , function(r){
		$("#"+gubun+"_"+job).html(r);
		$(".sortable_"+gubun+"_"+job).sortable({
			handle:"button",
			cancel:'',
			axis:'y',
			update : function(event, ui){
				var result = $(this).sortable('toArray');
				reOrder(result, gubun, job);
			}
		}).disableSelection();
	});
}

function reOrder(arr, gubun, job){
	$.get("../reOrderShow?idArr="+arr+"&fld="+gubun+"_"+job+"_ord", function(r){
		getList(gubun, job);
	}); 
}

</script>