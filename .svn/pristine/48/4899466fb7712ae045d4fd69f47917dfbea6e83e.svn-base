<%
/****************************************************
	system	: academy > 우편번호 팝업
	title	: 우편번호
	summary	:	
	wdate	: 2013-09-10
	writer	: kim min gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%>
<!-- 팝업타이틀 -->
<div class="ad_popup_head">
	<h1>우편번호검색</h1>
	<a href="#" onclick="self.close();" title="팝업닫기"><img src="/academy/images/academy/btn_popup_close.png" alt="팝업닫기" /></a>
</div>
<!-- //팝업타이틀 -->

<!-- 팝업내용 -->
<div class="ad_popup_cont">
	<form id="postForm" name="postForm" action="<c:out value="${ctx}"/>/academy/common/common/post.do" method="post">
		<input type="hidden" name="cPage" id="cPage" value=""/>
		
		<div class="ad_post_select ad_clearfix" style="display: none;">
			<div class="ad_position_out">
				<div class="ad_position_in">
					<div class="ad_radio">
						<input type="radio" name="ad_post" id="ad_new" title="새주소(도로명 주소)"/>
						<label for="ad_new"><strong>새주소(도로명 주소)</strong></label>
						<input type="radio" name="ad_post" id="ad_old" title="구주소(지번 주소)"/>
						<label for="ad_old"><strong>구주소(지번 주소)</strong></label>
					</div>
				</div>
			</div>
		</div>
		
		<p class="ad_txt_field" style="margin-top:20px;">
			<em>※</em> <strong>찾고자 하는 주소의 동(읍/면/리) 입력 후 검색을 눌러주세요.</strong><br />
			<span>(예 : 논현동, 현안리, 을지로 3가)</span>
		</p>
		
		<!-- 주소 검색 -->
		<div class="ad_bbs_search_wrap" style="margin-top:15px;">
			<div class="ad_bbs_search_box ad_pop_box ad_clearfix">
				<div class="ad_position_out">
					<div class="ad_position_in">
					<!-- 	<div class="ad_search_select ad_w150">
							<label for="ad_select_city" class="ad_label">시/도 선택</label>
							<select name="ad_select_city" id="ad_select_city" class="ad_tb_select">
								<option value="">시/도 선택</option>
								<option value="">서울특별시</option>
								<option value="">경기도</option>
							</select>
						</div> -->
						<label for="ad_search_road" class="ad_label">도로명</label>
						<input type="text" name="searchWord" id="searchWord" class="ad_input" style="width:200px;" title="도로명 : <c:out value="${REQUEST_DATA.searchWord }"/>" value="<c:out value="${REQUEST_DATA.searchWord }"/>" />
						<input type="image" name="ad_search_button" id="ad_search_button" src="/academy/images/academy/btn_m_search.png" alt="검색" />
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- //주소 검색 -->
	
	<p class="ad_txt_field" style="margin-top:20px;">
		<em>※</em> <strong>주소 선택</strong> <span>  (해당 주소를 누르면 자동으로 입력됩니다.)</span>
	</p>
	
	<div class="ad_table" style="margin-top:15px;">
		<table class="ad_table_col ad_table_blue">
			<caption>우편번호 조회 : 상상스토리 교육시스템의 우편번호 조회입니다.</caption>
			<colgroup>
				<col width="120" />
				<col width="" />
			</colgroup>
			<thead>
				<tr>
					<th class="ad_cell_first">우편번호</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty listData}">
					<c:forEach items="${listData}" var="result" varStatus="stat">
					<tr>
						<td class="ad_cell_first"><c:out value="${result.POSTCODE}"/> </td>
						<td class="ad_add_link ad_left"><a href="#none" onclick="fnPostSelect('<c:out value="${result.POSTCODE}"/>', '<c:out value="${result.ADDR}"/>'); return false;" title="주소"><c:out value="${result.ADDR}"/> </a></td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>   
				<tr>
					<td colspan="2" align="center">등록된 정보가 없습니다.</td>
				</tr>
				</c:otherwise>
			</c:choose>	
			</tbody>
		</table>
	</div>
	
	<!-- 게시물 페이징 -->
	<!-- ie7 중앙정렬을 위한 wrap -->
	<div class="ad_paging_wrap" style="margin-top:30px;">
		<paging:page cpage="<c:out value="${REQUEST_DATA.cPage}"/>" total="<c:out value="${listData[0].TOTALCNT}"/>" pageSize="10" link="javascript:move_page"/>
	</div>
	<!-- //게시물 페이징 -->
	
	<div class="ad_popup_btngroup" style="margin-top:30px;">
		<a href="#" onclick="self.close();" title="확인"><img src="/academy/images/academy/btn_popup_confirm.png" alt="확인" /></a>
	</div>
</div>
<!-- //팝업내용 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>
	<script type="text/javascript">
		$(function($) {
			$("#postForm").submit(function(){
				if ($("input[name=searchWord]").valueEmpty()){
					alert("검색어는 최소 2글자 이상 입력해 주세요.");
					return false;
				}
			});
		});	
		
		function move_page(cPage){
			$("#cPage").val(cPage);
			$("form[name=postForm]").attr("action", "<c:out value="${ctx}"/>/academy/common/common/post.do").submit();
		} 
		
		
		
		function fnPostSelect(pCode, addr){
			var postCode = pCode.split("-");
			opener.fnPostSelected(postCode[0], postCode[1], addr);
			window.close();
		}
		
	</script>

