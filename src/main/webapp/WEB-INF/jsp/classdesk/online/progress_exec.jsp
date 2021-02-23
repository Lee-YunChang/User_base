<%
/****************************************************
    system  : 사용자 > 강의수강 후 목록 조회
    title   : 강의 목록 조회
    wdate   : 2016-09-30
    writer  : 황두은
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_online_inc.jsp"%>
<form name="form" id="form" action="" method="post">
   	<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.SES_COURSENO}"/>"/>
   	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>"/>
   	<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>"/>
	<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
	<input type="hidden" id="seqTitle" name="seqTitle"  value="${REQUEST_DATA.seqTitle}"/>
</form>
<script type="text/javascript">
	$('#form').attr('action', '/classdesk/user/progress/treeList.do');
	$('#form').submit(); 

	/* if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
		$('#form').attr('action', '/classdesk/user/progress/treeList.do');
		$('#form').submit();
	}  
	else {
		$('#form').attr('action', '/classdesk/user/progress/treeSubList.do'); // pc
		$('#form').submit();
	} */

</script>

