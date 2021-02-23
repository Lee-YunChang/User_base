<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
/****************************************
    subject	: [공통] > 마이페이지 > LEFT 영역
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
        <span class="bold">내 정보</span>
    </h1>
    <nav>
        <ul class="leftNavi">
			<c:if test="${REQUEST_DATA.SES_USERID ne null && REQUEST_DATA.SES_USERID ne ''}">
			<li class="lnb_member"><a href="/academy/myclass/memberModifyAuthForm.do" title="개인정보관리">개인정보관리</a></li>
			<li class="lnb_inquiry"><a href="/academy/myclass/chatting.do" onclick="javascript:window.open(this.href,'새창','width=300,height=570,scrollbars=yes');return false;" target="_blank" title="문의하기">문의하기</a></li>
			</c:if>
        </ul>
    </nav>
</div>

 