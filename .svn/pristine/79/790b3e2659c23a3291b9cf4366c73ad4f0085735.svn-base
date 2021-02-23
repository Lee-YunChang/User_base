
<%
/****************************************************
    system	: 회원서비스  > 회원정보 수정 폼
    title	: 개인정보관리
    summary	:
    wdate	: 2016-07-07
    writer	: 이진영
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
<script type="text/javascript" src="/academy/common/js/jquery.showLoading.js"></script>

<script type="text/javascript">

$(document).ready(function(){
  
    onlyNumAlpha('userId');

   
    
    $("#type_m_id").hide();
    $('#moblphon1').attr('disabled', true);
    $('#moblphon2').attr('readonly', true);
    $('#moblphon3').attr('readonly', true);
    
    $('#email3').change(function(e){
    	$('#email2').val($(this).val());
    });
    
    //초기상태 세팅
	var authModeCheck = '<c:out value="${unityMberInfo.AUTH_MODE}"/>';
    if('<c:out value="${unityMberInfo.AUTH_MODE}"/>' == 'S'){
    	$("#type_s_id").show();
    	$("#type_m_id").hide();

        $('#confirm02').attr('checked', true);
        $('#userEmail1').attr('readonly', true);
        $('#userEmail2').attr('readonly', true);
        $('#userEmail3').attr('disabled', true);

        $('#select_phon_num01').attr('readonly', false);
        $('#member_phone_num02').attr('readonly', false);
        $('#member_phone_num03').attr('readonly', false);
    }
    else if('<c:out value="${unityMberInfo.AUTH_MODE}"/>' == 'M' || authModeCheck.length == 0 ){
    	$("#type_m_id").show();
    	$("#type_s_id").hide();

        $('#confirm01').attr('checked', true);
        $('#select_phon_num01').attr('readonly', true);
        $('#member_phone_num02').attr('readonly', true);
        $('#member_phone_num03').attr('readonly', true);

        $('#userEmail1').attr('readonly', false);
        $('#userEmail2').attr('readonly', false);
        $('#userEmail3').attr('disabled', false);
    }

    //가입인증 체크
     $('input[name="confirmBtn"]').click(function(){
        //이메일 인증
        if($(this).val() == 'M'){
        	$("#type_m_id").show();
        	$("#type_s_id").hide();
        	

            $('#userEmail1').attr('readonly', true);
            $('#userEmail2').attr('readonly', true);
            $('#userEmail3').attr('disabled', true);

            $('#moblphon1').attr('readonly', false);
            $('#moblphon2').attr('readonly', false);
            $('#moblphon3').attr('readonly', false);
        }
        
        //휴대폰 인증
        if($(this).val() == 'S'){
        	$("#type_s_id").show();
        	$("#type_m_id").hide();
        	

            $('#moblphon1').attr('readonly', true);
            $('#moblphon2').attr('readonly', true);
            $('#moblphon3').attr('readonly', true);

            $('#userEmail1').attr('readonly', false);
            $('#userEmail2').attr('readonly', false);
            $('#userEmail3').attr('disabled', false);
        }
    });
    

    if($('#part2').attr('checked') == 'checked'){
        $('#company').removeAttr('disabled');
    }

    $('#part1').click(function(){
        $('#company').attr('disabled', 'true');
    });

    $('#part2').click(function(){
        $('#company').removeAttr('disabled');
    });

	
   
});


function check2(){
	 var tempPwd = $('#userPassword').val();
	 var tempPwdChk = $('#userPassword2').val();
	 
	 if(tempPwd != tempPwdChk){
	        alert('비밀번호와 비밀번호 확인이 다릅니다.');
	        $('#userPassword2').focus();
	        return false;
	    } 
	 
}


function check(){
	 var tUserId = $('#userId').val();
	 tUserId = tUserId.replace(/ /gi, '');
	 var tempPwd = $('#userPassword').val();
	 
	 if(tUserId.replace(/ /gi, '') == tempPwd ) {
	        alert('아이디와 비밀번호는 동일한 값으로 입력할 수 없습니다.');
	        $('#userPassword').focus();
	        return false;
	    }

	    var chk_num = tempPwd.search(/[0-9]/g);
	    var chk_eng = tempPwd.search(/[a-z]/ig);

	    if(tempPwd ==''){
	        alert('비밀번호를 입력해 주세요.');
	        return false;
	    }
	    //비밀번호 영문자+숫자 혼용 여부 체크
	    if(chk_num < 0 || chk_eng < 0) {
	      alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
	      $('#userPassword').focus();
	      return false;
	    }

	    //연속된 값 체크
	    if(!chkXXX(tempPwd)){
	        alert('비밀번호는 같은문자를 연속으로 입력할 수 없습니다.');
	        $('#userPassword').focus();
	        return false;
	    }

	    if(!countChkInt(tempPwd)){
	        alert('비밀번호는 연속된 숫자로 입력할 수 없습니다.');
	        $('#userPassword').focus();
	        return false;
	    }

	    //비밀번호 내 특수문자 체크
	    if(!sCharChk(tempPwd)){
	        alert('비밀번호는 특수문자가 1자 이상 기입되어야 합니다.');
	        $('#userPassword').focus();
	        return false;
	    }

	    if(tempPwd.indexOf(' ') > -1) {
	        alert('비밀번호는 공백 사용 불가능 합니다.');
	        $('#userPassword').focus();
	        return false;
	    }

	    if(tempPwd.indexOf('&') > -1) {
	        alert('비밀번호에 &은 사용 불가능 합니다.');
	        $('#userPassword').focus();
	        return false;
	    }

	    //비밀번호 자리수 및 영.숫자 조합 체크
	    if(tempPwd.length <9 || tempPwd.length > 14){
	        alert('비밀번호는 9자 ~ 14자 입력 가능합니다.');
	        $('#userPassword').focus();
	        return false;
	    }
	 	
}


// 취소
function Cancel(){
	location.href="/academy/myclass/memberModifyAuthForm.do"; 
}


//공백사용못하도록
function noSpaceForm(obj) {
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        //alert("해당 항목에는 공백을 사용할수 없습니다.\n공백은 자동적으로 제거 됩니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
}

function pwdModify(){

    window.open('/academy/user/member/popFindPw.do','pwdModify','width=590, height=375');

}

// 수정 
function modifyInfo(){
	var tempPwd = $('#userPassword').val();
    var tempPwdChk = $('#userPassword2').val();
	
    var chk_num = tempPwd.search(/[0-9]/g);
    var chk_eng = tempPwd.search(/[a-z]/ig);

    
    <c:set var="cnt" value="0" />
    
    if(tempPwd ==''){
        alert('비밀번호를 입력해 주세요.');
        $('#userPassword').focus();
        return false;
    }else{
    	<c:set var="cnt" value="${cnt + 1}" />
    }
    //비밀번호 영문자+숫자 혼용 여부 체크
    if(chk_num < 0 || chk_eng < 0) {
      alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
      $('#newUnityPassword').focus();
      return false;
    }else{
    	<c:set var="cnt" value="${cnt + 1}" />
    }

    //연속된 값 체크
    if(!chkXXX(tempPwd)){
        alert('비밀번호는 같은문자를 연속으로 입력할 수 없습니다.');
        return false;
    } else {
    	<c:set var="cnt" value="${cnt + 1}" />
    }

    if(!countChkInt(tempPwd)){
        alert('비밀번호는 연속된 숫자로 입력할 수 없습니다.');
        return false;
    } else {
    	<c:set var="cnt" value="${cnt + 1}" />
    }

    //비밀번호 내 특수문자 체크
    if(!sCharChk(tempPwd)){
        alert('비밀번호는 특수문자가 1자 이상 기입되어야 합니다.');
        $('#newUnityPassword').focus();
        return false;
    } else {
    	<c:set var="cnt" value="${cnt + 1}" />
    }

    if(tempPwd.indexOf(' ') > -1) {
        alert('비밀번호는 공백 사용 불가능 합니다.');
        $('#newUnityPassword').focus();
        return false;
    } else {
    	<c:set var="cnt" value="${cnt + 1}" />	
    }

    if(tempPwd.indexOf('&') > -1) {
        alert('비밀번호에 &은 사용 불가능 합니다.');
        $('#newUnityPassword').focus();
        return false;
    } else {
    	<c:set var="cnt" value="${cnt + 1}" />
    }

    //비밀번호 자리수 및 영.숫자 조합 체크
    if(tempPwd.length <9 || tempPwd.length > 14){
        alert('비밀번호는 9자 ~ 14자 입력 가능합니다.');
        return false;
    } else {
    	<c:set var="cnt" value="${cnt + 1}" />
    }

    if(tempPwd != tempPwdChk){
        alert('비밀번호와 비밀번호 확인이 다릅니다.');
        return false;
    } else {
    	<c:set var="cnt" value="${cnt + 1}" />
    }
    
    
//     if('' == $("#sex").val()) {
//     	alert('성별을 선택해 주세요.');
//     	$("#sex").focus();
//     	return;
//     }
//      if('' == $("#lnmZip").val()) {
//     	alert('주소를 입력해 주세요.');
//     	$("#addBtn").focus();
//     	return;
//     } else{
//     	$("#lnmZips").val($("#lnmZip").val());
//     }
/*     if($('#lnmAdres1').val() == ''){
        alert('주소를 입력해 주세요.');
        $("#lnmAdres1").focus();
        return false;
    } */
    
    
    
//     if( $('input[name="mtGradeCode"]:radio:checked').val() == '') {
//         alert('회원구분을 선택해 주세요.');
//         $('#mtGradeCode').focus();
//         return false;
//     }
    
//     if('' == $("#mtOfficeCode").val()) {
//     	alert('지점을 선택해 주세요.');
//     	return;
//     }
    
    
//     if($(':input:radio[name="emailCheckYn"]:checked').val() == ''){
//     	alert("이메일 수신 여부를 선택하세요");
//          return false;
//     }
    
//      /* if($(':radio[name="confirmBtn"]:checked').val() == 'M'){  */
// 	    if($('#userEmail1').val() == '' || $('#userEmail2').val() == '' ){
// 	        alert('이메일을 입력해 주세요.');
// 	        return false;
// 	    }
//      /* } */ 

//     if($('#select_phon_num01').val() == '' || $('#member_phone_num02').val() == '' || $('#member_phone_num03').val() == ''){
//         alert('휴대폰 번호를 입력해 주세요.');
//         return false;
//     }

//     //휴대폰번호 합치기
//     if($('#select_phon_num01').val() =='' || $('#member_phone_num02').val() =='' || $('#member_phone_num03').val() =='' ){

//         $('#moblphon').val(null);
//     } else {
//         $('#moblphon').val($('#select_phon_num01').val() +'-'+$('#member_phone_num02').val() +'-'+$('#member_phone_num03').val() );
//     }

//     //전화번호 합치기
//     if($('#select_tel_num01').val() =='' || $('#telno2').val() =='' || $('#telno3').val() =='' ){

//         $('#telno').val(null);
//     } else {

//         $('#telno').val($('#select_tel_num01').val() +'-'+$('#telno2').val() +'-'+$('#telno3').val() );
//     }
	
//     if($('#userEmail1').val() !='' || $('#userEmail2').val() !='' ){
//     	$('#email').val($('#userEmail1').val() +'@'+$('#userEmail2').val() );
//     }
   

    if(confirm('회원정보를 변경하시겠습니까?')){
    	$('#frm').attr('target' , '_self');
    	
    	// 웹 취약성 추가 20190508 
// 		$('#formChk').val('${cnt}');
        
//         if($('#formChk').val() == 0) {
//         	alert("정보가 누락되었습니다. 확인해주시기 바랍니다.");
//         	return false;
//         }
    	
//     	var userPassword = fn_encrypt(encodeURIComponent($('#userPassword').val()));
//         var userPassword2 = fn_encrypt(encodeURIComponent($('#userPassword2').val())); 

        var userPassword = $('#userPassword').val();
        var userPassword2 = $('#userPassword2').val(); 
        
        var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
        var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
        
        submitEncryptedForm(userPassword, userPassword2, rsaPublicKeyModulus, rsaPublicKeyExponent);
    	return; 
        //$('#frm').attr('action' , '/academy/myclass/memberModifyExec.do').submit();
    }

}

function submitEncryptedForm(password, password2, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);

    // 사용자ID와 비밀번호를 RSA로 암호화한다.
    var userPassword = rsa.encrypt(password);
    var userPassword2 = rsa.encrypt(password2);
    

    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    var frm = document.getElementById("frm");
    if($('#userPassword').val() != '' && $('#userPassword2').val() != '') {
	    frm.userPassword.value = userPassword;
	    frm.userPassword2.value = userPassword2;
    }
    frm.securedPassword.value = userPassword;
    $('#frm').attr('action' , '/academy/myclass/memberModifyExec.do').submit();
}



//비밀번호 연속된 값 체크
function chkXXX(aaa){
    for(var i=0; i<aaa.length; i++) {
        var temp = aaa.charAt(i);

        if(temp == aaa.charAt(i) && temp == aaa.charAt(i+1) && temp == aaa.charAt(i+2) ) {
            return false;
        }
    }

    return true;
}

//비밀번호 연속숫자 체크
function countChkInt(aaa){

         for(var i=0; i<aaa.length; i++) {
            var temp = aaa.charAt(i);

            //현재 i, 이전i, 이전이전i
            if(temp == aaa.charAt(i) && (temp-1) == aaa.charAt(i-1) && (temp-2) == aaa.charAt(i-2)) {
                return false;
            }
        }

        return true;

}

//비밀번호 특수문자 기입 체크
function sCharChk(aaa){

    var sChar = "-_=+\|()*&^%$#@!~`?></;,.:'";
    var sChar_Count = 0; // 특수문자 입력받은 숫자

    for(var i=0; i < aaa.length; i++){

        //특수문자 기입 카운트
        if(sChar.indexOf(aaa.charAt(i)) != -1){
            sChar_Count++;
        }
    }

    if(sChar_Count == 0){
        return false;
    } else{
        return true;
    }

}

//회원탈퇴 이동
function memberCancel(){
    $('#frm').attr('action', '/academy/myclass/memberCancel.do').submit();

}


//이메일 중복확인
function searchEmail(){
    if($('#email1').val() == '' ||  $('#email2').val() == '') {
        alert('이메일을 적어주세요.');
    } else {
        var email = $('#email1').val() + '@'+$('#email2').val();

        ajaxSubmit('/academy/user/member/authEmaiCheck.do', {  email : email , 'mode' : 'personal'}, 'json', eval('resultSearchEmail'));
    }
}

//이메일 중복확인 콜백
function resultSearchEmail(data){
	//alert(data);
    if(data == 'N') {
    	alert('인증메일을 보내는데 실패했습니다.');
        $('#emailCheckYn').html('N');

    }
    else if(data != 'N') {
    	alert('인증메일을 발송되었습니다.');
        $('#emailChkResult').removeClass();
        $('#emailCheckYn').val('Y');
        $('#emailAuthCode').val(data);
        //alert(data);
    }
}


//모바일 인증발송 AJAX
function authSmsCheck(){
    if($('#confirmMobile1').val() == '' ||  $('#confirmMobile2').val() == '' ||  $('#confirmMobile3').val() == '') {
        alert('휴대폰번호를 적어주세요.');
    } 
    else {
    	var userName = $('#userName').val();
        var mobile = $('#confirmMobile1').val() + '-'+$('#confirmMobile2').val() + '-' +$('#confirmMobile3').val() ;
        ajaxSubmit('/academy/user/member/authSmsCheck.do',{userName : userName , mobile : mobile}, 'json', eval('authSmsCheckCallBack'));
    }
}

//모바일 인증발송 AJAX
function authSmsCheckCallBack(data){
    // 중복일경우 메시지 출력
    if(data != 'N') {
    	$('#smsAuthCode').val(data);
    	alert('인증번호를 발송했습니다');
        //alert(data);
    }

    //중복일경우 메시지 발송 문구 출력
    else if(data == 'N') {
    	alert('인증번호 발송을 실패했습니다');
        $('#smsChkResult').addClass('redFont');
    }
}

//인증 실행
function authStart(){
	
	if($('#authCheckYn').val() == 'Y'){
    	alert('이미 인증이 완료되었습니다.');
    	return false;
	}
	if($('input[name="confirmBtn"]:radio:checked').val() == 'M') {
		 ajaxSubmit('/academy/user/member/searchPwdmatch.do',
	             {  confirmCode : $('#confirmCode').val()
	             }, 'json',
	             eval('resultCodeMatch')
	     );
	}else{
		ajaxSubmit('/academy/user/member/searchPwdmatch.do',
	             {  confirmCode : $('#confirmCode').val()
	             }, 'json',
	             eval('resultCodeMatch')
	     );
	}
}

function resultCodeMatch(data){
	if($('input[name="confirmBtn"]:radio:checked').val() == 'M') {
		if(data==0){
			alert("인증성공");
	        $('#userEmail1').val($('#email1').val());
            $('#userEmail2').val($('#email2').val());
            $('#emailAuthYn').val('Y');
            $('#authCheckYn').val('Y');
		}else if(data==1){
			alert("인증실패");
			$('#authCheckYn').val('N');
		}else{
			alert("인증실패2");
			$('#authCheckYn').val('N');
		}
	}else{
		if(data==0){
			alert("인증성공");
			$('#select_phon_num01').val($('#confirmMobile1').val());
            $('#member_phone_num02').val($('#confirmMobile2').val());
            $('#member_phone_num03').val($('#confirmMobile3').val());
            $('#smsAuthYn').val('Y');
            $('#authCheckYn').val('Y');
		}else if(data==1){
			alert("인증실패");
	        $('#authCheckYn').val('N');
		}else{
			alert("인증실패2");
	        $('#authCheckYn').val('N');
		}
	}
}

//이메일 셀렉트박스 세팅
function emailSelect(val){
    $('#email2').val(val);
}
function userEmailSelect(val){
    $('#userEmail2').val(val);
}


/* 
//우편번호찾기
function zipSearch(){
	 window.open("/academy/user/postEtc.do","post_pop", "width=600,height=450, scrollbars=YES");
}

 */
//우편번호 콜백 스크립트
 function fnZipCodePopupCallBack(data){
      $('#lnmZip').val(data.zip_code);
      $('#lnmAdres1').val(data.adres);
    //  $('#lnmAdres2').focus();
 }
 function  fnZipSelect(zipNo,roadAddr) {
		$("#lnmZip").val(zipNo);
		$("#lnmAdres1").val(roadAddr);
		$('.close').trigger('click'); //layer closed.
	}
 
 
//지점 결과 콜백
function selectJijumDatas(data){
	$("#mtOfficeArea").text(data.name);
	$("#mtOfficeCode").val(data.code);
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
                  <div class="infoBox">
                      <div class="infoBody">
                          <ul class="li_dash">
                              <li>회원 가입, 정보 수정, 회원 탈퇴는 언제든지 자유롭게 이루어집니다.</li>
                              <li>회원 정보 수정을 위하여 비밀번호를 반드시 입력해 주시기 바랍니다.</li>
                              <li>입력하신 소중한 개인정보는 회원님의 명백한 동의 없이 공개 또는 제3자에게 제공되지 않습니다.</li>
                          </ul>
                      </div>
                  </div>
              </section>
			  
			  
			  <hr>

              <section class="tableBox">
                  <p class="rbltopTxt"><strong class="po_C2">* 모든 항목은 필수 항목 입니다.</strong></p>
                  <form name="frm" id="frm" action="/academy/myclass/memberModifyExec.do" method="post">
               	      <input type="hidden" name="email" id="email" value="" /><!-- 이메일 -->
				      <input type="hidden" name="moblphon" id="moblphon" value="" /><!-- 휴대폰번호 -->
               	      <input type="hidden" name="brthdy" id="brthdy" value="" /><!-- 생년월일 -->
               	      <input type="hidden" name="telNo" id="telNo" value="" /><!-- 회사연락처 -->
               	      <input type="hidden" name="idCheckYn" id="idCheckYn" value="N" /><!-- 아이디 중복체크YN -->
               	      <input type="hidden" name="empSeq" id="multipleReg" value="X" /><!-- 중복개인정보관리 방지여부 Y:방지실행 N:방지실행X -->
               	      <input type="hidden" name="smsAuthCode" id="smsAuthCode" value="" /><!-- sms 인증코드 -->
               	      <input type="hidden" name="emailAuthCode" id="emailAuthCode" value="" /><!-- email 인증코드 -->
               	      <input type="hidden" name="authCheckYn" id="authCheckYn" value="N" /><!-- 인증여부 -->
               	      <input type="hidden" name="comNo" id="comNo" value="<c:out value="${unityMberInfo.COMNO}"/>" /><!-- 사업자명 CODE번호 -->
               	      <input type="hidden" name="orgCode" id="orgCode" value="" /><!-- 기관/단체명 CODE번호 -->
               	      <input type="hidden" name="emailAuthYn" id="emailAuthYn" value="" /><!-- 이메일 인증 업데이트 -->
               	      <input type="hidden" name="smsAuthYn" id="smsAuthYn" value="" /><!-- sms 인증 업데이트 -->
               	      <input type="hidden" name="securedPassword" id="securedPassword" value="" />
               	      <input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" />
               	      <input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" />	
               	      
               	      <input type="hidden" name="formChk" id="formChk" value=""/>
                      
                      <fieldset>
                          <legend>개인정보관리</legend>
                          <div class="tblWrap">
                              <table class="writeForm">
                                  <caption>개인정보수정</caption>
                                  <colgroup>
                                      <col style="width:25%">
                                      <col style="width:*">
                                  </colgroup>
                                  <tbody>
                                 	 <tr>
                                        <th scope="col"> 가입인증</th>
                                        <td>
                                           <!--  <label title="휴대폰 인증" class="radio-inline">
                                                <input type="radio" id="confirm02" name="confirmBtn" value="S" title="휴대폰 인증"> 
                                                	휴대폰 인증                                            		
                                            </label>
                                            <label title="이메일 인증" class="radio-inline">
                                                <input type="radio" id="confirm01" name="confirmBtn" value="M" title="이메일 인증">
                                               	 이메일 인증
                                            </label> -->
											<c:choose>
												<c:when test="${unityMberInfo.AUTH_MODE eq 'S'}">SMS인증</c:when>
												<c:when test="${unityMberInfo.AUTH_MODE eq 'M'}">이메일인증</c:when>
												<c:when test="${unityMberInfo.AUTH_MODE eq 'P'}">핸드폰본인인증</c:when>
												<c:when test="${unityMberInfo.AUTH_MODE eq 'I'}">아이핀본인인증</c:when>
												<c:when test="${unityMberInfo.AUTH_MODE eq 'C'}">신용(체크)카드본인인증</c:when>
											</c:choose>                                           	
                                        </td>
                                    </tr>
                                    <!--  실운영 주석 처리 -->
                                  <%--   <tr>
                                        <th scope="row"><label for="confirmMobile1">인증번호 발송</label></th>
                                        <td  id="type_s_id">
                                            <div class="form-inline phoneNum">
                                                <div class="form-group w20">
                                                    <select class="form-control" name="confirmMobile1" id="confirmMobile1" title="휴대폰번호 첫째자리">
                                                         <option value="010">010</option>
					                                       <option value="011">011</option>
					                                       <option value="016">016</option>
					                                       <option value="017">017</option>
					                                       <option value="018">018</option>
					                                       <option value="019">019</option>
                                                    </select>
                                                </div>
                                                <div class="form-group w20">
                                                    <input type="text" class="form-control i-numOnly" id="confirmMobile2" name="confirmMobile2" title="휴대폰번호 둘째자리" maxlength="4" value="<c:out value="${unityMberInfo.MOBLPHON2}"/>">
                                                </div>
                                                <div class="form-group w20">
                                                    <input type="text" class="form-control i-numOnly" id="confirmMobile3" name="confirmMobile3" title="휴대폰번호 셋째자리" maxlength="4" value="<c:out value="${unityMberInfo.MOBLPHON3}"/>">
                                                </div>
                                                <button type="button" onclick="authSmsCheck();return false;" class="btn btn-orange btn-sm" title="인증번호 발송">인증번호 발송</button>
                                                
                                            </div>
                                            <p class="po_C2 mrg_t5 fnt13">※ 휴대폰 번호는 가입 회원을 식별하는 용도로 사용되며 향후 비밀번호 찾기에 임시 비밀번호가 발송됩니다.</p>
                                        </td>
                                        
                                        <td  id="type_m_id">
                                      		<div class="form-inline emailcfm">
                                                 <div class="form-group w20">
                                                     <input type="text" class="form-control"  id="email1" name="email1" title="이메일 아이디" value="<c:out value="${unityMberInfo.EMAIL1}"/>">
                                                 </div>
                                                 @&nbsp;
                                                 <div class="form-group w20">
                                                     <input type="text" class="form-control" id="email2" name="email2" title="이메일 뒷주소 입력" value="<c:out value="${unityMberInfo.EMAIL2}"/>">
                                                 </div>
                                                 <div class="form-group w20">
                                                     <select  class="form-control" title="이메일주소 입력방식 선택" id="email3" name="email3" >
                                                         <option value="">직접입력</option>
                                                         <c:forEach var="emap2" items="${categoryData}" varStatus="status2">
												        	<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
													     </c:forEach>
                                                    </select>
                                                  </div>
                                                 
                                                 <button type="button" onclick="searchEmail();return false" class="btn btn-orange btn-sm" title="인증메일 발송">인증메일 발송</button>
	                                             
                                             </div>
                                             <p class="po_C2 mrg_t5 fnt13">※이메일 주소는 가입 회원을 식별하는 용도로 사용되며 향후 비밀번호 찾기에 임시 비밀번호가 발송됩니다..</p>
                                        </td>
                                    </tr>
                                    
                                    
                                    <tr>
                                        <th scope="row"><label for="confirmCode">인증번호</label></th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group w30">
                                                    <input title="인증번호" type="text" class="form-control i-numOnly" id="confirmCode" name="confirmCode" >
                                                </div>
                                                <button type="button" onclick="authStart(); return false;"  class="btn btn-drkblue btn-sm" title="확인">확인</button>
                                            </div>
                                        </td>
                                    </tr> --%>
                                      <tr>
                                          <th scope="row">아이디</th>
                                          <td>
                                             <%--  <span><c:out value="${unityMberInfo.USERID}"/></span> --%>
                                             <div class="form-inline">
                                                <div class="form-group w30">
                                              		 <input type="text" class="form-control" disabled="disabled" id="userId" name="userId" value="<c:out value="${unityMberInfo.USERID}"/>">
                                          		</div>
                                          	</div>	
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row"><label for="member_pw">비밀번호</label></th>
                                          <td>
                                              <div class="form-inline">
                                                  <div class="form-group w30">
                                                      <input type="password" autocomplete="off" class="form-control" id="userPassword" name="userPassword" title="비밀번호입력" onchange="check();">
                                                  </div>
                                              </div>
                                              <p class="po_C2 mrg_t5 fnt13">※ 비밀번호는 영문/숫자/특수문자를 포함(공백, &amp; 제외)하여 9~14자 사이로 입력하시기 바랍니다.</p>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row"><label for="userPassword2">비밀번호확인</label></th>
                                          <td>
                                              <div class="form-inline">
                                                  <div class="form-group w30">
                                                      <input type="password" autocomplete="off" class="form-control" id="userPassword2" name="userPassword2"  title="비밀번호재입력" onchange="check2();">
                                                  </div>
                                              </div>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row"><label for="member_name">이름</label></th>
                                          <td>
                                              <div class="form-inline">
                                                  <div class="form-group w30">
                                                  	  <input type="text" id="userName" name="userName" value="<c:out value="${unityMberInfo.USERNAME}"/>" class="form-control" disabled="disabled" title="이름입력">
                                                  </div>
                                              </div>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row"><label for="member_gender">성별</label></th>
                                          <td>
                                              <div class="form-inline phoneNum">
                                                  <div class="form-group w30">
                                                      <select id="sex" name="sex" title="성별선택" class="form-control">
														  <option value="">선택</option>
														  <option value="M" <c:if test="${unityMberInfo.SEX == 'M'}">selected="selected"</c:if>>남자</option>
														  <option value="F" <c:if test="${unityMberInfo.SEX == 'F'}">selected="selected"</c:if>>여자</option>
													  </select>
                                                  </div>
                                              </div>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row"><label for="member_birth">생년월일</label></th>
                                          <td>
                                          	
                                              <div class="form-inline phoneNum">
                                                  <div class="form-group w20">
                                                  	  <input type="text" class="form-control" title="생년" id="brthdyYear" name="brthdyYear"  value="${unityMberInfo.BRTHDY_YEAR}" disabled="disabled">	
                                                     <%--  <select name="brthdyYear" id="brthdyYear" class="form-control" title="생년">
                                                          <option disabled="disabled" value="${unityMberInfo.BRTHDY_YEAR}">${unityMberInfo.BRTHDY_YEAR}</option>
                                                      </select>  --%>
                                                  </div>
                                                  <div class="form-group w20">
                                                  	  <input type="text" class="form-control" title="생월" id="brthdyMonth" name="brthdyMonth"  value="${unityMberInfo.BRTHDY_MONTH}" disabled="disabled">	
                                                      <%-- <select name="brthdyMonth" id="brthdyMonth" class="form-control" title="생월">
                                                          <option disabled="disabled" value="${unityMberInfo.BRTHDY_MONTH}">${unityMberInfo.BRTHDY_MONTH}</option>
                                                      </select> --%>
                                                  </div>
                                                 
                                                  <div class="form-group w20">
                                                  	  <input type="text" class="form-control" title="생일" id="brthdyDay" name="brthdyDay"  value="${unityMberInfo.BRTHDY_DAY}" disabled="disabled">
                                                     <%--  <select name="brthdyDay" id="brthdyDay" class="form-control" title="생일">
                                                          <option disabled="disabled" value="${unityMberInfo.BRTHDY_DAY}">${unityMberInfo.BRTHDY_DAY}</option>
                                                      </select> --%>
                                                  </div>
                                              </div>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row"><label for="member_phone">휴대폰번호</label></th>
                                          <td>
                                              <div class="form-inline phoneNum">
                                                   <div class="form-group w20">
                                                   		<input type="text" class="form-control i-onlyNum" id="select_phon_num01" name="select_phon_num01" value="<c:out value="${unityMberInfo.MOBLPHON1}"/>" title="전화번호 중간자리" disabled="disabled">
                                                   </div>
                                                   <div class="form-group w20">
                                                       <input type="text" class="form-control i-onlyNum" id="member_phone_num02" name="member_phone_num02" value="<c:out value="${unityMberInfo.MOBLPHON2}"/>" title="전화번호 중간자리" disabled="disabled">
                                                   </div>
                                                   <div class="form-group w20">
                                                       <input type="text" class="form-control i-onlyNum" id="member_phone_num03" name="member_phone_num03" value="<c:out value="${unityMberInfo.MOBLPHON3}"/>" title="전화번호 마지막자리" disabled="disabled">
                                                   </div>
                                               </div>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row"><label for="member_email">이메일주소</label></th>
                                          <td>
                                              <div class="form-inline">
                                                  <div class="form-group w30">
                                                      <input type="text" class="form-control" id="userEmail1"name="userEmail1" value="<c:out value="${unityMberInfo.EMAIL1}"/>" title="이메일 앞주소 입력" disabled="disabled">
                                                  </div>
                                                  @&nbsp;
                                                  <div class="form-group w30">
                                                      <input type="text" class="form-control" id="userEmail2" name="userEmail2" value="<c:out value="${unityMberInfo.EMAIL2}"/>" title="이메일 뒷주소 입력" disabled="disabled">
                                                  </div>
                                              </div>
                                          </td>
                                      </tr>
                                      
                                      <tr>
                                          <th scope="row"><label for="lnmZip">주소</label></th>
                                          <td>
                                              <div class="form-inline ">
                                                  <div class="form-group w20">
                                                      <input type="text" readonly="readonly" class="form-control" name="lnmZip" id="lnmZip" title="우편번호" value="<c:out value="${unityMberInfo.LNM_ZIP}"/>"/>
                                                  </div>
                                                <!--   <button type="button" name="button" onclick="zipSearch();" class="btn btn-sm btn-default" data-toggle="modal" data-target="#post">우편번호찾기</button> -->
                                                  <button type="button" name="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#post" id="addBtn" title="우편번호찾기">우편번호찾기</button>
                                              </div>
                                              <div class="form-inline address">
                                                  <div class="form-group">
                                                      <input type="text" class="form-control" readonly="readonly" title="주소" id="lnmAdres1" name="lnmAdres1"  value="<c:out value="${unityMberInfo.LNM_ADRES1}"/>">

                                                      <input type="text" class="form-control" title="상세주소" id="lnmAdres2" name="lnmAdres2" value="<c:out value="${unityMberInfo.LNM_ADRES2}"/>">
                                                  </div>
                                              </div>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row"><label for="mtGradeCode">회원구분</label></th>
                                          <td>
                                              <div class="form-inline">
                                                  <div class="form-group w30">
                                                      <select title="회원구분" name="mtGradeCode" class="form-control" id="mtGradeCode">
                                                 		  <c:forEach items="${jobKndCodeList}" var="item">
														  	 <c:if test="${item.MT_SUB_CODE eq unityMberInfo.MT_GRADE_CODE}">																
                                                          		<option value="${item.MT_SUB_CODE}" selected="selected">${item.MT_SUB_NAME}</option>
                                                          	 </c:if>
                                                          <option value="${item.MT_SUB_CODE}">${item.MT_SUB_NAME}</option>
														</c:forEach> 
                                                      </select>
                                                  </div>
                                              </div>
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="row">지점</th>
											<td>
                                                <span id="mtOfficeArea" class="d-inline mrg_r5"><c:out value="${unityMberInfo.MT_OFFICE_NAME}"/></span>
												<%-- <input type="text" name="mtOfficeArea" id="mtOfficeArea" class="form-control" value="<c:out value="${unityMberInfo.MT_OFFICE_NAME}"/>"> --%>
											
                                             	<button type="button" class="btn btn-blue2 btn-sm" data-toggle="modal" data-target="#jijum" title="지점찾기">지점찾기</button>
												<input type="hidden" name="mtOfficeCode" id="mtOfficeCode" value="<c:out value="${unityMberInfo.MT_OFFICE_CODE}"/>"/>
												<p class="po_C2 mrg_t5 fnt13">※ 대출이용자 외에는 해당없음 으로 체크 하시기 바랍니다.</p>								
                                          </td>
                                      </tr>
                                      <tr>
                                          <th scope="col">이메일 수신여부</th>
                                          <td>
                                              <label title="예" class="radio-inline">
                                                  <input type="radio" name="emailCheckYn" id="emailCheckY" value="Y" <c:if test="${unityMberInfo.EMAIL_RECPTN_AT == 'Y'}">checked="checked"</c:if> >
                                                  예
                                              </label>
                                              <label title="아니오" class="radio-inline">
                                                  <input type="radio" name="emailCheckYn" id="emailCheckN" value="N" <c:if test="${unityMberInfo.EMAIL_RECPTN_AT != 'Y'}">checked="checked"</c:if>>
                                                  아니오
                                              </label>
                                          </td>
                                      </tr>
                                  </tbody>
                              </table>
                          </div>

                      </fieldset>
                  </form>

                  <div class="btnAreaC mrg_t30 memberEdit">
                  
                      <button type="button" name="button" class="btn btn-lg btn-blue" onclick="modifyInfo();return false;" title="확인">확인</button>
                      <button type="button" name="button" class="btn btn-lg btn-gray" onclick="Cancel(); return false;" title="취소">취소</button>
                      <button type="button" name="button" class="btn btn-lg btn-drkblue" onclick="memberCancel(); return false;" title="회원탈퇴">회원탈퇴</button>
                  </div>
              </section>	
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
	
	<!-- popup -->
        <%@ include file="/WEB-INF/jsp/common/layer/ly_jijum.jsp"%>
       <%@ include file="/WEB-INF/jsp/academy/cmmn/jsp/post_pop.jsp"%>
       <!-- //popup -->
	
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->