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
        <span class="bold">회원서비스</span>
    </h1>
    <nav>
        <ul class="leftNavi">
            <li class="lnb_login"><a href="/academy/common/login.do" title="로그인">로그인</a></li>
<!-- 			<li class="lnb_memberJoin"><a href="/academy/user/memberJoinForm.do" title="회원가입">회원가입</a></li> -->
			<li class="lnb_memberJoin"><a href="/academy/user/memberJoinAgree.do" title="회원가입">회원가입</a></li>
			<li class="lnb_find"><a href="/academy/user/memberIdPw.do" title="아이디 비밀번호 찾기">아이디/비밀번호 찾기</a></li>
        </ul>
    </nav>
</div>