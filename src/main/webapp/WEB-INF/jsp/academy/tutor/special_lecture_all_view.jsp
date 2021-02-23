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
function fnList() {
	$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/tutor/specialLectureAll.do').submit();
}
</script>
<div class="container" id="Subcontent" tabindex="-1">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp" %>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>강사공간</li>
                <li class="active">신청가능한 출강교육</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="contTop">
                <h2 class="h2_tit">신청가능한 출강교육</h2>
                
            </section>
			
			<form name="frm" id="frm" action="/academy/tutor/specialLectureAll.do" method="post">
				<input type="hidden" name="slno"  id="slno" value="">
				<input type="hidden" name="searchType"  id="searchType" value="<c:out value="${REQUEST_DATA.searchType}"/>">
				<input type="hidden" name="schSeqTitle"  id="schSeqTitle" value="<c:out value="${REQUEST_DATA.schSeqTitle}"/>">
		 	</form>
			
			<div class="contents" id="sContents">
				<h3 class="con-tit">신청정보</h3>
				<div class="con-tbl">
					<table class="sub-table">
						<caption>과정안내 테이블 : 이 표는 온라인교육 과정, 년도,교육과정명,신청기간,학습기간,학습일수,1일학습량,수강정원,수강최대인원을 안내하는 테이블입니다.</caption>
						<colgroup>
							<col style="">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">신청자 성명</th>
								<td><c:out value="${resultList[0].APPLY_NM}"/></td>
							</tr>
							<tr>
								<th scope="row">신청자 소속</th>
								<td><c:out value="${resultList[0].APPLY_ORGAN_NM}"/></td>
							</tr>
							<tr>
								<th scope="row">지역</th>
								<td>
								<c:out value="${resultList[0].SIDO_NAME}"/>&nbsp;<c:out value="${resultList[0].GU_NAME}"/>&nbsp;
								<c:out value="${resultList[0].DONG_NAME}"/>&nbsp;<c:out value="${resultList[0].APPLY_ORGAN_ADDR}"/>
								</td>
							</tr>
							<tr>
								<th scope="row">교육장소</th>
								<td><c:out value="${resultList[0].EDU_AREA}"/></td>
							</tr>
							<tr>
								<th scope="row">유선전화</th>
								<td><c:out value="${resultList[0].APPLY_TEL}"/></td>
							</tr>
							<tr>
								<th scope="row">휴대전화</th>
								<td><c:out value="${resultList[0].APPLY_PHONE}"/></td>
							</tr>
							<tr>
								<th scope="row">이메일 주소</th>
								<td><c:out value="${resultList[0].APPLY_EMAIL}"/></td>
							</tr>
							<tr>
								<th scope="row">교육 희망일시</th>
								<td><c:out value="${resultList[0].EDU_SDATE}"/> ~ <c:out value="${resultList[0].EDU_EDATE}"/></td>
							</tr>
							<tr>
								<th scope="row">교육 대상</th>
								<td>
								<c:out value="${resultList[0].LEC_TARET_NAME}"/>
								<c:if test="${resultList[0].MT_LEC_TARGET_CODE == 'TG0007'}">(<c:out value="${resultList[0].TARGET_ETC}"/>)</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row">참석인원</th>
								<td><c:out value="${resultList[0].PERSON_CNT}"/></td>
							</tr>
							<tr>
								<th scope="row">교육 희망주제</th>
								<td><c:out value="${resultList[0].mtLctreName}"/></td>
							</tr>
							<tr>
								<th scope="row">기타 요청사항</th>
								<td><c:out value="${resultList[0].EDU_CONTENTS}"/></td>
							</tr>
							
						</tbody>
					</table>
				</div>
					<ul class="btn-list">
						<li><a href="#none" onclick="fnList(); return false;" class="btn list" title="목록">목록</a></li>
					</ul> <!-- // btn list -->
				</div><!-- //contents-->

			</div><!-- //sub-contents -->

		</div>
	</article>
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->