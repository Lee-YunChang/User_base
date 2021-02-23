<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%
/****************************************
	subject	: 수료증 
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상상스토리 사용자포털</title>
	
<style type="text/css">
		.certificate { position: relative; width: 909px; height: 1286px; background: url('/academy/images/certificate.png') no-repeat; }
		p { position: absolute; font-family: 'Gungsuh'; font-size: 24px; }
		p.paper_code { top: 148px; left: 120px; }
		p.name { top: 445px; left: 232px; letter-spacing: 8px; }
		p.company { top: 485px; left: 232px; }
		p.subject { top: 525px; left: 232px; }
		p.period { top: 565px; left: 232px; }
		p.year { top: 920px; left: 314px; font-size: 32px; }
		p.month { top: 920px; right: 430px; font-size: 32px; }
		p.day { top: 920px; right: 339px; font-size: 32px; }
	</style>
</head>
<body>

<div class="certificate">
	<p class="paper_code"><c:out value="${certData.COMPCODE}"/></p>
	<p class="name"><c:out value="${certData.USERNAME}"/></p>
	<p class="company"><c:out value="${certData.COMNAME}"/></p>
	<p class="subject"><c:out value="${certData.SEQ_TITLE}"/></p>
	<p class="period"> <c:out value="${certData.STUDY_SDATE}"/> ~ <c:out value="${certData.STUDY_EDATE}"/>. &lt; <c:out value="${certData.EDUDAY}"/>일 &gt; </p>
	<p class="year"><c:out value="${certData.NOWYEAR}"/></p>
	<p class="month"><c:out value="${certData.NOWMONTH}"/></p>
	<p class="day"><c:out value="${certData.NOWDAY}"/></p>
</div>
 
<script type="text/javascript">
 window.print();
 
 </script>
</body>

</html>

 
