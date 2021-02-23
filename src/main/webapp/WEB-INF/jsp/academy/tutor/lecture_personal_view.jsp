<%
/****************************************************
	system	: 나의강의 > 강의이력
	title	: 특강 상세
	summary	:	
	wdate	: 2016-09-22
	writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	
	// 교육확인서 업로드체크
	$( "#uploadFile1" ).click(function() {
		if($("#imgCheck1").length > 0){
			if(confirm('첨부 파일은 하나만 등록할 수 있습니다. 기존의 파일을 삭제 후 수정 하시겠습니까?')){
				$("#qu").val("update");
				$("#myTutorFileCode").val("update");
				
			}
		}
	});
});


//파일다운로드
function filedown(fileName){
	//alert(fileName);
	$("#filename").val(fileName);
	$("#frm").attr("action", "/academy/tutor/lecturePersonalFiledown.do").submit(); 
}


//삭제
function deleteReportFile(mtTutorFileCode , slno , saveFile , saveFilePath){
	if(confirm("파일을 삭제하시겠습니까?")){
		$('#qu').val('delete');
		$('#mtTutorFileCode').val(mtTutorFileCode);
		$('#slno').val(slno);
		$('#saveFile').val(saveFile);
		$('#saveFilePath').val(saveFilePath);
		$('#frm').attr('action', '/academy/tutor/deleteLectureCommitteeInfo.do').submit();
	}else{
		return false;
	}
}

function fnList() {
	$('#frm').attr("action", "/academy/tutor/lecturePersonalList.do").submit();
}

function fnSave(qu) {
	if(confirm("수정 하시겠습니까?")){
		var form = document.frm;
		var mod = $("#tabNo").val();
		// 삭제 대상 첨부파일 번호 set
		//form.delCheckFile.value = "";
	
		/* if(form.delFileChk) {
			if(!form.delFileChk.length) {
				 if(form.delFileChk.checked)
					 form.delCheckFile.value = form.delFileChk.value;
			} else {
				for(var i = 0 ; i < form.delFileChk.length; i++) {
					if(form.delFileChk[i].checked)
						form.delCheckFile.value = form.delCheckFile.value + form.delFileChk[i].value + ",";
				}
			}
		} */
		if(mod == '3'){
			form.mod.value = "persnal";
		}else if(mod == '2'){
			form.mod.value = "committe";
		}
		var checkLength = $("input:checkbox[name=eduFacCodeArr]:checked").length ; 
		frm.checkLength.value = checkLength;
		form.qu.value = qu;
		$("#frm").attr("action", "/academy/tutor/lectureExec.do"); 
		form.submit();
	}else{
		return false;
	}
} 

function entrstClickEvt(entrstYear){
	$('#entrstYear').val(entrstYear);
	$("#frm").attr("action", "/academy/tutor/lectureDetail.do").submit();
}

//탭이동
function fnTab(url, tabNo) {
	$("#tabNo").val(tabNo);
	$("#qu").val('');
	$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
}


var cnt = 1;

function fnPopUp(){
	$('#layer_04').css('display' , 'block');
}

</script>
<div class="container" id="Subcontent">
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
			<section class="bgTop_cate06"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			 <h2 class="h2_tit">강사정보관리</h2>
	            		</div>           	
	          	  </section>

			<div class="contents" id="sContents">
				<!-- 본문 > 메인 > 목록 시작  -->
				<form name="frm" id="frm" action="/academy/tutor/lectureExec.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="slno" value="<c:out value="${REQUEST_DATA.slno}"/>"/>
				<input type="hidden" name="tabNo" id="tabNo" value="${REQUEST_DATA.tabNo}"/>
				<input type="hidden" name="lecUserno" id="lecUserno" value=""/>
				<input type="hidden" name="userno" id="userno" value="${REQUEST_DATA.userno}"/>
				<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
				<input type="hidden" name="delCheckFile" value=""/>
				<input type="hidden" name="qu" id="qu" value=""/>
				<input type="hidden" name="mod" id="mod" value=""/>
				<input type="hidden" name="mtTutorFileCode" id="mtTutorFileCode" value=""/>
				<input type="hidden" name="mtScCode" id="mtScCode" value="${REQUEST_DATA.mtScCode }"/>
				<input type="hidden" name="saveFile" id="saveFile" value=""/>
				<input type="hidden" name="tutorHisYn" id="tutorHisYn" value="${REQUEST_DATA.tutorHisYn }"/>
				<input type="hidden" name="filename" id="filename" value=""/>
				<input type="hidden" name="ftype" id="ftype" value=""/>
				<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
				<input type="hidden" name="lecturedown" id="lecturedown" value=""/>
				<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
				<input type="hidden" name="checkLength" id="checkLength" value=""/>
				<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
				<input type="hidden" name="mtFieldCode" id="mtFieldCode" value="${REQUEST_DATA.mtFieldCode }"/>
				<!-- 2019-03-11 추가 -->
				<input type="hidden" name="searchText" id="searchText" value="<c:out value='${REQUEST_DATA.searchText}'/>"/>
				<input type="hidden" name="searchStartDt" id="searchStartDt" value="<c:out value='${REQUEST_DATA.searchStartDt}'/>"/>
				<input type="hidden" name="searchEndDt" id="searchEndDt" value="<c:out value='${REQUEST_DATA.searchEndDt}'/>"/>
				<h3 class="main_tit">방문교육 신청정보</h3>
                            <!-- table -->
                            <section class="tableBox">
                                <div class="tblWrap">
                                    <table class="writeForm">
                                        <caption>방문교육 강의이력 상세</caption>
                                        <colgroup>
                                            <col style="width:25%">
                                            <col style="width:*">
                                        </colgroup>
                                        <tbody>
                                           <tr>
												<th scope="row">신청자 성명</th>
												<td><c:out value="${infoResult.APPLY_NM}"/></td>
											</tr>
											<tr>
												<th scope="row">신청자 소속</th>
												<td><c:out value="${infoResult.APPLY_ORGAN_NM}"/></td>
											</tr>
											<tr>
												<th scope="row">지역</th>
												<td>
												<c:out value="${infoResult.LE_LNM_ADRES1}"/>&nbsp;<c:out value="${infoResult.LE_LNM_ADRES2}"/>
												</td>
											</tr>
											<tr>
												<th scope="row">교육장소</th>
												<td><c:out value="${infoResult.EDU_AREA}"/></td>
											</tr>
											<tr>
												<th scope="row">유선전화</th>
												<td><c:out value="${infoResult.APPLY_TEL}"/></td>
											</tr>
											<tr>
												<th scope="row">휴대전화</th>
												<td><c:out value="${infoResult.APPLY_PHONE}"/></td>
											</tr>
											<tr>
												<th scope="row">이메일 주소</th>
												<td><c:out value="${infoResult.APPLY_EMAIL}"/></td>
											</tr>
											<tr>
												<th scope="row">교육 협의일시</th>
												<td>
												<c:out value="${infoResult.DS_SDATE}"/> ~ <c:out value="${infoResult.DS_EDATE}"/>
												</td>
											</tr>
											<tr>
												<th scope="row">교육 대상</th>
												<td><c:out value="${infoResult.LEC_TARET_NAME}"/></td>
											</tr>
											<tr>
												<th scope="row">참석인원</th>
												<td><c:out value="${infoResult.PERSON_CNT}"/></td>
											</tr>
											<tr>
												<th scope="row">교육 희망주제</th>
												<td><c:out value="${infoResult.mtLctreName}"/></td>
											</tr>
											<tr>
												<th scope="row">기타 요청사항</th>
												<td><c:out value="${infoResult.EDU_CONTENTS}"/></td>
											</tr>
                                        </tbody>
                                    </table>
                                </div>

                            </section>
				<!--// table -->

                            <hr class="hr_40">
							
							
							<h3 class="main_tit">강사 결과보고</h3>
                            <!-- table -->
                            <section class="tableBox">
                                <div class="tblWrap">

                                    <fieldset>
                                        <legend>강사 결과보고</legend>

                                        <table class="writeForm">
                                            <caption>강사 결과보고(참석인원 출장비 만족도 등)</caption>
                                            <colgroup>
                                                <col style="width:25%">
                                                <col style="width:*">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row"><label for="attdNum">참석인원</label></th>
                                                    <td>
                                                        <div class="form-inline rightTxt">
                                                            <div class="form-group">
                                                            	<input type="text" id="comCnt" name="comCnt" title="참석인원" class="form-control i-numOnly" value='<c:out value="${infoResult.COM_CNT}"/>'>
                                                            </div>
                                                            <span class="inputWon">명</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%-- <tr>
                                                    <th scope="row"><label for="travExp">출장비</label></th>
                                                    <td>
                                                        <div class="form-inline rightTxt">
                                                            <div class="form-group">
                                                            	<input type="text" id="ptrps" name="ptrps" title="출장비" class="form-control i-numOnly" value='<c:out value="${infoResult.PTRPS}"/>'>
                                                            </div>
                                                            <span class="inputWon">원</span>
                                                        </div>
                                                    </td>
                                                </tr> --%>
                                                <tr>
                                                    <th scope="row">만족도(수강생)</th>
                                                    <td>
                                                        <label class="radio-inline">
                                                        	<input type="radio" name="applyScore" value="1" <c:if test="${infoResult.APPLY_SCORE eq '1'}"> checked="checked"</c:if>/>매우만족
                                                        </label>
                                                        <label class="radio-inline">
                                                        	<input type="radio" name="applyScore" value="2" <c:if test="${infoResult.APPLY_SCORE eq '2'}"> checked="checked"</c:if>/>만족
                                                        </label>
                                                        <label class="radio-inline">
                                                        	<input type="radio" name="applyScore" value="3" <c:if test="${infoResult.APPLY_SCORE eq '3'}"> checked="checked"</c:if>/>보통
                                                        </label>
                                                        <label class="radio-inline">
                                                        	<input type="radio" name="applyScore" value="4" <c:if test="${infoResult.APPLY_SCORE eq '4'}"> checked="checked"</c:if>/>불만
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="applyScore" value="5" <c:if test="${infoResult.APPLY_SCORE eq '5'}"> checked="checked"</c:if>/>매우불만
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">만족도(수요처)</th>
                                                    <td>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="organScore" value="1" <c:if test="${infoResult.ORGAN_SCORE eq '1'}"> checked="checked"</c:if>/>매우만족
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="organScore" value="2" <c:if test="${infoResult.ORGAN_SCORE eq '2'}"> checked="checked"</c:if>/>만족
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="organScore" value="3" <c:if test="${infoResult.ORGAN_SCORE eq '3'}"> checked="checked"</c:if>/>보통
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="organScore" value="4" <c:if test="${infoResult.ORGAN_SCORE eq '4'}"> checked="checked"</c:if>/>불만
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" name="organScore" value="5" <c:if test="${infoResult.ORGAN_SCORE eq '5'}"> checked="checked"</c:if>/>매우불만
                                                        </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">교육확인서</th>
                                                    <td>
                                                        <div class="form-inline">
                                                        
                                                        	<c:forEach items="${fileList}" var="result" varStatus="status">
										            		<c:if test="${infoResult.SLNO ne null && result.MT_TUTOR_FILE_CODE eq 'TF0001' }">
										            		<c:set value="${status.count}" var="file1"/>
										            			
										            			<div class="form-group">
										            				<p class="a_file"><a class="a_file" href="#none"  title="첨부파일 다운로드"onclick="filedown('<c:out value="${result.ORGFILE}" />');return false" ><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</a></p>
	                                                            </div>
	                                                            <div class="form-group">
	                                                            	<button onclick="deleteReportFile('<c:out value="${result.MT_TUTOR_FILE_CODE}"/>' , '<c:out value="${result.SLNO}"/>' , '<c:out value="${result.SAVFILE}"/>' , '<c:out value="${result.SAVPATH}"/>');return false"  class="btn btn-orange btn-sm" title="삭제">삭제</button>
	                                                            </div>
										            		</c:if>
										            		</c:forEach>
											            	<c:if test="${file1 == null}">
											            		<div class="form-group">
											            			<label for="uploadFile1" class="btn btn-sm btn-default">파일선택</label><input type="file" name="uploadFile1" id="uploadFile1" style="display: none;" onchange="javascript: document.getElementById('fileName1').value = this.value">
											            		</div>
											            		<div class="form-group">
	                                                            	<input type="text" id="fileName1" class="form-control" readonly="readonly">
	                                                            </div>
															</c:if>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </fieldset>
                                </div>

                                <div class="btnAreaC mrg_t30">
                                    <button type="button" onclick="fnSave('update'); return false;" class="btn btn-blue btn-lg" title="확인">확인</button>
                                    <button type="button" onclick="fnList(); return false;" class="btn btn-gray btn-lg" title="취소">취소</button>
                                </div>

                            </section>

			</div><!-- //contents-->

		</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->
	</article>
</div>

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->