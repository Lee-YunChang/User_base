<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<c:choose>
    <c:when test="${frontMnuCode01=='lnb_member'}"><c:set var="lnbName" value="MEMBER"/></c:when>
</c:choose>
<body>
	
<!-- left_menu -->
<div class="lnb">
	<h2><p class="tit"><c:out value="${lnbName}"/><p class="en_tit"><!-- <img src="/academy/images/academy/lnb_ad.png" alt="Academy" /> --></p></h2>
	<ul class="ldep2" id="lnb_member">
		<li><a id="left_form" href="/academy/common/login.do" title="로그인">로그인</a></li>
		<li><a id="left_memberJoin" href="/academy/user/memberJoinAgree.do" title="회원가입">회원가입</a></li>
		<li><a id="left_memberModify" href="/academy/user/member/memberModify.do" title="회원정보수정">회원정보수정</a></li>
		<li><a id="left_memberIdPw" href="/academy/user/member/memberIdPw.do" title="아이디 비밀번호 찾기">아이디/비밀번호 찾기</a></li>
		<li><a id="left_memberCancel" href="/academy/user/member/memberCancel.do" title="회원탈퇴">회원 탈퇴</a></li>
	</ul>
</div>
</body>
<script type="text/javascript">
	var frontMnuCode01 = "<c:out value="${frontMnuCode01}"/>";	
	var frontMnuCode02 = "<c:out value="${frontMnuCode02}"/>";
	jQuery(document).ready(function() {
		$('.ldep3').not(SANGS.Util.getId(frontMnuCode01)).hide();
		
		<c:if test="${not empty  frontMnuCode02}">
		$(SANGS.Util.getId(frontMnuCode01)).find('a').eq(frontMnuCode02).attr('style', 'color: #fff; background: #5395ca;');
		$(SANGS.Util.getId(frontMnuCode01)).parent().find('a:first').addClass('now');
		
		</c:if>
		
		<c:if test="${empty  frontMnuCode02}">
		$('.lnb .ldep2').find(SANGS.Util.getId(frontMnuCode01)).find('a').addClass('now');
		</c:if>
		
	});
</script>

</html>