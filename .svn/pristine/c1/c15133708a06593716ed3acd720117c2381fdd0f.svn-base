<%@ page import="kcb.org.json.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<title>KCB 휴대폰 본인확인 서비스 샘플 2</title>
<head>
<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" >
	
	$(document).ready(function() {

		var authType = '${authType}';		
		var result = '${RSLT_CD}';
		
		// 핸드폰 본인인증
		if(authType == 'PHONE') {
			
			if ('B000' == result) {
				alert('본인인증성공하였습니다.'); 
				fncOpenerSubmit();
			} 
			
		// 아이핀	
		} else if(authType == 'IPIN') {
			
			if('T000' == result) {
				alert('본인인증성공하였습니다.'); 
				fncOpenerSubmit();
			} 
			
		} else if(authType == 'CARD') {
			
			if('T000' == result) {
				alert('본인인증성공하였습니다.');
				fncOpenerSubmit();
			}
			
		} else {
			alert('본인인증 실패시 관리자에게 문의바랍니다. 문의 전화번호 : 1600-4931');
			self.close();
			return false;
		}	
	})
	


	function fncOpenerSubmit() {
		
		var telNo =  '${TEL_NO}';
		
		opener.document.frm.mbernm.value = '${RSLT_NAME}';
		opener.document.frm.brthdy.value = '${RSLT_BIRTHDAY}';
		opener.document.frm.sex.value = '${RSLT_SEX_CD}';
		opener.document.frm.di.value = '${DI}';
		
		if(telNo.length == 11) {
			opener.document.frm.moblphon1.value = telNo.substr(0, 3);
			opener.document.frm.moblphon2.value = telNo.substr(3, 4);
			opener.document.frm.moblphon3.value = telNo.substr(7, 4);
		} else {
			opener.document.frm.moblphon1.value = telNo.substr(0, 3);
			opener.document.frm.moblphon2.value = telNo.substr(3, 3);
			opener.document.frm.moblphon3.value = telNo.substr(6, 4);
		}
// 		opener.document.frm.moblphon.value = '${TEL_NO}';
		opener.authType('${authType}', '${RSLT_CD}');
		self.close();
		
	}	
</script>
</head>
<body>
</body>
</html>