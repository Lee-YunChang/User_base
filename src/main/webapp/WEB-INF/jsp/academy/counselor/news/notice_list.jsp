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
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/counsel_header_inc.jsp"%>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('.link-txt a').each(function(){
		    var replaced = $(this).text().replace(/&lt;/g, '<').replace(/&gt;/g, '>');
		    $(this).text(replaced);
		});
		
	});
	
	function move_page(cPage){
		$('#cPage').val(cPage);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/counselor/helpdesk/noticeList.do').submit();
	} 
	
	//검색
	function searchWord(){
		$('#cPage').val(1);
		$("#searchWord").val($("#searchText").val());
		$("#frm").attr("action" , "/academy/counselor/helpdesk/noticeList.do").submit();
	}
	
	//상세보기
	function fnView(bbsNo){
		$("#searchWord").val($("#searchText").val());
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/counselor/helpdesk/noticeView.do").submit();
	}
	
</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_counsel_news.jsp" %>
		<div class="path">
        	<ul>
            	<li><span class="home text-hide">홈</span></li>
                <li>알림마당</li>
                <li class="active">공지사항</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">공지사항</h2>
            		</div>           	
	            </section>

				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="prevBbsNo" id="prevBbsNo" value=""/>
					<input type="hidden" name="nextBbsNo" id="nextBbsNo" value=""/>
					<input type="hidden" name="qu" id="qu" value=""/>
					<input type="hidden" name="searchWord" id="searchWord" value=""/>
				</form>
				
				<section class="tableBox">
					<div class="tblTop row">
						<div class="col-sm-6"></div>
						<div class="col-sm-6 col-xs-12">
							<fieldset>
									<legend class="sr-only">검색</legend>
									<div class="titSearchWrap">
										 <input type="text" name="searchText" title="공지사항 검색어 입력" id="searchText" class="form-control" onkeypress="if(event.keyCode==13){searchWord();return false}" value="${REQUEST_DATA.searchWord}">
										 <button class="btn btn-sm btn-mint" onclick="searchWord(); return false" title="검색">검색</button>
									</div>
							</fieldset>
						</div>
					</div>
					
					<div class="tblWrap">
						<table class="boardList">
							<colgroup>
								<col style="width: 15%">
								<col style="width: *">
							</colgroup>
							<tbody>
								<c:choose>
									<c:when test="${not empty listData}">
										<c:forEach items="${listData}" var="result" varStatus="status">
											<tr>
												<td class="text-center">
													<c:if test="${result.TOPYN eq 'Y'}">
														<strong class="fnt16 po_C2">[공지]</strong>
													</c:if>
													<c:if test="${result.TOPYN eq 'N'}">
														<strong class="fnt16 po_C7">${resultCount-(REQUEST_DATA.cPage-1)*10-status.count+1}</strong>
													</c:if>
												</td>
												<td>
													<dl class="dl_notice">
														<dt>
															<a href="#none" class="noti_tit<c:if test="${result.TOPYN eq 'Y'}"> btn-speak </c:if> ellipsis" onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;" title="<c:out value="${result.TITLE}"/> 상세보기"> <c:out value="${result.TITLE}" /> <c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if>
															</a>
														</dt>
														<dd>
															<ul class="mrg_t5 noaddfile">
																<li class="li_bar"><strong class="mrg_r10">등록일</strong><span><c:out value="${result.WDATE}" /></span></li>
																<li class="li_bar"><strong class="mrg_r10">조회수</strong><span><c:out value="${result.RCNT}" /></span></li>
																<c:if test="${result.FILECNT > 0}">
																	<li class="li_bar"><a href="#none" class="ico_file" title="파일명"><span class="sr-only">파일다운로드</span></a></li>
																</c:if>
															</ul>
														</dd>
													</dl>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td class="text-center">
												<c:if test="${REQUEST_DATA.searchWord eq ''}">
													<strong class="fnt16 po_C7">등록된 게시글이 없습니다.</strong>
												</c:if> 
												<c:if test="${REQUEST_DATA.searchWord ne ''}">
													<strong class="fnt16 po_C7">검색 결과가 없습니다.</strong>
												</c:if>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<c:if test="${not empty listData}">
							<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page" />
						</c:if>
					</div>
				</section>
			</div><!-- //sub-contents -->
		</div> <!-- //subCntWrap -->
	</article>
</div>	 
	 
<!-- footer -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>