<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
	subject	: [공통] > 안내공간 > LEFT 영역
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
        <span class="bold">금융생활상담 안내 소개</span>
    </h1>
    <nav>
        <ul class="leftNavi">
            <li class="lnb_intro"><a href="/academy/counselor/counselorIntro.do" title="온라인 1:1맞춤형 심화 상담소개">온라인 금융생활상담소개</a></li>
			<li class="lnb_onMain"><a href="/academy/counselor/onMain.do" title="이용방법 안내">이용방법 안내</a></li>
			<!-- <li class="lnb_bestcslist"><a href="/academy/counselor/bestList.do" title="교육소식">BEST상담</a></li> -->
        </ul>
    </nav>
</div>