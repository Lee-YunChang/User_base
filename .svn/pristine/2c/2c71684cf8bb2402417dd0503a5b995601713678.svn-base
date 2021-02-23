<%
/* *******************************************
    system  : 나의강의실 > 공지사항
    title   : 공지사항
    summary :	
    wdate   : 2016-09-01
    writer  : SANGS
******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassData')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassNotice')}">공지사항</c:if>
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassData')}">자료실</c:if>
</c:set>
<script type="text/javascript"> 
	$(function($) {
	});
	
	function fnForm(bbsNo, cmd){
		$('#bbsNo').val(bbsNo);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/' + cmd + '.do').submit();
	}
	
	function move_page(cPage){
		$('#cPage').val(cPage);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/list.do').submit();
	}
	
	function searchWord(){
		$('#cPage').val(1);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/list.do').submit();
	}
	

</script>
<c:choose>
	<c:when test="${REQUEST_DATA.select eq 'list1' }">
		<span><c:set var="menuTitle">공지사항</c:set></span>
	</c:when>
	<c:otherwise>
		<span><c:set var="menuTitle">자료실</c:set></span>
	</c:otherwise>
</c:choose>
<div class="container" id="Subcontent">
	<article class="subArea">
        <div class="subCntWrap">
			
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>내강의실</li>
                <li class="active">${menuTitle}</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			 <h2 class="h2_tit">${menuTitle} <span class="ico_sec syber"><c:out value="${REQUEST_DATA.ctypeName}"/></span> <span class="po_C7 fnt12"><c:out value="${REQUEST_DATA.seqTitle}"/></span></h2>
            		</div>           	
	            </section>
			
				<form name="frm" action=""  method="post">
					<input type="hidden" name="cPage"  		id="cPage" 		value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="pbcateno"  	id="pbcateno" 	value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
					<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
					<input type="hidden" name="bbsNo"  		id="bbsNo" 		value=""/>
					<input type="hidden" name="select"  	id="select" 	value="${REQUEST_DATA.select}"/>
					<input type="hidden" name="searchWord"  id="searchWord" value=""/>
					<input type="hidden" name="CLASSDESK"  	id="CLASSDESK" 		value="${REQUEST_DATA.CLASSDESK }"/>
					<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
					<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
				</form>	
				
				<!-- table -->
                <section class="tableBox">
                    <div class="tblTop row">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-6 col-xs-12">
	                        <fieldset>
	                            <legend class="sr-only">검색</legend>
	                            <div class="titSearchWrap">
	                                <input type="text" name="searchText" id="searchText" class="form-control" title="검색어입력" value="${REQUEST_DATA.searchWord}" onkeypress="if(event.keyCode==13){searchWord();return false}">
									<button onclick="searchWord();return false" class="btn btn-sm btn-mint" title="검색">검색</button>
	                            </div>
	                        </fieldset>
                        </div>
                    </div>
                    <div class="tblWrap">
                        <table class="boardList">
                            <caption>공지사항 목록</caption>
                            <colgroup>
                                <col style="width:15%">
                                <col style="width:*">
                            </colgroup>
                            <tbody>
                            <c:choose>
								<c:when test="${not empty courselistData}">
									<c:forEach items="${courselistData}" var="result" varStatus="status">
		                                <tr>
		                                    <td class="text-center">
		                                        <c:if test="${result.TOPYN eq 'Y'}">
													<strong class="fnt16 po_C2">[공지]</strong>
												</c:if>
												<c:if test="${result.TOPYN eq 'N'}">
													<strong class="fnt16 po_C7">${courselistCount-(REQUEST_DATA.cPage-1)*10-status.count+1}</strong>
												</c:if>
		                                    </td>
		                                    <td>
		                                        <dl class="dl_notice">
		                                            <dt>
		                                            	<a href="#none" class="noti_tit" onclick="fnForm('<c:out value="${result.BBSNO}"/>','view'); return false;" title="<c:out value="${result.TITLE}"/>">
														
														<c:out value="${result.TITLE}"/>
														
														<c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if>
														</a>
		                                            </dt>
		                                            <dd>
		                                                <ul class="mrg_t5 noaddfile">
		                                                    <li class="li_bar"><strong class="mrg_r10">등록일</strong> <span><c:out value="${result.WDATE}"/></span></li>
		                                                    <li class="li_bar"><strong class="mrg_r10">조회수</strong> <span><c:out value="${result.RCNT}"/></span></li>
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
		                        <table class="boardList">
			                        <tr>
										<td class="text-center">
											<div class="survey-mobile no-con" style="display:block; margin-left: 20px">
												<c:if test="${REQUEST_DATA.select eq 'list1' }">
													<c:if test="${REQUEST_DATA.searchWord eq ''}">
														<strong class="fnt16 po_C7">등록된 게시글이 없습니다.</strong>
													</c:if>
													<c:if test="${REQUEST_DATA.searchWord ne ''}">
														<strong class="fnt16 po_C7">검색 결과가 없습니다.</strong>
													</c:if>
												</c:if>
												<c:if test="${REQUEST_DATA.select eq 'list2' }">
													<c:if test="${REQUEST_DATA.searchWord eq ''}">
														<strong class="fnt16 po_C7">등록된 게시글이 없습니다.</strong>
													</c:if>
													<c:if test="${REQUEST_DATA.searchWord ne ''}">
														<strong class="fnt16 po_C7">검색 결과가 없습니다.</strong>
													</c:if>
												</c:if>
											</div>
										</td>
									</tr>
								</table>
								</c:otherwise>
		                    </c:choose>
                            </tbody>
                        </table>
                        
                        <c:if test="${not empty courselistData}">
							<paging:page cpage="${REQUEST_DATA.cPage}" total="${courselistCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
						</c:if>
						
                    </div>

                </section>
                <!--// table -->
	
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>
