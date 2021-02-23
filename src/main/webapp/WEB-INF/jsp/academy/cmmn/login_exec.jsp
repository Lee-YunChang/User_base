<%
/****************************************
	subject	: 로그인 실행
	summary	: 로그인 실행 
	author	: SANGS
	date	: 2016-06-01
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<form id="frm" name="frm" method="post">
<input type="hidden" name="pollcseqno" id="pollcseqno" value="<c:out value="${REQUEST_DATA.pollcseqno}"/>" />
<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>" />
<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>" />
<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>" />
<input type="hidden" name="SES_CUSERNO" id="SES_CUSERNO" value="<c:out value="${REQUEST_DATA.CUSERNO}"/>" />
<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="<c:out value="${REQUEST_DATA.CUSERNO}"/>" />
</form>
<script type="text/javascript" src="/academy/common/js/jquery-1.8.2.js"></script>
<script type="text/javascript">

    if('<c:out value="${msg2}"/>' != '') {
		alert('<c:out value="${msg2}"/>');
	}
   
	if('<c:out value="${msg}"/>' != '') {
		alert('<c:out value="${msg}"/>');
	}

// 	location.href='<c:out value="${returnUrl}"/>';
	$("#frm").attr("action" , "<c:out value='${returnUrl}'/>").submit();

</script>

</body>
</html>