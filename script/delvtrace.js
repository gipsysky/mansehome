function DelvTrace(delv_num,delv_comp) {
	if (delv_comp =="우체국택배") {
		window.open("http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1="+delv_num,"","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="CJ GLS"){
		window.open("http://www.cjgls.com/nels/tracking/info.asp?slipno="+delv_num,"","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="로젠택배"){
		window.open("http://www.ilogen.com/customer/reserve_03-1_ok.asp?f_slipno="+delv_num,"","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="KGB택배") {
		window.open ('http://www.kgbls.co.kr/tracing.asp?number='+delv_num,"trace1","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="아주택배"){	
		window.open("http://www.ajulogis.co.kr/common/asp/search_history_proc.asp?gubun=1&sheetno="+delv_num,"","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="CJ대한통운"){	
		window.open("https://www.doortodoor.co.kr/parcel/doortodoor.do?fsp_action=PARC_ACT_002&fsp_cmd=retrieveInvNoACT&invc_no="+delv_num,"tracking","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="HTH"){	
		window.open("https://cjhth.com/homepage/searchTraceGoods/SearchTraceDtdShtno.jhtml?dtdShtno="+delv_num,"tracking","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="엘로우캡"){		
		window.open("https://www.kgyellowcap.co.kr/delivery/slipno.php?slipno="+delv_num,"tracking","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="현대택배"){	
		window.open("http://www.hydex.net/ehydex/jsp/home/distribution/tracking/trackingViewCus.jsp?sflag=01&InvNo="+delv_num,"tracking","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="한진택배"){	
		window.open("http://www.hanjinexpress.hanjin.net/customer/plsql/hddcw07.result?wbl_num="+delv_num,"tracking","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="경동택배"){	
		window.open("http://www.kdexp.com/sub4_1.asp?yy=&mm=&stype=1&p_item="+delv_num,"tracking","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="대신택배"){	
		window.open("https://www.ds3211.co.kr/freight/internationalFreightSearch.ht?billno="+delv_num,"tracking","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
	if (delv_comp =="KG로지스택배"){	
		window.open("http://www.kglogis.co.kr/delivery/delivery_result.jsp?item_no="+delv_num,"tracking","top=10,left=20,menubar=no,width=800,height=600,scrollbars=yes,statusbars=no,resizable=yes");
	}
}
