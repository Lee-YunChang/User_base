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
<script type="text/javascript" src="/academy/common/js/jquery.showLoading.js"></script>
<script type="text/javascript">

$(document).ready(function(){

});

//모바일 인증발송 AJAX
function authSmsCheck(){

/* 	if($('#moblphon3').val().length != 4){
		alert('휴대폰번호는 4자리수까지 입력이 가능합니다.');
		$('#confirmMobile3').focus();
		return;
	} */
	
   /*  if($('#moblphon1').val() == '' ||  $('#moblphon2').val() == '' ||  $('#moblphon3').val() == '') {
        alert('휴대폰번호를 적어주세요.');
    }  */
	if($('#mbernm').val() == ''){
	      alert('이름을 입력해 주세요.');
	      $("#mbernm").focus();
	      return false;
	 }else  if($('#brthdy').val() == ''){ 
	      alert('생년월일을 입력해 주세요.');
	      $("#brthdy").focus();
	      return false; 
	 }else if($('#moblphon2').val() == ''){
		 alert('휴대폰 번호를 입력해 주세요.');
	     $("#moblphon2").focus();
	     return false;
	}else  if($('#moblphon3').val() == ''){
		 alert('휴대폰 번호를 입력해 주세요.');
       	 $("#moblphon3").focus();
      	 return false; 
	}else {
    	var moblphon = $('#moblphon1').val()+'-'+$('#moblphon2').val()+'-' +$('#moblphon3').val();
    	var mbernm = $("#mbernm").val();
    	var brthdy = $('#brthdy').val();
        ajaxSubmit('/academy/user/member/authSmsCheckJoin2.do',{moblphon : moblphon, mbernm : mbernm, brthdy: brthdy}, 'json', eval('authSmsCheckCallBack'));
    	
    	
       /*  var mobile = $('#moblphon1').val() + '-'+$('#moblphon2').val() + '-' +$('#moblphon3').val() ;
        ajaxSubmit('/academy/user/member/authSmsCheckJoin.do'
        	,{ mobile : mobile , userName : $('#mbernm').val() , nonMembrthdy : $("#brthdy").val()}
        	, 'json', eval('authSmsCheckCallBack')); */
    }
}

//휴대폰 인증발송 AJAX
function authSmsCheckCallBack(data){
    //중복일경우 메시지 출력
    if(data.result == 'Y') {
        alert('인증번호가 발송되었습니다.');
        $('#smsAuthCode').val(data.authCode);
        $('#confirmCode').val(data.authCode);
        
       // alert(data);
    }else if(data.result == 'FAIL') {
        alert('휴대폰 인증중에 오류가 발생하였습니다.');
        $('#smsAuthCode').val("N");
        
 	 // 회원정보가 틀릴경우
 	} else if(data.result == 'DUP' || data.result == 'NOT') {
        alert('일치하는 정보가 없습니다.');
        $('#smsAuthCode').val("N");
        $('#confirmCode').val("");
    } 
}


//인증 실행
function authStart(){

	$('#confirmCode').val(); // 사용자가 입력한 인증코드
	$('#smsAuthCode').val(); // SMS로 발송된 인증코드
	
	
     //휴대폰 인증
	
        //인증번호 틀림
        if($('#confirmCode').val() != $('#smsAuthCode').val()){

            //인증번호 틀림 메시지출력
            alert('잘못된 인증번호 입니다.');
            $('#authCheckYn').val('N');
        }

        //인증 성공
        if(($('#confirmCode').val() != '' && $('#smsAuthCode').val() != '') && ($('#confirmCode').val() == $('#smsAuthCode').val())){
            alert('인증 되었습니다.');

            $("#authMode").val("S");
            $('#authCheckYn').val('Y');
        }

    
    
}
function nonMemsubmitCheck() {
	 var tUserName = $('#mbernm').val();
	 tUserName = tUserName.replace(/ /gi, '');
	
	 if($('#mbernm').val() == ''){
	        alert('이름을 입력해 주세요.');
	        $("#mbernm").focus();
	        return false;
	 }else  if($('#brthdy').val() == ''){ 
	        alert('생년월일을 입력해 주세요.');
	        $("#brthdy").focus();
	        return false; 
	 }else  if($('#brthdy').val().length != 6){  
	        alert('생년월일을 6자리 입력해 주세요.');
	        $("#brthdy").focus();
	        return false; 
	 }else  if($('#moblphon2').val() == ''){
			 alert('휴대폰 번호를 입력해 주세요.');
		     $("#moblphon2").focus();
		     return false;
     }else  if($('#moblphon3').val() == ''){
    		 alert('휴대폰 번호를 입력해 주세요.');
	        $("#moblphon3").focus();
	        return false; 
	 }else if('N' == $('#authCheckYn').val()) {
			alert('인증후 로그인 가능합니다');
			$('#confirmCode').focus();
			return;
	}
	
	/* if($('#mbernm').valueEmpty('이름을 입력해 주세요')) return;
	if($('#brthdy').valueEmpty('생년월일을 입력해 주세요')) return;
	if($('#moblphon1').valueEmpty('휴대폰번호 앞 3자리를 입력해 주세요')) return;
	if($('#moblphon2').valueEmpty('휴대폰번호 입력해 주세요')) return;
	if($('#moblphon3').valueEmpty('휴대폰번호 입력해 주세요')) return;
	
	if('N' == $('#authCheckYn').val()) {
		alert('인증번호를 확인해 주세요');
		$('#confirmCode').focus();
		return;
	}
	 */
	 
	 
	//이용약관 동의
	if($('#termAgree:checkbox:checked').length == 0){
		alert('회원이용악관에 동의해야 가입 가능합니다.');
		$('#termAgree').focus();
		return;	
	}
	 
	 
	
	$('#moblphon').val($('#moblphon1').val()+"-"+$('#moblphon2').val()+"-"+$('#moblphon3').val());
	
	var frm = document.getElementById("frm");
	$('#frm').attr('action', '/academy/user/nonMemberLoginExec.do');
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
                 <li class="active currentNavi">간편 로그인</li>
             </ul>
         </div>
          <div class="subConts" id="sub-content">
              <section class="contTop">
                  
                  <h2 class="h2_tit">간편 로그인</h2>
              </section>
              <form name="frm" id="frm" action="/academy/common/nonMemberLoginExec.do" method="post"  target="_self">
				<input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />
				<input type="hidden" name="smsAuthCode" id="smsAuthCode" value="" /><!-- sms 인증코드 -->
				<input type="hidden" name="authCheckYn" id="authCheckYn" value="N" /><!-- 인증여부 -->
				<input type="hidden" name="moblphon" id="moblphon" value="" />

              
			
			<div id="nonLoginArea" >
				<section>
				     <div class="borBoxW3">
				         <p clas="po_C7">간편 로그인 시, 교육 (이하 내용 필요)<br>
				  수강내역 확인 시 입력한 정보로만 확인가능 합니다. <strong class="po_C4">입력한 내용을 꼭 확인</strong>해주세요.</p>
				     </div>
				  </section>
				
				  <hr>
				
				  <section class="tableBox">
				     <p class="rbltopTxt"><strong class="po_C2">* 모든 항목은 필수 항목 입니다.</strong></p>
				         <fieldset>
				             <legend>개인정보입력(이름,법정생년월일,휴대전화번호 및 인증)</legend>
				             <div class="tblWrap">
				                 <table class="writeForm">
				                     <caption>간편로그인개인정보입력</caption>
				                     <colgroup>
				                         <col style="width:25%">
				                         <col style="width:*">
				                     </colgroup>
				                     <tbody>
				                         <tr>
				                             <th scope="col"><label for="mbernm">이름</label></th>
				                             <td>
				                             	<div class="form-inline">
                                                     <div class="form-group w30">
                                                         <input type="text" class="form-control" id="mbernm" name="mbernm">
                                                     </div>
                                                 </div>
				                             </td>
				                         </tr>
				                         <tr>
				                             <th scope="row"><label for="brthdy">법정 생년월일</label></th>
				                             <td>
				                                 <input type="text" class="form-control-static inputNum i-numOnly" id="brthdy" name="brthdy" maxlength="6">
				                                 &nbsp; - &nbsp;
				                                 ********
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
				                                         <input type="text" class="form-control i-numOnly" id="moblphon2" title="휴대폰번호 둘째자리" maxlength="4">
				                                     </div>
				                                     
				                                     <div class="form-group w20">
				                                         <input type="text" class="form-control i-numOnly" id="moblphon3" title="휴대폰번호 셋째자리" maxlength="4">
				                                     </div>
				                                     <button title="인증번호 발송" type="button" onclick="authSmsCheck();return false" class="btn btn-orange btn-sm">인증번호 발송</button>
				                                 </div>
				                             </td>
				                         </tr>
				                         <tr>
				                             <th scope="row"><label for="confirmCode">인증번호 확인</label></th>
				                             <td>
				                             	<div class="form-inline">
                                                    <div class="form-group w30">
                                                        <input type="text" class="form-control i-numOnly" id="confirmCode" name="confirmCode" >
                                                    </div>
                                                    <button title="확인" type="button" onclick="authStart(); return false;"  class="btn btn-drkblue btn-sm">확인</button>
                                                </div>
				                             </td>
				                         </tr>
				                     </tbody>
				                 </table> 
				             </div>
				
				         </fieldset>
				  </section>
				</div>
			  <hr>
			</form>
			  <section>
			     <h3 class="sub_tit">개인정보의 수집목적 및 항목</h3>
			     <div class="borBox">
			         <div class="terms">
			             <h4 class="po_C9 fnt13">개인정보의 수집·이용 목적</h4>
	                                  <p>① 회원가입 및 관리</p>
					  <p>② 교육 관련 서비스 제공: 교육 프로그램 참여, 교육 일정 안내, 교육 자료 발송, 이벤트 안내, 교육 및 진흥원 서민금융 관련 마케팅 등</p>
					  <p>③ 기타: 서비스의 유효성 확인, 접속빈도 파악, 회원의 서비스 이용에 대한 통계</p>
	                                  <hr class="hr_20">
	                                  
	                                  <h4 class="po_C9 fnt13">수집 · 이용하는 개인정보의 항목</h4>
	                                  <p>가. 수집정보</p>
									  <p>필수정보 : 휴대폰번호, 아이디, 비밀번호(비밀번호 확인), 이름, 성별, 생년월일, 이메일 주소, 주소, 회원구분, 지점</p>
									  <br/>
									  <p>나. 기타정보</p>
									  <p>서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.</p>
									  <br/>
									  <p>※ IP Address, 쿠키, 방문일시, 서비스 이용 및 제공 기록 등</p>
									  <hr class="hr_20">
									  
									  <h4 class="po_C9 fnt13">개인정보의 보유 및 이용기간</h4>
	                                  <p>상상스토리이 교육 홈페이지 서비스 이용과 관련하여 수집한 개인정보는 관계법령 등의 규정에 의하며 기록·보존하고, 기간이 경과할 경우 「개인정보보호법」 등에서 정하는 바에 따라 파기합니다. 단, 관계법령에서 의하여 정보보유 사유가 발생한 때에는 법률에서 정한 기간 동안 정보를 보존합니다.</p>
	                                  <hr class="hr_20">
									  
									  <h4 class="po_C9 fnt13">동의 거부 권리 및 동의 거부 시 불이익</h4>
                                  	  <p>위 개인정보 중 필수적 정보의 수집·이용에 관한 동의는 계약의 체결 및 이행을 위하여 필수적이므로, 위 사항에 동의하셔야만 위 계약의 설정 및 유지가 가능합니다. </p>
					 
	                                  <hr class="hr_20">

					 		<h4 class="po_C9 fnt13">개인정보의 마케팅 활용</h4>
						

							<p> 교육정보, 이벤트, 뉴스레터 제공 등의 부가서비스를 받으실 수 있습니다.
</p>
			         </div>
			         <form action="">
			             <div class="agreeCheck text-right">
			                 <input type="checkbox" value="" id="termAgree">
			                 <label for="termAgree">동의합니다</label>
			             </div>
			         </form>
			     </div>
			     <div class="btnAreaC mrg_t30">
			         <button title="로그인" type="button" name="button" class="btn btn-lg btn-blue" onclick="nonMemsubmitCheck(); return false;">로그인</button>
			     </div>
			  </section>
          </div>
      </div>
  </article>
</div>


<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->
