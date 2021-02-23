<%
/****************************************************
	system	: 대출의무교육 > 시설운영자금대출 폼
	title	: 수강과정 목록
	summary	:	
	wdate	: 2016-09-19
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 
	
<script type="text/javascript">
//파일추가
function fnChange(num, pval) {
	$("#fileName"+num).val(pval);
}
$(document).ready(function(){
	var applyYn = '<c:out value="${rowData.APPLY_YN}"/>' ;
	if(applyYn == 'Y'){
		$('#saveTag').css('display' , 'none');
		$('#failTag').css('display' , 'block');
		$('#classMove').css('display' , 'block');
	}else if(applyYn == 'N'){
		$('#saveTag').css('display' , 'block');
		$('#failTag').css('display' , 'none');
		$('#classMove').css('display' , 'none');
	}
});


//시설유형코드 onchange
function fnFcltsTypeCode(obj1, obj2){
	//var phtml = '';
	//$("#area2").html(phtml);
	ajaxSpecialAreaCategory({
		mtCode : "<%=SangsProperties.getProperty("Globals.mtCode_MT_JOB_KND_CODE")%>"
		, name : "fcltsTypeCode"
		, target : "select_container2"
		, value1 : obj1
		, value2 : obj2
	});
}

function ajaxSpecialAreaCategory(p) {

	$.ajax({
		url : "/academy/common/ajaxCategory.do",
		type : "POST",
		dataType : "html",
		data : {
			"mtCode" : p.mtCode
			,"ref3" : p.value1
			,"mtSubCode" : p.value2
		},
		success : function(data) {
			
			$("#"+p.target).html("");
			var html = "<select name='jobKndCode' title='직종선택' id='jobKndCode' >";
			html = html+ data;
			html = html + "</select>";
		
			$("#"+p.target).html(html);
			$("#"+p.target).jqTransform();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("데이터를 불러오는데 실패하였습니다.(error : "+errorThrown+")");
		}
	});
}

function fnList() {
	$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/cptalMain.do').submit();
}

function fnApplyResult(){
	//location.href='/academy/course/common/applyResult.do';
	$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/common/applyResult.do').submit();
}

function fnResult(courseno, cseqno, duplVal){
	$('#resultForm > input[name="cseqno"]').val(cseqno);
	$('#resultForm > input[name="courseno"]').val(courseno);
	
	$('form[name=frm]').attr('method', 'post').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do').submit();
}	

function fnReturnPage(pmode){
	if('on' == pmode) {
		location.href='/academy/course/onMain.do';	
	} else if('off' == pmode){
		location.href='/academy/course/offMain.do';	
	}
}

//강의실로이동
function fnMove() {
	var targetYn = $('#targetYn').val();
	if(targetYn.trim() == 'Y'){
		$("#frm").attr("action", "/classdesk/main/main.do");
		$("#frm").submit();
	}else{
		alert("선발인원이 아닙니다.");
		return;
	}
}

//수강취소
function fnCancel() {
	if(confirm('수강신청을 취소 하시겠습니까?')) {
		if( $('#multipleCancelYn').val() == 'Y'){
         alert('취소중입니다 잠시만 기다려주세요.');
         return false;
     }

     $('#multipleCancelYn').val('Y');
     $('#frm').attr('target', '_self').attr('method', 'post').attr('action', '<c:out value="${ctx}"/>/academy/course/common/cancel_exec.do').submit();
	}
}


//기관 검색팝업
function fnCompanyPop(){
	var form = document.frm;
	var orgName = $("#orgName").val();
	//window.open.opener.test(orgName);
	
	$("#searchWord").val(orgName);
  	window.open("/academy/user/memberCompanyJoin.do","companyPop","width=950,height=750, scrollbars=YES");
  	form.action = "/academy/user/memberCompanyJoin.do";
  	form.target = "companyPop" ;
  	form.method = "post";
  	form.submit();
}

//기관/단체명 결과 콜백
function fnCodePopupCallBack(data){
	$("#orgName").val(data.orgName);
	$("#comno").val(data.comNo);
	$("#comname").val(data.comname);
	$("#orgCode").val(data.orgCode);
}
	
//파일다운로드
function filedown(fileid, fileseq){
	$('#fileid').val(fileid);
	$('#fileseq').val(fileseq);
	$('form[name=frm]').attr('action', '/academy/course/filedown.do').submit();
}

//수강신청ajax
var submitted = false;
function fnSaveAjax(sugangYn,openType){
	if(submitted == true) { 
		alert('수강신청 처리중 입니다. 잠시만 기다려주세요.');
		return; 
	}
	var frmData = $('form[name=frm]').serialize();
	var toDate = new Date();
	var year = toDate.getFullYear().toString();
    var month = (toDate.getMonth() + 1).toString();
    var day = toDate.getDate().toString();
    if(day.length < 2){
    	day = '0'+day;
    }
    var today = year+'-'+month+'-'+day;

    var fileSubmitYn = $('#fileSubmitYn').val();
    var temp = '';
    if(fileSubmitYn=='Y'){
	    $('input:file').each(function(index, element) {
	    	temp = temp+$(this).val();
		});
	    if(temp.length == 0){//파일 등록 안했으면
	    	alert('첨부파일을 등록하여 주세요.');
	    	return false;
	    }
    }
    
    if(sugangYn == 'Y'  || openType == 'A'){
    	$.ajax({
    		url : '/academy/course/common/apply_ajaxExec.do',
    		type : 'post',
    		data : frmData,
    		dataType : 'json',
    		success : function(data) {
    			if(data.msg == 'fail'){
    				alert('수강신청에 실패하였습니다.');
    			} else if(data.msg == 'max'){
    				alert('신청인원이 초과되어 수강신청에 실패하였습니다.');
    			} else{
    				//fileUpload(data);
    				$('#layer_01').css('display' , 'block');
    				$('#failTag').css('display' , 'block');
    				$('#classMove').css('display' , 'block');
    				$('#saveTag').css('display' , 'none');
    				$('#cuserno').val(data.msg);
    				$("#targetYn").val(data.targetYn);
    		    	submitted = true;
    			}
    		}
    	});
    }else{
    	alert("수강신청 기간이 아닙니다.");
    }
}

function fileUpload(data) {
	
	var fileSubmitYn = $('#fileSubmitYn').val();
    var temp = '';
    var idx = 0;
    if(fileSubmitYn=='Y'){
	    $('input:file').each(function(index, element) {
	    	temp = temp+$(this).val();
	    	idx++;
		});
	    if(temp.length == 0){//파일 등록 안했으면
	    	alert('첨부파일을 등록하여 주세요.');
	    	return false;
	    }
    }
	var formData = new FormData(); 
	for(var i = 0 ; i < idx ; i ++ ){
		formData.append("uploadFile"+i, $("input[name=uploadFile]")[i].files[0]); 
	}
	formData.append("cseqno", $("input[name=cseqno]").val());
	formData.append("UPLOAD_DIR", $("input[name=UPLOAD_DIR]").val());
	formData.append("cuserno", data);
	
	$.ajax({ 
		url: '/academy/course/common/apply_saveFile.do',
		data: formData, 
		processData: false, 
		contentType: false, 
		type: 'POST',
		success: function(data)
		{ 
			$('#layer_01').css('display' , 'block');
			$('#failTag').css('display' , 'block');
			$('#classMove').css('display' , 'block');
			$('#saveTag').css('display' , 'none');
			$('#cuserno').val(data);
		} 
	});

}


//수강취소ajax
function fnCancelAjax(){
	var frmData = $('form[name=frm]').serialize();
	var cancelYn = '<c:out value="${REQUEST_DATA.cancelYn}"/>'
	if(cancelYn  == 'N'){
		alert('신청취소 기간이 아닙니다.');
		return;
	}else{
		$.ajax({
			url : '/academy/course/common/cancel_ajaxExec.do',
			type : 'post',
			data : frmData,
			dataType : 'json',
			success : function(data) {
				if(data == 'fail'){
					alert('수강취소에 실패하였습니다.');
				}
				if(data == 'succsess'){
					$('#layer_02').css('display' , 'block');
					$('#failTag').css('display' , 'none');
					$('#classMove').css('display' , 'none');
					$('#saveTag').css('display' , 'block');
					$('#cuserno').val('');
				}
			}
		});
	}	
}

</script>

<div class="contents-wrap c303">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_cpsedu_course.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>대출의무교육</span></li>
				<li class="location"><span>시설운영자금대출</span></li>
			</ul>

			<div class="sub-tit">
				<h3>시설운영자금대출</h3>
			</div>

			<form name="frm" id="frm" action="/academy/course/cptalForm.do" method="post">
			<input type="hidden" name="goodname" value="<c:out value="${rowData.SEQ_TITLE}"/>"/>
			<input type="hidden" name="price" value="<c:out value="${rowData.PRICE}"/>"/>
			<input type="hidden" name="searchWord" id="searchWord" value=""/> 
			<input type="hidden" name="cseqno" id="cseqno"  value="<c:out value="${rowData.CSEQNO}"/>"/>
			<input type="hidden" name="courseno" id="courseno"  value="<c:out value="${rowData.COURSENO}"/>"/>
			<input type="hidden" name="cuserno" id="cuserno"  value="<c:out value="${rowData.CUSERNO}"/>"/>
			<input type="hidden" name="targetYn" id="targetYn"  value="<c:out value="${rowData.TARGETYN}"/>"/>
			<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value='${REQUEST_DATA.mtScCode}'/>"/>
			<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
			<input type="hidden" name="applyChk" id="applyChk" value="N"/><!-- 과정 중복수강방지 -->
			<input type="hidden" name="multipleCancelYn" id="multipleCancelYn" value="N" />
			<input type="hidden" name="startDate"  id="startDate" value="<c:out value="${rowData.STUDY_SDATE}"/>">
			<input type="hidden" name="endDate"  id="endDate" value="<c:out value="${rowData.STUDY_EDATE}"/>">
			<input type="hidden" name="fileid"  id="fileid" value="">
			<input type="hidden" name="fileseq"  id="fileseq" value="">
		
			<!-- 강의실 이동 -->
			<input type="hidden" name="paramcSeqNo" id="paramcSeqNo"  value="<c:out value="${rowData.CSEQNO}"/>"/>
			<input type="hidden" name="paramCourseNo" id="paramCourseNo"  value="<c:out value="${rowData.COURSENO}"/>"/>
			<input type="hidden" name="paramcUserNo" id="paramcUserNo"  value="<c:out value="${rowData.CUSERNO}"/>"/>
			<input type="hidden" name="CLASSDESK" id="CLASSDESK"  value="<c:out value="${rowData.CLASS_DESK}"/>"/>
			
			<input type="hidden" id="fileSubmitYn" value="<c:out value="${rowData.FILE_SUBMIT_YN}"/>"/>
				
			<div class="contents" id="sContents">
				<h3 class="con-tit">과정안내</h3>
				<div class="con-tbl">
					<table class="sub-table">
						<caption>과정안내 테이블 : 이 표는 과정안내 테이블입니다.</caption>
						<colgroup>
							<col style="">
							<col style="width:auto">
						</colgroup>
						<tbody>
						<c:if test="${rowData.MT_CTYPE_CODE == 'DAAA00'}">
							<tr>
								<th scope="row">과정분류</th>
								<td><c:out value="${rowData.MT_SC_NAME}"/></td>
							</tr>
							<tr>
								<th scope="row">교육과정명</th>
								<td class="txt_blue bold"><c:out value="${rowData.SEQ_TITLE}"/></td>
							</tr>
							<tr>
								<th scope="row">신청기간</th>
								<td>
									<c:if test="${rowData.OPENTYPE == 'D'}">
										<c:out value="${rowData.APPLY_SDATE}"/> ~ <c:out value="${rowData.APPLY_EDATE}"/>
									</c:if>
									
									<c:if test="${rowData.OPENTYPE == 'A'}">상시운영</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row">교육기간</th>
								<td>
									<c:if test="${rowData.OPENTYPE == 'D'}">
										<c:out value="${rowData.STUDY_SDATE}"/> ~ <c:out value="${rowData.STUDY_EDATE}"/>
									</c:if>
									<c:if test="${rowData.OPENTYPE == 'A'}">
										신청일로부터 <c:out value="${rowData.EDUDAY}"/>일 이내
									</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row">1일학습량</th>
								<td><c:out value="${rowData.STUDYTIME}"/>차시</td>
							</tr>
							<tr>
								<th>과정설명</th>
								<td><c:out value="${fn:replace(rowData.RESULT_DESCRIPTION, newline, '<br>')}" escapeXml="false"/></td>
							</tr>
							<tr>
								<th>교육대상</th>
								<td><c:out value="${fn:replace(rowData.RESULT_TARGET, newline, '<br>')}" escapeXml="false"/></td>
							</tr>
							<tr>
								<th scope="row">평가방법</th>
								<td><c:out value="${rowData.COMPLETION}"/></td>
							</tr>
							<tr>
								<th scope="row">수료기준점수</th>
								<td><c:out value="${rowData.COMP_VAL}"/>점</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<c:if test="${not empty fileMap }">
										<c:forEach var="file" items="${fileMap}" varStatus="status">
											<a href="#none" onclick="filedown('<c:out value="${file.FILE_ID}"/>', '<c:out value="${file.FILE_SEQ}"/>');" class="btn-down" title="첨부파일 다운로드">${file.SAVFILE}</a>	
										</c:forEach>
									</c:if>
									<c:if test="${empty fileMap }"><c:out value="첨부파일이 없습니다."/></c:if>
								</td>
							</tr>
						</c:if>
						<c:if test="${rowData.MT_CTYPE_CODE == 'DAAA01'}">
							<tr>
								<th scope="row">과정분류</th>
								<td><c:out value="${rowData.MT_SC_NAME}"/></td>
							</tr>
							<tr>
								<th scope="row">교육과정명</th>
								<td class="txt_blue bold"><c:out value="${rowData.SEQ_TITLE}"/></td>
							</tr>
							<tr>
								<th scope="row">신청기간</th>
								<td>
									<c:if test="${rowData.OPENTYPE == 'D'}">
										<c:out value="${rowData.APPLY_SDATE}"/> ~ <c:out value="${rowData.APPLY_EDATE}"/>
									</c:if>
									
									<c:if test="${rowData.OPENTYPE == 'A'}">상시운영</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row">교육기간</th>
								<td>
									<c:if test="${rowData.OPENTYPE == 'D'}">
										<c:out value="${rowData.STUDY_SDATE}"/> ~ <c:out value="${rowData.STUDY_EDATE}"/>
									</c:if>
									<c:if test="${rowData.OPENTYPE == 'A'}">
										신청일로부터 <c:out value="${rowData.EDUDAY}"/>일 이내
									</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row">교육장소</th>
								<td><c:out value="${rowData.EDU_PLACE}"/></td>
							</tr>
							<tr>
								<th scope="row">교육시간</th>
								<td><c:out value="${rowData.STUDYTIME_TOT}"/>시간</td>
							</tr>
							<tr>
								<th>과정설명</th>
								<td><c:out value="${fn:replace(rowData.RESULT_DESCRIPTION, newline, '<br>')}" escapeXml="false"/></td>
							</tr>
							<tr>
								<th>교육대상</th>
								<td><c:out value="${fn:replace(rowData.RESULT_TARGET, newline, '<br>')}" escapeXml="false"/></td>
							</tr>
							<tr>
								<th scope="row">신청인원</th>
								<td><span><c:out value="${rowData.COURSE_USER_CNT}"/>명</span>/<span class="txt_red bold"><c:out value="${rowData.MAX_CNT}"/>명</span></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<c:if test="${not empty fileMap }">
										<c:forEach var="file" items="${fileMap}" varStatus="status">
											<a href="#none" onclick="filedown('<c:out value="${file.FILE_ID}"/>', '<c:out value="${file.FILE_SEQ}"/>');" class="btn-down" title="첨부파일 다운로드">${file.SAVFILE}</a>	
										</c:forEach>
									</c:if>
									<c:if test="${empty fileMap }"><c:out value="첨부파일이 없습니다."/></c:if>
								</td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</div>
				
				<%-- <form id="ajaxform" action="/academy/course/common/apply_saveFile.do" method="post" enctype="multipart/form-data"> 
					<input type="hidden" name="cseqno" id="cseqno"  value="<c:out value="${rowData.CSEQNO}"/>"/>
					<input type="hidden" id="fileSubmitYn" value="<c:out value="${rowData.FILE_SUBMIT_YN}"/>"/>
						<c:if test="${rowData.FILE_SUBMIT_YN eq 'Y'}">
							<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.leCourseUserFilePath")%>"/>
							<h3 class="con-tit">첨부파일등록</h3>
							<div class="con-tbl">
								<table class="sub-table">
									<caption>첨부 파일 등록 테이블 : 이 표는 첨부 파일 등록 테이블입니다.</caption>
									<colgroup>
										<col style="">
										<col style="width:auto">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="va-t">파일 불러오기<span class="mark">*<em class="hidden">필수항목</em></span></th>
											<td class="td-input-wrap">
												<div class="file-wrap">
													<input type="text" id="fileName1" class="inputtxt size2" readonly="readonly">
													<div class="file_input_div">
													  <input type="button" value="불러오기" class="btn-m gray">
													  <input type="file" id="uploadFile1" name="uploadFile" class="file_input_hidden" onchange="fnChange(1,this.value);">
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:if>
					</form> --%>
				<ul class="btn-list">
					<li id="saveTag"><a href="#none" onclick="fnSaveAjax('<c:out value="${rowData.SUGANG_YN}"/>', '<c:out value="${rowData.OPENTYPE}"/>');return false;" class="btn signup" title="수강신청">수강신청</a></li>
					<li id="classMove"><a href="#none" onclick="fnMove(); return false;" class="btn lecture" title="강의실이동">강의실 이동</a></li>
					<li id="failTag"><a href="#none" onclick="fnCancelAjax(); return false;" class="btn cancel" title="신청취소">신청취소</a></li>
					<li><a href="#none" onclick="fnList(); return false;" class="btn list" title="목록">목록</a></li>
				</ul> 
				<!-- // btn list -->
				
				
				<div class="layer_popup" id="layer_01" style="display: none;">
					<div class="layer-tit">
						<p>신청완료</p>
						<button title="닫기" class="layer_close pop_close" onclick="return false;">닫기</button>
					</div>
					<div class="layer_bg bg1">
						<p>신청 되었습니다.</p>
						<button title="닫기" class="btn-m pop_close" onclick="return false;">닫기</button>
					</div>
				</div>
				
				
				<div class="layer_popup" id="layer_02" style="display: none;">
					<div class="layer-tit">
						<p>신청취소</p>
						<button title="닫기" class="layer_close pop_close" onclick="return false;">닫기</button>
					</div>
					<div class="layer_bg bg1">
						<p>신청이 취소되었습니다.</p>
						<button title="닫기" class="btn-m pop_close" onclick="return false;">닫기</button>
					</div>
				</div>
				
				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
				
			</div><!-- //contents-->
			</form>

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->
	
<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->