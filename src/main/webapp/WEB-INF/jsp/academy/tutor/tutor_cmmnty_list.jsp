<%
/****************************************************
    system	: 나의공간 > 강사커뮤니티 > 리스트
    title	: 커뮤니티코드관리
    summary	:
    wdate	: 2016-09-19
    writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
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
		yearRange: "2010:2025"
	};	
	
	$(document).ready(function(){
		// 달력
		$("#sdate").datepicker(dateFormat);
		$("#edate").datepicker(dateFormat);
	});
	
	//검색
	function list_page(){
		var form = document.pform;
		form.cPage.value = '1';
		$("form[name=pform]").attr("action" , "/academy/tutor/tutorCmmntyList.do").submit();
	}
	
	//페이지 이동
	function move_page(cPage){
		$('#cPage').val(cPage);
		$('form[name=pform]').attr('action', '<c:out value="${ctx}"/>/academy/tutor/tutorCmmntyList.do').submit();
	} 
	
	/* 게시판내용 */
	function fnTab(bbsNo , bbsAnswerAt, tabNo , bbsNoticeAt){
		var pform = document.pform;
		pform.bbsNo.value = bbsNo;
		pform.bbsAnswerAt.value = bbsAnswerAt;
		pform.bbsNoticeAt.value = bbsNoticeAt;
		pform.cPage.value = '1';
		pform.searchWord.value = '';
		$("#tabNo").val(tabNo);
		$("form[name=pform]").attr("action" , "/academy/tutor/tutorCmmntyList.do").submit();
		
	}

	//상세보기
	function viewInfo(nttNo , bbsNo, noticeAt){
		var pform = document.pform;
		pform.nttNo.value = nttNo;
		pform.bbsNo.value = bbsNo;
		pform.noticeAt.value = noticeAt;
		$("form[name=pform]").attr("action" , "/academy/tutor/tutorCmmntyView.do").submit();
	}
	
	//등록
	function inserSubTutorCmmnty(bbsNo , bbsAnswerAt , qu){
		var pform = document.pform;
		pform.bbsNo.value = bbsNo;
		pform.qu.value = qu;
		pform.bbsAnswerAt.value = bbsAnswerAt;
		pform.pageMode.value = "reg";
		$("form[name=pform]").attr("action" , "/academy/tutor/tutorCmmntyForm.do").submit();
	}
	
	function checkKeyPress(){
		if(event.keyCode == 13)
	    {
			list_page();
	    }
	}

</script>

<div class="contents-wrap f501">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>강사공간</span></li>
				<li class="location"><span>강사커뮤니티</span></li>
			</ul>

			<div class="sub-tit">
				<h3>강사커뮤니티</h3>
				<p>상상스토리 위촉강사들의 커뮤니티 공간입니다. </p>
			</div>

			<div class="contents" id="sContents">

				<form name="pform" id="pform" action="" method="post">
				
				<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
				<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
				<input type="hidden" name="total" id="total" value="<c:out value="${totalCnt.totalCount}"/>"/>
				<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo}">
				<input type="hidden" name="nttNo" id="nttNo" value="">
				<input type="hidden" name="noticeAt" id="noticeAt" value=""/>
				<input type="hidden" name="qu" id="qu" value="">
				<input type="hidden" name="searchMode" id="searchMode" value="title"><!-- 제목으로만 검색 -->
				<input type="hidden" name="pageMode" id="pageMode" value="">
				<input type="hidden" name="bbsAnswerAt" id="bbsAnswerAt" value="${REQUEST_DATA.bbsAnswerAt}" />
				<input type="hidden" name="bbsNoticeAt" id="bbsNoticeAt" value="${REQUEST_DATA.bbsNoticeAt}" />
				
				<div class="tabArea">
					<ul class="tabMenu hmredu_d bg-org">
						<c:forEach var="result" items="${LIST_DATA}" varStatus="status">
							<li class="<c:if test="${REQUEST_DATA.tabNo == status.index}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != status.index}"> off</c:if>">
								<a href="#none" onclick="fnTab('<c:out value="${result.BBSNO}"/>' , '<c:out value="${result.BBS_ANSWER_AT}"/>', '<c:out value="${status.index}"/>' , '<c:out value="${result.BBS_NOTICE_AT}"/>'); return false;">
									<span>
											<c:out value="${fn:substring(result.BBS_NAME,0,10)}"/><c:if test="${fn:length(result.BBS_NAME)>10}">...</c:if>
									</span>
								</a>
							</li>
						</c:forEach>
					</ul> 
					
					<div class="serch-box">
						<input type="text" id="searchWord" name="searchWord" title="강사커뮤니티 검색어 입력"  value="<c:out value="${REQUEST_DATA.searchWord}"/>" onkeypress="checkKeyPress()">
						<button onclick="list_page(); return false;" class="btn-submit" title="검색">검색</button>
					</div>

					<div class="tabCon" id="tab-con01">
						<div class="rel mb20">
							<p class="lh36">조회건수 <span class="txt_red bold"><fmt:formatNumber value="${totalCnt.TOTALCOUNT}" pattern="#,###" /></span>건</p>
							<a href="#none" onclick="inserSubTutorCmmnty('<c:out value="${REQUEST_DATA.bbsNo}"/>' , '<c:out value="${REQUEST_DATA.bbsAnswerAt}"/>' , 'insert'); return false;" class="abs vital btn signup">글쓰기</a>
						</div>

						<div class="con-tbl">
							<table class="sub-table ta-c">
								<caption>강사정보관리 이력사항 테이블,활동/근무내역,소속,근무기간,비고등을 설명</caption>
								<colgroup>
									<col style="width:48px;">
									<col style="width:406px">
									<col style="width:84px">
									<col style="width:152px">
									<col style="">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">등록일시</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
								<c:when test="${fn:length(SUBTOPLIST_DATA)>0 || fn:length(SUBLIST_DATA)>0}">
									<c:forEach var="result" items="${SUBTOPLIST_DATA}" varStatus="status">
									<c:set value="${status.count}" var="topCount" />
										<tr>
											<td><c:out value='${totalCnt.TOTALCOUNT - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
											<td class="tit"><c:if test="${result.NOTICE_AT eq 'Y' && result.PBBSNO eq null && result.USE_AT eq 'Y'}"><span class="official">공지</span></c:if>
												<c:choose>
													<c:when test="${result.USE_AT eq 'Y' }">
														<c:if test="${result.NTT_DEPTH ne 1 }">
															<span class="replbox" style="padding-left:${result.NTT_DEPTH * 10}px"><span class="repl-inner">답글</span></span>
														</c:if>
														<a href="#" class="ellipsis" onclick="viewInfo('<c:out value="${result.NTTNO}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.NOTICE_AT}" />');"><c:out value="${result.TITLE}"/> </a>
														<c:if test="${result.DATE_DIFF < 7}"><span class="new">N</span></c:if>
													</c:when>
													<c:when test="${result.USE_AT eq 'N' }">
														<c:out value="삭제된 글입니다."/>
													</c:when>
												</c:choose>
											</td>
											<td><c:out value="${result.REGIST_NM}"/></td>
											<td class="btn-td"><c:out value="${result.REGIST_DATE}"/></td>
											<td><c:out value="${result.RCNT}"/></td>
										</tr>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<tr><td colspan="5">등록된 글이 없습니다.</td></tr>
									</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						 <c:if test="${not empty SUBLIST_DATA}">
						     <div class="pagelist">
								<paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCnt.TOTALCOUNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
							</div>
						 </c:if>
						<!-- //pagelist -->
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
