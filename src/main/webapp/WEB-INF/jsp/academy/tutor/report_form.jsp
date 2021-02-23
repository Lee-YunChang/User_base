<%
/****************************************************
	system	: 나의강의 > 보고서 제출
	title	: 보고서 제출 폼
	summary	:	
	wdate	: 2016-09-26
	writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	//파일추가
	var num=2;
	function fnAdd() {
		if ( $(".td-input-wrap").children(".input-wrap").length > 8) {
			alert('9개까지 등록 가능합니다.');
			return;
		}
		$(".td-input-wrap").append("<div id='eduDate_' class='input-wrap mb15'><div class='file-wrap'><input type='text' id='fileName"+num+"' class='inputtxt size2' readonly='readonly' ><div class='file_input_div'><input type='button' value='불러오기' class='btn-m gray'><input type='file' id='uploadFile' name='uploadFile' class='file_input_hidden' onchange='fnChange("+num+",this.value);'></div></div><span class='timebtn'><button class='scale-up' onclick='fnAdd();return false' title='추가'>추가</button>	<button class='scale-down' id='fnDel' title='삭제' onclick='return false'>삭제</button></span></div>");
		num++;	
	}

	//파일 변경값
	function fnChange(num, pval) {
		$("#fileName"+num).val(pval);
		
	}

	//파일 인풋 박스 삭제
	$(document).on('click', '#fnDel', function(){ 
		if ( $(".td-input-wrap").children("#eduDate_").length == 1) {
			alert("더 이상 삭제하실 수 없습니다.");
			return false;
		}
		$(this).closest("#eduDate_").remove();
		
	});
	
	function entrstClickEvt(entrstYear){
		$('#entrstYear').val(entrstYear);
		$("#frm").attr("action", "/academy/tutor/reportForm.do").submit();
	}
	//탭이동
	function fnTab(url, tabNo) {
		$("#tabNo").val(tabNo);
		$("#qu").val('');
		$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
	}

	//등록
	function insertPopUp(){
		$('#layer_03').css('display' , 'block');
	}
	
	//등록
	function insertExec(qu , mod){
		var form = document.frm ; 
		var count=0;
		$('.file_input_hidden').each(function(index, element) {
		 	if($(this).val().length > 0) { //객관식
		 		$(this).attr("name","uploadFile"+count);
		 		count++;
			}
		});
		$("#mod").val(mod);
		if(qu == 'insert'){
			$("#qu").val(qu);
			$("#frm").attr("action", "/academy/tutor/reportInsertExec.do").submit();
		} 
	}
	
	//삭제 체크
	function delCheck(count){
		if($("#imgCheck"+count).length > 0){
			if(confirm('첨부 파일은 하나만 등록할 수 있습니다. 기존의 파일을 삭제 후 수정 하시겠습니까?')){
			}
		}
	}
	
	//정보 불러오기
	function reload(){
		var form = document.frm;
		$("#frm").attr('action' , '/academy/tutor/reportForm.do').submit();
	} 
	
	//분야선택
	function selectTitle(selectTitle){
		$("#frm").attr("action","/academy/tutor/reportForm.do");
		$("#frm").submit();
	}
</script>
<div class="contents-wrap c502">

		<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp"%>

			<div class="sub-contents">
					<ul class="sub-navi">
						<li><span>HOME</span></li>
						<li><span>강사공간</span></li>
						<li class="location"><span>강사정보관리</span></li>
					</ul>

					<div class="sub-tit">
						<h3>강사정보관리</h3>
						<p>상상스토리 위촉강사들의 정보를 관리할 수 있는 공간입니다.</p>
					</div>
					<form name="frm" id="frm" action=""  method="post" enctype="multipart/form-data">
					<input type="hidden" name="entrstYear" id="entrstYear" value="${REQUEST_DATA.entrstYear}"/>
					<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
					<input type="hidden" name="mtReportTypeCode" id="mtReportTypeCode" value="${REQUEST_DATA.mtReportTypeCode }"/>
					<input type="hidden" name="userno" id="userno" value="${REQUEST_DATA.userno}"/>
					<input type="hidden" name="qu" id="qu" value=""/>
					<input type="hidden" name="mod" id="mod" value=""/>
					<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
					<input type="hidden" name="delCheckFile" value=""/>
					
						
						<div class="contents" id="sContents">

						<div class="tabArea">
							<ul class="tabMenu type02">
								<li class="tab0 <c:if test="${REQUEST_DATA.tabNo == 0}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 0}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureDetail.do', '0'); return false;"><span class="all"><em>정보 관리</em></span></a></li>
								<li class="tab1 <c:if test="${REQUEST_DATA.tabNo == 1}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 1}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureHisList.do', '1'); return false;"><span class="area1"><em>경력 관리</em></span></a></li>
								<li class="tab2 <c:if test="${REQUEST_DATA.tabNo == 2}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 2}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureCommitteeList.do', '2'); return false;"><span class="area2"><em>강의이력</em></span></a></li>
								<li class="tab3 <c:if test="${REQUEST_DATA.tabNo == 3}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 3}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lecturePersonalList.do', '3'); return false;"><span class="area3"><em>개인 강의이력</em></span></a></li>
								<li class="tab4 <c:if test="${REQUEST_DATA.tabNo == 4}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 4}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/evaluationList.do', '4'); return false;"><span class="area4"><em>평가 이력 관리</em></span></a></li>
								<li class="tab5 <c:if test="${REQUEST_DATA.tabNo == 5}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != 5}"> off</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/reportList.do', '5'); return false;"><span class="area5"><em>보고서 제출</em></span></a></li>
							</ul>

							<div class="tabCon" id="tab-con06">

								<div class="con-tbl">
									<table class="sub-table">
										<caption>평가 이력관리 테이블</caption>
										<colgroup>
											<col style="">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">항목 선택</th>
												<td>
													<!-- onclick="reload();" 제거 -->
													<span class="checks mr20">
													<input type="radio" id="radio-01" name="mtTutorFileCode"   <c:if test="${REQUEST_DATA.mtTutorFileCode eq 'TF0004'}">checked="checked"</c:if> value="TF0004" />
													<label for="radio-01">참관보고서</label>
													</span>
													<span class="checks mr20">
													<input type="radio" id="radio-02" name="mtTutorFileCode"  <c:if test="${REQUEST_DATA.mtTutorFileCode eq 'TF0005' }">checked="checked"</c:if>  value="TF0005" />
													<label for="radio-02">연구모임 활동보고서</label>
													</span>
													<span class="checks">
													<input type="radio" id="radio-03" name="mtTutorFileCode"  <c:if test="${REQUEST_DATA.mtTutorFileCode eq 'TF0007' }">checked="checked"</c:if>  value="TF0007" />
													<label for="radio-03">기타</label>
													</span>
												</td>
											</tr>
											<tr>
												<th scope="row" class="va-t">파일 불러오기</th>
												
												<td class="td-input-wrap">
													<div  id="eduDate_${status.count}" class="input-wrap mb15"  style="height:25px">
														<div class="file-wrap">
															<input type="text" id="fileName1" class="inputtxt size2" readonly="readonly">
															<div class="file_input_div">
															  <input type="button" value="불러오기" class="btn-m gray">
															  <input type="file" id="uploadFile1" name="uploadFile" class="file_input_hidden" onchange="fnChange(1,this.value);">
															</div>
														</div>
														<span class="timebtn">
															<button class="scale-up" onclick="fnAdd();return false" title="추가">추가</button>
															<button class="scale-down" id="fnDel"  title="삭제">삭제</button>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								
							<ul class="btn-list">
								<li><a href="#" onclick="insertPopUp();return false" class="btn signup">등록</a></li>
							</ul> <!-- // btn list -->

							<div class="layer_popup" id="layer_03" style="display: none;">
								<div class="layer-tit">
									<p>등록</p>
									<button class="layer_close pop_close" onclick="return false" title="닫기">닫기</button>
								</div>
								<div class="layer_bg bg3">
									<p>등록하시겠습니까?</p>
									<button class="btn-m pop_close" onclick="insertExec('insert' , 'report');return false" title="등록" >등록</button>
								</div>
							</div>
							
							</div><!-- // tab6 -->
						</div>
						<p class="ar"><a href="#header" class="btn-top">TOP</a></p>


					</div><!-- //contents-->
				</form>

				</div><!-- //sub-contents -->
		</div>
</div>

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->						