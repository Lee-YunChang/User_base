<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%
/****************************************
	subject	: 처리후 이동용 페이지
	summary	: 처리후 이동용 페이지
	author	: SANGS
	date	: 2016-06-01
****************************************/
%>
<%   
	// 뒤로가기 했을때 저장 안되게 캐쉬 삭제
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="autocomplete" content="off" />
<title>상상스토리 사용자포털</title>
<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	<c:if test="${REQUEST_DATA.sendMail eq 'Y'}">
	
		alert('<c:out value="${REQUEST_DATA.msg}"/>');

		$("#frm").attr("action",'<c:out value="${REQUEST_DATA.url}"/>');
		$("#sendMailYn").val('<c:out value="${REQUEST_DATA.sendMailYn}"/>');
		
		$("#frm").submit();
		return false;
	</c:if>
	<c:if test="${!empty REQUEST_DATA.msg}"> alert('<c:out value="${REQUEST_DATA.msg}"/>'); </c:if>
	<c:if test="${!empty REQUEST_DATA.url}"> location.href = '<c:out value="${REQUEST_DATA.url}"/>'; </c:if>

});

<c:if test="${not empty pageContext.exception.message}">
// 에러 처리
	alert("error!!!");
	alert('${pageContext.exception.message}');
</c:if>

<c:if test="${empty pageContext.exception.message}">
$(function() {

	<c:if test="${empty REQUEST_DATA.rType || REQUEST_DATA.rType == 'alert'}">
	    <c:if test="${empty REQUEST_DATA.rMsg}">
	    submitAfterRedirectFunc();
	    </c:if>
	    <c:if test="${!empty REQUEST_DATA.rMsg}">
			alert('${REQUEST_DATA.rMsg}');
			submitAfterRedirectFunc();
		</c:if>
	</c:if>
		/* 	<c:if test="${REQUEST_DATA.rType == 'confirm'}">
			$.confirm('${REQUEST_DATA.rMsg}', {
				target   : "parent",
				func_yes : "${REQUEST_DATA.rSuccess}",
				func_no  : "${REQUEST_DATA.rCancel}"
			});
		</c:if> */
	});
	
	<c:if test="${empty REQUEST_DATA.rType || REQUEST_DATA.rType == 'alert'}">
		function submitAfterRedirectFunc() {
			
			<c:if test="${not empty REQUEST_DATA.rForm}">
			//$("INPUT[name*='param_']", parent.document).remove();
			
			$('#' + '${fn:split(REQUEST_DATA.rForm,"|")[0]}', parent.document)
			.attr('target', '_self')
			.attr('action', '<c:out value='/${fn:split(REQUEST_DATA.rForm,"|")[1]}'/>').submit();
			</c:if>
		 	/*    <c:if test="${not empty REQUEST_DATA.rVar}">
		    parent.rVar = '${REQUEST_DATA.rVar}';
		    </c:if> */
			<c:if test="${not empty REQUEST_DATA.rScript}">
			eval("${REQUEST_DATA.rScript}");
			return;
			
			</c:if>
			<c:if test="${not empty REQUEST_DATA.rUrl}">
			//parent.location.href = '<c:out value="' + '${REQUEST_DATA.rUrl}' + '"/>';
			parent.location.href = '${REQUEST_DATA.rUrl}';
			</c:if>
		}
	</c:if>
</c:if>

function fnReturnPage(pmode){
	if('E' == pmode) {
		$("#frm").attr("/academy/course/onForm.do");	
	} else if('off' == pmode){
		$("#frm").attr("/academy/course/offForm.do");	
	} else if('cps' == pmode){
		$("#frm").attr("/academy/course/cpseduForm.do");	
	}
	$("#frm").submit();
}

function fnApplyResult(){
	var pmode = $("#eduMode").val();

	if('E' == pmode) {
		alert("1 여기");
		$("#frm").attr("/academy/course/common/applyResult.do");	
	} else if('off' == pmode){
		$("#frm").attr("/academy/course/offForm.do");	
	} else {
		$("#frm").attr("/academy/course/cpseduForm.do");	
	}
	$("#frm").submit();
}

</script>
</head>
<body>
<form name="frm" id="frm" action="" method="post">
<input type="hidden" name="sendMailYn" id="sendMailYn" value=""/>
<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/>
<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
<input type="hidden" name="mtEduinfoCode" id="mtEduinfoCode" value="<c:out value="${REQUEST_DATA.mtEduinfoCode}"/>"/>
<input type="hidden" name="mtCseqStatusEnd" id="mtCseqStatusEnd" value="<%=SangsProperties.getProperty("Globals.mtCode_MT_CSEQ_STATUS_CODE_APPLY_END")%>"/>

<input type="hidden" name="eduMode" id="eduMode" value="<c:out value="${REQUEST_DATA.eduMode}"/>"/>
<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>"/>
<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>"/>
<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>

</form>
</body>
</html>