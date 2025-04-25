<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
        <h1 class="h2">사용자 리스트 노출/순서 설정 <span>${cnfVO.tbl_name } </span></h1>
        <div class="btn-toolbar mb-2 mb-md-0"> 
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary" onClick="javascript:document.location.href='../list';">목록</button>
          </div> 
        </div>
      </div>
      
    
    <div class="row"> 
     <div class="col-md-12 p-3"> 
        <h4>노출 항목</h4>  
 
      	<div id="area1" class="sortable droppable1"></div>

		<div class="mt-5"> 
  	  		<h4>미노출 항목</h4>  
			<div class="droppable2 mt-3 rounded" style="border: dotted 5px #aaa; padding-top:20px; height:300px; background-color:#EEE;" >
				<div id="area2" class="px-3"></div>
			</div>  
		</div>  
	 </div>
	</div>
 
		
<script>  
$(function(){
	getList();
}); 

function getList(){ 
	var url = "../view/fldWebShowAjax?idTbl_cnf=${cnfVO.idTbl_cnf}&web_show_fg=Y"; 
	$.get(url , function(r){
		$("#area1").html(r);
		$(".sortable").sortable({
			handle:"button",
			cancel:'',
			axis:'x', 
			update : function(event, ui){
				var result = $(this).sortable('toArray');
				reOrder(result);
			}
		}).disableSelection();  
	});

	var url = "../view/fldWebShowAjax?idTbl_cnf=${cnfVO.idTbl_cnf}&web_show_fg=N"; 
	$.get(url , function(r){
		$("#area2").html(r);
		$(".droppable2 ").droppable ({
			drop:function(event, ui){
				var idTblCnf = ui.draggable.attr("data-idTblCnf");
				toggleShowFg(idTblCnf);
			}
		});
	});
}

function toggleShowFg(v){
	window.open("../fldWebShowHide?idTbl_cnf_fld=" + v, "HiddenFrame");	 
}

function reOrder(arr){ 
	window.open("../reOrderWebList?idArr="+arr+"&idTbl_cnf=${cnfVO.idTbl_cnf}", "HiddenFrame");  
}
</script>       
   
  