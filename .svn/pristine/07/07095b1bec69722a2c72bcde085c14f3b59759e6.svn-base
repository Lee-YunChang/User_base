<%
/* *******************************************
    system  : 나의강의실 > 과제
    title   : 
    summary :	
  	wdate   : 2016-08-19
  	writer  : 
******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<c:set var="topMenuCode" value="main"/>
<script type="text/javascript">
// 페이징 이동 함수
function fnList() {
    $('form[name=frm]').attr('action', '/classdesk/user/report/list.do').submit();
}

function fnResult(reportNo, cUserNo, cmd){
    $('#reportNo').val(reportNo);
    
    if(cUserNo == ''){
        cUserNo = 0;
    }
    
    $('#cUserNo').val(cUserNo);
    $('form[name=frm]').attr('action', '/classdesk/user/report/' + cmd + '.do').submit();
}

function fnForm(reportNo, saveYn, userOpenYn, resultYn, wdate , cmd){
    /* if(saveYn == 'N'){
        alert('과제 제출기간이 아닙니다.');
        return false;
    } */
    
    $('#reportNo').val(reportNo);
    $('#userOpenYn').val(userOpenYn);
    $('#resultYn').val(resultYn);
    $("#saveYn").val(saveYn);
    $("#wdate").val(wdate);
    $('form[name=frm]').attr('action', '/classdesk/user/report/' + cmd + '.do').submit();
}
</script> 

<div class="contents-wrap">
	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><a href="#none" title="HOME">HOME</a></li>
				<li><a href="#none" title="내강의실">내강의실</a></li>
				<li class="location"><a href="#none" title="과제">과제</a></li>
			</ul>

			<div class="sub-tit">
				<h3>과제</h3>
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
				<form name="frm" action="/classdesk/user/report/list.do" method="post">
					<input type="hidden" name="reportNo" id="reportNo" value="">
					<input type="hidden" name="cUserNo" id="cUserNo" value="">
					<input type="hidden" name="userOpenYn" id="userOpenYn" value="">
					<input type="hidden" name="resultYn" id="resultYn" value="">
					<input type="hidden" name="saveYn" id="saveYn" value="">
					<input type="hidden" name="wdate" id="wdate" value="">
					<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK }">
					<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
					<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
				</form>
				
				<ul class="edu-list">
					<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
								<li class="add-item-pc add-item-tablet add-item-mobile">
									<div class="edu-wrap new-type">
										<dl>
											<dt><c:out value="${result.TITLE}"/></dt>
											<dd>
												<ul class="list-info">
													<li>
														<dl>
															<dt>제출기간 :</dt>
															<dd><fmt:formatDate value="${result.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${result.EDATE}" pattern="yyyy.MM.dd" /></dd>
														</dl>
													</li>
													<li>
														<dl>
															<dt>배<span class="txt-margin"></span>점 :</dt>
															<dd><c:out value="${result.EVAL}"/>점</dd>
														</dl>
													</li>
												</ul>
											</dd>
										</dl>
										
										<!-- *****		미 작성인 경우  ***************-->
										
										<c:if test="${result.SAVEYN eq 'Y' && result.USER_OPENYN == null}">
										<!-- 작성중 -->
											<a href="#none" class="btn-m red abs write" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', '<c:out value="${result.SAVEYN}"/>', '<c:out value="${result.USER_OPENYN}"/>' , '<c:out value="${result.RESULTYN}"/>',  '<c:out value="${result.WDATE}"/>' ,'submit_form'); return false;" title="과제 작성" >작성</a>
										</c:if>
										
										<!-- ******** 작성한 경우  ****************** -->
									
										<c:if test="${result.SAVEYN eq 'Y' && result.USER_OPENYN eq 'N' }">
										<!-- 작성중 -->
											<td>
												<a href="#none" class="btn-m blue abs submit" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', '<c:out value="${result.SAVEYN}"/>', '<c:out value="${result.USER_OPENYN}"/>' , '<c:out value="${result.RESULTYN}"/>', '<c:out value="${result.WDATE}"/>' , 'submit_form'); return false;" title="과제 제출" >제출</a>
											</td>
										</c:if>
										<c:if test="${result.SAVEYN eq 'Y' && result.USER_OPENYN eq 'Y' && result.RESULTYN eq 'N'}">
										<!-- 제출완료 -->
											<td>
												<a href="#none" class="btn-m blue abs eval" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', '<c:out value="${result.SAVEYN}"/>', '<c:out value="${result.USER_OPENYN}"/>' , '<c:out value="${result.RESULTYN}"/>', '<c:out value="${result.WDATE}"/>' , 'submit_view'); return false;" title="과제 평가 중">평가중</a>
											</td>
										</c:if>
										
										<c:if test="${result.SAVEYN eq 'N' || result.RESULTYN eq 'Y'}">
										<!-- 과제결과 -->
											<td>
												<a href="#none" class="btn-m red abs result" onclick="fnForm('<c:out value="${result.REPORTNO}"/>', '<c:out value="${result.SAVEYN}"/>', '<c:out value="${result.USER_OPENYN}"/>' , '<c:out value="${result.RESULTYN}"/>' , '<c:out value="${result.WDATE}"/>' , 'submit_view'); return false;" title="과제 결과">결과</a>
											</td>
										</c:if>
												
									</div>
								</li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="survey-mobile no-con" style="display:block">
								<p class="test-txt">등록된 과제가 없습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>
				</ul>
				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
			</div>
	</div><!-- //sub-contents -->
	</div><!-- //sub-wrap -->
</div><!-- //contents-wrap --> 
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>
