<%
/****************************************
    subject	: 강사공간 게시판 상세
    summary	:
    author	: 이진영
    date	: 2017-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>



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

    } else if(bbsNo !=''){
        $('#bbsNo').val(bbsNo);
        $('#bbsForm').attr('action', '/academy/tutor/tutorBoardView.do').submit();
    }
}

function fnList(){
    $('form[name=bbsForm]').attr('action', '<c:out value="${ctx}"/>/academy/tutor/tutorBoardList.do').attr('target', '_self').submit();
}

//파일다운로드
function filedown(bbsno,fileId,fname,orgFile,fileSeq){ 
	$('#fileId').val(fileId);
	$('#filename').val(encodeURIComponent(fname));
	$('#fileName').val(encodeURIComponent(orgFile));
	$('#fileSeq').val(fileSeq);
	$('#bbsNo').val(bbsno);
	$('#frm').attr('action', '/academy/tutorNoticeFiledown.do').submit();
}
//다음버튼 클릭
function nextClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/tutor/tutorBoardView.do").submit();
	}else{
		alert("처음페이지 입니다.");
		return;
	}
}

//이전버튼 클릭
function prevClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/tutor/tutorBoardView.do").submit();
	}else{
		alert("마지막페이지 입니다.");
		return;
	}
}

//목록 버튼 클릭
function mainList(){
	$("#frm").attr("action", "/academy/tutor/tutorBoardList.do").submit();
}

//댓글 입력,삭제,수정
function replySubmit(pmode,cmtNo,rpyNo){
	
	var state = false;
	
	$("#pmode").val(pmode);
	$("#cmtNo").val(cmtNo);
	$("#rpyNo").val(rpyNo);
	
	if(pmode == "SUB"){
		if('' == $("#content").val()) {
	    	alert("내용을 입력해 주세요.");
	    	$("#content").focus();
	    	return;
	    }
    }else if(pmode == "DEL"){
		if(confirm("삭제하시겠습니까?")){
			state = "ture";
		}else{
			return false;
		}
	}else if(pmode == "MOD"){
		if('' == $("#modifyContent").val()) {
	    	alert("내용을 입력해 주세요.");
	    	$("#modifyContent").focus();
	    	return;
	    }
		if(confirm("수정하시겠습니까?")){
			state = "ture";
		}else{
			return false;
		}
	}else if(pmode == "RESUB"){
		if('' == $("#cmtReplyContent").val()) {
	    	alert("내용을 입력해 주세요.");
	    	$("#cmtReplyContent").focus();
	    	return;
	    }
		if(confirm("등록하시겠습니까?")){
			state = "ture";
		}else{
			return false;
		}
	}
	
	if(state = true){
			$.ajax({
			url : '/academy/tutor/tutorBoardReplySubmit.do',
			type : "POST",
			data : $('form[name=replyFrm]').serialize(),
			dataType : "json",
			success : function(data) {
				var str = "";
				if(data == "FAIL"){
					alert("로그인이 필요한 페이지입니다.");
				} else {
					if(data.length > 0){
						str +='<ul>';
						 for (var i = 0; i < data.length; i++) {
							 console.log(data[i]);
							 if(data[i].RPYNO == 1){
								 str +='<li id="reply'+i+'" class="re_list">';
							 } else {
								 str +='<li id="reply'+i+'" class="li_reply">';
							 }
							 //str += '<div id="reply'+i+'" class="reply'+i+'">';
							 
							 str += '<div><span class="re_name po_C7"><strong>'+data[i].WRITER +'</strong></span><span class="re_date">작성일 '+ data[i].WDATE +"</span></div>";
							 + $.trim(data[i].CONTENT.replace(/\n/g,"<br />"))+"<br/>";
							 str += '<div id="replycontent'+i+'" class="reBtns"><p class="replyTxt">'+ $.trim(data[i].CONTENT.replace(/\n/g,"<br />")) +'</p>';
							 if(${REQUEST_DATA.SES_USERNO} == data[i].USERNO){
								 str += '<a href="#none" value="'+data[i].CMTNO+'/'+data[i].RPYNO+'/'+i+'/'+data[i].CONTENT+'" class="btn-sm btn btn-default updBtn">수정</a>';
								 str += '<a href="#none" onclick="replySubmit('+"'DEL'"+','+data[i].CMTNO+','+data[i].RPYNO+'); return false;" class="btn-sm btn btn-default">삭제</a>';
							 }
							 if(data[i].RPYNO == 1){
							 str += '<a href="#none" onclick="cmtReplySubmit('+data[i].CMTNO+','+data[i].RPYNO+','+i+');" class="btn-sm btn btn-default">답변</a>';
							 }
							 str += '</div></li>';
						}
						 str +='</ul>'; 
					}
					$("#reply_div").html(str);
				}
				$("#content").val("");
				$('#modifystate').val('N');
				
			}
			});
		} else {
			return false;
		}
	}

function replyModifyForm(cmtNo,rpyNo,targetNo,content){
	if($('#modifystate').val() == 'N'){
	var target="#replycontent"+targetNo;
	var str = '<br/><textarea id="modifyContent" name="modifyContent" class="form-control" style="resize:none;">'+content+'</textarea><br/>';
	str += '<a href="#none" onclick="replySubmit('+"'MOD'"+','+cmtNo+','+rpyNo+');return false" class="btn-sm btn btn-default">확인</a>';
	str += '<a href="#none" onclick="replySubmit()" class="btn-sm btn btn-default">취소</a>'
	$(target).html(str);
	} else {
		alert("진행중인 수정을 완료해주세요.");
	}
	$('#modifystate').val('Y');
}

function cmtReplySubmit(cmtNo,rpyNo,targetNo){
	if($('#modifystate').val() == 'N'){
		var target="#reply"+targetNo;
		
		var str = '<li class="li_reply">';
		str += '<br/><div id="cmt_reply_div" class="reAnswer"><textarea id="cmtReplyContent" name="cmtReplyContent" class="form-control" style="resize:none;"></textarea>';
		str += '<br/><a href="#none" onclick="replySubmit('+"'RESUB'"+','+cmtNo+');return false" class="btn-sm btn btn-default">등록</a>';
		str += '<a href="#none" onclick="replySubmit()" class="btn-sm btn btn-default">취소</a></li>'
		
		$(target).after(str);
	} else {
		alert("진행중인 답변 작성을 완료해주세요.");
	}
	$('#modifystate').val('Y');
	
	
}
	function form_page(){
		$('#cPage').val(1);
		$("#searchWord").val($("#searchText").val());
		<%--  frm.pageMode.value = "<%=SangsProperties.getProperty("Globals.PAGE_MODE_REG")%>"; --%>
		$("#frm").attr("action", "/academy/tutor/tutorBoardForm.do").submit();
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
                <li class="active"><c:out value="${categoryData.BCATENAME}"/></li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
				<section class="bgTop_cate06"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            		 <h2 class="h2_tit"><c:out value="${categoryData.BCATENAME}"/></h2>
            		</div>           	
	            </section>
			
            
				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
					<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
					<input type="hidden" name="bbsNo" id="bbsNo" value="${rowData.BBSNO}"/>
					<input type="hidden" name="fileId" id="fileId" value=""/>
					<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
					<input type="hidden" name="filename" id="filename" value=""/>
					<input type="hidden" name="fileName" id="fileName" value=""/>
				</form>		
				
				<!-- table -->
                <section class="tableBox">
                	<div class="tblWrap">
                    	<table class="writeForm">
                        <caption><c:out value="${categoryData.BCATENAME}"/> 상세</caption>
                        <colgroup>
                        	<col style="width:20%">
                            <col style="width:30%">
                            <col style="width:20%">
                            <col style="width:30%">
                        </colgroup>
                        <tbody>
                        <tr>
                        	<th scope="row">제목</th>
                            <td colspan="3"><c:out value="${rowData.TITLE}"/></td>
                        </tr>
                        <tr>
                        	<th scope="row">작성일</th>
                            <td><c:out value="${rowData.WDATE}"/></td>
                            <th scope="row">조회수</th>
                            <td><c:out value="${rowData.RCNT}"/></td>
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
										<p class="a_file"><a href="#" onclick="filedown('<c:out value="${result.BBSNO}" />','<c:out value="${result.FILE_ID}"/>' , '<c:out value="${result.SAVFILE}"/>' , '<c:out value="${result.ORGFILE}"/>','<c:out value="${result.FILE_SEQ}"/>')" class="btn-down">
										<span><c:out value="${result.ORGFILE}"/></span></a></p>
									</c:forEach>
								</c:when>
							</c:choose>
                            </td>
                         </tr>
                         <tr>
                         	<td colspan="4" class="td_cont">
                         		<div style="min-height: 252px">
<%--                             		<c:out value="${rowData.CONTENT}" escapeXml="false"/> --%>
                            		<c:out value="${content}" escapeXml="false"/>
                            	</div>
                            </td>
                         </tr>
                         </tbody>
                    	 </table>
                	</div>
                </section>
                <!--// table -->
                            
				<!-- 강사소통마당일경우 댓글 기능 -->
				<c:if test="${REQUEST_DATA.bcateno == '1030'}">
					<div class="replyWrap">
						<form name="replyFrm" id="replyFrm" action="" method="post">
							<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
							<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
							<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
							<input type="hidden" name="bbsNo" id="bbsNo" value="${rowData.BBSNO}"/>
							<input type="hidden" name="pmode" id="pmode" value=""/>
							<input type="hidden" name="cmtNo" id="cmtNo" value=""/>
							<input type="hidden" name="rpyNo" id="rpyNo" value=""/>
							<input type="hidden" name="modifystate" id="modifystate" value="N"/>
							
							<div class="replyWrite">
								<textarea id="content" name="content" class="textReply" style="resize:none;"></textarea>
								 <button type="button" onclick="replySubmit('SUB');return false" name="button" class="addreply btn" title="등록">등록</button>
							</div>
							
							<div id="reply_div" class="replyList">
                            	<ul>
									<c:if test="${not empty replyList}">
										<c:forEach items="${replyList}" var="result" varStatus="status">
											<c:if test="${result.RPYNO == 1}"><li id="reply${status.count}" class="re_list"></c:if>
											<c:if test="${result.RPYNO != 1}"><li id="reply${status.count}" class="li_reply"></c:if>
	                                    	<div>
	                                        	<span class="re_name po_C7"><strong>${result.WRITER}</strong></span>
	                                            <span class="re_date">작성일  ${result.WDATE}</span>
	                                        </div>
	                                        <div id="replycontent${status.count}" class="reBtns">
	                                        	<p class="replyTxt"><c:out value="${fn:replace(result.CONTENT, crlf, '<br/>')}" escapeXml="false"/></p>
	                                        	<c:if test="${REQUEST_DATA.SES_USERNO == result.USERNO}">
		                                        	<a href="#none" value="${result.CMTNO}/${result.RPYNO}/${status.count}/${result.CONTENT}" class="btn-sm btn btn-default updBtn">수정</a>
													<a href="#none" onclick="replySubmit('DEL',${result.CMTNO},${result.RPYNO});return false" class="btn-sm btn btn-default">삭제</a>
		                                        </c:if>
		                                        <c:if test="${result.RPYNO == 1}">
													<a href="#none" onclick="cmtReplySubmit(${result.CMTNO},${result.RPYNO},${status.count});" class="btn-sm btn btn-default">답변</a>
												</c:if>
	                                        </div>
	                                    </li>
	                                    </c:forEach>
									</c:if>
                                </ul>
                            </div>
						</form>
					</div>
				</c:if>
				
				<hr/>
				
 				 <c:if test="${REQUEST_DATA.bcateno eq '1030'}">
	                <div class="btnAreaR">
						<c:if test="${rowData.USERNO eq REQUEST_DATA.SES_USERNO}">
						    <a href="#" onclick="form_page(); return false" class="btn btn-blue btn-sm">수정</a>
						    <!-- <a href="#" onclick="delete_exec('delete'); return false;" class="btn btn-orange btn-sm">삭제</a> -->
					    </c:if>
	                	<a href="#none" onclick="mainList();return false" class="btn btn-drkblue btn-sm">목록</a>
	                </div>
				</c:if>
				 
                <hr/>
				<!-- //강사소통마당일경우 댓글 기능 -->
				<div class="tblWrap">
                	<table class="writeForm prevNext">
                    <caption>이전글 다음글</caption>
                    	<colgroup>
	                        <col style="width:20%">
	                        <col style="width:*">
                        </colgroup>
                        <tbody>
                        <tr>
							<th scope="row"><span class="list_up">다음글</span></th>
							<c:choose>
								<c:when test="${nextData.TITLE eq null or nextData.TITLE eq ''}">
									<td> 다음글이 없습니다</td>	
								</c:when>
								<c:when test="${nextData.TITLE ne null or nextData.TITLE ne ''}">
									<td><a href="#none" onclick="nextClick('<c:out value="${nextData.BBSNO}"/>');return false"><c:out value="${nextData.TITLE}"/></a></td>
								</c:when>
							</c:choose>
						</tr>
						<tr>
							<th scope="row"><span class="list_dw">이전글</span></th>
							<c:choose>
								<c:when test="${prevData.TITLE eq null or prevData.TITLE eq ''}">
									<td> 이전글이 없습니다</td>	
								</c:when>
								<c:when test="${prevData.TITLE ne null or prevData.TITLE ne ''}">
									<td><a href="#none" onclick="prevClick('<c:out value="${prevData.BBSNO}"/>');return false"><c:out value="${prevData.TITLE}"/></a></td>
								</c:when>
							</c:choose>
						</tr>
                         </tbody>
                     </table>
                </div>	
                                
				<!-- <p class="ar"><a href="#header" class="btn-top">TOP</a></p> -->

		</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->
	</article>
</div>
		
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->