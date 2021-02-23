<%@page import="com.sangs.util.StringUtil"%>
<%
/****************************************
	system	: ClassDesk > 강사 > 토론 등록폼
	title	: 토론 목록
	summary	:	
	wdate   : 2016-10-13
	writer  : 구동림
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="topMenuCode" value="main"/>

<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassDiscuss')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassDiscuss')}">discuss</c:if>
</c:set>

<script type="text/javascript">
		
		// 상시참여 체크하면 날짜 선택란 안보임
		jQuery(document).ready(function(){
			$('#hideshowdate').show();
			if($('#bbsNo').val() > 0) {
				//alert('수정창');
				$('#ordtmAt').change(function () {
					if (!this.checked) 
			        	 $('#hideshowdate').show();
					else 
			        	$('#hideshowdate').hide();
				});
			} else {
				//alert('등록창');
				$('#ordtmAt').change(function () {
			        if (!this.checked) 
			        	 $('#hideshowdate').show();
			        else 
			        	$('#hideshowdate').hide();
			    });
			}
		SANGS.Util.datepickerCallOptions($('#dscsnSdate'), $('#dscsnEdate'));
			
		});	 
		

		function fnSave(bbsNo){
	        if($('#title').val().length <= 0){
	            alert('제목을 입력해 주세요.');
	            $('#title').focus();
	            return false;
	        }  
	        
	        var form = document.discussForm; 
			
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

			/* if($('#refStep').val() > 0) {
				form.refStep.value = document.getElementById("refStep").value;
			} */
			
			
 				$("#bbsNo").val(bbsNo);
				$('#discussForm')
				.attr('action', '/classdesk/user/discuss/exec.do')
				.attr('target', '_self')
				.submit(); 
				
		}
		
		function fnSavePop(qu){
			if(qu == 'update'){
				$('#layer_04').css('display' , 'block');
			}else if(qu == 'reply'){
				$('#layer_03').css('display' , 'block');
			}
		}
	    
</script>
<div class="contents-wrap">
			<div class="sub-wrap">
				<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
					<div class="sub-contents">
						<ul class="sub-navi">
							<li><span>HOME</span></li>
							<li><span>내강의실</span></li>
							<li class="location"><span>토론</span></li>
						</ul>
						
					<div class="sub-tit">
						<h3>토론</h3>
						<p class="ellipsis">
							<c:choose>
								<c:when test="${REQUEST_DATA.ctypeName eq '집합교육' }">
									<span class="new_tit-bd"><span class="new_tit bg3">집합교육</span></span>
								</c:when>
								<c:when test="${REQUEST_DATA.ctypeName eq '사이버교육' }">
									<span class="new_tit-bd"><span class="new_tit bg4">온라인교육</span></span>
								</c:when>
								<c:when test="${REQUEST_DATA.ctypeName eq '의무교육' }">
									<span class="new_tit-bd"><span class="new_tit bg2">의무교육</span></span>
								</c:when>
							</c:choose>
							<c:out value="${REQUEST_DATA.seqTitle}"/>
						</p>
					</div>
					<div class="contents" id="sContents">
						<form id="discussForm" name="discussForm" action="" enctype="multipart/form-data" method="post">
							<input type="hidden" name="pbcateno"  id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
					 		<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
							<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
							<input type="hidden" name="grpNo"  	id="grpNo" 		value="${REQUEST_DATA.grpNo}"/>
							<input type="hidden" name="userNo"  	id="userNo" 	value="${REQUEST_DATA.userNo}"/>
							<input type="hidden" name="topYn"  		id="topYn" 		value="${REQUEST_DATA.topYn}"/>
							<input type="hidden" name="qu"  id="qu" value="${REQUEST_DATA.qu }"/>
							<input type="hidden" name="fileId" value="<c:out value="${rowData.FILE_ID}"/>"/>
							<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.classDeskDiscussFilePath"))%>"/>
					 		<input type="hidden" name="refLevel"  id="refLevel" value="<c:out value="${REQUEST_DATA.refLevel}" />"/>
							<input type="hidden" name="refStep"  id="refStep" value="<c:out value="${REQUEST_DATA.refStep}" />"/>
							<input type="hidden" name="CLASSDESK"  id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}" />"/>
							<input type="hidden" name="savePath"  id="savePath" value="<c:out value="${rowData.SAVPATH}" />"/>
							<input type="hidden" name="saveFile"  id="saveFile" value="<c:out value="${rowData.SAVFILE}" />"/>
							<input type="hidden" name="ordtmAt"  id="ordtmAt" value="<c:out value="${topData.ORDTM_AT}" />"/>
							<input type="hidden" name="dscsnEdate"  id="dscsnEdate" value="<c:out value="${topData.DSCSN_EDATE}" />"/>
							<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
						<h3 class="con-tit">토론 내용</h3>
						<div class="con-tbl">
							<table class="sub-table">
								<caption>토론 내용:토론명,토론기간,배점,과제내용,첨부파일을 설명하는 테이블</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">토론명</th>
										<td class="bold"><c:out value="${topData.TITLE}"/></td>
									</tr>
									<tr>
										<th scope="row">토론기간</th>
										<td><c:out value="${topData.WDATE}"/> ~ <c:out value="${topData.DSCSN_EDATE}"/></td>
									</tr>
									<tr>
										<th scope="row">배점</th>
										<td>10점</td>
									</tr>
									<tr>
										<th scope="row">토론내용</th>
										<td><c:out value="${topData.CONTENT}" escapeXml="false"/></td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td colspan="3">
											<c:if test="${not empty topData.FILE_ID}">
												<a href="#none" class="btn-down" onclick="filedown('<c:out value="${topData.SAVFILE}"/>');return false" title="첨부파일 다운로드"><c:out value="${topData.ORGFILE}"/> (<c:out value="${topData. FILE_SIZE}"/>)KB</a>
											</c:if>
											<c:if test="${empty topData.SAVFILE }">
												<span>등록된 파일이 없습니다.</span>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<h3 class="con-tit">토론 등록</h3>
						<div class="con-tbl">
							<table class="sub-table write">
								<caption>토론 등록:토론등록의 제목,글쓰기내용,첨부파일을 설명하는 테이블</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td>
											<c:if test="${REQUEST_DATA.qu eq 'update'}">
												<input type="text" class="inputtxt large" id="title" name="title" title="제목 입력" value="${rowData.TITLE}">
											</c:if>
											<c:if test="${REQUEST_DATA.qu eq 'reply'}">
												<input type="text" class="inputtxt large" id="title" name="title" title="제목 입력" value="RE : ${rowData.TITLE}">
											</c:if>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="editer">
											<div style="min-height:350px;">
							                   <!-- [필수]에디터 안에 글내용 영역 -->
							                   	<textarea name="summary" id="summary" rows="22" style="width:100%;" >
							                   		<c:if test="${REQUEST_DATA.qu eq 'update'}"><c:out value="${rowData.CONTENT}"/></c:if>
							                   		<c:if test="${REQUEST_DATA.qu eq 'reply'}">
								                   		<br>
							                   			<br>
							                   			<span>------------------------------------------------------------------------------------------------------</span>
							                   			<br>
							                   			<c:out value="${rowData.CONTENT}"/>
							                   		</c:if>
							                   </textarea>
							                   
											</div>
											<script type="text/javascript">
											var oEditors = [];
											nhn.husky.EZCreator.createInIFrame({
											    oAppRef: oEditors,
											    elPlaceHolder: "summary",
											    sSkinURI: "/academy/common/smarteditor/SmartEditor2Skin.html",
											    fCreator: "createSEditor2"
											});
											</script>
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
											<div class="file-wrap">
												<input type="text" id="fileName0" class="inputtxt size2" readonly="readonly" value="<c:out value="${rowData.ORGFILE}"/>" title="첨부파일">
												<div class="file_input_div">
												  <input type="button" value="불러오기" class="btn-m gray">
												  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="javascript: document.getElementById('fileName0').value = this.value" title="첨부파일">
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<ul class="btn-list">
							<li><button type="submit" onclick="fnSavePop('<c:out value="${REQUEST_DATA.qu}"/>');return false;" class="btn signup" title="등록">등록</button></li>
							<li><a href="javascript:window.history.back();" class="btn list" title="취소">취소</a></li>
						</ul>
						
						<div class="layer_popup" id="layer_04" style="display: none;">
							<div class="layer-tit">
								<p>수정</p>
								<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
							</div>
							<div class="layer_bg bg4">
								<p>수정하시겠습니까?</p>
								<button class="btn-m pop_close" onclick="fnSave('<c:out value="${REQUEST_DATA.bbsNo}"/>');return false;" title="수정">수정</button>
							</div>
						</div>
						
						<div class="layer_popup" id="layer_03" style="display: none;">
								<div class="layer-tit">
									<p>등록</p>
									<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
								</div>
								<div class="layer_bg bg3">
									<p>등록하시겠습니까?</p>
									<button class="btn-m pop_close"  onclick="fnSave('<c:out value="${REQUEST_DATA.bbsNo}"/>');return false;" title="닫기">등록</button>
								</div>
							</div>
						</div>
						
						<p class="ar"><a href="#none" class="btn-top" title="TOP">TOP</a></p>

					</form>
					</div><!-- //contents-->
				</div><!-- //sub-contents -->
			</div>
</div>			
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>