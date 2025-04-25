<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 ">
        <h1 class="h2">항목관리 <span>${cnfVO.tbl_name } </h1>
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
	      <div class="col-md-3 p-3"> 
    	  		<h4>예시 항목</h4>    
				
				<div id="area1" class="input-group mb-3 sortable">
				
					<div class="input-group mb-3 rounded catWrap1">
					  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="짧은내용"> 					  
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button" onClick="add('txt_s')"><i class="fas fa-arrow-right"></i></button>
					  </div>
					</div> 	
					<div class="input-group mb-3 rounded catWrap1">
					  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="긴내용"> 					  
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button" onClick="add('txt_l')"><i class="fas fa-arrow-right"></i></button>
					  </div>
					</div> 	
					<div class="input-group mb-3 rounded catWrap1">
					  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="체크박스"> 					  
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button" onClick="add('checkbox')"><i class="fas fa-arrow-right"></i></button>
					  </div>
					</div> 	
					<div class="input-group mb-3 rounded catWrap1">
					  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="라디오박스"> 					  
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button" onClick="add('radio')"><i class="fas fa-arrow-right"></i></button>
					  </div>
					</div> 	
					<div class="input-group mb-3 rounded catWrap1">
					  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="드롭다운"> 					  
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button" onClick="add('dropdown')"><i class="fas fa-arrow-right"></i></button>
					  </div>
					</div> 	
					<div class="input-group mb-3 rounded catWrap1">
					  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="첨부이미지"> 					  
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button" onClick="add('image')"><i class="fas fa-arrow-right"></i></button>
					  </div>
					</div> 	
					<div class="input-group mb-3 rounded catWrap1">
					  <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="첨부파일"> 					  
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button" onClick="add('file')"><i class="fas fa-arrow-right"></i></button>
					  </div>
					</div>
                    <div class="input-group mb-3 rounded catWrap1">
                        <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="날짜">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" onClick="add('date')"><i class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    <div class="input-group mb-3 rounded catWrap1">
                        <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="시작일">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" onClick="add('sdate')"><i class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>
                    <div class="input-group mb-3 rounded catWrap1">
                        <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="종료일">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" onClick="add('edate')"><i class="fas fa-arrow-right"></i></button>
                        </div>
                    </div>

                    <!-- 추가 특성이 필요시 아래를 속성명과 속성을 변경 후 추가하면 된다.
                                        <div class="input-group mb-3 rounded catWrap1">
                                          <input name="menu_name" type="text" class="menu_name form-control border border-secondary" readonly value="속성명">
                                          <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button" onClick="add('속성')"><i class="fas fa-arrow-right"></i></button>
                                          </div>
                                        </div>
                     -->
				</div>  
	      </div> 
	      
	      <div class="col-md-3 p-3"> 
    	  		<h4>선택 항목</h4>  
				
				<div id="area2" class="input-group mb-3 sortable"></div>  
	      </div>   
	      <div class="col-md-6 p-3"> 
    	  		<h4>입력화면 보기</h4>  
				<div class="rounded border-warning" style="border: dotted 3px black; padding-top:20px" >
					<div id="area3" class="input-group mb-6"></div>
				</div>  
	      </div>   
      </div> 

<!-- 게시판 수정 팝업 -->
<div class="modal fade" id="modCnfPop" tabindex="-1" role="dialog" aria-labelledby="modPopLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form method="post" name="modCnfForm" id="modCnfForm">      
		<input type="hidden" name="idTbl_cnf" value="${cnfVO.idTbl_cnf }"> 
      <div class="modal-header">
        <h5 class="modal-title" id="modPopLabel">게시판 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body" id="detail"> 
			<div class="container">
				<div class="row mb-3">
					<div class="col-sm-4">게시판명</div>
					<div class="col-sm-8">
					  <input type="text" name="tbl_name" class="form-control" value="${cnfVO.tbl_name }"> 
					</div> 
				</div> 
			</div>      
			<div class="container">
				<div class="row mb-3">
					<div class="col-sm-4">게시판스킨</div>
					<div class="col-sm-8">
					  <input type="text" name="tbl_skin" class="form-control" value="basic" readonly> 
					</div> 
				</div> 
			</div>      
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onClick="javascript:modCnf();">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-danger" onClick="javascript:delCnf();">삭제</button>
      </div> 
    </div>
      </form>
  </div>
</div>

<!-- 필드 수정 팝업 -->
<div class="modal fade" id="modPop" tabindex="-1" role="dialog" aria-labelledby="modPopLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <form method="post" name="modiForm" id="modiForm">      
		<input type="hidden" name="idTbl_cnf_fld" value="">
		<input type="hidden" name="job" value="">
      <div class="modal-header">
        <h5 class="modal-title" id="modPopLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div> 
      <div class="modal-body" id="detail"></div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onClick="javascript:modCnfFld();">저장</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-danger" onClick="javascript:delCnfFld();">삭제</button>
      </div> 
    </div>
      </form>
  </div>
</div>

<script>
$('#modPop').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget); // Button that triggered the modal
  var idTbl_cnf_fld = button.data('v1');  
  var fld_type = button.data('v2');  
  var modal = $(this);
  modal.find('.modal-title').text('수정하기');
  
  $.get("getFldCnfAjax?idTbl_cnf_fld=" + idTbl_cnf_fld + "&fld_type=" + fld_type, function(r){ 
	  document.modiForm.idTbl_cnf_fld.value = idTbl_cnf_fld;
	  modal.find('.modal-body').html(r); 
  });
})

$(function(){
	getList();
	getForm();
}); 

function add(type){ 
	window.open("../addFldOk?fld_type="+type+"&idTbl_cnf=${cnfVO.idTbl_cnf}", "HiddenFrame");
}

function getList(){ 
	var url = "getFldAjax?idTbl_cnf=${cnfVO.idTbl_cnf}"; 
	$.get(url , function(r){
		$("#area2").html(r);
		$(".sortable").sortable({
			handle:"button",
			cancel:'',
			axis:'y',
			update : function(event, ui){
				var result = $(this).sortable('toArray');
				reOrder(result);
			}
		}).disableSelection();
	});
}

function getForm(){ 
	var url = "../../data/view/writeFormAjax?idTbl_cnf=${cnfVO.idTbl_cnf}";
	$.get(url , function(r){ 
		$("#area3").html(r);
	});
}

function modCnfFld(){
	var f = document.modiForm;
	f.action="../modFldCnf";
	f.job.value="mod";
	f.target="HiddenFrame";
	f.submit(); 
}

function delCnfFld(){
	var f = document.modiForm;
	console.log(f.fld_code.value);
	if (f.fld_code.value == "1"){
		alert("이 항목은 고정된 기본항목입니다. 삭제가 불가능합니다");
		return;
	}
	if (confirm("삭제하시겠습니까?\n\n이미 등록된 데이터도 함께 삭제됩니다")){
		f.action="../delFld";
		f.target="HiddenFrame";
		f.submit();
	} 
}

function modCnf(){
	var f = document.modCnfForm;
	f.action="../modCnf";
	f.target="HiddenFrame";
	f.submit(); 
}

function delCnf(){
	var f = document.modCnfForm;
	if (confirm("삭제하시겠습니까?\n\n이미 등록된 데이터도 함께 삭제됩니다")){
		f.action="../delCnf";
		f.target="HiddenFrame3";
		f.submit();
	} 
}

function reOrder(arr){
	var gubun="admin";
	var job = "write";
	$.get("../reOrderShow?idArr="+arr+"&fld="+gubun+"_"+job+"_ord", function(r){
		
	}); 
}

function closeModal(){
	$('.modal').modal('hide');
	getForm();
}
 

</script>        
  