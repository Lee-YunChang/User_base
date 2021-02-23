<%
/****************************************
	subject	: [공통] 상단영역
	summary	: 상단영역
	author	: SANGS
	date	: 2016-05-01
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.sangs.session.UserSessionManager" %>
<%@ page import = "com.sangs.session.UserSessionVO" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>온라인 학습 강의실</title>
</head>
<link rel="stylesheet" href="/academy/common/css/common.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/main.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/main_style.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/sub.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/mobile.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/jquery-ui.min.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<!-- <link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/> 
<link rel="stylesheet" href="/academy/common/css/jquery-ui-1.9.0.custom.css"> -->
<script type="text/javascript" src="/academy/common/js/jquery.min.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />" ></script>
<script type="text/javascript" src="/academy/common/js/jquery-ui.min.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/jquery.bxslider.min.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/jquery.jqtransform.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />" ></script>
<script type="text/javascript" src="/academy/common/js/keysecurity.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />" ></script>
<script type="text/javascript" src="/classdesk/common/js/jquery.countdown.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/common.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/main.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<!--[if lte IE 9]>
<link rel="stylesheet" href="/academy/common/css/common_ie9.css">
<![endif]-->
<!--[if lt IE 9]>
<script type="text/javascript" src="/academy/common/plugins/html5shiv.min.js"></script>
<script type="text/javascript" src="/academy/common/plugins/respond.min.js"></script>
<![endif]-->

<script type="text/javascript" src="/academy/common/js/jquery.alphanumeric.pack.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/jquery.showLoading.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/lodash/lodash.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/jquery.cookie.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script> <!-- 메인 팝업 쿠키 --> 
<script type="text/javascript" src="/academy/common/js/capsLockChk.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/academy.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/common/js/sangs_core.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/smarteditor/js/HuskyEZCreator.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />" charset="utf-8"></script>
<script type="text/javascript" src="/common/js/makePCookie.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<c:set var="isLoginAt"><c:out value="${REQUEST_DATA.SES_ISLOGIN}"/></c:set>
<c:set var="isUserNo"><c:out value="${REQUEST_DATA.SES_USERNO}"/></c:set>
<body>
<div class="header_wrap">
	<div class="header_title">
		<img src="/academy/images/header_logo.png" alt="상상스토리" />
		<p class="header_text">온라인 학습 강의실</p>
	</div>
</div>
<%
	String user_id = UserSessionManager.getUserSessionVO(request).getUserId();
	Cookie cookie = new Cookie("UID", user_id);
	cookie.setPath("/");
	response.addCookie(cookie);
%>
	
<script type="text/javascript">
	$(function(){
		$('#select_container').jqTransform();
	});
	
	function fnIsLoginChk() {
		var isLoginAt = '${isLoginAt}';
		var isUserNo = '${isUserNo}';
		
		var isChk = '1';
		if(isLoginAt == 'N' || isUserNo < 1) {
			isChk = '0';
		}
		return isChk;
	}
</script>
<div id="skipnav"><a href="#sContents" title="본문내용 바로가기">본문내용 바로가기</a></div>
	