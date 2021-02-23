<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
	subject	: [공통] > 방문 교육 > LEFT 영역
	summary	: LEFT 영역
	author	: SANGS
	date	: 2015-06-01
****************************************/
%>
<script type="text/javascript">
    $(document).ready(function(){
		$('.ul_gnb').find('.gnb_<c:out value="${menu_nm}"/>').addClass('on');
		$('.leftNavi').find('.lnb_<c:out value="${lnb_menu}"/> a').addClass('active');
    });
</script>
<div class="leftMn">
    <h1 class="ltTitle">
        <span class="bold">방문 교육</span>
    </h1>
    <nav>
        <ul class="leftNavi">
        	<li class="lnb_lectureInfo"><a href="/academy/course/lectureInfo.do" title="교육 안내">교육 안내</a></li>
            <li class="lnb_lecture"><a href="/academy/course/lectureForm.do" title="교육 신청">교육 신청</a></li>
            <li class="lnb_lecture_event"><a href="/academy/course/lectureEvent.do?bcateno=1040" title="온라인교육후기">온라인교육후기</a></li>
        </ul>
    </nav>
</div>