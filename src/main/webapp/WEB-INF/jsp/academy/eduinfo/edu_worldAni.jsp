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
	function fnTab(url , tabNo){
		$("#tabNo").val(tabNo);
		$("#frm").attr("action" , "/academy/eduinfo/"+url+".do").submit();
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
					<h3>만화로 보기</h3>
					<p>1948년 12월 10일 유엔총회에서 제정되어 다양한 문제의 기준이 되고 있는 세계선언의 전문을 제공합니다.</p>
				</div>
				
				<%-- <div class="contents" id="sContents">
					<form id="frm" name="frm" method="post" action="">
						<input type="hidden" id="tabNo" name="tabNo" value="">
					</form>
					<div class="tabArea">
						<ul class="tabMenu hmredu_d">
							<li <c:if test="${REQUEST_DATA.tabNo == 0}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 0}"> class="off"</c:if>  ><a href="#tab-con01" onclick="fnTab('worldHnrtList' , '0'); return false"><span>세계선언문</span></a></li>
							<li <c:if test="${REQUEST_DATA.tabNo == 1}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 1}"> class="off"</c:if> ><a href="#none" onclick="fnTab('worldHistoryList' , '1'); return false"><span>역사와 조항별 의미</span></a></li>
							<li <c:if test="${REQUEST_DATA.tabNo == 2}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 2}"> class="off"</c:if> ><a href="#none" onclick="fnTab('worldAniList' , '2'); return false"><span>만화로 보기</span></a></li>
							<li <c:if test="${REQUEST_DATA.tabNo == 3}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 3}"> class="off"</c:if> ><a href="#none" onclick="fnTab('worldListenList' , '3'); return false"><span>음성낭독</span></a></li>
							<li <c:if test="${REQUEST_DATA.tabNo == 4}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 4}"> class="off"</c:if> ><a href="#none" onclick="fnTab('worldFileDown' , '4'); return false"><span>번역문</span></a></li>
						</ul>
					</div>
					<img src="/academy/images/ing.png" alt="준비중입니다.">
				</div> --%>
				
				<div class="contents" id="sContents">
					<form id="frm" name="frm" method="post" action="">
						<input type="hidden" id="tabNo" name="tabNo" value="">
					</form>
						<div class="tabArea">
							<ul class="tabMenu hmredu_d">
								<li <c:if test="${REQUEST_DATA.tabNo == 0}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 0}"> class="off"</c:if> ><a href="#tab-con01" onclick="fnTab('worldHnrtList' , '0'); return false" title="세계 선언문"><span>세계선언문</span></a></li>
								<li <c:if test="${REQUEST_DATA.tabNo == 1}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 1}"> class="off"</c:if> ><a href="#none" onclick="fnTab('worldHistoryList' , '1'); return false" title="역사와 조항별 의미"><span>역사와 조항별 의미</span></a></li>
								<li <c:if test="${REQUEST_DATA.tabNo == 2}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 2}"> class="off"</c:if> ><a href="#none" onclick="fnTab('worldAniList' , '2'); return false" title="만화로 보기"><span>만화로 보기</span></a></li>
								<li <c:if test="${REQUEST_DATA.tabNo == 3}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 3}"> class="off"</c:if> ><a href="#none" onclick="fnTab('worldListenList' , '3'); return false" title="음성낭독"><span>음성낭독</span></a></li>
								<li <c:if test="${REQUEST_DATA.tabNo == 4}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 4}"> class="off"</c:if> ><a href="#none" onclick="fnTab('worldFileDown' , '4'); return false" title="번역문"><span>번역문</span></a></li>
							</ul>
							<div class="tab-con-wrap">
								<div class="tab-con">
									<div class="cartoon" style=" width:100%; margin:0 auto"> <!-- 카툰영역 -->
										<img src="/edu-data/upload/edbbs/9/catoon.jpg" alt="카툰보기">
									</div>
								</div>
							</div>
						</div>

						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
						


				</div>
				
			</div><!-- //contents-->

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->
	
	
	
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->
