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
	$('#unityPassword').bind('keydown', function(e) {
	    if (e.keyCode == 13) { // enter key
	    	registMember();

	        return false;
	    }
	});
});

function registMember(){
    var securedPassword      = fn_encrypt(encodeURIComponent($('#unityPassword').val()));
    
    var rsaPublicKeyModulus  = $("#rsaPublicKeyModulus").val();
    var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
    submitEncryptedForm(securedPassword, rsaPublicKeyModulus, rsaPublicKeyExponent);
}

function submitEncryptedForm(password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
    // 사용자ID와 비밀번호를 RSA로 암호화한다.
     var securedPassword = rsa.encrypt(password);
    ajaxSubmit('/academy/user/member/searchPwd.do',
			{  	userId : '<c:out value="${REQUEST_DATA.SES_USERID}"/>',
				pwd : securedPassword
			}, 'json',
			eval('registMember2')
	);
}




//회원탈퇴 실행
function registMember2(data){
	if(data === '1'){
		if($('#unityPassword').val() ==''){
			alert("비밀번호를 입력해 주세요.");
			$('#unityPassword').focus();
			return false;
		}
		
		if(confirm('탈퇴 하시겠습니까?')){
			$('#userNo').val('<c:out value="${REQUEST_DATA.SES_USERNO}"/>');
			$('#frm').attr('action','/academy/myclass/memberCancelExec.do');
			$('#frm').submit();
		} 
		
	}else if(data === '0') {
		alert('비밀번호가 틀렸습니다.');
		return false;
	} else {
		alert('알수없는 오류가 발생하였습니다.');
		return false;
		
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
			 <div class="subConts">
                 <section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">개인정보관리</h2>
            		</div>      
                  </section>

				  <section>
                      <div class="borBoxW3">
                          <p class="po_C7">회원탈퇴 시 귀하의 <strong class="po_C10">개인정보는 전부 삭제</strong>됩니다.</p>
                          <p class="po_C7 bold">탈퇴 후에는 수강중인 과정을 수강 할 수 없습니다.</p>
                      </div>
                  </section>
				
				   <hr>
					
				  <section class="tableBox">
                       <form name="frm" id="frm" action="/academy/user/member.do" method="post">
                       <input type="hidden" name="userNo" id="userNo" value="">
                       <input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" >
                       <input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" >
                         	
                           <fieldset>
                               <legend>회원탈퇴</legend>
                               <div class="tblWrap">
                                   <table class="writeForm">
                                       <caption>회원탈퇴</caption>
                                       <colgroup>
                                           <col style="width:25%">
                                           <col style="width:*">
                                       </colgroup>
                                       <tbody>

                                           <tr>
                                               <th scope="row"><span class="po_C2">*</span> 아이디</th>
                                               <td>
                                                   <span><c:out value="${REQUEST_DATA.SES_USERID}"/></span>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><span class="po_C2">*</span> <label for="out_cause">탈퇴사유</label></th>
                                               <td>
                                                   <select name="secsnEtc" class="form-control cause" id="secsnEtc" title="탈퇴사유선택">
                                                       <c:forEach items="${mtCancelCodeList}" var="result">
															<option value="<c:out value="${result.MT_SUB_CODE}"/>"><c:out value="${result.MT_SUB_NAME}" escapeXml="false"/></option>
													   </c:forEach>
                                                   </select>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="row"><span class="po_C2">*</span> <label for="member_pw">비밀번호</label></th>
                                               <td>
                                                   <input type="password" autocomplete="off" class="form-control-static" id="unityPassword" title="비밀번호 확인">
                                               </td>
                                           </tr>

                                       </tbody>
                                   </table>
                               </div>

                           </fieldset>
                       </form>

                       <div class="btnAreaC mrg_t30 memberEdit">
                           <a title="확인" name="button" onclick="registMember();return false;" class="btn btn-lg btn-blue">확인</a>
                           <a title="취소" href="/academy/myclass/memberModifyAuthForm.do" name="button" class="btn btn-lg btn-gray">취소</a>
                       </div>
                   </section>

			</div><!-- //subConts -->

		</div><!-- //subCntWrap -->
		
	</article>
</div><!-- //container -->


<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->