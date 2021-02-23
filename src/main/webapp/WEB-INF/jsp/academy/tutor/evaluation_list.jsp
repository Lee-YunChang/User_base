<%
/****************************************************
	system	: 나의강의 > 평가 이력관리
	title	: 평가이력관리
	summary	:	
	wdate	: 2016-09-24
	writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

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


function entrstClickEvt(entrstYear){
	$('#entrstYear').val(entrstYear);
	$("#frm").attr("action", "/academy/tutor/evaluationList.do").submit();
}

function personalPopUp(){
	$('#layer_03').css('display' , 'block');
}

function personalInfo(mod){
	var form = document.frm;
	// 삭제 대상 첨부파일 번호 set
	$("#mtReportTypeCode").val("RP1000");
	$("#qu").val("insert");
	$("#mod").val(mod);
	$("#frm").attr("action", "/academy/tutor/reportInsertExec.do").submit();
}

//강의계획서다운로드
function fnFileDown(){
	var frm = document.fileDownFrm;
  	frm.target = '';
	frm.filepath.value = '';
	frm.orgfilename.value = '심사서류 양식.zip';
	frm.filename.value = '심사서류 양식.zip';
	frm.downType.value='sd';
	$('#fd_fileDownFrm').submit();
}

//파일다운로드
function filedown(fname,orgFile){
	$('#filename').val(encodeURIComponent(fname));
	$('#fileName').val(encodeURIComponent(orgFile));
	$('form[name=frm]').attr('action', '/academy/filedown.do').submit();
}
//탭이동
function fnTab(url, tabNo) {
	$("#tabNo").val(tabNo);
	$("#qu").val('');
	$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
}

//삭제 팝업
function deleteEvalFile(reportNo , mtTutorFileCode , userNo , mtReportTypeCode , saveFileNm , saveFilePath){
		$("#qu").val("delete");
		$("#mod").val("report");
		$("#reportNo").val(reportNo);
		$("#mtTutorFileCode").val(mtTutorFileCode);
		$("#userNo").val(userNo);
		$("#saveFileNm").val(saveFileNm);
		$("#saveFilePath").val(saveFilePath);
		$("#mtReportTypeCode").val(mtReportTypeCode);
		$('#layer_02').css('display' , 'block');
}

//삭제 실행
function deleteEvalFileExe(){
	$("#frm").attr('action', '/academy/tutor/deleteEvaluationInfo.do').submit();
}
function selectTitle(selectTitle){
	$("#entrstYear").val('');
	$("#frm").attr("action","/academy/tutor/evaluationList.do");
	$("#frm").submit();
}
</script>


<div class="contents-wrap c502">

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

					<form name="frm" id="frm" action="/academy/tutor/lectureHisList.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="userno" id="userno" value="${tutor[0].USERNO }"/>
					<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
					<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
					<input type="hidden" name="qu" id="qu" value=""/>
					<input type="hidden" name="mod" id="mod" value=""/>
					<input type="hidden" name="delCheckFile" id="delCheckFile" value=""/>
					<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
					<input type="hidden" name="reportdown" id="reportdown" value=""/>
					<input type="hidden" name="reportNo" id="reportNo" value=""/>
					<input type="hidden" name="filename" id="filename" value=""/>
					<input type="hidden" name="fileName" id="fileName" value=""/>
					<input type="hidden" name="reportNo" id="reportNo" value="${REQUEST_DATA.reportNo}"/>
					<input type="hidden" name="saveFileNm" id="saveFileNm" value=""/>
					<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
					<input type="hidden" name="orgFileNm" id="orgFileNm" value=""/>
					<input type="hidden" name="mtTutorFileCode" id="mtTutorFileCode" value=""/>
					<input type="hidden" name="mtReportTypeCode" id="mtReportTypeCode" value=""/>
					<input type="hidden" name="evaldown" id="evaldown" value=""/>
						
						<div class="tabArea">
							<ul class="tabMenu type02">
								<li class="tab0 <c:if test="${REQUEST_DATA.tabNo == 0}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 0}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureDetail.do', '0'); return false;"><span class="all"><em>정보 관리</em></span></a></li>
								<li class="tab1 <c:if test="${REQUEST_DATA.tabNo == 1}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 1}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureHisList.do', '1'); return false;"><span class="area1"><em>경력 관리</em></span></a></li>
								<li class="tab2 <c:if test="${REQUEST_DATA.tabNo == 2}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 2}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureCommitteeList.do', '2'); return false;"><span class="area2"><em>강의이력</em></span></a></li>
								<li class="tab3 <c:if test="${REQUEST_DATA.tabNo == 3}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 3}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lecturePersonalList.do', '3'); return false;"><span class="area3"><em>개인 강의이력</em></span></a></li>
								<li class="tab4 <c:if test="${REQUEST_DATA.tabNo == 4}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 4}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/evaluationList.do', '4'); return false;"><span class="area4"><em>평가 이력 관리</em></span></a></li>
								<li class="tab5 <c:if test="${REQUEST_DATA.tabNo == 5}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 5}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/reportList.do', '5'); return false;"><span class="area5"><em>보고서 제출</em></span></a></li>
							</ul>
							<div class="tabCon" id="tab-con05" style="display: block;">
								<div class="translation-box">
									<ul>
										<li>
											<div class="translation">
												<span><em class="ellipsis">심사서류 양식</em></span><a href="#none"onclick="fnFileDown(); return false">심사서류 양식 다운로드</a>
											</div>
										</li> 
									</ul>
								</div>
							</div>	
							<div class="tabCon" id="tab-con05">

								<div class="con-tbl">
									<table class="sub-table ta-c">
										<caption>강사정보관리 평가이력관리-항목,제출여부,제출일자,파일 설명 테이블</caption>
										<colgroup>
											<col style="width:128px;">
											<col style="width:128px;">
											<col style="width:135px;">
											<col style="width:378px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">항목</th>
												<th scope="col">제출여부</th>
												<th scope="col">제출일자</th>
												<th scope="col">파일</th>
											</tr>
										</thead>
										<tbody>
												<tr>
												<td>심사요청서</td>
												<c:choose>
													<c:when test="${resultThird.REPORTNO ne null }">
														<td>Y</td>
														<td><c:out value="${resultThird.SEND_DATE}"/></td>
														<td>
															<div class="file-wrap ta-l">
																<p class="file_txt">
																	<a href="#" name="imgCheck2" id="imgCheck2" class="txt_sky link" onclick="filedown('<c:out value="${resultThird.SAVEFILE}"/>' , '<c:out value="${resultThird.ORGFILE}"/>');"><c:out value="${resultThird.ORGFILE}"/></a>(<c:out value="${resultThird.FSIZE}"/> KB)
																	<button onclick="deleteEvalFile('<c:out value="${resultThird.REPORTNO}"/>' , '<c:out value="${resultThird.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${resultThird.USERNO}"/>' , '<c:out value="${resultThird.MT_REPORT_TYPE_CODE}"/>' , '<c:out value="${resultThird.SAVEFILE}"/>' , '<c:out value="${resultThird.SAVEPATH}"/>');return false"  class="btn-del_2" title="삭제"></button>
																</p>
															</div>
														</td>
													</c:when>
													<c:otherwise>
														<td>N</td>
														<td></td>
														<td>
															<div class="file-wrap ta-l">
																<input type="text" id="fileName3" class="inputtxt size2" readonly="readonly" title="설문">
																<div class="file_input_div">
																  <input type="button" value="불러오기" class="btn-m gray">
																  <input type="file"  name="uploadFile3" id="uploadFile3" class="file_input_hidden" onchange="javascript: document.getElementById('fileName3').value = this.value" title="설문 파일">
																</div>
															</div>
														</td>
													</c:otherwise>
												</c:choose>
											</tr>
											<tr>
												<td>강의계획서</td>
												<c:choose>
													<c:when test="${resultSecond.REPORTNO ne null }">
														<td>Y</td>
														<td><c:out value="${resultSecond.SEND_DATE}"/></td>
														<td>
															<div class="file-wrap ta-l">
																<p class="file_txt">
																	<a href="#" name="imgCheck2" id="imgCheck2" class="txt_sky link" onclick="filedown('<c:out value="${resultSecond.SAVEFILE}"/>' , '<c:out value="${resultSecond.ORGFILE}"/>');"><c:out value="${resultSecond.ORGFILE}"/></a>(<c:out value="${resultSecond.FSIZE}"/> KB)
																	<button onclick="deleteEvalFile('<c:out value="${resultSecond.REPORTNO}"/>' , '<c:out value="${resultSecond.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${resultSecond.USERNO}"/>' , '<c:out value="${resultSecond.MT_REPORT_TYPE_CODE}"/>' , '<c:out value="${resultSecond.SAVEFILE}"/>' , '<c:out value="${resultSecond.SAVEPATH}"/>');return false"  class="btn-del_2" title="삭제" ></button>
																</p>
															</div>
														</td>
													</c:when>
													<c:otherwise>
														<td>N</td>
														<td></td>
														<td>
															<div class="file-wrap ta-l">
																<input type="text" id="fileName2" class="inputtxt size2" readonly="readonly" title="강의계획서">
																<div class="file_input_div">
																  <input type="button" value="불러오기" class="btn-m gray">
																  <input type="file"  name="uploadFile2" id="uploadFile2" class="file_input_hidden" onchange="javascript: document.getElementById('fileName2').value = this.value" title="강의계획서 파일">
																</div>
															</div>
														</td>
													</c:otherwise>
												</c:choose>
											</tr>
											<tr>
												<td>강의교안</td>
												<c:choose>
													<c:when test="${resultFirst.REPORTNO ne null}">
														<td>Y</td>
														<td><c:out value="${resultFirst.SEND_DATE}"/></td>
														<td>
															<div class="file-wrap ta-l">
																<p class="file_txt">
																	<a href="#" name="imgCheck2" id="imgCheck2" class="txt_sky link" onclick="filedown('<c:out value="${resultFirst.SAVEFILE}"/>' , '<c:out value="${resultFirst.ORGFILE}"/>');"><c:out value="${resultFirst.ORGFILE}"/></a>(<c:out value="${resultFirst.FSIZE}"/> KB)
																	<button onclick="deleteEvalFile('<c:out value="${resultFirst.REPORTNO}"/>' , '<c:out value="${resultFirst.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${resultFirst.USERNO}"/>' , '<c:out value="${resultFirst.MT_REPORT_TYPE_CODE}"/>' , '<c:out value="${resultFirst.SAVEFILE}"/>' , '<c:out value="${resultFirst.SAVEPATH}"/>');return false"  class="btn-del_2" title="삭제"></button>
																</p>
															</div>
														</td>
													</c:when>
													<c:otherwise>
														<td>N</td>
														<td></td>
														<td>
															<div class="file-wrap ta-l">
																<input type="text" id="fileName1" class="inputtxt size2" readonly="readonly" title="강의교안">
																<div class="file_input_div">
																  <input type="button" value="불러오기" class="btn-m gray">
																  <input type="file"  name="uploadFile1" id="uploadFile1" class="file_input_hidden" onchange="javascript: document.getElementById('fileName1').value = this.value" title="강의교안 파일">
																</div>
															</div>
														</td>
													</c:otherwise>
												</c:choose>
											</tr>
											<tr>
												<td> 에세이</td>
												<c:choose>
													<c:when test="${resultFourth.REPORTNO ne null}">
														<td>Y</td>
														<td><c:out value="${resultFourth.SEND_DATE}"/></td>
														<td>
															<div class="file-wrap ta-l">
																<p class="file_txt">
																	<a href="#" name="imgCheck2" id="imgCheck2" class="txt_sky link" onclick="filedown('<c:out value="${resultFourth.SAVEFILE}"/>' , '<c:out value="${resultFourth.ORGFILE}"/>');"><c:out value="${resultFourth.ORGFILE}"/></a>(<c:out value="${resultFourth.FSIZE}"/> KB)
																	<button onclick="deleteEvalFile('<c:out value="${resultFourth.REPORTNO}"/>' , '<c:out value="${resultFourth.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${resultFourth.USERNO}"/>' , '<c:out value="${resultFourth.MT_REPORT_TYPE_CODE}"/>' , '<c:out value="${resultFourth.SAVEFILE}"/>' , '<c:out value="${resultFourth.SAVEPATH}"/>');return false"  class="btn-del_2" title="삭제"></button>
																</p>
															</div>
														</td>
													</c:when>
													<c:otherwise>
														<td>N</td>
														<td></td>
														<td>
															<div class="file-wrap ta-l">
																<input type="text" id="fileName4" class="inputtxt size2" readonly="readonly" title="에세이">
																<div class="file_input_div">
																  <input type="button" value="불러오기" class="btn-m gray">
																  <input type="file"  name="uploadFile4" id="uploadFile4" class="file_input_hidden" onchange="javascript: document.getElementById('fileName4').value = this.value" title="에세이 파일">
																</div>
															</div>
														</td>
													</c:otherwise>
												</c:choose>
											</tr>
										
										</tbody>
									</table>
								</div>
								<ul class="btn-list">
									<li><a href="#" onclick="personalPopUp();return false" class="btn signup">저장</a></li>
								</ul> <!-- // btn list -->
								
								<div class="layer_popup" id="layer_03" style="display: none;">
									<div class="layer-tit">
										<p>저장</p>
										<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
									</div>
									<div class="layer_bg bg3">
										<p>저장하시겠습니까?</p>
										<button class="btn-m pop_close" onclick="personalInfo('eval');return false" title="저장">저장</button>
									</div>
								</div>
								
								<div class="layer_popup" id="layer_02" style="display: none;">
									<div class="layer-tit">
										<p>삭제</p>
										<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
									</div>
									<div class="layer_bg bg2">
										<p>삭제하시겠습니까? <span class="d-block">삭제한 내용은 복구가 불가합니다.</span></p>
										<button class="btn-m pop_close" onclick="deleteEvalFileExe();return false;" title="삭제">삭제</button>
									</div>
								</div>
							</div><!-- // tab5 -->
						</div>

						</form>
						<p class="ar"><a href="#header" class="btn-top">TOP</a></p>

					</div><!-- //contents-->

				</div><!-- //sub-contents -->

		</div>
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->