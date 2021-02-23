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

    $("#userId").keyup(function() {
        $('#idCheckYn').val("N");
    });
    
	$("#type_m_id").hide();
    $('#moblphon1').attr('disabled', true);
    $('#moblphon2').attr('readonly', true);
    $('#moblphon3').attr('readonly', true);
    
    
    $('#email3').change(function(e){
    	$('#email2').val($(this).val());
    });
    
    $('#userEmail3').change(function(e){
    	$('#userEmail2').val($(this).val());
    });

    //가입인증 체크
    $('input[name="confirmBtn"]').click(function(){
        //이메일 인증
        if($(this).val() == 'M'){
        	$("#type_m_id").show();
        	$("#type_s_id").hide();
            $('.type_m').css('display', 'block');
            $('.type_s').css('display', 'none');

            $('#userEmail1').attr('readonly', true);
            $('#userEmail2').attr('readonly', true);
            $('#userEmail3').attr('disabled', true);

            $('#moblphon1').attr('disabled', false);
            $('#moblphon2').attr('readonly', false);
            $('#moblphon3').attr('readonly', false);
            
        }
        
        //휴대폰 인증
        if($(this).val() == 'S'){
        	$("#type_s_id").show();
        	$("#type_m_id").hide();
            $('.type_s').css('display', 'block');
            $('.type_m').css('display', 'none');

            $('#moblphon1').attr('disabled', true);
            $('#moblphon2').attr('readonly', true);
            $('#moblphon3').attr('readonly', true);

            $('#userEmail1').attr('readonly', false);
            $('#userEmail2').attr('readonly', false);
            $('#userEmail3').attr('disabled', false);
            
        }
    });
    
    
	  
	
	$('#allAgree').click(function(){

		if($(this).prop("checked")){
            $("#protectAgree").prop("checked",true);
            $("#termAgree").prop("checked",true);
            //클릭이 안되있으면
        }else{
        	 $("#protectAgree").prop("checked",false);
             $("#termAgree").prop("checked",false);
        }
		
	});
});

// 대출이용자 팝업
function pop(){

	var check = $("#mtGradeCode option:selected").text();

	if(new String(check) == "대출이용자"){
		$("#join_pop").css('display','block');
	}else {
		$("#join_pop").css('display','none');
	}
}
// 팝업 닫기
function layerPop(){
	$("#join_pop").css('display','none');
}


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


//회원가입
function fnSave() {
    var tUserId = $('#userId').val();
    var tUserName = $('#userName').val();
    tUserId = tUserId.replace(/ /gi, '');
    tUserName = tUserName.replace(/ /gi, '');
	var date = new Date();
	
	//14세 미만 체크
	if(date.getFullYear()-$('#brthdyYear').val() < 14){
		if($('#authAgeCheckYn').val() == 'N'){
			alert('14세미만 인증을 실행해주세요.');
			$(".ageN").focus();
			return false;
		}
	}
    //아이디 중복확인 체크
    if($('#multipleReg').val() == 'Y'){
        alert('회원가입 중입니다 잠시만 기다려주세요.');
        return false;
    }

    if($('#authCheckYn').val() =='N') {
    	if($('input[name=confirmBtn]:radio:checked').val() == 'S'){
    		alert('휴대폰 인증을 해 주세요.');
    		$('#confirmMobile2').focus();
    		
    	}else{
    		alert('이메일 인증을 해 주세요.');
    		$('#email1').focus();
    	}
        return false;
    }
    
    if(tUserId.length <4 || tUserId.length > 16) {
        alert('아이디는 4자~16자 입력 가능합니다.');
        $('#idCheckYn').val("N");
        $("#userId").focus();
        return false;
    }else {
        $('#userId').val(tUserId);
    }
    
    //아이디 중복확인 체크
    if($('#idCheckYn').val() == 'N'){
        alert('아이디 중복체크를 해 주세요');
        $("#userId").focus();
        return false;
    }
    
    var tempPwd = $('#userPassword').val();
    var tempPwdChk = $('#userPassword2').val();

    if(tUserId.replace(/ /gi, '') == tempPwd ) {
        alert('아이디와 비밀번호는 동일한 값으로 입력할 수 없습니다.');
        $('#newUnityPassword').focus();
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
      $('#newUnityPassword').focus();
      return false;
    }

    //연속된 값 체크
    if(!chkXXX(tempPwd)){
        alert('비밀번호는 같은문자를 연속으로 입력할 수 없습니다.');
        return false;
    }

    if(!countChkInt(tempPwd)){
        alert('비밀번호는 연속된 숫자로 입력할 수 없습니다.');
        return false;
    }

    //비밀번호 내 특수문자 체크
    if(!sCharChk(tempPwd)){
        alert('비밀번호는 특수문자가 1자 이상 기입되어야 합니다.');
        $('#newUnityPassword').focus();
        return false;
    }

    if(tempPwd.indexOf(' ') > -1) {
        alert('비밀번호는 공백 사용 불가능 합니다.');
        $('#newUnityPassword').focus();
        return false;
    }

    if(tempPwd.indexOf('&') > -1) {
        alert('비밀번호에 &은 사용 불가능 합니다.');
        $('#newUnityPassword').focus();
        return false;
    }

    //비밀번호 자리수 및 영.숫자 조합 체크
    if(tempPwd.length <9 || tempPwd.length > 14){
        alert('비밀번호는 9자 ~ 14자 입력 가능합니다.');
        return false;
    }

    if(tempPwd != tempPwdChk){
        alert('비밀번호와 비밀번호 확인이 다릅니다.');
        return false;
    } 
    

    if('' == tUserName) {
        alert('이름을 입력해 주세요.');
        $('#userName').focus();
        return false;
    }else {
        $('#userName').val(tUserName);
    }

    if('' == $("#brthdyYear").val()) {
    	alert("생년월일(년도)을 선택해 주세요.");
    	$("#brthdyYear").focus();
    	return;
    }
    if('' == $("#brthdyMonth").val()) {
    	alert('생년월일(월)을 선택해 주세요.');
    	$("#brthdyMonth").focus();
    	return;
    }
    if('' == $("#brthdyDay").val()) {
    	alert("생년월일(일)을 선택해 주세요.");
    	$("#brthdyDay").focus();
    	return;
    }
    if('' == $("#sex").val()) {
    	alert('성별을 선택해 주세요.');
    	$("#sex").focus();
    	return;
    }
    if($('#moblphon1').val() == '' || $('#moblphon2').val() == '' || $('#moblphon3').val() == ''){
        alert('휴대폰 번호를 입력해 주세요.');
        $('#moblphon2').focus()
        return false;
    }

    if($(':radio[name="confirmBtn"]:checked').val() == 'M'){ 
	    if($('#userEmail1').val() == '' || $('#userEmail2').val() == '' ){
	        alert('이메일을 입력해 주세요.');
	        $("#userEmail1").focus();
	        return false;
	    }
    } 
    
    if($('#lnmZip').val() == ''){
        alert('우편번호를 입력해 주세요.');
        $("#lnmZip").focus();
        return false;
    }
    
    if($('#lnmAdres1').val() == ''){
        alert('주소를 입력해 주세요.');
        $("#lnmAdres1").focus();
        return false;
    }
	
    if($('#mtGradeCode').valueEmpty('회원구분을 선택해 주세요.')) return false; 
    
    //이메일 합치기
    if($('#userEmail1').val() !='' || $('#userEmail2').val() !='' ){
        $('#email').val($('#userEmail1').val() +'@'+$('#userEmail2').val() );
    } 

    //전화번호 합치기
    $('#moblphon').val($('#moblphon1').val() +'-'+$("#moblphon2").val() +'-'+$('#moblphon3').val() );
    
  	//생년월일 합치기
  	$('#brthdy').val($('#brthdyYear').val()+$('#brthdyMonth').val()+$('#brthdyDay').val());
    

    
   	/* if($("#mtOfficeCode").val() == '') {
    	alert("지점을 선택해 주세요.");
    	$('#mtOfficeBtn').focus();
		return false;
   	} */
    
    
    
    //이용약관 동의
	if($('#termAgree:checkbox:checked').length == 0){
		alert('회원이용악관에 동의해야 가입 가능합니다.');
		$('#termAgree').focus();
		return;	
	}
  
  
	 

	//개인정보취급방침에 동의
	if($('#protectAgree:checkbox:checked').length == 0){
		alert('개인정보보호정책에 동의해야 가입 가능합니다.');
		$('#protectAgree').focus();
		return;	
	}
    
    if(confirm('회원가입 하시겠습니까?')){
        $('#multipleReg').val('Y');
 
        var userPassword = fn_encrypt(encodeURIComponent($('#userPassword').val()));
        var userPassword2 = fn_encrypt(encodeURIComponent($('#userPassword2').val()));
        
        $('#frm').attr('target', '');
        $('#frm').attr('action', '/academy/user/memberJoinExec.do');
        
        var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
        var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
        submitEncryptedForm(userPassword, userPassword2, rsaPublicKeyModulus, rsaPublicKeyExponent);
    	//return; 
       // $('#frm').submit();
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
    frm.userPassword.value = userPassword;
    //frm.userPassword2.value = userPassword2;
    frm.securedPassword.value = userPassword;
    frm.submit();
}

//기관 검색팝업
function fnCompanyPop(){
	var form = document.frm;
	var orgName = $("#orgName").val();
	//window.open.opener.test(orgName);
    window.open("/academy/user/memberCompanyJoin.do","companyPop","width=750,height=600, scrollbars=YES");
    form.action = "/academy/user/memberCompanyJoin.do";
    form.target = "companyPop" ;
    form.method = "post";
    form.submit();
}


//아이디 중복확인
function searchId(){
    var tUserId = $.trim($('#userId').val());
    var regId = /^[a-z0-9]*$/;
    if(tUserId =='' ) {
        alert('아이디를 입력해 주세요.');
        $('#userId').focus();
    } else if(!regId.test(tUserId)){
		alert('영문 소문자나 숫자만 입력하세요.');
		$('#userId').focus();
    } else {
        ajaxSubmit('/academy/user/member/searchId.do',
                {  userId : tUserId
                }, 'json',
                eval('resultSearchId')
        );
    }
}

//아이디 중복확인 콜백
function resultSearchId(data){
    if(data == 1) {
        $('#idChkResult').removeClass();
        $('#idChkResult').css("color", "#d10a0a");
        $('#idChkResult').html(' 이미 등록된 아이디입니다.');

        $('#idCheckYn').val('N');

    }else if(data == 0) {
        $('#idChkResult').removeClass();
        $('#idChkResult').css("color", "#2257a3");
        $('#idChkResult').html(' 사용가능한 아이디입니다.');
        $('#idCheckYn').val('Y');
    }
}

//이메일 인증발송
function searchEmail(){
	
	if($('#email1').valueEmpty('이메일을 입력하세요.')) return false;
	if($('#email2').valueEmpty('이메일을 입력하세요.')) return false;
	
    ajaxSubmit('/academy/user/member/authEmailCheckJoin.do', {  email : $('#email1').val() + '@'+$('#email2').val() }, 'json', eval('resultSearchEmail'));
}

//이메일 중복확인 콜백
function resultSearchEmail(data){
	
	if(data.result == 'Y') {
        alert('인증메일을 발송되었습니다.');
        $('#emailCheckYn').val(data.result);
        //$('#emailAuthCode').val(data.authCode);
        //$('#confirmCode').val(data.authCode);
       // alert(data);
    }
    //중복일경우 메시지 발송 문구 출력
    else if(data.result == 'DUP') {
        alert(' 이미 등록된 이메일 입니다.');
        $('#emailCheckYn').val("N");
        
    }else if(data.result == 'FAIL') {
        alert('이메일 인증중에 오류가 발생하였습니다.');
        $('#emailCheckYn').val("N");
    
    }
}

//14세미만 보호자 휴대폰 인증발송
function authAgeSmsCheck(){
	if($('#userAgeName').valueEmpty('보호자 이름을 입력하세요.')) return false;
	if($('#confirmAgeMobile2').valueEmpty('보호자 휴대폰번호를 입력하세요.')) return false;
	if($('#confirmAgeMobile3').valueEmpty('보호자 휴대폰번호를 입력하세요.')) return false;
	
    var AgeMobile = $('#confirmAgeMobile1').val()+'-'+$('#confirmAgeMobile2').val()+'-' +$('#confirmAgeMobile3').val();
    ajaxSubmit('/academy/user/member/authAgeSmsCheckJoin.do',{AgeMobile : AgeMobile}, 'json', eval('authAgeSmsCheckCallBack'));
}

//14세미만 보호자 휴대폰 인증발송 AJAX
function authAgeSmsCheckCallBack(data){
    //중복일경우 메시지 출력
    if(data.result == 'Y') {
        alert('인증번호가 발송되었습니다.');
        //$('#smsAgeAuthCode').val(data.authCode);
        
       // alert(data);
    }
    //중복일경우 메시지 발송 문구 출력
    else if(data.result == 'DUP') {
        alert(' 이미 등록된 휴대폰 번호 입니다.');
        $('#smsAgeAuthCode').val("N");
        
    
    }else if(data.result == 'FAIL') {
        alert('휴대폰 인증중에 오류가 발생하였습니다.');
        $('#smsAgeAuthCode').val("N");
    
    }
}

//휴대폰 인증발송
function authSmsCheck(){
	if($('#confirmMobile2').valueEmpty('휴대폰번호를 입력하세요.')) return false;
	if($('#confirmMobile3').valueEmpty('휴대폰번호를 입력하세요.')) return false;
	
    var mobile = $('#confirmMobile1').val()+'-'+$('#confirmMobile2').val()+'-' +$('#confirmMobile3').val();
    ajaxSubmit('/academy/user/member/authSmsCheckJoin.do',{mobile : mobile}, 'json', eval('authSmsCheckCallBack'));
}

//휴대폰 인증발송 AJAX
function authSmsCheckCallBack(data){
    //중복일경우 메시지 출력
    if(data.result == 'Y') {
        alert('인증번호가 발송되었습니다.');
        //$('#smsAuthCode').val(data.authCode);
        
       // alert(data);
    }
    //중복일경우 메시지 발송 문구 출력
    else if(data.result == 'DUP') {
        alert(' 이미 등록된 휴대폰 번호 입니다.');
        $('#smsAuthCode').val("N");
        
    
    }else if(data.result == 'FAIL') {
        alert('휴대폰 인증중에 오류가 발생하였습니다.');
        $('#smsAuthCode').val("N");
    
    }
}

//보호자 인증 실행
function ageAuthStart(){
	$('#ageConfirmCode').val(); // 사용자가 입력한 인증코드
	$('#smsAgeAuthCode').val(); // SMS로 발송된 인증코드
	
	if($('#authAgeCheckYn').val() == 'Y'){
    	alert('이미 인증이 완료되었습니다.');
    	return false;
	}
	 ajaxSubmit('/academy/user/member/searchAgePwdmatch.do',
             {  confirmCode : $('#confirmCode').val()
             }, 'json',
             eval('resultAgeCodeMatch')
     );
}

function resultAgeCodeMatch(data){
	if(data==0){
		alert("인증성공");
		$('#authAgeCheckYn').val('Y');
	}else if(data==1){
		alert("인증실패");
		$('#authAgeCheckYn').val('N');
	}else{
		alert("인증실패2");
		$('#authAgeCheckYn').val('N');
	}
   
	/* //인증번호 틀림
    if($('#ageConfirmCode').val() != $('#smsAgeAuthCode').val()){

        //인증번호 틀림 메시지출력
        alert('잘못된 인증번호 입니다.');
        $('#authAgeCheckYn').val('N');
    }

    //인증 성공
    if(($('#ageConfirmCode').val() != '' && $('#smsAgeAuthCode').val() != '') && ($('#ageConfirmCode').val() == $('#smsAgeAuthCode').val())){
        alert('인증 되었습니다.');

        //하단 휴대폰번호 자동 세팅
        $('#authAgeCheckYn').val('Y');
   } */
}

//인증 실행
function authStart(){

	$('#confirmCode').val(); // 사용자가 입력한 인증코드
	$('#smsAuthCode').val(); // SMS로 발송된 인증코드
	$('#emailAuthCode').val(); // SMS로 발송된 인증코드

    //이메일 인증
    if($('input[name="confirmBtn"]:radio:checked').val() == 'M') {

        if($("#confirmCode").val() != $("#emailAuthCode").val()){

            //인증번호 틀림 메시지출력
            alert('잘못된 인증번호 입니다.');
            $('#authCheckYn').val('N');
        }

        //인증 성공
        if(($('#confirmCode').val() != '' && $('#emailAuthCode').val() != '') && ($('#confirmCode').val() == $('#emailAuthCode').val())){
            alert('인증 되었습니다.');
            $('#userEmail1').val($('#email1').val());
            $('#userEmail2').val($('#email2').val());
            $('#authMode').val('M');
            $('#authCheckYn').val('Y');
        }

    } //휴대폰 인증
    else{
    	
    	if($('#authCheckYn').val() == 'Y'){
	    	alert('이미 인증이 완료되었습니다.');
    	}
    	
        //인증번호 틀림
        if($('#confirmCode').val() != $('#smsAuthCode').val()){

            //인증번호 틀림 메시지출력
            alert('잘못된 인증번호 입니다.');
            $('#authCheckYn').val('N');
        }

        //인증 성공
        if(($('#confirmCode').val() != '' && $('#smsAuthCode').val() != '') && ($('#confirmCode').val() == $('#smsAuthCode').val())){
            alert('인증 되었습니다.');

            //하단 휴대폰번호 자동 세팅
            $('#moblphon1').val($('#confirmMobile1').val());
            $('#moblphon2').val($('#confirmMobile2').val());
            $('#moblphon3').val($('#confirmMobile3').val());
            $("#authMode").val("S");
            $('#authCheckYn').val('Y');
        }
    }
}

//우편번호찾기
function zipSearch(){
    window.open("/academy/user/postEtc.do","post_pop", "width=600,height=450, scrollbars=YES");
}
//우편번호 콜백 스크립트
function fnZipCodePopupCallBack(data){
     $('#lnmZip').val(data.zip_code);
     $('#lnmAdres1').val(data.adres);
   //  $('#lnmAdres2').focus();
}

//지점 검색팝업
function mtOfficePop(){
	var form = document.pform;
    window.open("/academy/user/officeSearchList.do","companyPop","width=750,height=600, scrollbars=YES");
    form.action = "/academy/user/officeSearchList.do";
    form.target = "companyPop" ;
    form.method = "post";
    form.submit();
}

//지점 결과 콜백
function selectJijumDatas(data){
	$("#mtOfficeArea").text(data.name);
	$("#mtOfficeCode").val(data.code);
}
function  fnZipSelect(zipNo,roadAddr) {
	$("#lnmZip").val(zipNo);
	$("#lnmAdres1").val(roadAddr);
	$('.close').trigger('click'); //layer closed.
}
//이메일 셀렉트박스 세팅
function emailSelect(val){
    $('#email2').val(val);
}
function userEmailSelect(val){
    $('#userEmail2').val(val);
}

//숫자만입력 
function inputOnlyNumber(obj){
	if(event.keyCode >= 48 && event.keyCode <=57){
		return true;
	} else {
		event.returnValue = false;
	}
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

/*탭 클릭시 변경*/
$(document).ready(function(){
    var tablink = $(".age_tap > button");
    $(tablink).click(function(){
        $(tablink).removeClass("btn_tabmenu");
        $(this).addClass("btn_tabmenu");
        $('#ageYn').css('display','block');
    });
    $('.ageN').click(function(){
        $('.ageYn').css('display','table-row');
    });
    $('.ageY').click(function(){
        $('.ageYn').css('display','none');
    });
});


//인증 실행
function authStart3(){
	if($('#authCheckYn').val() == 'Y'){
    	alert('이미 인증이 완료되었습니다.');
    	return false;
	}
	 ajaxSubmit('/academy/user/member/searchPwdmatch.do',
             {  confirmCode : $('#confirmCode').val()
             }, 'json',
             eval('resultCodeMatch')
     );
	
}
function resultCodeMatch(data){
	if($('input[name="confirmBtn"]:radio:checked').val() == 'M') {
		if(data==0){
			alert("인증성공");
			$('#userEmail1').val($('#email1').val());
            $('#userEmail2').val($('#email2').val());
			$("#authMode").val("M");
	        $('#authCheckYn').val('Y');
		}else if(data==1){
			alert("인증실패");
			$("#authMode").val("M");
	        $('#authCheckYn').val('N');
		}else{
			alert("인증실패2");
			$("#authMode").val("M");
	        $('#authCheckYn').val('N');
		}
	}else{
		if(data==0){
			alert("인증성공");
			$('#moblphon1').val($('#confirmMobile1').val());
            $('#moblphon2').val($('#confirmMobile2').val());
            $('#moblphon3').val($('#confirmMobile3').val());
			$("#authMode").val("S");
	        $('#authCheckYn').val('Y');
		}else if(data==1){
			alert("인증실패");
			$("#authMode").val("S");
	        $('#authCheckYn').val('N');
		}else{
			alert("인증실패2");
			$("#authMode").val("S");
	        $('#authCheckYn').val('N');
		}
	}
}
</script>




<!-- content -->
   <div class="container" id="Subcontent">
       <article class="subArea">
           <div class="subCntWrap">
               <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_etc.jsp"%>
               <div class="path">
                   <ul>
                       <li><span class="home text-hide">홈</span></li>
                       <li>회원서비스</li>
                       <li class="active">회원가입</li>
                   </ul>
               </div>
               <div class="subConts" id="sub-content">
                   <section class="bgTop_cate07"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			 <h2 class="h2_tit">회원가입</h2>
	            		</div>           	
	          	  </section>



                   <section>
                       <div class="infoBox">
                           <div class="infoBody">
                               <ul class="li_dash">
                                   <li>회원가입을 위해 이름과 휴대폰번호 또는 이메일 주소를 정확히 입력해 주시기 바랍니다.</li>
                                   <li>입력하신 소중한 개인정보는 회원님의 명백한 동의 없이는 공개되거나 제3자에게 제공되지 않습니다.</li>
                                   <li>본인의 정보를 입력하시면 인증번호가 발송됩니다.</li>
                               </ul>
                           </div>
                       </div>
                   </section>

                   <hr>

                   <section class="tableBox">
                       <p class="rbltopTxt"><strong class="po_C2">* 모든 항목을 필수적으로 입력하셔야 합니다.</strong></p>
                       <!--연령별 탭 추가-->
                        <section>
                          <div class="age_tap">
                            <button type="button" class="ageN" title="14세 미만">14세 미만</button>
                            <button type="button" class="ageY btn_tabmenu" title="14세 이상">14세 이상</button>
                          </div>
                        </section>
                        <!--연령별 탭 추가-->
                       <form name="frm" id="frm" action="" method="post">
						    <input type="hidden" name="BIZNO" id="BIZNO" value="<c:out value="${REQUEST_DATA.BIZNO}" />" /><!-- 사업자등록번호 -->
						    <input type="hidden" name="COMNO" id="COMNO" value="<c:out value="${REQUEST_DATA.COMNO}" />" /><!-- 사업자일련번호 -->
						    <input type="hidden" name="email" id="email" value="" /><!-- 이메일 -->
						    <input type="hidden" name="moblphon" id="moblphon" value="" /><!-- 휴대폰번호 -->
						    <input type="hidden" name="brthdy" id="brthdy" value="" /><!-- 생년월일 -->
						    <input type="hidden" name="telNo" id="telNo" value="" /><!-- 회사연락처 -->
						    <input type="hidden" name="idCheckYn" id="idCheckYn" value="N" /><!-- 아이디 중복체크YN -->
						    <input type="hidden" name="empSeq" id="multipleReg" value="X" /><!-- 중복회원가입 방지여부 Y:방지실행 N:방지실행X -->
						    <input type="hidden" name="smsAuthCode" id="smsAuthCode" value="" /><!-- sms 인증코드 -->
						    <input type="hidden" name="emailAuthCode" id="emailAuthCode" value="" /><!-- email 인증코드 -->
						    <input type="hidden" name="authCheckYn" id="authCheckYn" value="N" /><!-- 인증여부 -->
						    <input type="hidden" name="authMode" id="authMode" value="M" /><!-- 인증여부 -->
						    <input type="hidden" name="comNo" id="comNo" value="" /><!-- 사업자명 CODE번호 -->
						    <input type="hidden" name="orgCode" id="orgCode" value="" /><!-- 기관/단체명 CODE번호 -->
							<input type="hidden" name="securedUserId" id="securedUserId" value="" />
					        <input type="hidden" name="securedPassword" id="securedPassword" value="" />
					        <input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" />
					        <input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" />
					        <input type="hidden" name="confirmAgeMobile" id="confirmAgeMobile" value="" /><!-- 보호자휴대폰번호 -->
					        <input type="hidden" name="smsAgeAuthCode" id="smsAgeAuthCode" value="" /><!-- 보호자 sms 인증코드 -->
					        <input type="hidden" name="authAgeCheckYn" id="authAgeCheckYn" value="N" /><!-- 인증여부 -->
                           <fieldset>
                               <legend>회원가입양식입력</legend>
                               <div class="tblWrap">
                                   <table class="writeForm">
                                       <caption>회원가입양식입력(가입인증,인증번호 발송,인증번호,아이디 등 입력)</caption>
                                       <colgroup>
                                           <col style="width:25%">
                                           <col style="width:*">
                                       </colgroup>
                                       <tbody>
                                       	   <tr class="ageYn" style="display:none;">
                                               <th scope="row"><label for="userAgeName">보호자 이름</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
                                                           <input title="보호자 이름" type="text" class="form-control" id="userAgeName" name="userAgeName">
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                       	   <tr class="ageYn" style="display:none;">
                                               <th scope="row"> <label for="confirmAgeMobile1">보호자 인증번호 발송</label></th>
                                               <td>
                                                   <div class="form-inline phoneNum">
                                                       <div class="form-group w20">
                                                           <select class="form-control" name="confirmAgeMobile1" id="confirmAgeMobile1" title="휴대폰번호 첫째자리">
                                                                <option value="010">010</option>
						                                        <option value="011">011</option>
						                                        <option value="016">016</option>
						                                        <option value="017">017</option>
						                                        <option value="018">018</option>
						                                        <option value="019">019</option>
                                                           </select>
                                                       </div>
                                                       <div class="form-group w20">
                                                           <input type="text" class="form-control i-numOnly" id="confirmAgeMobile2" name="confirmMobile2" title="휴대폰번호 둘째자리" maxlength="4">
                                                       </div>
                                                       <div class="form-group w20">
                                                           <input type="text" class="form-control i-numOnly" id="confirmAgeMobile3" name="confirmMobile3" title="휴대폰번호 셋째자리" maxlength="4">
                                                       </div>
                                                       <button type="button" onclick="authAgeSmsCheck();return false" class="btn btn-orange btn-sm" title="인증번호 발송">인증번호 발송</button>
                                                       <!-- <p id="smsChkResult" class="smsChkResult"></p> --> <!--  -->
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr class="ageYn" style="display:none;">
                                               <th scope="row"><label for="ageConfirmCode">보호자 인증번호</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
                                                           <input title="보호자 인증번호" type="text" class="form-control i-numOnly" id="ageConfirmCode" name="ageConfirmCode" >
                                                       </div>
                                                       <button type="button" onclick="ageAuthStart(); return false;"  class="btn btn-drkblue btn-sm" title="확인">확인</button>
                                                   </div>
                                               </td>
                                           </tr>	
                                           <tr>
                                               <th scope="col">가입인증</th>
                                               <td>
                                                   <label title="휴대폰 인증" class="radio-inline">
                                                       <input type="radio" id="confirm02" name="confirmBtn" value="S" checked="checked" title="휴대폰 인증"> 
                                                       	휴대폰 인증                                                 		
                                                   </label>
                                                   <label title="이메일 인증" class="radio-inline">
                                                       <input type="radio" id="confirm01" name="confirmBtn" value="M" title="이메일 인증">
                                                      	 이메일 인증
                                                   </label>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"> <label for="confirmMobile1">인증번호 발송</label></th>
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
                                                           <input type="text" class="form-control i-numOnly" id="confirmMobile2" name="confirmMobile2" title="휴대폰번호 둘째자리" maxlength="4">
                                                       </div>
                                                       <div class="form-group w20">
                                                           <input type="text" class="form-control i-numOnly" id="confirmMobile3" name="confirmMobile3" title="휴대폰번호 셋째자리" maxlength="4">
                                                       </div>
                                                       <button type="button" onclick="authSmsCheck();return false" class="btn btn-orange btn-sm" title="인증번호 발송">인증번호 발송</button>
                                                       <!-- <p id="smsChkResult" class="smsChkResult"></p> --> <!--  -->
                                                       
                                                   </div>
                                                   <p class="po_C2 mrg_t5 fnt13">※ 휴대폰 번호는 가입 회원을 식별과 비밀번호 찾기 용도로 사용됩니다.</p>
                                               </td>
                                               
                                               <td  id="type_m_id">
                                               		<div class="form-inline emailcfm">
                                                        <div class="form-group w20">
                                                            <input type="text" class="form-control"  id="email1" name="email1" title="이메일 아이디">
                                                        </div>
                                                        @&nbsp;
                                                        <div class="form-group w20">
                                                            <input type="text" class="form-control" id="email2" name="email2" title="이메일 뒷주소 입력">
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
	                                                       <!-- <p class="txt_red indent" id="emailChkResult"></p> -->
	                                                 </div>
	                                                   <p class="po_C2 mrg_t5 fnt13">※이메일 주소는 가입 회원을 식별하는 용도로 사용되며 향후 비밀번호 찾기에 임시 비밀번호가 발송됩니다..</p>
                                                   
                                               </td>
                                           </tr>
                                           
                                           
                                           <tr>
                                               <th scope="row"><label for="confirmCode">인증번호</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
                                                           <input type="text" class="form-control i-numOnly" id="confirmCode" name="confirmCode" >
                                                       </div>
                                                       <button type="button" onclick="authStart3(); return false;"  class="btn btn-drkblue btn-sm" title="확인">확인</button>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="userId">아이디</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
                                                           <input type="text" class="form-control" id="userId" name="userId">
                                                       </div>
                                                       <button type="button" class="btn btn-gray btn-sm" onclick="searchId();return false;" title="중복확인">중복확인</button>
                                                       <span id="idChkResult"></span>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="userPassword">비밀번호</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
                                                           <input type="password" autocomplete="off" class="form-control"  id="userPassword" name="userPassword" onchange="check();">
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
                                                           <input type="password" autocomplete="off" class="form-control" id="userPassword2" name="userPassword2" onchange="check2();">
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="userName">이름</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
                                                           <input type="text" class="form-control" id="userName" name="userName">
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="sex">성별</label></th>
                                               <td>
                                                   <div class="form-inline phoneNum">
                                                       <div class="form-group w30">
                                                           <select name="sex" class="form-control" id="sex">
                                                               <option value="">선택</option>
															   <option value="M">남자</option>
															   <option value="F">여자</option>
                                                           </select>
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="brthdyYear">생년월일</label></th>
                                               <td>
                                                   <div class="form-inline phoneNum">
                                                       <div class="form-group w20">
                                                           <select name="brthdyYear" id="brthdyYear" class="form-control" title="생년">
                                                               <option value="">년도</option>
                                                               <fmt:formatDate value="${now}" pattern="yyyy" var="yearStart"/>
														       <c:forEach begin="0" end="100" var="result" step="1">
														       	   <option value="<c:out value="${yearStart - result}" />" <c:if test="${(yearStart - result) == searchVO.bsnsYear}"> selected="selected"</c:if>><c:out value="${yearStart - result}" /></option>
														       </c:forEach>
                                                           </select> 
                                                       </div>
                                                       <div class="form-group w20">
                                                           <select name="brthdyMonth" id="brthdyMonth" class="form-control" title="생월">
                                                               <option value="">월</option>
                                                               <c:forEach var="min" begin="1" end="12" step="1">
                                                               		<c:set var="month" value="${min}" />
                                                               		<c:if test="${min < 10}">
                                                               			<c:set var="month" value="0${month}" />
                                                               		</c:if>
																   <option value="<c:out value='${month}' />"><c:out value="${month}" /></option>
															   </c:forEach>
                                                           </select>
                                                       </div>
                                                       <div class="form-group w20">
                                                           <select name="brthdyDay" id="brthdyDay" class="form-control" title="생일">
                                                               <option value="">일</option>
                                                               <c:forEach var="min" begin="1" end="31" step="1">
																   <c:set var="day" value="${min}" />
                                                               		<c:if test="${min < 10}">
                                                               			<c:set var="day" value="0${day}" />
                                                               		</c:if>
																   <option value="<c:out value='${day}' />"><c:out value="${day}" /></option>
															   </c:forEach>
                                                           </select>
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="moblphon1">휴대폰번호</label></th>
                                               <td>
                                                   <div class="form-inline phoneNum">
                                                       <div class="form-group w20">
                                                           <select class="form-control" name="moblphon1" id="moblphon1" onchange="javascript:emailSelect('ID',this.value);return false;" title="휴대폰번호 첫째자리">
                                                                <option value="010">010</option>
						                                        <option value="011">011</option>
						                                        <option value="016">016</option>
						                                        <option value="017">017</option>
						                                        <option value="018">018</option>
						                                        <option value="019">019</option>
						                                    </select>
                                                       </div>
                                                       <div class="form-group w20">
                                                           <input type="text" class="form-control i-onlyNum" id="moblphon2" name="moblphon2" title="휴대폰번호 둘째자리">
                                                       </div>
                                                       <div class="form-group w20">
                                                           <input type="text" class="form-control i-onlyNum" id="moblphon3" name="moblphon3" title="휴대폰번호 셋째자리">
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row" id="member_email"><label for="member_email">이메일주소</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
                                                           <input type="text" class="form-control" id="userEmail1" name="userEmail1" title="이메일 아이디">
                                                       </div>
                                                       @
                                                       <div class="form-group w30">
                                                           <input type="text" class="form-control" id="userEmail2" name="userEmail2" title="이메일 뒷주소 입력">
                                                       </div>
                                                       <div class="form-group w20">
                                                           <select  class="form-control-static" title="이메일주소 입력방식 선택" id="userEmail3" name="userEmail3" >
                                                               <option value="">직접입력</option>
                                                               <c:forEach var="emap2" items="${categoryData}" varStatus="status2">
														        	<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
														       </c:forEach>
                                                           </select>
                                                       </div>
                                                   </div>
                                               </td> 
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="lnmZip">주소</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w20">
                                                           <input type="text"  class="form-control" id="lnmZip" name="lnmZip" title="우편번호" readonly="readonly">
                                                       </div>
                                                       <button type="button" name="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#post" title="우편번호찾기">우편번호찾기</button>
                                                       <!-- <button type="button" name="button" onclick="zipSearch(); return false;" class="btn btn-sm btn-default">우편번호찾기</button> -->
                                                   </div>
                                                   <div class="form-inline address">
                                                       <div class="form-group">
                                                           <input type="text" class="form-control"  id="lnmAdres1" name="lnmAdres1" title="주소" readonly="readonly">

                                                           <input type="text" class="form-control" id="lnmAdres2" name="lnmAdres2" title="상세주소">
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="mtGradeCode">회원구분</label></th>
                                               <td>
                                                   <div class="form-inline phoneNum">
                                                       <div class="form-group w30">
                                                           <select title="회원구분" name="mtGradeCode" id="mtGradeCode" class="form-control" onchange="pop();">
                                                               <option value="">선택</option>
                                                               <c:forEach items="${jobKndCodeList}" var="item">
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
                                               		
                                               		<span id="mtOfficeArea"></span>
                                                   <button type="button" class="btn btn-blue2 btn-sm" id="mtOfficeBtn" data-toggle="modal" data-target="#jijum" title="지점찾기">지점찾기</button>
                                                   <!-- <a href="#" onclick="mtOfficePop();return false;" class= "btn-submit small"/>지점찾기</a> -->
                                                   <input type="hidden" name="mtOfficeCode" id="mtOfficeCode" value=""/>
                                                   <p class="po_C2 mrg_t5 fnt13">※ 대출이용자 외에는 해당없음 으로 체크 하시기 바랍니다.</p>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="col">이메일 수신여부</th>
                                               <td>
                                                   <label title="예" class="radio-inline">
                                                       <input type="radio" name="emailCheckYn" id="emailCheckY" value="Y" checked="checked">
                                                      		 예
                                                   </label>
                                                   <label title="아니오" class="radio-inline">
                                                       <input type="radio" name="emailCheckYn" id="emailCheckN" value="N" >
                                                      	 아니오
                                                   </label>
                                               </td>
                                           </tr>
                                       </tbody>
                                   </table>
                               </div>

                           </fieldset>
                       </form>
                   </section>

                   <hr>

                   <section >
                       <form>
                           <fieldset>
                               <legend>회원이용약관및개인보호정책</legend>
                               <h3 class="sub_tit">회원이용약관</h3>
                               <div class="borBox">
                                   <div class="terms" tabindex="0">
                                       <p> 회원가입 하시기 전에 이용약관을 반드시 읽어주시기 바랍니다. 서비스 약관은 통지 없이 수시로 갱신될 수 있사오니, 회원 여러분께서는 방문 시 수시로 그 내용을 확인해 보시기 바랍니다. </p> <br/>
                                       <h4 class="fnt15 po_C6">제 1장 총칙</h4>
                                       <h5 class="po_C9 fnt13">제 1 조 (목적)</h5>
                                       <p>
                                           본 약관은 상상스토리(이하 ‘진흥원’이라 합니다)에서 운영하는 ‘교육 서비스’(이하 ‘서비스’라 한다)에 대한 이용 조건 및 절차, 이용자와 진흥원의 권리, 의무 및 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
                                       <hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제2조 (약관의 효력과 변경)</h5>
                                       <p>① 귀하가 본 약관 내용에 동의하는 경우, 진흥원의 서비스 제공 행위 및 이용자의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.</p>
				       <p>② 진흥원은 본 약관의 내용과 주소지, 관리자의 성명, 개인정보보호 담당자의 성명, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 초기 서비스화면에 게시합니다.</p>
				       <p>③ 진흥원은 필요하다고 인정되는 경우 본 약관을 개정할 수 있습니다. 진흥원이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기 서비스화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 적용일에 그 효력이 발생합니다.</p>
				       <p>④ 변경된 약관의 부지(不智)로 인한 회원의 피해는 진흥원에서 책임지지 않습니다.</p>
				       <p>⑤ 이용자는 변경된 약관에 동의하지 않을 경우 회원등록을 취소(회원탈퇴)(해지) 할 수 있으며, 변경된 약관의 효력 발생일로부터 7일 이내에 거부의사를 표시하지 아니하고 서비스를 계속 사용할 경우 변경된 약관에 동의한 것으로 간주합니다.</p>	
				       <hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제3조 (약관 외 준칙)</h5>					
					<p>본 약관에 명시되지 않은 사항은 약관의 규제에 관한법률, 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의하며, 진흥원은 관계법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</p>

					  <hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제4조 (용어의 정의)</h5>
					<p>① 본 약관에서 사용하는 용어의 정의는 아래와 같습니다.</p>
					<p>1. 가입 : 진흥원이 제공하는 신청서 양식에 따라 개인정보를 기입ㆍ제공하고, 본 약관에 동의하여 서비스 이용계약(이하 ‘이용계약’이라 합니다)을 완료시키는 행위를 말합니다.</p>
					<p>2. 회원 : 진흥원에 개인정보를 제공하여 가입함으로써 이용계약을 체결하고 이용자ID를 부여받은 자를 말합니다.</p>
					<p>3. 콘텐츠 : 서민의 금융생활, 자활재기 지원 등을 위하여 진흥원이 제작 또는 타 기관으로부터 임차하여 제공하는 영상, 자료 등 일체의 교육관련 콘텐츠를 말합니다. </p>
					<p>4. 서비스 : 진흥원 교육 홈페이지(http://edu.kinfa.or.kr) (이하 '사이트'라 합니다)를 통해 회원들에게 제공하는 콘텐츠, 회원 간의 서비스 및 관련 부가서비스의 일체를 말합니다.</p>
					<p>5. 이용자 : 본 약관에 따라 진흥원이 제공하는 서비스를 제공받는 자를 말합니다.</p>
					<p>6. 이용자ID : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 진흥원이 부여하는 문자와 숫자의 조합을 말합니다.</p>
					<p>7. 비밀번호 : 서비스를 이용하려는 사람이 이용자ID를 부여받은 자와 동일인임을 확인하고 회원의 개인정보 및 권익 보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.</p>

					<p>8. 회원탈퇴 : 진흥원 또는 회원이 이용계약을 종료시키는 행위를 말합니다.</p>
					<p>② 본 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계법령, 별도약관에서 정의합니다.</p>

									   <hr class="hr_20">	
									   <h4 class="fnt15 po_C6">제2장 회원 가입</h4>
                                       <h5 class="po_C9 fnt13">제5조 (이용계약의 성립)</h5>
                                       <p>
                                           ① 이용계약은 신청자가 온라인으로 사이트에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 회원가입을 신청하고 진흥원이 승낙함으로써 성립합니다. </p>
					<p>1. 회원가입을 통해 서비스를 이용하고자 하는 자는 진흥원에서 요청하는 개인정보를 제공해야 합니다.
</p>
					<p>2. 본 이용약관에 대한 동의는 이용신청 당시 해당 사이트의 '동의함' 을 선택함으로써 의사표시를 합니다.
</p>
					<p>3. 신청자가 본 약관에 따라 서비스 이용을 신청을 하는 것은 진흥원이 제정한 "개인정보보호정책", "저작권정책" 등 각종 정책에 대해 동의한 것으로 간주됩니다. ("개인정보보호정책", "저작권정책"에 관한 자세한 내용은 사이트에서 확인하시기 바랍니다).
</p>
					<p>② 진흥원이 소정의 기준에 의하여 서비스 제공을 승낙(회원가입 완료)하는 때에는 다음과 같은 사항을 회원에게 통지합니다.
</p>
					<p>1. 서비스 이용 개시일
</p>
					<p>2. 기타 서비스에 필요하다고 인정하는 사항
</p>
                                       <hr class="hr_20">
                                       
                                       <h5 class="po_C9 fnt13">제6조 (이용신청)
</h5>
                                       <p>① 서비스를 이용하고자 하는 자는 다음 사항을 진흥원이 온라인으로 제공하는 가입 신청양식에 정확하고 사실과 다름이 없이 기록하여야 합니다.
</p>
					<p>1. 이용자아이디(ID)
</p>
					<p>2. 비밀번호(Password), (비밀번호 확인 포함)
</p>
					<p>3. 성명(실명으로 한글)
</p>
					<p>4. 성별
</p>
					<p>5. 생년월일
</p>
					<p>6. 휴대전화번호
</p>
					<p>7. 이메일 주소
</p>
					<p>8. 주소
</p>
					<p>9. 회원구분
</p>
					<p>10. 지점
</p>
					<p>11. 이메일 서비스 수신여부
</p>
					<p>② 이용신청자가 회원으로 등록하기 위해서는 본 약관의 내용과 본 약관이 이용계약의 일부가 됨에 동의하여야 합니다.
</p>
					
                                       
                                       <h5 class="po_C9 fnt13">제7조 (회원정보 사용에 대한 동의)
</h5>
                                       <p>본 약관은 당 사이트가 제공하는 서비스에 관한 이용규정과 함께 적용됩니다.</p>	
                                   
                                       <p>
                                           ① 진흥원은 관계법령이 정하는 바에 따라 이용자 등록정보를 포함한 회원의 개인정보를 보호하기 위해 노력합니다.
                                       </p>
					<p>
					② 이용자 개인정보는 관계법령 및 진흥원의 개인정보 보호정책에 의해 보호됩니다. 단, 진흥원이 운영하는 웹페이지에 포함된 링크 또는 배너를 클릭하여 다른 사이트로 옮겨갈 경우 진흥원의 개인정보 보호정책이 적용되지 않습니다.
					</p>
					<p>② 이용자 개인정보는 관계법령 및 진흥원의 개인정보 보호정책에 의해 보호됩니다. 단, 진흥원이 운영하는 웹페이지에 포함된 링크 또는 배너를 클릭하여 다른 사이트로 옮겨갈 경우 진흥원의 개인정보 보호정책이 적용되지 않습니다.
					</p>
					<p>1. 개인정보의 수집 : 진흥원은 회원가입 시, 회원이 제공하는 정보를 통하여 회원의 정보를 수집합니다.
					</p>
					<p>2. 개인정보의 사용 : 진흥원은 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 타 진흥원시스템 및 정부시스템과의 사용자 단일 로그인을 위한 경우, 귀하가 진흥원 및 서비스에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
					</p>
					<p>3. 개인정보의 관리 : 회원은 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 회원의 개인정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경/조정할 수 있습니다.
					</p>
					<p>4 개인정보의 보호 : 회원의 개인정보는 오직 회원만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 회원의 이용자ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 회원의 이용자ID와 비밀번호를 알려주어서는 안 되며, 작업 종료 시에는 반드시 로그아웃 하고, 웹 브라우저의 창을 닫아야 합니다.(이는 타인과 컴퓨터를 공유하는 인터넷 카페나 도서관 같은 공공장소에서 컴퓨터를 사용하는 경우에 회원의 정보보호를 위하여 필요한 사항입니다.)
					</p>
					<p>④ 회원이 본 약관에 따라 이용신청을 하는 것은 진흥원이 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.
					</p>
                                       <hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제8조 (회원의 이용자ID 및 비밀번호 등 정보 보안 관리 의무)</h5>
                                       <p>① 가입 신청자가 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 이용자ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다. 진흥원은 회원의 귀책사유로 인해 노출된 정보에 대해서 일체의 책임을 지지 않습니다.
</p>
					<p>② 회원의 이용자ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 진흥원에 신고하여야 합니다. 신고를 하지 않음으로 인해 발생하는 모든 책임은 회원 본인에게 있습니다.
</p>                                   		
					<p>③ 이용자는 진흥원 서비스의 사용 종료 시 마다 정확히 접속을 종료(로그아웃[Log-out])해야 하며, 정확히 종료하지 아니함으로써 제3자가 회원에 관한 정보를 도용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 진흥원은 책임을 부담하지 아니합니다.
</p>                                   
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제9조 (이용신청의 승낙)</h5>
					<p>① 진흥원은 이용신청자가 제6조에서 정한 모든 사항을 정확히 기재하고 본 약관의 내용에 동의하여 이용신청을 하였을 때에는 가입 및 서비스 이용을 승낙하는 것을 원칙으로 합니다. 다만, 진흥원은 다음 각 호에 해당하는 행위에 대하여는 승낙을 하지 않을 수 있으며, 승낙 이후라도 취소할 수 있습니다. 
</p>
					<p>1. 다른 사람의 명의를 사용하여 신청하였을 때
</p>
					<p>2. 이용계약 신청서(회원가입 신청서)의 내용을 허위로 기재하여 신청하였을 때
</p>
					<p>3. 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때
</p>
					<p>4. 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
</p>
					<p>5. 서비스를 이용하여 관계법령과 본 약관이 금지하는 행위를 하는 경우
</p>
					<p>6. 기타 제1호 내지 제5호에 준하는 사항에 해당한다고 진흥원이 인정하는 경우
</p>
					<p>② 진흥원은 서비스 관련 설비의 여유가 없거나 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
</p>
					<p>③ 진흥원이 제1항 각 호 또는 제2항의 사유에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우에는 즉시 이용자(신청자)에게 알립니다. 다만, 진흥원의 귀책사유 없이 이용자에게 알릴 수 없는 경우에는 예외로 합니다.
</p>
					<p>④ 이용신청의 처리는 신청순서에 의합니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제10조 (이용자ID 부여 및 변경 등)</h5>
					<p>① 진흥원은 이용자에 대하여 약관에 정하는 바에 따라 이용자 ID를 부여합니다.
</p>
					<p>② 이용자ID는 원칙적으로 변경이 불가하며 부득이한 사유로 인하여 변경 하고자 하는 경우에는 회원이 부득이한 사유를 소명하여야 합니다.
</p>
					<p>③ 진흥원의 이용자ID는 이용자 본인의 동의하에 진흥원, 서민금융 유관기관, 정부부처 등 기타 타 기관의 정보제공사이트의 이용자ID와 연결될 수 있습니다.
</p>
					<p>④ 진흥원은 다음 각 호에 해당하는 회원가입에 대하여는 가입을 취소할 수 있습니다. 
</p>
					<p>1. 이용자ID가 이용자의 주민등록번호, 전화번호 등으로 등록되어 사생활침해가 우려되는 경우
</p>
					<p>2. 타인에게 혐오감을 주거나 미풍양속에 저해할 목적으로 신청한 경우
</p>
					<p>3. 기타 합리적인 사유가 있는 경우
</p>
					<p>⑤ 서비스 이용자ID 및 비밀번호의 관리책임은 회원에게 있습니다. 이를 소홀히 관리하여 발생하는 서비스 이용 상의 손해 또는 제3자에 의한 부정이용 등에 대한 책임은 회원에게 있으며 진흥원은 그에 대한 책임을 일절 지지 않습니다.
</p>
					<p>⑥ 기타 회원 개인정보 관리 및 변경 등에 관한 사항은 진흥원이 정하는 바에 의합니다.
</p>
					  <hr class="hr_20">	
					  <h4 class="fnt15 po_C6">제3장 서비스의 이용 및 제한</h4>
					<h5 class="po_C9 fnt13">제11조 (서비스 이용)</h5>
					<p>① 서비스 이용은 진흥원의 업무상 또는 기술상 특별한 지장이 없는 한 연중 무휴, 24시간 제공을 원칙으로 합니다.
</p>
					<p>② 제1항의 이용 시간은 정기 점검 등의 필요로 인하여 진흥원이 정한 날 또는 시간은 그러하지 아니합니다.
</p>
					<p>③ 진흥원은 필요할 경우 서비스의 일정 부분별로 회원이 게시한 자료나 회원 필요에 의해 저장하고 있는 자료에 대해 일정한 게재 기간 또는 저장 기간을 정할 수 있으며, 필요에 따라 기간을 변경할 수 있습니다. 단, 자료의 저장 기간에 대해서는 서비스 안내에 게시하거나 또는 별도로 공시하는 내용에 따릅니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제12조 (서비스의 중지 및 중지에 대한 공지)</h5>
					<p>① 국가 비상사태, 진흥원의 관리 범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 서비스에 보관/삭제/전송/손실이 발생한 경우에 진흥원은 관련 책임을 부담하지 아니합니다.
</p>
					<p>② 진흥원은 천재지변, 국가비상사태 등 정상적인 서비스 제공이 불가능할 경우 일시적으로 서비스를 제한, 중지시킬 수 있으며 사전 또는 사후 회원에게 중지사유 및 기간을 공지합니다.
</p>
					<p>③ 진흥원의 사정으로 서비스를 영구적으로 중단하여야 할 경우에는 사전 공지기간은 1개월로 합니다.
</p>
					<p>④ 진흥원은 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고 없이 일시적으로 서비스를 중단할 수 있으며, 새로운 서비스로의 교체 등 진흥원이 적절하다고 판단하는 사유에 의하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.
</p>
					<p>⑤ 진흥원은 서비스를 특정범위로 분할하여 각 범위별로 이용가능시간을 별도로 지정할 수 있습니다. 다만 이 경우 그 내용을 공지합니다.
</p>
					<p>⑥ 제1항 및 진흥원이 통제할 수 없는 사유로 인한 서비스중단의 경우(시스템관리자의 고의, 과실 없는 디스크장애, 시스템다운 등)에 사전통지가 불가능하며 타인(PC통신회사, 기간통신사업자 등)의 고의, 과실로 인한 시스템중단 등의 경우에는 통지하지 않습니다.
</p>
					<p>⑦ 진흥원은 회원이 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지하거나 회원의 동의 없이 이용계약을 해지할 수 있습니다. 또한 이 경우 진흥원은 위 이용자의 접속을 금지할 수 있습니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제13조 (서비스 이용제한)</h5>
					<p>진흥원은 회원이 본 약관 제15조(저작권 등), 제17조(이용자의 의무)등 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 이용을 제한(서비스 접속금지 등) 및 정지할 수 있습니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제14조 (게시물의 관리 및 삭제) </h5>
					<p>① 회원이 게시한 게시물의 저작권은 게시자에게 귀속되며, 진흥원은 이를 서비스 내에 게시할 수 있는 권리를 갖습니다. 진흥원은 게시자의 동의 없이 게시물을 상업적으로 이용할 수 없으나, 비영리 목적인 경우는 그러하지 아니합니다.
</p>
					<p>② 진흥원은 회원이 게시하거나 등록하는 서비스 내의 내용물, 게시 내용이 다음 각 호에 해당된다고 판단되는 경우 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.
</p>
					<p>1. 본서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우
</p>
					<p>2. 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
</p>
					<p>3. 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
</p>
					<p>4. 불법복제 또는 해킹을 조장하는 내용인 경우
</p>
					<p>5. 영리를 목적으로 하는 광고일 경우
</p>
					<p>6. 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
</p>
					<p>7. 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
</p>
					<p>8. 진흥원에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우
</p>
					<p>9. 기타 관계법령에 위배된다고 판단되는 경우
</p>
					<p>③ 이용자의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 이용자가 부담하여야 합니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제15조(저작권 등)</h5>
					<p>① 진흥원이 제공하는 모든 콘텐츠에 대한 저작권은 진흥원 또는 콘텐츠 원 제작자에게 있습니다.
</p>
					<p>② 회원은 진흥원이 제공하는 서비스를 이용함에 있어서 일체의 콘텐츠를 진흥원의 사전 승낙 없이 녹화ㆍ녹음ㆍ복제ㆍ편집ㆍ전시ㆍ전송ㆍ배포ㆍ판매ㆍ방송ㆍ공연ㆍ발췌ㆍ다운로드하는 등의 행위로 진흥원 및 원 제작자의 저작권을 침해 하여서는 안 됩니다. 
</p>
					<p>③ 회원은 제2항의 저작권을 포함한 서비스 이용 중 취득한 정보 일체를 상업적으로 사용할 수 없습니다.
</p>
					<p>④ 회원이 제1항 내지 제3항을 위반하는 경우 저작권법 등 관계법령에 따라 처벌될 수 있음을 알려드립니다.
</p>
					<p>⑤ 회원이 제1항 내지 제3항을 위배하여 진흥원, 콘텐츠 원 제작자, 다른 회원 등 제3자에게 손해를 가한 경우에 이를 배상하여야만 합니다. 
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제16조 (정보 제공 및 홍보물 게재) </h5>
					<p>① 진흥원은 서비스를 운영함에 있어서 각종 정보를 홈페이지에 게재, 전자우편, 서신우편 발송 등의 방법으로 회원에게 제공할 수 있습니다.
</p>
					<p>② 진흥원은 서비스에 적절하다고 판단되거나 공익성이 있는 홍보물을 게재할 수 있습니다.
</p>
					 <hr class="hr_20">	
					  <h4 class="fnt15 po_C6">제4장 의무 및 책임</h4>
					<h5 class="po_C9 fnt13">제17조 (서비스 제공자의 의무)</h5>				
					<p>① 진흥원은 특별한 사정이 없는 한 회원이 예정된 서비스 제공 개시일에 서비스를 이용할 수 있도록 합니다.
</p>
					<p>② 진흥원은 본 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 의무가 있습니다.
</p>
					<p>③ 진흥원은 회원의 개인 신상 정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 다만, 관계법령에 의해 국가기관의 요구나 전기통신관련법령 및 정보통신윤리위원회의 요청 등 법률의 규정에 따른 적법한 절차에 의한 경우에는 그러하지 아니합니다.
</p>
					<p>④ 진흥원은 회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우에는 회원에게 그 사유와 처리 일정을 통보하여야 합니다.
</p>
					<p>⑤ 진흥원은 관계법령이 정하는 바에 따라서 이용자의 등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력합니다. 회원의 개인정보보호에 관해서는 관계법령 및 진흥원이 정하는 ‘개인정보보호 지침’에서 정한 바에 의합니다.
</p>
					<p>⑥ 진흥원은 회원의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제18조 (회원의 의무)</h5>
					<p>① 회원가입 신청 및 회원정보 변경 시 요구되는 정보는 사실에 근거하여 기입하여야 하며, 만약 허위 또는 타인의 정보를 등록할 경우 일체의 권리를 주장할 수 없습니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 이용자ID 및 비밀번호를 제3자에게 제공 또는 이용하게 해서는 안 됩니다. 
</p>
					<p>② 회원은 서비스를 이용하여 얻은 정보를 진흥원의 사전승낙 없이 녹화, 녹음, 다운로드, 발췌, 복사, 복제, 변경, 번역, 출판, 방송 기타의 방법으로 영리행위를 할 수 없으며, 이를 타인에게 제공할 수 없습니다.
</p>
					<p>③ 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안 됩니다. 
</p>
					<p>1. 회원가입 신청 또는 회원정보 변경 시 허위내용을 기재하거나 다른 회원의 이용자ID와 비밀번호를 도용하여 부정 사용하는 행위
</p>
					<p>2. 저속, 음란, 모욕적, 위협적이거나 타인의 Privacy를 침해할 수 있는 내용을 전송, 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
</p>
					<p>3. 진흥원 운영진, 직원 또는 관계자를 사칭하는 행위
</p>
					<p>4. 서비스를 통하여 전송된 내용의 출처를 위장하는 행위
</p>
					<p>5. 법률, 계약에 의해 이용할 수 없는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
</p>
					<p>6. 진흥원으로부터 특별한 권리를 부여 받지 않고 진흥원의 클라이언트 프로그램을 변경하거나, 서버 해킹 및 컴퓨터바이러스 유포, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위
</p>
					<p>7. 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
</p>
					<p>8. 진흥원의 승인을 받지 아니한 광고, 판촉물, 스팸메일, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자우편 또는 기타의 방법으로 전송하는 행위
</p>
					<p>9. 다른 이용자의 개인정보를 수집, 저장, 공개하는 행위
</p>
					<p>10. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
</p>
					<p>11. 선량한 풍속, 기타 사회질서를 해하는 행위
</p>
					<p>12. 타인의 명예를 훼손하거나 모욕하는 행위
</p>
					<p>13. 타인의 지적재산권 등의 권리를 침해하는 행위
</p>
					<p>14. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
</p>
					<p>15. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
</p>
					<p>16. 서비스에 게시된 정보의 변경
</p>
					<p>17. 본 약관을 포함하여 기타 진흥원이 정한 제반 규정 또는 이용 조건을 위반하는 행위 
</p>
					<p>18. 기타 관계법령에 위배되는 행위
</p>
					<p>④ 자신의 아이디가 부정하게 사용된 경우, 회원은 반드시 진흥원에 그 사실을 통보한 뒤 사후 조치를 받아야 합니다.
</p>
					<p>⑤ 회원은 본 약관 및 관계 법령에서 규정한 사항을 준수하여야 합니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제19조(양도금지) </h5>
					<p>회원은 서비스 이용권한, 기타 이용계약 상의 지위를 타인에게 양도 및 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.
</p>

					 <hr class="hr_20">	
					  <h4 class="fnt15 po_C6">제5장 계약 해지 및 서비스 이용 제한</h4>
					<h5 class="po_C9 fnt13">제20조 (계약 해지 및 이용 제한)</h5>
					<p>① 회원이 서비스를 중도에 해지하고자 하는 때에는 사이트의 회원탈퇴 메뉴를 이용해 직접 탈퇴하여야 합니다.
</p>
					<p>② 회원탈퇴를 요청한 경우에는 수집된 개인정보는 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기하는 것을 원칙으로 합니다. 다만, 서비스 이용 중에 게시물을 작성하신 경우, 3년 동안 개인정보를 보관한 후 삭제합니다.
</p>
					<p>③ 진흥원은 회원이 다음 각 호에 해당하는 행위를 하였을 경우 사전 통지 없이 이용 계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.
</p>
					<p>1. 불성실한 이용 및 진흥원의 정당한 요구에 불응할 경우
</p>
					<p>2. 공공질서 및 미풍양속에 반하는 경우
</p>
					<p>3. 범죄적 행위에 관련되는 경우
</p>
					<p>4. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행할 경우
</p>
					<p>5. 타인의 서비스 아이디 및 비밀 번호를 도용한 경우
</p>
					<p>6. 타인의 명예를 손상시키거나 불이익을 주는 경우
</p>
					<p>7. 같은 사용자가 다른 아이디로 이중 등록을 한 경우
</p>
					<p>8. 타인에게 경제적인 손실을 입혔을 경우
</p>
					<p>9. 기타 관련 법령, 본 약관에 따른 회원의 준수의무 위반 및 진흥원이 정한 이용 조건에 위배되는 경우
</p>
					<p>④ 진흥원은 이용 정지 기간 중에 그 이용 정지 사유가 해소된 것이 확인된 경우에는 이용 정지 조치를 즉시 해제합니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제21조 (이용 제한 절차)</h5>
					<p>① 진흥원은 제20조의 규정에 의하여 이용 제한을 하고자 하는 경우에는 그 사유, 일시 및 기간을 정하여 서면, 이메일 또는 쪽지, 전화 등의 방법에 의하여 해당 회원 또는 대리인에게 통지합니다. 다만, 진흥원이 긴급하게 이용을 정지할 필요가 있다고 인정하는 경우에는 그러하지 아니합니다.
</p>
					<p>② 제1항의 규정에 의하여 이용 정지의 통지를 받은 회원 또는 그 대리인은 그 이용 정지의 통지에 대하여 이의가 있을 때에는 서면 또는 이메일로 이의 신청을 할 수 있습니다.
</p>
					<p>③ 진흥원은 제2항의 규정에 의한 이의 신청에 대하여 그 확인을 위한 기간까지 이용 정지를 일시 연기할 수 있으며, 그 결과를 회원 또는 그 대리인에게 통지합니다.

</p>

					<hr class="hr_20">	
					  <h4 class="fnt15 po_C6">제6장 서비스 이용규정</h4>
					<h5 class="po_C9 fnt13">제22조 (서비스 이용 및 회원아이디의 관리)</h5>	
					<p>① 회원은 이용자ID를 통하여 언제든지 사이트에 접속할 수 있고, 자유롭게 서비스를 이용할 수 있습니다.
</p>
					<p>② 회원은 이용자ID 및 비밀번호를 스스로의 책임 아래 관리하여야 합니다. 회원은 이용자ID 및 비밀번호를 타인에게 양도하거나 사용 승낙할 수 없습니다.
</p>
					<p>③ 진흥원은 회원 본인에 의한 이용자ID 또는 비밀번호의 유출 및 사용승낙으로 인한 어떠한 손실이나 손해에 대하여도 책임을 지지 않습니다.
</p>
					<p>④ 회원이 이용자ID 또는 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 곧바로 진흥원에 통보하여야 하고 진흥원의 안내가 있을 경우에는 그에 따라야 합니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제23조 (대리 및 보증의 부인)</h5>
					<p>진흥원은 사이트 내에서 회원을 대리 및 보증할 권한을 갖고 있지 않으며, 진흥원의 어떠한 행위도 회원의 대리행위 또는 회원에 대한 보증행위로 간주되지 않습니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제24조 (게시물 등록에 관한 규정)</h5>
					<p>진흥원이 정하는 양식에 어긋난 등록이나 허위등록으로 인한 손해 또는 손실에 대한 책임은 등록한 회원이 부담해야 합니다.
</p>
					<hr class="hr_20">	
					  <h4 class="fnt15 po_C6">제7장 서비스 이용수수료
</h4>
					<h5 class="po_C9 fnt13">제25조 (수수료)</h5>	
					<p>① 진흥원이 사이트를 통해 제공하는 일반서비스는 무료로 함을 원칙으로 합니다.
</p>
					<p>② 제1항에 변경이 있을 때에는 변경 전 5일 이내 사이트에 고시함을 원칙으로 합니다.
</p>
					<p>③ 진흥원은 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 진흥원이 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.
</p>
					<hr class="hr_20">	
					  <h4 class="fnt15 po_C6">제8장 면책조항 등

</h4>
					<h5 class="po_C9 fnt13">제26조 (면책조항)
</h5>	
					<p>① 진흥원이 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.
</p>
					<p>② 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우에는 진흥원의 책임이 면제됩니다.
</p>
					<p>③ 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 진흥원의 책임은 면제됩니다.
</p>
					<p>④ 진흥원은 이용자의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.
</p>
					<p>⑤ 진흥원은 회원이나 제3자에 의해 표출된 어떠한 의견이나 정보에 대해 확신이나 대표할 의무가 없으며 의견을 승인하거나 반대하거나 수정하지 않습니다. 진흥원 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다.
</p>
					<p>⑥ 진흥원 사이트는 회원 간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.
</p>
					<p>⑦ 진흥원은 이용자 또는 기타 유관기관이 서비스에 게재한 정보에 대해 정확성, 신뢰도에 대하여 보장하지 않습니다. 따라서 진흥원은 이용자가 위 내용을 이용함으로 인해 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 부담하지 아니합니다.
</p>
					<p>⑧ 진흥원은 이용자가 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해 및 타 이용자로 인해 입게 되는 정신적 피해에 대하여 보상할 책임을 지지 않습니다.
</p>
					<hr class="hr_20">
                                       <h5 class="po_C9 fnt13">제27조 (관할법원)
</h5>
					<p>① 본 약관에 명시되지 않은 사항은 전기통신사업법 등 관계법령과 상관습에 따릅니다.</p>
					<p>② 본 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될 경우 진흥원 본사 소재지를 관할법원으로 합니다.</p>

					<br/><p class="text-center">&lt;&nbsp; 부 칙 &nbsp;&gt;</p>
<br/>
					<p>이 약관은 2017년 9월 18일부터 시행합니다.</p>
                                   </div>

                                   <div class="agreeCheck text-right">
                                       <input title="동의" type="checkbox" value="" id="termAgree">
                                       <label title="동의" for="termAgree">동의합니다</label>
                                   </div>

                               </div>
                               <h3 class="sub_tit mrg_t30">개인정보 수집 및 이용 동의</h3>
                               <div class="borBox">
                                   <div class="terms" tabindex="0">
                                       <!-- <h4 class="fnt15 po_C6">제1조(목적)</h4> -->
	                                  <h4 class="po_C9 fnt13">개인정보의 수집·이용 목적</h4>
	                                  <p>① 회원가입 및 관리</p>
					  <p>② 교육 관련 서비스 제공: 교육 프로그램 참여, 교육 일정 안내, 교육 자료 발송, 이벤트 안내, 교육 및 진흥원 서민금융 관련 홍보·마케팅, 서민금융 정책 개발·연구 등</p>
					  <p>③ 기타: 서비스의 유효성 확인, 접속빈도 파악, 회원의 서비스 이용에 대한 통계</p>
	                                  <hr class="hr_20">
	                                  
	                                  <h4 class="po_C9 fnt13">수집 · 이용하는 개인정보의 항목</h4>
	                                  <p>가. 수집정보</p>
									  <p>필수정보 : 휴대폰번호, 아이디, 비밀번호(비밀번호 확인), 이름, 성별, 생년월일, 이메일 주소(이메일 인증시), 주소, 회원구분, 지점</p>
									  <p>선택정보 : 이메일 주소(휴대폰 인증시)</p>
									  <br/>
									  <p>나. 기타정보</p>
									  <p>서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.</p>
									  <br/>
									  <p>※ IP Address, 쿠키, 방문일시, 서비스 이용 및 제공 기록 등</p>
									  <hr class="hr_20">
									  
									  <h4 class="po_C9 fnt13">개인정보의 보유 및 이용기간</h4>
	                                  <p>상상스토리이 금융교육포털 서비스 이용과 관련하여 수집한 개인정보는 관계법령 등의 규정에 의하며 3년 간 기록·보존하고, 기간이 경과할 경우 「개인정보보호법」 등에서 정하는 바에 따라 파기합니다. 단, 관계법령에서 의하여 정보보유 사유가 발생한 때에는 법률에서 정한 기간 동안 정보를 보존합니다.</p>
	                                  <hr class="hr_20">
									  
									  <h4 class="po_C9 fnt13">동의 거부 권리 및 동의 거부 시 불이익</h4>
                                  	  <p>귀하는 위 개인정보 처리에 거부 할 권리가 있지만, 위 개인정보 중 필수적 정보의 수집·이용에 관한 동의는 계약의 체결 및 이행을 위하여 필수적이므로, 위 사항에 동의하셔야만 위 계약의 설정 및 유지가 가능합니다. </p>
					 
	                                  <hr class="hr_20">

					 		<h4 class="po_C9 fnt13">개인정보의 마케팅 활용</h4>
						

							<p> 교육정보, 이벤트, 뉴스레터 제공 등의 부가서비스를 받으실 수 있습니다.</p>
		                              </div>
								</div>
	                              <div class="agreeCheck text-right">
	                                  <input title="동의" type="checkbox" name="protectAgree" id="protectAgree">
	                                  <label title="동의" for="protectAgree">동의합니다</label>
	                              </div>
                           </fieldset>
                       </form>
                       <div class="btnAreaC mrg_t30">
                           <button type="button" name="button" onclick="fnSave();return false;" class="btn btn-lg btn-blue" title="회원 가입">회원 가입</button>
                       </div>
                   </section>
               </div>
           </div>
       </article>


	  <!-- popup 대출이용자 팝업-->
        <article id="join_pop" style="display: none; z-index: 100" tabindex="0">
                <div class="normal main_pop" tabindex="0" style="border: 0px;">
                    <div class="modal-content" tabindex="0">
                        <div class="modal-header">
                            <button type="button" class="close" onclick="layerPop(); return false" ><span aria-hidden="true" class="text-hide" title="닫기">닫기</span></button>
                            <h4 class="modal-title" id="jijumLabel2">대출이용자 교육 안내</h4>
                        </div>
                    </div>
                    
                    <div class="modal-body" style="height:540px;overflow-y:auto" tabindex="0">
                    	<div class="infoBox">
                    		<p class="mrg_t10">서민금융 진흥원의 <span class="bold po_C4 fnt16">창업자금 신청자, 운영자금 및 시설개선자금 신청자, 대학생&middot;청년 햇살론 신청자</span>는 교육 홈페이지에서 회원가입 후 필수교육을 이수하여야 합니다.</p>
                    		<p class="mrg_t15">각 교육대상별 의무교육 시간 및 교육 방법은 아래와 같습니다.</p>
                    	</div>
                    	
                    	<hr>
                    	
                        <section tabindex="0">
                        	<h4 class="sub_tit">창업자금 신청자</h4>
                            <div class="tblWrap">
                               <table class="dataTbl text-center">
                                 	<caption>창업자금 신청자 교육안내</caption>
                                 	<colgroup>
                                 		<col style="width:13%">
                                 		<col style="width:13%">
                                 		<col style="width:*">
                                 	</colgroup>
                                 	<thead>
                                 		<tr>
                                 			<th scope="col">교육구분</th>
                                 			<th scope="col">교육과목</th>
                                 			<th scope="col">교육방법</th>
                                 		</tr>
                                 	</thead>
                                 	<tbody>
                                 		<tr>
                                 			<td>미소금융</td>
                                 			<td>12과목</td>
                                 			<td class="text-left">
                                 				<ul class="mrg_t10 mrg_b10">
													<li class="li_dot wordBrk"><strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong>
														메뉴에서 총 12과목 필수 이수</li>
												</ul>
                                 			</td>
                                 		</tr>
                                 	</tbody>
                                 </table>
                            </div>
                        </section>
                        <hr>
                        <section tabindex="0">
                        	<h4 class="sub_tit">운영자금 및 시설개선자금 신청자</h4>
                            <div class="tblWrap">
                               <table class="dataTbl text-center">
									<caption>운영자금 및 시설개선자금 신청자 교육안내</caption>
									<colgroup>
										<col style="width: 13%">
										<col style="width: 13%">
										<col style="width: *">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">교육구분</th>
											<th scope="col">교육과목</th>
											<th scope="col">교육방법</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>미소금융</td>
											<td>4과목</td>
											<td class="text-left">
												<ul class="mrg_t10 mrg_b10">
													<li class="li_dot wordBrk"><strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong>
														메뉴에서 총 4과목 필수 이수</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
                            </div>
                        </section>
                        
                        <hr>
                        <section>
							<h4 class="sub_tit">대학생&middot;청년 햇살론 신청자</h4>
							<div class="tblWrap">
								<table class="dataTbl text-center">
									<caption>대학생&middot;청년 햇살론 신청자 교육안내</caption>
									<colgroup>
										<col style="width: 13%">
										<col style="width: 13%">
										<col style="width: *">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">교육구분</th>
											<th scope="col">교육과목</th>
											<th scope="col">교육방법</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>햇살론</td>
											<td>1과목</td>
											<td class="text-left">
												<ul class="mrg_t10 mrg_b10">
													<li class="li_dot wordBrk"><strong class="bold po_C4">온라인교육&gt;대출이용자교육&gt;미소금융</strong>
														메뉴에서 1과목 필수 이수</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</section>
						<hr>
                    </div>
                </div>
           
        </article>
        <!-- //popup -->
		</div>
		 <!--// content -->
       <!-- popup -->
       <%@ include file="/WEB-INF/jsp/common/layer/ly_jijum.jsp"%>
       <%@ include file="/WEB-INF/jsp/academy/cmmn/jsp/post_pop.jsp"%>
       <!-- //popup -->


<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->