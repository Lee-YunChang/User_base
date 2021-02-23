
<%
	/****************************************************
	 system	: 일반교육 > 온라인과정
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
<c:set var="courseURL" value="/academy/course/public/main.do?mtCtypeCode=${REQUEST_DATA.mtCtypeCode}&form=E100" />
<script type="text/javascript">
	$(document).ready(function(){
		$('.modal-backdrop').click(function(){
			$('.modal-backdrop').hide();
			$("#join_pop").hide();
			/* $('body').css({overflow:'unset'}).unbind('touchmove'); */
		})
	});
	
	$(function() {
		if ('${REQUEST_DATA.loan}' != "" && '${REQUEST_DATA.schSeqTitle}' == '' && '${REQUEST_DATA.mtScCode}' != "") {
			    var bodyHS = $('html').height(); 
			    $("#join_pop").css('display', 'block');
			    $('.modal-backdrop').attr('style','height:'+bodyHS+'px; '+'z-index:100;');
		} else {
			$("#join_pop").css('display', 'none');
		}
	});

	// 팝업 닫기
	function layerPop() {
		$("#join_pop").css('display', 'none');
		$('#schSeqTitle').focus();
		$('.modal-backdrop').hide();
		/* $('body').css({overflow:'unset'}).unbind('touchmove') */
	  
	}

	//검색
	function fnSearch() {
		$('#schSeqTitleIncode')
				.val(encodeURIComponent($('#schSeqTitle').val()));

		$('form[name=frm]').attr('target', '_self').attr('action',
				'<c:out value="${ctx}"/>/academy/course/onDetail.do');
		$('#frm').submit();
	}

	//과정신청
	function fnCourseApply(courseno, cseqno, cancelYn) {
		$('#cseqno').val(cseqno);
		$('#courseno').val(courseno);
		$('#mttype').val('온라인과정');
		$('#cancelYn').val(cancelYn);
		$('form[name=frm]').attr('target', '_self').attr('action',
				'<c:out value="${ctx}"/>/academy/course/onForm.do');
		$('#frm').submit();

	}
	
 	//PC, 모바일 구분 -- 2019 07 서혁진추가
	$(function(){
		var windowWidth = $(window).width();
		if(windowWidth < 768) {
 			//창 가로 크기가 768 미만일 경우 
 			 $("[id^='clear']").css('clear','left'); 			
			}
		$( window ).resize(function() {
	 			//창 가로 크기가 768 미만일 경우 
	 			var windowWidth = $(window).width();
	 			if(windowWidth < 768) {
	 			 $("[id^='clear']").css('clear','left'); 			
		}
	 			else{
	 				$("[id^='clear']").css('clear',''); 
	 			}
		});
	});
 	


</script>

<div class="modal-backdrop in"></div>
<div class="container" id="Subcontent">
	<article class="subArea">
		<div class="subCntWrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_online.jsp"%>
			<div class="path">
				<ul>
					<li><span class="home text-hide"></span></li>
					<li>온라인 교육</li>
					<li class="active"><c:out value="${depthName.REF2}" /></li>
				</ul>
			</div>

			<div class="subConts" id="sub-content">
				<section class="bgTop_cate01">
					<!--   카테고리별 이미지 추가  -->
					<div class="contTop">
						<h2 class="h2_tit" id="TT">
							<c:out value="${depthName.REF2}" />
						</h2>
					</div>
				</section>


				<section>
					<div class="bluelineTabWrap">
						<ul class="bluelineTab">
							<c:set var="tot_cnt" value="0" />
							<c:forEach items="${tabMenu}" var="result" varStatus="stat">
								<li class="<c:if test="${REQUEST_DATA.mtScCode == result.MT_SUB_CODE}"> active</c:if>"><a title="${result.REF3}" href="/academy/course/onDetail.do?ref1=${result.REF1}&mtScCode=${result.MT_SUB_CODE}">${result.REF3} <c:if test="${result.MT_SUB_CODE == 'SC1001'}">(${result.SEQ_CNT*2})<c:set var="tot_cnt" value="${tot_cnt+result.SEQ_CNT*2}" />
										</c:if> <c:if test="${result.MT_SUB_CODE != 'SC1001'}">(${result.SEQ_CNT})<c:set var="tot_cnt" value="${tot_cnt+result.SEQ_CNT}" />
										</c:if>
								</a></li>
							</c:forEach>
							<li class="<c:if test="${REQUEST_DATA.mtScCode == ''}"> active</c:if>"><a title="전체" href="/academy/course/onDetail.do?ref1=${depthName.REF1}">전체(${tot_cnt})</a></li>
						</ul>
					</div>
				</section>

				<hr>
				<section>
					<div class="searchWrap">
						<form name="frm" id="frm" action="/academy/course/onForm.do" method="get">
							<input type="hidden" name="courseno" id="courseno" value="" /> <input type="hidden" name="cseqno" id="cseqno" value="" /> <input type="hidden" name="cancelYn" id="cancelYn" value="" /> <input type="hidden" name="ref1" id="ref1" value="<c:out value="${REQUEST_DATA.ref1}"/>" /> <input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value='${REQUEST_DATA.mtCtypeCode}'/>" /> <input type="hidden" name="eduMode" id="eduMode" value="E" />
							<!-- 집합: J 온라인교육 : E 특강: L -->
							<input type="hidden" name="mttype" id="mttype" value="" /> <input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value='${REQUEST_DATA.mtScCode}'/>" /> <input type="hidden" name="schSeqTitleIncode" id="schSeqTitleIncode" value="" />
							<fieldset>
								<legend class="sr-only">검색</legend>
								<div class="formSearch">
									<div class="onlyOneBtn">
										<input type="text" title="온라인과정 검색어입력" name="schSeqTitle" id="schSeqTitle" class="textBox" style="border: 1px solid #ebf0f6" value="<c:out value="${REQUEST_DATA.schSeqTitle}"/>">
										<button type="submit" name="button" class="btn-mint" onclick="fnSearch(); return false;" title="검색">검색</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</section>


				<section>
					<c:choose>
						<c:when test="${not empty listData}">
							<div class="crdBoard form3row">
								<!-- hidden_row 더보기 class -->

								<c:set var="lastRow" value="0" />
								<c:forEach items="${listData}" var="result" varStatus="stat">
									<c:if test="${stat.first || stat.index % 4 == 0}">
										<c:if test="${stat.index % 4 == 0}">
											<c:set var="lastRow" value="${lastRow+1 }" />
										</c:if>
										<div class="row">
									</c:if>
									<!-- 기존 부트스트랩 START  -->
									<!-- 									<div class="col-md-3 col-sm-3 col-xs-12"> -->
									<!-- 기존 부트스트랩 END  -->

									<!-- 201907 변경 부트스트랩 START   -->
									<c:choose>
										<c:when test="${stat.count %4 ==3}">
											<div id="clear_${stat.count}" class="col-xs-6 col-sm-3 col-md-3">
										</c:when>
										<c:otherwise>
											<div class="col-xs-6 col-sm-3 col-md-3">
										</c:otherwise>
									</c:choose>
									<!-- 201907 변경 부트스트랩 END   -->
									<div class="crdBox online">
										<div class="boxInner">
											<dl>
												<%-- 2019-07 서혁진 주석처리 --%>
												<%-- 	<dt class="dt_tit">
														<span class="po_C6 bold fnt19">${result.SEQ_TITLE}</span>
													</dt> --%>
													<!-- 201905 손혜연 썸네일 추가 START -->
													<dd class="dd_tit">
													 <%-- <img src="/sangs-data/course/${result.SAVFILE}"/> --%>
															<!-- 로컬 -->
															 <%-- <img src="<c:out value='${result.SAVPATH}/${result.SAVFILE}'/>"/> --%>
															 <img src="/five/${result.SAVFILE}"/>
														  
													</dd>
													<dt class="dt_tit">
													<span class="po_C6 bold fnt19">${result.SEQ_TITLE}</span>
														<!-- <span class="po_C6 bold fnt19">(2과목)간편장부 쓰는 요령과 전자 세금계산서</span> -->
 													</dt>
													<!-- 201905 손혜연 썸네일 추가 END -->
													<!--  기존 소스 START -->
											<%-- 		<dd class="dd_app">
														<ul>
															<li class="li_dot2"><span class="ellipsis"><strong
																	class="po_C7">교육시간</strong> : <c:if
																		test="${result.OPENTYPE == 'A'}">
																		<c:out value="${result.STUDYTIME_TOT}" />분
																	</c:if></span></li>
															<li class="li_dot2"><span class="ellipsis"> <strong class="po_C7">수료기준</strong> : 
																	 <c:if test="${result.OPENTYPE == 'A'}">
																 		<c:out value="${result.COMP_VAL}" />점
																	</c:if> </span></li> <strong class="po_C7">차시</strong>
																	: <c:if test="${result.OPENTYPE == 'A'}">
																		<c:out value="${result.TREECNT}" />차시
																	</c:if>
															</span></li>
														</ul>
													</dd> --%>
													<!--  기존 소스 END -->																								
												</dl>
												<!--  2019-07-15 서혁진 기존 소스 수정 -->
												<div style="float:left">
												<span class="ellipsis6">
													<c:if test="${result.OPENTYPE == 'A'}">
														<c:out value="${result.STUDYTIME_TOT}" />분
													</c:if>
													/
													<%-- <strong class="po_C7">수료기준</strong> : 
													<c:if test="${result.OPENTYPE == 'A'}">
													<c:out value="${result.COMP_VAL}" />점
													</c:if> 
													</span> --%>
														<c:if test="${result.OPENTYPE == 'A'}">
															 <c:out value="${result.STUDYTIME}" />차시
														</c:if>
													</span>
												</div>
												<!-- 2019-07-15 서혁진 기존 소스 수정 끝 -->
											<div class="btnAreaC">
												<c:choose>
													<c:when test="${result.CANCEL_YN eq 'Y'}">
														<c:choose>
															<c:when test="${result.COMPYN eq 'Y'}">
																<a href="#none" class="btn btn-lg btn-gray" onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;" title="<c:out value="${result.SEQ_TITLE}"/> 신청하기">상세보기</a>
															</c:when>
															<c:otherwise>
																<a href="#none" class="btn btn-lg btn-blue" onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;" title="<c:out value="${result.SEQ_TITLE}"/> 신청하기">상세보기</a>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:when test="${result.CANCEL_YN eq 'S'}">
														<a href="#none" class="btn btn-lg btn-gray" onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;" title="<c:out value="${result.SEQ_TITLE}"/> 신청예정">신청예정</a>
													</c:when>
													<c:when test="${result.CANCEL_YN eq 'N'}">
														<a href="#none" class="btn btn-lg btn-gray" onclick="fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>', '<c:out value="${result.CANCEL_YN}"/>'); return false;" title="<c:out value="${result.SEQ_TITLE}"/> 신청마감">신청마감</a>
													</c:when>
												</c:choose>
											</div>
										</div>
										<!-- .boxInner -->
									</div>
									<!-- .crdBox -->
							</div>

							<!-- .col-md-6 col-sm-6 col-xs-12 -->
							<c:choose>
								<c:when test="${stat.count % (4*lastRow) == 0}">
			</div>
			</c:when>
			<c:when test="${fn:length(listData) == stat.count}">
		</div>
		</c:when>
		</c:choose>
		</c:forEach>
</div>
</c:when>
<c:otherwise>
	<c:if test="${REQUEST_DATA.schSeqTitle ne ''}">
		<hr>
		<table class="boardList">
			<tr>
				<td class="text-center">
					<strong class="fnt16 po_C7">검색 결과가 없습니다.</strong>
				</td>
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
				<button tabindex="1" type="button" class="close" onclick="layerPop(); return false" title="닫기">
					<span aria-hidden="true" class="text-hide">닫기</span>
				</button>
				<c:if test="${REQUEST_DATA.ref1 eq 'LON'}">
					<h4 class="modal-title" id="jijumLabel">대출이용자 교육 안내</h4>
				</c:if>
				<%-- <c:if test="${REQUEST_DATA.ref1 eq 'ORGAN'}">
					<h4 class="modal-title" id="jijumLabel">기관별 맞춤형 교육</h4>
				</c:if> --%>
			</div>
		</div>

		<div class="modal-body" style="height: 540px; overflow-y: auto" tabindex="1">
			<c:if test="${REQUEST_DATA.mtScCode == 'SC1001' || REQUEST_DATA.mtScCode == 'SC1002'}">
				<div class="infoBox">
					<p class="mrg_t10">
						상상스토리의 <span class="bold po_C4 fnt16">창업자금 신청자, 운영자금 및 시설개선자금 신청자, 대학생&middot;청년 햇살론 신청자</span>는 본 홈페이지에서 회원가입 후 필수교육을 이수하여야 합니다.
					</p>
					<p class="mrg_t15">각 교육대상별 필수교육 시간 및 교육 방법은 아래와 같습니다.</p>
				</div>
			</c:if>
			<%-- <c:if test="${REQUEST_DATA.mtScCode == 'SC4001'}">
				<div class="infoBox">
					<p class="mrg_t10">
						<span class="bold po_C4 fnt16">희망·내일키움 통장</span>대상자분들을 위한 교육과정입니다.
					</p>
				</div>
			</c:if>
			<c:if test="${REQUEST_DATA.mtScCode == 'SC4002'}">
				<div class="infoBox">
					<p class="mrg_t10">
						<span class="bold po_C4 fnt16">경기도 일하는 청년통장</span>대상자분들을 위한 교육과정입니다.
					</p>
				</div>
			</c:if> --%>

			<hr>
			<c:if test="${REQUEST_DATA.mtScCode == 'SC1001'}">
				<section>
					<h4 class="sub_tit">창업자금 신청자</h4>
					<div class="tblWrap">
						<table class="dataTbl text-center">
							<caption>창업자금 신청자 교육안내</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: 13%">
								<col style="width: *">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">교육구분</th>
									<th scope="col">교육과목</th>
									<th scope="col">교육방법</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>미소금융</td>
									<td>12과목</td>
									<td class="text-left">
										<ul class="mrg_t10 mrg_b10">
											<li class="li_dot wordBrk"><strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong> 메뉴에서 총 12과목 필수 이수</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
				<hr>
				<section>
					<h4 class="sub_tit">운영자금 및 시설개선자금 신청자</h4>
					<div class="tblWrap">
						<table class="dataTbl text-center">
							<caption>운영자금 및 시설개선자금 신청자 교육안내</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: 13%">
								<col style="width: *">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">교육구분</th>
									<th scope="col">교육과목</th>
									<th scope="col">교육방법</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>미소금융</td>
									<td>4과목</td>
									<td class="text-left">
										<ul class="mrg_t10 mrg_b10">
											<li class="li_dot wordBrk"><strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong> 메뉴에서 총 4과목 필수 이수</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
			</c:if>

			<hr>
			<c:if test="${REQUEST_DATA.mtScCode == 'SC1002'}">
				<section>
					<h4 class="sub_tit">대학생&middot;청년 햇살론 신청자</h4>
					<div class="tblWrap">
						<table class="dataTbl text-center">
							<caption>대학생&middot;청년 햇살론 신청자 교육안내</caption>
							<colgroup>
								<col style="width: 13%">
								<col style="width: 13%">
								<col style="width: *">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">교육구분</th>
									<th scope="col">교육과목</th>
									<th scope="col">교육방법</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>햇살론</td>
									<td>1과목</td>
									<td class="text-left">
										<ul class="mrg_t10 mrg_b10">
											<li class="li_dot wordBrk"><strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong> 메뉴에서 1과목 필수 이수</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
			</c:if>

			<hr />
			<hr />
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