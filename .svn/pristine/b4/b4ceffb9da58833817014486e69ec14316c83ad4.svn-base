<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
    subject	: 메인 >  팝업창 전용 팝업헤더
    summary	: 팝업 상단영역
    author	: 
    date	: 
****************************************/
%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상상스토리</title>
<!-- <link rel="stylesheet" href="/academy/common/css/common.css" type="text/css" /> -->
<script type="text/javascript" src="/academy/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery-ui.min.js"></script>

<script type="text/javascript" src="/academy/common/js/academy.js"></script><!-- 아카데미에서 추가됨 -->
<script type="text/javascript" src="/academy/common/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery.showLoading.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">

jQuery(document).ready(function() {
	//정규표현식
	$("#textArea").text(function(index, text){
	 return strip(text);
	});

	function strip(html) {
	   var tmp = document.createElement("div");
	   tmp.innerHTML = html;
	   return tmp.textContent||tmp.innerText;
	}
});

</script>

</head>
<body class="ad_popup" <c:if test="${empty rowData.POP_TEMPLATE || rowData.POP_TEMPLATE eq '0'}"></c:if>
    <c:if test="${rowData.POP_TEMPLATE eq '1'}">style="background: url('/academy/images/sitemngr/pop_bg_0.png') no-repeat;"</c:if>
    <c:if test="${rowData.POP_TEMPLATE eq '2'}">style="background: url('/academy/images/sitemngr/pop_bg_1.png') no-repeat;"</c:if>
    <c:if test="${rowData.POP_TEMPLATE eq '3'}">style="background: url('/academy/images/sitemngr/pop_bg_2.png') no-repeat;"</c:if>
    <c:if test="${rowData.POP_TEMPLATE eq '4'}">style="background: url('/academy/images/sitemngr/pop_bg_3.png') no-repeat;"</c:if>
    >
</body>
<!-- 히든처리페이지 -->
<iframe id="_cm" name="_cm" title="hidden command page" style="display:none"></iframe>
<!-- 히든처리페이지 -->
