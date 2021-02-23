<%
/* *******************************************
    system  : 나의강의실 > 토론
    title   : 
    summary :	
  	wdate   : 2016-08-19
  	writer  : 황두은
******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<c:set var="topMenuCode" value="main"/>
<script type="text/javascript">

	//조회
	function fnSearch(page) {
		if(page) {
			$('#cPage').val(page);
		}
		$('#frm').attr('target', '_self');
		$('#frm').submit();
	}
	
	
	$(function($) {
	});

	function fnForm(bbsNo, userNo, grpNo, topYn, refLevel, cmd){
		$('#bbsNo').val(bbsNo);
		$("#userNo").val(userNo);
		$("#grpNo").val(grpNo);
		$("#topYn").val(topYn);
		$("#refLevel").val(refLevel);
		$('form[name=frm]').attr('action', '/classdesk/user/discuss/' + cmd + '.do').submit();
	}
	
		function move_page(cPage){
		$('#cPage').val(cPage);
		$('form[name=frm]').attr('action', '/classdesk/user/discuss/list.do').submit();
	}

</script> 
<div class="contents-wrap">
	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
		<div class="sub-contents">
					<ul class="sub-navi">
						<li><span>HOME</span></li>
						<li><span>내강의실</span></li>
						<li class="location"><span>토론</span></li>
					</ul>
					<div class="sub-tit">
						<h3>토론</h3>
						<p class="ellipsis">
							<c:choose>
								<c:when test="${REQUEST_DATA.ctypeName eq '집합교육' }">
									<span class="new_tit-bd"><span class="new_tit bg3">집합교육</span></span>
								</c:when>
								<c:when test="${REQUEST_DATA.ctypeName eq '사이버교육' }">
									<span class="new_tit-bd"><span class="new_tit bg4">온라인교육</span></span>
								</c:when>
								<c:when test="${REQUEST_DATA.ctypeName eq '의무교육' }">
									<span class="new_tit-bd"><span class="new_tit bg2">의무교육</span></span>
								</c:when>
							</c:choose>
							<c:out value="${REQUEST_DATA.seqTitle}"/>
						</p>
					</div>

					<div class="contents" id="sContents">
						<form name="frm" id="frm" method="post" action="/classdesk/user/discuss/list.do">
							<input type="hidden" name="cPage"  		id="cPage" 		value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
							<input type="hidden" name="pbcateno"  	id="pbcateno" 	value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
							<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
							<input type="hidden" name="bbsNo"  		id="bbsNo" 		value=""/>
							<input type="hidden" name="grpNo"  		id="grpNo" 		value=""/>
							<input type="hidden" name="userNo"  	id="userNo" 	value=""/>
							<input type="hidden" name="topYn"  		id="topYn" 		value=""/>
							<input type="hidden" name="refLevel"  	id="refLevel" 	value=""/>
							<input type="hidden" name="refStep"  id="refStep" value="<c:out value="${discussList[0].STEP}" />"/>
							<input type="hidden" name="CLASSDESK"  		id="CLASSDESK" 		value="${REQUEST_DATA.CLASSDESK }"/>
							<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
							<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
							
						<div class="serch-box">
							<input type="text" id="searchWord" name="searchWord" title="강사커뮤니티 검색어 입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>">
							<button class="btn-submit" onclick="javascript:fnSearch('<c:out value="${REQUEST_DATA.cPage}"/>');return false;" title="검색">검색</button>
						</div> 
						<c:if test="${not empty discussList}">
							<h3 class="con-tit">토론 목록</h3>
							<div class="con-tbl">
								<table class="sub-table ta-c list7">
									<caption>토론 목록:토론목록의 넘버,제목,작성자,추천,반대,등록일시,조회수를 설명하는 테이블</caption>
									<colgroup>
										<col style="width:48px;">
										<col style="width:406px">
										<col style="width:140px">
										<col style="width:48px">
										<col style="width:48px">
										<col style="width:152px">
										<col style="width:48px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">No</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">추천</th>
											<th scope="col">반대</th>
											<th scope="col">등록일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty discussList}">
												<c:forEach items="${discussList}" var="result" varStatus="status">
													<tr>
														<td><c:out value='${discussListCount - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
														<td class="tit">
															<c:choose>
																<c:when test="${result.STEP eq 0 }">
																	<c:if test="${result.TOPYN eq 'Y' }">
																		<span class="official">공지</span>
																	</c:if>
																</c:when>
																<c:otherwise>
																	<c:if test="${result.STEP ne 0 }">
																		<span class="replbox" style="padding-left:${result.STEP * 5}px">
																			<span class="repl-inner">답글</span>
																		</span>
																	</c:if>
																</c:otherwise>
															</c:choose>
															<a href="#none" onclick="fnForm('<c:out value="${result.BBSNO}"/>', '<c:out value="${result.USERNO}"/>', '<c:out value="${result.GRPNO}"/>', '<c:out value="${result.TOPYN}"/>' , '<c:out value="${result.REFLEVEL}"/>','view'); return false;" title="<c:out value="${result.TITLE}"/>"><c:out value="${result.TITLE}"/></a>
															<c:if test="${result.DATE_DIFF < 7}"><span class="new">N</span></c:if>
														</td>
														<td><c:out value="${result.WRITER}"/></td>
														<td><c:out value="${result.RECCNT}"/></td>
														<td><c:out value="${result.OPPCNT}"/></td>
														<td><c:out value="${result.WDATE}"/></td>
														<td><c:out value="${result.RCNT}"/></td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
						</c:if>
						<c:if test="${empty discussList}">
							<div class="survey-mobile no-con" style="display:block">
								<p class="test-txt">등록된 토론이 없습니다.</p>
							</div>
						</c:if>
						<c:if test="${not empty discussList}">
						     <div class="pagelist">
								<paging:page cpage="${REQUEST_DATA.cPage}" total="${discussListCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
							</div>
						 </c:if>

						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


						</form>
					</div><!-- //contents-->



				</div>
	</div>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>
