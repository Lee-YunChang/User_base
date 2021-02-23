<%
	/****************************************************
	 system	: 지원센터 > 자료실 > 자료실 상세
	 title	: 자료실 상세
	 summary	:
	 wdate	: 2016-06-01
	 writer	: SANGS
	 *****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/counsel_header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
    $(".content img").each(function(){
        $(this).attr("alt", $("#bbsTitle").val());
        $(this).attr("title", $("#bbsTitle").val());
    });
    
    $('body').on('click','.updBtn',function(e){
    	e.preventDefault();
    	var values = $(this).attr('value').split('/');
    	replyModifyForm(values[0],values[1],values[2],values[3])
    	
    });
});
//이전/다음 상세보기
function fnView(mode, bbsNo){
    if(bbsNo == 0){
        if(mode == 'pre') alert('첫 페이지입니다.');
        if(mode == 'next') alert('마지막 페이지입니다.');

    } else if(bbsNo != ''){
        $('#bbsNo').val(bbsNo);
        $('#bbsForm').attr('action', '/academy/counselor/boardDataView.do').submit();
    }
}

//파일다운로드
function counselorfiledown(fileId, bbsNo, fileSeq){
	var form = document.frm;
	form.fileId.value = fileId;
	form.bbsNo.value = bbsNo;
	form.fileSeq.value = fileSeq;
	
	$("#frm").attr("action", "/academy/counselorFiledown.do").submit();
}

//다음버튼 클릭
function nextClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/counselor/boardDataView.do").submit();
	}else{
		alert("처음페이지 입니다.");
		return;
	}
}

//이전버튼 클릭
function prevClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/counselor/boardDataView.do").submit();
	}else{
		alert("처음페이지 입니다.");
		return;
	}
}

//목록 버튼 클릭
function mainList(){
	$("#frm").attr("action", "/academy/counselor/boardList.do").submit();
}


function fnList(){
    $('form[name="bbsForm"]').attr('action', '<c:out value="${ctx}"/>/academy/counselor/boardDataList.do').attr('target', '_self').submit();
}

function fnDown(fname,type){
    $('#filename').val(encodeURIComponent(fname));
    $('#ftype').val(type);
    $('form[name="bbsForm"]').attr('action', '/academy/filedown.do').submit();
}

function counselFormExec(){
	oEditors.getById["an_content"].exec("UPDATE_CONTENTS_FIELD", []);
	frm.an_content.value = document.getElementById("an_content").value;
	 
    //내용
	var str=frm.an_content.value;
	
	str = str.replace(/&nbsp;/g,"");
	str = str.replace(/<p>/g,"");
	str = str.replace(/<\/p>/g,"");
	str = str.replace(/\r\n/g,"");
	
	if(str.length<=0) {
		alert("내용을 입력해 주세요.");
		return false;
	}
    var fileNum = $("#filesCount").val() * 1 + 1;
    
    if(confirm("저장하시겠습니까?")) {
		$(".td-input-wrap").children("#eduDate_").each(function(){
			$(this).attr("id","eduDate_"+fileNum);
			$(this).children().find(".inputtxt").attr("id","fileName"+fileNum);
			$(this).children().find(".file_input_hidden").attr("id","uploadFile"+fileNum);
			$(this).children().find(".file_input_hidden").attr("name","uploadFile"+fileNum);
			$(this).children().find(".file_input_hidden").attr("onchange",fileNum+", this.value, 0");
			$(this).children().find(".scale-down").attr("onclick","fnDel("+fileNum +");return false");
			fileNum = fileNum + 1;
		});
		$("#frm").attr("action", "/academy/counselor/counselDataFormExec.do").submit();
	}
    
}

//파일 삭제
function deleteReportFile(fileId , fileSeq , saveFile , saveFilePath, cnt){
    var cnt = cnt;
    var fileId = fileId;
	var fileSeq = fileSeq;
	var saveFilePath = saveFilePath;
	var saveFile = saveFile;
		if(confirm("기존파일을 삭제하시겠습니까?")){
	         $.ajax({
	            url : "/academy/tutor/deleteTutorBoardFile.do",
	            data : {fileId : fileId, fileSeq : fileSeq , saveFilePath : saveFilePath , saveFile : saveFile},
	            dataType : "json",
	            type : 'post',
	            success : function(res) { 
	            	if(res == "SUCCESS"){
	            		alert("삭제되었습니다.");
	            	}else{
	            		alert('fail');
	            	}
	            	$("#eduDate_"+cnt).remove();
	            },
	            error : function(e) {
	                alert("error :" + e.responseText);
	            }
	        });  
		}else {
			return;
		}
}


var cnt = 1;

// 파일 추가
function fnAdd() {
if($("#count").val() != ''){
	cnt = $("#count").val();
}
cnt++;
$("#count").val(cnt);

if (cnt > 8) {
	alert('9개까지 등록 가능합니다.');
	return;
}
$(".td-input-wrap").append("<div id='eduDate_' class='input-wrap mb15'><div class='file-wrap'><input type='hidden' id='fileName' class='inputtxt size2' readonly='readonly' ><div class='file_input_div'> <input type='file' id='uploadFile' name='uploadFile' class='file_input_hidden' onchange='fnChange(this.value , 0);'>	<span class='timebtn'><button class='add_btn_plus' type='button' onclick='fnAdd();return false' title='추가 'style='margin-right:3px;'></button><button class='add_btn_minus' type='button' id='fnDel' title='삭제'></button></span></div></div></div>");
}

// 파일 삭제
$(document).on('click', '#fnDel', function(){ 
/* if ( $(".td-input-wrap").children("#eduDate_").length == 1) {
	alert("더이상 삭제하실 수 없습니다.");
	return;
} */

var cnt = $("#count").val();

cnt -= 1;

$("#count").val(cnt);

$(this).closest("#eduDate_").remove();
});
</script>
<div class="container" id="Subcontent">
	<article class="subArea">
		<div class="subCntWrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_counsel.jsp"%>
			<div class="path">
				<ul>
					<li><span class="home text-hide">홈</span></li>
					<li>알림마당</li>
					<li class="active"><c:out value="${categoryData.BCATENAME}" /></li>
				</ul>
			</div>
			<div class="subConts" id="sub-content">
				<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit"><c:out value="${categoryData.BCATENAME}"/></h2>
            		</div>           	
	            </section>

				<div class="contents" id="sContents">
					<form name="frm" id="frm" action="" method="post" enctype="multipart/form-data">
						<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
						<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
						<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}" /> 
						<input type="hidden" name="bbsNo" id="bbsNo" value="<c:out value="${REQUEST_DATA.bbsNo}"/>" /> 
						<input type="hidden" name="fileId" id="fileId" value="" /> 
						<input type="hidden" name="fileSeq" id="fileSeq" value="" />
						<input type="hidden" name="qu" id="qu" value="update"/>
						<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
						<input type="hidden" name="delCheckFile" value=""/>
					    <input type="hidden" name="oFileNo" id="fileId" value=""/>
						<input type="hidden" name="filename" id="filename" value=""/>
						<input type="hidden" name="ftype" id="ftype" value=""/>
						<input type="hidden" name="saveFile" id="saveFile" value=""/>
						<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
						
						<input type="hidden" name="count" id="count" value="${fn:length(listData)}" />
						
						<input type="hidden" name="filesCount" id="filesCount" value="${fn:length(listData)}" />

					<section class="tableBox">
						<div class="tblWrap">
							<table class="writeForm type03">
								<caption><c:out value="${categoryData.BCATENAME}" /> 글상세</caption>
								<colgroup>
									<col style="width: 20%">
									<col style="width: 30%">
									<col style="width: 20%">
									<col style="width: 30%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td colspan="3"><c:out value="${rowData.TITLE}" /></td>
									</tr>
									<tr>
										<th scope="row">작성일</th>
										<td><c:out value="${rowData.WDATE}" /></td>
										<th scope="row">신청자</th>
										<td><c:out value="${rowData.APPLYNM}" /></td>
									</tr>
									<tr>
										<th scope="row">분야</th>
										<td><c:out value="${rowData.MT_CATE_NAME}" /></td>
										<th scope="row">직종</th>
										<td><c:out value="${rowData.MT_JOB_NAME}" /></td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td colspan="3">
											<c:choose>
												<c:when test="${empty listData}">
													<p>첨부파일이 없습니다.</p>
												</c:when>
												<c:when test="${not empty listData}">
													<c:forEach items="${listData}" var="result" varStatus="status">
														<p class="a_file"><a class="a_file" href="#none" onclick="counselorfiledown('<c:out value="${result.FILE_ID}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.FILE_SEQ}" />');return false"class="btn-down" title="첨부파일 다운로드"><c:out value="${result.ORGFILE}" /></a></p>
													</c:forEach>
												</c:when>
											</c:choose>
										</td>
									</tr>
										<tr>
											<td colspan="4" class="td_cont">
												<div style="min-height: 252px">
													<c:out value="${rowData.CONTENT}" escapeXml="false" />
												</div>
											</td>
										</tr>
										<tr>
											<th scope="row">상담사</th>
											<td><c:out value="${rowData.AN_USERNM}" /></td>
											<th scope="row">답변일자</th>
											<td><c:out value="${rowData.AN_WATE}" /></td>
										</tr>
										 <tr>					         
										    <td class="td_cont_input" style="width:100%;" colspan="4">
										    	<div>
										        	<!-- [필수]에디터 안에 글내용 영역 -->
										            <textarea name="an_content" id="an_content" rows="22"  style="width:100%;" ><c:out value="${rowData.AN_CONTENT}" escapeXml="false"/></textarea>
										        </div>
										        <script type="text/javascript">
													var oEditors = [];
													nhn.husky.EZCreator.createInIFrame({
														oAppRef: oEditors,
														elPlaceHolder: "an_content",
														sSkinURI: "/academy/common/smarteditor/SmartEditor2Skin.html",
														fCreator: "createSEditor2"
													});
												</script>
										    </td>
										  </tr>
										<tr>
							        	<th scope="row">파일첨부</th>
											<td class="td-input-wrap" colspan="3">
											<c:choose>
												<c:when test="${not empty listData}">
												<c:forEach var="fileList" items="${listData}" varStatus="status">
												<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
													<div  id="eduDate_${status.count}" class="input-wrap mb15"  >
															<input type="hidden" id="fileName2${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
															<%-- <a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down"> --%>
																<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
															<!-- </a> -->
															<span class="timebtn">
																<a class="scale-down btn red small delbtn" onclick="deleteReportFile('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.FILE_SEQ}"/>' , '<c:out value="${fileList.SAVFILE}"/>' ,'<c:out value="${fileList.SAVPATH}"/>', '<c:out value="${status.count}"/>');return false"  title="삭제">삭제</a>
															</span>
															<c:if test="${status.count eq fn:length(listData)}">
															<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
															<div class="file_input_div">
															  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
																<span class="timebtn">
																	<button class="add_btn_plus" type="button" onclick="fnAdd();return false" title="추가"></button>
																	<!-- <button class="add_btn_minus" type="button" id="fnDel" title="삭제"></button> -->
																</span>
															</c:if>
													</div>
													</div>
												</c:forEach>
												</c:when>
											<c:when test="${empty listData}">
											<div  id="eduDate_" class="input-wrap mb15">
												<div class="file-wrap">
													<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
													<div class="file_input_div">
													  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
														<span class="timebtn">
															<button class="add_btn_plus" type="button" onclick="fnAdd();return false" title="추가"></button>
															<!-- <button class="add_btn_minus" type="button" id="fnDel" title="삭제"></button> -->
														</span>
													</div>
												</div>
											</div>
											</c:when>
											</c:choose>
											</td>
							        </tr>
								</tbody>
							</table>
						</div>
						<hr>
						
						<div class="btnAreaR">.
							<a href="#none" onclick="counselFormExec();return false" class="btn btn-orange btn-sm" title="저장">저장</a>
							<a href="#none" onclick="javascript:history.back();" class="btn btn-drkblue btn-sm" title="취소">취소</a>
						</div>
						<hr>
					</section>
					</form>
				</div>
				<!-- //contents-->

			</div>
			<!-- //sub-contents -->

		</div>
		<!-- //sub-wrap -->
	</article>
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->