<%
/****************************************************
	system	: 특강교육 메인
	title	: 
	summary	:	
	wdate	: 
	writer	: 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">


// 특강신청
function fnCourseView(mtScCode , mtScCode2){
	var mtScCode = mtScCode;
	
	if(mtScCode2.length > 0 ){
		mtScCode = mtScCode2;
	}
	$("#mtScCode").val(mtScCode);
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/lectureForm.do');
	$('#frm').submit();

}

</script>
<div class="contents-wrap c501">

		<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>

			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>배움터</span></li>
					<li class="location"><span>특강교육</span></li>
				</ul>

				<div class="sub-tit">
					<h3>특강교육</h3>
					<p>
						의식 확산 및 교육 저변 확대의 일환으로 교육을 요청하는 기관에서 진행하는 과정입니다.
					</p>
				</div>

				<form name="frm" id="frm" action="/academy/course/lectureForm.do" method="post">
				<input type="hidden" name="mtScCode" id="mtScCode" value=""/>
				
				<div class="contents" id="sContents">
				
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
											<a href="#none" onclick="fnCourseView('<c:out value="${result.MT_SUB_CODE}"/>', '<c:out value="${result.MT_SUB_CODE2}"/>'); return false;" class="btn-m blue abs" title="<c:out value="${result.MT_SUB_NAME}"/> 신청하기">신청하기</a>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</ul>
					
					<!-- <p class="ac"><a href="#none"  class="more-w">더보기</a></p> -->
					<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
					
				</div><!-- //contents-->
				</form>

			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->

	</div><!-- //contents-wrap -->

	
	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->