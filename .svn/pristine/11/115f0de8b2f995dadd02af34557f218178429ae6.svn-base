<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<!-- 기업정보용 -->
<form name="frm" id="frm" action="" method="post">
<input type="hidden" name="comName" id="comName" value="<c:out value="${REQUEST_DATA.comName}"/>">
<input type="hidden" name="BIZNO" id="BIZNO" value="<c:out value="${REQUEST_DATA.BIZNO}"/>">
<input type="hidden" name="companyGradeCode" id="companyGradeCode" value="<c:out value="${REQUEST_DATA.companyGradeCode}"/>">
</form>

<script type="text/javascript">

$(document).ready(function(){

		<c:if test="${REQUEST_DATA.comModifyYn eq 'Y'}">
			alert('등록되었습니다.');

			$('#comName').val('<c:out value="${REQUEST_DATA.comName}"/>');
			$('#BIZNO').val('<c:out value="${REQUEST_DATA.BIZNO}"/>');
			$('#COMNO').val('<c:out value="${REQUEST_DATA.COMNO}"/>');
			$('#companyGradeCode').val('<c:out value="${REQUEST_DATA.companyGradeCode}"/>');
			
			$('#frm').attr('action', '/academy/user/memberJoinForm.do');

			$('#frm').submit();
		</c:if>

		<c:if test="${empty REQUEST_DATA.comModifyYn}">
			<c:if test="${!empty REQUEST_DATA.msg}">
				alert('<c:out value="${REQUEST_DATA.msg}"/>');
			</c:if>
			window.location.href = '<c:out value="${REQUEST_DATA.url}"/>';

		</c:if>

});

</script>
<div class="contents-wrap join2">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_etc.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>회원서비스</span></li>
				<li class="location"><span>회원가입</span></li>
			</ul>

			<div class="sub-tit">
				<h3>회원가입</h3>
				<p>상상스토리에 오신 여러분을 환영합니다. </p>
				<p>등록하신 이메일로 가입승인 URL이 발송되었으니 확인 부탁드립니다.</p>
			</div>

			<div class="contents" id="sContents">

				<ul class="join-list type02">
					<li class="step1"><span>이용약관동의</span></li>
					<li class="step2"><span>회원정보입력</span></li>
					<li class="step3 on"><span>회원가입완료</span></li>
				</ul>

				<div class="join-last">
					<h4>회원가입이 완료되었습니다.</h4>
					<p>등록하신 이메일로 가입승인 URL이 발송되었으니 확인 부탁드립니다.</p>
					<p>상상스토리 상상스토리를 <span class="dinline">이용해 주셔서 감사합니다.</span></p>

					<ul class="btn-list abs">
						<li><a href="/academy/common/login.do" class="btn green" title="로그인 바로가기">로그인</a></li>
						<li><a href="/academy/main/main.do" class="btn home">홈으로</a></li>
					</ul>
				</div>



				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


			</div><!-- //contents-->



		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->

