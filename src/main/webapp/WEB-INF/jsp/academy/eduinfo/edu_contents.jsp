<%--
    Description : 지식터 > 교육콘텐츠
     
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
$(document).ready(function(){
	$('dt a').each(function(){
	    var replaced = $(this).text().replace(/&lt;/g, '<').replace(/&gt;/g, '>');
	    $(this).text(replaced);
	});
	
	
	//정규표현식
	$(".ellipsis").text(function(index, text){
	 return strip(text);
	});

	function strip(html) {
	   var tmp = document.createElement("div");
	   tmp.innerHTML = html;
	   return tmp.textContent||tmp.innerText;
	}
	
});
	

	function fnTab(tabNo){
		$("#tabNo").val(tabNo);
		$("#frm").attr("target" , "_self");
		$("#frm").attr("action" , "/academy/eduinfo/contentsList.do").submit();
	};
	
	//동영상 팝업
	function conTentPop(contentsImgUrl , contentsUrl , imgFileName , contentFileName, videoTitle){
		var contentsUrl = contentsUrl + "/" + contentFileName;
		var contentsImgUrl = contentsImgUrl + "/" + imgFileName;
		var height = screen.height;
		var width= screen.width ;
		$('#videoTitle').val(videoTitle);
		$("#contentsUrl").val(contentsUrl);
		$("#contentsImgUrl").val(contentsImgUrl);
		
		var form = document.frm;
		var popUpSize = "width="+width+",height="+height+",location=NO,scrollbars=YES,resizable=NO" ;
	    window.open("/academy/eduinfo/eduContentPop.do","eduContentPop",popUpSize);
	    form.action = "/academy/eduinfo/eduContentPop.do";
	    form.target = "eduContentPop" ;
	    form.method = "post";
	    form.submit(); 
	}
</script>

	<div class="contents-wrap">

		<div class="sub-wrap">
				
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_eduinfo.jsp"%>

			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>지식터</span></li>
					<li class="location"><span>교육콘텐츠</span></li>
				</ul>

				<div class="sub-tit">
					<h3>교육콘텐츠</h3>
					<p>상상스토리이 제작한 공익광고, 동화 등 교육에 활용할 수 있는 교육콘텐츠를 제공합니다. </p>
				</div>
				
				<div class="contents" id="sContents">
					<form id="frm" name="frm" method="post" action="">
						<input type="hidden" id="tabNo" name="tabNo" value="">
						<input type="hidden" id="contentsUrl" name="contentsUrl" value="">
						<input type="hidden" id="contentsImgUrl" name="contentsImgUrl" value="">
						<input type="hidden" id="videoTitle" name="videoTitle" value="">
					</form>
					<div class="tabArea">
						<ul class="tabMenu hmredu_d mb40">
							<li <c:if test="${REQUEST_DATA.tabNo == 0}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 0}"> class="off"</c:if>><a href="#none" onclick="fnTab('0'); return false" title="YTN 캠패인"><span>보도자료</span></a></li>
							<li <c:if test="${REQUEST_DATA.tabNo == 1}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 1}"> class="off"</c:if>><a href="#none" onclick="fnTab('1'); return false" title="동영상"><span>동영상</span></a></li>
							<li <c:if test="${REQUEST_DATA.tabNo == 2}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 2}"> class="off"</c:if>><a href="#none" onclick="fnTab('2'); return false" title="광고"><span>광고</span></a></li>
						</ul>
						
						<c:if test="${not empty eduContentsList}">
							<div class="tabCon" id="tab-con01" style="display: block;">
								<ul class="edu-list w100">
									<li>
									<c:if test="${REQUEST_DATA.tabNo == 0}">
										<div class="tabCon" id="tab-con01" style="display: block;">
											<div class="process-1">
												<div class="bg-radius">
													<h3 class="con-tit">상상스토리 보도자료</h3>
													<!-- <p class="ac"><a href="http://www.humanrights.go.kr/site/program/board/basicboard/list?boardtypeid=24&menuid=001004002001" target="_blank" alt="상상스토리 보도자료 새 창 열림" class="btn bd"><span class="txt_skyblue">상상스토리 보도자료</span> 바로가기</a></p> -->
												</div>
											</div>
										</div>
									</c:if>
									</li>
									<c:if test="${REQUEST_DATA.tabNo != 0}">
									<c:forEach items="${eduContentsList}" var="result" varStatus="status">
										<li>
											
												<div class="edu-wrap video">
													<div class="video-player"><!-- 동영상 영역-->
														<c:set value="${fn:indexOf(result.JPGSAVPATH, 'upload')}" var="index"/>
														<c:set value="${fn:substring(result.JPGSAVPATH , 1 , index) }" var="splitStr"/>
														<c:set value="${fn:replace(result.JPGSAVPATH , splitStr , 'edu-data/') }" var="jpgSavPath"/>
														<img src="${jpgSavPath}/${result.JPGSAVFILE}" alt="<c:out value="${result.JPGSAVFILE}"/> 썸네일 이미지">
													</div>
													<dl class="video-titbox">
														<c:set value="${fn:indexOf(result.MPSAVPATH, 'upload')}" var="index"/>
														<c:set value="${fn:substring(result.MPSAVPATH , 1 , index) }" var="splitStr"/>
														<c:set value="${fn:replace(result.MPSAVPATH , splitStr , 'edu-data/') }" var="mpSavPath"/>
														<dt><a href="#none" onclick="conTentPop('<c:out value="${result.JPGSAVPATH}"/>' , '<c:out value="${mpSavPath}"/>' , '<c:out value="${result.JPGSAVFILE}"/>' , '<c:out value="${result.MPSAVFILE}"/>','<c:out value="${result.TITLE}"/>'); return false" title="<c:out value="${result.TITLE}"/> 동영상 보기"><c:out value="${result.TITLE}"/></a></dt>
														<dd class="ellipsis"><c:out value="${result.CONTENT}" escapeXml="false"/></dd>
													</dl>
												</div>
										</li>
									</c:forEach>
									</c:if>
									
								</ul>
								<c:if test="${REQUEST_DATA.tabNo != 0}">
									<p class="ac"><a href="#none" class="more-w" title="더보기">더보기</a></p>
								</c:if>
							</div><!-- // tab1 -->
							
						</c:if>
						
						
						<c:if test="${empty eduContentsList}">
						<c:if test="${REQUEST_DATA.tabNo != 0}">
							<div class="survey-mobile no-con" style="display:block">
								<c:if test="${REQUEST_DATA.tabNo == 1}">
									<p class="test-txt">등록된 동영상이 없습니다.</p>
								</c:if>
								<c:if test="${REQUEST_DATA.tabNo == 2}">
									<p class="test-txt">등록된 광고가 없습니다.</p>
								</c:if>
							</div>
						</c:if>
						<c:if test="${REQUEST_DATA.tabNo == 0}">
							<div class="tabCon" id="tab-con01" style="display: block;">
								<div class="process-1">
									<div class="bg-radius">
										<h3 class="con-tit">상상스토리 보도자료</h3>
										<!-- <p class="ac"><a href="http://www.humanrights.go.kr/site/program/board/basicboard/list?boardtypeid=24&menuid=001004002001" target="_blank" alt="상상스토리 보도자료 새 창 열림" class="btn bd"><span class="txt_skyblue">상상스토리 보도자료</span> 바로가기</a></p> -->
									</div>
								</div>
							</div>
						</c:if>
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
