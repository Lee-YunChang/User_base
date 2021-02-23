<%
/****************************************************
	system	: academy > 회원 > 비밀번호 변경 팝업창
	title	: 비밀번호 변경 팝업창
	summary	:	
	wdate	: 2015-03-02
	writer	: kim hak gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge; requiresActiveX=true;" />
<!-- 이니페이 관련 META정보 -->
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/>

<title>상상스토리 사용자포털</title>

<link rel="stylesheet" href="<c:out value='/academy/common/css/common.css'/>" type="text/css" />  

<head>

<script type="text/javascript">

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

function submitPwd1(){
	
	if('' == $('#unityPassword').val()){
		alert('기존비밀번호를 입력해 주세요.');
		$('#unityPassword').focus();
		return false;
	} else if('' == $('#newUnityPassword').val() || '' == $('#newUnityPasswordChk').val()){
		alert('변경할 비밀번호를 입력해 주세요.');
		$('#newUnityPassword').focus();
		return false;
	}else {

		ajaxSubmit('/academy/user/member/searchPwd.do',
				{  	userId : $('#userid').val(),
					pwd : $('#unityPassword').val()
				}, 'json',
				eval('submitPwd2')
		);
		
	}
}

function submitPwd2(data){
	if(data == 0){
		alert('입력한 비밀번호와 기존비밀번호가 다릅니다.');
		return false;
	} else {
	
	//비밀번호 유효성 체크
	var tempPwd = $('#newUnityPassword').val();
	var tempPwdChk = $('#newUnityPasswordChk').val();

	if(tempPwd != tempPwdChk){
		alert('비밀번호와 비밀번호 확인이 다릅니다.');
		return false;
	}

	var chk_num = tempPwd.search(/[0-9]/g);
	var chk_eng = tempPwd.search(/[a-z]/ig);

	//비밀번호 영문자+숫자 혼용 여부 체크
	if(chk_num < 0 || chk_eng < 0) {
	  alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.');
	  $('#newUnityPassword').focus();
	  return false;
	}
	
	if("<c:out value='${unityMberInfo.USERID}'/>" == tempPwd ) {
		alert('아이디와 동일한 값은 입력할수 없습니다.');
		$('#newUnityPassword').focus();
		return false;
	}
	
	//연속된 값 체크
	if(!chkXXX(tempPwd)){
		alert('같은문자를 연속으로 입력할수 없습니다.');
		$('#newUnityPassword').focus();
		return false;
	}
	if(!countChkInt(tempPwd)){
		alert('연속된 숫자는 입력할수 없습니다.');
		$('#newUnityPassword').focus();
		return false;
	}

	//비밀번호 내 특수문자 체크
	if(!sCharChk(tempPwd)){
		alert('특수문자가 1자 이상 기입되어야 합니다.');
		$('#newUnityPassword').focus();
		return false;
	}

	if(tempPwd.indexOf(" ") > -1) {
		alert('공백은 사용 불가능 합니다.');
		$('#newUnityPassword').focus();
		return false;
	}

	if(tempPwd.indexOf('&') > -1) {
		alert('&은 사용 불가능 합니다.');
		$('#newUnityPassword').focus();
		return false;
	}
	
	//비밀번호 자리수 및 영.숫자 조합 체크
	if(tempPwd.length <9 || tempPwd.length > 14){
		alert('9자 ~ 14자 사이의 비밀번호만 입력 가능합니다.');
		return false;
	}
	
	
	opener.document.frm.newUnityPassword.value = $('#newUnityPassword').val();
	alert('하단의 회원정보 변경’ 버튼을 눌러주셔야 비밀번호 변경이 적용됩니다.');
	window.close();
	
	}
	
}

</script>



</head>
<body>
	<div id="popup">
		<div class="pop_header clearfix">
			<h1>비밀번호 변경</h1>
			<a href="#" title="닫기"><img src="/academy/images/ico_pop_close.png" alt="닫기" /></a>
		</div>

		<div class="pop_wrap">

			<form name="pw_change_form" id="pw_change_form" action="" method="post">
			<input type="hidden" name="userid" id="userid" value="<c:out value="${REQUEST_DATA.SES_USERID}"/>"/>
			
			<div class="shadow_box">
				<div class="yellow_box small">
					<p>비밀번호는 <strong class="t_blue">9자~14자 사이의 영문·숫자·특수문자 조합</strong>(공백, '&' 제외)을 입력하시면 됩니다.</p>
					<p>개인정보 보안을 위해 아이디와 동일한 또는 연속숫자 비밀번호는 등록되지 않습니다.</p>
					<p>개인정보 보안을 위해 아이디와 동일한 또는 4자리 연속 동일문자 비밀번호는 등록되지 않습니다.</p>
				</div>
			</div>

			<div class="table_box">
					<table cellpadding="0" cellspacing="0" class="col_type">
						<caption>비밀번호 변경:상상스토리 교육시스템의 비밀번호 변경입니다.</caption>
						<colgroup>
							<col width="150px"/>
							<col width="" />
						</colgroup>
						<tbody>
							<tr>
								<th><label for="unityPassword">기존 비밀번호</label></th>
								<td>
									<input type="password" autocomplete="off" id="unityPassword" id="unityPassword" style="width: 70%;" title="기존 비밀번호 입력"/>
								</td>
							</tr>
							<tr>
								<th><label for="newUnityPassword">새 비밀번호</label></th>
								<td>
									<input type="password" autocomplete="off" id="newUnityPassword" name="newUnityPassword" style="width: 70%;" title="새 비밀번호 입력"/>
								</td>
							</tr>
							<tr>
								<th><label for="newUnityPasswordChk">새 비밀번호 확인</label></th>
								<td>
									<input type="password" autocomplete="off" id="newUnityPasswordChk" name="newUnityPasswordChk" style="width: 70%;" title="새 비밀번호 확인"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_area clearfix">
					<div class="btn_group_center">
						<a href="#" class="btn big orange" onclick="javascript:submitPwd1();return false;" title="확인">확인</a><a href="javascript:close();" class="btn big gray">취소</a>
					</div>
				</div>

			</form>

		</div><!-- //.pop_wrap -->
	</div>
</body>
</html>
