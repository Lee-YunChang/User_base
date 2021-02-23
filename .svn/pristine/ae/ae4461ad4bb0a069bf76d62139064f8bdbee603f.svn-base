<%
/****************************************************
    system	: 대출의무교육 > 창업대출
    title	: 일반과정 신청 및 수강안내 목록
    summary	:
    wdate	: 2013-09-10
    writer	: 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

//검색
function fnSearch(){
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/cpseduMain.do');
	$('#frm').submit();

}

//과정 목록으로 이동
function fnCourseView(abcCd , mtScCode, ref1, ref2){

	$('#mtScCode').val(mtScCode);
    $('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/cpseduDetail.do').submit();
}

</script>

<div class="contents-wrap c401">

		<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_cpsedu_course.jsp"%>

			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>대출의무교육</span></li>
					<li class="location"><span>창업대출</span></li>
				</ul>

				<div class="sub-tit">
					<h3>창업대출</h3>
					<p></p>
				</div>

				<div class="contents" id="sContents">

					<form name="frm" id="frm" action="/academy/course/cpseduMain.do" method="post">
					<input type="hidden" name="ref1" id="ref1" value=""/>
					<input type="hidden" name="ref2" id="ref2" value=""/>
					<input type="hidden" name="mtScCode" id="mtScCode" value=""/>
					<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value=""/>
						<div class="serch-box">
							<input type="text" name="schMtSubName" title="의무교육 검색어입력" value="<c:out value="${REQUEST_DATA.schMtSubName}"/>"><button class="btn-submit" onclick="fnSearch(); return false;" title="검색">검색</button>
						</div>
						
					</form>
					<ul class="edu-list">
						<c:choose>
							<c:when test="${not empty resultList}">
								<c:forEach items="${resultList}" var="result" varStatus="stat">
									<li>
										<div class="edu-wrap">
											<dl>
												<dt><c:out value="${result.MT_SUB_NAME}"/></dt>
												<dd><c:out value="${fn:substring(result.SUMMARY,0,56)}"/><c:if test="${fn:length(result.SUMMARY) > 54 }">..</c:if></dd>
											</dl>
											<a href="#none" onclick="fnCourseView('<c:out value="${result.ABC_CD}"/>' , '<c:out value="${result.MT_SUB_CODE}"/>' , '<c:out value="${result.REF1}"/>', '<c:out value="${REQUEST_DATA.REF2}"/>'); return false;" <c:if test="${not empty result.MT_SUB_CODE2}">title="<c:out value="${result.MT_SUB_NAME}"/> 신청하기" class="btn-m blue abs"</c:if> <c:if test="${empty result.MT_SUB_CODE2}">title="<c:out value="${result.MT_SUB_NAME}"/> 상세보기" class="btn-m green abs"</c:if>><c:if test="${not empty result.MT_SUB_CODE2}">신청하기</c:if> <c:if test="${empty result.MT_SUB_CODE2}"> 상세보기 </c:if></a>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</ul>

					<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


				</div><!-- //contents-->



			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->

	</div><!-- //contents-wrap -->


    <!-- 풋터 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
    <!-- // 풋터 영역 -->