<%--
    Description : 지식터 > 교육콘텐츠
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.12.09   구동림         최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	
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

	//동영상 팝업
	function conTentPop(contentsImgUrl , contentsUrl , imgFileName , contentFileName){
		var contentsUrl = contentsUrl + "/" + contentFileName;
		var contentsImgUrl = contentsImgUrl + "/" + imgFileName;
		var height = screen.height;
		var width= screen.width ;

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
				
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>

			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>배움터</span></li>
					<li class="location"><span>열린교육</span></li>
				</ul>

				<div class="sub-tit">
					<h3>열린교육</h3>
					<p>교육센터에서 제공하는 누구나 학습할 수 있는 열린교육 공간입니다.</p>
				</div>
				
				<div class="contents" id="sContents">
					<form id="frm" name="frm" method="post" action="">
						<input type="hidden" id="tabNo" name="tabNo" value="">
						<input type="hidden" id="contentsUrl" name="contentsUrl" value="">
						<input type="hidden" id="contentsImgUrl" name="contentsImgUrl" value="">
					</form>
					<div class="tabArea">
						<c:if test="${not empty eduContentsList}">
							<div class="tabCon" id="tab-con01" style="display: block;">
								<ul class="edu-list w100">
									<c:forEach items="${eduContentsList}" var="result" varStatus="status">
										<li>
											<div class="edu-wrap video">
												<div class="video-player"><!-- 동영상 영역-->
													<c:set value="${fn:indexOf(result.JPGSAVPATH, 'upload')}" var="index"/>
													<c:set value="${fn:substring(result.JPGSAVPATH , 0 , index) }" var="splitStr"/>
													<c:set value="${fn:replace(result.JPGSAVPATH , splitStr , 'edu-data/') }" var="jpgSavPath"/>
													<img src="/${jpgSavPath}/${result.JPGSAVFILE}" alt="<c:out value="${result.JPGSAVFILE}"/>">
												</div>
												<dl class="video-titbox">
													
													<c:set value="${fn:indexOf(result.MPSAVPATH, 'upload')}" var="index"/>
													<c:set value="${fn:substring(result.MPSAVPATH , 0 , index) }" var="splitStr"/>
													<c:set value="${fn:replace(result.MPSAVPATH , splitStr , 'edu-data/') }" var="mpSavPath"/>
													<dt><a href="#none" onclick="conTentPop('<c:out value="${result.JPGSAVPATH}"/>' , '<c:out value="/${mpSavPath}"/>' , '<c:out value="${result.JPGSAVFILE}"/>' , '<c:out value="${result.MPSAVFILE}"/>'); return false" title="<c:out value="${result.TITLE}"/> 동영상보기"><c:out value="${result.TITLE}"/></a></dt>
													<dd class="ellipsis"><c:out value="${result.CONTENT}" escapeXml="false"/></dd>
												</dl>
											</div>
										</li>
									</c:forEach>
								</ul>
								<p class="ac"><a href="#none" class="more-w" title="더보기">더보기</a></p>
							</div><!-- // tab1 -->
						</c:if>
						
						
						
						<c:if test="${empty eduContentsList}">
							<div class="survey-mobile no-con" style="display:block">
								<p class="test-txt">등록된 열린교육이 없습니다.</p>
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
