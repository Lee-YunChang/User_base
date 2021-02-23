<%
/****************************************************
	system	: 나의강의 > 보고서 제출
	title	: 보고서 제출
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
	function entrstClickEvt(entrstYear){
		$('#entrstYear').val(entrstYear);
		$("#frm").attr("action", "/academy/tutor/reportList.do").submit();
	}
	
	// 등록
	function insertForm(){
		$('#entrstYear').val($('input[name="entrstDate"]:checked').val());
		$("#qu").val("insert");
		$("#mtReportTypeCode").val("RP2000");
		$("#frm").attr("action", "/academy/tutor/reportForm.do").submit();
	}
	
	//파일다운로드
	function filedown(fname,orgFile){
		$('#filename').val(encodeURIComponent(fname));
		$('#fileName').val(encodeURIComponent(orgFile));
		$('form[name=frm]').attr('action', '/academy/filedown.do').submit();
	}
	//삭제 팝업
	function deleteReportFile(reportNo , saveFileNm , saveFilePath , orgFileNm){
		$('#qu').val('delete');
		$('#mod').val('report');
		$('#reportNo').val(reportNo);
		$('#saveFileNm').val(saveFileNm);
		$('#saveFilePath').val(saveFilePath);
		$('#orgFileNm').val(orgFileNm);
		$('#layer_02').css('display' , 'block');
	}
	//삭제
	function deleteFile(){
		$("#frm").attr('action', '/academy/tutor/reportInsertExec.do').submit();
	}
	
	//탭이동
	function fnTab(url, tabNo) {
		$("#tabNo").val(tabNo);
		$("#qu").val('');
		$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
	}
	function selectTitle(selectTitle){
		$("#entrstYear").val('');
		$("#frm").attr("action","/academy/tutor/reportList.do");
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

					<form name="frm" id="frm" action="/academy/tutor/lecturePersonalInfo.do"  method="post" enctype="multipart/form-data">
						<input type="hidden" name="entrstYear" id="entrstYear" value="${REQUEST_DATA.entrstYear}"/>
						<input type="hidden" name="userno" id="userno" value="${REQUEST_DATA.userno }"/>
						<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
						<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
						<input type="hidden" name="reportdown" id="reportdown" value=""/>
						<input type="hidden" name="qu" id="qu" value=""/>
						<input type="hidden" name="mod" id="mod" value=""/>
						<input type="hidden" name="filename" id="filename" value=""/>
						<input type="hidden" name="fileName" id="fileName" value=""/>
						<input type="hidden" name="reportNo" id="reportNo" value=""/>
						<input type="hidden" name="saveFileNm" id="saveFileNm" value=""/>
						<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
						<input type="hidden" name="orgFileNm" id="orgFileNm" value=""/>
						<input type="hidden" name="mtReportTypeCode" id="mtReportTypeCode" value=""/>
						<input type="hidden" name="mtTutorFileCode" id="mtTutorFileCode" value=""/>
						<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>

						<div class="tabArea">
							<ul class="tabMenu type02">
								<li class="tab0 <c:if test="${REQUEST_DATA.tabNo == 0}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 0}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureDetail.do', '0'); return false;"><span class="all"><em>정보 관리</em></span></a></li>
								<li class="tab1 <c:if test="${REQUEST_DATA.tabNo == 1}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 1}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureHisList.do', '1'); return false;"><span class="area1"><em>경력 관리</em></span></a></li>
								<li class="tab2 <c:if test="${REQUEST_DATA.tabNo == 2}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 2}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureCommitteeList.do', '2'); return false;"><span class="area2"><em>강의이력</em></span></a></li>
								<li class="tab3 <c:if test="${REQUEST_DATA.tabNo == 3}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 3}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lecturePersonalList.do', '3'); return false;"><span class="area3"><em>개인 강의이력</em></span></a></li>
								<li class="tab4 <c:if test="${REQUEST_DATA.tabNo == 4}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 4}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/evaluationList.do', '4'); return false;"><span class="area4"><em>평가 이력 관리</em></span></a></li>
								<li class="tab5 <c:if test="${REQUEST_DATA.tabNo == 5}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 5}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/reportList.do', '5'); return false;"><span class="area5"><em>보고서 제출</em></span></a></li>
							</ul>

							<div class="tabCon" id="tab-con06">
								<div class="con-tbl">
									<table class="sub-table ta-c">
										<caption>강사정보관리 보고서제출-항목,제출일자,파일 설명 테이블</caption>
										<colgroup>
											<col style="width:288px;">
											<col style="width:auto">
											<col style="width:294px">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">항목</th>
												<th scope="col">제출일자</th>
												<th scope="col">파일</th>
											</tr>
										</thead>
										
										<tbody>
											<c:forEach items="${resultList}" var="result" varStatus="status">
												<c:if  test="${result.MT_REPORT_TYPE_CODE eq 'RP2000'}">
													<c:set value="${status.count}" var="resultCnt"></c:set>
													<tr>
														<td>
															<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0004'}">
															<span>참관보고서</span>
																<%-- <a href="#" onclick="updateFile('<c:out value="${result.REPORTNO}"/>' , '<c:out value="${result.MT_REPORT_TYPE_CODE}"/>' , '<c:out value="${result.MT_TUTOR_FILE_CODE}"/>');return false"><span>참관보고서</span></a> --%>
															</c:if>
															<c:if test="${ result.MT_TUTOR_FILE_CODE eq 'TF0005'}">
															<span>연구모임 활동보고서</span>
																<%-- <a href="#" onclick="updateFile('<c:out value="${result.REPORTNO}"/>' , '<c:out value="${result.MT_REPORT_TYPE_CODE}"/>' , '<c:out value="${result.MT_TUTOR_FILE_CODE}"/>');return false"><span>연구모임 활동보고서</span></a> --%>
															</c:if>
															<c:if test="${ result.MT_TUTOR_FILE_CODE eq 'TF0007'}">
															<span>기타</span>
															</c:if>
														</td>
														<td>
															<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0004'}">
																<c:out value="${result.SEND_DATE }"/>
															</c:if>
															<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0005'}">
																<c:out value="${result.SEND_DATE }"/>
															</c:if>
															<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0007'}">
																<c:out value="${result.SEND_DATE }"/>
															</c:if>
														</td>
														<td>
															<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0004' && result.SAVEFILE ne '' && result.SAVEFILE ne null}">
																<div class="file-wrap ta-l">
																	<p class="file_txt">
																		<span class="txt_sky link"><a href="#" class="txt_sky link" name="imgCheck1" id="imgCheck1" onclick="filedown('<c:out value="${result.SAVEFILE}"/>' , '<c:out value="${result.ORGFILE}"/>');"><c:out value="${result.ORGFILE}"/></a>(<c:out value="${result.FSIZE}"/> KB)</span>
																		<button onclick="deleteReportFile('<c:out value="${result.REPORTNO}"/>' , '<c:out value="${result.SAVEFILE}"/>' , '<c:out value="${result.SAVEPATH}"/>' , '<c:out value="${result.ORGFILE}"/>');return false"  class="btn-del_2" title="삭제">삭제</button>
																	</p>
																</div>
															</c:if>
															<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0005' && result.SAVEFILE ne '' && result.SAVEFILE ne null}">
																<div class="file-wrap ta-l">
																	<p class="file_txt">
																		<span class="txt_sky link"><a href="#" class="txt_sky link" name="imgCheck2" id="imgCheck2"  onclick="filedown('<c:out value="${result.SAVEFILE}"/>' , '<c:out value="${result.ORGFILE}"/>');"><c:out value="${result.ORGFILE}"/></a>(<c:out value="${result.FSIZE}"/> KB)</span>
																		<button onclick="deleteReportFile('<c:out value="${result.REPORTNO}"/>' , '<c:out value="${result.SAVEFILE}"/>' , '<c:out value="${result.SAVEPATH}"/>' , '<c:out value="${result.ORGFILE}"/>');return false"  class="btn-del_2" title="삭제">삭제</button>
																	</p>
																</div>
															</c:if>
															<c:if test="${result.MT_TUTOR_FILE_CODE eq 'TF0007' && result.SAVEFILE ne '' && result.SAVEFILE ne null}">
																<div class="file-wrap ta-l">
																	<p class="file_txt">
																		<span class="txt_sky link"><a href="#" class="txt_sky link" name="imgCheck2" id="imgCheck2"  onclick="filedown('<c:out value="${result.SAVEFILE}"/>' , '<c:out value="${result.ORGFILE}"/>');"><c:out value="${result.ORGFILE}"/></a>(<c:out value="${result.FSIZE}"/> KB)</span>
																		<button onclick="deleteReportFile('<c:out value="${result.REPORTNO}"/>' , '<c:out value="${result.SAVEFILE}"/>' , '<c:out value="${result.SAVEPATH}"/>' , '<c:out value="${result.ORGFILE}"/>');return false"  class="btn-del_2" title="삭제">삭제</button>
																	</p>
																</div>
															</c:if>
														</td>
													</tr>
												 </c:if>
											</c:forEach>
											<c:if test="${empty resultCnt }">
												<tr>
													<td colspan="3" align="center">
														<span>보고서 제출이 없습니다.</span>
													</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>

								<ul class="btn-list">
									<li><a href="#none" onclick="insertForm();return false" class="btn signup" title="등록">등록</a></li>
								</ul>
								
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

							</div><!-- // tab6 -->
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