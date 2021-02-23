<%
/****************************************************
system	: 특강교육 
summary	:	
wdate	: 2016-09-10
writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	
	//예산없음 클릭시 input box 비활성화
	$("#payYn").on('click', function(){
		var check = $("#checkLecPay").val();
		if(check == 'Y'){
			$("#lecPay").attr("disabled","disabled");
			$("#checkLecPay").val('N');
		}else if(check == 'N'){
			$("#lecPay").removeAttr("disabled");
			$("#checkLecPay").val('Y');
		}
	});
})


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


	var cnt = 1;
	function fnAdd() {
		if (cnt > 9) {
			alert("교육일시는 9개까지 등록 가능합니다.");
			return;
		}
		
		cnt ++;
		
		var str = "";

		str = str + "  <div class='calendar-wrap' id='eduDate_"+cnt+"'>";
		str = str + "	<div class='input-wrap mb-c'>";
		str = str + "		<span class='calendar-box'>";
		str = str + "			<input type='text' name='multiEduDate' id='multiEduDate"+cnt+"' title='날짜선택' class='inputtxt small'>";
		str = str + "			<p class='btn-calendar' id='multiEduDate"+cnt+"' title='달력선택'></p>";
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
		str = str + "			<span class='timebtn'>";
		str = str + "				<button onclick='fnAdd(); return false;' class='scale-up' title='시간늘림'>시간늘림</button>";
		str = str + "				<button onclick='fnDel("+cnt+"); return false;' class='scale-down' title='시간축소'>시간축소</button>";
		str = str + "			</span>";
		str = str + "		</span>";
		str = str + "	</div>";
		
		str = str + "</div>";
		str = str + "<script type=\'text/javascript\'>$(\'#multiEduDate"+cnt+"\').datepicker({dateFormat: \'yy-mm-dd\'});</"+"script>";
		str = str + "<script type=\'text/javascript\'>$(\'.sub-select\').jqTransform();</"+"script>";
	 

	    $("#eduDate_"+(cnt-1)).after(str);
	    
	    $("#eduDate_"+cnt).show();
	    $("#cnt").val(cnt);
	}
	
	function fnDel(val) {
		if (cnt == 1) {
			alert("더 이상 삭제하실 수 없습니다.");
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
	
	// 목록으로 돌아가기
	function returnMain(){
		$("#frm").attr('action' , '/academy/course/lectureMain.do').submit();
	}

	//등록
	function insertInfo(){
		if($('#applyOrganNm').val().length == 0){
			alert("기관명을 입력하여 주세요");
			$("#applyOrganNm").focus();
			return;
		}else if($('#eduArea').val().length == 0){
			alert("교육장소를 입력하여 주세요");
			$("#eduArea").focus();
			return;
		}else if($('#multiEduDate1').val().length == 0){
			alert("교육일시를 입력하여 주세요");
			$("#multiEduDate1").focus();	
			return;
		}else if($('#lecPay').val().length == 0){
			alert("강사료를 입력하여 주세요");
			$("#lecPay").focus();
			return;
		}else if(isNaN($('#lecPay').val()) == true){
			alert("강사료를 숫자만 입력하여 주세요");
			$("#lecPay").focus();
			return;
		}else if($('#personCnt').val().length == 0){
			alert("인원을 입력하여 주세요");
			$("#personCnt").focus();
			return;
		} else if ($("input:checkbox[name=eduFacCodeArr]:checked").length==0){
			alert("교육시설정보를 선택하여 주세요");
			$("#eduFacCodeArr1").focus();
			return;
		}else if($('#applyNm').val().length == 0){
			alert('신청자를 입력하여 주세요.');
			$('#applyNm').focus();
			return;
		}else if($('#secondPhone').val().length == 0 || $('#thirdPhone').val().length == 0){
			alert('연락처를 입력하여 주세요');
			$('#firstPhone').focus();
			return;
		}else{
			if(confirm("신청 하시겠습니까?")){
				var checkLength = $("input:checkbox[name=eduFacCodeArr]:checked").length ; 
				$("#checkLength").val(checkLength);
				$("#qu").val('insert');
				$('#tutorHisYn').val('N');
				$("#frm").attr('action' , '/academy/course/lectureInsertInfo.do').submit();
			};
		}
	}
</script>

<div class="contents-wrap c502">
		<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>

			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>배움터</span></li>
					<li class="location"><span>의무교육</span></li>
				</ul>

				<div class="sub-tit">
					<h3>의무교육</h3>
					<p>「정신보건법」 제6조의 2(교육), 「노숙인 등의 복지 및 자립지원에 관한 법률」 제20조 및 「노숙인 복지법」 시행규칙 제23조에 의해 진행되는 관련 종사자 의무 교육을 시행합니다.</p>
				</div>
				
				<form name="frm" id="frm" action="/academy/course/lectureForm.do" method="post">
				<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value="${REQUEST_DATA.mtScCode}"/>"/>
				<input type="hidden" name="qu" id="qu" value=""/>
				<input type="hidden" name="cnt" id="cnt" value=""/>
				<input type="hidden" name="checkLength" id="checkLength" value=""/>
				<input type="hidden" name="checkLecPay" id="checkLecPay" value="Y"/>
				<input type="hidden" name="tutorHisYn" id="tutorHisYn" value="N"/>
				
				<div class="contents" id="sContents">

					<div class="rel">
						<h3 class="con-tit">정신보건 방문프로그램</h3>
						<p class="abs vital"><span class="mark">*</span>필수 항목입니다.</p>
					</div>
					
					<div class="con-tbl">
						<table class="sub-table label">
							<caption>정신보건 방문프로그램 테이블: 이 표는 정신보건 방문프로그램 테이블입니다.</caption>
							<colgroup>
								<col style="">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
						            <th>지역<span class="mark">*<em class="hidden">필수항목</em></span></th>
						            <td>
						            	<div class="sub-select medium" id="select_container">
						                <select name="mtAreaCode" id="mtAreaCode" title="지역" >
						                    <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
												<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" 
													<c:if test="${map.MT_AREA_CODE ne null && emap2.MT_SUB_CODE eq map.MT_AREA_CODE}"> selected="selected"</c:if>>
													<c:out value="${emap2.MT_SUB_NAME}"/>
												</option>
											</c:forEach>
						                </select>
						                </div>
						            </td>
								</tr>
								<tr>
									<th scope="row"><label for="input_id1">기관명<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" name="applyOrganNm" id="applyOrganNm" class="inputtxt large" title="기관명 입력"></td>
								</tr>
								
								<tr>
									<th scope="row" class="va-t"><label for="input_place">교육장소<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" id="eduArea" name="eduArea" class="inputtxt small" title="교육장소입력"> 
									<span class="mark">*</span>신청 기관 외 제 3의 장소일 것</td>
								</tr>
								
								<tr>
									<th scope="row" class="va-t">교육장주소</th>
									<td>
										<div class="">
												<div class="input-wrap">
													<input type="text" id="applyOrganZipno" name="applyOrganZipno" class="inputtxt small" title="우편번호">
													<input type="button"  onclick="zipSearch(); return false;" class="btn-submit small" value="주소검색">
												</div>
												<div class="input-wrap m-b">
													<input type="text" id="applyOrganAddr" name="applyOrganAddr" class="inputtxt medium2" title="상세 주소입력"><input type="text" id="applyOrganAddr2" name="applyOrganAddr2" class="inputtxt small2" title="상세 주소입력">
												</div>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row" class="va-t">교육일시<span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td>
						                <div class="calendar-wrap" id="eduDate_1">
												<div class="input-wrap mb-c">
													<span class="calendar-box">
														<input type="text" name="multiEduDate" id="multiEduDate1" title="날짜선택" class="inputtxt small">
														<label class="btn-calendar" for="multiEduDate1" title="달력선택"></label>
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
														<span class="timebtn">
															<button onclick="fnAdd(); return false;" class="scale-up" title="시간늘림">시간늘림</button>
															<button onclick="fnDel(1); return false;" class="scale-down" title="시간축소">시간축소</button>
														</span>
													</span>
												</div>
											</div>
						            </td>
								</tr>
								<tr>
									<th scope="row"><label for="input_price">강사료<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td>
										<input type="text" id="lecPay" name="lecPay" class="inputtxt small" title="강의료입력" onkeypress='return event.charCode >= 48 && event.charCode <= 57'> 원
									</td>
								</tr>
								<tr>
									<th scope="row" class="va-t">인원<span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td><input type="text" id="personCnt" name="personCnt" class="inputtxt small" title="인원입력" onkeypress='return event.charCode >= 48 && event.charCode <= 57'> 명
									<span class="mark">*</span>30 ~ 100 내외일 것
									</td>
								</tr>
								<tr>
									<th scope="row">교육시설정보<span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td>
										<c:forEach var="data" items="${edufacilitiesList}" varStatus="status">
											<div class="input-add">
												<span class="chk-wrap">
													<span class="checks">
														<input type="checkbox" id="eduFacCodeArr${status.count}" name="eduFacCodeArr" value="${data.MT_SUB_CODE}" title="교육시설"/>
														<label for="eduFacCodeArr${status.count}">  ${data.MT_SUB_NAME}&nbsp; </label>
														<c:if test="${data.MT_SUB_CODE eq 'FA07'}">
															<span class="hyphen">(</span><span class="input-wrap2"><input type="text" name="eduFacContent"  id="eduFacContent" class="inputtxt large" title="기타입력" <c:if test="${eduFacCode[i] eq 'FA07'}">value="${map.EDU_FAC_CONTENT}"</c:if>></span><span class="hyphen">)</span>
														</c:if>
													</span>
												</span>
											</div>	
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row" class="va-t"><label for="etc">기타내용</label></th>
									<td>
										<div class="tarea-wrap">
											<textarea name="etc" id="etc" cols="30" rows="10" title="etc" class=""></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="input_id7">신청자</label><span class="mark">*<em class="hidden">필수항목</em></span></th>
									<td><input type="text" id="applyNm" name="applyNm" value="<c:out value="${REQUEST_DATA.SES_USERNAME}"/>"  class="inputtxt small" title="신청차항목입력"></td>
								</tr>
								<tr>
									<th>신청자 연락처<span class="mark">*<em class="hidden">필수항목</em></span></th>
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
										<input type="text" id="secondPhone" name="secondPhone" title="전화번호 중간자리" class="inputtxt short" value="${REQUEST_DATA.phoneSecondNumber}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'><span class="hyphen">-</span>
										<input type="text" id="thirdPhone" name="thirdPhone" title="전화번호 마지막자리" class="inputtxt short" value="${REQUEST_DATA.phoneThirdNumber}" onkeypress='return event.charCode >= 48 && event.charCode <= 57'>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<ul class="btn-list">
						<li><button type="submit" onclick="insertInfo();return false" class="btn signup" title="신청">신청</button></li>
						<li><a href="#none" onclick="returnMain();" class="btn list" title="특강교육목록">목록</a></li>
					</ul> <!-- // btn list -->

					<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
				</div><!-- //contents-->
				</form>
			</div><!-- //sub-contents -->
		</div><!-- //sub-wrap -->
	</div><!-- //contents-wrap -->
	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->