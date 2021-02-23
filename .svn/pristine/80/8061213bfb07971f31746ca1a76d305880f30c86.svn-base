<%
/****************************************
	subject	: 강사공간 게시판 목록
	summary	: 
	author	: 이진영
	date	: 2017-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
	
	<script type="text/javascript">
	function move_page(cPage){
		$('#cPage').val(cPage);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/tutor/tutorBoardList.do').submit();
	} 
	
	//검색
	function searchWord(){
		$('#cPage').val(1);
		$("#searchWord").val($("#searchText").val());
		$('input[name="searchType"]').val($('#searchType').val());
		$("#frm").attr("action" , "/academy/tutor/tutorBoardList.do").submit();
	}
	
	//상세보기
	function fnView(bbsNo){
		$("#bbsNo").val(bbsNo);
		$("#searchWord").val($("#searchText").val());
		$('input[name="searchType"]').val($('#searchType').val());
		$("#frm").attr("action", "/academy/tutor/tutorBoardView.do").submit();
	}
	
	function form_page(){
		$('#cPage').val(cPage);
		$("#searchWord").val($("#searchText").val());
		$('input[name="searchType"]').val($('#searchType').val());
		<%--  frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>"; --%>
		$("#frm").attr("action", "/academy/tutor/tutorBoardForm.do").submit();
	}
	
	
</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp" %>
			<div class="path">
           		<ul>
               		<li><span class="home text-hide">홈</span></li>
                    <li>강사공간</li>
                    <li class="active"><c:out value="${categoryData.BCATENAME}"/></li>
                </ul>
            </div>
			<div class="subConts" id="sub-content">
				<section class="bgTop_cate06"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit"><c:out value="${categoryData.BCATENAME}"/></h2>
            		</div>           	
	            </section>
			

	
					<form name="frm" id="frm" action="" method="post">
						<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
						<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
						<input type="hidden" name="prevBbsNo" id="prevBbsNo" value=""/>
						<input type="hidden" name="nextBbsNo" id="nextBbsNo" value=""/>
						<input type="hidden" name="qu" id="qu" value="insert"/>
						<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
						<input type="hidden" name="searchWord" id="searchWord" value=""/>
						<input type="hidden" name="searchType" value=""/>
					</form>
					
					<!-- table -->
	                <section class="tableBox">
	                	<div class="tblTop row">
	                    	<div class="col-sm-6">
	                    		<select id="searchType" class="form-control-static f_left">
								<option value="ALL" <c:if test="${REQUEST_DATA.searchType eq 'ALL'}"> selected="selected" </c:if> >전체</option>
								<option value="TITLE" <c:if test="${REQUEST_DATA.searchType eq 'TITLE'}"> selected="selected" </c:if> >제목</option>
								<option value="CONTENT" <c:if test="${REQUEST_DATA.searchType eq 'CONTENT'}"> selected="selected" </c:if> >내용</option>
							</select>
	                    	</div>
	                        <div class="col-sm-6 col-xs-12">
	                        	<fieldset>
	                            	<legend class="sr-only">검색</legend>
	                                	<div class="titSearchWrap">
	                                    	<input class="form-control" type="text" name="searchText" id="searchText" title="검색어입력" onkeypress="if(event.keyCode==13){searchWord();return false}" value="${REQUEST_DATA.searchWord}">
											<button class="btn btn-sm btn-mint" onclick="searchWord(); return false" title="검색">검색</button>
	                                    </div>
	                        	</fieldset>
	                        </div>
	                     </div>
	                     <div class="tblWrap">
	                     	<table class="boardList">
	                        <colgroup>
	                        	<col style="width:15%">
	                            <col style="width:*">
	                        </colgroup>
	                        <tbody>
	                        <c:choose>
								<c:when test="${not empty listData}">
								
									<c:forEach items="${listData}" var="result" varStatus="status">
										<c:if test="${result.TOPYN eq 'Y'}">
										<tr>
											<td class="text-center">
												<strong class="fnt16 po_C2">[공지]</strong>
											</td>
											<td>
							                	<dl class="dl_notice">
							                    	<dt>
							                        	<a href="#none" class="noti_tit" onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;"><c:out value="${result.TITLE}"/>
														<c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if></a>
													</dt>
													<dd>
														<ul class="mrg_t5 noaddfile">
															<li class="li_bar"><strong class="mrg_r10">등록일</strong> <span><c:out value="${result.WDATE}"/></span></li>
															<li class="li_bar"><strong class="mrg_r10">조회수</strong> <span><c:out value="${result.RCNT}"/></span></li>
															<c:if test="${REQUEST_DATA.bcateno eq '1030'}">
																<li class="li_bar"><strong class="mrg_r10">댓글수</strong> <span><c:out value="${result.CMTCNT}"/></span></li>
															</c:if>
															<c:if test="${result.FILECNT > 0}">
																<li class="li_bar"><a href="" class="ico_file" title="파일명"><span class="sr-only">파일다운로드</span></a></li>
															</c:if>
														</ul>	
													</dd>
												</dl>
											</td>
										</tr>
										</c:if>
									</c:forEach>	
								
									<c:forEach items="${listData}" var="result" varStatus="status">
										<c:if test="${result.TOPYN eq 'N' || result.TOPYN eq null}">
										<tr>
											<td class="text-center">
												<strong class="fnt16 po_C7">${resultCount-(REQUEST_DATA.cPage-1)*10-status.count+1}</strong>
											</td>
											<td>
							                	<dl class="dl_notice">
							                    	<dt>
							                        	<a href="#none" class="noti_tit" onclick="fnView('<c:out value="${result.BBSNO}"/>'); return false;"><c:out value="${result.TITLE}"/>
														<c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if></a>
													</dt>
													<dd>
														<ul class="mrg_t5 noaddfile">
															<li class="li_bar"><strong class="mrg_r10">등록일</strong> <span><c:out value="${result.WDATE}"/></span></li>
															<li class="li_bar"><strong class="mrg_r10">조회수</strong> <span><c:out value="${result.RCNT}"/></span></li>
															<c:if test="${REQUEST_DATA.bcateno eq '1030'}">
																<li class="li_bar"><strong class="mrg_r10">댓글수</strong> <span><c:out value="${result.CMTCNT}"/></span></li>
															</c:if>
															<c:if test="${result.FILECNT > 0}">
																<li class="li_bar"><a href="" class="ico_file" title="파일명"><span class="sr-only">파일다운로드</span></a></li>
															</c:if>
														</ul>	
													</dd>
												</dl>
											</td>
										</tr>
										</c:if>
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
								<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
							</c:if>
	                     </div>
	                      <hr/>
	                      <hr/>
	                     <c:if test="${REQUEST_DATA.bcateno eq '1030'}">
		                      <div class="btnAreaR board">
		                     	<a href="#" onclick="form_page();" class="btn btn-blue btn-sm">글쓰기</a>
		                     </div> 
	                     </c:if>
	                     
	                </section><!--// table -->
			</div><!-- //sub-contents -->

		</div>
	</article>
</div>	 
	 
<!-- footer -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>