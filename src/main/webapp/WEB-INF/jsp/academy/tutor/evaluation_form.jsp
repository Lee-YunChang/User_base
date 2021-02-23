<%
/****************************************************
	system	: 나의강의 > 평가 이력관리 등록폼
	title	: 평가이력관리 등록폼
	summary	:	
	wdate	: 2016-09-26
	writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
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
//탭이동
function fnTab(url, tabNo) {
	$("#tabNo").val(tabNo);
	$("#qu").val('');
	$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
}

function personalInfo(qu , mod){
	$("#mod").val(mod);
	if(qu == 'update'){
		if(confirm("수정하시겠습니까")){
			$("#qu").val(qu);
			$("#frm").attr("action", "/academy/tutor/reportInsertExec.do").submit();
		}
	}
	if(qu == 'insert'){
		if(confirm("등록하시겠습니까")){
			$("#qu").val(qu);
			$("#frm").attr("action", "/academy/tutor/reportInsertExec.do").submit();
		}
	}
}
</script>


<div class="contents-wrap c502">

		<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>

			<div class="sub-contents">
					<ul class="sub-navi">
						<li><span>HOME</span></li>
						<li><span>나의 공간</span></li>
						<li class="location"><span>강사정보관리</span></li>
					</ul>

					<div class="sub-tit">
						<h3>강사정보관리</h3>
						<p>상호간 유대관계 및 협력체계의 강화를 통해 교육효과를 증대하기위한 교육입니다.</p>
					</div>

					<div class="contents" id="sContents">

						<form name="frm" id="frm" action="/academy/tutor/lectureHisList.do" method="post">
						<input type="hidden" name="userno" id="userno" value="${tutor.USERNO }"/>
						<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
						<input type="hidden" name="entrstYear" id="entrstYear" value="<c:out value="${REQUEST_DATA.entrstYear}"/>"/>
						<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
						<input type="hidden" name="qu" id="qu" value=""/>
						<input type="hidden" name="mod" id="mod" value=""/>
						<input type="hidden" name="downDir" id="downDir" value="temp"/>
						<input type="hidden" name="reportdown" id="reportdown" value=""/>
						<input type="hidden" name="filename" id="filename" value=""/>
						<input type="hidden" name="reportNo" id="reportNo" value=""/>
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
											<c:if test="${REQUEST_DATA.qu eq 'insert'}">
												<tr>
													<td>강의교안</td>
													<td><input type="file" name="uploadFile1" id="uploadFile1" title="강의교안"></td>
												</tr>
												<tr>
													<td>강의계획서</td>
													<td><input type="file" name="uploadFile2" id="uploadFile2" value="TF0002" title="강의계획서"></td>
												</tr>
												<tr>
													<td>설문</td>
													<td><input type="file" name="uploadFile3" id="uploadFile3" value="TF0006" title="설문"></td>
												</tr>
											</c:if>
											<c:if test="${REQUEST_DATA.qu eq 'update'}">
												<tr>
													<th>
														<c:if test="${evalFile.MT_TUTOR_FILE_CODE eq 'TF0001' }">
															<span>강의교안</span>
														</c:if>
														<c:if test="${evalFile.MT_TUTOR_FILE_CODE eq 'TF0002' }">
															<span>강의계획서</span>
														</c:if>
														<c:if test="${evalFile.MT_TUTOR_FILE_CODE eq 'TF0006' }">
															<span>설문</span>
														</c:if>
													</th>
													<td>
														<input type="file" name="updateFile" id="updateFile" title="첨부파일">
														<a href="#"><span><c:out value="${evalFile.ORGFILE}"></c:out></span></a>(<c:out value="${evalFile.FSIZE}"/> KB)
													</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>

								<ul class="btn-list">
									<c:if test="${REQUEST_DATA.qu eq 'insert' }">
										<li><a href="#" onclick="personalInfo('insert' , 'eval');return false" class="btn signup">저장</a></li>
									</c:if>
									<c:if test="${REQUEST_DATA.qu eq 'update' }">
										<li><a href="#" onclick="personalInfo('update' , 'eval');return false" class="btn signup">수정</a></li>
									</c:if>
								</ul> <!-- // btn list -->
							</div><!-- // tab5 -->
						</div>

						</form>
						<p class="ar"><a href="#header" class="btn-top">TOP</a></p>


					</div><!-- //contents-->



				</div><!-- //sub-contents -->
		</div>
</div>
											