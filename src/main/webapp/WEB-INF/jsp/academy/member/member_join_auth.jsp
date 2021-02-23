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
	
	$('#memberType').val('adult');
	
	$('#childBtn').on('click', function() {
		$('#memberTypeText1').html('만 14세 미만 고객님께서는 가입 시 보호자(법정대리인)의 동의가 필요합니다.');
		$('#memberTypeText2').html('아래 인증 방식을 선택하여 인증해주세요.');
		$('#memberType').val('child');
	})
	
	$('#adultBtn').on('click', function() {
		$('#memberTypeText1').html('상상스토리 금융교육포털을 이용하실 때는 최초 1회 가입인증이 필요합니다.');
		$('#memberTypeText2').html('아래 인증 방식을 선택하여 인증해주세요.');
		$('#memberType').val('adult');
	})

	  
});


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


// 핸드폰 본인인증 - KCB
function authMobile() {
	var popupWindow = window.open("/academy/common/kcbMobile.do", "kcbMobilePop", "left=500, top=100, status=0, width=450, height=550");
	popupWindow.focus();
}

//아이핀 본인인증 - KCB
function authIpin() {
	var popupWindow = window.open("/academy/common/kcbIpin.do", "kcbIpinPop", "left=500, top=100, status=0, width=450, height=550");
	popupWindow.focus();
}

//카드 본인인증 - KCB
function authCard() {
	var popupWindow = window.open("/academy/common/kcbCard.do", "kcbCardPop", "left=500, top=100, status=0, width=450, height=550");
	popupWindow.focus();
}

function authType(type, result) {
	
	var authType = type;
	var authResult = result;

	if("IPIN" == authType) {
		$('#authMode').val('I');
	} else if("PHONE" == authType) {
		$('#authMode').val('P');
	} else if("CARD" == authType) {
		$('#authMode').val('C');
	}
	
	if(("B000" == authResult) || ("T000" == authResult) ) {
		$('#authResult').val('Y');
	} else {
		$('#authResult').val('N');
	}

	
	ajaxSubmit('/academy/user/memberAuthCheckJoin.do',
	        {   
				memberType : $('#memberType').val(),
				di : $('#di').val()
	        }, 'json',
	        eval('resultChkJoinYn')
	);
		
}

function goMemberJoinForm() {
	$('#frm').attr('action', '/academy/user/memberJoinForm.do');
	$('#frm').submit();
}


function resultChkJoinYn(data) {
	
	if(data > 0) {
		var resultYn = confirm("가입된 정보가 있습니다. 로그인 페이지로 이동하시겠습니까?");
		if(resultYn == true) {
			$('#frm').attr('action', '/academy/common/login.do');
			$('#frm').submit();
		} else {
			return false;
		}
	} else if(data == 0) {
		goMemberJoinForm();
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

					<div class="headStep">
						<ol>
							<li><a href="#"><span class="num">1단계. </span>약관동의</a></li>
							<li class="on"><a href="#" title="본인인증"><span class="num">2단계. </span>본인인증</a></li>
							<li><a href="#"><span class="num">3단계. </span>회원정보입력</a></li>
							<li><a href="#"><span class="num">4단계. </span>가입완료</a></li>
						</ol>
					</div>
					
					
                   <section class="tableBox">
                       <!--연령별 탭 추가-->
                        	<div class="age_tap">
                        		<button type="button" class="ageY btn_tabmenu" title="14세 이상" id="adultBtn">14세 이상</button>
                            	<button type="button" class="ageN" title="14세 미만" id="childBtn">14세 미만</button>
                          	</div>
                        <!--연령별 탭 추가-->
                        
                       <form name="frm" id="frm" action="" method="post">
						    <input type="hidden" name="mbernm" id="mbernm" value="" />
						    <input type="hidden" name="brthdy" id="brthdy" value="" />
						    <input type="hidden" name="sex" id="sex" value="" />
						    <input type="hidden" name="di" id="di" value="" />
						    <input type="hidden" name="moblphon" id="moblphon" value="" />
						    <input type="hidden" name="idCheckYn" id="idCheckYn" value="N" />
						    <input type="hidden" name="authMode" id="authMode" value="" />
						    <input type="hidden" name="authResult" id="authResult" value="" />
						    <input type="hidden" name="memberType" id="memberType" value=""/>
						    <input type="hidden" name="marketingYn" id="marketingYn" value="<c:out value='${REQUEST_DATA.marketingYn}'/>"/>
                       </form>
                       
                       
                       <div class="borBoxJoin">
                       
	                       <h3 class="fnt20 po_C6" id="memberTypeText1">상상스토리 금융교육포털을 이용하실 때는 최초 1회 가입인증이 필요합니다.</h3>
	                       <h3 class="fnt21 po_C6" id="memberTypeText2">아래 인증 방식을 선택하여 인증해주세요.</h3>
	                       
	                       <div class="joinBox">
								<ul class="sel_type">
									<li>
	 									<a href="#none" onclick="authMobile(); return false;"> 
											<span class="label_img01"></span>
											<span class="txtAuth">휴대폰 인증</span>
											<span class="txt">본인명의 휴대폰번호로<br />본인인증</span>
	 									</a> 
									</li>
									<li>
	 									<a href="#none" onclick="authIpin(); return false;"> 
											<span class="label_img02"></span> 
											<span class="txtAuth">아이핀 인증</span>
											<span class="txt">휴대폰번호 없이<br />본인인증</span>
										</a> 
									</li> 
									<li>
										<a href="#none" onclick="authCard(); return false;"> 
											<span class="label_img03"></span>
											<span class="txtAuth">신용(체크)카드 인증</span>
											<span class="txt">본인명의 카드번호로<br />본인인증</span>
										</a>
									</li>
								</ul>
							</div>
							
							<div class="joinBox2">
					  			<p>· 상상스토리은 회원 가입시에는 주민등록번호를 수집하지 않습니다.</p>
					  			<p>· 신용카드 인증은 가입하시는 분 명의의 카드로만 인증이 가능합니다.</p>
					  			<p>· 인증이 되지 않을 경우, 상상스토리 콜센터(1600-4931)로 문의하시기 바랍니다.</p>
							</div>
							
                       	</div>
                   </section>
               </div>
           </div>
       </article>


		</div>


<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->