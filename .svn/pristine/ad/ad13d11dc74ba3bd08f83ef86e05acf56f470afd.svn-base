<%
/****************************************
	subject	: 나의 강의실 > 강사료 신청양식 폼
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.sangs.util.StringUtil"%>  
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%>
<%
	String lectCode = SangsProperties.getProperty("Globals.mtCode_MT_FEE_TYPE_CODE_LECT");
	String etcCode = SangsProperties.getProperty("Globals.mtCode_MT_FEE_TYPE_CODE_ETC");
	String ojtCode = SangsProperties.getProperty("Globals.mtCode_MT_FEE_TYPE_CODE_OJT");
	
%>
<c:set var="LECTCODE" value="<%=StringUtil.getContent(lectCode)%>"/>
<c:set var="ETCCODE" value="<%=StringUtil.getContent(etcCode)%>"/>
<c:set var="OJTCODE" value="<%=StringUtil.getContent(ojtCode)%>"/>
 
<!-- 팝업타이틀 -->
<div class="ad_popup_head">
	<h1>부가업무료 등록</h1>
	<a href="#" onclick="self.close();"><img src="/academy/images/academy/btn_popup_close.png" alt="팝업닫기" /></a>
</div>
<!-- //팝업타이틀 -->

<!-- 팝업내용 -->
<div class="ad_popup_cont">
	<div class="ad_table">
		<form id="frm" name="frm">
		<input type="hidden" name="subcmd" id="subcmd"/>
		<input type="hidden" name="workTime" id="workTime"/>
		<input type="hidden" name="mtFeeTypeCode" id="mtFeeTypeCode" value="<c:out value="${REQUEST_DATA.mtFeeTypeCode}"/>"/>
		
		<table class="ad_table_row ad_table_blue">
			<colgroup>
				<col width="20%" />
				<col width="30%" />
				<col width="20%" />
				<col width="30%" />
			</colgroup>
			<tbody>
				<tr>
					<th>강사</th>
					<td><c:out value="${REQUEST_DATA.SES_USERNAME}"/> </td>
					<th><span class="ad_required">*</span>일자</th>
					<td>
						<!-- input size를 %로 줄 경우 떨어짐 현상을 방지하기 위하여 고정 px로 줌 -->
						<div class="ad_datepicker">
							<label for="ad_date" class="ad_label">달력</label>
							<input type="text" id="feeDate" name="feeDate" class="ad_calendar ad_input" readonly="readonly" style="width:135px;"/>
						</div>
						
					</td>
				</tr>
				<tr>
					<th><span class="ad_required">*</span>근무내용</th>
					<td colspan="3">
						<div class="ad_select ad_w150" id="cgrpArea" style="display: none;">
							<label for="mtCgrpCode" class="ad_label">근무내용구분</label>
							<select name="mtCgrpCode" id="mtCgrpCode" class="ad_tb_select">
								<ext:option items="${cgrpCodeData}"/>
							</select>
						</div>
						<label for="feeSummary" class="ad_label">근무내용입력</label>
						<input type="text" id="feeSummary" name="feeSummary" class="ad_input" style="width:60%; margin-left:10px;" />
					</td>
				</tr>
				<tr>
					<th><span class="ad_required">*</span>근무구분</th>
					<td colspan="3">
						<div class="ad_select ad_w150">
							<label for="mtWorkTypeCode" class="ad_label">근무구분</label>
							<select name="mtWorkTypeCode" id="mtWorkTypeCode" class="ad_tb_select">
								<ext:option items="${wTypeCodeData}"/>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="ad_required">*</span>근무시간</th>
					<td colspan="3">
						<!-- float로 인한 밀림 현상 해결을 위해 ad_clearfix 추가 -->
						<!-- 셀렉트박스 사이즈 w70 추가 20130905 -->
						<div id="workArea">
							<div class="ad_in_row ad_clearfix" id="test">
								<div class="ad_select ad_w70">
									<label for="ad_select_hour1" class="ad_label">시간 선택</label>
									<select name="ad_select_hour1" id="ad_select_hour1" class="ad_tb_select">
										<ext:hour maxNumber="24" />									
									</select>
								</div>
								<span class="ad_division">:</span> 
								<div class="ad_select ad_w70">
									<label for="ad_select_min1" class="ad_label">분 선택</label>
									<select name="ad_select_min1" id="ad_select_min1" class="ad_tb_select">
										<ext:hour maxNumber="60" />	
									</select>
								</div>
								<span class="ad_division">~</span> 
								<div class="ad_select ad_w70">
									<label for="ad_select_hour2" class="ad_label">시간 선택</label>
									<select name="ad_select_hour2" id="ad_select_hour2" class="ad_tb_select">
										<ext:hour maxNumber="24" />	
									</select>
								</div>
								<span class="ad_division">:</span> 
								<div class="ad_select ad_w70">
									<label for="ad_select_min2" class="ad_label">분 선택</label>
									<select name="ad_select_min2" id="ad_select_min2" class="ad_tb_select">
										<ext:hour maxNumber="60" />	
									</select>
								</div>
							</div>
						</div>
						
						<div class="ad_in_row ad_clearfix" style="margin-top:5px">
							<a href="#none" id="addWork"><img src="/academy/images/academy/btn_s_workPlus.png" alt="업무추가" /></a>
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="ad_required">*</span>총 배정시간</th>
					<td><label for="workTimes" class="ad_label">총 배정시간</label>
					<input type="hidden" id="workTimes" name="workTimes" class="ad_input" style="width:65%;text-align: right;" /> 
					<input type="text" id="workTotHour" name="workTotHour" class="ad_input" style="width:65%;text-align: right;" title="시간" /> 시간</td>
					<!-- border 추가 -->
					<th style="border-top:1px solid #d7d7d7;"><span class="ad_required">*</span>시급</th>
					<td><label for="hourPrc" class="ad_label">시급</label>
					<input type="text" id="hourPrc" name="hourPrc" class="ad_input" style="width:65%;text-align: right;" /> 원</td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
	
	<div class="ad_popup_btngroup" style="margin-top:30px;">
		<a href="#none" onclick="fnSave(); return false;"><img src="/academy/images/academy/btn_popup_regist.png" alt="등록" /></a>
		<a href="#" onclick="self.close();"><img src="/academy/images/academy/btn_popup_cancel.png" alt="취소" /></a>
	</div>
	
	<div id="workClone" style="display: none;">
		<div class="ad_in_row ad_clearfix"  id="test">
			<div class="ad_select ad_w70">
				<label for="ad_select_hour11" class="ad_label">시간 선택</label>
				<select name="ad_select_hour11" id="ad_select_hour11" class="ad_tb_select2">
					<ext:hour maxNumber="24" />									
				</select>
			</div>
			<span class="ad_division">:</span> 
			<div class="ad_select ad_w70">
				<label for="ad_select_min1" class="ad_label">분 선택</label>
				<select name="ad_select_min1" id="ad_select_min1" class="ad_tb_select2">
					<ext:hour maxNumber="60" />	
				</select>
			</div>
			<span class="ad_division">~</span> 
			<div class="ad_select ad_w70">
				<label for="ad_select_hour2" class="ad_label">시간 선택</label>
				<select name="ad_select_hour2" id="ad_select_hour2" class="ad_tb_select2">
					<ext:hour maxNumber="24" />	
				</select>
			</div>
			<span class="ad_division">:</span> 
			<div class="ad_select ad_w70">
				<label for="ad_select_min2" class="ad_label">분 선택</label>
				<select name="ad_select_min2" id="ad_select_min2" class="ad_tb_select2">
					<ext:hour maxNumber="60" />	
				</select>
			</div>
			<a href="#none" id="delWork"><img src="/academy/images/academy/btn_s_delete.png" alt="삭제" style="margin-left:5px;" /></a>
		</div>
	</div>					
						
						
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>


<script type="text/javascript">
	$(function($) {
		
		$('#feeDate').val($.datepicker.formatDate($.datepicker.ATOM, new Date()));
		
		//등록시..
		$('#addWork').live('click', function(e){
			$('#workArea').append($('#workClone').html());
			$('#workArea div[id=test]').eq($('#workArea div[id=test]').length-1).find('select').selectbox();
			
		});
		
		$('#delWork').live('click', function(){
			$(this).parent().remove();
		});	
		
		
		<c:choose>
			<c:when test="${REQUEST_DATA.mtFeeTypeCode eq LECTCODE}">
				$('#cgrpArea').show();
				$('input[name=feeSummary]').attr('style', 'width:60%; margin-left:10px;');
				$('.ad_popup_head h1').html('강의료 등록');
			</c:when>
			
			<c:when test="${REQUEST_DATA.mtFeeTypeCode eq OJTCODE}">
				$('#cgrpArea').show();
				$('input[name=feeSummary]').attr('style', 'width:60%; margin-left:10px;');
				$('.ad_popup_head h1').html('OJT 등록');
			</c:when>
			
			
			<c:otherwise>
				$('#cgrpArea').hide();
				$('input[name=feeSummary]').attr('style', 'width:95%;');
				$('.ad_popup_head h1').html('부가업무료 등록');
			</c:otherwise>
		</c:choose>
		
		
		$('select[name=ad_select_hour1]').change(function(){
			
			/* workTime hourPrc */
		});
	});	
	
	function fnSave(){
		
		if ($('input[name=feeSummary]').valueEmpty()) {
			alert('근무내용을 입력해주세요.');
			$('input[name=feeSummary]').focus();
			return;
		}
		
		if ($('input[name=workTotHour]').valueEmpty()) {
			alert('총 배정시간을 입력해주세요.');
			$('input[name=workTotHour]').focus();
			return;
		}
		
		if(!$.isNumeric($('input[name=workTotHour]').val())){
			alert('배정시간은 숫자만 입력가능합니다.');			
			$('input[name=workTotHour]').focus();
			return;
		}
		
		if ($('input[name=hourPrc]').valueEmpty()) {
			alert('시급을 입력해주세요.');
			$('input[name=hourPrc]').focus();
			return;
		}
		
		if(!$.isNumeric($('input[name=hourPrc]').val())){
			alert('시급은 숫자만 입력가능합니다.');			
			$('input[name=hourPrc]').focus();
			return;
		}
		
		var workTimes = '';
		var totalLen = $('#workArea div[id=test]').find('.ad_select').length;
		var index=0;
		 $('#workArea div[id=test]').find('.ad_select').each(function(i){
			 index = i+1;
			 workTimes += $('#workArea div[id=test]').find('.ad_select').eq(i).find('select').val();
			 
			 if(index % 4 == 0 && totalLen > index){
				 workTimes += ';';
			 }
		}); 
		 
 	    $('#workTime').val(workTimes);
		$('#frm').attr('target', '_cm').attr('method', 'post').attr('action', '<c:out value="${ctx}"/>/academy/myclass/tutorfee/exec.do').submit();
	}
	
</script>

