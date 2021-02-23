

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
/*     $('#moblphon1').attr('disabled', true);
    $('#moblphon2').attr('readonly', true);
    $('#moblphon3').attr('readonly', true); */
    
    
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
	
	
	<c:set var="cnt" value="0" />
	
	//14세 미만 체크
/* 	if(date.getFullYear()-$('#brthdyYear').val() < 14){
		if($('#authAgeCheckYn').val() == 'N'){
			alert('14세미만 인증을 실행해주세요.');
// 			$(".ageN").focus();
			return false;
		}
	} */
	
/* 	if(date.getFullYear()-$('#brthdyYear').val() > 14){
			alert('14세이상 입니다. 14세 이상 인증을 실행해주세요.');
			return false;
	}
	 */
	
    //아이디 중복확인 체크
    if($('#multipleReg').val() == 'Y'){
        alert('회원가입 중입니다 잠시만 기다려주세요.');
        return false;
    }

/*     if($('#authCheckYn').val() =='N') {
    	if($('input[name=confirmBtn]:radio:checked').val() == 'S'){
    		alert('휴대폰 인증을 해 주세요.');
    		$('#confirmMobile2').focus();
    		
    	}else{
    		alert('이메일 인증을 해 주세요.');
    		$('#email1').focus();
    	}
        return false;
    }
     */
     
   
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
    

//     if('' == tUserName) {
//         alert('이름을 입력해 주세요.');
//         $('#userName').focus();
//         return false;
//     }else {
//         $('#userName').val(tUserName);
//     }

//     if("child" == '${REQUEST_DATA.memberType}') {
// 	    if('' == $("#brthdyYear").val()) {
// 	    	alert("생년월일(년도)을 선택해 주세요.");
// 	    	$("#brthdyYear").focus();
// 	    	return;
// 	    }
//     }
    
//     if("child" == '${REQUEST_DATA.memberType}') {
// 	    if('' == $("#brthdyMonth").val()) {
// 	    	alert('생년월일(월)을 선택해 주세요.');
// 	    	$("#brthdyMonth").focus();
// 	    	return;
// 	    }
//     }
    
//     if("child" == '${REQUEST_DATA.memberType}') {
//     	if('' == $("#brthdyDay").val()) {
//     		alert("생년월일(일)을 선택해 주세요.");
//     		$("#brthdyDay").focus();
//     		return;
//     	}
//     }
    
//     if("child" == '${REQUEST_DATA.memberType}') {
// 	    if('' == $("#sex").val()) {
// 	    	alert('성별을 선택해 주세요.');
// 	    	$("#sex").focus();
// 	    	return;
// 	    }
//     }
    
//     if("child" == '${REQUEST_DATA.memberType}' || "C" == '${REQUEST_DATA.authMode}') {
// 	    if($('#moblphon1').val() == '' || $('#moblphon2').val() == '' || $('#moblphon3').val() == ''){
// 	        alert('휴대폰 번호를 입력해 주세요.');
// 	        $('#moblphon2').focus()
// 	        return false;
// 	    }
//     } 

//     if($(':radio[name="confirmBtn"]:checked').val() == 'M'){ 
	 /*    if($('#userEmail1').val() == '' || $('#userEmail2').val() == '' ){
	        alert('이메일을 입력해 주세요.');
	        $("#userEmail1").focus();
	        return false;
	    } */
//     } 
    

//    if($('#lnmZip').val() == ''){
//         alert('우편번호를 입력해 주세요.');
//         $("#lnmZip").focus();
//         return false;
//     }
    
//     if($('#lnmAdres1').val() == ''){
//         alert('주소를 입력해 주세요.');
//         $("#lnmAdres1").focus();
//         return false;
//     }
	
//     if($('#mtGradeCode').valueEmpty('회원구분을 선택해 주세요.')) return false; 
    
//     //이메일 합치기
//     if($('#userEmail1').val() !='' || $('#userEmail2').val() !='' ){
//         $('#email').val($('#userEmail1').val() +'@'+$('#userEmail2').val() );
//     } 

//     //전화번호 합치기
//     if("child" == '${REQUEST_DATA.memberType}' || "P" != '${REQUEST_DATA.authMode}') {
//     	$('#moblphon').val($('#moblphon1').val() +'-'+$("#moblphon2").val() +'-'+$('#moblphon3').val() );
//     } else if("P" == '${REQUEST_DATA.authMode}') {		
//     	var moblphon = $('#moblphon').val();
//     	if(moblphon.length == 11) {
//     		var moblphonSub =  moblphon.substring(0, 3) + "-" + moblphon.substring(3, 7) + "-" + moblphon.substring(7);
//     		$('#moblphon').val(moblphonSub);
//     	} else {
//     		var moblphonSub =  moblphon.substring(0, 3) + "-" + moblphon.substring(3, 6) + "-" + moblphon.substring(6);
//     		$('#moblphon').val(moblphonSub);
//     	}
//     }
    
//   	//생년월일 합치기
//   	if("child" == '${REQUEST_DATA.memberType}') {
// 	  	$('#brthdy').val($('#brthdyYear').val()+$('#brthdyMonth').val()+$('#brthdyDay').val());
//   	} 
     
    
   	/* if($("#mtOfficeCode").val() == '') {
    	alert("지점을 선택해 주세요.");
    	$('#mtOfficeBtn').focus();
		return false;
   	} */
    
    
    
     //이용약관 동의
/* 	if($('#termAgree:checkbox:checked').length == 0){
		alert('회원이용악관에 동의해야 가입 가능합니다.');
		$('#termAgree').focus();
		return;	
	} */
  
  
	 

	//개인정보취급방침에 동의
    if(confirm('회원가입 하시겠습니까?')){
        $('#multipleReg').val('Y');
 
        $('#formChk').val('3');
        
        if($('#formChk').val() == 0) {
        	alert("정보가 누락되었습니다. 확인해주시기 바랍니다.");
        	return false;
        }
        
        /* var userPassword = fn_encrypt(encodeURIComponent($('#userPassword').val()));
        var userPassword2 = fn_encrypt(encodeURIComponent($('#userPassword2').val())); */
        
        
        var userPassword = $('#userPassword').val();
        var userPassword2 = $('#userPassword2').val();
        
        $('#frm').attr('target', '');
        $('#frm').attr('action', '/academy/user/memberJoinExec.do');
        
        var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
        var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
        submitEncryptedForm(userPassword, userPassword2, rsaPublicKeyModulus, rsaPublicKeyExponent);
    	//return; 
       // $('#frm').submit();
    }
}

function submitEncryptedForm(password, password2, rsaPublicKeyModulus, rsaPpublicKeyExponent, userPassword3) {
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
/* function searchEmail(){
	
	if($('#email1').valueEmpty('이메일을 입력하세요.')) return false;
	if($('#email2').valueEmpty('이메일을 입력하세요.')) return false;
	
    ajaxSubmit('/academy/user/member/authEmailCheckJoin.do', {  email : $('#email1').val() + '@'+$('#email2').val() }, 'json', eval('resultSearchEmail'));
}
 */
//이메일 중복확인 콜백
/* function resultSearchEmail(data){
	
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
 */
//14세미만 보호자 휴대폰 인증발송
/* function authAgeSmsCheck(){
	if($('#userAgeName').valueEmpty('보호자 이름을 입력하세요.')) return false;
	if($('#confirmAgeMobile2').valueEmpty('보호자 휴대폰번호를 입력하세요.')) return false;
	if($('#confirmAgeMobile3').valueEmpty('보호자 휴대폰번호를 입력하세요.')) return false;
	
    var AgeMobile = $('#confirmAgeMobile1').val()+'-'+$('#confirmAgeMobile2').val()+'-' +$('#confirmAgeMobile3').val();
    ajaxSubmit('/academy/user/member/authAgeSmsCheckJoin.do',{AgeMobile : AgeMobile}, 'json', eval('authAgeSmsCheckCallBack'));
}
 */
//14세미만 보호자 휴대폰 인증발송 AJAX
/* function authAgeSmsCheckCallBack(data){
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
} */

//휴대폰 인증발송
/* function authSmsCheck(){
	if($('#confirmMobile2').valueEmpty('휴대폰번호를 입력하세요.')) return false;
	if($('#confirmMobile3').valueEmpty('휴대폰번호를 입력하세요.')) return false;
	
    var mobile = $('#confirmMobile1').val()+'-'+$('#confirmMobile2').val()+'-' +$('#confirmMobile3').val();
//     ajaxSubmit('/academy/user/member/authSmsCheckJoin.do',{mobile : mobile}, 'json', eval('authSmsCheckCallBack'));
	
} */

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
/* function ageAuthStart(){
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
 */
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
/* function emailSelect(val){
    $('#email2').val(val);
}
function userEmailSelect(val){
    $('#userEmail2').val(val);
} */

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
					<div class="headStep">
						<ol>
							<li><a href="#"><span class="num">1단계. </span>약관동의</a></li>
							<li><a href="#"><span class="num">2단계. </span>본인인증</a></li>
							<li class="on"><a href="#" title="회원정보입력"><span class="num">3단계. </span>회원정보입력</a></li>
							<li><a href="#"><span class="num">4단계. </span>가입완료</a></li>
						</ol>
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
                       
                       <form name="frm" id="frm" action="" method="post">
						    <input type="hidden" name="BIZNO" id="BIZNO" value="<c:out value="${REQUEST_DATA.BIZNO}" />" /><!-- 사업자등록번호 -->
						    <input type="hidden" name="COMNO" id="COMNO" value="<c:out value="${REQUEST_DATA.COMNO}" />" /><!-- 사업자일련번호 -->
						    <input type="hidden" name="telNo" id="telNo" value="" /><!-- 회사연락처 -->
						    <input type="hidden" name="idCheckYn" id="idCheckYn" value="N" /><!-- 아이디 중복체크YN -->
						    <input type="hidden" name="empSeq" id="multipleReg" value="X" /><!-- 중복회원가입 방지여부 Y:방지실행 N:방지실행X -->
						    <input type="hidden" name="smsAuthCode" id="smsAuthCode" value="" /><!-- sms 인증코드 -->
						    <input type="hidden" name="emailAuthCode" id="emailAuthCode" value="" /><!-- email 인증코드 -->
						    <input type="hidden" name="authCheckYn" id="authCheckYn" value="N" /><!-- 인증여부 -->
						    <input type="hidden" name="authMode" id="authMode" value="<c:out value='${REQUEST_DATA.authMode}'/>" /><!-- 인증여부 -->
						    <input type="hidden" name="comNo" id="comNo" value="" /><!-- 사업자명 CODE번호 -->
						    <input type="hidden" name="orgCode" id="orgCode" value="" /><!-- 기관/단체명 CODE번호 -->
							<input type="hidden" name="securedUserId" id="securedUserId" value="" />
					        <input type="hidden" name="securedPassword" id="securedPassword" value="" />
					        <input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" />
					        <input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" />
					        <input type="hidden" name="confirmAgeMobile" id="confirmAgeMobile" value="" /><!-- 보호자휴대폰번호 -->
					        <input type="hidden" name="smsAgeAuthCode" id="smsAgeAuthCode" value="" /><!-- 보호자 sms 인증코드 -->
					        <input type="hidden" name="authAgeCheckYn" id="authAgeCheckYn" value="N" /><!-- 인증여부 -->
					        <input type="hidden" name="memberType" id="memberType" value="<c:out value='${REQUEST_DATA.memberType}'/>"/>
					        <input type="hidden" name="di" id="di" value="<c:out value='${REQUEST_DATA.di}'/>"/>
					        <input type="hidden" name="email" id="email" value=""/>
					        <input type="hidden" name="formChk" id="formChk" value=""/>
					        <input type="hidden" name="pwdChk" id="pwdChk" value=""/>
					        
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
                                       	<c:if test="${REQUEST_DATA.memberType eq 'child'}">
                                       	   <tr>
                                               <th scope="row"><label for="userAgeName">보호자 이름</label></th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
<!--                                                            <input title="보호자 이름" type="text" class="form-control" id="userAgeName" name="userAgeName"> -->
															<c:out value="${REQUEST_DATA.mbernm}"/>
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                           
                                           <tr>
                                               <th scope="row">보호자 인증방법</th>
                                               <td>
                                                   <div class="form-inline">
                                                       <div class="form-group w30">
	                                                       <c:choose>
		                                                       <c:when test="${REQUEST_DATA.authMode eq 'P'}">핸드폰 인증</c:when>
		                                                       <c:when test="${REQUEST_DATA.authMode eq 'I'}">아이핀 인증</c:when>
		                                                       <c:when test="${REQUEST_DATA.authMode eq 'C'}">신용(체크)카드 인증</c:when>
	                                                       </c:choose>
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                          </c:if>
                                          <c:if test="${REQUEST_DATA.memberType eq 'child' && REQUEST_DATA.authType ne 'P'}">
                                       	  <tr>
                                               <th scope="row"> <label for="confirmAgeMobile1">보호자 인증번호</label></th>
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
                                                      <!--  <button type="button" onclick="authAgeSmsCheck();return false" class="btn btn-orange btn-sm" title="인증번호 발송">인증번호 발송</button>
                                                       <p id="smsChkResult" class="smsChkResult"></p>  -->
                                                   </div>
                                               </td>
                                           </tr>
                                           </c:if>
                                           <c:if test="${REQUEST_DATA.memberType eq 'child' && REQUEST_DATA.authType eq 'P' }">
                                           	<tr>
                                               <th scope="row">보호자 인증번호</th>
                                               <td>
                                                   <div class="form-inline phoneNum">
                                                       <div class="form-group w20"><c:out value="${REQUEST_DATA.moblphon}"/></div>
                                                   </div>
                                               </td>
                                           	</tr>
                                           </c:if>
                                           <!-- <tr class="ageYn" style="display:none;">
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
                                           </tr> -->
<%--                                            <tr>
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
                                           </tr> --%>
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
                                                       <c:choose>
                                                       	<c:when test="${REQUEST_DATA.memberType eq 'child'}">
                                                           <input type="text" class="form-control" id="userName" name="userName" value="">
                                                       	</c:when>
                                                       	<c:when test="${REQUEST_DATA.memberType ne 'child'}">
                                                       		<input type="hidden" name="userName" id="userName" value="<c:out value='${REQUEST_DATA.mbernm}'/>"/>
                                                         	<c:out value='${REQUEST_DATA.mbernm}'/> 
                                                       	</c:when>
                                                       </c:choose>
                                                       
                                                       </div>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="sex">성별</label></th>
	                                            <td>
	                                                   <div class="form-inline phoneNum">
	                                                       <div class="form-group w30">
	                                                       	<c:choose>
	                                                       		<c:when test="${REQUEST_DATA.memberType eq 'child'}">
	                                                       			<select name="sex" class="form-control" id="sex">
	                                                               		<option value="">선택</option>
																   		<option value="M">남자</option>
																   		<option value="F">여자</option>
	                                                           		</select>
	                                                       		</c:when>
	                                                       		<c:otherwise> 
	                                                       			<input type="hidden" id="sex" name="sex" value="<c:out value='${REQUEST_DATA.sex}'/>"/>
	                                                       			<c:if test="${REQUEST_DATA.sex eq 'F'}">여성</c:if>
	                                                       			<c:if test="${REQUEST_DATA.sex ne 'F'}">남성</c:if>
	                                                       		</c:otherwise>
	                                                       	</c:choose>
	                                                       </div>
	                                                   </div>
	                                               </td>
	                                           	
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="brthdyYear">생년월일</label></th>
                                               <td>
                                                   <div class="form-inline phoneNum">
                                                       <div class="form-group w20">
                                                       
                                                       	<c:if test="${REQUEST_DATA.memberType eq 'child'}">
                                                       	<input type="hidden" name="brthdy" id="brthdy" value=""/>
                                                           <select name="brthdyYear" id="brthdyYear" class="form-control" title="생년">
                                                               <option value="">년도</option>
                                                               <fmt:formatDate value="${now}" pattern="yyyy" var="yearStart"/>
														       <c:forEach begin="0" end="100" var="result" step="1">
														       	   <option value="<c:out value="${yearStart - result}" />" <c:if test="${(yearStart - result) == searchVO.bsnsYear}"> selected="selected"</c:if>><c:out value="${yearStart - result}" /></option>
														       </c:forEach>
                                                           </select> 
                                                        </c:if>
                                                        
                                                        <c:if test="${REQUEST_DATA.memberType eq 'adult'}">
                                                        	<input type="hidden" name="brthdy" id="brthdy" value="<c:out value='${REQUEST_DATA.brthdy}'/>"/>
                                                        	<c:out value='${REQUEST_DATA.brthdy}'/>
                                                        </c:if>
                                                       </div>
                                                       <c:if test="${REQUEST_DATA.memberType eq 'child'}">
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
                                                       </c:if>
                                                       	<c:if test="${REQUEST_DATA.memberType eq 'child'}">
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
                                                          </c:if>
                                                   </div>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><label for="moblphon1">휴대폰번호</label></th>
                                               <td>
                                                   <div class="form-inline phoneNum">
                                                       <c:if test="${REQUEST_DATA.memberType eq 'child' || REQUEST_DATA.authMode ne 'P'}">
                                                       <input type="hidden" name="moblphon" id="moblphon" value=""/>
	                                                       <div class="form-group w20">
	<!--                                                            <select class="form-control" name="moblphon1" id="moblphon1" onchange="javascript:emailSelect('ID',this.value);return false;" title="휴대폰번호 첫째자리"> -->
	                                                           <select class="form-control" name="moblphon1" id="moblphon1" title="휴대폰번호 첫째자리">
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
                                                       </c:if>
                                                      <c:if test="${REQUEST_DATA.memberType ne 'child'}">
                                                      	<input type="hidden" name="moblphon" id="moblphon" value="<c:out value='${REQUEST_DATA.moblphon}'/>"/>
<%--                                                       	<c:if test="${fn:length() }"> --%>
                                                      	    <c:out value="${REQUEST_DATA.moblphon}"/>
<%--                                                       	   </c:if> --%>
                                                      </c:if>
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
                       
                       <div class="btnAreaC mrg_t30">
                           <button type="button" name="button" onclick="fnSave();return false;" class="btn btn-lg btn-blue" title="회원 가입">회원 가입</button>
                       </div>
                       
                   </section>
		</div>
		 <!--// content -->
       <!-- popup -->
       <%@ include file="/WEB-INF/jsp/common/layer/ly_jijum.jsp"%>
       <%@ include file="/WEB-INF/jsp/academy/cmmn/jsp/post_pop.jsp"%>
       <!-- //popup -->


<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->