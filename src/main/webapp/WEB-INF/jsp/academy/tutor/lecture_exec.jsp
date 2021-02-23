<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<form name="pform" id="pform" action="" method="post">    
	<input type="hidden" name="entrstYear" id="entrstYear" value="${REQUEST_DATA.entrstYear}" />
	<input type="hidden" name="userno" id="userno" value="${REQUEST_DATA.userno}" />
	<input type="hidden" name="tabNo" id="tabNo" value="${REQUEST_DATA.tabNo}" />
	<input type="hidden" name="slno" id="slno" value="${REQUEST_DATA.slno}" />
	<input type="hidden" name="sltno" id="sltno" value="${REQUEST_DATA.sltno}" />
	<input type="hidden" name="mtScCode" id="mtScCode" value="${REQUEST_DATA.mtScCode}" />
	<input type="hidden" name="tutorHisYn" id="tutorHisYn" value="${REQUEST_DATA.tutorHisYn}" />
	<input type="hidden" name="mtFieldCode" id="mtFieldCode" value="${REQUEST_DATA.mtFieldCode}" />
</form>
<script type="text/javascript">

	alert("<c:out value='${msg}'/>");
	$("#pform").attr("action", "<c:out value='${returnUrl}'/>").submit();
	
</script>

