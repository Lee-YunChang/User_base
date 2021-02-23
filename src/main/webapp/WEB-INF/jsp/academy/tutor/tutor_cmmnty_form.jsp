<%
/****************************************************
    system	: 시스템관리 > 커뮤니티코드관리 > 등록폼
    title	: 커뮤니티코드관리
    summary	:
    wdate	: 2013-08-23
    writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

	var cnt = 1;
	function fnAdd() {
		cnt = $("#filesCount").val();
		if (cnt > 8) {
			alert('9개까지 등록 가능합니다.');
			return;
		}
		cnt ++;
		var str = '';
		
		    str = str + "<div id='eduDate_"+cnt+"' class='input-wrap mb15'>";
		    str = str + "<div class='file-wrap'>";
		    str = str + "<input type='text' id='fileName"+cnt+"' class='inputtxt size2' readonly='readonly'>";
		    str = str + "<div class='file_input_div'>";
		    str = str + "<input type='button' value='불러오기' class='btn-m gray'>";
		    str = str + "<input type='file' id='uploadFile"+cnt+"' name='uploadFile"+cnt+"' class='file_input_hidden' onchange='fnChange("+cnt+", this.value , 0);'>";
		    str = str + "</div>";
		    str = str + "</div>";
		    str = str + "<span class='timebtn'>";
		    str = str + "<button class='scale-up' onclick='fnAdd();return false' title='추가'>추가</button> ";
		    str = str + "<button class='scale-down' onclick='fnDel("+cnt+");return false' title='삭제'>삭제</button>";
		    str = str + "</span>";
		    str = str + "</div>";
		    
		 $(".td-input-wrap").append(str);

	     $("#cnt").val(cnt);
	     $("#filesCount").val(cnt);
	}
	
	var delNum = "";
	//파일 변경값
	function fnChange( num, pval , fileId) {
		
		if(fileId != 0){
			if(confirm("기존파일은 삭제됩니다 수정하시겠습니까")){
				delNum = fileId + "," + delNum ;
				$("#fileName"+num).val(pval);
			}else{
				$("#fileName"+num).clear();
				return false;
			}
		}
		$("#fileName"+num).val(pval);
		$("#delNum").val(delNum);
	}
	
	function fnDel(val) {
		if ( $(".td-input-wrap").children().length == 1) {
			alert("더이상 삭제하실 수 없습니다.");
			$(".td-input-wrap").children().attr("id","eduDate_1");
			$(".td-input-wrap").children().find(".inputtxt").attr("id","fileName1");
			$(".td-input-wrap").children().find(".file_input_hidden").attr("id","uploadFile1");
			$(".td-input-wrap").children().find(".file_input_hidden").attr("name","uploadFile1");
			$(".td-input-wrap").children().find(".file_input_hidden").attr("onchange","1, this.value, 0");
			$(".td-input-wrap").children().find(".scale-down").attr("onclick","fnDel(1);return false");
			return;
		}
		var row = $("#eduDate_"+val);
		row.fadeOut("fast", function()
		{
			cnt--;
			row.remove();
			$("#cnt").val(cnt);
			$("#filesCount").val(cnt);
		});
 	}
	
	function tutorSubFormCheckPopUp(qu){
		if(qu == 'insert' || qu == 'reply'){
			$('#layer_03').css('display' , 'block');
		}
		if(qu == 'update'){
			$('#layer_04').css('display' , 'block');
		}
	}
	
	function displayNone(popUp){
		$('#'+popUp).css('display' , 'none');
	}
	
	//수정
	function tutorSubFormCheck(qu){
		var form = document.pform;
    	oEditors.getById["summary"].exec("UPDATE_CONTENTS_FIELD", []);
    	
        if(form.title.value == ''){
            alert('제목을 입력해 주세요.');
            form.title.focus();
            return;
        }
		form.summary.value = document.getElementById("summary").value;
		
		var str=form.summary.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			return false;
		} 
		
		form.qu.value = qu ;
		
		$("#pform").attr("mothod" , "post").attr("action" , "/academy/tutor/tutorcmmntySubInsert.do");
		form.submit();
	};

	/* 게시판내용 */
	function fnTab(bbsNo , bbsAnswerAt, tabNo){
		var pform = document.pform;
		pform.bbsNo.value = bbsNo;
		pform.bbsAnswerAt.value = bbsAnswerAt;
		$("#tabNo").val(tabNo);
		$("form[name=pform]").attr("action" , "/academy/tutor/tutorCmmntyList.do").submit();
		
	}
	function fnList() {
		$("#pform").attr("action" , "/academy/tutor/tutorCmmntyList.do");
		$("#pform").submit();
	}
	
	//삭제
	function delBtn(fileId , cnt , savePath , saveFile){
		var fileId = fileId;
		var cnt = cnt;
		var savePath = savePath;
		var saveFile = saveFile;
		
		if(fileId != ''){
			if(confirm("기존파일을 삭제하시겠습니까?")){
		        $.ajax({
		            url : "/academy/tutor/deleteCmmntyFileAjax.do",
		            data : {fileId : fileId, type : 'D' , savePath : savePath , saveFile : saveFile},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == 'SUCCESS'){
		            		alert("삭제되었습니다.");	
		            	}else{
		            		alert('fail');
		            	}
		            	
		            	//parentsTr.remove();
		            	$("#eduDate_"+cnt).remove();
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
		        }); 
			}
		}else{
			//parentsTr.remove();
			$("#eduDate_"+cnt).remove();
		}
	}
	
</script>

<div class="contents-wrap f502">

	<div class="sub-wrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>강사공간</span></li>
				<li class="location"><span>강사커뮤니티</span></li>
			</ul>

			<div class="sub-tit">
				<h3>강사커뮤니티</h3>
				<p>상상스토리 위촉강사들의 커뮤니티 공간입니다.</p>
			</div>
			<div class="contents" id="sContents">
				<form name="pform" id="pform" action="" enctype="multipart/form-data" method="post">
				<input type="hidden" name="bbsNo" id="bbsNo" value="${REQUEST_DATA.bbsNo}">
				<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
				<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
				<input type="hidden" name="nttNo" id="nttNo" value="${UPDATE_DATA.NTTNO}">
				<input type="hidden" name="nttDepth" id="nttDepth" value="${UPDATE_DATA.NTT_DEPTH}">
				<input type="hidden" name="qu" id="qu" value="">
				<input type="hidden" name="cnt" id="cnt" value="">
				<input type="hidden" name="useAt" id="useN" value="Y">
				<input type="hidden" name="searchMode" id="searchMode" value="title"><!-- 제목으로만 검색 -->
				<input type="hidden" name="pageMode" id="pageMode" value="">
				<input type="hidden" name="delNum" id="delNum" value=""/> 
				<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.tutorFilePath"))%>"/>
				<input type="hidden" name="bbsAnswerAt" id="bbsAnswerAt" value="${REQUEST_DATA.bbsAnswerAt}" />
				<input type="hidden" name="filesCount" id="filesCount" value="${REQUEST_DATA.fileSCount+1}" />
				<c:if test="${REQUEST_DATA.qu eq 'reply' }">
					<input type="hidden" name="noticeAt" id="noticeAt" value="${REQUEST_DATA.bbsNoticeAt}" />
				</c:if>
				
				
				<div class="tabArea">
					<ul class="tabMenu hmredu_d bg-org">
						<c:forEach var="result" items="${LIST_DATA}" varStatus="status">
							<li class="<c:if test="${REQUEST_DATA.tabNo == status.index}"> on</c:if><c:if test="${REQUEST_DATA.tabNo != status.index}"> off</c:if>">
								<a href="#none" onclick="fnTab('<c:out value="${result.BBSNO}"/>' , '<c:out value="${result.BBS_ANSWER_AT}"/>', '<c:out value="${status.index}"/>'); return false;">
									<span>
											<c:out value="${fn:substring(result.BBS_NAME,0,10)}"/><c:if test="${fn:length(result.BBS_NAME)>10}">...</c:if>
									</span>
								</a>
							</li>
						</c:forEach>
					</ul> 

					<div class="tabCon" id="tab-con01">

						<div class="con-tbl">
							<table class="sub-table write">
								<caption>강사커뮤니티 등록 폼 테이블</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td>
											<c:choose>
												<c:when test="${UPDATE_DATA.NTTNO eq '' }">
													<input type="text" name="title" id="title" class="inputtxt large" title="제목 입력"  />
												</c:when>
												<c:when test="${UPDATE_DATA.NTTNO ne '' && REQUEST_DATA.qu eq 'reply'}">
													<input type="text" name="title" id="title" class="inputtxt large" title="제목 입력"  value="RE: ${UPDATE_DATA.TITLE} "/>
												</c:when>
												<c:otherwise>
													<input type="text" name="title" id="title" class="inputtxt large" title="제목 입력"  value="${UPDATE_DATA.TITLE} "/>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<c:if test="${REQUEST_DATA.qu ne 'reply' && REQUEST_DATA.bbsNoticeAt eq 'Y'}">
										<tr>
											<th scope="row">공지여부</th>
											<td>
												<span class="checks mr20">
													<input type="radio"name="noticeAt" id="noticeAtY" value="Y" <c:if test="${UPDATE_DATA.NOTICE_AT eq 'Y'}">checked="checked"</c:if> title="공지">
													<label for="noticeAtY">공지</label>
												</span>
												<span class="checks">
													<input type="radio" name="noticeAt" id="noticeAtN" value="N" <c:if test="${UPDATE_DATA.NOTICE_AT ne 'Y' || UPDATE_DATA.NOTICE_AT == '' }">checked="checked"</c:if> title="공지안함">
													<label for="noticeAtN">공지안함</label>
												</span>
											</td>
										</tr>
									</c:if>
									<c:if test="${REQUEST_DATA.qu eq 'reply' && REQUEST_DATA.bbsNoticeAt eq 'N'}">
										<input type="hidden" name="noticeAt" id="noticeAtN" value="N" />
									</c:if>
									
									<tr>
										<td colspan="2" class="editer">
											<div style="min-height:350px;">
							                   <!-- [필수]에디터 안에 글내용 영역 -->
							                   	<textarea name="summary" id="summary" rows="22" style="width:100%;" >
							                   	<c:if test="${REQUEST_DATA.qu eq 'update' }">
						                   			<c:out value="${UPDATE_DATA.SUMMARY}" escapeXml="false"/>
						                   		</c:if>
						                   		<c:if test="${REQUEST_DATA.qu eq 'reply' }">
						                   			<br>
						                   			<br>
						                   			<span>------------------------------------------------------------------------------------------------------</span>
						                   			<br>
						                   			<c:out value="${UPDATE_DATA.SUMMARY}" escapeXml="false"/>
						                   			
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
									
										<tr id="fileTr">
										
										<th scope="row">첨부파일</th>
										<td class="td-input-wrap">
										<c:if test="${REQUEST_DATA.qu eq 'update'}">
											<c:forEach var="fileList" items="${fileList}" varStatus="status">
											<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
												<div  id="eduDate_${status.count}" class="input-wrap mb15">
													<div class="file-wrap">
														<input type="text" id="fileName${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
														<div class="file_input_div">
														  <input type="button" value="불러오기" class="btn-m gray">
														  <input type="file" id="uploadFile${status.count}" name="uploadFile${status.count}" class="file_input_hidden"  onchange="fnChange( ${status.count}, this.value , ${fileList.FILE_ID});">
														</div>
													</div>
													<span class="timebtn">
														<button class="scale-up" onclick="fnAdd();return false" title="추가">추가</button>
														<button class="scale-down" onclick="delBtn('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${status.count}"/>' , '<c:out value="${fileList.SAVPATH}"/>' , '<c:out value="${fileList.SAVFILE}"/>');return false" title="삭제">삭제</button>
													</span>
												</div>
											</c:forEach>
										</c:if>
										<div  id="eduDate_${REQUEST_DATA.fileSCount+1}" class="input-wrap mb15">
											<div class="file-wrap">
												<input type="text" id="fileName${REQUEST_DATA.fileSCount+1}" class="inputtxt size2" readonly="readonly" >
												<div class="file_input_div">
												  <input type="button" value="불러오기" class="btn-m gray">
												  <input type="file" id="uploadFile${REQUEST_DATA.fileSCount+1}" name="uploadFile${REQUEST_DATA.fileSCount+1}" class="file_input_hidden" onchange="fnChange(${REQUEST_DATA.fileSCount+1}, this.value , 0);">
												</div>
											</div>
											<span class="timebtn">
												<button class="scale-up" onclick="fnAdd();return false" title="추가">추가</button>
												<button class="scale-down" onclick="fnDel(${REQUEST_DATA.fileSCount+1});return false" title="삭제">삭제</button>
											</span>
										</div>
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
						</div>

						<ul class="btn-list">
							<c:set var="pageModeReg" value='<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>' />
							<c:if test="${REQUEST_DATA.pageMode eq pageModeReg}">
								<li><a href="#none" onclick="tutorSubFormCheckPopUp('<c:out value="${REQUEST_DATA.qu}"/>'); return false;" class="btn signup" title="등록">등록</a></li>
							</c:if>
							<c:if test="${REQUEST_DATA.pageMode ne pageModeReg}">
								<li><a href="#none" onclick="tutorSubFormCheckPopUp('update'); return false;" class="btn signup" title="수정">수정</a></li>
							</c:if>
							<li><a href="#none" onclick="fnList(); return false;" class="btn list">취소</a></li>
						</ul>
						
						<div class="layer_popup" id="layer_03" style="display: none;">
							<div class="layer-tit">
								<p>등록</p>
								<button class="layer_close pop_close" onclick="displayNone('layer_03');return false;" title="등록">등록</button>
							</div>
							<div class="layer_bg bg3">
								<p>등록하시겠습니까?</p>
								<button class="btn-m pop_close" onclick="tutorSubFormCheck('<c:out value="${REQUEST_DATA.qu}"/>');return false;" title="등록">등록</button>
							</div>
						</div>
						<div class="layer_popup" id="layer_04" style="display: none;">
							<div class="layer-tit">
								<p>수정</p>
								<button class="layer_close pop_close" onclick="displayNone('layer_03');return false;" title="닫기">닫기</button>
							</div>
							<div class="layer_bg bg4">
								<p>수정하시겠습니까?</p>
								<button class="btn-m pop_close" onclick="tutorSubFormCheck('update'); return false;" title="수정">수정</button>
							</div>
						</div>


					</div><!-- // tab1 -->
				</div>
				</form>


				<p class="ar"><a href="#header" class="btn-top">TOP</a></p>


			</div><!-- //contents-->



		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->


<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>