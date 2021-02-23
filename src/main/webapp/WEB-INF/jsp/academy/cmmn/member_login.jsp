<%--
    Description : 회원가입 > 약관동의
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.07.07  이진영           최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/academy/common/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/academy/common/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/academy/common/js/rsa/rng.js"></script>
<script type="text/javascript" src="/academy/common/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/academy/common/js/rsa/base64.js"></script>
<script type="text/javascript" src="/academy/common/js/sha/core.min.js"></script>
<script type="text/javascript" src="/academy/common/js/sha/sha256.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	if($.cookie('save_id')) { //쿠키값이있다면

		$('#login_id').val($.cookie('save_id')); //아이디세팅
		$('#save_id_chk:checkbox').attr('checked','checked'); //체크박스 세팅
		$("#pId").text(""); 
		$('#login_pwd').focus();
		
	}else{
		//$('#login_id').focus();	
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
 
	
    var securedUserId        = fn_encrypt(encodeURIComponent($('#login_id').val()));
    
    // 웹 취약점 -> 인코딩 주석 - 20190508
//     var securedPassword      = fn_encrypt(encodeURIComponent($('#login_pw').val()));
    var securedPassword      = $('#login_pw').val();

 
    var rsaPublicKeyModulus  = $("#rsaPublicKeyModulus").val();
    var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
    
    submitted = true;
    
    submitEncryptedForm(securedUserId, securedPassword, rsaPublicKeyModulus, rsaPublicKeyExponent);
    
    submitted = false;
    
	return; 
	
    //frm.securedPassword.value = securedPassword;
    //frm.submit();
}

function submitEncryptedForm(userId, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

    // 사용자ID와 비밀번호를 RSA로 암호화한다.
    var securedUserId = rsa.encrypt(userId);
    var securedPassword = rsa.encrypt(password);
    
    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    var frm = document.getElementById("frm");
    frm.securedUserId.value = securedUserId;
    frm.securedPassword.value = securedPassword;
    
    
    frm.submit();
}



</script>


<div class="container" id="Subcontent">
  <article class="subArea">
      <div class="subCntWrap">
      	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_etc.jsp"%>
      	  <div class="path">
              <ul>
                  <li><span class="home text-hide">홈</span></li>
                  <li>로그인</li>
                  <li class="active currentNavi">로그인</li>
              </ul>
          </div>
          <div class="subConts" id="sub-content">
               <section class="bgTop_cate07"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			 <h2 class="h2_tit">로그인</h2>
	            		</div>           	
	          	  </section>
              
              <form name="frm" id="frm" action="/academy/common/loginExec.do" method="post"  target="_self">
				<input type="hidden" name="subcmd" value="exec"/>
				<input type="hidden" name="site" value="academy"/>
				<input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />
				<input type="hidden" name="securedUserId" id="securedUserId" value="" />
				<input type="hidden" name="securedPassword" id="securedPassword" value="" />
				<input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" />
				<input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" />
				<input type="hidden" name="pollcseqno" id="pollcseqno" value="<c:out value="${REQUEST_DATA.pollcseqno}"/>" />
				<%-- <input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>" />
				<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>" />
				<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>" /> --%>
				<input type="hidden" name="smsAuthCode" id="smsAuthCode" value="" /><!-- sms 인증코드 -->
				<input type="hidden" name="authCheckYn" id="authCheckYn" value="N" /><!-- 인증여부 -->
				<input type="hidden" name="moblphon" id="moblphon" value="" />

              
              <div id="loginArea">
	              <section>
	                      <fieldset>
	                          <legend>로그인</legend>
	                          <div class="borBox loginWrap">
	                              <span class="icoLogin"></span>
	                              <h3>LOGIN</h3>
	                              <p class="fnt16 bold po_C7"><span class="po_C4">회원</span>일 경우 <span class="po_C4">로그인</span> 해주시기 바랍니다.</p>
	                              <div class="logBoxWrap">
	                                  <div class="logBox">
	                                      <input type="text" title="아이디" id="login_id" name="userId" placeholder="아이디">
	                                      <input type="password" title="비밀번호" id="login_pw" name="pwd" placeholder="비밀번호" autocomplete="off" onKeyPress="enterChk();">
	                                      <button type="button" class="btnLogin" title="로그인" onclick="submitCheck(); return false;">로그인</button>
	                                  </div>
	                                  <div class="checkbox">
	                                      <label title="아이디저장">
	                                          <input title="아이디저장" type="checkbox" id="save_id_chk"> 아이디저장
	                                      </label>
	                                  </div>
	                                  <div class="loginBtns">
<!-- 	                                      <a title="회원가입" href="/academy/user/memberJoinForm.do"><span class="login_join"></span>회원가입</a> -->
	                                      <a href="/academy/user/memberJoinAgree.do"><span class="login_join"></span>회원가입</a>
	                                      <a title="아이디/비밀번호 찾기" href="/academy/user/memberIdPw.do"><span class="login_id"></span>아이디/비밀번호 찾기</a>
	                                  </div>
	                              </div>
	                          </div>
	                      </fieldset>
	              </section>
			  </div>
			</form>
          </div>
      </div>
  </article>
</div>

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->