<%
/****************************************
	subject	: 1:1문의 보기 
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

	<script type='text/javascript'>
		
		//파일다운로드
		function fnDown(fname,type){
			$('#filename').val(encodeURIComponent(fname));
			$('#ftype').val(type);
			$('form[name=bbsForm]').attr('action', '/academy/filedown.do').submit();
		}
		
		//등록폼
		function fnForm(bbsNo){
			$('#bbsNo').val(bbsNo);
			$('form[name=bbsForm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsForm.do').attr('target', '_self').submit();
		}
	
		//목록
		function fnList(){
			$('form[name=bbsForm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsList.do').attr('target', '_self').submit();		
			
		}

		//삭제
		function fnDel(bbsNo){
			if(confirm('삭제하시겠습니까?')){
				$('#bbsNo').val(bbsNo);
				$('form[name=bbsForm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsDelExec.do').attr('target', '_cm').submit();
			}
		}
		
	</script>
	
<div class="contents-wrap">
	<div class="sub-wrap">
	<!-- 왼쪽 메뉴 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
	<!-- // 왼쪽 메뉴 영역 -->
	
			<!-- 페이지 상단 타이틀 영역 -->
			<div id="Sub_Header" class="menu5">
				<div class="nav">
					<img src="/academy/images/ico_home.png" alt="Home" /><img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />마이페이지<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />1:1 문의
				</div>
				<h3>1:1 문의</h3>
				<p>나의 수강정보를 한눈에 확인할 수 있습니다.</p>
			</div>
			<!-- // 페이지 상단 타이틀 영역 -->

			<div id="Contents">
			
			<form id="bbsForm" name="bbsForm" method="post">
				<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
				<input type="hidden" name="bbsNo"  id="bbsNo" value=""/>
				<input type="hidden" name="fileno"  id="fileno" value=""/>
				
				<input type="hidden" name="filename" id="filename"/>
				<input type="hidden" name="downDir" id="downDir" value="edbbs"/>
				<input type="hidden" name="bbsDown" id="bbsDown"/>
				<input type="hidden" name="ftype" id="ftype"/>
				
				<div class="bbs_view">
					<table cellpadding="0" cellspacing="0">
						<caption>1:1 문의 상세테이블:상상스토리 교육시스템의 1:1 문의 상세입니다.</caption>
						<colgroup>
							<col width="120px" />
							<col width="265px" />
							<col width="120px" />
							<col width="265px" />
						</colgroup>
						<thead>
							<tr>
								<th>문의유형</th>
								<td colspan="3"><c:out value="${rowData.BCATENAME }"/></td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3"><strong><c:out value="${rowData.TITLE }"/></strong></td>
							</tr>
							<tr>
								<th>작성일</th>
								<td><c:out value="${rowData.WDATE}"/></td>
								<th>답변여부</th>
								<td>
								<c:choose>
									<c:when test="${rowData.ANYN eq 'Y'}">
										<img src="/academy/images/ico_o.png" alt="답변대기" />
									</c:when>
									<c:otherwise>
										<img src="/academy/images/ico_x.png" alt="답변대기" />
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
								<c:choose>
								<c:when test="${not empty listData}">
 									<c:forEach items="${listData}" var="result" varStatus="stat"> 
 											<!-- asis 첨부파일인지 확인 -->
 											<c:forTokens var="spath" items="${result.SAVPATH}" delims="/" varStatus="tStat">
									             <c:if test="${tStat.index eq 3}">
									             	<c:set var="TYPE" value="${spath}"/>
									             </c:if>
									        </c:forTokens> 
  											<a href="#" onclick="fnDown('<c:out value="${result.SAVFILE}"/>', '<c:out value="${TYPE}"/>');" class="t_link"><c:out value="${result.ORGFILE}"/></a>(<fmt:formatNumber value="${result.FSIZE}" type="number" groupingUsed="true" /> KB)<br>
									</c:forEach>
								</c:when>
								<c:otherwise>   
									<!-- 등록된 파일이 없습니다. -->
								</c:otherwise>
							</c:choose></td>
							</tr>
						</thead>
						<tbody>
							<!-- 글내용 -->
							<tr class="content">
								<td colspan="4" valign="top">
									<c:out value="${fn:replace(cfn:clearXSSMinimum(rowData.CONTENT), crlf, '<br />')}" escapeXml="false"/>
								</td>
							</tr>
							<!-- // 글내용 -->
							<!-- 답변 영역 -->
							
							<c:choose>
								<c:when test="${rowData.ANYN eq 'Y'}">
								
									<tr class="answer">
										<td colspan="4">
											<div class="answer_wrap">
												<p class="hard">관리자 답변<span><fmt:formatDate value="${rowData.AN_WATE}" pattern="yyyy-MM-dd" /></span></p>
												<div class="shadow_box">
													<div class="orange_box">
														<c:out value="${rowData.AN_CONTENT}" escapeXml="false"/>
													</div>
												</div>
											</div>
										</td>
									</tr>

								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
							
							<!-- // 답변 영역 -->
						</tbody>
					</table>
				</div>
				
				<!-- 버튼 영역 -->
				<div class="bbs_control">
					<div class="btn_group">
						<div class="btn_right">
							<a href="#" onclick="fnForm('<c:out value="${rowData.BBSNO}"/>'); return false;" class="btn mid green">수정</a>
							<a href="#" onclick="fnDel('<c:out value="${rowData.BBSNO}"/>'); return false;" class="btn mid gray">삭제</a>
							<a href="#" onclick="fnList(); return false;" class="btn mid orange">목록</a>
						</div>
					</div>
				</div>
				<!-- // 버튼 영역 -->
				</div>
				</form>
			</div><!-- // Contents -->
		</div>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>