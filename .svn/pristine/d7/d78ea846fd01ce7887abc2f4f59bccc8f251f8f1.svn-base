
<%
	/****************************************
	 subject	: 나의공간  > 신청내역
	 summary	:
	 author	: 이진영
	 date	: 2016-09-27
	 ****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	//상세
	function fnAprsltView(slno) {
		var frm = document.frm;
		frm.target = "";
		frm.slno.value = slno;
		$("#frm").attr("action", "/academy/myclass/aprsltView.do");
		frm.submit();
	}

	//방문교육 신청
	function fnApply() {
		var frm = document.frm;
		frm.target = "";
		$("#frm").attr("action", "/academy/myclass/aprsltForm.do");
		frm.submit();
	}

	//특강과정 신청취소
	function fnCancel(slno) {
		if ($('#multipleCancelYn').val() == 'Y') {
			alert('취소중입니다 잠시만 기다려주세요.');
			return false;
		}

		var msg = '신청을 취소하시겠습니까?';
		if (confirm(msg)) {
			$('#multipleCancelYn').val('Y');
			//$('input[name=paymentUid]').val(paymentUid);
			$('input[name=slno]').val(slno);
			$('#frm')
					.attr('target', '_self')
					.attr('method', 'post')
					.attr('action',
							'<c:out value="${ctx}"/>/academy/course/common/specialLectureCancel_exec.do')
					.submit();
		}
	}
</script>
<div class="container" id="Subcontent">
	<article class="subArea">
		<div class="subCntWrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
			<div class="path">
                <ul>
                    <li><span class="home text-hide">홈</span></li>
                    <li>내강의실</li>
                    <li class="active">방문교육 신청내역</li>
                </ul>
            </div>
			<div class="subConts" id="sub-content">
				<section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">방문교육 신청내역</h2>
            		</div>           	
	            </section>

				<form name="frm" id="frm" action="/academy/myclass/aprsltView.do" method="post">
					<input type="hidden" name="slno" id="slno" value="" /> <input
						type="hidden" name="multipleCancelYn" id="multipleCancelYn"
						value="N" /> <input type="hidden" name="eduMode" value="S" />
				</form>
				
				
				
				<section>
					<div class="infoBox">
						<div class="infoBody">
							<p class="mrg_b10">- 방문교육을 희망하시는 분들은 아래 방문교육을 신청을 작성하여
								주시기 바랍니다.</p>
							<a title="방문교육 신청" href="/academy/course/lectureForm.do" class="btn btn-sm btn-default">방문교육 신청 <span
								class="icon arr_rig"></span></a>
						</div>
					</div>
				</section>
				
				
				
				
				
				<section>
						<c:choose>
							<c:when test="${not empty resultList}">
								<div class="crdBoard hidden_row form3row">
									
									<c:set var="lastRow" value="0"/>
									
									<c:forEach items="${resultList}" var="result" varStatus="stat">
									
									<c:if test="${stat.first || stat.index % 2 == 0}">
										<c:if test="${stat.index % 2 == 0}">
											<c:set var="lastRow" value="${lastRow+1 }" />
										</c:if>
										<div class="row">
									</c:if>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div class="crdBox">
													<div class="boxInner">
														<div class="ulcrdBox">
															<dl>

																<dd class="dd_app">
																	<ul>
																		<li class="li_dot2"><span class="ellipsis"><strong
																				class="po_C7">소속</strong> : <c:out
																					value="${result.APPLY_ORGAN_NM}" /></span></li>
																		<li class="li_dot2"><span class="ellipsis"><strong
																				class="po_C7">교육 희망일</strong> : <c:out
																					value="${result.EDU_SDATE}" /> ~ <c:out
																					value="${result.EDU_EDATE}" /></span></li>
																		<c:choose>
																			<c:when test="${result.MT_LEC_STATUS_CODE eq 'LE0001'}">
																				<li class="li_dot2"><span class="ellipsis"><strong
																					class="po_C7">교육 협의일</strong> : 승인 대기증</span></li>
																			</c:when>
																			<c:otherwise>
																				<li class="li_dot2"><span class="ellipsis"><strong
																					class="po_C7">교육 협의일</strong> : <c:out
																						value="${result.DS_SDATE}" /> ~ <c:out
																						value="${result.DS_EDATE}" /></span></li>
																			</c:otherwise>
																		</c:choose>
																		<li class="li_dot2"><span class="ellipsis"><strong
																				class="po_C7">교육 장소</strong> : <c:out
																					value="${result.EDU_AREA}" /></span></li>
																		<li class="li_dot2"><span class="ellipsis"><strong
																				class="po_C7">교육 희망주제</strong> : <c:out
																					value="${result.mtLctreName}" /></span></li>
																		<li class="li_dot2"><span class="ellipsis"><strong
																				class="po_C7">참석 인원</strong> : <c:out
																					value="${result.PERSON_CNT}" />명</span></li>
																	</ul>
																</dd>
															</dl>
														</div>
														<div class="btnAreaC">
															<button
																onclick="fnAprsltView('<c:out value="${result.SLNO}"/>'); return false;"
																title="자세히보기" class="btn btn-lg btn-default">자세히
																보기</button>

															<c:choose>
																<c:when test="${result.MT_LEC_STATUS_CODE eq 'LE0001'}">
																	<button onclick="fnCancel('<c:out value="${result.SLNO}"/>'); return false;" class="btn btn-lg btn-orange" title="신청취소">신청취소</button>
																</c:when>
																<c:when test="${result.MT_LEC_STATUS_CODE eq 'LE0002'}">
																	<button class="btn btn-lg btn-gray" title="배정요청">승인완료</button>
																</c:when>
																<c:when test="${result.MT_LEC_STATUS_CODE eq 'LE0003'}">
																	<button class="btn btn-lg btn-gray" title="강사배정">승인완료</button>
																</c:when>
																<c:when test="${result.MT_LEC_STATUS_CODE eq 'LE0004'}">
																	<button class="btn btn-lg btn-gray" title="신청마감">승인완료</button>
																</c:when>
																<c:when test="${result.MT_LEC_STATUS_CODE eq 'LE0005'}">
																	<button class="btn btn-lg btn-gray" title="신청마감">승인거절</button>
																</c:when>
																<c:when test="${result.MT_LEC_STATUS_CODE eq 'LE0006'}">
																	<button class="btn btn-lg btn-gray" title="교육종료">교육종료</button>
																</c:when>
																<c:otherwise></c:otherwise>
															</c:choose>
														</div>
													</div>
												</div>
											</div>
										
										<c:if test="${stat.count % (2*lastRow) == 0}">
											</div>
										</c:if>
										
										
										</c:forEach>
								</div>
								<c:if test="${fn:length(resultList) > 4}">
									<div class="btnListmoreWrap">
										<button type="button" name="" class="btnListmore bold" title="더보기">
											더보기 &nbsp; <img src="/academy/images/common/down.png"
												alt="더보기">
										</button>
									</div>
								</c:if>
						  </c:when>
				
						<c:otherwise>
						<hr>
						<table class="boardList">
							<tr>
								<td class="text-center">
									<c:if test="${empty resultList}">
										<div class="survey-mobile no-con" style="display: block">
											<strong class="fnt16 po_C7">신청내역이 없습니다.</strong>
										</div>
									</c:if>
								</td>
							</tr>
						</table>
						</c:otherwise>
					</c:choose>
				
				</div>
				
					

		 		</section>

			</div>
		</div>
		</div>
		<!-- //contents-->
</div>
<!-- //sub-contents -->

</div>
</article>
</div>
<!-- footer -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
