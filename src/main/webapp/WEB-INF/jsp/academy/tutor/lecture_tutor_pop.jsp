<%
/****************************************************
	system	: 특강강사 검색
	title	: 특강강사 검색
	summary	: 
	wdate	: 2016-09-22
	writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

});

function move_page(cPage){
	var frm = document.pform;
	frm.cPage.value = cPage;
	frm.submit();
}

//검색
function list_page(){
	var frm = document.pform;
	frm.target = '';
	frm.cPage.value = '1';
	frm.submit();
}

function chkEnter(){
	if (event.keyCode==13) list_page();
}

// 강사 선택 등록
function goExec() {
	var userNo = $(':radio[name="userno"]:checked');
	var lecUsernm = userNo.attr("lecUsernm");
	var lecPhone = userNo.attr("lecPhone");
	var mtTutorCode = userNo.attr("mtTutorCode");
	if(confirm('강사를 선택 하시겠습니까?')){	
		$(opener.document).find("#lecUserno").val(userNo.val());
		$(opener.document).find("#lecUsernm").val(lecUsernm);
		$(opener.document).find("#lecPhone").val(lecPhone);
		$(opener.document).find("#mtTutorCode[value='']").prop("checked", false);
		$(opener.document).find("#mtTutorCode[value='"+mtTutorCode+"']").prop("checked", true);
		
		window.close();
	}
}

function goView(userno, entrstYear, idx) {
	var openYn = $("#btn"+idx).attr("openYn");
	if(openYn == 'N') {
		$("#btn"+idx).text('경력보기▲');	
		$("#btn"+idx).attr("openYn", "Y");

		$.ajax({
			url : "/academy/tutor/lectureTutorHis.do",
			type: "post",
			dataType : "json",
			data : {
				"userno" : userno
				,"entrstYear" : entrstYear
			},
			success : function(data) {
				var result = data;
				var vhtml = "<table class='tb table-type2' style='width:100%'>";
				vhtml += "<tr>";
				vhtml += "<th style='text-align:center;background-color:#f4f4f4;color:#848484'>활동/근무내용</th>";
				vhtml += "<th style='text-align:center;background-color:#f4f4f4;color:#848484'>소속</th>";
				vhtml += "<th style='text-align:center;background-color:#f4f4f4;color:#848484'>근무기간</th>";
				vhtml += "<th style='text-align:center;background-color:#f4f4f4;color:#848484'>비고(필요 시 학위 및 필요 여부)</th>";
				vhtml += "</tr>";
				vhtml += "<colgroup>";
				vhtml += "<col width='25%'>";
				vhtml += "<col width='20%'>";
				vhtml += "<col width='8%'>";
				vhtml += "<col width='25%'>";
				vhtml += "<col width='8%'>";
				vhtml += "</colgroup>";
				vhtml += "<tbody>";
				
				if(result.length > 0 ) {
					for(var i=0;i<result.length;i++){
						vhtml += "<tr align='center'>";
						vhtml += "<td>"+result[i].activeWork+"</td>";
						vhtml += "<td>"+result[i].grpNm+"</td>";
						vhtml += "<td>"+result[i].workYear+"</td>";
						vhtml += "<td>"+result[i].etc+"</td>";
						vhtml += "</tr>";
					}
				}
				else {
					vhtml += "<tr><td colspan='4' align='center'>경력 이력이 없습니다.</td></tr>"
				}

				vhtml += "</tbody>";
				vhtml += "</table>";

				$("#hisBody"+idx).html(vhtml);
				$("#hisInfo"+idx).show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("데이터를 불러오는데 실패하였습니다.(error : "+errorThrown+")");
			}
		});
	}
	else {
		$("#btn"+idx).text('경력보기▼');
		$("#btn"+idx).attr("openYn", "N");
		$("#hisInfo"+idx).hide();
	}
	
}
</script>

<!-- 본문 > 상단 > 타이틀 -->
<div class="title title_top">강사풀</div>
<!-- 본문 > 상단 > 검색영역 시작 -->
<form name="pform" id="pform" action="/academy/tutor/lectureTutorSearch.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${resultList[0].TOTAL_CNT}"/>"/>

	<table class="table-type1 search_form">
		<colgroup>
			<col class="cellc" width="15%">
			<col class="celll" width="85%">
		</colgroup>
		<tbody>
	  	<tr>
			<th>강사분류</th>
			<td>
				<input type="checkbox" name="schMtTutorCode" value=""  <c:if test="${REQUEST_DATA.schMtTutorCode eq '' || REQUEST_DATA.schMtTutorCode eq null}"> checked="checked"</c:if>/> 전체&nbsp;
		        <c:forEach var="emap2" items="${categoryData4}" varStatus="status2">
		        <input type="checkbox" name="schMtTutorCode" value="${emap2.MT_SUB_CODE}" <c:if test="${REQUEST_DATA.schMtTutorCode eq emap2.MT_SUB_CODE}"> checked="checked"</c:if>/> <c:out value="${emap2.MT_SUB_NAME}"/>&nbsp;
		        </c:forEach>
 			</td>
 		</tr>
 		<tr>
 			<th>지역</th>
			<td>
				<input type="radio" name="schMtAreaCode" value=""  <c:if test="${REQUEST_DATA.schMtAreaCode eq '' || REQUEST_DATA.schMtAreaCode eq null}"> checked="checked"</c:if>/> 전체&nbsp;
		        <c:forEach var="emap2" items="${categoryData1}" varStatus="status1">
		        <input type="radio" name="schMtAreaCode" value="${emap2.MT_SUB_CODE}" <c:if test="${REQUEST_DATA.schMtAreaCode eq emap2.MT_SUB_CODE}"> checked="checked"</c:if>/> <c:out value="${emap2.MT_SUB_NAME}"/>&nbsp;
		        </c:forEach>
 			</td>
		</tr>
		<tr>
			<th>검색</th>
			<td>
		  		<select name="searchType" id="searchType" title="검색">
					<option value="">선택</option>
					<option value="NAME"  <c:if test="${REQUEST_DATA.searchType eq 'NAME' }">selected="selected" </c:if>>이름</option>
					<option value="PHONE"  <c:if test="${REQUEST_DATA.searchType eq 'PHONE' }">selected="selected" </c:if>>연락처</option>
					<option value="AREA"  <c:if test="${REQUEST_DATA.searchType eq 'AREA' }">selected="selected" </c:if>>지역</option>
					<option value="FIELD" <c:if test="${REQUEST_DATA.searchType eq 'FIELD' }">selected="selected" </c:if>>분야</option>
				</select>	
	            <input type="text" class="line" id="searchWord" name="searchWord" style="width:300px" title="검색어입력" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
	            <span class="button_top"><a href="#" onclick="list_page();" class= "btn search brown">검색</a></span>
			</td>		
		</tr> 
		</tbody>
	</table>
	<!-- 본문 > 상단 > 검색영역 끝 -->
	
	<div class="space5"></div>	
	<table class="tb table-type1">
	    <tr class="rndbg">
	    	<th>선택</th>
	        <th>NO</th>
	        <th>분류</th>
	        <th>분야</th>
	        <th>지역</th>
	        <th>이름</th>
	        <th>이메일</th>
	        <th>연락처</th>
	        <th>소속</th>
	        <th>경력</th>
	    </tr>
	    <colgroup>
	        <col width="5%">
	        <col width="5%">
	        <col width="8%">
	        <col width="10%">
	        <col width="10%">
	        <col width="10%">
	        <col width="12%">
	        <col width="12%">
	        <col width="10%">
	        <col width="8%">
	    </colgroup>
	    <c:choose>
	    <c:when test="${not empty resultList}">
		    <c:forEach var="result" items="${resultList}" varStatus="status">
		    <tr align="center">
		    	<td><input type="radio" name="userno" id="userno" value="<c:out value='${result.USERNO}'/>" 
		    	lecUsernm="<c:out value='${result.MBERNM}'/>" lecPhone="<c:out value='${result.TELNO}'/>" mtTutorCode="<c:out value="${result.MT_TUTOR_CODE}"/>"/></td>
		        <td><c:out value='${resultList[0].TOTAL_CNT - (REQUEST_DATA.cPage-1)*20 - status.count+1}'/></td>
		        <td><c:out value="${result.MT_TUTOR_NAME}"/></td>
		        <td><c:out value="${result.MT_FIELD_NAME}"/></td>
		        <td><c:out value="${result.MT_AREA_NAME}"/></td>
		        <td><c:out value="${result.MBERNM}"/></td>
		        <td><c:out value="${result.EMAIL}"/></td>
		        <td><c:out value="${result.TELNO}"/></td>
		        <td></td>
		        <td><a href="#" onclick="goView('${result.USERNO}','${result.ENTRST_YEAR}', '${status.index+1}')" id="btn${status.index+1}" openYn="N">경력보기▼</a></td> 
		    </tr>
		    <tr id="hisInfo${status.index+1}" style="display:none">
		    	<td colspan="10" id="hisBody${status.index+1}" >강사가 직접 작성한 경력 내용</td></tr>
		    </c:forEach>
		</c:when>
		<c:otherwise>
			<tr><td colspan="10" align="center">등록된 데이타가 없습니다.</td></tr>
		</c:otherwise>
		</c:choose>
	</table>
	<c:if test="${not empty resultList}">
	    <div class="admin-paging paging_wrap">
	        <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTAL_CNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
	    </div>
	</c:if>
</form>
<br/>
<div class="space"></div>
<table style="width:100%;text-align:center">
	<tr>
		<td align="center">
		<a href="#" onclick="goExec()" class= "btn big orange">등록</a>
		<a href="#" onclick="window.close();" class= "btn big gray">취소</a>
		</td>
	</tr>
</table>
