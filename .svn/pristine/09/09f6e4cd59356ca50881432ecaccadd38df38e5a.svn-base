<%
/****************************************************
    system	: 시스템관리 > 커뮤니티코드관리 > 상세
    title	: 커뮤니티코드관리
    summary	:
    wdate	: 2013-08-23
    writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	//수정
	function tutorSubFormCheck(){
		var form = document.pform;
		form.qu.value = "update";
		$("#pform").attr("mothod" , "post").attr("action" , "/academy/tutor/tutorCmmntyForm.do");
		form.submit();
	}
	
	//답글
	function subInfoReply(){
		var form = document.pform;
		form.pageMode.value = "reg";
		form.qu.value = "reply";
		$("#pform").attr("action" , "/academy/tutor/tutorCmmntyForm.do");
		form.submit();
	}
	
	
	//삭제
	function tutorSubFormDelete(){
		var form = document.pform;
		if(confirm("삭제 하시겠습니까?")){
			form.qu.value = 'delete';
			form.useAt.value = 'N';
			$("#pform").attr("action" , "/academy/tutor/tutorcmmntySubInsert.do");
			form.submit();
		}
	}
	
	/* 게시판내용 */
	function fnTab(bbsNo , bbsAnswerAt, tabNo){
		var pform = document.pform;
		pform.bbsNo.value = bbsNo;
		pform.bbsAnswerAt.value = bbsAnswerAt;
		$("#tabNo").val(tabNo);
		$("form[name=pform]").attr("action" , "/academy/tutor/tutorCmmntyList.do").submit();
		
	}
	
	// 목록으로 이동
	function fnList() {
		$("#pform").attr("action" , "/academy/tutor/tutorCmmntyList.do");
		$("#pform").submit();
	}
	
	//파일다운로드
	function filedown(fileId,fname,type,orgFile){
		$('#fileId').val(fileId);
		$('#filename').val(encodeURIComponent(fname));
		$('#fileName').val(encodeURIComponent(orgFile));
		$('#ftype').val(type);
		$('form[name=pform]').attr('action', '/academy/filedown.do').submit();
	}
</script>
<div class="contents-wrap f502">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>나의 공간</span></li>
				<li class="location"><span>강사커뮤니티</span></li>
			</ul>
			<div class="sub-tit">
				<h3>강사커뮤니티</h3>
				<p>상상스토리 위촉강사들의 커뮤니티 공간입니다. </p>
			</div>

			<div class="contents" id="sContents">
				<form name="pform" id="pform" action="" method="post">
				<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
				<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu}">
				<input type="hidden" name="mode" id="mode" value="${REQUEST_DATA.mode}">
				<input type="hidden" name="pageMode" id="pageMode" value="${REQUEST_DATA.pageMode}">
				<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
				<input type="hidden" name="bbsNo" id="bbsNo" value="${VIEW.BBSNO}">
				<input type="hidden" name="nttNo" id="nttNo" value="${VIEW.NTTNO}">
				<input type="hidden" name="nttDepth" id="nttDepth" value="${VIEW.NTT_DEPTH}">
				<input type="hidden" name="useAt" id="useAt" value="${VIEW.USEAT}">
				<input type="hidden" name="bbsNoticeAt" id="bbsNoticeAt" value="${VIEW.NOTICE_AT}">
				<input type="hidden" name="bbsAnswerAt" id="bbsAnswerAt" value="${REQUEST_DATA.bbsAnswerAt}">
				<input type="hidden" name="filename" id="filename" value=""/>
				<input type="hidden" name="fileName" id="fileName" value=""/>
				<input type="hidden" name="ftype" id="ftype" value=""/>
				<input type="hidden" name="fileId" id="fileId" value=""/>
				<input type="hidden" name="lecturedown" id="lecturedown" value=""/>
				<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
				
				<div class="tabArea">
					<ul class="tabMenu hmredu_d bg-org">
						<c:forEach var="result" items="${LIST_DATA}" varStatus="status">
							<li class="<c:if test="${REQUEST_DATA.tabNo == status.index}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != status.index}"> off</c:if>">
								<a href="#none" onclick="fnTab('<c:out value="${result.BBSNO}"/>' , '<c:out value="${result.BBS_ANSWER_AT}"/>', '<c:out value="${status.index}"/>'); return false;">
									<span>
											<c:out value="${fn:substring(result.BBS_NAME,0,10)}"/><c:if test="${fn:length(result.BBS_NAME)>10}">...</c:if>
									</span>
								</a>
							</li>
						</c:forEach>
					</ul> 

					<div class="tabCon" id="tab-con01">

						<div class="con-tbl">
							<table class="sub-table write">
								<caption>강사커뮤니티 상세 테이블</caption>
								<colgroup>
									<col style="width:182px">
									<col style="width:204px">
									<col style="width:182px">
									<col style="width:auto">
								</colgroup>
								<thead>
									<tr>
										<th colspan="4"><c:out value="${VIEW.TITLE}"/></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">작성자</th>
										<td><c:out value="${VIEW.REGIST_NM}"/></td>
										<th scope="row">작성일</th>
										<td><c:out value="${VIEW.REGIST_DATE}"/></td>
									</tr>
									<tr>
										<td colspan="4" class="the-text" style="padding-bottom:100px">
											 <c:out value="${VIEW.SUMMARY}" escapeXml="false"/>
										</td>
									</tr>
									
									<tr>
										<th scope="row" class="p-left30" style="text-align: center;">첨부파일</th>
										<td colspan="3">
											<c:if test="${not empty fileList}">
												<c:forEach items="${fileList}" varStatus="status" var="fileList">
													<a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>')" class="btn-down">
														<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
													</a>
													<br>
												</c:forEach>
											</c:if>
											<c:if test="${empty fileList}">
												<p>첨부파일이 없습니다.</p>
											</c:if>
										</td>	
									</tr>
								</tbody>
							</table>
							<br/>
							<table>
							<caption>강사커뮤니티 파일첨부 상세 테이블</caption>
								<colgroup>
									<col style="width:auto">
								</colgroup>
							</table>
						</div>
						<ul class="btn-list">
					        <c:if test="${REQUEST_DATA.bbsAnswerAt eq 'Y' }">
					        	<li><a href="#" onclick="subInfoReply(); return false;" class="btn signup" title="답글">답글</a></li> 
					        </c:if>
							<c:if test="${REQUEST_DATA.pageMode eq pageModeReg}">
					        	<li><a href="#" onclick="tutorSubFormCheck('<c:out value="${REQUEST_DATA.qu}"/>'); return false;">등록</a>
					        </c:if>
					        <c:if test="${REQUEST_DATA.SES_USERID eq VIEW.REGIST_ID}">
					            <li><a href="#" onclick="tutorSubFormCheck(); return false;" class="btn list">수정</a>
					            <li><a href="#" onclick="tutorSubFormDelete(); return false;" class="btn list">삭제</a>
					        </c:if>
					        <li><a href="#none" onclick="fnList();return false;" class="btn list">목록</a></li>
						</ul>


					</div><!-- // tab1 -->
				</div>
				</form>


				<p class="ar"><a href="#header" class="btn-top">TOP</a></p>


			</div><!-- //contents-->



		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->


<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>