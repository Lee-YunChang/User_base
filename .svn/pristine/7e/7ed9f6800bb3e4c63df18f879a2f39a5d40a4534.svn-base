<%
/****************************************************
	system	: 지원센터 > 자료실 > 자료실 리스트
	title	: 강사게시판 목록
	summary	:	
	wdate	: 2016-06-10
	writer	: SANGS
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">
	//검색
	function searchWord(){
		$("#searchWord").val($("#searchText").val());
		$("#frm").attr("action" , "/academy/helpdesk/boardList.do").submit();
	}
	
	//상세보기
	function fnView(bbsNo){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/helpdesk/boardView.do").submit();
	}

</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_intro.jsp" %>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>교육센터 소개</li>
                <li class="active"><c:out value="${categoryData.BCATENAME}"/></li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="contTop">
                
                <h2 class="h2_tit"><c:out value="${categoryData.BCATENAME}"/></h2>
            </section>

			<div class="contents" id="sContents">
				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="qu" id="qu" value=""/>
					<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
					<input type="hidden" name="searchWord" id="searchWord" value=""/>
				</form>		
				<div class="serch-box">
						<input type="text" name="searchText" id="searchText" title="검색어 입력" onkeypress="if(event.keyCode==13){searchWord();return false}" value="${REQUEST_DATA.searchWord}">
						<button onclick="searchWord();return false" class="btn-submit" title="검색">검색</button>
				</div>
			
				<ul class="edu-list w100">
					<c:forEach items="${listData}" var="result" varStatus="status">
						<li>
							<div class="edu-wrap openarea">
								<div class="openarea-inner">
									<p class="link-txt speake fresh">
										<a href="#none" <c:if test="${result.TOPYN eq 'Y'}"> class="ellipsis btn-speak" </c:if> onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;" title="<c:out value="${result.TITLE}"/> 상세보기">
											<c:out value="${result.TITLE}"/>
											<c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if></c:if>
										</a>
										
									</p> <!-- // ***** 스피커 + 신규 *****-->
									<div class="hitbox type02">
										<ul>
											<li><p><span class="date">등록일</span><span><c:out value="${result.WDATE}"/></span></p></li>
											<li><p><span class="view">조회수</span><span><c:out value="${result.RCNT}"/></span></p></li>
											 <li class="li_bar"><a href="" class="ico_file" title="파일명"><span class="sr-only">파일다운로드</span></a></li>
										</ul>
										<a href="#none" onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;" class="btn-more" title="<c:out value="${result.TITLE}"/> 상세보기"></a>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>	
				</ul>

				<p class="ac"><a href="#none" class="more-w" title="더보기">더보기</a></p>

				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
				
			</div>

		</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>