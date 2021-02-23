<%
/* *******************************************
    system  : 나의강의실 > 강의실 홈
    title   : 메인
    summary :	
    wdate   : 2016-09-01
    writer  : SANGS
******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<c:set var="topMenuCode" value="main"/>

<script type="text/javascript"> 

	function errimg(img){ 
		img.src='/classdesk/images/thumb_noimage.gif';
	}
	
	$(document).ready(function() {
		
		
	});
	
	// 기수 변경
	function selectTitle(selectTitle){
		var frm = document.frm;
		//frm.courseSelect.value = selectTitle.value;
		frm.submit();
	}
	
	// 강의선택 변경
	function selectType(pval) {
		var frm = document.frm;
		$("#courseSelect").val("");
		frm.submit();
	}
</script>

<!-- Sub Container -->
<div class="sub-contents-container">
	<div class="global-section">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
		<div class="sub-contents-box">
			<div class="sub-header">
				<h3 class="sub-page-tit">강의실 홈</h3>
				<div class="sub-navigation">
					<span class="sub-nav-item home">Home</span>
					<span class="sub-nav-item">내강의실</span>
					<span class="sub-nav-item current-page">강의실 홈</span>
				</div>
			</div>

			<!-- Sub Contents -->
			<div class="sub-contents-section">
			<form name="frm" id="frm" action="/classdesk/main/main.do" method="post">
			<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
			
			<div class="nobrd-bg-box edu-subject-select-box">
				<div class="list-search-box large">
                     <span class="list-form-box-label">강의 선택</span>
                     <div class="sub-select m mobile-m search-select" id="subjectSelectBox">
                         <select id="mtCtypeCode" name="mtCtypeCode" title="과정 선택" onchange="selectType(this);">
                             <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
								<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${REQUEST_DATA.mtCtypeCode == emap2.MT_SUB_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
							</c:forEach>
                         </select>
                     </div>
                     <div class="sub-select l mobile-l search-select" id="subjectDetailSelectBox">
                         <select id="courseSelect" name="courseSelect" title="과정 상세 선택" onchange="selectTitle(this);">
                             <c:forEach items="${courseList}" var="result">
								<option <c:if test="${result.CSEQNO eq  REQUEST_DATA.paramcSeqNo}"> selected="selected"</c:if> value="<c:out value="${result.CUSERNO}" />,<c:out value="${result.CSEQNO}" />,<c:out value="${result.COURSENO}"/>,<c:out value="${result.CLASS_DESK}"/>,<c:out value="${result.SEQ_TITLE}"/>,<c:out value="${result.MT_CTYPE_NAME}"/>,<c:out value="${result.MT_CTYPE_CODE}"/>" > <c:out value="${result.SEQ_TITLE}"/></option>	
							 </c:forEach>
                         </select>
                     </div>
                 </div>
			</div>
			</form>
			
           	<!-- 과정 안내 -->
           	<div class="cont-tit-box">
               <h4 class="con-tit">과정안내</h4>
           	</div>

			<div class="table-box">
				<table class="sub-table row">
				<caption>과정안내 테이블: 과정분류, 교육과정명, 신청기간, 교육기간, 교육장소, 교육시간, 과정설명, 금액, 신청인원, 첨부파일</caption>
				<tbody>
					<jsp:scriptlet>pageContext.setAttribute("newline", "\n");</jsp:scriptlet>
					<tr>
						<th scope="row">과정분류</th>
						<td><span class="t-bold"><c:out value="${rowData.MT_SC_NAME}"/></span></td>
					</tr>
					<tr>
						<th scope="row">교육과정명</th>
						<td><span><c:out value="${rowData.SEQ_TITLE}"/></span></td>
					</tr>
					<tr>
						<th scope="row">신청기간</th>
						<td><span><c:choose>
							<c:when test="${rowData.OPENTYPE eq 'D'}">
								<c:out value="${rowData.APPLY_SDATE}"/> ~ <c:out value="${rowData.APPLY_EDATE}"/>
							</c:when>
							<c:otherwise>
								<p>상시운영</p>
							</c:otherwise>
						</c:choose></span></td>
					</tr>
					<tr>
						<th scope="row">교육기간</th>
						<td><span>
							<c:choose>
							<c:when test="${rowData.OPENTYPE eq 'D'}">
								<c:out value="${fn:substring(rowData.STUDY_SDATE,0,10)}"/> ~ <c:out value="${fn:substring(rowData.STUDY_EDATE,0,10)}"/>
							</c:when>
							<c:otherwise>
								<c:out value="${fn:substring(cuserItem.STARTDATE,0,10)}"/> ~ <c:out value="${fn:substring(cuserItem.ENDDATE,0,10)}"/>
							</c:otherwise>
							</c:choose></span></td>
					</tr>
					<c:if test="${rowData.MT_CTYPE_CODE == cmmnOfflineCode}">
						<tr>
							<th scope="row">교육장소</th>
							<td><span><c:out value="${rowData.EDU_PLACE}"/></span></td>
						</tr>
						<tr>
							<th scope="row">교육시간</th>
							<td><span><c:out value="${rowData.STUDYTIME_TOT}"/>시간</span></td>
						</tr>
					</c:if>
					<c:if test="${rowData.MT_CTYPE_CODE == cmmnOnlineCode}">
						<tr>
							<th scope="row">총교육시간</th>
							<td><span><c:out value="${rowData.STUDYTIME_TOT}"/>시간</span></td>
						</tr>
						<tr>
						<th scope="row">1일학습량</th>
						<td><span>
							<c:choose>
								<c:when test="${rowData.MT_STUDY_LIMIT_CODE == 'SL0001'}"><!-- 강기준 --><c:out value="${rowData.STUDYTIME}"/>강</c:when>
								<c:when test="${rowData.MT_STUDY_LIMIT_CODE == 'SL0002'}"><!-- 학습시간 기준 --><c:out value="${rowData.STUDYTIME}"/>분</c:when>
								<c:when test="${not empty rowData.STUDYTIME}"><c:out value="${rowData.STUDYTIME}"/>차시</c:when>
								<c:otherwise>제한없음</c:otherwise>
							</c:choose></span>
						</td>
					</tr>
					<tr>
						<th scope="row">순차학습여부</th>
						<td><span>
							<c:if test="${rowData.EDUSEQ_YN == 'Y'}">순차학습</c:if>
							<c:if test="${rowData.EDUSEQ_YN != 'Y'}">자유학습</c:if></span>
						</td>
					</tr>
					</c:if>
					<!-- //사이버 -->
					<tr>
						<th scope="row">과정설명</th>
						<td><span><c:out value="${fn:replace(rowData.DESCRIPTION, newline, '<br>')}" escapeXml="false"/></span></td>
					</tr>
					<%-- <tr>
						<th scope="row">교육대상</th>
						<td><span><c:out value="${rowData.BTARGET}"/></span></td>
					</tr> --%>
					<tr>
						<th scope="row">금액</th>
						<td><span><fmt:formatNumber value="${rowData.PRICE}" pattern="#,###" />원</span></td>
					</tr>
					<tr>
						<th scope="row">신청인원</th>
						<td><span><c:out value="${rowData.COURSE_USER_CNT}"/>명 / <c:out value="${rowData.MAX_CNT}"/>명</span></td>
					</tr>
					<%-- <tr>
						<th scope="row">문의</th>
						<td><c:out value="${fn:replace(rowData.BEX_DESCRIPTION, newline, '<br>')}" escapeXml="false"/></td>
					</tr> --%>
					<tr>
						<th scope="row">첨부파일</th>
						<td><span>
							<c:forEach var="file" items="${fileMap}" varStatus="status">
								<a href="#none" onclick="filedown('<c:out value="${file.FILE_ID}"/>', '<c:out value="${file.FILE_SEQ}"/>');" class="btn-down" title="첨부파일 다운로드">${file.SAVFILE}</a>	
							</c:forEach></span>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
            <!-- //과정 안내 -->

            <!-- 학습 진척사항 -->
            <c:if test="${rowData.MT_CTYPE_CODE == cmmnOnlineCode}">
	            <div class="cont-tit-box">
	                <h4 class="con-tit">학습 진척사항</h4>
	            </div>
	
				<div class="table-box">
					<table class="sub-table row">
						<caption>과정안내 테이블: 과정분류, 교육과정명, 신청기간, 교육기간, 교육장소, 교육시간, 과정설명, 교육대상, 금액, 신청인원, 문의, 첨부파일</caption>
						<tbody>
							<tr>
								<th scope="row">진도율</th>
								<td><span><c:out value="${progItem.PROG_PER}" default="0"/>%</span></td>
							</tr>
							<tr>
								<th scope="row">마지막 학습일자</th>
								<td><span><c:out value="${progItem.EDATE}"/></span></td>
							</tr>
						</tbody>
					</table>
				</div>
                <!-- //학습 진척사항 -->
             </c:if>
		</div>
		<!-- //Sub Contents -->

		</div>
	</div>
</div>
<!-- //Contents -->


<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>
