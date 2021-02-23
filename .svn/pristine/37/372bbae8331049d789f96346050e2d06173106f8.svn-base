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
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
    $(".content img").each(function(){
        $(this).attr("alt", $("#bbsTitle").val());
        $(this).attr("title", $("#bbsTitle").val());
    });
});
//이전/다음 상세보기
function fnView(mode, bbsNo){
    if(bbsNo == 0){
        if(mode == 'pre') alert('첫 페이지입니다.');
        if(mode == 'next') alert('마지막 페이지입니다.');

    } else if(bbsNo != ''){
        $('#bbsNo').val(bbsNo);
        $('#bbsForm').attr('action', '/academy/helpdesk/boardView.do').submit();
    }
}

//파일다운로드
function filedown(fileId, bbsNo, fileSeq){
	var form = document.frm;
	form.fileId.value = fileId;
	form.bbsNo.value = bbsNo;
	form.fileSeq.value = fileSeq;
	
	$("#frm").attr("action", "/academy/noticeFiledown.do").submit();
}

//다음버튼 클릭
function nextClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/helpdesk/boardView.do").submit();
	}else{
		alert("처음페이지 입니다.");
		return;
	}
}

//이전버튼 클릭
function prevClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/helpdesk/boardView.do").submit();
	}else{
		alert("처음페이지 입니다.");
		return;
	}
}

//목록 버튼 클릭
function mainList(){
	$("#frm").attr("action", "/academy/helpdesk/boardList.do").submit();
}

function fnList(){
    $('form[name="bbsForm"]').attr('action', '<c:out value="${ctx}"/>/academy/helpdesk/boardList.do').attr('target', '_self').submit();
}

function fnDown(fname,type){
    $('#filename').val(encodeURIComponent(fname));
    $('#ftype').val(type);
    $('form[name="bbsForm"]').attr('action', '/academy/filedown.do').submit();
}
</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_intro.jsp" %>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>교육센터 소개</li>
                <li class="active"><c:out value="${categoryData.BCATENAME}"/></li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="contTop">
                <h2 class="h2_tit"><c:out value="${categoryData.BCATENAME}"/></h2>
                
            </section>
            
			<div class="contents" id="sContents">
				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="fileId" id="fileId" value=""/>
					<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
				</form>		
				<div class="con-tbl">
					<table class="sub-table write">
						<caption>테이블 : 이 표는 교육안내의 제목,작성자,등록일시,조회수,공지사항내용,첨부파일을 설명하는 테이블입니다.</caption>
						<colgroup>
							<col style="">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>
									<span><c:out value="${rowData.TITLE}"/></span>
								</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>
									<span><c:out value="${rowData.WRITER}"/></span>
								</td>
							</tr>
							<tr>
								<th scope="row">등록일시</th>
								<td>
									<span><c:out value="${rowData.WDATE}"/></span>
								</td>
							</tr>
							<tr>
								<th scope="row">조회수</th>
								<td>
									<span><c:out value="${rowData.RCNT}"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="readbox">
									<div style="min-height:252px">
										<c:out value="${rowData.CONTENT}" escapeXml="false"/>
									</div>
								</td>
							</tr>
							<tr> 
								<th scope="row">첨부파일</th>
								<td>
							<c:choose>
								<c:when test="${empty listData}">
											<p>첨부파일이 없습니다.</p>
								</c:when>
								<c:when test="${not empty listData}">
									<c:forEach items="${listData}" var="result" varStatus="status">
											<a href="#none" onclick="filedown('<c:out value="${result.FILE_ID}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.FILE_SEQ}" />');return false" class="btn-down" title="첨부파일 다운로드"><c:out value="${result.FILE_NAME}"/></a>
											<br>
									</c:forEach>
								</c:when>
							</c:choose>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn-list-wrap">
					<ul class="btn-list fl-left">
						<li><a href="#none" onclick="prevClick('<c:out value="${prevData.BBSNO}"/>');return false">이전글</a></li>
						<li><a href="#none" onclick="nextClick('<c:out value="${nextData.BBSNO}"/>');return false">다음글</a></li>
					</ul> 
					<ul class="btn-list">
						<li><a href="#none" onclick="mainList();return false" class="btn list" title="목록">목록</a></li>
					</ul>
					
				</div>
				

				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>

			</div><!-- //contents-->

		</div><!-- //sub-contents -->

		</div>
	</article>
</div>

<!-- 풋터 영역 -->
 <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->