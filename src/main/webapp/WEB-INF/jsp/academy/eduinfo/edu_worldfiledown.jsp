<%--
    Description : 지식터 > 세계선언
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.07.07  이진영           최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

	//탭이동
	function fnTab(url , tabNo){
		$("#tabNo").val(tabNo);
		$("#frm").attr("action" , "/academy/eduinfo/"+url+".do").submit();
	}
	
	//파일다운로드
	function filedown(bbsNo){
		$('#bbsNo').val(bbsNo);
		$('form[name=frm]').attr('action', '/academy/worldFiledown.do').submit();
	}
</script>

	<div class="contents-wrap">

		<div class="sub-wrap">
				
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_eduinfo.jsp"%>

			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>지식터</span></li>
					<li class="location"><span>세계선언</span></li>
				</ul>

				<div class="sub-tit">
					<h3>번역문</h3>
					<p>1948년 12월 10일 유엔총회에서 제정되어 다양한 문제의 기준이 되고 있는 세계선언의 전문을 제공합니다.</p>
				</div>
				
				<div class="contents" id="sContents">
					<form id="frm" name="frm" method="post" action="">
						<input type="hidden" id="tabNo" name="tabNo" value="">
						<input type="hidden" id="bbsNo" name="bbsNo" value="">
						<input type="hidden" id="worldFileDown" name="worldFileDown" value="">
					</form>
						<div class="tabArea">
							<ul class="tabMenu hmredu_d">
								<li <c:if test="${REQUEST_DATA.tabNo == 0}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 0}"> class="off"</c:if>><a href="#tab-con01" onclick="fnTab('worldHnrtList' , '0'); return false" title="세계 선언문"><span>세계선언문</span></a></li>       
								<li <c:if test="${REQUEST_DATA.tabNo == 1}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 1}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldHistoryList' , '1'); return false" title="역사와 조항별 의미"><span>역사와 조항별 의미</span></a></li>    
								<li <c:if test="${REQUEST_DATA.tabNo == 2}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 2}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldAniList' , '2'); return false" title="만화로 보기"><span>만화로 보기</span></a></li>                
								<li <c:if test="${REQUEST_DATA.tabNo == 3}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 3}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldListenList' , '3'); return false" title="음성낭독"><span>음성낭독</span></a></li>                 
								<li <c:if test="${REQUEST_DATA.tabNo == 4}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 4}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldFileDown' , '4'); return false" title="번역문"><span>번역문</span></a></li>                     
							</ul>
							
							<c:if test="${not empty eduTransList}">
								<div class="tabCon" id="tab-con05" style="display: block;">
									<div class="translation-box">
										<ul>
											<c:forEach items="${eduTransList}" var="result" varStatus="status">
												<li>
													<div class="translation">
														<span><em class="ellipsis"><c:out value="${result.TITLE}"/></em></span><a <c:if test="${result.FILE_AT eq 'Y'}">href="#none" onclick="filedown('<c:out value="${result.BBSNO}"/>'); return false"</c:if> <c:if test="${result.FILE_AT eq 'N'}">href="<c:out value="${result.LINK_URL}"/>" target="_blank"</c:if> title="번역문파일 다운로드">번역문파일 다운로드</a>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</c:if>	
							<c:if test="${empty eduTransList}">
								<div class="survey-mobile no-con" style="display:block">
									<p class="test-txt">등록된 번역문이 없습니다.</p>
								</div>
							</c:if>
							
						</div>

						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>

					</div>
				
			</div><!-- //contents-->

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->
	
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->
