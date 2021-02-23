<%
/****************************************************
	system	: 나의강의 > 강의이력
	title	: 특강 상세
	summary	:	
	wdate	: 2016-09-22
	writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$.datepicker.setDefaults({
	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	changeMonth: true,
		changeYear: true,
		showMonthAfterYear: true,
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	dateFormat: 'yy-mm-dd'
}); 

$(function() {
	$("div[id^='multiEduSdateHour']").numeric();
	$('#multiEduDate1').datepicker({dateFormat: 'yy-mm-dd'});
});

//날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
	var dateFormat={
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showMonthAfterYear: true, //연월 순서로 보여줌
		changeMonth: true, //월을 셀렉트박스로 표현
		changeYear: true, //년을 셀렉트박스로 표현
		dateFormat: "yy-mm-dd",
		changeMonth: true,   
		changeYear: true,	
		yearRange: "2014:2025"
	};	
	
	$(document).ready(function(){
		// 달력
		$("#input_id3").datepicker(dateFormat);
		$("#input_id3").datepicker(dateFormat);
	});

	//우편번호찾기
	function zipSearch(){
		window.open("/academy/common/common/post.do","post_pop", "width=750,height=650, scrollbars=YES");
	}
	
	//우편번호 콜백 스크립트
	function fnZipCodePopupCallBack(data){
	 	var zipCodes = data.zip_code.split('-');
	 	$('#applyOrganZipno').val(data.zip_code);
	 	$('#applyOrganAddr').val(data.adres);
	 	$('#applyOrganAddr2').focus();
	}

	
$(document).ready(function() {
	
	// 강의계획서파일 업로드체크
	$( "#uploadFile1" ).click(function() {
		if($("#imgCheck1").length > 0){
			if(confirm('첨부 파일은 하나만 등록할 수 있습니다. 기존의 파일을 삭제 후 수정 하시겠습니까?')){
				$("#qu").val("update");
				$("#myTutorFileCode").val("update");
				
			}
		}
	});
	
	//강의교안파일 업로드체크
	$( "#uploadFile2" ).click(function() {
		if($("#imgCheck2").length > 0){
			if(confirm('첨부 파일은 하나만 등록할 수 있습니다. 기존의 파일을 삭제 후 수정 하시겠습니까?')){
				$("#qu").val("update");
				$("#myTutorFileCode").val("update");
			}
		}
	});
	
	//설문파일 업로드체크
	$( "#uploadFile3" ).click(function(tt) {
		if($("#imgCheck3").length > 0){
			if(confirm('첨부 파일은 하나만 등록할 수 있습니다. 기존의 파일을 삭제 후 수정 하시겠습니까?')){
				$("#qu").val("update");
				$("#myTutorFileCode").val("update");
			}
		}
	});
});

//팝업
function deleteReportFile(mtTutorFileCode , slno , sltno , saveFile , saveFilePath){
	$('#qu').val('delete');
	$('#mtTutorFileCode').val(mtTutorFileCode);
	$('#slno').val(slno);
	$('#sltno').val(sltno);
	$('#saveFile').val(saveFile);
	$('#saveFilePath').val(saveFilePath);
	$('#layer_02').css('display' , 'block');
}

//삭제
function deleteFile(){
	$('#frm').attr('action', '/academy/tutor/deleteLectureCommitteeInfo.do').submit();
}

function fnSave(qu) {
	var form = document.frm;
	var mod = $("#tabNo").val();
	// 삭제 대상 첨부파일 번호 set
	//form.delCheckFile.value = "";

	/* if(form.delFileChk) {
		if(!form.delFileChk.length) {
			 if(form.delFileChk.checked)
				 form.delCheckFile.value = form.delFileChk.value;
		} else {
			for(var i = 0 ; i < form.delFileChk.length; i++) {
				if(form.delFileChk[i].checked)
					form.delCheckFile.value = form.delCheckFile.value + form.delFileChk[i].value + ",";
			}
		}
	} */
	if(mod == '3'){
		form.mod.value = "persnal";
	}else if(mod == '2'){
		form.mod.value = "committe";
	}
	var checkLength = $("input:checkbox[name=eduFacCodeArr]:checked").length ; 
	frm.checkLength.value = checkLength;
	form.qu.value = qu;
	$("#frm").attr("action", "/academy/tutor/lectureExec.do"); 
	form.submit();
} 

function entrstClickEvt(entrstYear){
	$('#entrstYear').val(entrstYear);
	$("#frm").attr("action", "/academy/tutor/lectureDetail.do").submit();
}

//탭이동
function fnTab(url, tabNo) {
	$("#tabNo").val(tabNo);
	$("#qu").val('');
	$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
}


var cnt = 1;
function fnAdd() {
	if (cnt > 8) {
		alert("교육일시는 9개까지 등록 가능합니다.");
		return;
	}
	
	cnt ++;
	
	var str = "";

	str = str + "  <div class='calendar-wrap' id='eduDate_"+cnt+"'>";
	str = str + "	<div class='input-wrap mb-c'>";
	str = str + "		<span class='calendar-box'>";
	str = str + "			<input type='text' name='multiEduDate' id='multiEduDate"+cnt+"' title='날짜선택' class='inputtxt small'>";
	str = str + " 			<label class='btn-calendar' for='multiEduDate"+cnt+"' ></label>";			
	str = str + "		</span>";
	str = str + "		<span class='span-block'>";
	str = str + "			<div class='sub-select' id='select_container2'>";
	str = str + "				<select name='multiEduSdateHour' id='multiEduSdateHour"+cnt+"'  title='교육시작 시간'>";
	str = str + "					<c:forEach var='sh' begin='0' end='24' step='1'>";
	str = str + "					<c:if test='${sh < 10}'><c:set var='sh'>0${sh}</c:set></c:if>";
	str = str + "					<option value='<c:out value='${sh}' />'><c:out value='${sh}' /></option>";
	str = str + "					</c:forEach>";
	str = str + "				</select>";
	str = str + "			</div>";
	str = str + "			<span class='hyphen'>:</span>";
	str = str + "			<div class='sub-select' id='select_container3'>";
	str = str + "				<select name='multiEduSdateMinute' id='multiEduSdateMinute"+cnt+"' title='교육시작 분'>";
	str = str + "					<c:forEach var='sh' begin='0' end='59' step='1'>";
	str = str + "					<c:if test='${sh < 10}'><c:set var='sh'>0${sh}</c:set></c:if>";
	str = str + "					<option value='<c:out value='${sh}' />'><c:out value='${sh}' /></option>";
	str = str + "					</c:forEach>";
	str = str + "				</select>";
	str = str + "			</div>";
	str = str + "			<span class='hyphen'>~</span>";
	str = str + "		</span>";
    
	str = str + "		<span class='span-block'>";
	str = str + "			<div class='sub-select' id='select_container4'>";
	str = str + "				<select name='multiEduEdateHour' id='multiEduEdateHour"+cnt+"' title='교육시작 시간'>";
	str = str + "					<c:forEach var='sh' begin='0' end='24' step='1'>";
	str = str + "					<c:if test='${sh < 10}'><c:set var='sh'>0${sh}</c:set></c:if>";
	str = str + "					<option value='<c:out value='${sh}' />'><c:out value='${sh}' /></option>";
	str = str + "					</c:forEach>";
	str = str + "				</select>";
	str = str + "			</div>";
	str = str + "			<span class='hyphen'>:</span>";
	str = str + "			<div class='sub-select' id='select_container5'>";
	str = str + "				<select name='multiEduEdateMinute' id='multiEduEdateMinute"+cnt+"' title='교육시작 분'>";
	str = str + "					<c:forEach var='sh' begin='0' end='59' step='1'>";
	str = str + "					<c:if test='${sh < 10}'><c:set var='sh'>0${sh}</c:set></c:if>";
	str = str + "					<option value='<c:out value='${sh}' />'><c:out value='${sh}' /></option>";
	str = str + "					</c:forEach>";
	str = str + "				</select>";
	str = str + "			</div>";
	str = str + "			<span class='timebtn'>";
	str = str + "				<button onclick='fnAdd(); return false;' class='scale-up' title='시간늘림'>시간늘림</button>";
	str = str + "				<button onclick='fnDel("+cnt+"); return false;' class='scale-down' title='시간축소'>시간축소</button>";
	str = str + "			</span>";
	str = str + "		</span>";
	str = str + "	</div>";
	
	str = str + "</div>";
	str = str + "<script type=\'text/javascript\'>$(\'#multiEduDate"+cnt+"\').datepicker({dateFormat: \'yy-mm-dd\'});</"+"script>";
	str = str + "<script type=\'text/javascript\'>$(\'.sub-select\').jqTransform();</"+"script>";
 
    $(".td-input-wrap").append(str);
    
    $("#eduDate_"+cnt).show();
    $("#cnt").val(cnt);
}


function fnDel(val) {
	if (cnt == 1) {
		alert("더이상 삭제하실 수 없습니다.");
		return;
	}
	
	var row = $("#eduDate_"+val);
	row.fadeOut("fast", function()
	{
		cnt--;
		row.remove();
		$("#cnt").val(cnt);
	});
}

function fnPopUp(){
	$('#layer_04').css('display' , 'block');
}
</script>

<div class="contents-wrap f401">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>강사공간</span></li>
				<li class="location"><span>강사정보관리</span></li>
			</ul>

			<div class="sub-tit">
				<h3>강사정보관리</h3>
				<p>상상스토리 위촉강사들의 정보를 관리할 수 있는 공간입니다.</p>
			</div>

			<div class="contents" id="sContents">
				<!-- 본문 > 메인 > 목록 시작  -->
				<form name="frm" id="frm" action="/academy/tutor/lectureExec.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="slno" value="<c:out value="${REQUEST_DATA.slno}"/>"/>
				<input type="hidden" name="sltno" value="<c:out value="${REQUEST_DATA.sltno}"/>"/>
				<input type="hidden" name="tabNo" id="tabNo" value="${REQUEST_DATA.tabNo}"/>
				<input type="hidden" name="lecUserno" id="lecUserno" value=""/>
				<input type="hidden" name="userno" id="userno" value="${REQUEST_DATA.userno}"/>
				<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
				<input type="hidden" name="delCheckFile" value=""/>
				<input type="hidden" name="qu" id="qu" value=""/>
				<input type="hidden" name="mod" id="mod" value=""/>
				<input type="hidden" name="myTutorFileCode" id="myTutorFileCode" value=""/>
				<input type="hidden" name="mtScCode" id="mtScCode" value="${REQUEST_DATA.mtScCode }"/>
				<input type="hidden" name="saveFile" id="saveFile" value=""/>
				<input type="hidden" name="tutorHisYn" id="tutorHisYn" value="${REQUEST_DATA.tutorHisYn }"/>
				<input type="hidden" name="filename" id="filename" value=""/>
				<input type="hidden" name="ftype" id="ftype" value=""/>
				<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
				<input type="hidden" name="lecturedown" id="lecturedown" value=""/>
				<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
				<input type="hidden" name="checkLength" id="checkLength" value=""/>
				<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
				<input type="hidden" name="mtFieldCode" id="mtFieldCode" value="${REQUEST_DATA.mtFieldCode }"/>
				
				<div class="tabArea">
					<ul class="tabMenu type02">
						<li class="tab0 <c:if test="${REQUEST_DATA.tabNo == 0}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 0}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureDetail.do', '0'); return false;"><span class="all"><em>정보 관리</em></span></a></li>
						<li class="tab1 <c:if test="${REQUEST_DATA.tabNo == 1}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 1}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureHisList.do', '1'); return false;"><span class="area1"><em>경력 관리</em></span></a></li>
						<li class="tab3 <c:if test="${REQUEST_DATA.tabNo == 3}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 3}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lecturePersonalList.do', '3'); return false;"><span class="area3"><em>방문교육 강의이력</em></span></a></li>
						<li class="tab2 <c:if test="${REQUEST_DATA.tabNo == 2}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 2}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureCommitteeList.do', '2'); return false;"><span class="area2"><em>정규교육 강의이력</em></span></a></li>
					</ul>
					<div class="tabCon" id="tab-con03">
						<h3 class="con-tit">신청정보${map}</h3>
						<div class="con-tbl">
							<table class="sub-table">
								<caption>강의이력,신청정보-지역,특강명,교육장소,교육일시,교육시간,교육대상,인원,신청기관,신청기관 소재지,교육시설,강의료,신청자,신청자연락처,이메일,신청일시,기타내용을 설명</caption>
								<colgroup>
									<col style="">
									<col style="">
								</colgroup>
								<tbody>
									<c:if test="${REQUEST_DATA.tutorHisYn eq 'N' }">
										<tr>
											<th scope="row">지역</th>
											<td><c:out value="${map.MT_AREA_NAME}"/></td>
										</tr>
										<c:if test="${map.MT_SC_CODE == 'SC0006'}">
								        <tr>
								            <th>특강명</th>
								            <td colspan="3"><c:out value="${map.TITLE}"/></td>
								        </tr>
								        </c:if>
										<tr>
											<th scope="row">교육장소</th>
											<td><c:out value="${map.EDU_AREA}"/></td>
										</tr>
										<tr>
											<th scope="row" class="va-t">교육일시</th>
											<td>
												<ul>
													<c:forEach var="time" items="${timeList}">
													<li>${time.EDU_DATE} ${time.EDU_SDATE_HOUR}:${time.EDU_SDATE_MINUTE} ~ ${time.EDU_EDATE_HOUR}:${time.EDU_EDATE_MINUTE} </li>
													</c:forEach>
												</ul>
											</td>
										</tr>
										<tr>
											<th scope="row">교육시간</th>
											<td><c:out value="${map.EDU_TIME}"/>시간</td>
										</tr>
										<tr>
											<th scope="row">교육대상</th>
											<td>
												<c:if test="${map.MT_SC_CODE == 'SC0005'}">
									            	<c:out value="${map.EDU_TARGET}"/> 학년
									            </c:if>
									            <c:if test="${map.MT_SC_CODE != 'SC0005'}">
									            	<c:out value="${map.EDU_TARGET}"/>
									            </c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">인원</th>
											<td>
												<c:out value="${map.PERSON_CNT}"/> 명
											</td>
										</tr>
										<tr>
											<th scope="row">신청기관</th>
											<td><c:out value="${map.APPLY_ORGAN_NM}"/></td>
										</tr>
										<tr>
											<th scope="row">신청기관 소재지</th>
											<td><c:out value="${map.APPLY_ORGAN_ADDR}"/></td>
										</tr>
										<tr>
											<th scope="row">교육시설</th>
											<td>
								            	<c:if test="${map.SLTNO ne null}">
									            	<c:set var="eduFacArr" value="${fn:split(map.EDU_FAC_CODE,',')}"/>
									                <c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
														<c:forEach var="i" begin="0" end="${fn:length(eduFacArr)}">
															<c:if test="${data.MT_SUB_CODE eq eduFacArr[i]}">
																<div class="input-add">
																	<span class="chk-wrap">
																		<span class="checks">		
																			<input type="checkbox" id="eduFacCodeArr" name="eduFacCodeArr" ckcount=${status.count} checked="checked" value="${data.MT_SUB_CODE}" /> 
																			<label for="eduFacCodeArr"> ${data.MT_SUB_NAME}</label>
																		</span>	
																	</span>
																</div>	
															</c:if>
														</c:forEach>
													</c:forEach>
												</c:if>
												<c:if test="${map.SLTNO eq null}">
													<c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
														<span class="checks">
															<input type="checkbox" id="eduFacCodeArr${status.count}" name="eduFacCodeArr" ckcount=${status.count} value="${data.MT_SUB_CODE}" /> ${data.MT_SUB_NAME}&nbsp;
															<c:if test="${data.MT_SUB_CODE eq 'FA07'}">( <input type="text" name="eduFacContent"  id="eduFacContent"  value="<c:out value="${map.EDU_FAC_CONTENT}"/>"   class="inputtxt small"/> )</c:if>&nbsp;
															<label for="eduFacCodeArr${status.count}"></label>
														</span>
													</c:forEach>
												</c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">강의료</th>
											<td><fmt:formatNumber value="${map.LEC_PAY}" pattern="#,###" />원</td>
										</tr>
										<tr>
											<th scope="row">신청자</th>
											<td><c:out value="${map.APPLY_NM}"/></td>
										</tr>
										<tr>
											<th scope="row">신청자 연락처</th>
											<td><c:out value="${map.APPLY_PHONE}"/></td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td><c:out value="${map.APPLY_EMAIL}"/></td>
										</tr>
										<tr>
											<th scope="row">신청일시</th>
											<td><c:out value="${map.REGDATE}"/></td>
										</tr>
										<tr>
											<th scope="row">기타내용</th>
											<td>
												<div class="tarea-wrap">
													<textarea name="etc" id="etc" cols="30" rows="10" title="기타내용 입력" class=""><c:out value="${map.ETC}"/></textarea>
												</div>
											</td>
										</tr>
									</c:if>
									<c:if test="${REQUEST_DATA.tutorHisYn eq 'Y' }">
										<%-- <tr>
								            <th>지역</th>
								            <td>
								            	<div class="sub-select medium" id="select_container">
								                <select name="mtAreaCode" id="mtAreaCode" title="지역"  onchange="fnChangeArea(this.value);">
								                    <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
														<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${map.MT_AREA_CODE ne null && emap2.MT_SUB_CODE eq map.MT_AREA_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
													</c:forEach>
								                </select>
								                </div>
								            </td>
										</tr> --%>
										<c:if test="${map.MT_SC_CODE == 'SC0006'}">
								        <tr>
								            <th>특강명</th>
								            <td colspan="3"><c:out value="${map.TITLE}"/></td>
								        </tr>
								        </c:if>
								        <tr>
											<th scope="row" class="va-t"><label for="input_place">교육장소<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
											<td><input type="text" id="eduArea" name="eduArea" class="inputtxt large" title="교육장소입력" value="<c:out value="${map.EDU_AREA}"/>"></td>
										</tr>
										<tr>
											<th scope="row" class="va-t">교육일시<span class="mark">*<em class="hidden">필수항목</em></span></th>
											<td class="td-input-wrap">
												<div class="calendar-wrap" id="eduDate_1">
												<div class="input-wrap mb-c">
													<span class="calendar-box">
															<input type="text" name="multiEduDate" id="multiEduDate1" title="날짜선택" class="inputtxt small" value="${timeInfo.EDU_DATE}">
															<label class="btn-calendar" for="multiEduDate1" ></label>
													</span>
													<span class="span-block">
														<div class="sub-select" id="select_container2">
															<select name="multiEduSdateHour" id="multiEduSdateHour1"  title="교육시작 시간">
																<c:forEach var="sh" begin="0" end="24" step="1">
																<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
																<option value="<c:out value='${sh}' />" <c:if test="${timeInfo.EDU_SDATE_HOUR eq sh}">selected="selected"</c:if> ><c:out value="${sh}" /></option>
																</c:forEach>
															</select>
														</div>
														<span class="hyphen">:</span>
														<div class="sub-select" id="select_container3">
															<select name="multiEduSdateMinute" id="multiEduSdateMinute1" title="교육시작 분">
																<c:forEach var="sh" begin="0" end="59" step="1">
																<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
																<option value="<c:out value='${sh}' />" <c:if test="${timeInfo.EDU_SDATE_MINUTE eq sh}">selected="selected"</c:if> ><c:out value="${sh}" /></option>
																</c:forEach>
															</select>
														</div>
														<span class="hyphen">~</span>
													</span>
													
													<span class="span-block">
														<div class="sub-select" id="select_container4">
															<select name="multiEduEdateHour" id="multiEduEdateHour1" title="교육시작 시간">
																<c:forEach var="sh" begin="0" end="24" step="1">
																<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
																<option value="<c:out value='${sh}' />" <c:if test="${timeInfo.EDU_EDATE_HOUR eq sh}">selected="selected"</c:if> ><c:out value="${sh}" /></option>
																</c:forEach>
															</select>
														</div>
														<span class="hyphen">:</span>
														<div class="sub-select" id="select_container5">
															<select name="multiEduEdateMinute" id="multiEduEdateMinute1" title="교육시작 분">
																<c:forEach var="sh" begin="0" end="59" step="1">
																<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
																<option value="<c:out value='${sh}' />" <c:if test="${timeInfo.EDU_EDATE_MINUTE eq sh}">selected="selected"</c:if> ><c:out value="${sh}" /></option>
																</c:forEach>
															</select>
														</div>
														<span class="timebtn">
															<button onclick="fnAdd();return false;" class="scale-up" title="시간늘림">시간늘림</button>
															<button onclick="fnDel(1);return false;" class="scale-down" title="시간축소">시간축소</button>
														</span>
													</span>
												</div>
												
											</div>
											</td>
										</tr>
										<tr>
											<th scope="row"><label for="input_id4">교육시간<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
											<td><input type="text" id="eduTime" name="eduTime" class="inputtxt small" title="교육시간입력" value="<c:out value="${map.EDU_TIME}"/>"> 시간</td>
										</tr>
										<tr>
											<th scope="row"><label for="input_id5">교육대상<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
											<td><input type="text" id="eduTarget" name="eduTarget" class="inputtxt large" title="교육대상입력" value="<c:out value="${map.EDU_TARGET}"/>"> </td>
										</tr>
										<tr>
											<th scope="row" class="va-t">인원<span class="mark">*<em class="hidden">필수항목</em></span></th>
											<td><input type="text" style="width:50%" id="personCnt" name="personCnt" class="inputtxt small" title="인원입력" value="<c:out value="${map.PERSON_CNT}"/>"> 명</td>
										</tr>
										<tr>
											<th scope="row">신청기관<span class="mark">*<em class="hidden">필수항목</em></span></th>
											<td><input type="text" class="inputtxt large" name="applyOrganNm" id="applyOrganNm" value="<c:out value="${map.APPLY_ORGAN_NM}"/>"/></td>
										</tr>
										<tr>
											<th scope="row" class="va-t">신청기관 소재지<span class="mark">*<em class="hidden">필수항목</em></span></th>
											<td>
												<div class="">
														<div class="input-wrap">
															<input type="text" id="applyOrganZipno" name="applyOrganZipno" class="inputtxt small" title="우편번호" value="<c:out value="${map.APPLY_ORGAN_ZIPNO}"/>">
															<input type="button"  onclick="zipSearch(); return false;" class="btn-submit small" value="주소검색">
														</div>
														<div class="input-wrap m-b">
															<input type="text" id="applyOrganAddr" name="applyOrganAddr" class="inputtxt medium2" title="상세 주소입력" value="<c:out value="${map.APPLY_ORGAN_ADDR }"/>"><input type="text" id="applyOrganAddr2" name="applyOrganAddr2" class="inputtxt small2" title="상세 주소입력" value="<c:out value="${map.APPLY_ORGAN_ADDR2}"/>">
														</div>
														<!-- <div class="input-wrap mobile">
															<input type="text" id="adress3" class="inputtxt large" title="상세주소2">// mobile
														</div> -->
												</div>
											</td>
										</tr>
										<tr>
										
											<th scope="row">교육시설</th>
											<td>
								            	<c:if test="${map.SLTNO ne null}">
									            	<c:set var="eduFacArr" value="${fn:split(map.EDU_FAC_CODE,',')}"/>
									                <c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
									                	<c:forEach var="i" begin="0" end="${fn:length(eduFacArr)}">
															<c:if test="${data.MT_SUB_CODE eq eduFacArr[i]}">
																<span class="chk-wrap">
																	<span class="checks">
																		<input type="checkbox" id="eduFacCodeArr${status.count}" name="eduFacCodeArr" ckcount=${status.count} checked="checked" value="${data.MT_SUB_CODE}" />
																		<c:if test="${data.MT_SUB_CODE eq 'FA07'}">( <input type="text" name="eduFacContent"  id="eduFacContent"  value="<c:out value="${map.EDU_FAC_CONTENT}"/>"   class="inputtxt small"/> )</c:if>&nbsp;
																		<label for="eduFacCodeArr${status.count}"> ${data.MT_SUB_NAME}&nbsp;</label>
																	</span>	
																</span>
															</c:if>
														</c:forEach>	
													</c:forEach>
												</c:if>
												<c:if test="${map.SLTNO eq null}">
													<c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
														<input type="checkbox" id="eduFacCodeArr" name="eduFacCodeArr" ckcount=${status.count} value="${data.MT_SUB_CODE}" /> ${data.MT_SUB_NAME}&nbsp;
														<c:if test="${data.MT_SUB_CODE eq 'FA07'}">( <input type="text" name="eduFacContent"  id="eduFacContent"  value="<c:out value="${map.EDU_FAC_CONTENT}"/>"   class="inputtxt small"/> )</c:if>&nbsp;
													</c:forEach>
												</c:if>
											</td>
										</tr>
										<%-- <tr>
											<th scope="row"><label for="input_price">강의료<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
											<td><input type="text" style="width:50%" id="lecPay" name="lecPay" class="inputtxt small" title="강사료입력" value="<fmt:formatNumber value="${map.LEC_PAY}" pattern="#,###" />"> 원</td>
										</tr> --%>
										<tr>
											<th scope="row"><label for="input_id7">신청자</label></th>
											<td><input type="text" id="applyNm" name="applyNm" class="inputtxt large" title="신청차입력" value="<c:out value="${map.APPLY_NM}"/>"></td>
										</tr>
										<tr>
											<th scope="row">신청자 연락처</th>
											<td>
												<div class="sub-select" id="select_container7">
													<select id="firstPhone" name="firstPhone" title="전화번호 앞자리선택">
														<option value="010">010</option>
				                                        <option value="011">011</option>
				                                        <option value="016">016</option>
				                                        <option value="017">017</option>
				                                        <option value="018">018</option>
				                                        <option value="019">019</option>
													</select>
												</div><span class="hyphen">-</span>
												<input type="text" id="secondPhone" name="secondPhone" title="전화번호 중간자리" class="inputtxt short" value="${REQUEST_DATA.phone1}"><span class="hyphen">-</span>
												<input type="text" id="thirdPhone" name="thirdPhone" title="전화번호 마지막자리" class="inputtxt short" value="${REQUEST_DATA.phone2}">
											</td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td>
												<input type="text" id="applyEmail" name="applyEmail" class="inputtxt large" title="신청차 연락처 입력" value="<c:out value="${map.APPLY_EMAIL}"/>">
											</td>
										</tr>
										<tr>
											<th scope="row">신청일시</th>
											<td><c:out value="${map.REGDATE}"/></td>
										</tr>
										<tr>
											<th scope="row">기타내용</th>
											<td>
												<div class="tarea-wrap">
													<textarea name="etc" id="etc" cols="30" rows="10" title="기타내용 입력" class=""><c:out value="${map.ETC}"/></textarea>
												</div>
											</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>

						<h3 class="con-tit">특강 정보 입력</h3>
						<div class="con-tbl">
							<table class="sub-table">
								<caption>나의공간 특강정보 테이블,강사,강의계획서,강의교안,설문,기타정보를 소개</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										
										<th scope="row">강사</th>
										<td><c:out value="${REQUEST_DATA.SES_USERNAME}"/></td>
									</tr>
									<tr>
										<th scope="row">강의교안</th>
										<td>
							            	<c:forEach items="${fileList}" var="result" varStatus="status">
							            		<c:if test="${map.SLTNO ne null && result.MT_TUTOR_FILE_CODE eq 'TF0001' }">
							            		<c:set value="${status.count}" var="file1"/>
								            		<div class="file-wrap ta-l">
															<p class="file_txt">
															<span class="txt_sky link"><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</span>
															<button onclick="deleteReportFile('<c:out value="${result.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${result.SLNO}"/>' , '<c:out value="${result.SLTNO}"/>' , '<c:out value="${result.SAVFILE}"/>' , '<c:out value="${result.SAVPATH}"/>');return false"  class="btn-del_2" title="삭제">삭제</button>
														</p>
													</div>	
							            		</c:if>
							            	</c:forEach>
							            	<c:if test="${file1 == null}">
								            	<div style="float: left;" class="file-wrap ta-l">
													<input type="text" id="fileName1" class="inputtxt size2" readonly="readonly">
													<div class="file_input_div">
													  <input type="button" value="불러오기" class="btn-m gray">
													  <input type="file" name="uploadFile1" id="uploadFile1" class="file_input_hidden" onchange="javascript: document.getElementById('fileName1').value = this.value">
													</div>
												</div>
											</c:if>
											<!-- <input type="file" name="uploadFile1" id="uploadFile1" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/> -->
										</td>
									</tr>
									<tr>
										<th scope="row">강의계획서</th>
										<td>
							            	<c:forEach items="${fileList}" var="result" varStatus="status">
							            		<c:if test="${map.SLTNO ne null && result.MT_TUTOR_FILE_CODE eq 'TF0002' }">
							            		<c:set value="${status.count}" var="file2"/>
							            		<div class="file-wrap ta-l">
														<p class="file_txt">
														<span class="txt_sky link"><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</span>
														<button onclick="deleteReportFile('<c:out value="${result.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${result.SLNO}"/>' , '<c:out value="${result.SLTNO}"/>' , '<c:out value="${result.SAVFILE}"/>' , '<c:out value="${result.SAVPATH}"/>');return false" class="btn-del_2" title="삭제">삭제</button>
													</p>
												</div>	
							            		<%-- <input type="checkbox" name="delFileChk" value='<c:out value="${result.FILENO}"/>' />
							            		<a href="#" name="imgCheck2" id="imgCheck2" onclick="filedown('<c:out value="${result.SAVFILE}"/>');"><c:out value="${result.ORGFILE}"/></a>(<c:out value="${result.FSIZE}"/> KB) --%>
							            	</c:if>
							            	</c:forEach>
							            	<c:if test="${file2 == null}">
								            	<div style="float: left;" class="file-wrap ta-l">
													<input type="text" id="fileName2" class="inputtxt size2" readonly="readonly">
													<div class="file_input_div">
													  <input type="button" value="불러오기" class="btn-m gray">
													  <input type="file" name="uploadFile2" id="uploadFile2" class="file_input_hidden" onchange="javascript: document.getElementById('fileName2').value = this.value">
													</div>
												</div>
											</c:if>
											<!-- <input type="file" name="uploadFile2" id="uploadFile2" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/> -->
										</td>
									</tr>
									<tr>
										<th scope="row">설문</th>
										<td>
							            	<c:forEach items="${fileList}" var="result" varStatus="status">
							            		<c:if test="${map.SLTNO ne null && result.MT_TUTOR_FILE_CODE eq 'TF0006' }">
							            		<c:set value="${status.count}" var="file3"/>
							            		<div class="file-wrap ta-l">
														<p class="file_txt">
														<span class="txt_sky link"><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</span>
														<button onclick="deleteReportFile('<c:out value="${result.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${result.SLNO}"/>' , '<c:out value="${result.SLTNO}"/>' , '<c:out value="${result.SAVFILE}"/>' , '<c:out value="${result.SAVPATH}"/>');return false"  class="btn-del_2" title="삭제">삭제</button>
													</p>
												</div>	
							            	</c:if>
							            	</c:forEach>
							            	<c:if test="${file3 == null}">
							            		<div class="file-wrap ta-l">
													<input type="text" id="fileName3" class="inputtxt size2" readonly="readonly">
													<div class="file_input_div">
													  <input type="button" value="불러오기" class="btn-m gray">
													  <input type="file" name="uploadFile3" id="uploadFile3" class="file_input_hidden" onchange="javascript: document.getElementById('fileName3').value = this.value">
													</div>
												</div>
							            	</c:if>
							            	
											<!-- <input type="file" name="uploadFile3" id="uploadFile3" style="width:400px;height:20px;background-color:white;border:1 solid #b7b7b7;"/> -->
										</td>
									</tr>
									<tr>
										<th scope="row">기타정보</th>
										<td>
											<div class="tarea-wrap">
												<textarea name="lecEtc" id="lecEtc" cols="30" rows="10" title="기타내용 입력" class=""><c:out value="${map.LEC_ETC}"/></textarea>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<ul class="btn-list">
							<c:choose>
							<c:when test="${pageMode == REQUEST_DATA.pageMode}">
						        <li><a href="#none" onclick="fnSave('insert'); return false;" class="btn signup">등록</a></li>
						    </c:when>
						    <c:otherwise>
						        <li><a href="#none" onclick="fnPopUp(); return false;" class="btn signup">수정</a></li>
						    </c:otherwise>
						    </c:choose>
						</ul>
						<div class="layer_popup" id="layer_04" style="display: none;">
							<div class="layer-tit">
								<p>수정</p>
								<button class="layer_close pop_close" onclick="return false;" title="확인">확인</button>
							</div>
							<div class="layer_bg bg4">
								<p>수정하시겠습니까?</p>
								<button class="btn-m pop_close" onclick="fnSave('update'); return false;" title="확인">확인</button>
							</div>
						</div>
						
						<div class="layer_popup" id="layer_02" style="display: none;">
							<div class="layer-tit">
								<p>삭제</p>
								<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
							</div>
							<div class="layer_bg bg2">
								<p>삭제하시겠습니까?</p>
								<button class="btn-m pop_close" onclick="deleteFile(); return false;" title="확인">확인</button>
							</div>
						</div>
					</div><!-- // tab3 -->
				</div>

				<p class="ar"><a href="#header" class="btn-top">TOP</a></p>
				</form>

			</div><!-- //contents-->

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->


	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->