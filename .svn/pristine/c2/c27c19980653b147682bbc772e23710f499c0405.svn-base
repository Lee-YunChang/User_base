<%
/****************************************************
	system	:
	title	: 
	summary	:	차수수정
	wdate	: 
	writer	: 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%>
<!-- 팝업타이틀 -->
<div class="ad_popup_head">
	<h1>과정 차수 수정</h1>
	<a href="#" onclick="self.close();"><img src="/academy/images/academy/btn_popup_close.png" alt="팝업닫기" /></a>
</div>
<!-- //팝업타이틀 -->
	

<div class="ad_popup_cont"> 
	<div class="ad_l_tit"><strong id="titleArea"></strong> <c:out value="${courseData.TITLE}"/><span style="letter-spacing:-0.05em;">과정상태를 변경할 수 있습니다.(단, 개설, 신청, 신청종료 일때만 가능)</span></div> 
	
	<form name="frm" id="frm" method="post" action="<c:out value="${ctx}"/>/academy/myclass/tutor/class_exec.do">
	<input type="hidden" name="cseqno" id="cseqno" value="<c:out value="${REQUEST_DATA.cseqno}"/>"/> 
	
	<div class="ad_table">
			<table class="ad_table_row ad_table_blue"  summary="상상스토리 교육시스템의 과정 차수 수정입니다.">
			<colgroup>
				<col width="15%" />
				<col width="" />
			</colgroup>
			<tbody>
				<tr>
					<th>과정명</th>
					<td colspan="3">[<c:out value="${courseData.MT_CTYPE_NAME}"/>] [<c:out value="${courseData.MT_CGRP_NAME}"/>] <c:out value="${courseData.TITLE}"/> </td>
				</tr>
				<tr>
					<th>신청기간</th>
					<td colspan="3"><c:out value="${courseData.APPLY_SDATE}"/> ~ <c:out value="${courseData.APPLY_EDATE}"/></td>
					
				</tr>
				<tr>
					<th>학습기간</th>
					<td colspan="3"><c:out value="${courseData.STUDY_SDATE}"/> ~ <c:out value="${courseData.STUDY_EDATE}"/> </td>
					
				</tr>
				<tr>
					<th>과정상태</th>
					<td colspan="3">
					
					<c:if test="">
					
					</c:if>
					<c:out value="${courseData.MT_CSEQ_STATUS_NAME}"/>
					<c:if test="${REQUEST_DATA.UPDATE_YN eq 'Y'}">
						 | 해당과정의 상태값을  
						 <select name = "mtCseqStatusCode" id ="mtCseqStatusCode" onchange="fnExec(); return false;">
							<option value="<c:out value="${REQUEST_DATA.STYPE_APPLY}"/>">신청</option>
							<option value="<c:out value="${REQUEST_DATA.STYPE_APPLY_END}"/>">신청종료</option>
							<option value="<c:out value="${REQUEST_DATA.STYPE_STUDY}"/>">진행</option>
						</select>
						 으로 변경합니다.
					</c:if>
					
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
	<!-- //항공예약 훈련 위탁 계약서 -->
	
	
	
</div>
<div class="ad_popup_btngroup" style="margin-top:30px;">
<a href="#none" onclick="fnSave(); return false;"><img src="/academy/images/academy/btn_popup_regist.png" alt="신청" /></a>
	<a href="#" onclick="self.close();"><img src="/academy/images/academy/btn_popup_close2.png" alt="닫기" /></a>
</div>


<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>



<script type="text/javascript">
 
 function fnExec(){ 
		$('#frm').attr('method', 'post').attr('target', '_cm').attr('action', '<c:out value="${ctx}"/>/academy/myclass/tutor/class_exec.do').submit();
 }
 
//등록후 창 새로고침 
	function fnReload(){   
		 window.close();
		 $( opener.location ).attr( 'href' ,  'javascript:fnReload();'); 

	} 
</script>

