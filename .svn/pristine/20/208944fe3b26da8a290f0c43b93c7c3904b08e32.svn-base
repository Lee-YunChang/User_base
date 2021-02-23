<%--
    Description : 지식터 > 교육자료
     
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
	//상세보기
	function fnView(bbsNo){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/eduinfo/eduDataView.do").submit();
	}
	
	//검색
	function searchWord(){
		$("#searchWord").val($("#searchText").val());
		$("#frm").attr("action" , "/academy/eduinfo/eduDataList.do").submit();
	}
</script>

<div class="contents-wrap f201">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_eduinfo.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>지식터</span></li>
				<li class="location"><span>교육자료</span></li>
			</ul>

			<div class="sub-tit">
				<h3>교육자료</h3>
				<p>상상스토리이 생산하거나 교육의 확산을 위해 공개되어 공유되는 교육의 자료들을 제공합니다. </p>
			</div>
	
			<div class="contents" id="sContents">
				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="qu" id="qu" value=""/>
					<input type="hidden" name="searchWord" id="searchWord" value=""/>
				</form>		
			
				<div class="serch-box">
						<input type="text" name="searchText" id="searchText" title="집합교육 검색어입력" onkeypress="if(event.keyCode==13){searchWord();return false}" value="${REQUEST_DATA.searchWord}">
						<button onclick="searchWord();return false" class="btn-submit" title="검색">검색</button>
				</div>
				<ul class="edu-list">
					<c:forEach items="${eduDataList}" var="result" varStatus="status">
						<li>
							<div class="edu-wrap openarea">
								<div class="openarea-inner">
									<p class="link-txt"><a href="#none" onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;" title="교육자료 상세보기"><c:out value="${result.TITLE}"/></a></p>
									<div class="hitbox">
										<ul>
											<li><p><span class="date">등록일</span><span><c:out value="${result.WDATE}"/></span></p></li>
											<li><p><span class="view">조회수</span><span><c:out value="${result.RCNT}"/></span></p></li>
										</ul>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
				
				<p class="ac"><a href="#none"  class="more-w" title="더보기">더보기</a></p>

				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


			</div><!-- //contents-->



		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->
