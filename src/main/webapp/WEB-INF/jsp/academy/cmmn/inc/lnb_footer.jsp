<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
	subject	: [공통] > 기타 > LEFT 영역
	summary	: LEFT 영역
	author	: SANGS
	date	: 2016-06-01
****************************************/
%>
<script type="text/javascript">
    $(document).ready(function(){
    	$('.ul_gnb').find('.gnb_<c:out value="${menu_nm}"/>').addClass('on');
		$('.leftNavi').find('.lnb_<c:out value="${lnb_menu}"/> a').addClass('active');	
	
    });

    function noLink(){
		alert('준비중 입니다.');
		return false;
    }
</script>
<div class="leftMn">
    <h1 class="ltTitle">
        <span class="bold">이용안내</span>
    </h1>
    <nav>
        <ul class="leftNavi">
           	<li class="lnb_agree1"><a href="/academy/intro/agree1.do" title="이용약관">이용약관</a></li>
			<!-- <li class="lnb_agree2"><a href="/academy/intro/agree2.do" title="개인정보정책">개인정보보호방침</a></li> -->
			<li class="lnb_agree2"><a href="http://www.kinfa.or.kr/home/operation_guide/individual_information.jsp" onclick="javascript:window.open(this.href,'새창','width=1100,height=800');return false;" target="_blank">개인정보처리방침</a></li>
			<!-- <li class="lnb_agree2"><a href="http://www.kinfa.or.kr/home/operation_guide/individual_information.jsp" target="_blank" title="개인정보보호정책">개인정보보호정책</a></li> -->
			<li class="lnb_agree3"><a href="/academy/intro/agree3.do" title="저작권보호정책">저작권보호정책</a></li>
			<li class="lnb_agree4"><a href="/academy/intro/introGuide.do" title="찾아오시는길">찾아오시는 길</a></li>
			<li class="lnb_agree5"><a href="/academy/intro/siteMap.do" title="전체메뉴">전체메뉴</a></li>
        </ul>
    </nav>
</div>