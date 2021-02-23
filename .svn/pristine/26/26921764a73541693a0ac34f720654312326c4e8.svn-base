<%
/****************************************************
	system	: academy > 나의강의실 > 수강과정
	title	: 수강과정 목록
	summary	:	
	wdate	: 2015-05-19
	writer	: kim hak kyu
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 
	
<script type="text/javascript">

var scrBizrno= '<c:out value="${userData.BIZNO}"/>'; //사업자번호
var scrComName= '<c:out value="${userData.COMNAME}"/>'; //회사명
var scrMobile= '<c:out value="${userData.MOBILE}"/>';
var FREE_COURSE = false;

$(document).ready(function(){
});

//저장
function fnSave() {
	
	var frm = document.frm;
	
	if($('#applyChk').val() == 'Y'){
		alert('신청중입니다. 잠시만 기다려주세요.');
		return false;
	}

	if(confirm('신청 하시겠습니까?')){
		$('#frm').attr('method', 'post');
		$('#frm').attr('target', '_cm');
		$('#frm').attr('action',	'<c:out value="${ctx}"/>/academy/course/common/apply_exec.do');
		$('#applyChk').val('Y');
		
		$('#frm').submit();
	}
	
}

function fnList() {
	$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclass/list.do').submit();
}

function fnApplyResult(){
	//location.href='/academy/course/common/applyResult.do';
	$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/common/applyResult.do').submit();
}

function fnResult(courseno, cseqno, duplVal){
	$('#resultForm > input[name="cseqno"]').val(cseqno);
	$('#resultForm > input[name="courseno"]').val(courseno);
	
	$('form[name=frm]').attr('method', 'post').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do').submit();
}	


function fnReturnPage(pmode){
	if('on' == pmode) {
		location.href='/academy/course/onMain.do';	
	} else if('off' == pmode){
		location.href='/academy/course/offMain.do';	
	}
	
}
	
</script>

<div class="contents-wrap c202">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>배움터</span></li>
				<li class="location"><span>온라인교육</span></li>
			</ul>

			<div class="sub-tit">
				<h3>온라인교육</h3>
				<p>상호간 유대관계 및 협력체계의 강화를 통해 교육효과를 증대하기위한 교육입니다.</p>
			</div>
			
			<form name="frm" id="frm" action="/academy/course/common/apply_form.do" method="post">
				<input type="hidden" name="goodname" value="<c:out value="${rowData.SEQ_TITLE}"/>"/>
				<input type="hidden" name="price" value="<c:out value="${rowData.PRICE}"/>"/>		
				<input type="hidden" name="subcmd" id="subcmd"/>
				<input type="hidden" name="cseqno" id="cseqno"  value="<c:out value="${rowData.CSEQNO}"/>"/>
				<input type="hidden" name="courseno" id="courseno"  value="<c:out value="${rowData.COURSENO}"/>"/>
				<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
				<input type="hidden" name="pmusrcd" id="pmusrcd" value="<c:out value="${REQUEST_DATA.SES_MOBILE}"/>"/>
				<input type="hidden" name="paymentInputname" id="paymentInputname" value="<c:out value="${REQUEST_DATA.SES_USERNAME}"/>"/>
				<input type="hidden" name="applyChk" id="applyChk" value="N"/><!-- 과정 중복수강방지 -->
				<input type="hidden" name="eduMode" id="eduMode" value="<c:out value="${REQUEST_DATA.eduMode}"/>"/><!-- 신청폼 left메뉴 제어용 집합: J 온라인교육 : E -->
				<input type="hidden" name="mtPmBillCode" id="mtPmBillCode2" value="<%=SangsProperties.getProperty("Globals.mtCode_MT_PM_BILL_APPLY") %>" />
				<input type="hidden" name="mtPmPayCode" id="mtPmPayCode3" value="SGBANK" />
			
			<div class="contents" id="sContents">
				<h3 class="con-tit">과정안내</h3>
				<div class="con-tbl">
					<table class="sub-table">
						<caption>온라인교육과정 안내 테이블 : 이 표는 온라인교육 과정, 년도,교육과정명,신청기간,학습기간,학습일수,1일학습량,수강정원,수강최대인원을 안내하는 테이블입니다.</caption>
						<colgroup>
							<col style="">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">년도</th>
								<td></td>
							</tr>
							<tr>
								<th scope="row">교육과정명</th>
								<td class="txt_blue bold"><c:out value="${rowData.SEQ_TITLE}"/></td>
							</tr>
							<tr>
								<th scope="row">신청기간</th>
								<td><c:out value="${result.APPLY_SDATE}"/> ~ <c:out value="${result.APPLY_EDATE}"/></td>
							</tr>
							<tr>
								<th scope="row">학습기간</th>
								<td>
									<c:out value="${rowData.STUDY_SDATE}"/> ~ <c:out value="${rowData.STUDY_EDATE}"/>
								</td>
							</tr>
							<tr>
								<th scope="row">학습일수</th>
								<td><c:out value="${rowData.EDUDAY}"/>일</td>
							</tr>
							<tr>
								<th scope="row">1일 학습량</th>
								<td>
									<c:choose><!-- 공통코드으로 변경 -->
									<c:when test="${rowData.MT_STUDY_LIMIT_CODE eq 'SL0001'}"><!-- 강기준 --><c:out value="${rowData.STUDYTIME}"/>강</c:when>
									<c:when test="${rowData.MT_STUDY_LIMIT_CODE eq 'SL0002'}"><!-- 학습시간 기준 --><c:out value="${rowData.STUDYTIME}"/>분</c:when>
									<c:otherwise>제한없음</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th scope="row">수강 정원</th>
								<td><c:out value="${result.COURSE_USER_CNT}"/>명</td>
							</tr>
							<tr>
								<th scope="row" class="txt_red">신청 최대인원</th>
								<td class="txt_red bold"><c:out value="${result.FIX_CNT}"/>명</td>
							</tr>
						</tbody>
					</table>
				</div>

				<h3 class="con-tit">과정소개</h3>
				<div class="con-tbl">
					<table class="sub-table">
						<caption>온라인교육 설명 테이블: 이 표는 온라인교육 과정, 과정설명,교육대상,평가방법,수료기준점수,문의,첨부파일,맛보기강의를 설명하는 테이블입니다.</caption>
						<colgroup>
							<col style="">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th>과정설명</th>
								<td><c:out value="${result.DESCRIPTION}"/></td>
							</tr>
							<tr>
								<th>교육대상</th>
								<td><c:out value="${result.TARGET}"/></td>
							</tr>
							<tr>
								<th>평가방법</th>
								<td><c:out value="${result.COMPLETION}"/></td>
							</tr>
							<tr>
								<th>수료기준점수</th>
								<td><c:out value="${result.COMP_VAL}"/></td>
							</tr>
							<tr>
								<th>문의</th>
								<td><a href="mailto:edu@nhrc.go.kr" title="edu@nhrc.go.kr 메일 보내기">edu@nhrc.go.kr</a> / 02) 2125-9895</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><a href="#none" class="btn-down" title="첨부파일 다운로드"></a></td>
							</tr>
							<tr>
								<th>맛보기 강의</th>
								<td>
									<div class="movie-player">
										<img src="../image/sub/test.png" alt="동영상 이미지">
									</div><!-- player 영역 -->
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<ul class="btn-list">
					<c:if test="${REQUEST_DATA.applyYn == 'Y'}">
					<li><a href="#none" class="btn lecture" title="강의실이동">강의실 이동</a></li>
					<li><a href="#none" class="btn cancel" title="신청취소">신청취소</a></li>
					</c:if>
					<c:if test="${REQUEST_DATA.applyYn == 'N'}">
					<li><a href="#none" onclick="javascript:fnSave();return false;" class="btn signup" title="수강신청">수강신청</a></li>
					</c:if>
					<li><a href="#none"  onclick="javascript:history.back(); return false;" class="btn list" title="목록">목록</a></li>
				</ul> <!-- // btn list -->
			</div><!-- //contents-->
			</form>

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->
	
<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->