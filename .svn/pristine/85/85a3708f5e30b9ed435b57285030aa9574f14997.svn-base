<%
/****************************************
	system	: ClassDesk > 강사 > 설문
	title	: 설문 메인
	summary	:	
	wdate	: 2015-04-01
	writer	: SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="survey"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 
	
	
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	<form name="frm" id="frm" action="" method="post">
		<input type="hidden" id="CLASSDESK" name="CLASSDESK" value="${REQUEST_DATA.CLASSDESK}"/>
	</form>
	<script type="text/javascript">
	
		jQuery(document).ready(function(){
			var url = '<c:out value="${REQUEST_DATA.resultUrl }" />' ;
			$('#frm').attr('target', '_self').attr('method', 'post').attr('action', '<c:out value="${REQUEST_DATA.resultUrl }" />').submit();
			//window.location.href = '<c:out value="${REQUEST_DATA.resultUrl }" />';
		}); 
	
	</script>
