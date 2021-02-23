<%
/****************************************
	subject	: 지원센터 > 공지사항 리스트
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
	
	<script type="text/javascript">
	
	function move_page(cPage){
		$('#cPage').val(cPage);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/tutor/noticeList.do').submit();
	} 
	
	//검색
	function searchWord(){
		$('#cPage').val(1);
		$("#searchWord").val($("#searchText").val());
		$("#frm").attr("action" , "/academy/tutor/lectureNotice.do").submit();
	}
	
	//상세보기
	function fnView(bbsNo){
		$("#bbsNo").val(bbsNo);
		$("#searchWord").val($("#searchText").val());
		$("#frm").attr("action", "/academy/tutor/lectureNoticeView.do").submit();
	}
	
</script>

<div class="contents-wrap e101">
	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp" %>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>강사공간</span></li>
				<li class="location"><span>강사공지사항</span></li>
			</ul>

			<div class="sub-tit">
				<h3>강사공지사항</h3>
				<p>강사단 강사들에게 공지사항을 안내합니다.</p>
			</div>

			<div class="contents" id="sContents">
				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="searchWord" id="searchWord" value=""/>
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="prevBbsNo" id="prevBbsNo" value=""/>
					<input type="hidden" name="nextBbsNo" id="nextBbsNo" value=""/>
					<input type="hidden" name="qu" id="qu" value=""/>
					<%-- <input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="total" id="total" value="<c:out value="${resultCount}"/>"/> --%>
				
				</form>
				<div class="serch-box">
					<input type="text" name="searchText" id="searchText" title="강사자료실 검색어입력" onkeypress="if(event.keyCode==13){searchWord();return false}" value="${REQUEST_DATA.searchWord}">
					<button class="btn-submit" onclick="searchWord(); return false" title="검색">검색</button>
				</div>
				
				<ul class="edu-list w100">
					<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="status">
								<li class="add-item-pc add-item-tablet add-item-mobile">
									<div class="edu-wrap openarea">
										<div class="openarea-inner">
											<p class="link-txt speake fresh">
												<a href="#none" <c:if test="${result.TOPYN eq 'Y'}"> class="ellipsis btn-speak" </c:if> onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;"><c:out value="${result.TITLE}"/>
												<c:if test="${result.DATE_DIFF < 7}"><span class="new">N</span></c:if></a>
											</p> <!-- // ***** 스피커 + 신규 *****-->
											
											<div class="hitbox type02" >
												<ul>
													<li><p><span class="date">등록일</span><span><c:out value="${result.WDATE}"/></span></p></li>
													<li><p align="left"><span class="view">조회수</span><span><c:out value="${result.RCNT}"/></span></p></li>
												</ul>
												
												<a href="#none" onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;" class="btn-more">더보기</a>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
							<c:if test="${not empty listData}">
								<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
							</c:if>	
						</c:when>
						<c:otherwise>	
							<div class="survey-mobile no-con" style="display:block; margin-left: 20px">
									<c:if test="${REQUEST_DATA.searchWord eq ''}">
										<p class="test-txt">등록된 공지사항글이 없습니다.</p>
									</c:if>
									<c:if test="${REQUEST_DATA.searchWord ne ''}">
										<p class="test-txt">검색결과가 없습니다.</p>
									</c:if>
							</div>
						</c:otherwise>
					</c:choose>
				</ul>
				<p class="ar"><a href="#header" class="btn-top">TOP</a></p>


			</div><!-- //contents-->



		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div>	 
	 
	<!-- footer -->
	
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>