<%
/****************************************
	subject	: 나의강의실 > 1:1문의 리스트
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
 
 <script type="text/javascript">
// 조회
function fnSearch(page) {
	
	if(page) {
		$('#cPage').val(page);
	}
	$('#frm').attr('target', '_self');
	$('#frm').submit();
}
	
//삭제하기
function fnDel(bbsNo){
	if(confirm('삭제하시겠습니까?')){
		$('#bbsNo').val(bbsNo);
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsDelExec.do').attr('target', '_cm').submit();
	}
}

//글쓰기
function fnForm(){
	$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsForm.do').attr('target', '_self').submit();
}

//상세보기
function fnDetail(bbsNo){
	$('#bbsNo').val(bbsNo);
	$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsView.do').attr('target', '_self').submit();			
}

//리스트
function move_page(cPage){
	$('#cPage').val(cPage);
	$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsList.do').submit();
} 

</script>
 
 
 
 
 
 
 <div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_helpdesk.jsp" %>
		<div class="path">
        	<ul>
            	<li><span class="home text-hide">홈</span></li>
                <li>알림마당</li>
                <li class="active">공지사항</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">공지사항</h2>
            		</div>           	
	            </section>

				<form name="frm" id="frm" action="/academy/myclass/myBbsList.do" method="post">
				<input type="hidden" name="bbsNo" id="bbsNo"/> 
				<input type="hidden" name="cPage" ID="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
				</form>
				<section class="tableBox">
				
					<div class="tblTop row">
						<div class="col-sm-6"></div>
						<div class="col-sm-6 col-xs-12">
							<fieldset>
									<legend class="sr-only">검색</legend>
									<div class="titSearchWrap">
										 <input type="text" name="searchText" title="공지사항 검색어 입력" id="searchText" class="form-control" onkeypress="if(event.keyCode==13){searchWord();return false}" value="${REQUEST_DATA.searchWord}">
										 <button class="btn btn-sm btn-mint" onclick="searchWord(); return false" title="검색">검색</button>
									</div>
							</fieldset>
						</div>
					</div>
					
					<div class="tblWrap">
						<table class="boardList">
							<caption>1:1 문의 목록테이블:상상스토리 교육시스템의 1:1 문의 목록입니다.</caption>
						<colgroup>
							<col width="60px" />
							<col width="100px" />
							<col width="" />
							<col width="100px" />
							<col width="100px" />
						</colgroup>
						<thead>
							<tr>
								<th>No.</th>
								<th>문의유형</th>
								<th>제목</th>
								<th>답변여부</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
							
							<tr>
								<td><c:out value="${result.NUM}"/></td>
								<td><c:out value="${result.BCATENAME}"/></td>
								<td class="left"><a href="#" onclick="fnDetail('<c:out value="${result.BBSNO}"/>'); return false;"><c:out value="${result.TITLE}"/></a></td>
								<td>
								
								<c:choose>
									<c:when test="${result.ANYN eq 'Y'}">
										<img src="/academy/images/ico_o.png" alt="답변대기" />
									</c:when>
									<c:otherwise>
										<img src="/academy/images/ico_x.png" alt="답변대기" />
									</c:otherwise>
								</c:choose>
								
								</td>
								<td><c:out value="${result.WDATE}"/></td>
							</tr>
							
							</c:forEach>
						</c:when>
						<c:otherwise>   
						<tr>
							<td colspan="5" align="center">등록된 정보가 없습니다.</td>
						</tr>
						</c:otherwise>
					</c:choose>
					
						</tbody>
						</table>
						<c:if test="${not empty listData}">
							<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page" />
						</c:if>
					</div>
				</section>
			</div><!-- //sub-contents -->
		</div> <!-- //subCntWrap -->
	</article>
</div>	 
	 
<!-- footer -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 <%-- <div class="contents-wrap">

	<form name="frm" id="frm" action="/academy/myclass/myBbsList.do" method="post">
	<input type="hidden" name="bbsNo" id="bbsNo"/> 
	<input type="hidden" name="cPage" ID="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>

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
				<div class="bbs_list">
					<table cellpadding="0" cellspacing="0">
						<caption>1:1 문의 목록테이블:상상스토리 교육시스템의 1:1 문의 목록입니다.</caption>
						<colgroup>
							<col width="60px" />
							<col width="100px" />
							<col width="" />
							<col width="100px" />
							<col width="100px" />
						</colgroup>
						<thead>
							<tr>
								<th>No.</th>
								<th>문의유형</th>
								<th>제목</th>
								<th>답변여부</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
							
							<tr>
								<td><c:out value="${result.NUM}"/></td>
								<td><c:out value="${result.BCATENAME}"/></td>
								<td class="left"><a href="#" onclick="fnDetail('<c:out value="${result.BBSNO}"/>'); return false;"><c:out value="${result.TITLE}"/></a></td>
								<td>
								
								<c:choose>
									<c:when test="${result.ANYN eq 'Y'}">
										<img src="/academy/images/ico_o.png" alt="답변대기" />
									</c:when>
									<c:otherwise>
										<img src="/academy/images/ico_x.png" alt="답변대기" />
									</c:otherwise>
								</c:choose>
								
								</td>
								<td><c:out value="${result.WDATE}"/></td>
							</tr>
							
							</c:forEach>
						</c:when>
						<c:otherwise>   
						<tr>
							<td colspan="5" align="center">등록된 정보가 없습니다.</td>
						</tr>
						</c:otherwise>
					</c:choose>
					
						</tbody>
					</table>
				</div>

				<!-- 페이징, 버튼 영역 -->
				<div class="bbs_control">
					<c:if test="${not empty listData}">
					
						<div class="paging_wrap">
							<paging:page cpage="${REQUEST_DATA.cPage}" total="${listData[0].TOTALCNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
						</div>
					</c:if>
						
					<div class="btn_group">
						<div class="btn_right">
							<a href="#" class="btn mid orange"onclick="fnForm(); return false;">글쓰기</a>
						</div>
					</div>
				</div>
					
				<!-- // 페이징, 버튼 영역 -->

				<!-- 검색폼 -->
				<div class="bbs_search">
					<select id="searchMode" name="searchMode" title="검색 설정">
						<option value="title" <c:if test="${REQUEST_DATA.searchMode eq 'title' }">selected="selected" </c:if>>제목</option>
						<option value="writer" <c:if test="${REQUEST_DATA.searchMode eq 'writer' }">selected="selected" </c:if>>작성자</option>
						<option value="content" <c:if test="${REQUEST_DATA.searchMode eq 'content' }">selected="selected" </c:if>>내용</option>
					</select>
					<input type="text" id="searchWord" name="searchWord" title="검색어" style="width:150px;" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
					<a href="#" onclick="javascript:fnSearch('1');return false;" class="btn brown" >검색</a>
				</div>
				<!-- // 검색폼 -->

			</div><!-- // Contents -->
		</div>
		
		</form>
		
	</div> 
	
<!-- 풋터 영역 -->	

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>--%>