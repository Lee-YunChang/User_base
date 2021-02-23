<%
/****************************************
    subject	: 나의공간  > 신청내역 > 상세세
    summary	:
    author	: 이진영
    date	: 2016-09-27
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$(document).ready(function(){
	
	SANGS.areaCombo.init('sidoCode','guCode','dongCode');
});

	function fnPop() {
		var myForm = document.frm;
		window.open("" ,"frm", "width=1300, height=925, scrollbars=yes"); 
		$("#searchWord").val($("#lecUsernm").val());
		myForm.action = '/academy/course/lectureTutorSearch.do'; 
		myForm.method = "post";
		myForm.target = "frm";
		myForm.submit();
	}
	
	//특강 등록
	function insertInfo(slno , sltno , applyNo){
		if($('#applyNm').val() == ''){
			alert('신청자 성명을 입력해주세요');
			$('#applyNm').focus();
			return;
		}else if($('#applyOrganNm').val() == ''){
			alert('신청자 소속을 입력해주세요');
			$('#applyOrganNm').focus();
			return;
		}else if($('#sidoCode').val() == '' || $('#guCode').val() == '' || $('#dongCode').val() == '' || $('#applyOrganAddr').val() == ''){
			alert("지역정보를 입력해주세요");
			$("#sidoCode").focus();
			return;
		}else if($('#eduArea').val() == ''){
			alert("교육장소를 입력해주세요");
			$("#eduArea").focus();
			return;
		}else if($('#confirmTel1').val() == '' || $('#confirmTel2').val() == '' || $('#confirmTel3').val() == ''){
			alert("유선전화를 입력해주세요");
			$("#confirmTel1").focus();
			return;
		}else if($('#confirmMobile1').val() == '' || $('#confirmMobile2').val() == '' || $('#confirmMobile3').val() == ''){
			alert("휴대전화를 입력해주세요");
			$("#confirmMobile1").focus();
			return;
		}else if($('#email1').val() == '' || $('#email2').val() == ''){
			alert("메일주소를 입력해주세요");
			$("#email1").focus();
			return;
		}else if($('#eduSdate').val() == '' || $('#eduSdate_hh').val() == '' || $('#eduSdate_mm').val() == '' || $('#eduEdate_mm').val() == '' || $('#eduEdate_mm').val() == ''){
			alert("교육 희망일시를 입력해주세요");
			$("#eduSdate").focus();
			return;   
		}else if(!($('input[name=mtLecTargetCode]:checked').is(':checked'))){
			alert("교육대상를 선택해주세요");
			$("#mtLecTargetCode").focus();
			return;
		}else if($('#personCnt').val() == ''){
			alert("참석인원을 입력해주세요");
			$("#personCnt").focus();
			return;
		}else if(!($('input[name=mtLctreCodeArr]:checked').is(':checked'))){
			alert("교육희망 주제를 선택해주세요");
			$("#mtLctreCodeArr").focus();
			return;
		}else if($('input[name="agreeChk1"]:checkbox:checked').length == 0){
			alert('회원이용악관에 동의해야 가입 가능합니다.');
			$('input[name="agreeChk1"]').focus();
			return;	
		}
		
		//이메일 합치기
	    if($('#email1').val() !='' || $('#email2').val() !='' ){
	        $('#email').val($('#email1').val() +'@'+$('#email2').val() );
	    }

	    //유선번호 합치기
	    if($('#confirmMobile1').val() !='' || $('#confirmMobile2').val() !='' || $('#confirmMobile3').val() !=''){
	        $('#confirmMobile').val($('#confirmMobile1').val() +'-'+$("#confirmMobile2").val() +'-'+$('#confirmMobile3').val() );
	    } else {
	        $('#confirmMobile').val(null);
	    }
	    
	 	//무선번호 합치기
	    if($('#confirmTel1').val() !='' || $('#confirmTel1').val() !='' || $('#confirmTel1').val() !=''){
	        $('#confirmTel').val($('#confirmTel1').val() +'-'+$("#confirmTel2").val() +'-'+$('#confirmTel3').val() );
	    } else {
	        $('#confirmTel').val(null);
	    }
	    
		//교육신청시간 데이터 합치기
		$('#eduEdate').val($('#eduSdate').val().replace(/-/g,"").toString()+$('#eduEdate_hh').val().toString()+$('#eduEdate_mm').val().toString());
		$('#eduSdate').val($('#eduSdate').val().replace(/-/g,"").toString()+$('#eduSdate_hh').val().toString()+$('#eduSdate_mm').val().toString());
		
		var ckbs = $("input[name='mtLctreCodeArr']:checked");
		ckbs = ckbs.map(function(){
			var value = $(this).val();
			return value;
		}).get().join(",");
		
		$("#mtLctreCode").val(ckbs);
		
		var frm = document.frm;
		$("#qu").val('insert');
		$("#frm").attr('target', '_self').attr('method', 'post').attr('action' , '/academy/myclass/aprsltExec.do').submit(); 
	}
    
    // 목록
    function fnList() {
    	$("#frm").attr("action", "/academy/myclass/aprsltList.do").submit();
    }
    
    // 저장
    function fnExec() {
    	var form = document.frm;
    	$("#frm").attr("action", "/academy/myclass/aprsltExec.do").submit();
    }
    
    function insertInfoPopUp(){
    	$('#layer_04').css('display' , 'block');
    }
    
  	//이메일 셀렉트박스 세팅
    function emailSelect(val){
        $('#email2').val(val);
    }
    function userEmailSelect(val){
        $('#userEmail2').val(val);
    }
    
    $(function () {
		$("[id^='eduSdate']").each(function() {
			$(this).datepicker({dateFormat: 'yy-mm-dd'});
		});	
	});
    
  //날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
	var dateFormat={
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showMonthAfterYear: true, //연월 순서로 보여줌
		changeMonth: true, //월을 셀렉트박스로 표현
		changeYear: true, //년을 셀렉트박스로 표현
		dateFormat: "yy-mm-dd",
		changeMonth: true,   
		changeYear: true,	
		yearRange: "2014:2025"
	};
  	
	$.datepicker.setDefaults({
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		changeMonth: true,
			changeYear: true,
			showMonthAfterYear: true,
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: 'yy-mm-dd'
	}); 
</script>
<div class="container" id="Subcontent" tabindex="-1">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
            <div class="path">
                <ul>
                    <li><span class="home text-hide">홈</span></li>
                    <li>나의공간</li>
                    <li class="active">신청내역</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
                <section class="contTop">
                    <h2 class="h2_tit">신청내역</h2>          
                </section>
			
			<div class="contents" id="sContents">
				
				<form name="frm" id="frm" action="" method="post">
				<input type="hidden" name="qu" id="qu" value=""/>
				<input type="hidden" name="email" id="email" value=""/>
				<input type="hidden" name="confirmTel" id="confirmTel" value=""/>
				<input type="hidden" name="confirmMobile" id="confirmMobile" value=""/>
				<input type="hidden" name="eduEdate" id="eduEdate" value=""/>
				<input type="hidden" name="mtLctreCode" id="mtLctreCode" value=""/>
					
					<div class="bg-box">
						<ul class="symbol-list c-blue">
							<li>아래 사항을 유의하여 기재하여 주시기 바랍니다.</li>
							<li>1.교육 일시와 교육 주제는 상상스토리과 협의 후 최종 결정합니다.</li>
							<li>2.참석인원 20명 이상 교육 신청이 가능합니다. (20명 이하일 경우 유선 협의 필요)</li>
							<li>접수 및 문의처 : 교육취업부  02) 2128-8325  /  edu@kinfa.or.kr</li>
						</ul>
					</div>
					
					
					<div class="con-tbl">
							<table class="">
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
							            <th scope="row">신청자 성명<span class="mark">*<em class="hidden">필수항목</em></span></th>
							            <td><input type="text" id="applyNm" name="applyNm" class="inputtxt small" title="신청자이름 입력"></td>
									</tr>
									<tr>
							            <th scope="row">신청자 소속<span class="mark">*<em class="hidden">필수항목</em></span></th>
							            <td><input type="text" id="applyOrganNm" name="applyOrganNm" class="inputtxt small" title="신청자소속 입력"></td>
									</tr>
									<tr>
							            <th scope="row">지역<span class="mark">*<em class="hidden">필수항목</em></span></th>
							            <td>
							            	
								            <select name="sidoCode" id="sidoCode" title="시도" >
								            	<option value="">선택</option>
								            </select>
								            <select name="guCode" id="guCode" title="구이름" >
								                   <option value="">선택</option>
								            </select>
								            <select name="dongCode" id="dongCode" title="동이름">
								                    <option value="">선택</option>
								            </select>
								            <input type="text" name="applyOrganAddr"  id="applyOrganAddr" style="width:200px"  class="inputtxt small"/>
							            </td>
									</tr>
									<tr>
							            <th scope="row">교육장소<span class="mark">*<em class="hidden">필수항목</em></span></th>
							            <td><input type="text" name="eduArea"  id="eduArea" style="width:80%" class="inputtxt large"></td>
							        </tr>
							        <tr>
							            <th scope="row">유선전화<span class="mark">*<em class="hidden">필수항목</em></span></th>
							            <td>
							            	<input type="text" id="confirmTel1"  class="inputtxt small" name="confirmTel1" title="전화번호 앞 자리" />
											<span class="hyphen">-</span> <input type="text" id="confirmTel2"  class="inputtxt small" name="confirmTel2" title="전화번호 가운데 자리" />
		                                    <span class="hyphen">-</span> <input type="text" id="confirmTel3"  class="inputtxt small" name="conficonfirmTel3" title="전화번호 끝 자리" />
							            </td>
							        </tr>
							        <tr>
							            <th scope="row">휴대전화<span class="mark">*<em class="hidden">필수항목</em></span></th>
							            <td>
							            	<div class="sub-select jqtransformdone" id="select_container7">
												<select id="confirmMobile1" name="confirmMobile1" title="휴대폰번호 선택" style="width:150px;">
			                                        <option value="010">010</option>
			                                        <option value="011">011</option>
			                                        <option value="016">016</option>
			                                        <option value="017">017</option>
			                                        <option value="018">018</option>
			                                        <option value="019">019</option>
			                                    </select>
											</div>
											<span class="hyphen">-</span> <input type="text" id="confirmMobile2"  class="inputtxt small" name="confirmMobile2" title="전화번호 가운데 자리" />
		                                    <span class="hyphen">-</span> <input type="text" id="confirmMobile3"  class="inputtxt small" name="confirmMobile3" title="전화번호 끝 자리" />
							            </td>
							        </tr>
									<tr>
										<th scope="row">이메일 주소<span class="mark">*<em class="hidden">필수항목</em></span></th>
										<td>
											<input type="text" id="email1" name="email1" title="이메일 앞주소 입력" class="inputtxt small"><span class="hyphen">@</span>
											<input type="text" id="email2" name="email2" title="이메일 뒷주소 입력" class="inputtxt small">
											<span class="dinline">
												<div class="sub-select type02 left" id="select_container">
													<select id="email3" name="email3"  onchange="emailSelect(this.value);return false;"  title="이메일 직접선택">
														<option value="">직접입력</option>
														 	<c:forEach var="emap2" items="${categoryData}" varStatus="status2">
													        <option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
													        </c:forEach>
													</select>
												</div>
										</td>
									</tr>
									<tr>
										<th scope="row">교육 희망일시<span class="mark">*<em class="hidden">필수항목</em></span></th>
										<td>
											<span class="calendar-box">
													<input type="text" name="eduSdate" id="eduSdate" readonly="readonly" title="날짜선택"  class="inputtxt small">
													<label class="btn-calendar" for="eduSdate" ></label>
											</span>
											<select name="eduSdate_hh" id="eduSdate_hh"  title="교육시작 시간">
												<c:forEach var="sh" begin="0" end="23" step="1">
												<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
														
												<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
												</c:forEach>
											</select>시
											<select name="eduSdate_mm" id="eduSdate_mm" title="교육시작 분">
												<c:forEach var="sh" begin="0" end="59" step="1">
												<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
												<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
												</c:forEach>
											</select>분
											~
											<select name="eduEdate_hh" id="eduEdate_hh"  title="교육종료 시간">
												<c:forEach var="sh" begin="0" end="23" step="1">
												<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
														
												<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
												</c:forEach>
											</select>시
											<select name="eduEdate_mm" id="eduEdate_mm" title="교육종료 분">
												<c:forEach var="sh" begin="0" end="59" step="1">
												<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
												<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
												</c:forEach>
											</select>분
										</td>
									</tr>
									<tr>
										<th scope="row">교육대상<span class="mark">*<em class="hidden">필수항목</em></span></th>
										<td>
											<c:forEach var="result"  items="${mtLecTargetCode}" varStatus="status">
							            		<input type="radio" name="mtLecTargetCode" id="mtLecTargetCode_${status}" value="${result.MT_SUB_CODE}" <c:if test="${result.MT_SUB_CODE eq map.MT_LEC_TARGET_CODE }" >checked="checked" </c:if>>${result.MT_SUB_NAME} &nbsp;&nbsp;
							            	</c:forEach>
							            	
											<span><input type="text" name="targetEtc"  id="targetEtc" style="width:150px"  class="inputtxt small"/></span>
										</td>
									</tr>
									<tr>
										<th scope="row">참석 인원<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
										<td><input type="text" id="personCnt" name="personCnt" class="inputtxt small" title="인원입력"> 명</td>
									</tr>
									<tr>
										<th scope="row">교육 희망주제<span class="mark">*<em class="hidden">필수항목</em></span></th>
										<td>
											<c:forEach var="result"  items="${mtLctreCode}" varStatus="status">
							            		<input type="checkbox" name="mtLctreCodeArr" id="mtLctreCodeArr_${status}" value="${result.MT_SUB_CODE}">${result.MT_SUB_NAME} &nbsp;&nbsp;
							            	</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="row" class="va-t"><label for="etc1">기타내용</label></th>
										<td>
											<div class="tarea-wrap">
												<textarea id="etc" name="etc" cols="30" rows="10" title="etc"></textarea>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
					</div>
					<h3 class="con-tit">회원이용약관</h3>
				<div class="provision">
					<div class="jointxt" tabindex="0">
						<h4 class="txt-tit">제1조(목적)</h4>
						<dl class="join-dl">
							<dt>제 1 조 (목적)</dt>
							<dd>
								본 약관은 상상스토리 온라인교육 사이트 (이하 "당 사이트")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
							</dd>
							<dt>제 2 조 (약관의 효력과 변경)</dt>
							<dd>
								<p>
									당 사이트는 이용자가 본 약관 내용에 동의하는 것을 조건으로 회원에 한하여 제공되는 서비스를 제공할 것이며, 이용자가 본 약관의 내용에 동의하는 경우, 당 사이트의 서비스 제공 행위 및 이용자의 서비스 사용 행위에는 본 약관이 우선적으로 적용됩니다.
								</p>
								<p>
									당 사이트는 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 당 사이트 내에 30일간 공지함으로써 이용자가 직접 확인하도록 할 것입니다. 이용자가 변경된 약관에 동의하지 아니하는 경우, 이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다. 변경된 약관은 공지와 동시에 그 효력이 발생됩니다.
								</p>
							</dd>
					</div>
					<div class="agreebox ar">
						<span class="checks"><input type="checkbox" id="agreeChk1" name="agreeChk1" title="회원약관 동의"><label for="agreeChk1">회원이용약관에 동의합니다.</label></span>
					</div>
				</div>
					<ul class="btn-list">
						<li><a href="#none" onclick="insertInfoPopUp();return false;" class="btn signup" title="신청">신청</a></li>
						
						<%-- <li><a href="#none" onclick="fnExec('<c:out value="${map.SLNO}"/>', '<c:out value="${map.SLTNO}"/>');return false;" class="btn signup">수정</a></li> --%>
						<li><a href="#none" onclick="fnList();return false;" class="btn list" title="신청내역 목록">목록</a></li>
					</ul>
	
					<div class="layer_popup" id="layer_04" style="display: none;">
						<div class="layer-tit">
							<p>등록</p>
							<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
						</div>
						<div class="layer_bg bg4">
							<p>등록하시겠습니까?</p>
							<button class="btn-m pop_close" onclick="insertInfo();return false;" title="등록">등록</button>
						</div>
					</div>
					
					<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
				</form>	
				</div><!-- //contents-->
				
	
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
