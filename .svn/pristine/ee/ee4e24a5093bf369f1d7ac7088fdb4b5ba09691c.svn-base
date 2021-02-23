<%
/* *******************************************
    system  : 나의강의실 > 공지사항
    title   : 공지사항
    summary :	
    wdate   : 2016-09-01
    writer  : SANGS
******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassData')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassNotice')}">공지사항</c:if>
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassData')}">자료실</c:if>
</c:set>

<script type="text/javascript"> 

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "summary",
	    sSkinURI: "/admin/common/smarteditor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
	jQuery(document).ready(function(){
		SANGS.Util.datepickerCallOptions($('#sdate'), $('#edate'));
	});	
	
	// 페이징 이동 함수
	function fnList() {
		$('#bbsForm').attr('target', '_self').attr('method', 'get').attr('action', '/classdesk/bbs/list.do').submit();
	}
	
	/* function fnCancle(){
		if(confirm('취소하시겠습니까?')){
		    $('#taskForm').attr('action', '/classdesk/bbs/list.do').submit();
		}
	} */
	
	function fnSave(){ 
	    if($('#title').valueEmpty()){
	        alert('제목을 입력해 주세요.');
	        $('#title').focus();
	        return false;
	    }  
	    
	    var form = document.bbsForm; 
	    form.fileId.value=fileUploadObj1.fileId;
	    oEditors.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
	    form.summary.value = document.getElementById("summary").value;
	 	//내용 필수 입력
		var str=form.summary.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		} 
	     
	    
			if(confirm('등록하시겠습니까?')){
				$('#bbsForm')
				.attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/exec.do')
				.attr('target', '_cm')
				.submit();
			}
	}
	
	function send1(){
		fileUploadObj1.startUpload('board');
	}
	
	function uploadCompleted1(){
		fileUploadObj1.refresh('board'); 
	}
	
</script>

<div class="contents-wrap">

	<div class="sub-wrap">
			
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><a href="#none" title="HOME">HOME</a></li>
				<li><a href="#none" title="내강의실">내강의실</a></li>
				<li class="location"><a href="#none" title="<c:out value="${topMenuCode}"/>"><c:out value="${topMenuCode}"/></a></li>
			</ul>

			<div class="sub-tit">
				<h3><c:out value="${topMenuCode}"/></h3>
			</div>
			
			<form id="bbsForm"  name="bbsForm"  action="" enctype="multipart/form-data" method="post">
 			<input type="hidden" name="pbcateno"  id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
 			<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
			<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
			<input type="hidden" name="fileId" value="<c:out value="fileUploadObj1.fileId"/>"/>
 			<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.bbsFilePath"))%>"/>
 			<input type="hidden" name="CLASSDESK"  		id="CLASSDESK" 		value="${REQUEST_DATA.CLASSDESK }"/>
 			
			<div class="table-type2">
				<table>
					<caption>클래스데스크 게시판:상상스토리 교육시스템의 클래스데스크 게시판입니다.</caption>
					<colgroup>
						<col width="20%" />
						<col width="15%" />
						<col width="35%" />
						<col width="35%" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="2"><label for="task-title">제목</label><input type="text" class="w98" id="title" name="title" id="task-title" value='<c:out value="${rowData.TITLE}" />' title="<c:out value="${rowData.TITLE}" />"/></td>
						</tr>
						
						<tr>
							<th>공개여부</th>
							<td>
								<input type="radio" name="openAt" id="openAt" value="Y" title="공개"><span>공개</span>
								<input type="radio" name="openAt" id="openAt" value="N" title="미공개"><span>미공개</span>
							</td>
							<th>공개여부</th>
							<td>
								<input type="radio" name="topYn" id="topYn" value="Y" title="고정"><span>고정</span>
								<input type="radio" name="topYn" id="topYn" value="N" title="고정안함"><span>고정 안함</span>
							</td>
						</tr>
						
						<tr>
							<th>상위고정</th>
							<td style="padding:20px 10px 20px 10px;" colspan="2">
					               <div>
					                   <!-- [필수]에디터 안에 글내용 영역 -->
					                   <textarea title="내용" name="summary" id="summary" rows="22" style="width:100%;" ><c:out value="${rowData.CONTENT}" escapeXml="false"/></textarea>
					                   <%-- <ckeditor:replace replace="content" basePath="${pageContext.request.contextPath}/admin/common/ckeditor" config="${ckeditorSettings}" ></ckeditor:replace> --%>
					               </div>
					         </td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<!-- //과제출제 테이블 -->
		<!-- 라운드박스 구성요소 -->
		<div class="top"></div>
		<div class="bottom"></div>
		<div class="left"></div>
		<div class="right"></div>
		<div class="top-left"></div>
		<div class="top-right"></div>
		<div class="bottom-left"></div>
		<div class="bottom-right"></div>
		<!-- //라운드박스 구성요소 -->
		
		<div class="table-btn-group">
			<div class="btn-table"> 
				<c:if test="${REQUEST_DATA.SES_GRADENO >= TUTORGRADENO}"> 
					<a href="#none"  onclick="fnSave(); return false;" class="btn-large-blue" title="게시글 저장"><span>저장</span></a>
	 			</c:if>
			</div>
			<div class="btn-table left">
	 			<a href="#none"  onclick="fnList(); return false;"  class="btn-large-orange" title="게시글 취소"><span>취소</span></a> 
			</div>
		</div>
		<!-- //게시판 버튼영역 -->
		</form>

	</div><!-- //sub-contents -->

</div><!-- //sub-wrap -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>
