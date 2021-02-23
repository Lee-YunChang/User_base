<%
/****************************************************
	system	: academy > 일반과정 신청 및 수강안내
	title	: 일반과정 신청 및 수강안내 목록
	summary	:	
	wdate	: 2013-09-10
	writer	: kim min gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="courseURL" value="/academy/course/public/main.do?mtCtypeCode=${REQUEST_DATA.mtCtypeCode}&form=E100"/>

<script type="text/javascript">

//과정소개 목록 여닫기 제어
function fnDetail(cseqno) {
	
	if($('#study_list_button_'+cseqno).html() == '자세히'){
		$('#study_list_info_'+cseqno).css('display','block');
		$('#study_list_button_'+cseqno).html('닫기');
		$('#study_list_button_'+cseqno).removeClass('orange').addClass('gray');
		$('#study_list_'+cseqno).addClass('on');
	} else{
		$('#study_list_info_'+cseqno).css('display','none');
		$('#study_list_button_'+cseqno).html('자세히');
		$('#study_list_button_'+cseqno).removeClass('gray').addClass('orange');
		$('#study_list_'+cseqno).removeClass('on');
	
	}

}

function fnCourseApply(courseno, cseqno){
	$('#cseqno').val(cseqno);
	$('#courseno').val(courseno);
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/common/apply_form.do').submit();

}

</script>

<div class="contents-wrap">

	<div class="sub-wrap">
	<!-- 왼쪽 메뉴 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>
	<!-- // 왼쪽 메뉴 영역 -->
	
		<!-- 페이지 상단 타이틀 영역 -->
		<div id="Sub_Header" class="menu2">
			<div class="nav">
				<img src="/academy/images/ico_home.png" alt="Home" /><img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />집합교육<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />과정소개 및 일정
			</div>
		<h3>과정소개 및 일정</h3>
		<p>화학사고로부터 국민의 안전을 지키겠습니다.</p>
		</div>
		<!-- // 페이지 상단 타이틀 영역 -->

		<form name="frm" id="frm" action="/academy/course/common/apply_form.do" method="post">
			<input type="hidden" name="courseno" id="courseno" value=""/>
			<input type="hidden" name="cseqno" id="cseqno" value=""/>
			<input type="hidden" name="eduMode" id="eduMode" value="J"/><!-- 신청폼 left메뉴 제어용 집합: J 온라인교육 : E -->
		</form>



		<div id="Contents">
			
			<ul>


			<c:choose>
				<c:when test="${not empty result}">
					

					<li>
						<!-- 리스트 박스 -->
						<div id="study_list_<c:out value="${result.CSEQNO}"/>" class="study_list on">
							<img src="/academy/images/thumb01.jpg" alt="리스트 박스" />
							<div class="text">
								<h4><c:out value="${result.SEQ_TITLE}"/></h4>
								<p><c:out value="${result.SHORT_DESCRIPTION}" escapeXml="true"/></p>
							</div>
						</div>
						<!-- // 리스트 박스 -->
						<!-- 리스트 펼쳤을때의 내용 -->
						<div id="study_list_info_<c:out value="${result.CSEQNO}"/>"  class="study_list_info">
						<h5>과정소개</h5>
						<div class="table_box">
							<table cellpadding="0" cellspacing="0" class="col_type">
								<caption>과정소개 : 상상스토리 교육시스템의 집합교육의 과정소개입니다.</caption>
								<colgroup>
									<col width="150px"/>
									<col width="" />
								</colgroup>
								<tbody>
									<tr>
										<th>과정명</th>
										<td><pre><strong class="t_orange"><c:out value="${result.COURSETITLE}"/></strong></pre></td>
									</tr>
									<tr>
										<th>교육대상</th>
										<td><pre><c:out value="${result.TARGET}"/></pre></td>
									</tr>
									<tr>
										<th>과정개요</th>
										<td><pre><c:out value="${result.DESCRIPTION}"/></pre></td>
									</tr>
									<tr>
										<th>학습목차</th>
										<td><pre><c:out value="${result.PROGRESS}"/></pre></td>
									</tr>
									<tr>
										<th>수료기준</th>
										<td><pre><c:out value="${result.COMPLETION}"/></pre></td>
									</tr>
								</tbody>
							</table>
						</div>
						<h5>일정 및 신청</h5>
						<div class="table_box">
							<table cellpadding="0" cellspacing="0" class="row_type">
								<caption>일정 및 신청 테이블 : 상상스토리 교육시스템 집합교육의 일정 및 신청 테이블입니다.</caption>
								<colgroup>
									<col width="220px"/>
									<col width="170px"/>
									<col width="170px"/>
									<col width="83px"/>
								</colgroup>
								<thead>
									<tr>
										<th>과정</th>
										<th>접수기간</th>
										<th>교육기간</th>
										<th>신청</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><c:out value="${result.COURSETITLE}"/></td>
										<td class="small_space"><c:out value="${result.APPLY_SDATE}"/> ~ <c:out value="${result.APPLY_EDATE}"/></td>
										<td class="small_space"><c:out value="${result.STUDY_SDATE}"/> ~ <c:out value="${result.STUDY_EDATE}"/></td>
										<td>
											<jsp:useBean id="toDay" class="java.util.Date" />
											<c:set var="day"><fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" /></c:set>
											<c:set var="statusCode"><%=SangsProperties.getProperty("Globals.mtCode_MT_CSEQ_STATUS_CODE_APPLY_END")%></c:set>
											<!-- 신청기간체크, 정원체크, 개설상태에 따라 신청버튼 노출 -->
											<!-- && result.MAX_CNT > result.COURSE_USER_CNT -->
											<c:choose>
												<c:when test="${ (result.APPLY_SDATE >= day || result.APPLY_EDATE >= day)
													&& result.MT_CSEQ_STATUS_CODE < statusCode }">
													<a href="#" onclick="javascript:fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>'); return false;" class="btn blue" title="신청">신청</a>
												</c:when>
												<c:otherwise><button title="마감" class="btn gray">마감</button></c:otherwise>
											</c:choose>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
						<!--  리스트펼쳤을때의 내용 -->
					</li>
				</c:when>
			<c:otherwise>
				<li><div align="center">등록된 정보가 없습니다.</div></li>
			</c:otherwise>
		</c:choose>
				

			</ul>

		</div><!-- // Contents -->
	</div><!-- Right_Area -->
</div><!-- contents-wrap 닫기 -->
	
	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->