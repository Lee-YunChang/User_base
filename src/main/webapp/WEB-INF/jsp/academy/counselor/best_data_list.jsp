
<%
/****************************************************
	system	: 자료실 리스트
	title	: 
	summary	:	
	wdate	: 2016-06-10
	writer	: SANGS
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/counsel_header_inc.jsp"%>
<script type="text/javascript">
function move_page(cPage){
	$('#cPage').val(cPage);
	$("#searchWord").val($("#searchText").val());
	$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/counselor/bestList.do').submit();
} 

//검색
function searchWord(){
	$('#cPage').val(1);
	$("#searchWord").val($("#searchText").val());
	$("#frm").attr("action" , "/academy/counselor/bestList.do").submit();
}

//상세보기
function fnView(bbsNo){
	$("#searchWord").val($("#searchText").val());
	$("#bbsNo").val(bbsNo);
	$("#frm").attr("action", "/academy/counselor/BestboardDataView.do").submit();
}
</script>
<div class="container" id="Subcontent">
	<article class="subArea">
		<div class="subCntWrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_counsel_best.jsp"%>
			<div class="path">
                <ul>
                    <li><span class="home text-hide">홈</span></li>
                    <li>상담자료실</li>
                    <li class="active"><c:out value="${categoryData.BCATENAME}"/></li>
                </ul>
            </div>
			<div class="subConts" id="sub-content">
				<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit"><c:out value="${categoryData.BCATENAME}"/></h2>
            		</div>           	
	            </section>

				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="bbsNo" id="bbsNo" value="" /> 
					<input type="hidden" name="qu" id="qu" value="" /> 
					<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}" /> 
					<input type="hidden" name="searchWord" id="searchWord" value="" />
				<section class="tableBox">
					
					<div class="tblTop row">
						<div class="col-sm-6">
							<select id="mtLecCounselCode" name="mtLecCounselCode" class="form-control-static f_left" title="카테고리분류">
								<option value="">전체</option>
								<c:forEach var="result"  items="${mtLecCounselCode}" varStatus="status">
			            			<option value="${result.MT_SUB_CODE}" <c:if test="${result.MT_SUB_CODE eq REQUEST_DATA.mtLecCounselCode }" >selected="selected" </c:if>>${result.MT_SUB_NAME}</option>
			            	  	</c:forEach>
							</select>
						</div>
				</form>	
						<div class="col-sm-6 col-xs-12">
							<fieldset>
									<legend class="sr-only">검색</legend>
									<div class="titSearchWrap">
										 <input type="text" name="searchText" title="검색어 입력" id="searchText" class="form-control" onkeypress="if(event.keyCode==13){searchWord();return false}" value="${REQUEST_DATA.searchWord}">
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
												<%-- <c:if test="${result.BCATENO eq 4}">
													<c:if test="${result.TOPYN eq 'Y'}">
														<strong class="fnt16 po_C2">[공지]</strong>
													</c:if>
													<c:if test="${result.TOPYN eq 'N'}">
														<strong class="fnt16 po_C7">${resultCount-(REQUEST_DATA.cPage-1)*10-status.count+1}</strong>
													</c:if>
												
												</c:if> --%>
													<strong class="fnt16 po_C7"><%-- ${resultCount-(REQUEST_DATA.cPage-1)*10-status.count+1} --%>[${result.MT_CATE_NAME}]</strong>
												</td>
												<td>
													<dl class="dl_notice">
														<dt>
															<a href="#none" class="noti_tit ellipsis" onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;" title="<c:out value="${result.TITLE}"/> 상세보기"> <c:out value="${result.TITLE}" /> <c:if test="${result.DATE_DIFF < 7}"><span class="new"></span></c:if></a>
														</dt>
														<dd>
															<ul class="mrg_t5 noaddfile">
																<li class="li_bar"><strong class="mrg_r10">등록일</strong><span><c:out value="${result.WDATE}" /></span></li>
																<li class="li_bar"><strong class="mrg_r10">조회수</strong><span><c:out value="${result.RCNT}" /></span></li>
																<c:if test="${result.FILECNT > 0}">
																	<li class="li_bar"><a href="" class="ico_file" title="파일명"><span class="sr-only">파일다운로드</span></a></li>
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
	
					</div><!-- .tblWrap -->
				</section>
			</div>
			<!-- //sub-contents -->
		</div>
		<!-- //sub-wrap -->
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>