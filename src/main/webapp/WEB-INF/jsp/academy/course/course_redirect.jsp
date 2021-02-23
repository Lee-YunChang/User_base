<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/academy/common/css/common.css">
<link rel="stylesheet" href="/academy/common/css/main.css">
<link rel="stylesheet" href="/academy/common/css/sub.css">
<link rel="stylesheet" href="/academy/common/css/mobile.css">


<script type="text/javascript">

$(document).ready(function(){

	var mode = $("#eduMode").val();
	$('#layer_01').css('display' , 'block');
	
	/* $('.btn-m pop_close').on('click', function(){
		alert('11111111111');
		if('E' == mode) {
			//$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/common/applyResult.do').submit();
			$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/onForm.do').submit();
			
		} else if('J' == mode){
			$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/offForm.do').submit();
		} else if('C' == mode){
			$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/cpseduForm.do').submit();
		} else if('M' == mode){
			$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do').submit();	
		}
	}); */
	
});

function submitForm(){
	var mode = $("#eduMode").val();
	
	if('E' == mode) {
		//$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/common/applyResult.do').submit();
		$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/onForm.do').submit();
		
	} else if('J' == mode){
		$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/offForm.do').submit();
	} else if('C' == mode){
		$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/cpseduForm.do').submit();
	} else if('M' == mode){
		$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do').submit();	
	} else if('S' == mode){
		$('#sfrm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/aprsltList.do').submit();	
	}
}
</script>

<div class="contents" id="sContents" style="min-height:300px">
	<div class="layer_popup" id="layer_01" style="display: none;">
		<div class="layer-tit">
			<p><c:out value="${REQUEST_DATA.title}" /></p>
			<button title="닫기" class="layer_close pop_close">닫기</button>
		</div>
		<div class="layer_bg bg1">
			<p><c:out value="${REQUEST_DATA.msg}" /></p>
			<button title="닫기" class="btn-m pop_close" onclick="submitForm();return false">닫기</button>
		</div>
	</div>
</div>

<form name="sfrm" id="sfrm" action="" method="post">
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
