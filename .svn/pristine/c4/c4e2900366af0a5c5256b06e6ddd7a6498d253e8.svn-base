<%--
    Description : 지식터 > 교육자료
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.07.07  이진영           최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

	//파일다운로드
	function filedown(fileId, bbsNo, fileSeq){
		var form = document.frm;
		form.fileId.value = fileId;
		form.bbsNo.value = bbsNo;
		form.fileSeq.value = fileSeq;
		
		$("#frm").attr("action", "/academy/eduFiledown.do").submit();
	}
	
	//목록으로 가기
	function returnList(){
		$("#frm").attr("action", "/academy/eduinfo/eduDataList.do").submit();
	}

	//다음버튼 클릭
	function nextClick(bbsNo){
		if(bbsNo.length != 0){
			$("#bbsNo").val(bbsNo);
			$("#frm").attr("action", "/academy/eduinfo/eduDataView.do").submit();
		}else{
			alert("처음페이지 입니다.");
			return;
		}
	}

	//이전버튼 클릭
	function prevClick(bbsNo){
		if(bbsNo.length != 0){
			$("#bbsNo").val(bbsNo);
			$("#frm").attr("action", "/academy/eduinfo/eduDataView.do").submit();
		}else{
			alert("처음페이지 입니다.");
			return;
		}
	}
</script>


 <div class="contents-wrap e102">

	<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_eduinfo.jsp"%>

		<div class="sub-contents">		
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>지식터</span></li>
				<li class="location"><span>교육자료</span></li>
			</ul>

			<div class="sub-tit">
				<h3>교육자료</h3>
				<p>상호간 유대관계 및 협력체계의 강화를 통해 교육효과를 증대하기위한 교육입니다.</p>
			</div>
			
			<div class="contents" id="sContents">
				<form name="frm" id="frm" action="" method="post">
					<input type="hidden" name="fileId" id="fileId" value=""/>
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
				</form>		
				<div class="con-tbl">
					<table class="sub-table write" summary="이 표는 공지사항의 제목,작성자,등록일시,조회수,공지사항내용,첨부파일을 설명하는 테이블입니다.">
						<caption>공지사항 테이블 : 이 표는 공지사항의 제목,작성자,등록일시,조회수,공지사항내용,첨부파일을 설명하는 테이블입니다.</caption>
						<colgroup>
							<col style="">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>
									<span><c:out value="${eduViewData.TITLE}"/></span>
								</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>
									<span><c:out value="${eduViewData.WRITER}"/></span>
								</td>
							</tr>
							<tr>
								<th scope="row">등록일시</th>
								<td>
									<span><c:out value="${eduViewData.WDATE}"/></span>
								</td>
							</tr>
							<tr>
								<th scope="row">조회수</th>
								<td>
									<span><c:out value="${eduViewData.RCNT}"/></span>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="readbox">
									<div style="min-height:252px">
										<c:out value="${eduViewData.CONTENT}" escapeXml="false"/>
									</div>
								</td>
							</tr>
							<c:if test="${not empty eduViewDataFile}">
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<c:forEach items="${eduViewDataFile}" var="result" varStatus="status">
											<a href="#none" onclick="filedown('<c:out value="${result.FILE_ID}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.FILE_SEQ}" />');return false" class="btn-down" title="첨부파일 다운로드"><c:out value="${result.ORGFILE}"/></a>
											<br>
										</c:forEach>
									</td>
								</tr>
							</c:if>
							<c:if test="${empty eduViewDataFile}">
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<p>첨부파일이 없습니다.</p>
									</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="btn-list-wrap">
					<ul class="btn-list fl-left">
						<li><a href="#none" onclick="prevClick('<c:out value="${eduViewData.BBSNO_PREV}"/>');return false" class="btn prev" title="교육자료 이전 글">교육자료 이전 글</a></li>
						<li><a href="#none" onclick="nextClick('<c:out value="${eduViewData.BBSNO_NEXT}"/>');return false" class="btn next" title="교육자료 다음 글">교육자료 다음 글</a></li>
					</ul>
					<ul class="btn-list">
						<li><a href="#none" onclick="returnList();return false" class="btn list" title="교육자료 목록">목록</a></li>
					</ul>
				</div>
				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>

			</div><!-- //contents-->

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-->


<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->
