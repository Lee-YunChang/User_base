<%
/****************************************************
	system	: 신청종료
	title	: 
	summary	:	
	wdate	: 2016-09-19
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 
<script type="text/javascript">

	$('#gnb').find('.gnb_<c:out value="${menu_nm}"/>').addClass('on');
	$('#sub-gnb ul').find('.lnb_<c:out value="${lnb_menu}"/>').addClass('on');

	function fnMove(pmode){
	
		if('myclass' == pmode){
			location.href='/academy/myclass/myclassList.do';
		} else if('home' == pmode){
			location.href='/academy/main/main.do';
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
				<li class="location"><span>
						<c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA00'}">온라인교육</c:if>
						<c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA01'}">집합교육</c:if>
				</span></li>
			</ul>

			<div class="sub-tit">
				<h3><c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA00'}">온라인교육</c:if>
						<c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA01'}">집합교육</c:if></h3>
				<p>상호간 유대관계 및 협력체계의 강화를 통해 교육효과를 증대하기위한 교육입니다.</p>
			</div>
			
			<form name="frm" id="frm" action="/academy/myclass/myclassList.do" method="post">
				<input type="hidden" name="cseqno" id="cseqno"  value="<c:out value="${rowData.CSEQNO}"/>"/>
				<input type="hidden" name="courseno" id="courseno"  value="<c:out value="${rowData.COURSENO}"/>"/>
				<input type="hidden" name="cuserno" id="cuserno"  value="<c:out value="${rowData.CUSERNO}"/>"/>
				
				<!-- 강의실 이동 -->
				<input type="hidden" name="paramcSeqNo" id="paramcSeqNo"  value="<c:out value="${rowData.CSEQNO}"/>"/>
				<input type="hidden" name="paramCourseNo" id="paramCourseNo"  value="<c:out value="${rowData.COURSENO}"/>"/>
				<input type="hidden" name="paramcUserNo" id="paramcUserNo"  value="<c:out value="${rowData.CUSERNO}"/>"/>
				<input type="hidden" name="CLASSDESK" id="CLASSDESK"  value="<c:out value="${rowData.CLASS_DESK}"/>"/>
				
				<div class="contents" id="sContents">

					<div class="join-last">
						<h4>수강신청 되었습니다.</h4>

						<ul class="btn-list abs">
							<li><a href="#none" onclick="fnMove('myclass');return false;" title="강의실이동">강의실 이동</a></li>
							<li><a href="#none" onclick="fnMove('home');return false;" title="홈으로이동">홈으로 이동</a></li>	
						</ul>
					</div>
					<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>

				</div><!-- //contents-->

			</form>

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->
	
<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->