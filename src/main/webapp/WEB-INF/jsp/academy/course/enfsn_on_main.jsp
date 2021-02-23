<%
/****************************************************
	system	: 종사자교육 > 사이버교육
	title	: 일반과정 신청 및 수강안내 목록
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

//검색
function fnSearch(){
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/enfsnOnMain.do');
	$('#frm').submit();

}

//과정 목록으로 이동
function fnCourseView(mtScCode){
	$("#mtScCode").val(mtScCode);
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/enfsnOnDetail.do');
	$('#frm').submit();

}

</script>

	<div class="contents-wrap c201">

		<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_enfsn_course.jsp"%>
			
			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>종사자교육</span></li>
					<li class="location"><span>온라인교육</span></li>
				</ul>

				<div class="sub-tit">
					<h3>온라인교육</h3>
					<p>
						상상스토리는 세계선언의 실현을 위해 교육을 받고자 하는 누구나 이용할 수 있도록 언제 어디서나 학습할 수 있는 이러닝 서비스를 제공하고 있습니다.    
					</p>
				</div>

				<div class="contents" id="sContents">

					<div class="tit-box">
						<p>온라인교육 과정은 <span>총 <c:out value="${fn:length(resultList)}"/></span> 과정으로 구성되어 있습니다.	</p>
					</div>
					
					<p style="font-size: 1.231em; color: #848484; margin-bottom: 10px;">정신보건시설 교육을 받고자 하는 분은 '정신장애인과 '을 수강하시면 됩니다.</p>
					


					<form name="frm" id="frm" action="/academy/course/enfsnOnDetail.do" method="post">
					<input type="hidden" name="mtScCode" id="mtScCode" value=""/>
				
						<div class="serch-box">
							<input type="text" name="schMtSubName" title="온라인교육 검색어입력" value="<c:out value="${REQUEST_DATA.schMtSubName}"/>"><button class="btn-submit" onclick="fnSearch(); return false;" title="검색">검색</button>
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
												<dd><c:out value="${fn:substring(result.SUMMARY,0,56)}"/><c:if test="${fn:length(result.SUMMARY) > 54 }">...</c:if></dd>
											</dl>
											<a href="#none" onclick="fnCourseView('<c:out value="${result.MT_SUB_CODE}"/>'); return false;" class="btn-m green abs" title="<c:out value="${result.MT_SUB_NAME}"/> 상세보기">상세보기</a>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</ul>

					<p class="ac"><a href="#none"  class="more-w" title="더보기">더보기</a></p>
					<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>

				</div><!-- //contents-->



			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->

	</div><!-- //contents-wrap -->
	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->