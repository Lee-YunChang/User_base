<%
/****************************************************
	system	: 로그인 폼
	title	: 로그인 폼
	summary	:	
	wdate	: 2015-06-01
	writer	: SANGS
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>


<script type="text/javascript">

$(document).ready(function(){

	if($.cookie('save_id')) { //쿠키값이있다면

		$('#login_id').val($.cookie('save_id')); //아이디세팅
		$('#save_id_chk:checkbox').attr('checked','checked'); //체크박스 세팅
		$("#pId").text(""); 
		$('#login_pwd').focus();
		
	}else{
		$('#login_id').focus();	
	}

	
});

function enterChk() {
	if(event.keyCode == 13) {
		go_exec();
	}
}

var delay = 1000;
var submitted = false;

function submitCheck() {
	if(submitted == true) { 
		alert('로그인 처리중 입니다. 잠시만 기다려주세요.');
		return; 
	}
  	setTimeout ('go_exec()', delay);
  	submitted = true;
}

 function go_exec() {
	if('' == $('#login_id').val()) {
		alert('아이디를 입력해 주세요');
		$('#login_id').focus();
		return;
	}
	if('' == $('#login_pw').val()) {
		alert('비밀번호를 입력해 주세요');
		$('#login_pw').focus();
		return;
	}

	if($('#save_id_chk:checkbox').prop('checked')){
		$.cookie('save_id',$('#login_id').val(),{expires:7}); //일주일
	} else {
	 	$.cookie('save_id', '', { expires: -1 }); //쿠키삭제
	}
	
	
	$('#frm').submit();
	
 
    /* var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
    var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
    submitEncryptedForm($('#login_id').val(), $('#login_pw').val(), rsaPublicKeyModulus, rsaPublicKeyExponent);
	return; 
	$('#frm').submit(); */
}
/* function submitEncryptedForm(userId, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

    // 사용자ID와 비밀번호를 RSA로 암호화한다.
    var securedUserId = rsa.encrypt(userId);

    var securedPassword = rsa.encrypt(password);

    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    var securedLoginForm = document.getElementById("securedLoginForm");
    securedLoginForm.securedUserId.value = securedUserId;
    securedLoginForm.securedPassword.value = securedPassword;
    securedLoginForm.submit();
}  */


//아이디 기억
function beforeSubmit() {
	if(!checkNullNAlert('login_id', '아이디를 입력해 주세요')) return false;
	if(!checkNullNAlert('login_pwd', '패스워드를 입력해 주세요')) return false;
}

</script>
 
 <body>
	<div class="contents-wrap">

		<div class="login_text">
			<img src="/academy/images/login_title.png" alt="로그인" />
			<p>상상스토리 교육시스템에 오신 여러분 환영합니다.<br />회원이 되시면 다양한 서비스 및 교육콘텐츠를 이용하실 수 있습니다.</p>
		</div>
		<form name="securedLoginForm" id="securedLoginForm" action="/academy/common/loginExec.do" method="post" target="_self">
			<input type="hidden" name="subcmd" value="exec"/>
    		<input type="hidden" name="site" value="academy"/>
    		<input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />
			<input type="hidden" name="securedUserId" id="securedUserId" value="" />
           	<input type="hidden" name="securedPassword" id="securedPassword" value="" />
		</form>
		<form name="frm" id="frm" action="/academy/common/loginExec.do" method="post" >
			<input type="hidden" name="subcmd" value="exec"/>
    		<input type="hidden" name="site" value="academy"/>
			<input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />
			<input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" />
           	<input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" />
            
		<div id="Contents" tabindex="-1" class="login_wrap">
			<div class="login_input">
				<input type="text" id="login_id" name="userId" title="로그인 아이디" placeholder="ID" /><br />
				<input type="password" autocomplete="off" id="login_pw" name="pwd" title="로그인 비밀번호" placeholder="Password" onKeyPress="enterChk();"/>
			</div>
			<div class="login_btn">
				<a href="#" onclick="go_exec();" id="loginClick" title="로그인"><img src="/academy/images/btn_login.png" alt="로그인"/></a>
			</div>
			<div class="login_save">
				<input type="checkbox" id="save_id_chk" title="아이디 저장"/><label for="save_id_chk">아이디 저장</label>
			</div>
			<div class="login_menu">
				<a href="/academy/user/memberJoinAgree.do" class="btn orange" title="회원가입">회원가입</a>
				<a href="/academy/user/memberIdPw.do" class="btn gray" title="아이디 비밀번호 찾기">아이디/비밀번호 찾기</a>
			</div>
		</div>
		
		</form>

	</div>
</body>	
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>