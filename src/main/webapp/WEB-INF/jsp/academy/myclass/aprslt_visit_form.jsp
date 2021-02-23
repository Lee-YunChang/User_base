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
	
	
//목록으로 돌아가기
function returnMain(){
	$("#frm").attr('action' , '/academy/myclass/aprsltList.do').submit();
}

//등록
function insertInfo(){
	if($('#applyOrganNm').val().length == 0){
		alert("신청기관명을 입력해주세요");
		$("#applyOrganNm").focus();
		return;
	}else if($('#applyOrganAddr').val().length == 0){
		alert("신청기관 소재지를 입력해주세요");
		$("#applyOrganAddr").focus();
		return;
	}else if($('#eduTime').val().length == 0){
		alert("방문시간을 입력해주세요");
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
	}else{
		$("#frm").attr('action' , '/academy/course/lectureInsertInfo.do').submit();
	}
}	

function insertInfoPopUp(){
	$('#layer_04').css('display' , 'block');
}
</script>

<div class="contents-wrap f201">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>배움터</span></li>
				<li class="location"><span>신청내역</span></li>
			</ul>

			<div class="sub-tit">
				<h3>신청내역</h3>
				<p>교육센터에 신청한 특강교육과 방문프로그램 내역을 볼 수 있습니다.</p>
			</div>

			<div class="contents" id="sContents">

				<h3 class="con-tit">신청내역수정</h3>
				
				<form name="frm" id="frm" action="/academy/course/offDetail.do" method="post">
				<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value="${REQUEST_DATA.mtEduinfoCode}"/>"/>
				<input type="hidden" name="slno" id="slno" value="${map.SLNO}"/>
				<input type="hidden" name="sltno" id="sltno" value="${map.SLTNO}"/>
				<input type="hidden" name="applyNo" id="applyNo" value="${map.APPLY_NO}"/>
				<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu }"/>
				<input type="hidden" name="cnt" id="cnt" value=""/>
				
				<div class="con-tbl">
							<table class="sub-table label">
								<caption>신청내역 테이블:이 표는 강사요청 테이블의 지역구분,제목,교육장소,방문여청일시,교육시간,교육대상,인원,신청기간,강의료,신청기관 소재지,교육시설정보,기타내용,강사선택,신청자,신청자연락처 등을 설명하는 테이블입니다.</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
						            <th>지역</th>
						            <td>
						            	<div class="sub-select medium" id="select_container">
						                <select name="mtAreaCode" id="mtAreaCode" title="지역"  onchange="fnChangeArea(this.value);">
						                    <c:forEach var="emap2" items="${categoryData1}" varStatus="status2">
												<option value="<c:out value="${emap2.MT_SUB_CODE}"/>" <c:if test="${map.MT_AREA_CODE ne null && emap2.MT_SUB_CODE eq map.MT_AREA_CODE}"> selected="selected"</c:if>><c:out value="${emap2.MT_SUB_NAME}"/></option>
											</c:forEach>
						                </select>
						                </div>
						            </td>
								</tr>
								<tr>
									<th scope="row"><label for="input_id1">신청기관명<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" name="applyOrganNm" id="applyOrganNm" class="inputtxt large" title="기관명 입력" value="${map.APPLY_ORGAN_NM}"></td>
								</tr>
									<tr>
										<th scope="row" class="va-t">신청기관 소재지<span class="mark">*<em class="hidden">필수항목</em></span></th>
										<td>
											<div class="">
													<div class="input-wrap">
														<input type="text" id="applyOrganZipno" name="applyOrganZipno" class="inputtxt small" title="우편번호" value="${map.APPLY_ORGAN_ZIPNO}">
														<input type="button"  onclick="zipSearch(); return false;" class="btn-submit small" value="주소검색">
													</div>
													<div class="input-wrap m-b">
														<input type="text" id="applyOrganAddr" name="applyOrganAddr" class="inputtxt medium2" title="상세 주소입력" value="${map.APPLY_ORGAN_ADDR}"><input type="text" id="applyOrganAddr2" name="applyOrganAddr2" class="inputtxt small2" title="상세 주소입력" value="${map.APPLY_ORGAN_ADDR2}">
													</div>
													<!-- <div class="input-wrap mobile">
														<input type="text" id="adress3" class="inputtxt large" title="상세주소2">// mobile
													</div> -->
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" class="va-t">방문요청일시<span class="mark">*<em class="hidden">필수항목</em></span></th>
										<td>
							               <div class="calendar-wrap" id="eduDate_1">
												<div class="input-wrap mb-c">
													<%-- <span class="calendar-box">
														<input type="text" name="multiEduDate" id="multiEduDate1" title="날짜선택" class="inputtxt small" value="${map.EDU_DATE}">
														<!-- <button class="btn-calendar" title="달력선택"></button> -->
													</span> --%>
													<c:out value="${map.EDU_DATE }"/>
													&nbsp;&nbsp;&nbsp;
													<c:out value="${map.EDU_SDATE_HOUR }"/>시
													<span class="hyphen">:</span>
													<c:out value="${map.EDU_SDATE_MINUTE }"/>분
													<span class="hyphen">~</span>
													<c:out value="${map.EDU_EDATE_HOUR }"/>시
													<span class="hyphen">:</span>
													<c:out value="${map.EDU_EDATE_MINUTE }"/>분
												</div>
											</div>
							            </td>
									</tr>
									<tr>
									<th scope="row"><label for="input_id4">방문시간<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
									<td><input type="text" id="eduTime" name="eduTime" class="inputtxt small" title="교육시간 입력" value="${map.EDU_TIME}"> 시간</td>
								</tr>
									<tr>
										<th scope="row"><label for="input_id5">교육대상<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
										<td><input type="text" id="eduTarget" name="eduTarget" class="inputtxt small" title="교육대상 입력" value="${map.EDU_TARGET}"></td>
									</tr>
									<tr>
										<th scope="row"><label for="input_id6">인원<span class="mark">*<em class="hidden">필수항목</em></span></label></th>
										<td><input type="text" id="personCnt" name="personCnt" class="inputtxt small" title="인원입력" value="${map.PERSON_CNT}"> 명</td>
									</tr>
									<tr>
										<th scope="row" class="va-t"><label for="etc1">기타내용</label></th>
										<td>
											<div class="tarea-wrap">
												<textarea id="etc" name="etc" cols="30" rows="10" title="etc" class=""><c:out value="${map.ETC}"/></textarea>
											</div>
										</td>
									</tr>
									<tr>
									<th scope="row"><label for="input_id7">신청자</label></th>
										<td>
											<c:out value="${map.APPLY_NM}"/>
											<%-- <input type="text" id="applyNm" name="applyNm" class="inputtxt small" value="<c:out value="${REQUEST_DATA.SES_USERNAME}"/>" title="신청차항목입력"> --%>
										</td>
									</tr>
									<tr>
										<th>신청자 연락처</th>
										<td>
											<c:out value="${map.APPLY_PHONE}"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>


						<ul class="btn-list">
							<li><button type="submit" onclick="insertInfoPopUp();return false" class="btn signup" title="수정">수정</button></li>
							<li><a href="#none" onclick="returnMain();" class="btn list" title="신청내역 목록">목록</a></li>
						</ul> <!-- // btn list -->
						
						<div class="layer_popup" id="layer_04" style="display: none;">
							<div class="layer-tit">
								<p>수정</p>
								<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
							</div>
							<div class="layer_bg bg4">
								<p>수정하시겠습니까?</p>
								<button class="btn-m pop_close" onclick="insertInfo();return false" title="수정">수정</button>
							</div>
						</div>
						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
				</form>

			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->

	</div><!-- //contents-wrap -->
	
	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->