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
			$('#securedPassword').val(fn_encrypt(encodeURIComponent($('#newPassword').val())));
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
                    <li class="active">ID/PW 찾기</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
                <section class="contTop">                    
                    <h2 class="h2_tit">ID/PW 찾기</h2>
                </section>

			<div class="sub-tit">
				<h3>아이디&amp;비밀번호 찾기</h3>
				<p>상상스토리에 오신 여러분을 환영합니다. 회원이 되시면 다양한 서비스 및 교육콘텐츠를 이용하실 수 있습니다.</p>
			</div>
			
				<form name="frm" id="frm" method="post" action="">
		            <input type="hidden" name="userId" id="userId" value="<c:out value="${REQUEST_DATA.updateUserId}"/>"/>
		            <input type="hidden" name="userName" id="userName" value="<c:out value="${REQUEST_DATA.updateUserName}"/>"/>
		            <input type="hidden" name="mobile" id="mobile" value="<c:out value="${REQUEST_DATA.updateUserMobile}"/>"/>
		            <input type="hidden" name="email" id="email" value="<c:out value="${REQUEST_DATA.updateUserEmail}"/>"/>
		            <input type="hidden" name="securedPassword" id="securedPassword" value=""/>
				<div class="bg-box">
					<ul class="symbol-list c-blue">
						<li>비밀번호는 <strong class="t_blue">9자~14자 사이의 영문·숫자·특수문자 조합</strong>(공백, '&' 제외)을 입력하시면 됩니다.</li>
						<li>개인정보 보안을 위해 아이디와 동일한 또는 연속숫자 비밀번호는 등록되지 않습니다.</li>
						<li>개인정보 보안을 위해 아이디와 동일한 또는 4자리 연속 동일문자 비밀번호는 등록되지 않습니다.</li>
					</ul>
				</div>

				<h3 class="con-tit">새 비밀번호</h3>
				<div class="con-tbl mb30">
					<table class="sub-table join idpw-serch">
						<caption>새 비밀번호 입력 : 이 표는 새 비밀번호 테이블-새 비밀번호 입력입니다.</caption>
						<colgroup>
							<col style="">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">새 비밀번호</th>
								<td>
									<input type="password" autocomplete="off" id="newPassword" name="newPassword" class="inputtxt small" title="새 비밀번호">
								</td>
							</tr>
							<tr>
								<th scope="row">새 비밀번호 확인</th>
								<td>
									<input type="password" autocomplete="off" id="newPasswordCheck" name="newPasswordCheck" class="inputtxt small" title="새 비밀번호 확인">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
						<p class="ac mb20">
							<a href="#layer_05" title="비밀번호 저장" class="btn signup pd30" onclick="updatePwd();return false">저장</a>
						</p>
				</form>
			</div><!-- //sub-contents -->
			

		</div>
	</article>
</div>

    <!-- 풋터 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
    <!-- // 풋터 영역 -->