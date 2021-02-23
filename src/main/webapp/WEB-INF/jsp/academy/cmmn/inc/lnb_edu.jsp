<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
    subject	: [공통] > 온라인 교육 > LEFT 영역
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
        <span class="bold">금융교육</span>
    </h1>
    <nav>
        <ul class="leftNavi">
        	<li class="lnb_eduGuide"><a href="/academy/course/onMain.do" title="금융교육 소개">금융교육 소개</a></li>
        </ul>
    </nav> 
</div>