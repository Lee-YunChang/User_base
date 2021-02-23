<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
/****************************************
	subject	: [공통] > 온라인교육 > LEFT 영역
	summary	: LEFT 영역
	author	: SANGS
	date	: 2015-06-01
****************************************/
%>

<script type="text/javascript">
    $(document).ready(function(){
        initPage();
        
	$('#GNB').find('.gnb_<c:out value="${menu_nm}"/>').addClass('on');
	$('#LNB ul').find('.lnb_<c:out value="${lnb_menu}"/>').addClass('on');

    });

</script>

<!-- 왼쪽 메뉴 영역 -->
		<div id="LNB">
			<h2>온라인교육</h2>
			<ul>
				<!-- <li class="lnb_course"><a href="/academy/course/onMain.do" title="과정소개및일정">과정소개 및 일정</a></li>
				<li class="lnb_guide"><a href="/academy/course/onGuide01.do" title="수강신청안내">수강신청 안내</a></li> -->
				<li class="lnb_courseInfo"><a href="/academy/course/courseInfo.do" title="교육과정소개">교육과정소개</a></li>
				<li class="lnb_cyber"><a href="/academy/course/onMain.do" title="온라인교육">온라인교육</a></li>
				<li class="lnb_offMain"><a href="/academy/course/offMain.do" title="집합교육">집합교육</a></li>
				<li class="lnb_cpsedu"><a href="/academy/course/cpseduMain.do" title="의무교육">의무교육</a></li>
				<li class="lnb_lectureEdu"><a href="/academy/course/lectureEdu.do" title="특강교육">특강교육</a></li>
			</ul>
		</div>
<!-- // 왼쪽 메뉴 영역 -->