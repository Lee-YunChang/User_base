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
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$(document).ready(function() {
	
	$('#searchStartDt').datepicker({dateFormat: 'yy-mm-dd'});
	$('#searchEndDt').datepicker({dateFormat: 'yy-mm-dd'});
	
})
//페이지 이동
function move_page(cPage){
	$('#cPage').val(cPage);
	frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_LIST")%>";
	$('form[name=frm]').attr('action', '/academy/tutor/lecturePersonalList.do').submit();
} 

//탭이동
function fnTab(url, tabNo) {
	$("#tabNo").val(tabNo);
	$("#qu").val('');
	$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
}

//상세
function fnView(slno){
	var frm = document.frm;
	frm.target = "";
	frm.slno.value = slno;
	$("#frm").attr("action", "/academy/tutor/lecturePersonalView.do");
	frm.submit(); 
}

/* function entrstClickEvt(entrstYear){
	$('#entrstYear').val(entrstYear);
	$("#frm").attr("action", "/academy/tutor/lecturePersonalList.do").submit();
}

function selectTitle(selectTitle){
	$("#entrstYear").val('');
	$("#frm").attr("action","/academy/tutor/lecturePersonalList.do");
	$("#frm").submit();
} */

// 검색
function searchWord(){
	$('#cPage').val(1);
	$("#frm").attr("action", "/academy/tutor/lecturePersonalList.do").submit();
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

				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
				    <input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}"/>"/>
				 	<input type="hidden" name="pageMode" id="pageMode" value=""/>
					<input type="hidden" name="slno" id="slno" value=""/>
					<input type="hidden" name="mtScCode" id="mtScCode" value=""/>
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
                 
					<div class="tblTop row">
						<div class="col-sm-6">
							<div class="addFileWrap" style="padding-left: 3px; margin-top: -2px;">
								<div class="mainClass">
									<div class="form-inline timeset static">
										<div class="form-group">
											<input type="text" name="searchStartDt" id="searchStartDt" readonly="readonly" title="날짜선택"  class="form-control datepicker" value="<c:out value='${REQUEST_DATA.searchStartDt}'/>">
	                                    </div>
	                                    <label for="searchStartDt" class="btn_cal btn mrg_r5" title="날짜입력"></label>
	                                    ~&nbsp;&nbsp;
										<div class="form-inline timeset static">
											<div class="form-group">
												<input type="text" name="searchEndDt" id="searchEndDt" readonly="readonly" title="날짜선택"  class="form-control datepicker" value="<c:out value='${REQUEST_DATA.searchEndDt}'/>">
		                                    </div>
		                                    <label for="searchEndDt" class="btn_cal btn mrg_r5" title="날짜입력"></label>
		                                </div>
	                                
	                                </div>
	                            </div>
	                         </div>
						</div>
						<div class="col-sm-6 col-xs-12">
							<fieldset>
									<legend class="sr-only">검색</legend>
									<div class="titSearchWrap">
										 <input type="text" name="searchText" title="검색어 입력" id="searchText" class="form-control" onkeypress="if(event.keyCode==13){searchWord();return false}" value="${REQUEST_DATA.searchText}">
										<button class="btn btn-sm btn-mint" onclick="searchWord(); return false" title="검색">검색</button>
									</div>
							</fieldset>
						</div>
					</div> 
	                 
                 
                       <div class="tblWrap tableScrollx">
                           <table class="dataTbl text-center">
                                <caption>방문교육 강의이력 목록(교육희망 주제, 교육기간,소속,교육대상,인원)</caption>
                                <colgroup>
                                    <col style="width:9%">
                                    <col style="width:*">
                                    <col style="width:30%">
                                    <col style="width:15%">
                                    <col style="width:12%">
                                    <col style="width:9%">
                                    <col style="width:9%">
                                    <col style="width:9%">
                                 </colgroup>
                                 <thead>
                                 <tr>
                                     <th scope="col">No</th>
                                     <th scope="col">교육신청기관</th>
                                     <th scope="col">교육기간</th>
                                     <th scope="col">교육대상</th>
                                     <th scope="col">교육희망주제</th>
                                     <th scope="col">인원</th>
                                     <th scope="col">강의확인서</th>
                                     <th scope="col">강사료</th>
                                  </tr>
                                  </thead>
                                  <tbody>
                                  <c:choose>
									<c:when test="${fn:length(resultList) > 0}">
										<c:forEach var="data" items="${resultList}" varStatus="varStatus">
										<tr>
											<td><c:out value='${data.RNUM}'/></td>
											<td><a href="#none" onclick="fnView('<c:out value="${data.SLNO}"/>')"><c:out value='${data.APPLY_ORGAN_NM}'/></a></td>
											<td><c:out value="${data.DS_SDATE}"/> <span class="d-inline">~</span> <c:out value="${data.DS_EDATE}"/></td>
											<td><c:out value='${data.TARGET_NAME}'/></td>
											<td><c:out value='${data.APPLY_ORGAN_NM}'/></td>
											<td><c:out value='${data.PERSON_CNT}'/></td>
											<c:if test="${data.FILENO eq null }">
												<td></td>
											</c:if>	
											<c:if test="${data.FILENO ne null }">
												<td><c:out value='Y'/></td>
											</c:if>	
											<td><c:out value='${data.PAY}'/></td>
										</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="8" align="center">
												등록된 개인 강의이력이 존재 하지 않습니다.
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