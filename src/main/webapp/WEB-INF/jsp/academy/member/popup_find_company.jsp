<%
/****************************************************
	system	: academy > 회원 > 비밀번호 변경 팝업창
	title	: 비밀번호 변경 팝업창
	summary	:	
	wdate	: 2015-03-02
	writer	: kim hak gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge; requiresActiveX=true;" />
<!-- 이니페이 관련 META정보 -->
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/>

<title>상상스토리 사용자포털</title>

<link rel="stylesheet" href="<c:out value='/academy/common/css/common.css'/>" type="text/css" />  

<head>

<script type="text/javascript">


$(document).ready(function(){
	onlyNum2('bizNo1');
	onlyNum2('bizNo2');
	onlyNum2('bizNo3');

	
	$('#comName, #bizNo1, #bizNo2, #bizNo3').bind('keydown', function(e) {
        if (e.keyCode == 13) { // enter key
        	fnSearch();
        	
            return false;
        }
    });


    
});

//소속업체 검색
function fnSearch(){
	if($('#bizNo1').val() == '' || $('#bizNo2').val() == '' || $('#bizNo3').val() == ''){
		$('#bizNo').val(null);
	}else {
		$('#bizNo').val($('#bizNo1').val()+'-'+$('#bizNo2').val()+'-'+$('#bizNo3').val());
	}
	
	$('#frm').submit();	
}

function fnSelect(comName, comNo, bizNo, comAddr,  induty, bizCnd, ceo){
	opener.openCompanySearchPopCallback(comName, comNo, bizNo, comAddr,  induty, bizCnd, ceo);
	self.close();
}


</script>



</head>
<body>
	<div id="popup">
		<div class="pop_header clearfix">
			<h1>소속업체 찾기</h1>
			<a href="javascript:close();" title="닫기"><img src="/academy/images/ico_pop_close.png" alt="닫기" /></a>
		</div>

		<div class="pop_wrap">

			<form name="frm" id="frm" action="/academy/user/member/popFindCompany.do" method="post">
			<input type= "hidden" name="searchYn" id="searchYn" value="Y">
			<input type= "hidden" name="bizNo" id="bizNo" value=""> 
			
			<div class="table_box">
				<table cellpadding="0" cellspacing="0" class="col_type">
					<caption>소속업체 찾기:상상스토리 교육시스템의 소속업체 찾기입니다.</caption>
					<colgroup>
						<col width="150px"/>
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th><label for="comName">회사명</label></th>
							<td>
								<input type="text" id="comName" name="comName" style="width: 80%;" value="<c:out value="${REQUEST_DATA.companyNm}"/>" title="회사명"/>
							</td>
						</tr>
						<tr>
							<th><label for="bizNo1">사업자 번호</label></th>
							<td>
								<input type="text" id="bizNo1" name="bizNo1" style="width: 60px;" value="<c:out value="${REQUEST_DATA.bizNo1}" />" maxlength="3"/> - <input type="text" id="bizNo2" name="bizNo2" title="사업자번호 가운데자리" style="width: 60px;" value="<c:out value="${REQUEST_DATA.bizNo2}" />" maxlength="2"/> - <input type="text" id="bizNo3" name="bizNo3" title="사업자번호 끝자리" style="width: 100px;" value="<c:out value="${REQUEST_DATA.bizNo3}" />" maxlength="5"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="btn_area clearfix">
				<div class="btn_group_center">
					<a href="#" onclick="javascript:fnSearch(); return false;"class="btn big orange" title="업체 조회">조회</a>
				</div>
			</div>
			
			<!-- 조회 버튼 클릭 후 리스트 생성 -->
			<div class="table_box" style="margin-top: 20px;">
				<table cellpadding="0" cellspacing="0" class="row_type">
					<caption>소속업체 조회 목록:상상스토리 교육시스템의 소속업체 조회 목록입니다.</caption>
					<colgroup>
						<col width="20px"/>
						<col width="px"/>
						<col width="140px"/>
						<col width="100px"/>
						<col width="80px"/>
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>업체명</th>
							<th>사업자 번호</th>
							<th>대표이사</th>
							<th>선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						
						<c:choose>
						<c:when test="${not empty resultList}">
							<c:forEach items="${resultList}" var="result" varStatus="stat">
							<tr>
								<td></td>
								<td><c:out value="${result.COMNAME}" /></td>
								<td><c:out value="${result.BIZNO}" /></td>
								<td><c:out value="${result.CEO}" /></td>
								<td><a href="#" onclick="javascript:fnSelect('<c:out value="${result.COMNAME}" />', '<c:out value="${result.COMNO}" />', '<c:out value="${result.BIZNO}" />', '<c:out value="${result.ADDR01}" /> <c:out value="${result.ADDR02}" />', '<c:out value="${result.INDUTY}" />', '<c:out value="${result.BIZCND}" />', '<c:out value="${result.CEO}" />'); return false;" class="btn blue" title="업체 선택">선택</a></td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>   
							<c:if test="${empty resultList}">
								<tr><td colspan="5" align="center">등록된 정보가 없습니다.</td></tr>
							</c:if>
						</c:otherwise>
					</c:choose>

						</tr>
					</tbody>
				</table>
			</div>

			<!-- 페이징 영역 -->
			<c:if test="${not empty listData}">
					<div class="bbs_control">
						<div class="paging_wrap">
							<paging:page cpage="${REQUEST_DATA.cPage}" total="${listData[0].TOTALCNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
						</div>
					</div>
				</c:if>
			<!-- // 페이징 영역 -->

			<!-- // 조회 버튼 클릭 후 리스트 생성 -->

		</div><!-- //.pop_wrap -->
	</div>
</body>
</html>
