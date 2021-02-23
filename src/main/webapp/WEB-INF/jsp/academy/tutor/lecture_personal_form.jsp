<%
/****************************************************
	system	: 나의강의 > 개인 강의이력
	title	: 특강 상세
	summary	:	
	wdate	: 2016-09-23
	writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$.datepicker.setDefaults({
	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	changeMonth: true,
		changeYear: true,
		showMonthAfterYear: true,
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	dateFormat: 'yy-mm-dd'
}); 

$(function() {
	$("div[id^='multiEduSdateHour']").numeric();
	$('#multiEduDate1').datepicker({dateFormat: 'yy-mm-dd'});
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
	
	$(document).ready(function(){
		// 달력
		$("#input_id3").datepicker(dateFormat);
		$("#input_id3").datepicker(dateFormat);
	});

	var cnt = 1;
	function fnAdd() {
		if (cnt > 8) {
			alert("교육일시는 9개까지 등록 가능합니다.");
			return;
		}
		
		cnt ++;
		
		var str = "";

		str = str + "  <div class='calendar-wrap' id='eduDate_"+cnt+"'>";
		str = str + "	<div class='input-wrap mb-c'>";
		str = str + "		<span class='calendar-box'>";
		str = str + "			<input type='text' name='multiEduDate' id='multiEduDate"+cnt+"' title='날짜선택' class='inputtxt small'>";
		str = str + " 			<label class='btn-calendar' for='multiEduDate"+cnt+"' ></label>";			
		str = str + "		</span>";
		str = str + "		<span class='span-block'>";
		str = str + "			<div class='sub-select' id='select_container2'>";
		str = str + "				<select name='multiEduSdateHour' id='multiEduSdateHour"+cnt+"'  title='교육시작 시간'>";
		str = str + "					<c:forEach var='sh' begin='0' end='24' step='1'>";
		str = str + "					<c:if test='${sh < 10}'><c:set var='sh'>0${sh}</c:set></c:if>";
		str = str + "					<option value='<c:out value='${sh}' />'><c:out value='${sh}' /></option>";
		str = str + "					</c:forEach>";
		str = str + "				</select>";
		str = str + "			</div>";
		str = str + "			<span class='hyphen'>:</span>";
		str = str + "			<div class='sub-select' id='select_container3'>";
		str = str + "				<select name='multiEduSdateMinute' id='multiEduSdateMinute"+cnt+"' title='교육시작 분'>";
		str = str + "					<c:forEach var='sh' begin='0' end='59' step='1'>";
		str = str + "					<c:if test='${sh < 10}'><c:set var='sh'>0${sh}</c:set></c:if>";
		str = str + "					<option value='<c:out value='${sh}' />'><c:out value='${sh}' /></option>";
		str = str + "					</c:forEach>";
		str = str + "				</select>";
		str = str + "			</div>";
		str = str + "			<span class='hyphen'>~</span>";
		str = str + "		</span>";
	    
		str = str + "		<span class='span-block'>";
		str = str + "			<div class='sub-select' id='select_container4'>";
		str = str + "				<select name='multiEduEdateHour' id='multiEduEdateHour"+cnt+"' title='교육시작 시간'>";
		str = str + "					<c:forEach var='sh' begin='0' end='24' step='1'>";
		str = str + "					<c:if test='${sh < 10}'><c:set var='sh'>0${sh}</c:set></c:if>";
		str = str + "					<option value='<c:out value='${sh}' />'><c:out value='${sh}' /></option>";
		str = str + "					</c:forEach>";
		str = str + "				</select>";
		str = str + "			</div>";
		str = str + "			<span class='hyphen'>:</span>";
		str = str + "			<div class='sub-select' id='select_container5'>";
		str = str + "				<select name='multiEduEdateMinute' id='multiEduEdateMinute"+cnt+"' title='교육시작 분'>";
		str = str + "					<c:forEach var='sh' begin='0' end='59' step='1'>";
		str = str + "					<c:if test='${sh < 10}'><c:set var='sh'>0${sh}</c:set></c:if>";
		str = str + "					<option value='<c:out value='${sh}' />'><c:out value='${sh}' /></option>";
		str = str + "					</c:forEach>";
		str = str + "				</select>";
		str = str + "			</div>";
		str = str + "		</span>";
		str = str + "	</div>";
		
		str = str + "</div>";
		str = str + "<script type=\'text/javascript\'>$(\'#multiEduDate"+cnt+"\').datepicker({dateFormat: \'yy-mm-dd\'});</"+"script>";
		str = str + "<script type=\'text/javascript\'>$(\'.sub-select\').jqTransform();</"+"script>";
	 
	    $(".td-input-wrap").append(str);
	    
	    $("#eduDate_"+cnt).show();
	    $("#cnt").val(cnt);
	}
	


	function fnDel(val) {
		if (cnt == 1) {
			alert("더이상 삭제하실 수 없습니다.");
			return;
		}
		
		var row = $("#eduDate_"+val);
		row.fadeOut("fast", function()
		{
			cnt--;
			row.remove();
			$("#cnt").val(cnt);
		});
	}
	
	function personamList(){
		var frm = document.frm;
		frm.target = "_self";
		$("#frm").attr("action", "/academy/tutor/lecturePersonalList.do");
		frm.submit();
	}
	
	//개인강의이력 팝업
	function personalInfo(mod){
		if($('#title').val().length == 0){
			alert('제목을 입력해주세요');
			$('#title').focus();
			return;
		}else if($('#eduArea').val().length ==0){
			alert('교육장소를 입력해주세요');
			$('#eduArea').focus();
			return;
		}else if($('#multiEduDate1').val().length == 0){
			alert("교육일시를 입력해주세요");
			$("#multiEduDate1").focus();
			return;
		}else if(isNaN($('#eduTime').val()) == true ){
			alert("교육시간은 숫자만 입력해주세요");
			$("#eduTime").focus();
			return;
		}else if($('#eduTime').val().length == 0 ){
			alert("교육시간을 입력해주세요");
			$("#eduTime").focus();
			return;
		}else if($('#eduTarget').val().length == 0){
			alert("교육대상을 입력해주세요");
			$("#eduTarget").focus();
			return;
		}else if($('#personCnt').val().length == 0){
			alert("인원을 입력해주세요");
			$("#personCnt").focus();
			return;
		}else if(isNaN($('#personCnt').val()) == true ){
			alert("인원은 숫자만 입력해주세요");
			$("#personCnt").focus();
			return;
		}else if($('#applyOrganNm').val().length == 0){
			alert("요청기관을 입력해주세요");
			$("#applyOrganNm").focus();
			return;
		}else if($('#applyOrganZipno').val().length == 0){
			alert("요청기관 소재지를 입력해주세요");
			$("#applyOrganZipno").focus();
			return;
		}else if($("input:checkbox[name=eduFacCodeArr]:checked").length == 0){
			alert("교육시설정보를 입력해주세요");
			return;
		}
		
		$('#layer_03').css('display' , 'block');
	}
	
	//개인강의이력 등록
	function personalInsert(){
		var frm = document.frm;
		var checkLength = $("input:checkbox[name=eduFacCodeArr]:checked").length ; 
		frm.checkLength.value = checkLength;
		frm.target = "_self";
		frm.qu.value = 'insert';
		frm.tutorHisYn.value = "Y";
		$("#frm").attr("action", "/academy/tutor/lecturePersonalInfoExec.do");
		frm.submit();
	}
	
	//우편번호찾기
	function zipSearch(){
		window.open("/academy/common/common/post.do","post_pop", "width=750,height=650, scrollbars=YES");
	}
	
	//우편번호 콜백 스크립트
	function fnZipCodePopupCallBack(data){
	 	var zipCodes = data.zip_code.split('-');
	 	$('#applyOrganZipno').val(data.zip_code);
	 	$('#applyOrganAddr').val(data.adres);
	 	$('#applyOrganAddr2').focus();
	}

	//탭이동
	function fnTab(url, tabNo) {
		$("#tabNo").val(tabNo);
		$("#qu").val('');
		$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
	}
</script>
<div class="container" id="Subcontent" tabindex="-1">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp" %>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>강사공간</li>
                <li class="active">강사정보관리</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="contTop">
                <h2 class="h2_tit">강사정보관리</h2>
                
            </section>

			<div class="contents" id="sContents">
				
				<form name="frm" id="frm" action=""  method="post" enctype="multipart/form-data">
				<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value="${REQUEST_DATA.mtScCode}"/>"/>
				<input type="hidden" name="userno" id="userno" value="<c:out value="${REQUEST_DATA.userno}"/>"/>
				<input type="hidden" name="entrstYear" id="entrstYear" value="<c:out value="${REQUEST_DATA.entrstYear}"/>"/>
				<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.LectureFilePath")%>"/>
				<input type="hidden" name="tutorHisYn" id="tutorHisYn" value=""/>
				<input type="hidden" name="zipNo" id="zipNo" value=""/>
				<input type="hidden" name="qu" id="qu" value=""/>
				<input type="hidden" name="mod" id="mod" value=""/>
				<input type="hidden" name="cnt" id="cnt" value=""/>
				<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
				<input type="hidden" name="checkLength" id="checkLength" value=""/>
				<input type="hidden" name="lecUserno" id="lecUserno" value="${REQUEST_DATA.SES_USERNO }"/>
				
				<div class="tabArea">
					<ul class="tabMenu type02">
						<li class="tab0 <c:if test="${REQUEST_DATA.tabNo == 0}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 0}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureDetail.do', '0'); return false;"><span class="all"><em>정보 관리</em></span></a></li>
						<li class="tab1 <c:if test="${REQUEST_DATA.tabNo == 1}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 1}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureHisList.do', '1'); return false;"><span class="area1"><em>경력 관리</em></span></a></li>
						<li class="tab2 <c:if test="${REQUEST_DATA.tabNo == 2}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 2}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureCommitteeList.do', '2'); return false;"><span class="area2"><em>강의이력</em></span></a></li>
						<li class="tab3 <c:if test="${REQUEST_DATA.tabNo == 3}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 3}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lecturePersonalList.do', '3'); return false;"><span class="area3"><em>개인 강의이력</em></span></a></li>
						<li class="tab4 <c:if test="${REQUEST_DATA.tabNo == 4}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 4}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/evaluationList.do', '4'); return false;"><span class="area4"><em>평가 이력 관리</em></span></a></li>
						<li class="tab5 <c:if test="${REQUEST_DATA.tabNo == 5}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 5}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/reportList.do', '5'); return false;"><span class="area5"><em>보고서 제출</em></span></a></li>
					</ul>
					
					<div class="rel">
						<h3 class="con-tit">개인 강의이력</h3>
						<p class="abs vital"><span class="mark">*</span>필수 항목입니다.</p>
					</div>

					<div class="con-tbl">
						<table class="sub-table label">
							<caption>강사요청 테이블의 지역구분,제목,교육장소,방문여청일시,교육시간,교육대상,인원,신청기간,강의료,요청기관 소재지,교육시설정보,기타내용,강사선택,신청자,신청자연락처 등을 설명하는 테이블</caption>
							<colgroup>
								<col style="">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<%-- <tr>
						            <th>지역</th>
						            <td>
						            	<div class="sub-select medium" id="select_container">
						                <select name="mtAreaCode" id="mtAreaCode" title="지역" >
						                    <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
												<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${map.MT_AREA_CODE ne null && emap2.MT_SUB_CODE eq map.MT_AREA_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
											</c:forEach>
						                </select>
						                </div>
						            </td>
								</tr> --%>
								<tr>
									<th scope="row"><label for="input_id1">제목<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" id="title" name="title" class="inputtxt large" title="제목 입력"></td>
								</tr>
								<tr>
									<th scope="row" class="va-t"><label for="input_place">교육장소<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" id="eduArea" name="eduArea" class="inputtxt large" title="교육장소입력"></td>
								</tr>
								<tr>
									<th scope="row" class="va-t">교육일시<span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td class="td-input-wrap">
											<div class="calendar-wrap" id="eduDate_1">
												<div class="input-wrap mb-c">
													<span class="calendar-box">
															<input type="text" name="multiEduDate" id="multiEduDate1" title="날짜선택"  class="inputtxt small">
															<label class="btn-calendar" for="multiEduDate1" ></label>
													</span>
													<span class="span-block">
														<div class="sub-select" id="select_container2">
															<select name="multiEduSdateHour" id="multiEduSdateHour1"  title="교육시작 시간">
																<c:forEach var="sh" begin="0" end="24" step="1">
																<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
																<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
																</c:forEach>
															</select>
														</div>
														<span class="hyphen">:</span>
														<div class="sub-select" id="select_container3">
															<select name="multiEduSdateMinute" id="multiEduSdateMinute1" title="교육시작 분">
																<c:forEach var="sh" begin="0" end="59" step="1">
																<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
																<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
																</c:forEach>
															</select>
														</div>
														<span class="hyphen">~</span>
													</span>

													<span class="span-block">
														<div class="sub-select" id="select_container4">
															<select name="multiEduEdateHour" id="multiEduEdateHour1" title="교육시작 시간">
																<c:forEach var="sh" begin="0" end="24" step="1">
																<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
																<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
																</c:forEach>
															</select>
														</div>
														<span class="hyphen">:</span>
														<div class="sub-select" id="select_container5">
															<select name="multiEduEdateMinute" id="multiEduEdateMinute1" title="교육시작 분">
																<c:forEach var="sh" begin="0" end="59" step="1">
																<c:if test="${sh < 10}"><c:set var="sh">0${sh}</c:set></c:if>
																<option value="<c:out value='${sh}' />"><c:out value="${sh}" /></option>
																</c:forEach>
															</select>
														</div>
													</span>
												</div>
												
											</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="input_id4">교육시간<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" id="eduTime" name="eduTime" class="inputtxt small" title="교육시간입력" onkeypress='return event.charCode >= 48 && event.charCode <= 57'> 시간</td>
								</tr>
								<tr>
									<th scope="row"><label for="input_id5">교육대상<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" id="eduTarget" name="eduTarget" class="inputtxt large" title="교육대상입력"> </td>
								</tr>
								<tr>
									<th scope="row" class="va-t">인원<span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td><input type="text" style="width:50%" id="personCnt" name="personCnt" class="inputtxt small" title="인원입력" onkeypress='return event.charCode >= 48 && event.charCode <= 57'> 명</td>
								</tr>					
								<%-- <tr>
									<th scope="row"><label for="input_price">강의료<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" style="width:50%" id="lecPay" name="lecPay" class="inputtxt small" title="강사료입력" onkeypress='return event.charCode >= 48 && event.charCode <= 57'> 원</td>
								</tr> --%>
								<tr>
									<th scope="row">요청기관<span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td><input type="text" class="inputtxt large" name="applyOrganNm" id="applyOrganNm"/></td>
								</tr>
								<tr>
									<th scope="row" class="va-t">요청기관 소재지<span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td>
										<div class="">
												<div class="input-wrap">
													<input type="text" id="applyOrganZipno" name="applyOrganZipno" class="inputtxt small" title="우편번호">
													<input type="button"  onclick="zipSearch(); return false;" class="btn-submit small" value="주소검색">
												</div>
												<div class="input-wrap m-b">
													<input type="text" id="applyOrganAddr" name="applyOrganAddr" class="inputtxt medium2" title="상세 주소입력"><input type="text" id="applyOrganAddr2" name="applyOrganAddr2" class="inputtxt small2" title="상세 주소입력">
												</div>
												<!-- <div class="input-wrap mobile">
													<input type="text" id="adress3" class="inputtxt large" title="상세주소2">// mobile
												</div> -->
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">교육시설정보<span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td>
						            	<c:if test="${map.SLTNO ne null}">
							            	<c:set var="eduFacCode" value="${fn:split(map.EDU_FAC_CODE,',')}"/>
							                <c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
							                	<c:forEach var="i" begin="0" end="${fn:length(eduFacArr)}">
													<c:if test="${data.MT_SUB_CODE eq eduFacArr[i]}">
														<div class="input-add">
															<span class="chk-wrap">
																<span class="checks">
																	<input type="checkbox" id="eduFacCode" name="eduFacCode" value="${MT_SUB_CODE}" />
																	<c:if test="${eduFacArr[i] eq 'FA07'}">(<input type="text" name="eduFacContent"  id="eduFacContent"  value="<c:out value="${map.EDU_FAC_CONTENT}"/>"  class="inputtxt size2"/>)</c:if>&nbsp;
																	<label for="eduFacCode">${data.MT_SUB_NAME}</label>
																</span>	
															</span>
														</div>	
													</c:if>
												</c:forEach>
											</c:forEach>
										</c:if>
										<c:if test="${map.SLTNO eq null}">
											<c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
												<div class="input-add">
													<span class="chk-wrap">
														<span class="checks">
															<input type="checkbox" id="eduFacCodeArr${status.count}" name="eduFacCodeArr" ckcount=${status.count} value="${data.MT_SUB_CODE}" /> 
															<label for="eduFacCodeArr${status.count}">${data.MT_SUB_NAME}&nbsp;</label>
															<c:if test="${data.MT_SUB_CODE eq 'FA07'}">( <input type="text" name="eduFacContent"  id="eduFacContent"  value="<c:out value="${map.EDU_FAC_CONTENT}"/>"   class="inputtxt size2"/> )</c:if>&nbsp;
														</span>	
													</span>
												</div>	
											</c:forEach>
										</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row" class="va-t"><label for="etc1">기타내용</label></th>
									<td>
										<div class="tarea-wrap">
											<textarea name="etc" id="etc" cols="30" rows="10" title="etc"></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="input_id7">이메일</label></th>
									<td><input type="text" id="applyEmail" name="applyEmail" class="inputtxt large" title="이메일입력"></td>
								</tr>
								<tr>
									<th scope="row"><label for="input_id7">신청자</label></th>
									<td><input type="text" id="applyNm" name="applyNm" class="inputtxt large" title="신청차입력" ></td>
								</tr>
								<tr>
									<th scope="row">신청자 연락처</th>
									<td>
										<div class="sub-select" id="select_container7">
											<select id="firstPhone" name="firstPhone" title="전화번호 앞자리선택">
												<option value="010">010</option>
		                                        <option value="011">011</option>
		                                        <option value="016">016</option>
		                                        <option value="017">017</option>
		                                        <option value="018">018</option>
		                                        <option value="019">019</option>
											</select>
										</div><span class="hyphen">-</span>
										<input type="text" id="secondPhone" name="secondPhone" title="전화번호 중간자리" class="inputtxt short" onkeypress='return event.charCode >= 48 && event.charCode <= 57'><span class="hyphen">-</span>
										<input type="text" id="thirdPhone" name="thirdPhone" title="전화번호 마지막자리" class="inputtxt short" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="rel">
							<h3 class="con-tit">특강 정보 입력</h3>
					</div>
					
					<div class="con-tbl">
							<table class="sub-table label">
								<caption>개인 강사이력 테이블</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th>강사</th>
										<td><input type="text" class="inputtxt small" name="lecUsernm" id="lecUsernm" value="<c:out value="${REQUEST_DATA.SES_USERNAME }"/>"></td>
									</tr>
									<tr>
							            <th>강의계획서</th>
							            <td>
							            	<div class="file-wrap ta-l">
												<input type="text" id="fileName1" class="inputtxt size2" readonly="readonly">
												<div class="file_input_div">
												  <input type="button" value="불러오기" class="btn-m gray">
												  <input type="file"  name="uploadFile1" id="uploadFile1" class="file_input_hidden" onchange="javascript: document.getElementById('fileName1').value = this.value">
												</div>
											</div>
							            </td>
							        </tr>
							        <tr>    
							            <th>강의교안</th>
							            <td>
											<div class="file-wrap ta-l">
												<input type="text" id="fileName2" class="inputtxt size2" readonly="readonly">
												<div class="file_input_div">
												  <input type="button" value="불러오기" class="btn-m gray">
												  <input type="file"  name="uploadFile2" id="uploadFile2" class="file_input_hidden" onchange="javascript: document.getElementById('fileName2').value = this.value">
												</div>
											</div>
							            </td>
							        </tr>
							        <tr>    
						            <th>설문</th>
							            <td>
							            	<div class="file-wrap ta-l">
												<input type="text" id="fileName3" class="inputtxt size2" readonly="readonly">
												<div class="file_input_div">
												  <input type="button" value="불러오기" class="btn-m gray">
												  <input type="file"  name="uploadFile3" id="uploadFile3" class="file_input_hidden" onchange="javascript: document.getElementById('fileName3').value = this.value">
												</div>
											</div>
							            </td>
							        </tr>
								</tbody>
							</table>
						</div>				
	
						<ul class="btn-list">
							<li><a href="#" onclick="personalInfo();return false" class="btn signup">등록</a></li>
							<li><a href="#" onclick="personamList();return false" class="btn list">목록</a></li>
						</ul> <!-- // btn list -->
						
						<div class="layer_popup" id="layer_03" style="display: none;">
							<div class="layer-tit">
								<p>등록</p>
								<button class="layer_close pop_close" onclick="return false" title="닫기">닫기</button>
							</div>
							<div class="layer_bg bg3">
								<p>등록하시겠습니까?</p>
								<button class="btn-m pop_close" onclick="personalInsert('persnal');return false" title="등록">등록</button>
							</div>
						</div>

					<p class="ar"><a href="#header" class="btn-top">TOP</a></p>
					</div>
					</form>
				</div><!-- //contents-->
				
	
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
</div>

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
