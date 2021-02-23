<%
/****************************************************
    system	: 대출의무교육 > 창업대출
    title	: 일반과정 신청 및 수강안내 목록
    summary	:
    wdate	: 2013-09-10
    writer	: 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

//검색
function fnSearch(){
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/offCategoryList.do');
	$('#frm').submit();

}

//과정 목록으로 이동
function fnCourseView(mtScCode){
	$('#mtScCode').val(mtScCode);
    $('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/offDetail.do').submit();
}

</script>

<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_offline.jsp"%>
            <div class="path">
            	<ul>
                	<li><span class="home text-hide">홈</span></li>
                    <li>집합 교육</li>
                    <li class="active"><c:out value="${resultList[0].REF2}"/></li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
            
            	<section class="bgTop_cate02"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit"><c:out value="${resultList[0].REF2}"/></h2>
            		</div>           	
	            </section>
            
				<section>
               	  <div class="bigRbar">
                   	<p class="msg"><c:out value="${resultList[0].REF2}"/>은 <strong class="po_C4">총 <c:out value="${fn:length(resultList)}"/>개 과정</strong>으로 구성되어 있습니다. </p>
                  </div>
                </section>

				 <section>
				 	<c:choose> 
						<c:when test="${not empty resultList}">
                               <div class="crdBoard hidden_row form4row">
								<c:forEach items="${resultList}" var="result" varStatus="stat">
                                    <div class="row">
                                        <div class="col-md-12 col-xs-12">
                                            <div class="crdBox">
                                                <div class="boxInner">
                                                    <dl>
                                                        <dt class="dt_tit"><span class="po_C6 bold fnt19"><c:out value="${result.MT_SUB_NAME}"/></span></dt>
                                                        <dd>
                                                            <p><c:out value="${fn:substring(result.SUMMARY,0,56)}"/><c:if test="${fn:length(result.SUMMARY) > 54 }">..</c:if></p>
                                                        </dd>
                                                    </dl>
                                                    <div class="btnAreaC text-right">
                                                       <a href="#none"  class="btn btn-lg btn-blue" onclick="fnCourseView('<c:out value="${result.MT_SUB_CODE}"/>'); return false;" <c:if test="${not empty result.MT_SUB_CODE2}">title="<c:out value="${result.MT_SUB_NAME}"/> 신청하기" class="btn-m blue abs"</c:if> <c:if test="${empty result.MT_SUB_CODE2}">title="<c:out value="${result.MT_SUB_NAME}"/> 상세보기" class="btn-m green abs"</c:if>><c:if test="${not empty result.MT_SUB_CODE2}">신청하기</c:if> <c:if test="${empty result.MT_SUB_CODE2}"> 상세보기 </c:if></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
								</c:forEach>
                                </div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
				 	</c:choose>
						<c:if test="${fn:length(resultList) > 3}">
                               <div class="btnListmoreWrap">
                                   <button type="button" name="button" class="btnListmore bold" title="더보기">더보기 &nbsp; <img src="../../../academy/images/common/down.png" alt="더보기"></button>
                               </div>
						</c:if>
				 </section>
				<form name="frm" id="frm" action="/academy/course/offCategoryList.do" method="get">
					<input type="hidden" name="ref1" id="ref1" value="<c:out value="${REQUEST_DATA.ref1}"/>"/>
					<input type="hidden" name="mtScCode" id="mtScCode" value=""/>
					<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
				</form>
				
			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->

</article>
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->