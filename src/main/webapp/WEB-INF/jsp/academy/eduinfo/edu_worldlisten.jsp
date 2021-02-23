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
	

	function fnPlayerControl(obj, playerEvent) {
		switch (playerEvent)
		{
			case "file" :
			{
				url = obj.filename;
				if (url == '') return;
				obj.play();
				break;
			}
			case "play" :
			{
				url = obj.filename;	
				if (obj.url == '') return;
				obj.play();
				break;
			}
			case "stop" :
			{
				obj.pause();
				obj.currentTime = 0;
				break;
			}
			case "pause" :
			{
				obj.pause();
				break;
			}
		}
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
					<h3>음성낭독</h3>
					<p>1948년 12월 10일 유엔총회에서 제정되어 다양한 문제의 기준이 되고 있는 세계선언의 전문을 제공합니다.</p>
				</div>
				
				<div class="contents" id="sContents">
					<form id="frm" name="frm" method="post" action="">
						<input type="hidden" id="tabNo" name="tabNo" value="">
					</form>
						<div class="tabArea">
							<ul class="tabMenu hmredu_d">
								<li <c:if test="${REQUEST_DATA.tabNo == 0}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 0}"> class="off"</c:if>><a href="#tab-con01" onclick="fnTab('worldHnrtList' , '0'); return false" title="세계 선언문"><span>세계선언문</span></a></li>       
								<li <c:if test="${REQUEST_DATA.tabNo == 1}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 1}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldHistoryList' , '1'); return false" title="역사와 조항별 의미"><span>역사와 조항별 의미</span></a></li>    
								<li <c:if test="${REQUEST_DATA.tabNo == 2}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 2}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldAniList' , '2'); return false" title="만화로 보기"><span>만화로 보기</span></a></li>                
								<li <c:if test="${REQUEST_DATA.tabNo == 3}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 3}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldListenList' , '3'); return false" title="음성낭독"><span>음성낭독</span></a></li>                 
								<li <c:if test="${REQUEST_DATA.tabNo == 4}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 4}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldFileDown' , '4'); return false" title="번역문"><span>번역문</span></a></li>                     
							</ul>
							
							<c:if test="${not empty eduListenList}">
								<div class="tabCon" id="tab-con04" style="display: block;">
									<c:forEach items="${eduListenList}" var="result" varStatus="status">
										<c:set value="${fn:indexOf(result.JPGSAVPATH, 'upload')}" var="index"/>
										<c:set value="${fn:substring(result.JPGSAVPATH , 1 , index) }" var="splitStr"/>
										<c:set value="${fn:replace(result.JPGSAVPATH , splitStr , 'edu-data/') }" var="jpgSavPath"/>
										
										<c:set value="${fn:indexOf(result.MPSAVPATH, 'upload')}" var="index"/>
										<c:set value="${fn:substring(result.MPSAVPATH , 1 , index) }" var="splitStr"/>
										<c:set value="${fn:replace(result.MPSAVPATH , splitStr , 'edu-data/') }" var="mpSavPath"/>
										
										<div class="recitation-bd">
											<div class="recitation-box">
												<div class="voice-img">
													<img src="${jpgSavPath}/${result.JPGSAVFILE}" alt="썸네일 이미지" style="height: 100%">
												</div><!-- // pc img-->
		
												<div class="voice-txt">
													<p><c:out value="${result.TITLE}"/></p>
													<ul class="btn-list bg-mic">
														<li><button title="재생" class="btn play" onclick="fnPlayerControl(document.getElementById('voice_player_${result.BBSNO}'), 'play');return false;">재생</button></li>
														<li><button title="일시정지" class="btn pause" onclick="fnPlayerControl(document.getElementById('voice_player_${result.BBSNO}'), 'pause');return false;">일시정지</button></li>
														<li><button title="정지" class="btn stop" onclick="fnPlayerControl(document.getElementById('voice_player_${result.BBSNO}'), 'stop');return false;">정지</button></li>
													</ul>
													<audio id="voice_player_${result.BBSNO}" >
														<source src="${mpSavPath}/${result.MPSAVFILE}">
													</audio>
												</div>
											</div>
										</div>	
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${empty eduListenList}">
								<div class="survey-mobile no-con" style="display:block">
									<p class="test-txt">등록된 음성낭독이 없습니다.</p>
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
