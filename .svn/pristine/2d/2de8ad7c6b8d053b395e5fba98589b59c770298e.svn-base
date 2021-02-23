<%
/****************************************************
	system	: 종사자교육 > 집합과정
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
<c:set var="courseURL" value="/academy/course/public/main.do?mtCtypeCode=${REQUEST_DATA.mtCtypeCode}&form=E100"/>
<script type="text/javascript">


//검색
function fnSearch(){
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/enfsnOffDetail.do');
	$('#frm').submit();

}

//과정신청
function fnCourseApply(courseno, cseqno, cancelYn){
	$('#cseqno').val(cseqno);
	$('#courseno').val(courseno);
	$('#mttype').val('집합과정');
	$('#cancelYn').val(cancelYn);
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/enfsnOffForm.do');
	$('#frm').submit();

}

</script>

	<div class="contents-wrap c302">

		<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_enfsn_course.jsp"%>
			
			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>종사자교육</span></li>
					<li class="location"><span>집합과정</span></li>
				</ul>

				<div class="sub-tit">
					<h3>집합과정</h3>
				</div>

				<div class="contents" id="sContents">

						<form name="frm" id="frm" action="/academy/course/enfsnOffForm.do" method="post">
			                <input type="hidden" name="courseno" id="courseno" value=""/>
			                <input type="hidden" name="cseqno" id="cseqno" value=""/>
			                <input type="hidden" name="cancelYn" id="cancelYn" value=""/>
			                <input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value='${REQUEST_DATA.mtCtypeCode}'/>"/>
			                <input type="hidden" name="eduMode" id="eduMode" value="J"/><!-- 집합: J 온라인교육 : E 특강: L -->
			                <input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value='${REQUEST_DATA.mtScCode}'/>"/>
			                <input type="hidden" name="mttype" id="mttype" value=""/>

							<div class="serch-box">
								<input type="text" name="schSeqTitle" title="집합과정 검색어입력" value="<c:out value="${REQUEST_DATA.schSeqTitle}"/>"><button class="btn-submit" onclick="fnSearch(); return false;" title="검색">검색</button>
							</div>
			            </form>
									
						<div class="tabArea">
							
							<div>
								
								<ul class="edu-list">
								 <c:choose>
				                    <c:when test="${not empty listData}">
				                    <c:forEach items="${listData}" var="result" varStatus="stat">
									<li>
										<div class="edu-wrap type02">
											<dl>
												<dt><c:out value="${result.SEQ_TITLE}"/></dt>
												<dd class="info-wrap">
													<ul class="list-info">
													
														<li>
															<dl>
																<dt>신청기간 :</dt>
																<dd><span class="txt_red"><c:out value="${result.APPLY_SDATE}"/> ~ <c:out value="${result.APPLY_EDATE}"/></span></dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>교육기간 :</dt>
																<dd><c:out value="${result.STUDY_SDATE}"/> ~ <c:out value="${result.STUDY_EDATE}"/></dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>교육장소 :</dt>
																<dd><c:out value="${result.EDU_PLACE}"/></dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>교육시간 :</dt>
																<dd><c:out value="${result.STUDYTIME_TOT}"/>시간</dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>인원/정원 :</dt>
																<dd><c:out value="${result.COURSE_USER_CNT}"/>명/<c:out value="${result.FIX_CNT}"/>명</dd>
															</dl>
														</li>
													</ul>
												</dd>
											</dl>
											<c:choose>
												<c:when test="${result.CANCEL_YN eq 'Y'}">
													<a href="#none" onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;" class="btn-m blue abs" title="<c:out value="${result.SEQ_TITLE}"/> 신청하기">신청하기</a>
												</c:when>
												<c:when test="${result.CANCEL_YN eq 'S'}">
													<a href="#none" onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;" class="btn-m green abs" title="<c:out value="${result.SEQ_TITLE}"/> 신청예정">신청예정</a>
												</c:when>
												<c:when test="${result.CANCEL_YN eq 'N'}">
													<a href="#none" onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;" class="btn-m red abs" title="<c:out value="${result.SEQ_TITLE}"/> 신청마감">신청마감</a>
												</c:when>
											</c:choose>
										</div>
									</li>
									
									</c:forEach>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
								</ul>

								<p class="ac"><a href="#none"  class="more-w" title="더보기">더보기</a></p>
							</div>
						</div> <!-- // tab -->

						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


					</div><!-- //contents-->


			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->

	</div><!-- //contents-wrap -->
	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->