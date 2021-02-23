<%
/****************************************************
	system	: academy > 회원 > 회원 탈퇴
	title	: 회원 탈퇴
	summary	:	
	wdate	: 2015-03-31
	writer	: kim hak gyu 
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/academy/common/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/academy/common/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/academy/common/js/rsa/rng.js"></script>
<script type="text/javascript" src="/academy/common/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/academy/common/js/rsa/base64.js"></script>
<c:set var="req" value="${pageContext.request}"/>
<script type="text/javascript">

$(document).ready(function(){
	if($('#checkStat').val()==1){
		alert("패스워드가 일치하지 않습니다.");
	}else if($('#checkStat').val()==2){
		alert("오류가 발생하였습니다. 재시도 해주세요.");
	}

});

//엔터키 인식
function enterChk() {
	if(event.keyCode == 13) {
		authMember();
	}
}

function authMember(){
	
	var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
    var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
    
    // 취약성 주석 -> 인코딩 주석 20190508
// 	var password = fn_encrypt(encodeURIComponent($('#unityPassword').val()));
	var password = $('#unityPassword').val();
    
	var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);

    // 사용자비밀번호를 RSA로 암호화한다.
    var securedPassword = rsa.encrypt(password);
    $('#userId').val('<c:out value="${REQUEST_DATA.SES_USERID}"/>');
 	$('#pwd').val(securedPassword);
    $('#userNo').val('<c:out value="${REQUEST_DATA.userNo}"/>');
	$('#frm').attr('action','/academy/user/member/searchPwd2.do');
	$('#frm').submit();
	/* ajaxSubmit2('/academy/user/member/searchPwd.do',
			{  	userId : '<c:out value="${REQUEST_DATA.SES_USERID}"/>',
				pwd : securedPassword
			}, 'json',
			eval('authMember2')
	); */
}
//회원인증 실행
function authMember2(data){
	if($('#unityPassword').val() ==''){
		alert("비밀번호를 입력해 주세요.");
		$('#unityPassword').focus();
		return false;
	}
	
	if(data == 0) {
		alert('비밀번호가 틀렸습니다.');
		$('#unityPassword').focus();
		return false;
	} 
	else{
		
		alert('본인인증 되었습니다.');
		
		$('#userNo').val('<c:out value="${REQUEST_DATA.userNo}"/>');
		$('#frm').attr('action','/academy/myclass/memberModifyForm.do');
		$('#frm').submit();
	}
}

</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
            <div class="path">
                <ul>
                    <li><span class="home text-hide">홈</span></li>
                    <li>내강의실</li>
                    <li class="active">개인정보관리</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
            	<section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">개인정보관리</h2>
            		</div>           	
	            </section>
            

				<section>
	            	<section>
	                	<form name="frm" id="frm" action="" method="post">
	                    	<fieldset>
	                        	<legend>비밀번호확인${REQUEST_DATA}</legend>
	                            <div class="borBox loginWrap passLogin">
	                            	<span class="icoLogin"></span>
	                                <p class="fnt16 bold po_C7">본인 확인을 위해 <span class="po_C4">비밀번호</span>를 입력해주세요.</p>
	                                	<div class="logBoxWrap">
	                                    	<div class="logBox">
	                                    		<input type="hidden" name="checkStat" id="checkStat" value="<c:out value="${REQUEST_DATA.checkStat}"/>">
	                                    		<input type="hidden" name="userId" id="userId" value="">
	                                    		<input type="hidden" name="pwd" id="pwd" value="">
		                                        <input type="hidden" name="userNo" id="userNo" value="">
												<input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" />
				    							<input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" />
		                                        <input type="text"  id="pixid" title="아이디 입력" placeholder="${REQUEST_DATA.SES_USERID}" disabled >
		                                        <input type="password" autocomplete="off" id="unityPassword" title="비밀번호 입력" placeholder="비밀번호" onclick="enterChk();" value="">
		                                        <button type="submit" class="btnLogin" onclick="authMember();return false;" class="btn cancel" title="본인확인">본인확인</button>
	                                   		</div>
	                                                  <!--   <div class="btnAreaC mrg_t30">
	                                                    <a href="#none" onclick="fnList();return false;"class="btn btn-lg btn-gray" title="취소">취소</a>
	                                                      
	                                                    </div> -->
	                                     </div>
	                            </div>
	                        	</fieldset>
	                    </form>
	               </section>
	           </section>
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->