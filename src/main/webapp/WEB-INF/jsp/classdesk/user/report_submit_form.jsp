<%
/****************************************
    system  : ClassDesk > 학생 > 과제
    title   : 과제 목록
    summary :   
    wdate   : 2015-04-01
    writer  : SANGS  
****************************************/
%>


<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="topMenuCode" value="task"/>

<script type="text/javascript">
	// 페이징 이동 함수
	function fnList() {
		$('#frm').attr('target', '_self').attr('action', '/classdesk/user/report/list.do').submit();
	}

	// 페이징 이동 함수
	function fnDetail(reportNo) {
		$('#reportNo').val(reportNo);
		$('#frm').attr('target', '_self').attr('action', '/classdesk/user/report/submit_form.do').submit();
	}

	//저장
	function fnSave(openYnVal){
		var form = document.frm;
		oEditors.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
		if ($('input[name=title]').valueEmpty()) {
			alert('제목을 입력해주세요.');
			$('input[name=title]').focus();
			return;
		}	
		
		form.summary.value = document.getElementById("summary").value;
		
		var str=form.summary.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		} 
		
		if(openYnVal == 'Y'){
			if(!confirm('제출한 과제는 수정할 수 없습니다.\n그래도 제출하시겠습니까?')) return false;	
		}
		
		$('#openYn').val(openYnVal);
		$('#saveYn').val(openYnVal);
		$('#frm').attr('action', '/classdesk/user/report/submit_exec.do').attr('method', 'post').attr('target', '_self').submit();
	}
	
	
	//파일다운로드
	function filedown(saveName,savePath,orgName){
		$('#saveName').val(saveName);
		$('#savePath').val(savePath);
		$('#orgName').val(orgName);
		$('form[name=frm]').attr('action', '/academy/classdeskFiledown.do').submit();
	}
	
</script>


 <div class="contents-wrap">

 		<div class="sub-wrap">
				<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
				<div class="sub-contents">
					<ul class="sub-navi">
						<li><a href="#none" title="HOME">HOME</a></li>
						<li><a href="#none" title="내강의실">내강의실</a></li>
						<li class="location"><a href="#none" title="과제">과제</a></li>
					</ul>
					
					<div class="sub-tit">
						<h3>과제<span class="tit-ex" ><span class="hyphen">-</span><c:out value="${REQUEST_DATA.seqTitle}"/></span></h3>
						<p class="ellipsis">
							<c:choose>
								<c:when test="${REQUEST_DATA.ctypeName eq '집합교육' }">
									<span class="new_tit-bd"><span class="new_tit bg3">집합교육</span></span>
								</c:when>
								<c:when test="${REQUEST_DATA.ctypeName eq '사이버교육' }">
									<span class="new_tit-bd"><span class="new_tit bg4">온라인교육</span></span>
								</c:when>
								<c:when test="${REQUEST_DATA.ctypeName eq '의무교육' }">
									<span class="new_tit-bd"><span class="new_tit bg2">의무교육</span></span>
								</c:when>
							</c:choose>
							<c:out value="${REQUEST_DATA.seqTitle}"/>
						</p>
					</div>

					<div class="contents" id="sContents">

						<form name="frm" id="frm" action="" method="post" enctype="multipart/form-data">
							<input type="hidden" name="reportNo" value="<c:out value="${reportData.REPORTNO}"/>"/>
							<input type="hidden" name="cUserNo"  value="<c:out value="${reportApplyData.CUSERNO}"/>" />
							<input type="hidden" name="openYn"   id="openYn" />
							<input type="hidden" name="saveYn"   id="saveYn" />
							<input type="hidden" name="downType"   id="downType" value="" />
							<input type="hidden" name="downNo"   id="downNo"  value=""/>
							<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.classDeskReportFilePath")%>"/>
							<input type="hidden" name="CLASSDESK"  id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}" />"/>
							<input type="hidden" name="saveName" id="saveName" value=""/>
							<input type="hidden" name="savePath" id="savePath" value=""/>
							<input type="hidden" name="orgName" id="orgName" value=""/>
							<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.classDeskReportFilePath")%>"/>
							<input type="hidden" name="reportdown" id="reportdown" value=""/>
							<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
							<input type="hidden" name="userOpenYn" id="userOpenYn" value="<c:out value="${REQUEST_DATA.userOpenYn}"/>">
							<input type="hidden" name="resultYn" id="resultYn" value="<c:out value="${REQUEST_DATA.resultYn}"/>">
							<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
						<h3 class="con-tit">과제 내용</h3>
						<div class="con-tbl">
							<table class="sub-table">
								<caption>과제 내용:이 표는 과제명,토론기간,배점,과제내용,첨부파일을 설명하는 테이블입니다.</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">과제명</th>
										<td><c:out value="${reportData.TITLE}" /></td>
									</tr>
									<tr>
										<th scope="row">제출기간</th>
										<td><fmt:formatDate value="${reportData.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${reportData.EDATE}" pattern="yyyy.MM.dd" /></td>
									</tr>
									<tr>
										<th scope="row">배점</th>
										<td><c:out value="${reportData.EVAL}"/>점</td>
									</tr>
									<tr>
										<th scope="row">과제내용</th>
										<td>
											<p><c:out value="${reportData.SUMMARY}"/></p>
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
											<c:if test="${not empty reportData.FILE01_SAVE}">
												<a href="#none" class="btn-down" style="margin-bottom: 5px;" onclick="filedown('<c:out value="${reportData.FILE01_SAVE}"/>' , '<c:out value="${reportData.FILE_PATH}"/>' , '<c:out value="${reportData.FILE01_ORG}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportData.FILE01_ORG}"/></a><br>
											</c:if>
											<c:if test="${not empty reportData.FILE02_SAVE}">
												<a href="#none" class="btn-down" style="margin-bottom: 5px;" onclick="filedown('<c:out value="${reportData.FILE02_SAVE}"/>' , '<c:out value="${reportData.FILE_PATH}"/>' , '<c:out value="${reportData.FILE02_ORG}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportData.FILE02_ORG}"/></a><br>
											</c:if>
											<c:if test="${not empty reportData.FILE03_SAVE}">
												<a href="#none" class="btn-down" style="margin-bottom: 5px;" onclick="filedown('<c:out value="${reportData.FILE03_SAVE}"/>' , '<c:out value="${reportData.FILE_PATH}"/>' , '<c:out value="${reportData.FILE03_ORG}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportData.FILE03_ORG}"/></a><br>
											</c:if>
											<c:if test="${not empty reportData.FILE04_SAVE}">
												<a href="#none" class="btn-down" style="margin-bottom: 5px;" onclick="filedown('<c:out value="${reportData.FILE04_SAVE}"/>' , '<c:out value="${reportData.FILE_PATH}"/>' , '<c:out value="${reportData.FILE04_ORG}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportData.FILE04_ORG}"/></a><br>
											</c:if>
											<c:if test="${empty reportData.FILE01_SAVE && empty reportData.FILE02_SAVE && empty reportData.FILE03_SAVE && empty reportData.FILE04_SAVE}">
												<p>첨부파일이 없습니다.</p>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<h3 class="con-tit">과제 제출</h3>
						<div class="con-tbl">
							<table class="sub-table write">
								<caption>과제 제출:이 표는 과제 제출 테이블입니다.</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td>
											<input type="text" name="title" id="title" class="inputtxt large" title="제목 입력" value="${reportApplyData.TITLE}">
										</td>
									</tr>
									<tr>
										<td colspan="2" class="editer">
											<div style="min-height:350px;">
							                   <!-- [필수]에디터 안에 글내용 영역 -->
							                   	<textarea name="summary" id="summary" rows="22" style="width:100%;">
							                   		<c:out value="${reportApplyData.SUMMARY}"/>
							                   </textarea>
							                   
											</div>
											<script type="text/javascript">
											var oEditors = [];
											nhn.husky.EZCreator.createInIFrame({
											    oAppRef: oEditors,
											    elPlaceHolder: "summary",
											    sSkinURI: "/academy/common/smarteditor/SmartEditor2Skin.html",
											    fCreator: "createSEditor2"
											});
											</script>
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
											<div class="file-wrap">
												<input type="text" id="fileName0" class="inputtxt size2" readonly="readonly" value="${reportApplyData.FILE01_ORG}" title="첨부파일"/>
												<div class="file_input_div">
												  <input type="button" value="불러오기" class="btn-m gray">
												  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="javascript: document.getElementById('fileName0').value = this.value" title="첨부파일">
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<ul class="btn-list">
							<li><button type="submit" onclick="fnSave('N');return false" class="btn signup" title="임시 저장">임시 저장</button></li>
							<li><button type="submit" onclick="fnSave('Y');return false" class="btn green" title="과제 제출">과제 제출</button></li>

							<li><a href="javascript:window.history.back();" class="btn list" title="과제 목록">목록</a></li>
						</ul>


						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


						</form>
					</div><!-- //contents-->


				</div><!-- //sub-contents -->

			</div>
</div>			