<%
/****************************************************
    system  : 시스템관리 > 공통코드 등록 실행
    title   : 공통 코드 목록 조회
    summary :
    wdate   : 2016-05-16
    writer  : sangs
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript" src="/academy/common/js/jquery-1.8.2.js"></script>

<form name="form" id="form" action="" method="post">
<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK }">
<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno }">
<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo }">
<input type="hidden" name="grpNo" id="grpNo" value="${REQUEST_DATA.grpNo }">
<input type="hidden" name="refLevel" id="refLevel" value="${REQUEST_DATA.refLevel}">
<input type="hidden" name="ctypeName" id="ctypeName" value="${REQUEST_DATA.ctypeName}">

<input type="hidden" id="courseSelect" name="courseSelect" value="<c:out value="${REQUEST_DATA.courseSelect}"/>"/>
</form>

<script type="text/javascript">
	alert('<c:out value="${REQUEST_DATA.rMsg}"/>');
	$("#form").attr('action', '<c:out value="${REQUEST_DATA.rUrl}" />');
	$("#form").submit();
</script>