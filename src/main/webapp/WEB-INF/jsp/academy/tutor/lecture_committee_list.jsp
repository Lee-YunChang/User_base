<%
/****************************************************
	system	: 나의공간 > 특강관리
	title	: 
	summary	:	
	wdate	: 2016-08-30
	writer	: 이진영
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

//페이지 이동
function move_page(cPage){
	$('#cPage').val(cPage);
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
	$('form[name=frm]').attr('action', '/academy/tutor/lectureList.do').submit();
} 

//탭이동
function fnTab(url, tabNo) {
	$("#tabNo").val(tabNo);
	$("#qu").val('');
	$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
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
              <li class="active">강사정보관리</li>
          </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="bgTop_cate06"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			 <h2 class="h2_tit">강사정보관리</h2>
	            		</div>           	
	          	  </section>
				
				<form name="frm" id="frm" action="/academy/tutor/lectureCommitteeList.do" method="post">
					<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
				    <input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>
					<input type="hidden" name="qu" id="qu" value=""/>
				 	<input type="hidden" name="pageMode" id="pageMode" value=""/>
					<input type="hidden" name="slno" id="slno" value=""/>
					<input type="hidden" name="entrstYear" id="entrstYear" value="${REQUEST_DATA.entrstYear}"/>
					<input type="hidden" name="userno" id="userno" value="${REQUEST_DATA.userno}"/>
					<input type="hidden" name="tutorHisYn" id="tutorHisYn" value="${REQUEST_DATA.tutorHisYn }"/>
					<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
					
					<section>
                    	<div class="bluelineTabWrap">
                        	<ul class="bluelineTab">
                             	<li class="<c:if test="${REQUEST_DATA.tabNo == 0}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureDetail.do', '0'); return false;">정보 관리</a></li>
								<li class="<c:if test="${REQUEST_DATA.tabNo == 1}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureHisList.do', '1'); return false;">타기관 강의이력</a></li>
								<li class="<c:if test="${REQUEST_DATA.tabNo == 3}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lecturePersonalList.do', '3'); return false;">방문교육 강의이력</a></li>
								<li class="<c:if test="${REQUEST_DATA.tabNo == 2}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureCommitteeList.do', '2'); return false;">집합교육 강의이력</a></li>
                             </ul>
                         </div>
                   </section>
                   
                   <hr>
					
					<!-- table -->
                    <section class="tableBox">
                    	<div class="tblWrap tableScrollx">
                        	<table class="dataTbl text-center">
                            	<caption>집합교육 강의이력 목록</caption>
                                <colgroup>
                                    <col style="width:9%">
                                    <col style="width:*">
                                    <col style="width:25%">
                                    <col style="width:9%">
                                    <col style="width:25%">
                                    <col style="width:12%">
                                 </colgroup>
                                 <thead>
                                     <tr>
                                     	<th scope="col">No</th>
                                        <th scope="col">과정구분</th>
                                        <th scope="col">과목명</th>
                                        <th scope="col">교시</th>
                                        <th scope="col">교육일</th>
                                        <th scope="col">만족도</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                  	<c:choose>
										<c:when test="${fn:length(resultList) > 0}">
											<c:forEach var="data" items="${resultList}" varStatus="varStatus">
											<tr>
												<td><span><c:out value='${data.RNUM}'/></span></td>
												<td class="text-left"><span><c:out value='${data.MT_SC_NAME}'/></span></td>
												<td class="text-left"><span><c:out value='${data.SEQ_TITLE}'/></span></td>
												<td><span><c:out value='${data.PERIOD}'/>교시</span></td>
												<td><span class="d-inline dateTxt"><c:out value="${data.EDU_SDATE}"/></span> <span class="d-inline">~</span> <span class="d-inline dateTxt"><c:out value="${data.EDU_EDATE}"/></span></td>
												<td><span><c:out value='${data.AVG_POINT}'/></span></td>
											</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6" class="text-center">
													등록된 강의이력이 존재 하지 않습니다.
												</td>
											</tr>
										</c:otherwise>
									 </c:choose>  
                                   </tbody>
                            </table>
                     	</div>
								
						<c:if test="${not empty resultList}">
							<paging:page cpage="${REQUEST_DATA.cPage}" total="${totalCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
					 	</c:if>
                     </section>
                            <!--// table -->
				</form>
				<!-- <p class="ar"><a href="#header" class="btn-top">TOP</a></p> -->

			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->
	</article>
</div>
		
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->