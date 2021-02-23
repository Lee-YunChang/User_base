<%
	/****************************************************
	 system	: 종사자교육 > 집합과정
	 title	: 일반과정 신청 및 수강안내 목록
	 summary	:	
	 wdate	: 
	 writer	: 
	 *****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<c:set var="courseURL"
	value="/academy/course/public/main.do?mtCtypeCode=${REQUEST_DATA.mtCtypeCode}&form=E100" />
<script type="text/javascript">
	$(document).ready(function(){
		$('.modal-backdrop').click(function(){
			$('.modal-backdrop').hide();
			$("#join_pop").hide();
			/* $('body').css({overflow:'unset'}).unbind('touchmove'); */
		})
	});


	$(function(){
		if('${REQUEST_DATA.loan}' != "" && '${REQUEST_DATA.schSeqTitle}' == ""){
			/* $('body').css('overflow','hidden').bind('touchmove',function(e){e.preventDefault()}); */
			/* $(window).bind('touchmove',function(e){e.preventDefault()}); */
			var bodyHS = $('html').height(); 
			$("#join_pop").css('display','block');
			$('.modal-backdrop').attr('style','height:'+bodyHS+'px; '+'z-index:100;');
		}else {
			$("#join_pop").css('display','none');
		}
	});

	// 팝업 닫기
	function layerPop(){
		$("#join_pop").css('display','none');
		$('#schSeqTitle').focus();
		$('.modal-backdrop').hide();
		/* $('body').css({overflow:'unset'}).unbind('touchmove') */
	}
	
	//검색
	function fnSearch() {
		$('#schSeqTitleIncode').val(encodeURIComponent($('#schSeqTitle').val()));
		$('form[name=frm]').attr('target', '_self').attr('action',
				'<c:out value="${ctx}"/>/academy/course/offDetail.do');
		$('#frm').submit();

	}

	//과정신청
	function fnCourseApply(courseno, cseqno, cancelYn) {
		$('#cseqno').val(cseqno);
		$('#courseno').val(courseno);
		$('#mttype').val('집합과정');
		$('#cancelYn').val(cancelYn);
		$('form[name=frm]').attr('target', '_self').attr('action',
				'<c:out value="${ctx}"/>/academy/course/offForm.do');
		$('#frm').submit();

	}
</script>
<div class="modal-backdrop in"></div>
<div class="container" id="Subcontent">
	<article class="subArea">
		<div class="subCntWrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_offline.jsp"%>
			<div class="path">
				<ul>
					<li><span class="home text-hide">홈</span></li>
					<li>집합 교육</li>
					<li class="active"><c:out value="${depthName.REF2}" /></li>
				</ul>
			</div>
			<div class="subConts" id="sub-content">
			
				 <section class="bgTop_cate02"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit"><c:out value="${depthName.REF2}" /></h2>
            		</div>           	
	            </section>
			
		            <section>
		            	<div class="bluelineTabWrap">
		                	<ul class="bluelineTab">
		                		<c:set var="tot_cnt" value="0"/>
								<c:forEach items="${tabMenu}" var="result" varStatus="stat">
									<c:set var="tot_cnt" value="${tot_cnt+result.SEQ_CNT}"/>
									<li class="<c:if test="${REQUEST_DATA.mtScCode == result.MT_SUB_CODE}"> active</c:if>"><a title="${result.REF3}" href="/academy/course/offDetail.do?ref1=${result.REF1}&mtScCode=${result.MT_SUB_CODE}">${result.REF3}(${result.SEQ_CNT})</a></li>
								</c:forEach> 
								<li class="<c:if test="${REQUEST_DATA.mtScCode == ''}"> active</c:if>"><a title="전체" href="/academy/course/offDetail.do?ref1=${depthName.REF1}">전체(${tot_cnt})</a></li>
		                	</ul>
		                </div>
					</section>
				
				
				<hr>

				<section>
					<div class="searchWrap">
						<form name="frm" id="frm" action="/academy/course/offForm.do"
							method="get">
							<input type="hidden" name="courseno" id="courseno" value="" /> <input
								type="hidden" name="cseqno" id="cseqno" value="" /> <input
								type="hidden" name="cancelYn" id="cancelYn" value="" /> <input
								type="hidden" name="mtCtypeCode" id="mtCtypeCode"
								value="<c:out value='${REQUEST_DATA.mtCtypeCode}'/>" /> <input
								type="hidden" name="ref1" id="ref1"
								value="<c:out value="${REQUEST_DATA.ref1}"/>" /> <input
								type="hidden" name="eduMode" id="eduMode" value="J" />
							<!-- 집합: J 온라인교육 : E 특강: L -->
							<input type="hidden" name="mttype" id="mttype" value="" /> <input
								type="hidden" name="mtScCode" id="mtScCode"
								value="<c:out value='${REQUEST_DATA.mtScCode}'/>" />
							<input type="hidden" name="schSeqTitleIncode" id="schSeqTitleIncode" value="" />
							<fieldset>
								<legend class="sr-only">검색</legend>
								<div class="formSearch">
									<div class="onlyOneBtn">
										<input type="text" title="집합과정 검색어입력" name="schSeqTitle" id="schSeqTitle"
											class="textBox" style="border:1px solid #ebf0f6"
											value="<c:out value="${REQUEST_DATA.schSeqTitle}"/>">
										<button type="submit" name="button" class="btn-mint"
											onclick="fnSearch(); return false;" title="검색">검색</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</section>

				<section>
					<c:choose>
						<c:when test="${not empty listData}">
							<div class="crdBoard form3row"> <!-- hidden_row 더보기 class -->
								<c:set var="lastRow" value="0" />
								<c:forEach items="${listData}" var="result" varStatus="stat">
									<c:if test="${stat.first || stat.index % 2 == 0}">
										<c:if test="${stat.index % 2 == 0}">
											<c:set var="lastRow" value="${lastRow+1 }" />
										</c:if>
										<div class="row">
									</c:if>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<div class="crdBox">
											<div class="boxInner">
												<dl>
													<dt class="dt_tit">
														<span class="po_C6 bold fnt19 ellipsis">${result.SEQ_TITLE}</span>
													</dt>
													<dd class="dd_app">
														<ul>
															<li class="li_dot2"><span class="ellipsis"><strong
																	class="po_C7">신청기간</strong> : <c:if
																		test="${result.OPENTYPE == 'D'}">
																		<c:out value="${result.APPLY_SDATE}" /> ~ <c:out
																			value="${result.APPLY_EDATE}" />
																	</c:if>
																	<c:if test="${result.OPENTYPE == 'A'}">상시</c:if></span></li>
															<li class="li_dot2"><span class="ellipsis"><strong
																	class="po_C7">교육기간</strong> : <c:if
																		test="${result.OPENTYPE == 'D'}">
																		<c:out value="${result.STUDY_SDATE}" /> ~ <c:out
																			value="${result.STUDY_EDATE}" />
																	</c:if> <c:if test="${result.OPENTYPE == 'A'}"> 신청일로부터 <c:out
																			value="${result.EDUDAY}" />일 이내 </c:if> </span></li>
															<li class="li_dot2"><span class="ellipsis"><strong
																	class="po_C7">교육장소</strong> : <c:out
																		value="${result.EDU_PLACE}" /></span></li>
															<li class="li_dot2"><span class="ellipsis"><strong
																	class="po_C7">교육시간</strong> : <c:out
																		value="${result.STUDYTIME_TOT}" />분</span></li>
															<li class="li_dot2"><span class="ellipsis"><strong
																	class="po_C7">인원/정원</strong> : <c:out
																		value="${result.COURSE_USER_CNT}" />명/<c:out
																		value="${result.FIX_CNT}" />명</span></li>
														</ul>
													</dd>
												</dl>
												<div class="btnAreaC">
													<c:choose>
														<c:when test="${result.CANCEL_YN eq 'Y'}">
															<c:choose>
																<c:when test="${result.COMPYN eq 'Y'}">
																	<a href="#none" class="btn btn-lg btn-gray"
																		onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;"
																		title="<c:out value="${result.SEQ_TITLE}"/> 신청하기">신청하기</a>
																</c:when>
																<c:otherwise>
																	<a href="#none" class="btn btn-lg btn-blue"
																		onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;"
																		title="<c:out value="${result.SEQ_TITLE}"/> 신청하기">신청하기</a>
																</c:otherwise>
															</c:choose>
														</c:when>
														<c:when test="${result.CANCEL_YN eq 'S'}">
															<a href="#none" class="btn btn-lg btn-gray"
																onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;"
																title="<c:out value="${result.SEQ_TITLE}"/> 신청예정">신청예정</a>
														</c:when>
														<c:when test="${result.CANCEL_YN eq 'N'}">
															<a href="#none" class="btn btn-lg btn-gray"
																onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;"
																title="<c:out value="${result.SEQ_TITLE}"/> 신청마감">신청마감</a>
														</c:when>
													</c:choose>
												</div>
											</div>
											<!-- .boxInner -->
										</div>
										<!-- .crdBox -->
									</div>
									<c:choose>
										<c:when test="${stat.count % (2*lastRow) == 0}"></div></c:when>
										<c:when test="${fn:length(listData) == stat.count}"></div></c:when>
									</c:choose>
							</c:forEach>
			</div>
			</c:when>
			<c:otherwise>
				<c:if test="${REQUEST_DATA.schSeqTitle ne ''}">
					<hr>
					<table class="boardList">
						<tr>
							<td class="text-center"><strong class="fnt16 po_C7">검색
									결과가 없습니다.</strong></td>
						</tr>
					</table>
				</c:if>
			</c:otherwise>
			</c:choose>
			</section>


		 <!-- popup 대출이용자 팝업-->
        <article id="join_pop" style="display: none; z-index: 100">
                <div class="normal main_pop" tabindex="1" style="border: 0px;">
                    <div class="modal-content">
                        <div class="modal-header" tabindex="1">
                            <button tabindex="1" type="button" class="close" onclick="layerPop(); return false" title="닫기"><span aria-hidden="true" class="text-hide">닫기</span></button>
                            <h4 class="modal-title" id="jijumLabel">대출이용자 교육 안내</h4>
                        </div>
                    </div>
                    
                    <div class="modal-body" style="height:540px;overflow-y:auto" tabindex="1">
                    	<div class="infoBox" tabindex="0">
                    		<p class="mrg_t10">서민금융 진흥원의 <span class="bold po_C4 fnt16">창업자금 신청자, 운영자금 및 시설개선자금 신청자, 대학생&middot;청년 햇살론 신청자</span>는 교육 홈페이지에서 회원가입 후 의무교육을 이수하여야 합니다.</p>
                    		<p class="mrg_t15">각 교육대상별 의무교육 시간 및 교육 방법은 아래와 같습니다.</p>
                    	</div>
                    	
                    	<hr>
                    	<c:if test="${REQUEST_DATA.mtScCode == 'SC5001' || REQUEST_DATA.mtScCode == ''}">
	                        <section tabindex="0">
	                        	<h4 class="sub_tit">창업자금 신청자</h4>
	                            <div class="tblWrap">
	                               <table class="dataTbl text-center">
	                                 	<caption>창업자금 신청자 교육안내</caption>
	                                 	<colgroup>
	                                 		<col style="width:13%">
	                                 		<col style="width:13%">
	                                 		<col style="width:*">
	                                 	</colgroup>
	                                 	<thead>
	                                 		<tr>
	                                 			<th scope="col">교육구분</th>
	                                 			<th scope="col">교육시간</th>
	                                 			<th scope="col">교육방법</th>
	                                 		</tr>
	                                 	</thead>
	                                 	<tbody>
	                                 		<tr>
	                                 			<td>창업</td>
	                                 			<td>12시간</td>
	                                 			<td class="text-left">
	                                 				<ul class="mrg_t10 mrg_b10">
	                                 					<li class="li_dot wordBrk"><div class="bold">수도권 거주자[집합교육]</div>
	                                 						<ul class="li_dash">
	                                 							<li><strong class="bold po_C4">집합교육&gt;대출이용자교육&gt;미소금융</strong> 메뉴에서 현재 개설된 교육이수</li>
	                                 						</ul>
	                                 					</li>
	                                 					<li class="mrg_t10 li_dot wordBrk"><div class="bold">수도권 외 거주자[온라인교육]</div>
	                                 						<ul class="li_dash">
	                                 							<li><strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong> 메뉴에서 총 12시간 교육 이수</li>
	                                 						</ul>
	                                 					</li>
	                                 				</ul>
	                                 			</td>
	                                 		</tr>
	                                 	</tbody>
	                                 </table>
	                            </div>
	                        </section>
                        </c:if>
                        <hr>
                        <c:if test="${REQUEST_DATA.mtScCode == 'SC5002' || REQUEST_DATA.mtScCode == ''}">
	                        <section tabindex="0">
	                        	<h4 class="sub_tit">운영자금 및 시설개선자금 신청자</h4>
	                            <div class="tblWrap">
	                               <table class="dataTbl text-center">
	                                 	<caption>운영자금 및 시설개선자금 신청자 교육안내</caption>
	                                 	<colgroup>
	                                 		<col style="width:13%">
	                                 		<col style="width:13%">
	                                 		<col style="width:*">
	                                 	</colgroup>
	                                 	<thead>
	                                 		<tr>
	                                 			<th scope="col">교육구분</th>
	                                 			<th scope="col">교육시간</th>
	                                 			<th scope="col">교육방법</th>
	                                 		</tr>
	                                 	</thead>
	                                 	<tbody>
	                                 		<tr>
	                                 			<td>사업운영</td>
	                                 			<td>4시간</td>
	                                 			<td class="text-left">
	                                 				<ul class="mrg_t10 mrg_b10">
	                                 					<li class="li_dot wordBrk">
	                                 						<strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong> 메뉴에서 총 4시간 교육 이수
	                                 					</li>
	                                 				</ul>
	                                 			</td>
	                                 		</tr>
	                                 	</tbody>
	                                 </table>
	                            </div>
	                        </section>
                        </c:if>
                        <hr>
                        <c:if test="${REQUEST_DATA.mtScCode == 'SC5003' || REQUEST_DATA.mtScCode == ''}">
	                        <section tabindex="0">
	                        	<h4 class="sub_tit">대학생&middot;청년 햇살론 신청자</h4>
	                            <div class="tblWrap">
	                               <table class="dataTbl text-center">
	                                 	<caption>대학생&middot;청년 햇살론 신청자 교육안내</caption>
	                                 	<colgroup>
	                                 		<col style="width:13%">
	                                 		<col style="width:13%">
	                                 		<col style="width:*">
	                                 	</colgroup>
	                                 	<thead>
	                                 		<tr>
	                                 			<th scope="col">교육구분</th>
	                                 			<th scope="col">교육시간</th>
	                                 			<th scope="col">교육방법</th>
	                                 		</tr>
	                                 	</thead>
	                                 	<tbody>
	                                 		<tr>
	                                 			<td>금융</td>
	                                 			<td>-</td>
	                                 			<td class="text-left">
	                                 				<ul class="mrg_t10 mrg_b10">
	                                 					<li class="li_dot wordBrk">
	                                 						<strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong> 메뉴에서 한 개 과정 이상 이수
	                                 					</li>
	                                 				</ul>
	                                 			</td>
	                                 		</tr>
	                                 	</tbody>
	                                 </table>
	                            </div>
	                        </section>
                        </c:if>
                    </div>
                </div>
           
        </article>
        <!-- //popup -->

		</div>
		<!-- //sub-contents -->
</div>
<!-- //sub-wrap -->
</article>
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->