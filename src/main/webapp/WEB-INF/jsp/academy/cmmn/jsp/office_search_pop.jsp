<%
/****************************************************
	system	: 우편번호 찾기
	summary	:	
	wdate	: 2016-09-10
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%>
<script type="text/javascript">
//검색
function list_page(){
	var frm = document.pform;
	frm.target = '';
	frm.cPage.value = '1';
	$("#pform").attr("action", "/academy/user/officeSearchList.do");
	frm.submit();
}

function move_page(cPage){
	$('#cPage').val(cPage);
	$("#pform").attr("action", "/academy/user/officeSearchList.do");
	$('form[name=pform]').submit();
}

function reTrunData(){
	var comNo = $('input[name="comNo"]:radio:checked');
	var comName = comNo.attr("comName");

	if(comNo.val() == null) {
		alert('지점을 선택해 주세요.');
		return;
	}
	var data = {
		'comNo' : comNo.val(),
		'comName' : comName
	};
	if(opener){
		opener.fnCodePopupCallBack(data);
		self.close();
	}
}

//엔터키 이벤트
function chkEnter(){
	 if(event.keyCode == 13)
     {
		 list_page();
     }
}

</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="popup-tit">
	<h1 class="con-tit">지점 검색</h1>
</div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/academy/user/officeSearchList.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
<input type="hidden" name="total" id="total" value="<c:out value="${resultCount}"/>"/>
<input type="hidden" name="orgName" id=""orgName"" value="<c:out value=""/>"/>
<input type="hidden" name="currentPage" value="1"/><!-- 현재 페이지. -->
<input type="hidden" name="countPerPage" value="20"/> <!-- 페이지당 출력 목록 수. 기본값은 10 -->
			
	<div class="serch-box label">
		<label for="group">지점명</label><input type="text" id="searchWord" name="searchWord" title="기관.단체명 입력" value="<c:out value="${REQUEST_DATA.searchWord}" />" >
		<button title="검색" onclick="list_page(); return false;" class="btn-submit">검색</button>
	</div>

	<div class="rel">
		<p>조회건수 <span class="txt_red">${resultCount}</span>건</p>
	</div>
	
	
	<div class="con-tbl">
				<table class="sub-table popuptable login">
					<caption>기관/단체 검색 테이블 : 이 표는 기관/단체 검색 테이블입니다.</caption>
					<colgroup>
						<col style="width:48px">
						<col style="width:auto">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">지점명</th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
					<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td>
								<span class="checks mr0">
									<input type="radio" name="comNo" id="comNo<c:out value="${result.COMNO}"/>" comName="<c:out value="${result.COMNAME}"/>" orgCode="<c:out value="${result.ORG_CODE}" />" value="<c:out value="${result.COMNO}"/>" title="<c:out value='${result.COMNAME}'/> 선택">
									<label for="comNo<c:out value="${result.COMNO}" />"></label>
								</span>
							</td>
							<td><span class="blue"><c:out value='${result.COMNAME}'/></span></td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="2">해당 내용이 없습니다.</td>
						</tr>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			</form>

			<c:if test="${not empty resultList}">
			     <div class="pagelist">
					<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
				</div>
			 </c:if>
			<!-- //pagelist -->

			<div class="ac">
				<button type="submit" title="선택" onclick="reTrunData(); return false"; class="btn choice">선택</button>
				<a href="#none" class="btn list" title="취소">취소</a>
			</div>
	
</form>
<br/>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>