<%
/****************************************
    subject	: 지원센터 > 공지사항 보기
    summary	:
    author	: 김학규
    date	: 2015-06-04
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
});

function fnList(){
    $('form[name=bbsForm]').attr('action', '<c:out value="${ctx}"/>/academy/tutor/lectureData.do').attr('target', '_self').submit();
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
		$("#frm").attr("action", "/academy/tutor/lectureDataView.do").submit();
	}else{
		alert("처음페이지 입니다.");
		return;
	}
}

//이전버튼 클릭
function prevClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/tutor/lectureDataView.do").submit();
	}else{
		alert("마지막페이지 입니다.");
		return;
	}
}

//목록 버튼 클릭
function mainList(){
	$("#frm").attr("action", "/academy/tutor/lectureData.do").submit();
}
</script>
<div class="container" id="Subcontent" tabindex="-1">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp" %>
	<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>강사공간</li>
                <li class="active">강사자료실</li>
            </ul>
        </div>
	<div class="subConts" id="sub-content">
			<section class="contTop">
                <h2 class="h2_tit">강사자료실</h2>
                
            </section>
            
			<div class="contents" id="sContents">
				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="searchWord" id="searchWord" value="${REQUEST_DATA.searchWord}"/>
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="fileId" id="fileId" value=""/>
					<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
					<input type="hidden" name="filename" id="filename" value=""/>
					<input type="hidden" name="fileName" id="fileName" value=""/>
				</form>		
				<div class="con-tbl">
					<table class="sub-table write">
						<caption>공지사항의 제목,작성자,등록일시,조회수,공지사항내용,첨부파일을 설명하는 테이블</caption>
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
										<a href="#" onclick="filedown('<c:out value="${result.BBSNO}" />','<c:out value="${result.FILE_ID}"/>' , '<c:out value="${result.SAVFILE}"/>' , '<c:out value="${result.ORGFILE}"/>','<c:out value="${result.FILE_SEQ}"/>')" class="btn-down">
											<span><c:out value="${result.ORGFILE}"/></span>
										</a>
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
						<li><a href="#none" onclick="prevClick('<c:out value="${prevData.BBSNO}"/>');return false" class="btn prev">이전</a></li>
						<li><a href="#none" onclick="nextClick('<c:out value="${nextData.BBSNO}"/>');return false" class="btn next">다음</a></li>
					</ul> 
					<ul class="btn-list">
						<li><a href="#none" onclick="mainList();return false" class="btn list">목록</a></li>
					</ul>
					
				</div>

				<p class="ar"><a href="#header" class="btn-top">TOP</a></p>

				</div><!-- //contents-->
	
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
</div>		
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->