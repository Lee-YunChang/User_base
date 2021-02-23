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
<script type="text/javascript">

$(document).ready(function(){
	$('.modal-backdrop').click(function(){
		$('.modal-backdrop').hide();
		$("#join_notice_pop").hide();
	})
});

$(function() {
	$("#join_notice_pop").css('display', 'block');
	$('.modal-backdrop').attr('style','height:'+300+'px; '+'z-index:100;');
});

// 팝업 닫기
function layerPop() {
	$("#join_notice_pop").css('display', 'none');
	$('.modal-backdrop').hide();
  
}

function authModule(type) {
	
	var authType = type;
	
	if('I' == authType) {
		var popupWindow = window.open("/academy/common/kcbIpin.do", "kcbIpinPop", "left=500, top=50, status=0, width=450, height=550");
		popupWindow.focus();
	} else if('H' == authType) {
		var popupWindow = window.open("/academy/common/kcbMobile.do", "kcbMobilePop", "left=500, top=50, status=0, width=450, height=550");
		popupWindow.focus();
	}
	
}

// 본인인증 후, 개인정보 비교
function authType(type, result) {
	
	var authType = type;
	var authResult = result;

	if("IPIN" == authType) {
		$('#authMode').val('I');
	} else if("PHONE" == authType) {
		$('#authMode').val('P');
	} 
	
	if(("B000" == authResult) || ("T000" == authResult) ) {
		$('#authResult').val('Y');
	} else {
		$('#authResult').val('N');
	}
	
	
	// LMS_CT_UNITY_MBER 정보 비교
	ajaxSubmit('/academy/user/memberCompareInfo.do',
			
	        {   
				authMode : $('#authMode').val(),
				mbernm : $('#mbernm').val(),
				brthdy : $('#brthdy').val(),
				moblphon : $('#moblphon1').val() + $('#moblphon2').val() + $('#moblphon3').val(),
				userId : $('#userId').val()
	        }, 'json',
	        eval('resultCompareInfo')
	);
}

function resultCompareInfo(data) {
	
	if(data > 0) {
		
		$('#moblphon').val($('#moblphon1').val() + '-' + $('#moblphon2').val() + '-' + $('#moblphon3').val());
		
		$.ajax({
			url : "/academy/user/memberUpdateInfo.do",
			data : {
						mbernm : $('#mbernm').val(),
						brthdy : $('#brthdy').val(),
						moblphon : $('#moblphon').val(),
						di : $('#di').val(),
						authMode : $('#authMode').val(),
						userId : $('#userId').val()
					},
            dataType : "json",
            type : 'post',
            success : function(data){
            	if(data == "SUCCESS") {
	            	if(confirm("인증되었습니다. 로그인페이지로 이동하시겠습니까?") == true) {
	            		$('#frm').attr('action', '/academy/common/login.do');
	        			$('#frm').submit();
	            	}
            	} else {
            		alert("본인인증 실패시 관라자에게 문의해주시기 바랍니다. 문의 전화번호 : 1600-4931");
            	}
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
		});
		
	} else if(data == 0) {
		alert('정보가 일치하지않습니다. 관리자에게 문의해주시기 바랍니다. 문의 전화번호 : 1600-4931');
		return false;
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

              
              <form name="frm" id="frm" action="/academy/common/loginExec.do" method="post"  target="_self">
				<input type="hidden" name="subcmd" value="exec"/>
				<input type="hidden" name="site" value="academy"/>
				<input type="hidden" name="returnUrl" value="<c:out value="${REQUEST_DATA.returnUrl}"/>" />
				<input type="hidden" name="securedUserId" id="securedUserId" value="" />
				<input type="hidden" name="securedPassword" id="securedPassword" value="" />
				<input type="hidden" id="rsaPublicKeyModulus" value="<c:out value="${publicKeyModulus}"/>" />
				<input type="hidden" id="rsaPublicKeyExponent" value="<c:out value="${publicKeyExponent}"/>" />
				<input type="hidden" name="pollcseqno" id="pollcseqno" value="<c:out value="${REQUEST_DATA.pollcseqno}"/>" />
				<input type="hidden" name="smsAuthCode" id="smsAuthCode" value="" /><!-- sms 인증코드 -->
				<input type="hidden" name="authCheckYn" id="authCheckYn" value="N" /><!-- 인증여부 -->
				<input type="hidden" name="userId" id="userId" value="<c:out value='${REQUEST_DATA.userId}'/>"/>
			
				<input type="hidden" name="authResult" id="authResult" value=""/>
				<input type="hidden" name="authMode" id="authMode" value=""/>
              	<input type="hidden" name="mbernm" id="mbernm" value=""/>
              	<input type="hidden" name="brthdy" id="brthdy" value=""/>
              	<input type="hidden" name="sex" id="sex" value=""/>
              	<input type="hidden" name="di" id="di" value=""/>
              	<input type="hidden" name="moblphon" id="moblphon" value=""/>
              	<input type="hidden" name="moblphon1" id="moblphon1" value=""/>
              	<input type="hidden" name="moblphon2" id="moblphon2" value=""/>
              	<input type="hidden" name="moblphon3" id="moblphon3" value=""/>
              	
			  <div class="borBoxOldJoin">
			  	<h3 class="fnt20 po_C6" id="memberTypeText1">상상스토리 금융교육포털을 이용하실 때는 최초 1회 가입인증이 필요합니다.</h3>
	            <h3 class="fnt21 po_C6" id="memberTypeText2">아래 인증 방식을 선택하여 인증해주세요.</h3>
			  	<div class="joinBox3">
			  		<ul class="sel_type">
			  			<li>
			  				<a href="#none" onclick="authModule('H');return false;">
			  					<span class="label_img01"></span>
			  					<span class="txtAuth">휴대폰 인증</span>
			  					<span class="txt">본인명의 휴대폰번호로<br />본인인증</span>
			  				</a>
			  			</li>
			  			
			  			<li>
			  				<a href="#none" onclick="authModule('I');return false;">
			  					<span class="label_img02"></span>
			  					<span class="txtAuth">아이핀 인증</span>
			  					<span class="txt">휴대폰번호 없이<br />본인인증</span>
			  				</a>
			  			</li>
			  		</ul>
			  	</div>
			  	
			  	<div class="joinBox2">
					<p>· 상상스토리은 회원 가입시에는 주민등록번호를 수집하지 않습니다.</p>
					<p>· 신용카드 인증은 가입하시는 분 명의의 카드로만 인증이 가능합니다.</p>
					<p>· 인증이 되지 않을 경우, 상상스토리 콜센터(1600-4931)로 문의하시기 바랍니다.</p>
				</div>
			  </div> <!-- borBoxJoin -->
			</form>
			
          </div>
      </div>
  </article>
</div>



<!-- POP_UP START -->
<article id="join_notice_pop" style="display: none; z-index: 100">
	<div class="normal main_notice_pop" tabindex="1" style="border: 0px;">
		<div class="modal-content" >
			<div class="modal-header" tabindex="1">
				<button tabindex="1" type="button" class="close"
					onclick="layerPop(); return false" title="닫기">
					<span aria-hidden="true" class="text-hide">닫기</span>
				</button>
				<h4 class="modal-title" id="jijumLabel">공지사항</h4>
			</div>
		</div>
		
		<div class="modal-body" style="height: 190px; overflow-y: auto" tabindex="1">
			<div class="infoBox">
				<p class="mrg_t10">2019년 4월 15일 부로</p>
				<p class="mrg_t10">본인인증 후 사이트 이용이 가능합니다.</p>
				<p class="mrg_t15">안전한 사이트 이용을 위하여 본인인증을 부탁드립니다.</p>
			</div>
		</div>
	</div>
</article>

<!-- POP_UP END -->
<!-- //popup -->
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->