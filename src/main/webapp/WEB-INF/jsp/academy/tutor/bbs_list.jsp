<%
/****************************************************
	system	: academy > 나의강의실 > 강사게시판
	title	: 강사게시판 목록
	summary	:	
	wdate	: 2013-08-29
	writer	: kim min gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
	<!-- contents -->
	<div id="contents">
		<!-- left_menu -->
		<%-- <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb.jsp"%> --%>
		<!-- content_view -->
		<div class="cont_view">
			<!-- locaton-->
			<p class="loc" id="separate"><a href="<c:out value="${GODO_DOMAIN}"/>/main.do" title="메인 바로가기"><img src="/academy/images/ic_home.gif" alt="홈으로" /></a>&gt; 
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
			
			
			
			<form name="frm" id="frm" action="<c:out value="${ctx}"/>/myclass/tutorbbs/bbs_list.do" method="post">
			<input type="hidden" name="bbsNo" id="bbsNo"/> 
			<input type="hidden" name="cPage" ID="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
			
			
			<!-- 일반과정 -->
			<div class="ad_bbs_list" style="margin-top:35px;">
			
				<!-- 내용 타이틀 -->
				<div class="ad_l_tit">공지 / 자료실</div>
				<!-- //내용 타이틀 -->
				
				<!-- 컬럼이 가로로 구분되는 테이블의 경우 class="ad_table_col" 추가 / 세로로 구분되는 테이블의 경우 class="ad_table_row" 추가 -->
				<!-- 테이블의 색상은 ad_table_blue / ad_table_purple 2종류 -->
				
				<table>
					<colgroup>
						<col width="50" />
						<col width="" />
						<col width="150" />
						<col width="120" />
						<col width="120" />
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody> 
					<c:choose>
						<c:when test="${not empty topListData}">
							<c:forEach items="${topListData}" var="result" varStatus="stat">
							<tr>
								<td class="ad_bbs_num_b">TOP</td>
								<td class="ad_left ad_bbs_link">
								
									<c:if test="${result.BCATENO == 4011}"><img src="/academy/images/academy/ico_notice.png" alt="공지" class="ad_bbs_ico" /></c:if>
									<c:if test="${result.BCATENO == 4012}"><img src="/academy/images/academy/ico_data.png" alt="자료" class="ad_bbs_ico" /></c:if>
								
									<a href="#" onclick="fnDetail('<c:out value="${result.BBSNO}"/>'); return false;" title="<c:out value="${result.TITLE}"/>"><c:out value="${result.TITLE}"/></a>
								</td>
								<td><c:out value="${result.WRITER}"/></td>
								<td class="ad_bbs_num"><c:out value="${result.WDATE}"/></td>
								<td><c:out value="${result.RCNT}"/></td>
							</tr>
						</c:forEach>
						</c:when>
					
					</c:choose>	
					
					
					<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
							<tr>
								<td class="ad_bbs_num_b"><c:out value="${result.NUM}"/> </td>
								<td class="ad_left ad_bbs_link">
								
									<c:if test="${result.BCATENO == 4011}"><img src="/academy/images/academy/ico_notice.png" alt="공지" class="ad_bbs_ico" /></c:if>
									<c:if test="${result.BCATENO == 4012}"><img src="/academy/images/academy/ico_data.png" alt="자료" class="ad_bbs_ico" /></c:if>
								
									<a href="#" onclick="fnDetail('<c:out value="${result.BBSNO}"/>'); return false;" title="<c:out value="${result.TITLE}"/>"><c:out value="${result.TITLE}"/></a>
								</td>
								<td><c:out value="${result.WRITER}"/></td>
								<td class="ad_bbs_num"><c:out value="${result.WDATE}"/></td>
								<td><c:out value="${result.RCNT}"/></td>
							</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>   
							<c:if test="${empty topListData}">
								<tr><td colspan="5" align="center">등록된 정보가 없습니다.</td></tr>
							</c:if>
						</c:otherwise>
					</c:choose>	
					</tbody>
				</table>
			</div>
			<!-- ie7 중앙정렬을 위한 wrap -->
			<c:if test="${not empty listData}">
			<div class="ad_paging_wrap" style="margin-top:30px;">
				<paging:page cpage="${REQUEST_DATA.cPage}" total="${total}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
			</div>
			</c:if>
			<!-- //게시물 페이징 -->
					
			<!-- 사이즈 구분없이 중앙정렬 시키기 위해 코딩 변경됨 // 20130905 -->
			<!-- 게시물 검색 -->
				<div class="ad_bbs_search_wrap" style="margin-top:30px;">
					<div class="ad_bbs_search_box ad_clearfix">
						<div class="ad_position_out">
							<div class="ad_position_in">
								<div class="ad_search_select ad_w150">
									<label for="ad_select_type" class="ad_label">검색유형선택</label>
									<select name="searchMode" id="searchMode" class="ad_tb_select">
										<option value="all">전체</option>
										<option value="title" <c:if test="${REQUEST_DATA.searchMode eq 'title' }">selected="selected" </c:if>>제목</option>
										<option value="content" <c:if test="${REQUEST_DATA.searchMode eq 'content' }">selected="selected" </c:if>>내용</option>
									</select>
								</div>
								<label for="ad_search_txt" class="ad_label"></label>
								<input type="text" name="searchWord" id="searchWord" class="ad_input" style="width:350px;" value="<c:out value="${REQUEST_DATA.searchWord}"/>" title="게시글 검색 입력"/>
								<input type="image" name="ad_search_button" id="ad_search_button" src="/academy/images/academy/btn_m_search.png" alt="검색" />
							</div>
						</div>
					</div>
				</div>
			</form> 
			<!-- //게시물 검색 -->
		</div>
	</div>
	
	<!-- footer -->

	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	
	<script type="text/javascript">
		$(function($) {
			
		});	
		
		function fnDetail(bbsNo){
			$('#bbsNo').val(bbsNo);
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/tutorbbs/bbs_view.do').attr('target', '_self').submit();			
		}
		
		function move_page(cPage){
			$('#cPage').val(cPage);
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/tutorbbs/bbs_list.do').submit();
		} 
		
	</script>