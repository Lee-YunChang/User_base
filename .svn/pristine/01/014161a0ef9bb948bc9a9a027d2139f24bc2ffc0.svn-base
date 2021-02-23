<%
/****************************************************
	system	: academy > 나의강의실 > 교재구매내역
	title	: 교재구매내역 목록
	summary	:	
	wdate	: 2013-08-29
	writer	: kim min gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
	<!-- contents -->
	<div id="contents">
		<!-- left_menu -->
		<%-- <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb.jsp"%> --%>
		<div class="cont_view">
			<!-- locaton-->
			<p class="loc" id="separate"><a href="<c:out value="${GODO_DOMAIN}"/>/main/main.do" title="메인 바로가기"><img src="/academy/images/ic_home.gif" alt="홈으로" /></a>&gt; 
			<a href="<c:out value="${ctx}"/>/academy/main/main.do" title="메인 바로가기">아카데미</a>&gt; <a href="<c:out value="${ctx}"/>/academy/myclass/myclass/list.do">나의 강의실</a>&gt; 
			<a href="<c:out value="${ctx}"/>/academy/myclass/tutorbbs/bbs_list.do" title="강사게시판">강사게시판</a></p>
			<!-- con_title-->
			<div class="img_tit ad">
				<p class="c_tit">나의 강의실</p>

			</div>
			
			<!--게시판 타이틀-->
			<div class="board_title">
				<p class="b_tit"><img src="/academy/images/academy/cnt_ad_t7.png" alt="강사게시판" /></p>
			</div>
			
			<form id="bbsForm" name="bbsForm">
			<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
			<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
			<input type="hidden" name="fileno"  id="fileno" value="">
			<input type="hidden" name="searchWord"  id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
			<input type="hidden" name="searchMode"  id="searchMode" value="<c:out value="${REQUEST_DATA.searchMode}"/>"/>

			<!-- 문의하기 -->
			<div class="ad_bbs_view" style="margin-top:35px;">
			
				<!-- 내용 타이틀 -->
				<div class="ad_l_tit">공지 / 자료실</div>
				<!-- //내용 타이틀 -->
				
				<!-- 컬럼이 가로로 구분되는 테이블의 경우 class="ad_table_col" 추가 / 세로로 구분되는 테이블의 경우 class="ad_table_row" 추가 -->
				<!-- 테이블의 색상은 ad_table_blue / ad_table_purple 2종류 -->
				
				<table>
					<colgroup>
						<col width="120" />
						<col width="" />
						<col width="120" />
						<col width="" />
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<td colspan="3">
								<c:if test="${rowData.BCATENO == 4011}"><img src="/academy/images/academy/ico_notice.png" alt="공지" class="ad_bbs_ico" /></c:if>
								<c:if test="${rowData.BCATENO == 4012}"><img src="/academy/images/academy/ico_data.png" alt="자료" class="ad_bbs_ico" /></c:if>
								<c:out value="${rowData.TITLE }"/>
							</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td><c:out value="${rowData.WDATE}"/></td>
							<th>조회수</th>
							<td><c:out value="${rowData.RCNT}"/></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
							
								<c:choose>
								<c:when test="${not empty listData}">
 									<c:forEach items="${listData}" var="result" varStatus="stat"> 
 											<a href="javascript:filedown('<c:out value="${result.FILENO}"/>')" title="파일다운로드"><c:out value="${result.ORGFILE}"/></a>(<c:out value="${result.FSIZE}"/> KB)<br>
									</c:forEach>
								</c:when>
								<c:otherwise>   
									등록된 파일이 없습니다.
								</c:otherwise>
							</c:choose>	  
							
							</td> 
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">
								<p>
								<c:out value="${rowData.CONTENT }" escapeXml="false"/>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- //문의하기 -->
			
			<!-- 9월 4일자 수정 페이징이 들어갈 경우 겹침 현상 방지를 위해 ad_clearfix 추가 -->
			<div class="ad_table_btm_wrap ad_clearfix">
				<div class="ad_table_btm_btn">
					<a href="#" onclick="fnList(); return false;" title="게시판 목록"><img src="/academy/images/academy/btn_l_list.png" alt="목록" /></a>
				</div>
			</div>
			</form>
		</div>
	</div>
	
	<!-- footer -->

	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	
	<script type="text/javascript">
		
		//파일다운로드
		function filedown(fileno){
			$('#fileno').val(fileno);
			$('form[name=bbsForm]').attr('action', '/admin/filedown.do').submit();
		}
		
		function fnList(){
			$('form[name=bbsForm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/tutorbbs/bbs_list.do').attr('target', '_self').submit();		
		}
		
	</script>