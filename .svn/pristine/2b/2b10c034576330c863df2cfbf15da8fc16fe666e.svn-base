<%
/****************************************
	system	: ClassDesk > 강사 > 시험
	title	: 시험 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="topMenuCode" value="test"/>
<div class="wrapper clearfix">
    <!-- 왼쪽 메뉴 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
<!-- // 왼쪽 메뉴 영역 -->
<div id="Right_Area">
	<!-- 시험출제 -->
	<div>
		<div class="round-box beige">
			<form id="sFrm" name="sFrm">
				<input type="hidden" name="subcmd">
				<input type="hidden" name="secNo" id="secNo">
				<input type="hidden" name="examNo" value="<c:out value="${rowData.EXAMNO}"/>">	
				
			</form>
		
			<!-- 바인더 관리용 팝업 FORM -->
			<form id="popFrm" name="popFrm">
				<input type="hidden" name="qno" id="qno" value="">
				<input type="hidden" name="seq" id="seq" value="">
				<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.SES_COURSENO}" default="0"/>">
				<input type="hidden" name="examNo" id="examNo" value="<c:out value="${REQUEST_DATA.examNo}" default="0"/>">
				<input type="hidden" name="openType" id="openType" value="<c:out value="${courseData.OPENTYPE}" default="D"/>">
				<input type="hidden" name="searchMode" id="searchMode" value="">
 			</form>
 			
 			<!-- 상시과정 문제 사용여부 수정 관리 -->
			<form id="openAForm" name="openAForm">
				<input type="hidden" name="qno" id="qno" value="">
				<input type="hidden" name="seq" id="seq" value="">
				<input type="hidden" name="useYn" id="useYn" value="">
				<input type="hidden" name="openPubeType" id="openPubeType" value="">
				<input type="hidden" name="examNo" id="examNo" value="<c:out value="${REQUEST_DATA.examNo}" default="0"/>">
				<input type="hidden" name="openType" id="openType" value="<c:out value="${courseData.OPENTYPE}" default="D"/>">
 			</form>
		
			<form id="examForm" name="examForm">
			<input type="hidden" name="openYn" id="openYn">
			<input type="hidden" name="addObject" id="addObject">
			<input type="hidden" name="examNo" id="examNo" value="<c:out value="${rowData.EXAMNO}"/>">
			<input type="hidden" name="randomYn" id="randomYn" value="<c:out value="${rowData.RANDOM_YN}"/>">
			<input type="hidden" name="secNo" id="secNo">
			<input type="hidden" name="openType" id="openType" value="<c:out value="${courseData.OPENTYPE}" default="D"/>">
			<input type="hidden" name="binderExamNo" id="binderExamNo" value="">	<!--  바인더 시험 번호  -->
			<input type="hidden" name="binderPubType" id="binderPubType" value="">	<!--  바인더 시험 출제방식  -->
			
			<!-- 시험출제 테이블 -->
			<div class="table-type3">
				<table>
					<caption>시험출제</caption>
					<colgroup>
						<col width="13%" />
						<col width="42%" />
						<col width="13%" />
						<col width="42%" />
					</colgroup>
					<tbody>
						<tr>
							<th>시험명</th>
							<td colspan="3"><label for="exam-title">시험명</label><input type="text" class="w98" name="title" id="exam-title" value="<c:out value="${rowData.TITLE}" />"  maxlength="66"/></td>
						</tr>
						<tr>
							<th>응시기간</th>
							<td> 
								<div id="openDate">
								<label for="task-date1">시작날짜선택</label>
								
								<input type="text" class="w15" name="sdate" id="sdate" value='<fmt:formatDate value="${rowData.SDATE}" pattern="yyyy-MM-dd" />' readonly="readonly"  style="width: 65px"/> 
								<a href="#none" onclick="$('#sdate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="시작날짜선택" /></a>  &nbsp;
								<select name="shour" id="shour"> 
									<option value="00" <c:if test="${rowData.SHOUR eq '00'}">selected="selected"</c:if>>00</option>
									<option value="01" <c:if test="${rowData.SHOUR eq '01'}">selected="selected"</c:if>>01</option>
									<option value="02" <c:if test="${rowData.SHOUR eq '02'}">selected="selected"</c:if>>02</option>
									<option value="03" <c:if test="${rowData.SHOUR eq '03'}">selected="selected"</c:if>>03</option>
									<option value="04" <c:if test="${rowData.SHOUR eq '04'}">selected="selected"</c:if>>04</option>
									<option value="05" <c:if test="${rowData.SHOUR eq '05'}">selected="selected"</c:if>>05</option>
									<option value="06" <c:if test="${rowData.SHOUR eq '06'}">selected="selected"</c:if>>06</option>
									<option value="07" <c:if test="${rowData.SHOUR eq '07'}">selected="selected"</c:if>>07</option>
									<option value="08" <c:if test="${rowData.SHOUR eq '08'}">selected="selected"</c:if>>08</option>
									<option value="09" <c:if test="${rowData.SHOUR eq '09'}">selected="selected"</c:if>>09</option>								
									<c:forEach var="min" begin="10" end="23" step="1" >
									  <option value="<c:out value='${min}' />" <c:if test="${rowData.SHOUR eq  min}">selected="selected"</c:if>><c:out value="${min}" /></option>
									</c:forEach>
 								</select>시
 								<select name="smin">
									<option value="00" <c:if test="${rowData.SMIN eq '00'}">selected="selected"</c:if>>00</option>
									<option value="05" <c:if test="${rowData.SMIN eq '05'}">selected="selected"</c:if>>05</option>
									<option value="10" <c:if test="${rowData.SMIN eq '10'}">selected="selected"</c:if>>10</option>
									<option value="15" <c:if test="${rowData.SMIN eq '15'}">selected="selected"</c:if>>15</option>
									<option value="20" <c:if test="${rowData.SMIN eq '20'}">selected="selected"</c:if>>20</option>
									<option value="25" <c:if test="${rowData.SMIN eq '25'}">selected="selected"</c:if>>25</option>
									<option value="30" <c:if test="${rowData.SMIN eq '30'}">selected="selected"</c:if>>30</option>
									<option value="35" <c:if test="${rowData.SMIN eq '35'}">selected="selected"</c:if>>35</option>
									<option value="40" <c:if test="${rowData.SMIN eq '40'}">selected="selected"</c:if>>40</option>
									<option value="45" <c:if test="${rowData.SMIN eq '45'}">selected="selected"</c:if>>45</option>
									<option value="50" <c:if test="${rowData.SMIN eq '50'}">selected="selected"</c:if>>50</option>  
									<option value="55" <c:if test="${rowData.SMIN eq '55'}">selected="selected"</c:if>>55</option>  
								</select>분
								<span class="date-cut">&nbsp;&nbsp;~&nbsp;&nbsp;</span> 
								<label for="task-date2">마지막날짜선택</label>
								<c:choose>
									<c:when test="${empty rowData.EDATE}">
										<input type="text" class="w15" name="edate" id="edate" value='<c:out value="${REQUEST_DATA.defultEdate}"/>' readonly="readonly"  style="width: 65px"/> 
									</c:when>
									<c:otherwise>
										<input type="text" class="w15" name="edate" id="edate" value='<fmt:formatDate value="${rowData.EDATE}" pattern="yyyy-MM-dd" />' readonly="readonly" style="width: 65px"/>  
									</c:otherwise>
								</c:choose> 
								
								<a href="#none" onclick="$('#edate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="마지막날짜선택" /></a>  &nbsp; 
								<select name="ehour" id="ehour"> 
									<option value="00" <c:if test="${rowData.EHOUR eq '00'}">selected="selected"</c:if>>00</option>
									<option value="01" <c:if test="${rowData.EHOUR eq '01'}">selected="selected"</c:if>>01</option>
									<option value="02" <c:if test="${rowData.EHOUR eq '02'}">selected="selected"</c:if>>02</option>
									<option value="03" <c:if test="${rowData.EHOUR eq '03'}">selected="selected"</c:if>>03</option>
									<option value="04" <c:if test="${rowData.EHOUR eq '04'}">selected="selected"</c:if>>04</option>
									<option value="05" <c:if test="${rowData.EHOUR eq '05'}">selected="selected"</c:if>>05</option>
									<option value="06" <c:if test="${rowData.EHOUR eq '06'}">selected="selected"</c:if>>06</option>
									<option value="07" <c:if test="${rowData.EHOUR eq '07'}">selected="selected"</c:if>>07</option>
									<option value="08" <c:if test="${rowData.EHOUR eq '08'}">selected="selected"</c:if>>08</option>
									<option value="09" <c:if test="${rowData.EHOUR eq '09'}">selected="selected"</c:if>>09</option>								
									<c:forEach var="min" begin="10" end="23" step="1" >
									  <option value="<c:out value='${min}' />" <c:if test="${rowData.EHOUR eq  min}">selected="selected"</c:if>><c:out value="${min}" /></option>
									</c:forEach>
 								</select>시
 								<select name="emin">
									<option value="00" <c:if test="${rowData.EMIN eq '00'}">selected="selected"</c:if>>00</option>
									<option value="05" <c:if test="${rowData.EMIN eq '05'}">selected="selected"</c:if>>05</option>
									<option value="10" <c:if test="${rowData.EMIN eq '10'}">selected="selected"</c:if>>10</option>
									<option value="15" <c:if test="${rowData.EMIN eq '15'}">selected="selected"</c:if>>15</option>
									<option value="20" <c:if test="${rowData.EMIN eq '20'}">selected="selected"</c:if>>20</option>
									<option value="25" <c:if test="${rowData.EMIN eq '25'}">selected="selected"</c:if>>25</option>
									<option value="30" <c:if test="${rowData.EMIN eq '30'}">selected="selected"</c:if>>30</option>
									<option value="35" <c:if test="${rowData.EMIN eq '35'}">selected="selected"</c:if>>35</option>
									<option value="40" <c:if test="${rowData.EMIN eq '40'}">selected="selected"</c:if>>40</option>
									<option value="45" <c:if test="${rowData.EMIN eq '45'}">selected="selected"</c:if>>45</option>
									<option value="50" <c:if test="${rowData.EMIN eq '50'}">selected="selected"</c:if>>50</option>  
									<option value="55" <c:if test="${rowData.EMIN eq '55'}">selected="selected"</c:if>>55</option>  
								</select>분
								</div>
								<div id="openTypeText">
									상시
								</div>
							</td>
						
							<th>배정점수</th>
							<td><label for="exam-score">배정점수</label><input type="text" class="w10" name="eval" id="eval" value="<c:out value="${rowData.EVAL}" />"  onkeyup="lfn_keychk(this);" maxlength="3"/> 
 								<div  style="display: inline-block;">
 										 <span id = "score" name="score"></span>/<span id = "total_score"><c:out value="${evalData.EVAL_EXAM_MT}" /></span> (남은배정점수/총배점점수)
  										<input type = "hidden" name = "pscore" id = "pscore"  value=""/> 
  										<input type = "hidden" name = "tscore" id = "tscore"  value=""/> 
  								</div>
							</td>
						</tr>
						<tr>
							<th>시험유형</th>
							<td>
								<input type="radio" name="examType" id="examType" value="M" onclick="fnScore(this.value)" <c:if test="${rowData.EXAM_TYPE ne 'F'}"> checked</c:if> <%-- <c:if test="${evalData.EVAL_EXAM_MT <=0 }"> disabled="disabled" </c:if> --%>/><label for="examType" class="visible">중간평가</label>
								<input type="radio" name="examType" id="examType2" value="F" onclick="fnScore(this.value)" <c:if test="${rowData.EXAM_TYPE eq 'F'}"> checked</c:if> <%-- <c:if test="${evalData.EVAL_EXAM_FINAL <=0 }"> disabled="disabled" </c:if> --%> /><label for="exam-type2" class="visible">최종평가</label>
							</td>
							<th>제한시간</th>
							<td>
								<label for="exam-time">제한시간</label>
								<input type="text" class="w10" name="examTime" id="examTime" value="<c:out value="${rowData.EXAM_TIME}"/>"  onkeyup="lfn_keychk(this);" maxlength="3"/> 분
							</td>
						</tr>
						<tr>
							<th>출제방식</th>
							<td colspan="3">
								<input type="radio" name="pubType" id="way-type1" value="R" <c:if test="${rowData.PUB_TYPE eq 'R'}"> checked</c:if>><label for="way-type1" class="visible"style="cursor:pointer;"  >문제은행 방식</label>
								<input type="radio" name="pubType" id="way-type2" value="B" <c:if test="${rowData.PUB_TYPE eq 'B'}"> checked</c:if>/><label for="way-type2" class="visible" style="cursor:pointer;"  >바인더 방식</label>
								<input type="radio" name="pubType" id="way-type3" value="S" <c:if test="${rowData.PUB_TYPE eq 'S'}"> checked</c:if>/><label for="way-type3" class="visible" style="cursor:pointer;"  >세트문제 방식</label>
 
								<label for="exam-set">제한시간</label>
								
							<%-- <c:if test="${rowData.PUB_TYPE eq 'S'}"> --%> 
								<span id="setArea"  style="display: none;">
								
								
									<select name="setNo" id="setType">
										<c:choose>
											<c:when test="${not empty cateListData}">
												<option value="">세트선택</option>
												<c:forEach items="${cateListData}" var="result" varStatus="stat">
							 						<option value="<c:out value="${result.SETNO}"/>"  <c:if test="${result.SETNO == rowData.SETNO}"> selected</c:if> ><c:out value="${result.TITLE}"/></option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<option value="0">등록된 세트가 없습니다</option>
											</c:otherwise>
										</c:choose>
									</select>
 						 			<a href="#none" onclick="fnExamSetList(); return false;" class="btn-small-blue" style="vertical-align:middle; margin-top:1px;"><span>세트관리</span></a> &nbsp;
 						 			
								</span>
								
								<div name="pubSummary" id="pubSummary" class="tb_in_txt">
									<div><span>· 문제은행 방식</span>: 과정관리시스템에서 설정된 문제은행 기반 시험 방식입니다.</div>
									<div><span>· 바인더 방식</span>: 해당 과정에 출제되었던 문제를 불러올 수 있습니다.</div>
									<div><span>· 세트문제 방식</span>: 과정별 시험 세트방식으로 등록된 세트를 선택하거나 신규 등록하여 시험을 출제할 수 있습니다.</div>
								</div>
								<%-- </c:if> --%>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- //시험출제 테이블 -->
			</form>
		</div>
	</div>
	
		<!-- 게시판 버튼영역 -->

	<div class="table-btn-group">
		<div class="btn-table">
		
			<c:if test="${rowData.OPENYN ne 'Y'}">
				<a href="#none" onclick="fnSave('N'); return false;" class="btn-large-green"><span>임시저장</span></a>
			</c:if>
			
			<a href="#none" onclick="fnSave('Y'); return false;" class="btn-large-blue"><span>시험출제</span></a>
			
			<c:if test="${rowData.EXAMNO > 0}">
				<a href="#none" onclick="fnExamDel(); return false;" class="btn-large-orange"><span>삭제</span></a>
			</c:if>
		</div>
		<div class="btn-table left">
			<a href="#none" onclick="fnList(); return false;" class="btn-large-orange"><span>목록</span></a>
		</div>
	</div>

	<!-- //게시판 버튼영역 -->
	
	<!-- //시험출제 -->
	<div class="table-title mg-t18 clearfix">
		<!-- <h3 class="ico-table-blue" name="icotitle" id="icotitle">출제정책</h3> -->
	</div>
	<!-- 출제시험 -->
	<div id="sectionAreaEmp" >
	<c:if test="${rowData.PUB_TYPE eq 'R' }">
		<c:import url="inc/exam_random_inc.jsp" />
	</c:if>
	<c:if test="${rowData.PUB_TYPE eq 'S' }">
		<c:import url="inc/exam_set_inc.jsp" />
	</c:if>
	<c:if test="${rowData.PUB_TYPE eq 'B' }">
		<c:import url="inc/exam_binder_inc.jsp" />
	</c:if>
	</div>
</div>
	<!-- //출제시험 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
	<!--
    	function fnScore(sval){
     		var a = sval; 
    		var cfval = parseInt('<c:out value="${evalData.EVAL_EXAM_FINAL}" />') -  parseInt('<c:out value="${evalData.CUR_FVAL}" />');
    		var cmval =  parseInt('<c:out value="${evalData.EVAL_EXAM_MT}" />') -  parseInt('<c:out value="${evalData.CUR_MVAL}" />');
    		 
    		
    		if(a=='M'){  
    			$("#total_score").html('<c:out value="${evalData.EVAL_EXAM_MT}" />');
    			$("#score").html(cmval);
    			$("#tscore").val('<c:out value="${evalData.EVAL_EXAM_MT}" />');  
    			$("#pscore").val(cmval);  
    		}else if(a=='F'){
      			$("#total_score").html('<c:out value="${evalData.EVAL_EXAM_FINAL}" />');
      			$("#score").html(cfval);
    			$("#tscore").val('<c:out value="${evalData.EVAL_EXAM_FINAL}" />');  
    			$("#pscore").val(cfval);  
    		}
     	}
     
    	$(function(){
    		//var a = $("input[name=examType][checked]").val(); 
    		var a = '<c:out value="${rowData.EXAM_TYPE}" />';  
    		if(a== ''){
    			if(  parseInt('<c:out value="${evalData.EVAL_EXAM_MT}" />')<=0){
    				a='F';
    				$('input:radio[name="examType"]:radio[value="F"]').attr('checked',true); 
    			}else{
    				a='M';
    				$('input:radio[name="examType"]:radio[value="M"]').attr('checked',true); 
     			}
    		}
     		fnScore(a);
     	});
    	
    	function fnLeUseYn(a, b){
    		var secTitle = '#secTitle'+ a;
    		var description = '#description'+ a;
    		var allot = '#allot'+ a;
    		var totalQnum = '#totalQnum'+ a;
    		
    		if(a == 'N'){
    			$(secTitle).attr('readonly',true); 
    			$(description).attr('readonly',true); 
    			$(allot).attr('readonly',true); 
    			$(totalQnum).attr('readonly',true); 
    		}else{
    			$('#secTitle').val(''); 
    	        $('#secTitle').removeAttr('readonly');  
    			$('#description').val(''); 
    	        $('#description').removeAttr('readonly');  
    			$('#allot').val(''); 
    	        $('#allot').removeAttr('readonly');  
    			$('#totalQnum').val(''); 
    	        $('#totalQnum').removeAttr('readonly');  
    		}
    	}
    	
		$(function($) {
			<c:if test="${rowData.PUB_TYPE eq 'S'}"> 
				$('#setArea').show();
			</c:if>
			
			SANGS.Util.datepickerCallOptions($('#sdate'), $('#edate'));
 		 
			/**************************************************
			 이벤트명 : $("input[name=pubType]").click(function(e)
			 설 명 : 출제방식 CLICK EVENT  R:랜덤  S:세트
			***************************************************/ 
			$('input[name=pubType]').click(function(e){
				//랜덤방식
				if($(this).val() == 'R'){
					$('#setArea').hide();
					$('#binderList').hide();
					$('#setAllotTotal').hide();
					$('#binderAllotTotal').hide();
					$('#setType').val('');
				    
					/*
					if($('#randomYn').val() == 'Y'){
						$('#randomList').show();
					}else{
					    SANGS.Util.ajax('/classdesk/tutor/exam/ajaxRandomList.do', {}, 'html', eval('fnSucces'));
					}
					*/
					 SANGS.Util.ajax('/classdesk/tutor/exam/ajaxRandomList.do', {}, 'html', eval('fnSucces'));
				//세트방식	
				}else if($(this).val() == 'S'){
					$('#randomList').hide();
					$('#binderList').hide();
					$('#setArea').show();
					$('#binderAllotTotal').hide();
					SANGS.Util.ajax('/classdesk/tutor/exam/ajaxSetList.do', {setno : $('#setType option:selected').val()}, 'html', eval('fnSucces'));
				}else if($(this).val() == 'B'){ 
					fnPopBinder(); 
					$('#randomList').hide();
					$('#setArea').hide();
					$('#binderList').show();
					$('#setAllotTotal').hide();
					SANGS.Util.ajax('/classdesk/tutor/exam/ajaxBinderList.do', {examNo : $('#examNo').val()}, 'html', eval('fnSucces'));
				}
			});
			 
			/**************************************************
			 이벤트명 : $('#setType').change(function(e)
			 설 명 : 세트방식 CHANGE EVENT
			***************************************************/ 
			$('#setType').change(function(e){
			    SANGS.Util.ajax('/classdesk/tutor/exam/ajaxSetList.do', {setno : $(this).val()}, 'html', eval('fnSucces'));
			}); 
			
			 // 과정운영상태에 따른 응시기간 조절
			if($('#openType').val() == 'A'){
				$('#openDate').hide();	
				$('#openTypeText').show();	
			}else{
				$('#openDate').show();	
				$('#openTypeText').hide();	
			}
		});	
	
	
		 /**************************************************
		 함수명 : fnSucces
		 설 명 : 문제목록 이동함수
		***************************************************/ 
		function fnExamQform(secNo){
			$('#secNo').val(secNo);
			$('form[name=sFrm]').attr('action', '/classdesk/tutor/quizbank/q_list.do').submit();
		}
			
		/**************************************************
		 함수명 : fnSucces
		 설 명 : Ajax success 콜백 함수
		***************************************************/ 
		function fnSucces(result){
			$('#sectionAreaEmp').empty().html(result);
		}
	
		/**************************************************
		 함수명 : fnSave
		 설 명 : 저장 
		 	   openYnVal : openYn컬럼 N:임시저장  Y:시험출제
		***************************************************/ 
		function fnSave(openYnVal){
		 		   
			if ($('input[name=title]').valueEmpty()) {
				alert('제목을 입력해주세요.');
				$('input[name=title]').focus();
				return;
			}
			// 기간제일 경우에만 제어 
			if($('#openType').val()=='D'){
				if ($('#sdate').valueEmpty()) {
					alert('응시시간 시작일자를 입력해주세요.');
					$('#sdate').focus();
					return;
				}
				
				if ($('#edate').valueEmpty()) {
					alert('응시시간 종료일자를 입력해주세요.');
					$('#edate').focus();
					return;
				}
			}
			
			if ($('#eval').valueEmpty()) {
				alert('배점을 입력해주세요.');
				$('#eval').focus();
				return;
			}	
			
			if(!$.isNumeric($('input[name=eval]').val())){
				alert('배점은 숫자만 입력가능합니다.');			
				$('input[name=eval]').focus();
				return;
			}
			
			if ($('input[name=examTime]').valueEmpty()) {
				alert('제한시간을 입력해주세요.');
				$('input[name=examTime]').focus();
				return;
			}
			
			if(!$.isNumeric($('input[name=examTime]').val())){
				alert('제한시간은 숫자만 입력가능합니다.');			
				$('input[name=examTime]').focus();
				return;
			}
	
			if(!$.isNumeric($('input[name=examTime]').val())){
				alert('제한시간은 숫자만 입력가능합니다.');			
				$('input[name=examTime]').focus();
				return;
			}
			 
			var chklen2 = $('input:radio[name=examType]:checked').length;
			 
		 	if(chklen2 < 1 ){
				alert('시험 유형을 선택해주세요.');
				return ;
			} 
		 	
			var chklen = $('input:radio[name=pubType]:checked').length;
			 
		 	if(chklen < 1 ){
				alert('출제 유형을 선택해주세요.');
				return ;
			}
		 	
		 	if(openYnVal == 'Y'){
		 	    /* 	
		 	    if( Number($('input[name=eval]').val()) > Number($('input[name=pscore]').val())  ){
		        	 alert('남은 배정 점수를 초과하였습니다.' +  Number($('input[name=eval]').val()) + ' > ' + Number($('input[name=pscore]').val())  );
		        	 $('input[name=eval]').focus();
					return;
	 			}
		 	    */
		 		/*
		 		<c:if test="${empty subListData}">
		 			alert(  '출제 문제가 없습니다.');
		 			return false;
		 		</c:if>
		 		*/
		 	}
		 		   
			// 랜덤방식 저장 일 경우...
			if($(':input:radio[name=pubType]:checked').val() == 'R'){
				var xhtml = "";
				if($('#secTitle0').val() != undefined){
					$('#sectionAreaEmp div table tbody tr').each(function(i){
						xhtml += '<input type="hidden" id="secNos" name="secNos" value="'+$("#secNo"+i).val()+'" />'; // 출제 정책 코드 (PK)
						xhtml += '<input type="hidden" id="secTitles" name="secTitles" value="'+$("#secTitle"+i).val()+'" />'; //
						xhtml += '<input type="hidden" id="descriptions" name="descriptions" value="'+$("#description"+i).val()+'" />'; //
						xhtml += '<input type="hidden" id="allots" name="allots" value="'+$("#allot"+i).val()+'" />'; //
						xhtml += '<input type="hidden" id="totalQnums" name="totalQnums" value="'+$("#totalQnum"+i).val()+'" />'; //
						xhtml += '<input type="hidden" id="leUseYns" name="leUseYns" value="'+$("#leUseYn"+i+" option:selected").val()+'" />'; //
					});

					$("form[name=examForm]").append(xhtml);
				}

				/*
				if( Number($("#totalQnum"+i).val() > Number($("#exCnt"+i).val())) ){
					alert('응시문제수가 등록 문제수보다 많습니다.');  
					return;
				}  
				*/
				
				var checkExCnt = ''; 
				var checkExCntIdx = ''; 
				$('#sectionAreaEmp div table tbody tr').each(function(i){
					if( Number($('#totalQnum'+i).val() > Number($('#exCnt'+i).val())) ){
						checkExCnt = 'N';
						checkExCntIdx = i;
						return;
					}
				});
				
				if(checkExCnt=='N'){
					alert('응시문제수가 등록 문제수보다 많습니다.');  
					$('#totalQnum'+checkExCntIdx).focus();
					return;
				}
			//세트 방식 저장 일 경우...	
			} else if($(':input:radio[name=pubType]:checked').val() == 'S'){
				
			}
			
			$('#openYn').val(openYnVal);
			$('#examForm').attr('method', 'post').attr('target', '_cm').attr('action', '/classdesk/tutor/exam/exec.do').submit();
		}
	
		
		
		/**************************************************
		 함수명 : fnList
		 설 명 : 페이징 이동 함수
		***************************************************/ 
		function fnList() {
			$('#examForm').attr('target', '_self').attr('action', '/classdesk/tutor/exam/list.do').submit();
		}
		
		
		
		function fnDetail(examNo){
			$('#examForm > input[name="examNo"]').val(examNo);   
			$('#examForm').attr('method', 'post').attr('target', '_self').attr('action', '/classdesk/tutor/exam/form.do').submit();
		}
		
		
		/**************************************************
		 함수명 : fnExamSetList
		 설 명 : 세트문제설정
		***************************************************/ 
		function fnExamSetList(){
			$('form[name=examForm]').attr('method', 'post').attr('action', '/classdesk/tutor/quizset/list.do').submit();
		}
		
		/**************************************************
		 함수명 : fnPopBinder
		 설 명 : 바인더 시험 목록 조회
		***************************************************/
		function fnPopBinder(){
 			 $('#popFrm > input[name="searchMode"]').val('D');  
			 $('#popFrm')
				.attr('action', '/classdesk/tutor/quizbinder/search_list.do')
				.attr('method', 'post') 
				.attr('target', '_cm');
			 SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop2', 'width=1000, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
			 $('input:radio[name="pubType"]:radio[value="B"]').attr('checked',true);
		}
		
		/**************************************************
		 함수명 : fnBinderDumpExec
		 설 명 : 바인더 등록
		***************************************************/
		function fnBinderDumpExec(){
			$('#openYn').val('N');	// 임시 저장 상태로 저장. 
			$('#examForm').attr('method', 'post').attr('target', '_cm').attr('action', '/classdesk/tutor/quizbinder/dump_exec.do').submit();	
 		 }
		
		
		/**************************************************
		 함수명 : fnPopFrm
		 설 명 : 바인더 문제 추가/수정
		***************************************************/
		function fnPopFrm(qNo){
			$('#popFrm > input[name="qno"]').val(qNo);  
			$('#popFrm')
				.attr('action', '/classdesk/tutor/quizbinder/q_form.do')
				.attr('method', 'post') 
				.attr('target', '_cm');
			SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		}
		
		
		// 문제삭제
		function fnDel(seq){
			var answer = confirm ('삭제하시겠습니까?');
			if(answer){
				$('#popFrm > input[name="seq"]').val(seq);  
				$('#popFrm').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/tutor/quizbinder/q_del_exec.do').submit();
			} else {
			    return false;
			}
		}
		
		/**************************************************
		 함수명 : fnExamDel
		 설 명 : 시험정보 전체 삭제
		***************************************************/ 
		function fnExamDel() {
			if(confirm('시험 정보가 전체 삭제됩니다.\n계속 하시겠습니까?')){
				$('#examForm').attr('target', '_cm').attr('method', 'post').attr('action', '/classdesk/tutor/exam/del_exec.do').submit();	
			} 
		}
		
		/**************************************************
		 함수명 : fnPopFrm
		 설 명 : 바인더 문제 추가/수정
		***************************************************/
		function fnViewFrm(qNo){
			 $('#popFrm > input[name="qno"]').val(qNo);  
			 $('#popFrm')
				.attr('action', '/classdesk/tutor/quizset/q_view.do')
				.attr('method', 'post') 
				.attr('target', '_cm');
			 SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		}
		
	
		/**************************************************
		 함수명 : fnChangUseYn
		 설 명 : 상시 문제 사용여부 수정 
		***************************************************/
		function fnChangUseYn(qNo, ptype, v){
			 var qno = qNo;
			 var type = ptype;
			 var useYn = v; 

			 $('#openAForm > input[name="openPubeType"]').val(type);  
			 $('#openAForm > input[name="useYn"]').val(useYn);  
			 $('#openAForm > input[name="qno"]').val(qno);   
 			 $('#openAForm').attr('target', '_cm').attr('method', 'post').attr('action', '/classdesk/tutor/exam/q_use_exec.do').submit();	
		}
		
		function fnQuizDetail(examNo){
			alert('수정되었습니다.');
			$('#examForm > input[name="examNo"]').val(examNo);   
			$('#examForm').attr('method', 'post').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/form.do').submit();
		}
		
		function setListChang(s, a){ 
			var sno = s;
			var atype = a;
			SANGS.Util.ajax('/classdesk/tutor/exam/ajaxSetList.do', {setno : sno, addObject : atype}, 'html', eval('fnSucces'));
 		}
		

		function bndListChang(examNo, a){
			var atype = a;
			$('#examForm > input[name="examNo"]').val(examNo);   
			$('#examForm > input[name="addObject"]').val(atype);   
			$('#examForm').attr('method', 'post').attr('target', '_self').attr('action', '/classdesk/tutor/exam/form.do').submit();
		}
		
	
	</script>

