<%
/* *******************************************
    system  : 나의강의실 > 온라인학습 메인
    title   : 메인
    summary :	
    wdate   : 2016-09-01
    writer  : SANGS
******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>온라인 학습 강의실</title>
</head>
<link rel="stylesheet" href="/academy/common/css/main_style.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<body class="body_bg">
<div class="header_wrap">
	<div class="header_title">
		<img src="/academy/images/header_logo.png" alt="온라인 학습 강의실" />
		<p class="header_text">온라인 학습 강의실</p>
	</div>
</div>
<script type="text/javascript">

	$(document).ready(function(){
		

	});
	
	function fnPageMove(url){
		$("#frm").attr("action", url);
		$("#frm").submit();
	}
	
	// 강의 변경
	function selectTitle(pval){
		$("#frm").attr("action", '/classdesk/user/progress/treeMain.do');
		$('#courseSelect').val(pval);
		$("#frm").submit();
	}
</script>

	<form name="frm" id="frm" action="" method="post"> 
	<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
	<input type="hidden" name="courseSelect" id="courseSelect" value="<c:out value="${REQUEST_DATA.courseSelect}"/>"/>
	<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>"/>
	<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="<c:out value="${REQUEST_DATA.paramcUserNo}"/>"/>
	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>"/>
	<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
	<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
	
	<div class="section_wrap">
		<div class="section">
		<div class="left_top">
			<div class="text_01">
				<p class="title_big">교육 과정명</p>
				<p><c:out value="${rowData.SEQ_TITLE}"/></p>
			</div>
			<div class="text_02">
				<p class="title_small">과정설명</p>
				<p>
				<c:out value="${fn:substring(fn:replace(rowData.DESCRIPTION, newline, '<br>'),0,105)}"/><c:if test="${fn:length(fn:replace(rowData.DESCRIPTION, newline, '<br>'))>105}">...</c:if>
				</p>
			</div>
			<div class="text_03">
				<p class="title_small">교육기간</p>
				<p>
					<c:if test="${rowData.OPENTYPE eq 'D'}">
						<td>
							<c:choose>
								<c:when test="${tchItem.OPENTYPE eq 'A'}">
									<span><fmt:formatDate value="${rowData.STARTDATE}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${rowData.ENDDATE}" pattern="yyyy.MM.dd" /></span>
								</c:when>
								<c:otherwise>
									<span><c:out value="${rowData.STUDY_SDATE}"/> ~ <c:out value="${rowData.STUDY_EDATE}"/></span>
								</c:otherwise>
							</c:choose>
						</td>
					</c:if>
					<c:if test="${rowData.OPENTYPE eq 'A'}">
						<td>
							<p>상시운영</p>
						</td>
					</c:if>
				</p>
			</div>
				<img src="/academy/images/icon_online.png" alt="icon"  class="online_icon"/>
		</div>
		<div class="right_top">
			<a href="#none" onclick="fnPageMove('/classdesk/user/progress/treeSubList.do'); return false;" title="학습하기 이동">
				<div class="right_top_01">
					<p>학습하기</p>
					<img src="/academy/images/icon_notice.png" alt="학습하기" />
				</div>
			</a>
			<div class="right_top_02">
				<p>학습문의</p>
				<p class="call_num">02-2125-9895</p>
			</div>
		</div>
		<div class="left_bottom">
			<p>학습 차시 (학습한 페이지 수/ 전체 페이지 수)</p>
			<c:if test="${not empty listData}">
			<ul>
				<c:forEach items="${listData}" var="result" varStatus="stat">
				<li><a href="#none" onclick="fnPageMove('/classdesk/user/progress/treeSubList.do'); return false;" title="학습하기 이동"><img src="/academy/images/dot.png" alt="리스트" /><span class="list_time">(<c:out value="${result.FRAMESEQ}" /><span>&#47;</span><c:out value="${result.FRAMECNT}"/>)</span>
				<span><c:out value="${stat.index + 1}" />차시 <c:out value="${result.SUBJECT}" /></span></a></li>
				</c:forEach>
			</ul>
			</c:if>
		</div>
		<div class="right_bottom">
			<div class="right_bottom_01">
				<p>수강중인 온라인 학습</p>
				<select name="courseSelect" id="courseSelect" title="강의선택" onchange="selectTitle(this.value);" >
					<c:forEach items="${courseList}" var="result">
						<option <c:if test="${result.CSEQNO eq  REQUEST_DATA.paramcSeqNo}"> selected="selected"</c:if> value="<c:out value="${result.CUSERNO}" />,<c:out value="${result.CSEQNO}" />,<c:out value="${result.COURSENO}"/>,<c:out value="${result.CLASS_DESK}"/>,<c:out value="${result.SEQ_TITLE}"/>,<c:out value="${result.MT_CTYPE_NAME}"/>" ><c:out value="${result.SEQ_TITLE}"/></option>	
					</c:forEach>
				</select>
			</div>
			<div class="right_bottom_02">
				<img src="/academy/images/icon_call.png" alt="call" />
				<div class="right_bottom_02_text">
					<p class="right_bottom_02_title">온라인 교육</p>
					<p class="right_bottom_02_guide">하루에 총 3강까지 수강 가능, 진도율 90% 이상시 자동 이수 처리
					신청한 과정은 교육기간이 종료되어도 학습가능(진도율불변)
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<div class="footer_wrap">
	<div class="footer">
		<div class="footer_title">
			<span>온라인 학습 강의실</span>
		</div>
		<div class="footer_text">
			<span>(우) 04551 서울시 중구 삼일대로 340(저동1가) 나라키움 저동빌딩 13층 교육운영팀. 대표전화 : 02) 2125-9895, 이메일: edu@humanrights.go.kr<br/>
						Copyrights © NATIONAL HUMAN RIGHTS COMMISSION OF THE REPUBLIC OF KOREA ALL RIGHTS RESERVED.
			</span>
		</div>
	</div>
</div>
</body>
</html>
