
<%
	/* *******************************************
	 system  : 나의강의실 > 시험
	 title   : 메인
	 summary :	
	 wdate   : 2016-09-01
	 writer  : SANGS
	 ******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<c:set var="topMenuCode" value="main" />

<script type="text/javascript">
	function fnForm(examNo, cmd, edate, examTime, pupType, examType) {

		$("#examEdate").val(edate);
		$("#examTime").val(examTime);
		$("#pupType").val(pupType); // 출제방식 (순차, 랜덤)
		$("#examType").val(examType); // 시험유형 (사전, 사후)

		var progPercent = parseInt('<c:out value="${rowData.EXAM_PROG_PERCENT}"/>');
		var userPercent = parseInt('<c:out value="${progData.PROG_PER}"/>');

		//alert('현재 학습 진도율은 ' +userPercent+ '% 입니다.');

		$
				.ajax({
					url : "/classdesk/user/exam/leExamBeAfterCheck.do",
					data : {
						cseqno : '<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>',
						examType : examType,
						examNo : examNo
					},
					dataType : "json",
					type : 'post',
					success : function(data) {
						// 시험 결과보기
						if (cmd == 'review_form') {
							$('#examNo').val(examNo);
							$('form[name=frm]').attr('action',
									'/classdesk/user/exam/' + cmd + '.do')
									.submit();
						} else {
							// 사전시험
							if (examType == 'B') {

								if (data.beCheckCnt > 0) {
									alert('이미 사전시험에 참여하였습니다.');
									return;
								}

							} else if (examType == 'A') {
								// 사후시험
								if (data.beCheckCnt < 1) {
									alert('사전시험 참여 후, 사후시험 참여가 가능합니다.');
									return;
								}
								if (userPercent < 80) {
									alert('학습 진도율이 80% 이상일 때 사후시험 참여가 가능합니다.');
									return;
								}
							}

							if (confirm('시험은 제한 기간 내에 제출해야 하며\n한번만 응시 할 수 있습니다.\n\n시작 하시겠습니까?')) {
								$('#examNo').val(examNo);
								$('form[name=frm]').attr('action',
										'/classdesk/user/exam/' + cmd + '.do')
										.submit();
							}
						}

					},
					error : function(e) {
						alert("error :" + e.responseText);
					}
				});
	}
</script>
<div class="container" id="Subcontent">
	<article class="subArea">
		<div class="subCntWrap">

			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
			<div class="path">
				<ul>
					<li><span class="home text-hide">홈</span></li>
					<li>내강의실</li>
					<li class="active">시험</li>
				</ul>
			</div>
			<div class="subConts" id="sub-content">
				<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">시험 <span class="ico_sec syber">온라인교육</span> <span class="po_C7 fnt12"><c:out value="${REQUEST_DATA.ctypeName}" /> <c:out value="${REQUEST_DATA.seqTitle}" /></span></h2>
            		</div>           	
	            </section>
			
				
				<form name="frm" action="" method="post">
					<input type="hidden" name="subcmd" id="subcmd" value=""> 
					<input type="hidden" name="examNo" id="examNo" value=""> 
					<input type="hidden" name="examEdate" id="examEdate" value=""> 
					<input type="hidden" name="examTime" id="examTime" value=""> 
					<input type="hidden" name="pupType" id="pupType" value=""> 
					<input type="hidden" name="examType" id="examType" value=""> 
					<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK}"> 
					<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>" /> 
					<input type="hidden" name="ctypeName" id="ctypeName value="<c:out value="${REQUEST_DATA.ctypeName}"/>" /> 
					<input type="hidden" name="openType" id="openType" value="<c:out value="${rowData.OPENTYPE}"/>" />

					<!--  <section>
		        <div class="infoBox">
		            <div class="infoBody">
		                <p class="mrg_b10">- 과정학습에 필요한 학습자료는 자료실에서 다운로드 받으시길 바랍니다.</p>
		                <a href="#" class="btn btn-sm btn-default">자료실 바로가기 <span class="icon arr_rig"></span></a>
		            </div>
		        </div>
		    </section>	 -->

					<section>
						<c:choose>
							<c:when test="${not empty listData}">
								<div class="crdBoard ">
									<c:set var="lastRow" value="0" />
									<c:forEach items="${listData}" var="result" varStatus="status">
										<c:if test="${stat.index == 0 || stat.index % 2 == 0}">
											<c:if test="${stat.index % 2 == 0}">
												<c:set var="lastRow" value="${lastRow+1 }" />
											</c:if>
											<div class="row">
										</c:if>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="crdBox">
												<div class="boxInner">
													<%--  <c:if test="${empty result.USER_SUBMITYN && empty result.EXAM_SDATE}">class="edu-wrap new-type02"</c:if> 
											 <c:if test="${not empty result.USER_SUBMITYN || not empty result.EXAM_SDATE}">class="edu-wrap"</c:if> > --%>
													<dl
														<c:if test="${empty result.USER_SUBMITYN && empty result.EXAM_SDATE}">class="edubox"</c:if>
														<c:if test="${not empty result.USER_SUBMITYN || not empty result.EXAM_SDATE}">class="edubox bg-none"</c:if>>
														<dt class="dt_tit">
															<span class="po_C6 bold fnt19"> <c:if
																	test="${result.EXAM_TYPE == 'B'}">[사전시험]</c:if> <c:if
																	test="${result.EXAM_TYPE == 'A'}">[사후시험]</c:if> <c:out
																	value="${result.TITLE}" /> </span>
														</dt>
														<dd class="dd_study">
															<ul>
																<li class="li_dot2"><span class="ellipsis"><strong
																		class="po_C7">제출기간</strong> : ${result.SDATE} ~
																		${result.EDATE}</span></li>
																<c:choose>
																	<c:when test="${result.USER_SUBMITYN ne 'Y' }">
																		<li class="li_dot2"><span class="ellipsis"><strong
																				class="po_C7">배점</strong> : ${result.EVAL}점</span></li>
																	</c:when>
																	<c:when test="${result.USER_SUBMITYN eq 'Y'}">
																		<li class="li_dot2"><span class="ellipsis"><strong
																				class="po_C7">배점</strong> : ${result.SCORE}점 /
																				${result.EVAL}점</span></li>
																	</c:when>
																</c:choose>
															</ul>
														</dd>
													</dl>

													<div class="btnAreaC">
														<c:choose>
															<c:when test="${result.ENDYN eq 'Y' }">
																<span class="btn btn-lg btn-gray">기간 종료</span>
															</c:when>
															<c:when test="${result.EXAM_TYPE eq 'A' && (not empty result.CUSERNO || not empty result.USER_SUBMITYN)}">
																<!-- 사후시험 > 결과확인 -->
																<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>','review_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>', '<c:out value="${result.EXAM_TYPE}"/>'); return false;"  class="btn btn-lg btn-drkblue" title="결과보기 <c:out value="${result.USER_SUBMITYN}"/>">
																	<span class="gray">결과보기</span>
																</a>
															</c:when>
															<c:when
																test="${result.EXAM_TYPE eq 'B' && (not empty result.CUSERNO || not empty result.USER_SUBMITYN)}">
																<!-- 사전시험 > 결과확인 불가 -->
																<!-- <a href="#none" class="btn btn-lg btn-drkblue"><span
																	class="gray">응시완료</span></a> -->
																<%--  <a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>','review_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>', '<c:out value="${result.EXAM_TYPE}"/>'); return false;"  class="btn-m green abs" title="결과보기 <c:out value="${result.USER_SUBMITYN}"/>">
																	<span class="gray">결과보기</span>
																</a>  --%>
																<a href="#none" class="btn btn-lg btn-drkblue"><span class="gray">응시완료</span></a>
															</c:when>
															<c:when
																test="${empty result.CUSERNO && empty result.USER_SUBMITYN}">
																<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>','submit_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>', '<c:out value="${result.EXAM_TYPE}"/>'); return false;"
																	class="btn btn-lg btn-blue" title="응시하기 <c:out value="${result.USER_SUBMITYN}"/>">
																	<span class="blue">응시하기 <c:out value="${result.USER_SUBMITYN}" /></span>
																</a>
															</c:when>
														</c:choose>
													</div>
												</div>
												<!-- .boxInner -->
											</div>
											<!-- .crdBox -->
										</div>
										<!-- .col-md-6 col-sm-6 col-xs-12 -->
										<c:if
											test="${stat.index > 0 && stat.index % (2*lastRow) == 0}">
								</div>
								<!-- .row -->
								</c:if>
								</c:forEach>
			</div>
			<!-- .crdBoard -->
			</c:when>
			<c:otherwise>
				<section>
					<div class="borBox loginWrap">
						<span class="icoLogin testError"></span>
						<p class="cltTxt po_C9">등록된 시험이 없습니다.</p>
					</div>
				</section>
			</c:otherwise>
			</c:choose>
			</section>

			<%-- 
					<ul class="edu-list">
						<c:choose>
							<c:when test="${not empty listData}">
								<c:forEach items="${listData}" var="result" varStatus="status">
									<li class="add-item-pc add-item-tablet add-item-mobile">
									
										<div <c:if test="${empty result.USER_SUBMITYN && empty result.EXAM_SDATE}">class="edu-wrap new-type02"</c:if> 
											<c:if test="${not empty result.USER_SUBMITYN || not empty result.EXAM_SDATE}">class="edu-wrap"</c:if> >
											<dl <c:if test="${empty result.USER_SUBMITYN && empty result.EXAM_SDATE}">class="edubox"</c:if>
												<c:if test="${not empty result.USER_SUBMITYN || not empty result.EXAM_SDATE}">class="edubox bg-none"</c:if> >
												<dt class="w100">
												<c:if test="${result.EXAM_TYPE == 'B'}">[사전시험]</c:if>
												<c:if test="${result.EXAM_TYPE == 'A'}">[사후시험]</c:if>
												<c:out value="${result.TITLE}"/></dt>
												<dd class="info-wrap">
													<ul class="list-info">
														<li>
															<dl>
																<dt>제출기간 :</dt>
																<dd>${result.SDATE} ~ ${result.EDATE}</dd>
															</dl>
														</li>
														<li>
															<dl>
																<c:choose>
																	<c:when test="${result.USER_SUBMITYN ne 'Y' }">
																		<dt>배<span class="txt-margin"></span>점 :</dt>
																		<dd>${result.EVAL}점</dd>
																	</c:when>
																	<c:when test="${result.USER_SUBMITYN eq 'Y'}">
																		<dt>점수 :</dt>
																		<dd>${result.SCORE}점 / ${result.EVAL}점</dd>
																	</c:when>
																 </c:choose>
															</dl>
														</li>
													</ul>
												</dd>
											</dl>
											<c:choose>
												<c:when test="${result.ENDYN eq 'Y' }">
													<span class="btn-m abs">기간 종료</span>
												</c:when>
												<c:when test="${result.EXAM_TYPE eq 'A' && (not empty result.CUSERNO || not empty result.USER_SUBMITYN)}">
													<!-- 사후시험 > 결과확인 -->
													<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>','review_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>', '<c:out value="${result.EXAM_TYPE}"/>'); return false;"  class="btn-m green abs" title="결과보기 <c:out value="${result.USER_SUBMITYN}"/>">
														<span class="gray">결과보기</span>
													</a>
												</c:when>
												<c:when test="${result.EXAM_TYPE eq 'B' && (not empty result.CUSERNO || not empty result.USER_SUBMITYN)}">
													<!-- 사전시험 > 결과확인 불가 -->
													<a href="#none" class="btn-m gray abs"><span class="gray">응시완료</span></a>
												</c:when>
												<c:when test="${empty result.CUSERNO && empty result.USER_SUBMITYN}">
													<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>','submit_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>', '<c:out value="${result.EXAM_TYPE}"/>'); return false;"  class="btn-m green abs" title="응시하기 <c:out value="${result.USER_SUBMITYN}"/>">
														<span class="blue">응시하기 <c:out value="${result.USER_SUBMITYN}"/></span>
													</a>
												</c:when>
											</c:choose>
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="survey-mobile no-con" style="display:block; margin-left: 20px" >
									<p class="test-txt">등록된 시험이 없습니다.</p>
								</div>
							</c:otherwise>
						</c:choose>
								
					</ul>
				</form>		 --%>

		</div>
		<!-- //sub-contents -->
</div>
<!-- //sub-wrap -->
</article>
<!-- popup -->
<article>
	<div class="modal" id="jijum" tabindex="-1" role="dialog"
		aria-labelledby="jijumLabel" aira-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-modal="Close" title="닫기">
						<span aria-hidden="true" class="text-hide">닫기</span>
					</button>
					<h4 class="modal-title" id="jijumLabel">지점(지부) 검색</h4>
				</div>

			</div>
			<div class="modal-body">
				<section>
					<div class="searchWrap">
						<form>
							<fieldset>
								<legend class="sr-only">검색</legend>
								<div class="formSearch">
									<div class="onlyOneBtn">
										<input type="text" title="검색어입력" class="textBox">
										<button type="submit" name="button" class="btn-mint" title="검색">검색</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</section>
				<hr class="hr_20">
				<section>
					<div class="listScrollWrap borBox">
						<div class="listWrap">
							<ul>
								<li><a href="">충북청주지점(통합)</a></li>
								<li><a href="">서울은평구지점</a></li>
								<li><a href="">광주서구지점</a></li>
								<li><a href="">서울노원구지점(통합)</a></li>
								<li><a href="">경기하남</a></li>
							</ul>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</article>
<!-- //popup -->


</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
