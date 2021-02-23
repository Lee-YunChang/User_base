<%@ page language="java"  contentType="text/html;charset=UTF-8" %>
<%   
	// ?ㅻ줈媛湲??덉쓣??????덈릺寃?罹먯돩 ??젣
	String userAgent = request.getHeader("user-agent");
	
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	
	if(userAgent.indexOf("MSIE") > -1){ // internet explorer
		response.setHeader("Cache-Control", "no-cache");
	}else if(userAgent.indexOf("Firefox") > -1){ // firefox
		response.setHeader("Cache-Control","no-store");
	}else if(userAgent.indexOf("Chrome") > -1){ // chrome
		response.setHeader("Cache-Control","no-store");
	}else{ // other browser
		response.setHeader("Cache-Control","no-cache");
	}
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="autocomplete" content="off" />
	
	<!-- 기존 URL /classdesk/user/poll/list.do -->
<form name="form" action="/classdesk/main/main.do" method="post">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
	<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
	<input type="hidden" name="cseqno" id="cseqno" value="${REQUEST_DATA.SES_CSEQNO}"/>
   	<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
   	<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>"/>
   	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>"/>
   	<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="<c:out value="${REQUEST_DATA.paramcUserNo}"/>"/>
   	<input type="hidden" id="seqTitle" name="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
   	<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
</form>

<script type="text/javascript">
	//alert("${rMsg}");
	alert("설문이 저장 되었습니다.");
	document.form.submit(); 
</script>
</head>
</html>
