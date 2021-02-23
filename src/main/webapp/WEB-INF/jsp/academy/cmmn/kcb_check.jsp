<%@ page import="kcb.org.json.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<title>KCB 휴대폰 본인확인 서비스 샘플 2</title>
<head>
<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">

	$(function(){
		
		if('${succ}'){

			if('${authType}' == 'PHONE') {
				requestMobile();
			} else if ('${authType}' == 'IPIN') {
				requestIpin();
			} else if ('${authType}' == 'CARD') {
				requestCard();
			}
			
		}else{
			alert('" + ${RSLT_CD} + " : " + ${RSLT_MSG} + "'); self.close(); 
		}
	});

	
	// 핸드폰 본인인증
	function requestMobile(){
		
		document.mobileForm.action = '${popupUrl}';
		document.mobileForm.method = 'post';
		document.mobileForm.submit();
		
	}
	
	// 아이핀 본인인증
	function requestIpin() {
		
		document.ipinForm.action = '${popupUrl}';
		document.ipinForm.method = 'post';
		document.ipinForm.submit();
		
	}
	
	// 아이핀 본인인증
	function requestCard() {
		
		document.cardForm.action = '${popupUrl}';
		document.cardForm.method = 'post';
		document.cardForm.submit();
		
	}
</script>
</head>

<body>
	<form name="mobileForm">
		<input type="hidden" name="tc" value="kcb.oknm.online.safehscert.popup.cmd.P931_CertChoiceCmd"/>	<!-- 변경불가-->
		<input type="hidden" name="cp_cd" value="${CP_CD}">	<!-- 회원사코드 -->
		<input type="hidden" name="mdl_tkn" value="${MDL_TKN}">	<!-- 토큰 --> 
		<input type="hidden" name="target_id" value="">	
	</form>
	
	<form name="ipinForm">
		<input type="hidden" name="tc" value="kcb.tis.ti.cmd.LoginRPCert3Cmd"/>	<!-- 변경불가-->
		<input type="hidden" name="cpCd" value="${CP_CD}">	<!-- 회원사코드 -->
		<input type="hidden" name="mdlTkn" value="${MDL_TKN}">	<!-- 토큰 --> 
	</form>
	
	<form name="cardForm">
		<input type="hidden" name="cpCd" value="${CP_CD}">	<!-- 회원사코드 -->
		<input type="hidden" name="mdlTkn" value="${MDL_TKN}">	<!-- 토큰 --> 
	</form>
</body>



</html>

