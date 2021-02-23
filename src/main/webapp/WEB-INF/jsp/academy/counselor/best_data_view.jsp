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
});
//이전/다음 상세보기
function fnView(mode, bbsNo){
    if(bbsNo == 0){
        if(mode == 'pre') alert('첫 페이지입니다.');
        if(mode == 'next') alert('마지막 페이지입니다.');

    } else if(bbsNo != ''){
        $('#bbsNo').val(bbsNo);
        $('#bbsForm').attr('action', '/academy/counselor/BestboardDataView.do').submit();
    }
}

//파일다운로드
function bestCounselorfiledown(fileId, bbsNo, fileSeq){
	var form = document.frm;
	form.fileId.value = fileId;
	form.bbsNo.value = bbsNo;
	form.fileSeq.value = fileSeq;
	
	$("#frm").attr("action", "/academy/counselBestFiledown.do").submit();
}

//다음버튼 클릭
function nextClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/counselor/BestboardDataView.do").submit();
	}else{
		alert("처음페이지 입니다.");
		return;
	}
}

//이전버튼 클릭
function prevClick(bbsNo){
	if(bbsNo.length != 0){
		$("#bbsNo").val(bbsNo);
		$("#frm").attr("action", "/academy/counselor/BestboardDataView.do").submit();
	}else{
		alert("처음페이지 입니다.");
		return;
	}
}

//목록 버튼 클릭
function mainList(){
	$("#frm").attr("action", "/academy/counselor/bestList.do").submit();
}

function fnList(){
    $('form[name="bbsForm"]').attr('action', '<c:out value="${ctx}"/>/academy/counselor/bestList.do').attr('target', '_self').submit();
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
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_counsel_best.jsp"%>
			<div class="path">
				<ul>
					<li><span class="home text-hide">홈</span></li>
					<li>상담자료실</li>
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
					<form name="frm" id="frm" action="" method="post">
						<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
						<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
						<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}" /> 
						<input type="hidden" name="bbsNo" id="bbsNo" value="" /> 
						<input type="hidden" name="fileId" id="fileId" value="" /> 
						<input type="hidden" name="fileSeq" id="fileSeq" value="" />
						<input type="hidden" name="mtLecCounselCode" id="mtLecCounselCode" value="${REQUEST_DATA.mtLecCounselCode }" />
					</form>

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
										<th scope="row">조회수</th>
										<td><c:out value="${rowData.RCNT}" /></td>
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
														<p class="a_file"><a class="a_file" href="#none" onclick="bestCounselorfiledown('<c:out value="${result.FILE_ID}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.FILE_SEQ}" />');return false"class="btn-down" title="첨부파일 다운로드"><c:out value="${result.ORGFILE}" /></a></p>
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
										<th scope="row" colspan="4">답변내용</th>
										
									</tr>
									<tr>
										<td colspan="4" class="td_cont">
											<div style="min-height: 252px">
												<c:out value="${rowData.AN_CONTENT}" escapeXml="false" />
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
						<hr>
						<div class="btnAreaR">
							<a href="#none" onclick="mainList();return false" class="btn btn-drkblue btn-sm" title="목록">목록</a>
						</div>
						<hr>
						<div class="tblWrap">
							<table class="writeForm prevNext type03">
								<caption>이전글 다음글</caption>
								<colgroup>
									<col style="width: 20%">
									<col style="width: *">
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
					</section>
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