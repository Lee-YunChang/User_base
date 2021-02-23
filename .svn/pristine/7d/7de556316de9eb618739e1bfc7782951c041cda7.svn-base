<%
/****************************************
    system  : ClassDesk > 강사 > BBS 내용보기(수정)
    title   : 과제 목록
    summary :   
    wdate   : 2016-09-12
    writer  : 구동림
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>


<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassDiscuss')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassDiscuss')}">discuss</c:if>
</c:set>

	<script type="text/javascript">
	
		// 페이징 이동 함수
		function fnList() {
			$('#discussForm').attr('target', '_self').attr('action', '/classdesk/user/discuss/list.do').submit();
		}
		
		// 게시글 추천 반대 함수
		function rcmnd(ask, rj) {
			//이미 추천/반대한 사용자인지 확인
			if($('#rcmndUserno').val() > 0) {
				alert('이미 투표하셨습니다.');
				return false;
			}
			
			if(confirm('정말 '+ask+'하시겠습니까? 돌이킬 수 없습니다.')){
				$('#rcmndSeCode').val(rj);
				$('#discussForm').attr('action', '/classdesk/user/discuss/rcmnd.do').submit();
			}
		}
		
		function fnForm(bbsNo, delCheck, qu, cmd) {
			if(delCheck != 0){
				alert("댓글이 작성되어서 수정할수 없습니다.");
			}else{
				var cseqno = '<c:out value="${rowData.CSEQNO}" />';
				if(cseqno == 1){
					alert('과정마스터 게시물은 관리시스템에서 수정할 수 있습니다.');
					return false;
				} else {
					$('#bbsNo').val(bbsNo);
					$("#qu").val(qu);
					$('form[name=discussForm]')
						.attr('action', '/classdesk/user/discuss/' + cmd + '.do')
						.submit(); 
				}
			}
		}
		
		//삭제
		function delForm(bbsNo, delCheck, qu, cmd){
			if(delCheck != 0){
				alert("댓글이 작성되어서 삭제할수 없습니다.");
			}else{
				if(confirm("삭제하시겠습니까")){
					$('#bbsNo').val(bbsNo);
					$("#qu").val(qu);
					$('form[name=discussForm]')
						.attr('action', '/classdesk/user/discuss/' + cmd + '.do')
						.submit();  
				}
			}
		}
		
		function fnForm2( cmd , qu) {
			
			if(qu == 'insert'){
				var cseqno = '<c:out value="${rowData.CSEQNO}" />';
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
			}
			
			if(cseqno == 1){
				alert('과정마스터 게시물은 관리시스템에서 수정할 수 있습니다.');
				return false;
			} else {
				$("#qu").val(qu);
			 	$('form[name=discussForm]').attr('action', '/classdesk/user/discuss/' + cmd + '.do').submit();
			}
		}
		
		jQuery(document).ready(function(){
			if($('#ordtmAt').val() == 'o') {
				$('#hideshowdate').hide();
				$('#always').html('상시참여(기간없음)');
			}
		});	
		
		//파일다운로드
		function filedown(saveName,orgName,savePath){
			var index = savePath.indexOf('discuss');
			var savePath = savePath.substring(0,index) + "/" + savePath.substring(index,savePath.length);
		
			$('#saveName').val(saveName);
			$('#orgName').val(orgName);
			$('#savePath').val(savePath);
			$('form[name=discussForm]').attr('action', '/academy/classdeskFiledown.do').submit();
		}
		
		//목록
		function historyBack(){
			$("#discussForm").attr("action" , "/classdesk/user/discuss/list.do").submit();
		}
		
		//등록 팝업
		function fnFormPop(){
			$('#layer_03').css('display' , 'block');
		}
		
		//삭제 팝업
		function delFormPop(){
			$('#layer_02').css('display' , 'block');
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
						<form id="discussForm" name="discussForm" enctype="multipart/form-data" method="post" >
							<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.classDeskDiscussFilePath"))%>"/>
							<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
							<input type="hidden" name="pbcateno"  id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
							<input type="hidden" name="bcateno"  	id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/>
							<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
							<input type="hidden"  name="grpNo"  id="grpNo" value="${REQUEST_DATA.grpNo }">
							<input type="hidden" name="userNo"  	id="userNo" 	value="${REQUEST_DATA.userNo}"/>
							<input type="hidden" name="qu"  id="qu" value=""/>
							<input type="hidden" name="topYn"  		id="topYn" 		value="${REQUEST_DATA.topYn}"/>
							<input type="hidden" name="ordtmAt"  id="ordtmAt" value="<c:out value="${rowData.ORDTM_AT}" />"/>
							<input type="hidden" name="rcmndUserno"  id="rcmndUserno" value="<c:out value="${checkRcmnd[0].RCMND_USERNO}" />"/>
							<input type="hidden" name="refLevel"  id="refLevel" value="<c:out value="${rowData.REFLEVEL}" />"/>
							<input type="hidden" name="refStep"  id="refStep" value="<c:out value="${rowData.REFSTEP}" />"/>
							<input type="hidden" name="CLASSDESK"  		id="CLASSDESK" 		value="${REQUEST_DATA.CLASSDESK }"/>
							<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
							<input type="hidden" name="saveName" id="saveName" value=""/>
							<input type="hidden" name="orgName" id="orgName" value=""/>
							<input type="hidden" name="savePath" id="savePath" value=""/>
							<input type="hidden" name="downDir" id="downDir" value="<%=StringUtil.getContent(SangsProperties.getProperty("Globals.classDeskDiscussFilePath"))%>"/>
							<input type="hidden" name="discussdown" id="discussdown" value=""/>
							<input type="hidden"  name="rcmndSeCode"  id="rcmndSeCode" value="">
							<input type="hidden"  name="dscsnEdate"  id="dscsnEdate" value="${rowData.DSCSN_EDATE}">
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
										<c:if test="${topData.ORDTM_AT ne 'Y' }">
											<td><c:out value="${topData.WDATE}"/> ~ <c:out value="${topData.DSCSN_EDATE}"/></td>
										</c:if>
										<c:if test="${topData.ORDTM_AT eq 'Y' }">
											<td>상시참여</td>
										</c:if>
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
												<a href="#none" class="btn-down" onclick="filedown('<c:out value="${topData.SAVFILE}"/>' , '<c:out value="${topData.ORGFILE}"/>','<c:out value="${topData.SAVPATH}"/>');return false" title="첨부파일 다운로드"><c:out value="${topData.ORGFILE}"/> (<c:out value="${topData. FILE_SIZE}"/>)KB</a>
											</c:if>
											<c:if test="${empty topData.FILE_ID }">
												<span>등록된 파일이 없습니다.</span>
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<c:choose>
							<c:when test="${REQUEST_DATA.refLevel ne '' }">
								<h3 class="con-tit">토론 보기</h3>
								<div class="con-tbl">
									<table class="sub-table write">
										<caption>토론 보기:토론보기의 제목,작성자,작성일,토론내용,첨부파일을 설명하는 테이블</caption>
										<colgroup>
											<col style="width:182px">
											<col style="width:204px">
											<col style="width:182px">
											<col style="width:auto">
										</colgroup>
										<thead>
											<tr>
												<th colspan="4"><c:out value="${rowData.TITLE}"/></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">작성자</th>
												<td><c:out value="${rowData.WRITER}"/></td>
												<th scope="row">작성일</th>
												<td><c:out value="${rowData.WDATE}"/></td>
											</tr>
											<tr>
												<th scope="row">추천</th>
												<td>
													<c:if test="${not empty rcmndCount}">
														<c:out value="${rcmndCount[0].RCNT}"/>
													</c:if>
													<c:if test="${empty rcmndCount}">
														0
													</c:if>
												</td>
												<th scope="row">반대</th>
												<td>
													<c:if test="${not empty rcmndCount}">
														<c:out value="${rcmndCount[0].JCNT}"/>
													</c:if>
													<c:if test="${empty rcmndCount}">
														0
													</c:if>
													
												</td>
											</tr>
											<tr>
												<td colspan="4" class="the-text" style="padding-bottom:100px">
													<c:out value="${rowData.CONTENT}" escapeXml="false"/>
												</td>
											</tr>
											
											<tr>
												<th scope="row">첨부파일</th>
												<td colspan="3">
													<c:if test="${not empty rowData.FILE_ID}">
														<a href="#none" class="btn-down" onclick="filedown('<c:out value="${rowData.SAVFILE}"/>' , '<c:out value="${rowData.ORGFILE}"/>','<c:out value="${rowData.SAVPATH}" />');return false" title="첨부파일 다운로드"><c:out value="${rowData.ORGFILE}"/> (<c:out value="${rowData. FILE_SIZE}"/>)KB</a>
													</c:if>
													<c:if test="${empty rowData.FILE_ID}">
														<span>등록된 파일이 없습니다.</span>
													</c:if>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</c:when>
							<c:when test="${REQUEST_DATA.refLevel eq '' }">
								<div class="con-tbl">
									<table class="sub-table write">
										<caption>이 표는 토론등록의 제목,글쓰기내용,첨부파일을 설명하는 테이블입니다.</caption>
										<colgroup>
											<col style="">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">제목</th>
												<td>
													<input type="text" class="inputtxt large" id="title" name="title" title="제목 입력" >
												</td>
											</tr>
											<tr>
												<td colspan="2" class="editer">
													<div style="min-height:350px;">
									                   <!-- [필수]에디터 안에 글내용 영역 -->
									                   	<textarea name="summary" id="summary" rows="22" style="width:100%;" >
									                   	
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
														<input type="text" id="fileName0" class="inputtxt size2" readonly="readonly" value="첨부파일">
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
							</c:when>
						</c:choose>
						
						<div class="btn-list-wrap">
							<c:if test="${REQUEST_DATA.refLevel ne '' }">
								<ul class="btn-list fl-left">
									<li><button onclick="rcmnd('추천', 'R'); return false;" class="btn good" title="추천">추천</button></li>
									<li><button onclick="rcmnd('반대', 'J'); return false;" class="btn bad" title="반대">반대</button></li>
								</ul>
								<ul class="btn-list">
									<li><button type="submit" onclick="fnForm2('form' , 'reply'); return false;" class="btn signup" title="답글">답글</button></li>
									<c:if test="${rowData.USERNO eq REQUEST_DATA.SES_USERNO}">
										<li><a href="#none" class="btn list" onclick="delFormPop(); return false;" title="토론 삭제">삭제</a></li>
										<li><a href="#none" class="btn list" onclick="fnForm('<c:out value="${rowData.BBSNO}"/>', '<c:out value="${delCheck}"/>' , 'update' ,'form'); return false;" title="토론 수정">수정</a></li>
									</c:if>
									<li><a href="#" onclick="historyBack();return false" class="btn list" title="토론 목록">목록</a></li>
								</ul>
							</c:if>
							<c:if test="${REQUEST_DATA.refLevel eq '' }">
								<ul class="btn-list">
									<li><button type="submit" onclick="fnFormPop(); return false;" class="btn signup" title="등록">등록</button></li>
									<li><a href="#" onclick="historyBack();return false" class="btn list" title="토론 목록">목록</a></li>
								</ul>
							</c:if>
							
							<div class="layer_popup" id="layer_03" style="display: none;">
									<div class="layer-tit">
										<p>등록</p>
										<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
									</div>
									<div class="layer_bg bg3">
										<p>등록하시겠습니까?</p>
										<button class="btn-m pop_close" onclick="fnForm2('exec' , 'insert'); return false;" title="등록">등록</button>
									</div>
								</div>
							</div>
							
							<div class="layer_popup" id="layer_02" style="display: none;">
								<div class="layer-tit">
									<p>삭제</p>
									<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
								</div>
								<div class="layer_bg bg2">
									<p>삭제하시겠습니까? <span class="d-block">삭제한 내용은 복구가 불가합니다.</span></p>
									<button class="btn-m pop_close" onclick="delForm('<c:out value="${rowData.BBSNO}"/>' , '<c:out value="${delCheck}"/>' , 'delete' ,'delete'); return false;" title="삭제">삭제</button>
								</div>
							</div>

						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>

					</form>
					</div><!-- //contents-->



				</div><!-- //sub-contents -->

			</div>
</div>			
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>