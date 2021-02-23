<%
/****************************************
    system  : ClassDesk > 학생 > 과제
    title   : 과제 목록
    summary :   
    wdate   : 2015-04-01
    writer  : SANGS  
****************************************/
%>


<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="topMenuCode" value="task"/>

<script type="text/javascript">

	//파일다운로드
	function filedown(fname,type){
		$('#filename').val(encodeURIComponent(fname));
		$('#ftype').val(type);
		$('form[name=frm]').attr('action', '/academy/filedown.do').submit();
	}
	
</script>

 <div class="contents-wrap">

 		<div class="sub-wrap">
				<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
				<div class="sub-contents">
					<ul class="sub-navi">
						<li><a href="#none" title="HOME">HOME</a></li>
						<li><a href="#none" title="내강의실">내강의실</a></li>
						<li class="location"><a href="#none" title="과제">과제</a></li>
					</ul>
					
					<div class="sub-tit">
						<h3>과제결과<span class="tit-ex" ><span class="hyphen">-</span><c:out value="${REQUEST_DATA.seqTitle}"/></span></h3>
						<p></p>
					</div>

					<div class="contents" id="sContents">

						<form name="frm" id="frm" action="" method="post" enctype="multipart/form-data">
							<input type="hidden" name="reportNo" value="<c:out value="${reportData.REPORTNO}"/>"/>
							<input type="hidden" name="cUserNo"  value="<c:out value="${reportApplyData.CUSERNO}"/>" />
							<input type="hidden" name="openYn"   id="openYn" />
							<input type="hidden" name="downType"   id="downType" value="" />
							<input type="hidden" name="downNo"   id="downNo"  value=""/>
							<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.classDeskReportFilePath")%>"/>
							<input type="hidden" name="CLASSDESK"  id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}" />"/>
							<input type="hidden" name="filename" id="filename" value=""/>
							<input type="hidden" name="ftype" id="ftype" value=""/>
							<input type="hidden" name="downDir" id="downDir" value="report"/>
							<input type="hidden" name="reportdown" id="reportdown" value=""/>
							<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
							<input type="hidden" name="userOpenYn" id="userOpenYn" value="<c:out value="${REQUEST_DATA.userOpenYn}"/>">
							<input type="hidden" name="resultYn" id="resultYn" value="<c:out value="${REQUEST_DATA.resultYn}"/>">
						
						<h3 class="con-tit">과제 정보</h3>
						<div class="con-tbl">
							<table class="sub-table">
								<caption>과제 정보:이 표는 과제명,토론기간,배점,과제내용,첨부파일을 설명하는 테이블입니다.</caption>
								<colgroup>
									<col style="">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">과제명</th>
										<td><c:out value="${reportData.TITLE}" /></td>
									</tr>
									<tr>
										<th scope="row">제출기간</th>
										<td><fmt:formatDate value="${reportData.SDATE}" pattern="yyyy.MM.dd" />   ~ <fmt:formatDate value="${reportData.EDATE}" pattern="yyyy.MM.dd" /></td>
									</tr>
									<tr>
										<th scope="row">배점</th>
										<td><c:out value="${reportData.EVAL}"/>점</td>
									</tr>
									<tr>
										<th scope="row">과제내용</th>
										<td>
											<p><c:out value="${reportData.SUMMARY}"/></p>
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
											<c:choose>
												<c:when test="${not empty reportData.FILE01_SAVE }">
													<a href="#none" class="btn-down" onclick="filedown('<c:out value="${reportData.FILE01_SAVE}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportData.FILE01_ORG}"/></a><br>
												</c:when>
												<c:when test="${not empty reportData.FILE012_SAVE }">
													<a href="#none" class="btn-down" onclick="filedown('<c:out value="${reportData.FILE02_SAVE}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportData.FILE02_ORG}"/></a><br>
												</c:when>
												<c:when test="${not empty reportData.FILE03_SAVE }">
													<a href="#none" class="btn-down" onclick="filedown('<c:out value="${reportData.FILE03_SAVE}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportData.FILE03_ORG}"/></a><br>
												</c:when>
												<c:when test="${not empty reportData.FILE04_SAVE }">
													<a href="#none" class="btn-down" onclick="filedown('<c:out value="${reportData.FILE04_SAVE}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportData.FILE04_ORG}"/></a><br>
												</c:when>
												<c:otherwise>
													<span>첨부된파일이 없습니다.</span>
												</c:otherwise>
											</c:choose>
										</td>
										
									</tr>
								</tbody>
							</table>
						</div>

						<c:if test="${REQUEST_DATA.userOpenYn eq 'Y'}">
							<h3 class="con-tit">과제 제출</h3>
							<div class="con-tbl">
								<table class="sub-table write">
									<caption>과제 제출:토론등록의 제목,글쓰기내용,첨부파일을 설명하는 테이블</caption>
									<colgroup>
										<col style="">
										<col style="width:auto">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">제목</th>
											<td>
												<c:out value="${reportApplyData.TITLE}" />
											</td>
										</tr>
										<tr>
											<th scope="row">내용</th>
											<td>
												<c:out value="${reportApplyData.SUMMARY}" escapeXml="false"/>
											</td>
										</tr>
										<tr>
											<th scope="row">첨부파일</th>
											<td>
												<c:choose>
													<c:when test="${not empty reportApplyData.FILE01_SAVE }">
														<a href="#none" class="btn-down" onclick="filedown('<c:out value="${reportApplyData.FILE01_SAVE}"/>');return false" title="첨부파일 다운로드"><c:out value="${reportApplyData.FILE01_ORG}"/></a>
													</c:when>
													<c:when test="${empty reportApplyData.FILE01_SAVE }">
														<span>첨부된파일이 없습니다.</span>
													</c:when>
												</c:choose>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<!-- 관리자의 채점이 끝나면 표시 -->
							<c:if test="${REQUEST_DATA.resultYn eq 'Y'}">
								<h3 class="con-tit">과제 평가 결과</h3>
								<div class="con-tbl">
									<table class="sub-table">
										<caption>과제 평가 결과:과제명,토론기간,배점,과제내용,첨부파일을 설명하는 테이블</caption>
										<colgroup>
											<col style="">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">점수</th>
												<td><c:out value="${reportApplyData.VAL}"/>점</td>
											</tr>
											<tr>
												<th scope="row">평가일자</th>
												<td><fmt:formatDate value="${reportApplyData.VAL_DATE}" pattern="yyyy.MM.dd" /></td>
											</tr>
											<tr>
												<th scope="row">내용</th>
												<td><c:out value="${reportApplyData.VAL_CMT}"/></td>
											</tr>
										</tbody>
									</table>
								</div>
							</c:if>
						</c:if>
						
						<c:if test="${REQUEST_DATA.userOpenYn eq 'Y' && REQUEST_DATA.resultYn eq 'N'}">
							<h3 class="con-tit">과제 평가</h3>
							<div class="con-tbl">
								<table class="sub-table ta-c list7">
									<caption>과제 평가:토론등록의 제목,글쓰기내용,첨부파일을 설명하는 테이블</caption>
									<colgroup>
										<col style="">
										<col style="width:auto">
									</colgroup>
									<tbody>
										<tr>
											<td>
												<span style="font-size:15px">평가중입니다.</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:if>
						
						<c:if test="${REQUEST_DATA.saveYn eq 'N' && REQUEST_DATA.resultYn eq 'N' && REQUEST_DATA.userOpenYn ne 'Y'}">
							<h3 class="con-tit">과제 제출</h3>
							<div class="con-tbl">
								<table class="sub-table ta-c list7">
									<caption>과제 제출:토론등록의 제목,글쓰기내용,첨부파일을 설명하는 테이블</caption>
									<colgroup>
										<col style="">
										<col style="width:auto">
									</colgroup>
									<tbody>
										<tr>
											<td>
												<span style="font-size:15px">과제를 제출하지 않았습니다.</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:if>
						<ul class="btn-list">
							<li><a href="javascript:window.history.back();" class="btn list" title="과제 목록">목록</a></li>
						</ul>


						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


						</form>
					</div><!-- //contents-->


				</div><!-- //sub-contents -->

			</div>
	</div>			