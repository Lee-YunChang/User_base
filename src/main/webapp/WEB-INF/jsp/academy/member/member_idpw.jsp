<%
/****************************************************
    system	: 회원 > 아이디 비밀번호 찾기
    title	: 아이디 비밀번호 찾기
    summary	:
    wdate	: 2016-07-07
    writer	: 이진영
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 

<script type="text/javascript">


$(document).ready(function(){
	 $('#type_s_id').hide();
	 $('#type_s').hide();
	 $('#phoneSearch').hide();
	 $('#layer_01').hide();
	 $('#layer_02').hide();
	 $('#findPw').hide();
	 $('#layer_03').hide(); // 비밀번호
	 $('#pw_loopUp').css('display','none'); // 비밀번호 찾기 phone 조회
	 $('#pw_loopUp2').css('display','none'); // 비밀번호 찾기 email 조회
	
	 $('#id_loopUp2').css('display','none'); // 아이디 찾기 email 조회
	 
	 $('#idTitle').css('display','block'); // id 타이틀
	 $('#pwTitle').css('display','none'); // pw 타이틀
	 
	  // id 찾기
	 $('input[name=idConfirmBtn]').each(function(index, element) {
		 if ($(this).is(':checked')) {
			  if($(this).val() == 'M'){
		            $('#type_m_id').show();
		            $('#type_s_id').hide();
		            $('#emailSearch').show();
		            $('#phoneSearch').hide();
		            $('#id_loopUp').css('display','none'); // 아이디 찾기 phone 조회	
			       	$('#id_loopUp2').css('display','block'); // 아이디 찾기 email 조회
		            $('#searchMode').val('EMAIL');
		            
		        }
		        else {
		        //휴대폰 방식
		            $('#type_m_id').hide();
		            $('#type_s_id').show();
		            $('#phoneSearch').show();
		            $('#emailSearch').hide();
		            $('#id_loopUp2').css('display','none'); // 아이디 찾기 email 조회
		            $('#id_loopUp').css('display','block'); // 아이디 찾기 phone 조회	
		            $('#searchMode').val('MOBILE');
		        }
		 }
	});
	 
	 $('input[name=confirmBtn]').each(function(index, element) {
		 if ($(this).is(':checked')) {
	        //이메일 인증
	        if($(this).val() == 'M'){
	            $('#type_m').show();
	            $('#type_s').hide();
	            $('#emailAuthBtn').show();
	        }
	        else {
	            //휴대폰 인증
	            $('#type_m').hide();
	            $('#type_s').show();
	            $('#emailAuthBtn').hide();

	        }
		 }
	}); 
	 
    //아이디찾기 라디오버튼 제어
    $('input[name=idConfirmBtn]').click(function(){
        //이메일 방식
        if($(this).val() == 'M'){
            $('#type_m_id').show();
            $('#type_s_id').hide();
            $('#emailSearch').show();
            $('#phoneSearch').hide();
            $('#id_loopUp').css('display','none'); // 아이디 찾기 phone 조회	
	       	$('#id_loopUp2').css('display','block'); // 아이디 찾기 email 조회
            $('#searchMode').val('EMAIL');
            $("#serchResultInfo").val("N"); // 인증여부 초기화
        	$('#confirmCode').val(""); // 인증번호 초기화
        }
        else {
        //휴대폰 방식
            $('#type_m_id').hide();
            $('#type_s_id').show();
            $('#phoneSearch').show();
            $('#emailSearch').hide();
            $('#id_loopUp2').css('display','none'); // 아이디 찾기 email 조회
            $('#id_loopUp').css('display','block'); // 아이디 찾기 phone 조회	
            $('#searchMode').val('MOBILE');
            $("#serchResultInfo").val("N"); // 인증여부 초기화
        	$('#confirmCode').val(""); // 인증번호 초기화
        }

    });

    //비밀번호찾기 라디오버튼 제어
    $('input[name=confirmBtn]').click(function(){

        //이메일 인증
        if($(this).val() == 'M'){
            $('#type_m').show();
            $('#type_s').hide();
            $('#emailAuthBtn').show();
        	$('#pw_loopUp2').css('display','block'); // 비밀번호 찾기 email 조회
            $('#pw_loopUp').css('display','none'); // 비밀번호 찾기 phone 조회
            $("#serchResultInfo").val("N"); // 인증여부 초기화
        	$('#confirmCode2').val(""); // 인증번호 초기화
        }
        else {
            //휴대폰 인증
            $('#type_m').hide();
            $('#type_s').show();
            $('#emailAuthBtn').hide();
            $('#pw_loopUp2').css('display','none'); // 비밀번호 찾기 email 조회
            $('#pw_loopUp').css('display','block'); // 비밀번호 찾기 phone 조회
            $("#serchResultInfo").val("N"); // 인증여부 초기화
        	$('#confirmCode2').val(""); // 인증번호 초기화
        }

    });

});

//아이디 비밀번호 찾기 실행
function findIdPw2(pmode , cmode) {
    //유효성 체크
    if('PWD' == pmode){
    	if('' == $('#userId').val()) {
			alert('아이디를 입력해 주세요');
            $('#userId').focus();
            return false;
		} else if('' == $('#pwd_userName').val()) {
            alert('이름을 입력해 주세요');
            $('#pwd_userName').focus();
            return false;
    }
    	
   	if(cmode == 'email'){
	    //이메일 합치기
	    $('#email').val($('#ID2_email1').val() +'@'+$('#ID2_email2').val() );
      
   		}else if('' == $('#'+pmode+'_email1').val() || '' == $('#'+pmode+'_email2').val() ){
            alert('이메일을 입력해 주세요.');
            $('#'+pmode+'_email1').focus();
            return false;
        }
	}	

	// Mobile
    
	if('phone' == cmode){
		$('#email').val('');
		$('#mobileNumber').val($('#pwdConfirmMobile1').val() +'-'+$('#pwdConfirmMobile2').val() +'-'+$('#pwdConfirmMobile3').val() );
	}
	
    if($("#serchResultInfo").val() == 'N'){
		alert("인증후 조회바랍니다.");
	}else {
		$('#layer_03').show();
	}
}


//아이디 비밀번호 찾기 실행
function findIdPw(pmode , cmode) {
    //유효성 체크
    if('ID' == pmode){
		if(cmode == 'phone'){
	        if('' == $('#id_userName').val()) {
	            alert('이름을 입력해 주세요');
	            $('#userName').focus();
	            return false;
	        }else if( ('' == $('#confirmMobile1').val() || '' == $('#confirmMobile2').val() || '' == $('#confirmMobile3').val()) && $('#searchMode').val() == 'MOBILE') {
	            alert('휴대폰 번호를 입력해 주세요.');
	            $('#mobileNumber1').focus();
	            return false;
	        }
    	}else if(cmode == 'email'){
    		if('' == $('#id_userName').val()) {
 	            alert('이름을 입력해 주세요');
 	            $('#userName').focus();
 	            return false;
 	        }else if('' == $('#'+pmode+'_email1').val() || '' == $('#'+pmode+'_email2').val() ){
 	            alert('이메일을 입력해 주세요.');
 	            $('#'+pmode+'_email1').focus();
 	            return false;
 	        }
    	}
    }

    //이메일 합치기
    $('#email').val($('#'+pmode+'_email1').val() +'@'+$('#'+pmode+'_email2').val() );
	// Mobile
    
	if('PWD' == pmode){
		$('#mobileNumber').val($('#pwdConfirmMobile1').val() +'-'+$('#pwdConfirmMobile2').val() +'-'+$('#pwdConfirmMobile3').val() );
	}else {
		 $('#mobileNumber').val($('#confirmMobile1').val() +'-'+$('#confirmMobile2').val() +'-'+$('#confirmMobile3').val() );
	}
    
	
    if($("#serchResultInfo").val() == 'N'){
		alert("인증후 조회바랍니다.");
	}else {
	    ajaxSubmit('/academy/user/member/findIdPw.do',
	            {  	userId : $('#userId').val(),
	                userName : $('#id_userName').val(),
	                PWD_userName : $('#pwd_userName').val(),
	                email : $('#email').val(),
	                pmode : pmode,
	                mobileNumber : $('#mobileNumber').val(),
	                searchMode : $('#searchMode').val(),
	                memberYn : "USER"
	            }, 'json',
	            eval('resultIdPw')
	    );
	}
}

//아이디 비밀번호 찾기 콜백
function resultIdPw(data) {
    //결과가 없는경우
    if('NOT_FIND' == data){
        alert('조회 결과가 존재하지 않습니다. 가입인증방식을 바꾸어 조회하여 주세요. (이메일 인증 ↔ 휴대폰 인증)');

    //비밀번호 찾기
    } else if('FIND_PWD' == data) {
        alert('임시 비밀번호를 Email로 발송하였습니다.');
        $('#multipleEmailSend').val('Y');
    //아이디 찾기
    } else if(data == 'FAIL'){
        alert('일시적인 오류가 발생하였습니다.');
    } else {
    	$('#layer_01').show();
    	$('#layer_02').show();
    	$('.idwpMsg').html('<p class="bold fnt16 po_C9">회원님의 아이디는 <span class="po_C4">'+data+'</span> 입니다.</p>');
    }
}


//이메일 셀렉트박스 세팅
function emailSelect(mode, val){
    $('#'+mode+'_email2').val(val);
}
//이메일 셀렉트박스 세팅
function emailSelect2(mode, val){
    $('#'+mode+'_email2').val(val);
}

//이메일 중복확인
function searchEmail(pmode){
	
	
	if('ID' == pmode){
		if($("#id_userName").val() == ''){
			alert("이름을 적어주세요.");
		}else if($('#ID_email1').val() == '' ||  $('#ID_email2').val() == '') {
	        alert('이메일을 적어주세요.');
	    } else {
	    	 $('#emailChkResult_ID').attr('class', 'txt_red indent');
	         $('#emailChkResult_ID').html('잠시만 기다려 주세요.');
	         
	        var email = $('#ID_email1').val() + '@'+$('#ID_email2').val();
			var userName = $("#id_userName").val();
	        ajaxSubmit('/academy/user/member/searchEmail.do',
	                {  email : email,
	        		   userName : userName,
	        		   TPL_UID : '2'
	                }, 'json',
	                eval('resultSearchEmail')
	        );
	    }
	}else if('PWD' == pmode){
		if($("#userId").val() == ''){
			alert("아이디를 적어주세요.");
		}else if($('#pwd_userName').val() == '' ) {
	        alert('이름을 적어주세요.');
	    }else if($('#ID2_email1').val() == '' ||  $('#ID2_email2').val() == '') {
	        alert('이메일을 적어주세요.');
	    } else {
	    	 $('#emailChkResult_PWD').attr('class', 'txt_red indent');
	         $('#emailChkResult_PWD').html('잠시만 기다려 주세요.');
	         
	        var email = $('#ID2_email1').val() + '@'+$('#ID2_email2').val();
	        var userId = $("#userId").val();
			var userName = $("#pwd_userName").val();
	        ajaxSubmit('/academy/user/member/searchEmail.do',
	                {  email : email,
	        		   userId : userId,
	        		   userName : userName,
	        		   TPL_UID : '2'
	                }, 'json',
	                eval('resultSearchEmail2')
	        );
	    }
	}
}

//아이디찾기 이메일 중복확인 콜백
function resultSearchEmail(data){
    if(data == 'N') {
        $('#emailChkResult_ID').removeClass();
    	alert("일치하는 데이터가 없습니다.");
//         $('#emailChkResult_ID').addClass('redFont');
        $('#emailChkResult_ID').attr('class', 'txt_red indent');
        $('#emailChkResult_ID').html('조회 결과가 존재하지 않습니다. 가입인증방식을 바꾸어 조회하여 주세요. (이메일 인증 ↔ 휴대폰 인증)');
        $('#emailCheckYn').html('N');

    }else if(data != 'X' && data != 'N' && data != 'FAIL') {
        $('#emailChkResult_ID').removeClass();
//         $('#emailChkResult_ID').addClass('blueFont');
		$('#emailChkResult_ID').attr('class', 'txt_blue indent');
        $('#emailChkResult_ID').html(' 인증메일을 발송하였습니다.');
        alert("인증번호가 발송 되었습니다.");
        $('#emailCheckYn').val('Y');
        $('#emailAuthCode').val(data);
        
       // alert(data);
    } else if(data == 'X') {
    	alert("회원가입시 인증했던 방식으로 인증해 주세요.");
    } else if(data == 'FAIL'){
        alert('일시적인 오류가 발생하였습니다.');
    }
}

//비밀번호 찾기 이메일 중복확인 콜백
function resultSearchEmail2(data){
    if(data == 'N') {
        $('#emailChkResult_PWD').removeClass();
//         $('#emailChkResult_PWD').addClass('redFont');
    	alert("일치하는 데이터가 없습니다.");
        $('#emailChkResult_PWD').attr('class', 'txt_red indent');

        $('#emailChkResult_PWD').html('조회 결과가 존재하지 않습니다. 가입인증방식을 바꾸어 조회하여 주세요. (이메일 인증 ↔ 휴대폰 인증)');
        $('#emailCheckYn').html('N');

    }else if(data != 'X' && data != 'N' && data != 'FAIL') {
        $('#emailChkResult_PWD').removeClass();
//         $('#emailChkResult_PWD').addClass('blueFont');
        $('#emailChkResult_PWD').attr('class', 'txt_blue indent');
        $('#emailChkResult_PWD').html(' 인증메일을 발송하였습니다.');
        alert("인증번호가 발송 되었습니다.");
        $('#emailCheckYn').val('Y');
        $('#emailAuthCode').val(data);
        //alert(data);
    } else if(data == 'X') {
    	alert("회원가입시 인증했던 방식으로 인증해 주세요.");
    } else if(data == 'FAIL'){
        alert('일시적인 오류가 발생하였습니다.');
    }
}

//모바일 인증발송 AJAX
function authSmsCheck(){
	if($('#userId').val() == '' ){
		alert('아이디를 적어주세요.');
        return false;
	}else if($('#pwd_userName').val() == '') {
        alert('이름을 적어주세요.');
        return false;
    }else if($('#pwdConfirmMobile1').val() == '' ||  $('#pwdConfirmMobile2').val() == '' ||  $('#pwdConfirmMobile3').val() == '') {
        alert('휴대폰번호를 적어주세요.');
        return false;
    }else {
        var mobile = $('#pwdConfirmMobile1').val() + '-'+$('#pwdConfirmMobile2').val() + '-' +$('#pwdConfirmMobile3').val() ;
        var userId = $('#userId').val();
        var userName = $('#pwd_userName').val();
        $('#mobile').val(mobile);
        $('#userName').val(userName);
        
        ajaxSubmit('/academy/user/member/pwdSearchauthSmsCheck.do',
                {  mobile : mobile,
                    userId : userId,
                    userName : userName,
                    memberYn : "USER"
                }, 'json',
                eval('authSmsCheckCallBack')
        );
    }

}

//모바일 인증발송 AJAX
function authSmsCheck2(){
	if($('#id_userName').val() == '' ) {
        alert('이름을 적어주세요.');
        return false;
    }else if($('#confirmMobile1').val() == '' ||  $('#confirmMobile2').val() == '' ||  $('#confirmMobile3').val() == '') {
        alert('휴대폰번호를 적어주세요.');
        return false;
    }else {
        var mobile = $('#confirmMobile1').val() + '-'+$('#confirmMobile2').val() + '-' +$('#confirmMobile3').val() ;
        var userName = $('#id_userName').val();
        $('#mobile').val(mobile);
        $('#userName').val(userName);
        $('#memberYn').val("USER");
        ajaxSubmit('/academy/user/member/pwdSearchauthSmsCheck.do',
                {  mobile : mobile,
                    userName : userName,
                    memberYn : "USER"
                }, 'json',
                eval('authSmsCheckCallBack2')
        );
    }

}

//모바일 인증발송 AJAX
function authSmsCheckCallBack(data){
    if(data != 'X' && data != 'N' && data != 'FAIL') {
    	alert("인증번호가 발송 되었습니다.");
    	$('#smsChkResult_PWD').attr('class', 'txt_blue indent');
        $('#smsChkResult_PWD').html('인증번호가 발송되었습니다.');
        $('#smsAuthCode').val(data);
    }
    else if(data == 'N') {
    	alert("일치하는 데이터가 없습니다.");
    	$('#smsChkResult_PWD').attr('class', 'txt_red indent');
    	$('#smsChkResult_PWD').html('조회 결과가 존재하지 않습니다. 가입인증방식을 바꾸어 조회하여 주세요. (이메일 인증 ↔ 휴대폰 인증)');
    } else if(data == 'X') {
    	alert("회원가입시 인증했던 방식으로 인증해 주세요.");
    } else if(data == 'FAIL'){
        alert('일시적인 오류가 발생하였습니다.');
    }
}

//모바일 인증발송 AJAX
function authSmsCheckCallBack2(data){
	//alert(data);
	
    if(data != 'X' && data != 'N' && data != 'FAIL') {
    	alert("인증번호가 발송 되었습니다.");
    	$('#smsChkResult_ID').attr('class', 'txt_blue indent');
        $('#smsChkResult_ID').html('인증번호가 발송되었습니다.');
        $('#smsAuthCode').val(data);
    }
    else if(data == 'N') {
    	alert("일치하는 데이터가 없습니다.");
    	$('#smsChkResult_ID').attr('class', 'txt_red indent');
    	$('#smsChkResult_ID').html('조회 결과가 존재하지 않습니다. 가입인증방식을 바꾸어 조회하여 주세요. (이메일 인증 ↔ 휴대폰 인증)');
    } else if(data == 'X') {
    	alert("회원가입시 인증했던 방식으로 인증해 주세요.");
    } else if(data == 'FAIL'){
        alert('일시적인 오류가 발생하였습니다.');
    }
}


//인증 실행
function authStart(){
$('#confirmCode').val(); // 사용자가 입력한 인증코드
$('#smsAuthCode').val(); // SMS로 발송된 인증코드
$('#emailAuthCode').val(); // SMS로 발송된 인증코드

	if($('#smsAuthCode').val() != ''){
		//인증번호 틀림
	    if($('#confirmCode').val() != $('#smsAuthCode').val()){

	        //인증번호 틀림 메시지출력
	        alert('잘못된 인증번호 입니다.');
	        $('#authCheckYn').val('N');
	    }
	}
	if($('#emailAuthCode').val() != ''){
	    if($('#confirmCode').val() != $('#emailAuthCode').val()){
	    	//인증번호 틀림 메시지출력
	        alert('잘못된 인증번호 입니다.');
	        $('#authCheckYn').val('N');
	    }
	}

    //인증 성공
    if(($('#confirmCode').val() != '' && $('#smsAuthCode').val() != '') && ($('#confirmCode').val() == $('#smsAuthCode').val())){
        alert("인증 되었습니다.");
    	/* $("#searchResult").html("인증 되었습니다."); */
        $("#serchResultInfo").val("Y");
    }else if(($('#confirmCode').val() != '' && $('#emailAuthCode').val() != '') && ($('#confirmCode').val() == $('#emailAuthCode').val())){
    	alert("인증 되었습니다.");
    	/* $("#searchResult").html("인증 되었습니다."); */
        $("#serchResultInfo").val("Y");
   }
}

//비밀번호 인증
function authStart2(){

$('#confirmCode2').val(); // 사용자가 입력한 인증코드
$('#smsAuthCode').val(); // SMS로 발송된 인증코드
$('#emailAuthCode').val(); // SMS로 발송된 인증코드

	if($('#smsAuthCode').val() != ''){
	    //인증번호 틀림
	    if($('#confirmCode2').val() != $('#smsAuthCode').val()){
	
	        //인증번호 틀림 메시지출력
	        alert('잘못된 인증번호 입니다.');
	        $('#authCheckYn').val('N');
	    }
	}
	if($('#emailAuthCode').val() != ''){
		//인증번호 틀림
	    if($('#confirmCode2').val() != $('#emailAuthCode').val()){
	
	        //인증번호 틀림 메시지출력
	        alert('잘못된 인증번호 입니다.');
	        $('#authCheckYn').val('N');
	    }
	}
    //인증 성공
    if(($('#confirmCode2').val() != '' && $('#smsAuthCode').val() != '') && ($('#confirmCode2').val() == $('#smsAuthCode').val())){
    	$("#updateUserId").val($("#userId").val());
    	$("#updateUserName").val($("#pwd_userName").val());
    	$("#updateUserMobile").val($('#pwdConfirmMobile1').val() + '-'+$('#pwdConfirmMobile2').val() + '-' +$('#pwdConfirmMobile3').val());
    	 $("#serchResultInfo").val("Y");
    	alert("인증 되었습니다.");
        
    }else if(($('#confirmCode2').val() != '' && $('#emailAuthCode').val() != '') && ($('#confirmCode2').val() == $('#emailAuthCode').val())){
      	$("#updateUserId").val($("#userId").val());
       	$("#updateUserName").val($("#pwd_userName").val());
       	$("#updateUserEmail").val($('#ID2_email1').val() + '@'+$('#ID2_email2').val());
        $("#serchResultInfo").val("Y");
       	alert("인증 되었습니다.");

    }
}

//입력폼 변경 안내
function findFormHelp() {
    window.open('/academy/member/findFormHelpPop.do','guidePop','width=730, height=520, scrollbars=YES')
}

//조회
function showPopup(){
	if($("#serchResultInfo").val() == 'Y'){
        window.open('','modifyPwd', 'width=500, height=500');
        $('#frm').attr('action', '/academy/user/modifyPwdPop.do');
        $('#frm').attr('target', 'modifyPwd');
        $('#frm').submit();
	}else{
		alert("인증을 다시해주시기 바랍니다.");
		return;
	}
}

function findId(){
	var test = $("#idSearch");
	test.position().left;
	$('#findId').css('display','block');
	$('#findPw').css('display','none');
	$('#id_loopUp2').css('display','none'); // 아이디 찾기 email 조회
    $('#id_loopUp').css('display','block'); // 아이디 찾기 phone 조회	
	$('#pw_loopUp2').css('display','none'); // 비밀번호 찾기 email 조회
    $('#pw_loopUp').css('display','none'); // 비밀번호 찾기 phone 조회
	
	$('#layer_03').hide(); // 비밀번호	
	$('#pw_loopUp').css('display','none'); // 비밀번호 찾기 조회
	
	
	
	$("#serchResultInfo").val("N"); // 인증여부 초기화
	$('#confirmCode').val(""); // 인증번호 초기화
	
	
	$('#idTitle').css('display','block'); // id 타이틀
	$('#pwTitle').css('display','none'); // pw 타이틀
	 // id 찾기
	 $('input[name=idConfirmBtn]').each(function(index, element) {
		 if ($(this).is(':checked')) {
			  if($(this).val() == 'M'){
		            $('#type_m_id').show();
		            $('#type_s_id').hide();
		            $('#emailSearch').show();
		            $('#phoneSearch').hide();
		            $('#id_loopUp').css('display','none'); // 아이디 찾기 phone 조회	
			       	$('#id_loopUp2').css('display','block'); // 아이디 찾기 email 조회
		            $('#searchMode').val('EMAIL');
		            $("#serchResultInfo").val("N"); // 인증여부 초기화
		        	$('#confirmCode').val(""); // 인증번호 초기화
		        }
		        else {
		        //휴대폰 방식
		            $('#type_m_id').hide();
		            $('#type_s_id').show();
		            $('#phoneSearch').show();
		            $('#emailSearch').hide();
		            $('#id_loopUp2').css('display','none'); // 아이디 찾기 email 조회
		            $('#id_loopUp').css('display','block'); // 아이디 찾기 phone 조회	
		            $('#searchMode').val('MOBILE');
		            $("#serchResultInfo").val("N"); // 인증여부 초기화
		        	$('#confirmCode').val(""); // 인증번호 초기화
		        }
		 }
	});

 
}

function findPw(){
	$('#findPw').css('display','block');
	$('#findId').css('display','none');
	$('#layer_01').css('display','none');
	$('#layer_02').css('display','none');
	$('#id_loopUp2').css('display','none'); // 아이디 찾기 email 조회
    $('#id_loopUp').css('display','none'); // 아이디 찾기 phone 조회	
	$('#pw_loopUp2').css('display','none'); // 비밀번호 찾기 email 조회
    $('#pw_loopUp').css('display','block'); // 비밀번호 찾기 phone 조회
	$("#serchResultInfo").val("N"); // // 인증여부 초기화
	$('#confirmCode2').val("");  // 인증번호 초기화
	
	 $('#idTitle').css('display','none'); // id 타이틀
	 $('#pwTitle').css('display','block'); // pw 타이틀
	
	
	$('input[name=confirmBtn]').each(function(index, element) {
		 if ($(this).is(':checked')) {
	        //이메일 인증
	        if($(this).val() == 'M'){
	            $('#type_m').show();
	            $('#type_s').hide();
	            $('#pw_loopUp2').css('display','block'); // 비밀번호 찾기 email 조회
	            $('#pw_loopUp').css('display','none'); // 비밀번호 찾기 phone 조회
	            $('#emailAuthBtn').show();
	            $("#serchResultInfo").val("N"); // 인증여부 초기화
	        	$('#confirmCode2').val(""); // 인증번호 초기화
	        }
	        else {
	            //휴대폰 인증
	            $('#type_m').hide();
	            $('#type_s').show();
	            $('#pw_loopUp2').css('display','none'); // 비밀번호 찾기 email 조회
	            $('#pw_loopUp').css('display','block'); // 비밀번호 찾기 phone 조회
	            $('#emailAuthBtn').hide();
	            $("#serchResultInfo").val("N"); // 인증여부 초기화
	        	$('#confirmCode2').val(""); // 인증번호 초기화
	        }
		 }
	});
	
}

// 신규비밀번호
function updatePwd(){
		
		//비밀번호 유효성 체크
		var tempPwd = $('#newPassword').val();
		var tempPwdChk = $('#newPasswordCheck').val();

		if(tempPwd != tempPwdChk){
			alert('비밀번호와 비밀번호 확인이 다릅니다.');
			return false;
		}

		var chk_num = tempPwd.search(/[0-9]/g);
		var chk_eng = tempPwd.search(/[a-z]/ig);

		//비밀번호 영문자+숫자 혼용 여부 체크
		if(chk_num < 0 || chk_eng < 0) {
		  alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
		  $('#newPassword').focus();
		  return false;
		}
		
		if('<c:out value="${REQUEST_DATA.userId}"/>' == tempPwd ) {
			alert('아이디와 동일한 값은 입력할수 없습니다.');
			$('#newPassword').focus();
			return false;
		}
		
		//연속된 값 체크
		if(!chkXXX(tempPwd)){
			alert('같은문자를 연속으로 입력할수 없습니다.');
			$('#newPassword').focus();
			return false;
		}
		if(!countChkInt(tempPwd)){
			alert('연속된 숫자는 입력할수 없습니다.');
			$('#newPassword').focus();
			return false;
		}

		//비밀번호 내 특수문자 체크
		if(!sCharChk(tempPwd)){
			alert("특수문자가 1자 이상 기입되어야 합니다.");
			$("#newPassword").focus();
			return false;
		}

		if(tempPwd.indexOf(' ') > -1) {
			alert('공백은 사용 불가능 합니다.');
			$('#newPassword').focus();
			return false;
		}

		if(tempPwd.indexOf('&') > -1) {
			alert('&은 사용 불가능 합니다.');
			$('#newPassword').focus();
			return false;
		}
		//비밀번호 자리수 및 영.숫자 조합 체크
		if(tempPwd.length <9 || tempPwd.length > 14){
			alert('9자 ~ 14자 사이의 비밀번호만 입력 가능합니다.');
			return false;
		}
		
		if(confirm('변경 하시겠습니까?')){
// 			$('#securedPassword').val(fn_encrypt(encodeURIComponent($('#newPassword').val())));

			// 변경 20190508 
			$('#securedPassword').val($('#newPassword').val());
			
			$('#frm').attr('action', '/academy/user/modifyPwdPopExec.do');
		    $('#frm').attr('target', '_self');
		    $('#frm').submit();
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


</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_etc.jsp"%>
            <div class="path">
                        <ul>
                            <li><span class="home text-hide">홈</span></li>
                            <li>로그인</li>
                            <li class="active">아이디/비밀번호 찾기</li>
                        </ul>
                    </div>
            <div class="subConts" id="sub-content">
                  <section class="bgTop_cate07"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			 <h2 class="h2_tit">아이디/비밀번호 찾기</h2>
	            		</div>           	
	          	  </section>
			
			
			<section>
                <div class="bluelineTabWrap">
                    <ul class="bluelineTab">
                        <li class="active"><a title="아이디 찾기" href="javascript:void(1);" id="idSearch" onclick="findId()">아이디 찾기</a></li>
                        <li><a title="비밀번호 찾기" href="javascript:void(1);" id="pwSearch" onclick="findPw()">비밀번호 찾기</a></li>
                    </ul>
                </div>
            </section>
            
            <hr>

            <section>
                <div class="borBoxW3">
                    <p class="po_C7"> 아이디/비밀번호 찾기는 <strong class="po_C4">회원가입 시 사용한 인증방식</strong>으로 조회 가능합니다.</p>
                </div>
            </section>

            <hr>
            
            <section class="tableBox">
               <!--  <h3 class="main_tit">아이디/비밀번호 찾기</h3> -->
                <h3 class="main_tit" id="idTitle">아이디 찾기</h3>
                <h3 class="main_tit" id="pwTitle">비밀번호 찾기</h3>
                <form name="frm" id="frm" method="post" action="">
		            <input type="hidden" name="mobileNumber" id="mobileNumber" value=""/><!--아이디 찾기용 휴대폰번호-->
		            <input type="hidden" name="searchMode" id="searchMode" value="EMAIL"/><!--아이디 찾기용 방식 휴대폰 : MOBILE 이메일 EMAIL (기본체크)-->
		            <input type="hidden" name="multipleEmailSend" id="multipleEmailSend" value="N"/><!-- 이메일 중복찾기 방지-->
		            <input type="hidden" name="smsAuthCode" id="smsAuthCode" value="" /><!-- sms 인증코드 -->
		            <input type="hidden" name="emailAuthCode" id="emailAuthCode" value="" /><!-- email 인증코드 -->
		            <input type="hidden" name="mobile" id="mobile" value="" /><!-- 휴대폰번호-->
		            <input type="hidden" name="email" id="email" value="" />
		            <input type="hidden" name="newUnityPassword" id="newUnityPassword" value="" /><!-- 변경될 비밀번호-->
		            <input type="hidden" name="serchResultInfo" id="serchResultInfo" value="N" /><!-- 조회에 이용-->
		            
		            
		           <input type="hidden" name="userId" id="updateUserId" value="" /><!-- 비밀번호 변경시 필요 -->
		           <input type="hidden" name="userName" id="updateUserName" value="" /><!-- 비밀번호 변경시 필요 -->
		           <input type="hidden" name="mobile" id="updateUserMobile" value="" /><!-- 비밀번호 변경시 필요 -->
		            <input type="hidden" name="email" id="updateUserEmail" value="" /><!-- 비밀번호 변경시 필요 -->
		            <input type="hidden" name="memberYn" id="memberYn" value="" /><!-- 비밀번호 변경시 필요 -->
		            <input type="hidden" name="securedPassword" id="securedPassword" value=""/>
		            
                    <fieldset>
                        <legend>개인정보입력(이름,법정생년월일,휴대전화번호 및 인증)</legend>
                        <div id='findId' class="tblWrap">
                        	
                            <table class="writeForm">
                                <caption>간편로그인개인정보입력</caption>
                                <colgroup>
                                    <col style="width:25%">
                                    <col style="width:*">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">가입인증</th>
                                        <td>
                                            <label title="휴대폰 인증" class="radio-inline">
                                                <input type="radio" name="idConfirmBtn" value="S" id="radio-phone" checked="checked">휴대폰 인증
                                            </label>
                                            <label title="이메일 인증" class="radio-inline">
                                                <input type="radio" name="idConfirmBtn" value="M" id="radio-email">이메일 인증
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="member_name">이름</label></th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group w30">
                                                	<input type="text" id="id_userName" name="id_userName" class="form-control" title="이름 입력" value="">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row"><label for="user_phone">인증번호 발송</label></th>
                                        <td id="type_s_id">
                                            <div class="form-inline phoneNum">
                                                <div class="form-group w20">
                                                    <select id="confirmMobile1" name="confirmMobile1" class="form-control" onchange="javascript:emailSelect('ID',this.value);return false;" title="휴대폰번호 첫자리 선택">
				                                        <option value="010">010</option>
				                                        <option value="011">011</option>
				                                        <option value="016">016</option>
				                                        <option value="017">017</option>
				                                        <option value="018">018</option>
				                                        <option value="019">019</option>
				                                    </select>
                                                </div>
                                                <div class="form-group w20">
                                                	<input type="text" id="confirmMobile2"  class="form-control i-numOnly" name="confirmMobile2" title="휴대폰번호 가운데 자리" maxlength="4"/>
                                                </div>
                                                <div class="form-group w20">
                                                    <input type="text" id="confirmMobile3"  class="form-control i-numOnly" name="confirmMobile3" title="휴대폰번호 끝자리" maxlength="4"/>
                                                </div>
                                                <button onclick="authSmsCheck2();return false" class="btn btn-orange btn-sm" title="인증번호 발송">인증번호 발송</button>
                                            </div>
                                        </td>
                                        <td id="type_m_id">
                                        	<div class="form-inline emailcfm">
                                                <div class="form-group w20">
                                                	<input type="text" id="ID_email1" name="email1" title="이메일 앞주소 입력" class="form-control" value="">
                                                </div>
                                                @&nbsp;
                                                <div class="form-group w20">
                                                	<input type="text" id="ID_email2" name="email2" title="이메일 뒷주소 입력" class="form-control">
                                                </div>
                                                <div class="form-group w20">
                                                	<select id="id_email3" class="form-control" onchange="javascript:emailSelect('ID',this.value);return false;" title="이메일 선택">
				                                        <option value="">직접입력</option>
				                                        <c:forEach var="emap2" items="${categoryData}" varStatus="status2">
												        	<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
												        </c:forEach>
				                                    </select>
                                                </div>
                                                <button onclick="searchEmail('ID');return false;" class="btn btn-orange btn-sm" title="인증번호 발송">인증번호 발송</button>
                                            </div>
										</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="user_phoneConfirm">인증번호 확인</label></th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group w30">
                                                	<input type="text" id="confirmCode" name="confirmCode2" class="form-control i-numOnly" title="인증번호 입력">
                                                </div>
                                                <button onclick="javascript:authStart();return false;" class="btn btn-drkblue btn-sm" title="확인">확인</button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
						
						<div id='findPw' class='tblWrap'>
							<table class="writeForm">
                                <caption>PW 찾기</caption>
                                <colgroup>
                                    <col style="width:25%">
                                    <col style="width:*">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">가입인증</th>
                                        <td>
                                            <label title="휴대폰 인증" class="radio-inline">
                                                <input type="radio" id="confirm02" name="confirmBtn" value="S" checked="checked">휴대폰 인증
                                            </label>
                                            <label title="이메일 인증" class="radio-inline">
                                                <input type="radio" id="confirm01" name="confirmBtn" value="M">이메일 인증
                                            </label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="member_name">아이디</label></th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group w30">
                                                	<input type="text" id="userId" name="userId" class="form-control" title="아이디 입력" value="">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="member_name">이름</label></th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group w30">
                                                	<input type="text" id="pwd_userName" name="pwd_userName" class="form-control" title="이름 입력" value="">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <th scope="row"><label for="user_phone">인증번호 발송</label></th>
                                        <td id="type_s">
                                            <div class="form-inline phoneNum">
                                                <div class="form-group w20">
                                                    <select id="pwdConfirmMobile1" name="pwdConfirmMobile1" class="form-control" onchange="javascript:emailSelect('ID',this.value);return false;" title="휴대폰번호 첫자리 선택">
				                                        <option value="010">010</option>
				                                        <option value="011">011</option>
				                                        <option value="016">016</option>
				                                        <option value="017">017</option>
				                                        <option value="018">018</option>
				                                        <option value="019">019</option>
				                                    </select>
                                                </div>
                                                <div class="form-group w20">
                                                	<input type="text" id="pwdConfirmMobile2"  class="form-control i-numOnly" name="pwdConfirmMobile2" title="휴대폰번호 가운데 자리" maxlength="4"/>
                                                </div>
                                                <div class="form-group w20">
                                                    <input type="text" id="pwdConfirmMobile3"  class="form-control i-numOnly" name="pwdConfirmMobile3" title="휴대폰번호 끝자리" maxlength="4"/>
                                                </div>
                                                <button onclick="authSmsCheck();return false" class="btn btn-orange btn-sm" title="인증번호 발송">인증번호 발송</button>
                                            </div>
                                        </td>
                                        <td id="type_m">
                                        	<div class="form-inline emailcfm">
                                                <div class="form-group w20">
                                                	<input type="text" id="ID2_email1" name="ID_email1"  title="이메일 앞주소 입력" class="form-control">
                                                </div>
                                                @&nbsp;
                                                <div class="form-group w20">
                                                	<input type="text" id="ID2_email2" name="ID_email2"  title="이메일 뒷주소 입력" class="form-control">
                                                </div>
                                                <div class="form-group w20">
                                                	<select id="id_email4" onchange="javascript:emailSelect2('ID2',this.value);return false;" title="이메일 선택" class="form-control">
				                                        <option value="">직접입력</option>
				                                        <c:forEach var="emap2" items="${categoryData}" varStatus="status2">
												        	<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
												        </c:forEach>
				                                    </select>
                                                </div>
                                                <button onclick="searchEmail('PWD');return false;" class="btn btn-orange btn-sm" title="인증번호 발송">인증번호 발송</button> 
                                            </div>
										</td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><label for="user_phoneConfirm">인증번호 확인</label></th>
                                        <td>
                                            <div class="form-inline">
                                                <div class="form-group w30">
                                                	<input type="text" id="confirmCode2" name="confirmCode2" class="form-control i-numOnly" title="인증번호 입력" value="">
                                                </div>
                                                <button onclick="javascript:authStart2();return false;" class="btn btn-drkblue btn-sm" title="확인">확인</button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                    	</div>
                    </fieldset>
                </form>
                <div class="btnAreaC" id="id_loopUp">
                	<hr>
                    <button type="button" name="id_loopUpPhone" id="id_loopUpPhone" class="btn btn-lg btn-blue w130" onclick="javascript:findIdPw('ID' , 'phone')" title="조회">조회</button>
                </div>
                
                <div class="btnAreaC" id="id_loopUp2">
                	<hr>
                	 <button type="button" name="id_loopUpEmail" id="id_loopUpEmail" class="btn btn-lg btn-blue w130" onclick="javascript:findIdPw('ID' , 'email')" title="조회">조회</button>
                </div>
                
                <div class="btnAreaC" id="pw_loopUp">
                	<hr>
                    <button type="button" name="pw_loopUpPhone" id="pw_loopUpPhone" class="btn btn-lg btn-blue w130" onclick="javascript:findIdPw2('PWD' , 'phone')" title="조회">조회</button>
                </div>
                
                <div class="btnAreaC" id="pw_loopUp2">
                	<hr>
                	<button type="button" name="pw_loopUpEmail" id="pw_loopUpEmail" class="btn btn-lg btn-blue w130" onclick="javascript:findIdPw2('PWD' , 'email')" title="조회">조회</button>
                </div>
                
            </section>
            
            <section class="mrg_t30">
                <div class="idwpMsg" id="layer_01">
                    <p class="bold fnt16 po_C9">회원님의 아이디는 <span class="po_C4">sangs1</span> 입니다.</p>
                </div>

                <div class="btnAreaC mrg_t30" id="layer_02">
                	<a href="/academy/common/login.do" class="btn btn-lg btn-blue2" title="로그인 바로가기">로그인 바로가기</a>
                </div>
            </section>
             
            <section id="layer_03">
            	<form>
            		<fieldset>
            			<legend>신규 비밀번호 입력</legend>
            			<div class="tblWrap">
            				<table class="writeForm">
            					<caption>신규 비밀번호 입력/확인</caption>
            					<colgroup>
            						<col style="width:25%">
            						<col style="width:*">
            					</colgroup>
            					<tbody>
            						<tr>
            							<th scope="row"><label for="newPassword">신규 비밀번호</label></th>
            							<td>
            								<div class="form-inline">
            									<div class="form-group">
            										<input type="password" autocomplete="off" class="form-control" id="newPassword" name="newPassword" title="새 비밀번호">
            									</div>
            								</div>
            							</td>
            						</tr>
            						<tr>
            							<th scope="row"><label for="newPasswordCheck">신규 비밀번호 확인</label></th>
            							<td>
            								<div class="form-inline">
            									<div class="form-group">
            										<input type="password" autocomplete="off" class="form-control" id="newPasswordCheck" name="newPasswordCheck" title="새 비밀번호 확인">
            									</div>
            								</div>
            							</td>
            						</tr>
            						
            					</tbody>
            				</table>
            			</div>
            		</fieldset>
            	</form>
            	
            	<hr>
            	
            	<div class="btnAreaC">
            		<button type="button" name="button" class="btn btn-lg btn-blue w130" onclick="updatePwd();return false" title="변경">변경</button>
            	</div>
            </section>
	
		</div><!-- //sub-contents -->
		</div>
	</article>
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->