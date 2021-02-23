<%
/****************************************************
	system	: 특강교육 > 강사풀
	summary	:	
	wdate	: 2016-09-10
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%>

<script type="text/javascript">
	function move_page(cPage){
		$('#cPage').val(cPage);
		$('form[name="pform"]').attr('action', '/academy/course/lectureTutorSearch.do').submit();
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
	

	function goView(userno, entrstYear, idx) {
		var openYn = $("#btn"+idx).attr("openYn");
		
		if(openYn == 'N') {
			$("#btn"+idx).text('경력');
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
					var vhtml = "";
					
					if(result.length > 0 ) {
						for(var i=0;i<result.length;i++){
							vhtml += "<tr>";
							vhtml += "<td>"+result[i].activeWork+"</td>";
							vhtml += "<td>"+result[i].grpNm+"</td>";
							vhtml += "<td>"+result[i].workYear+"</td>";
							vhtml += "<td>"+result[i].etc+"</td>";
							vhtml += "</tr>";
						}
					}
					else {
						vhtml += "<tr><td colspan='4' align='center'>등록된 활동경력이 없습니다.</td></tr>";
					}

					$("#hisBody"+idx).html(vhtml);
					$("#hisInfo"+idx).show();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("데이터를 불러오는데 실패하였습니다.(error : "+errorThrown+")");
				}
			});
		}
		else {
			//$("#btn"+idx).text('경력▼');
			$("#btn"+idx).attr("openYn", "N");
			$("#hisInfo"+idx).css('disaply' , 'none');
		}
		
	}
	
	// 강사 선택 등록
	function goExec() {
		var userNo = $(':radio[name="userno"]:checked');
		var adminchk = $(':checkbox[id="adminChk"]:checked');
		var lecUsernm = userNo.attr("lecUsernm");
		var mtTutorCode = userNo.attr("mtTutorCode");
		var mtFieldCode = userNo.attr("mtFieldCode");
		var comName = userNo.attr("comName");
		
		if($("input[name='userno']:checked").length == 0 && $("input[name='adminChk']:checked").length == 0) {
			alert('강사를 선택하시거나 관리자에게 요청해 주세요.');
			return;
		}
		
		if($("input[name='adminChk']:checked").length > 0) {
			if(confirm('관리자에게 요청 하시겠습니까?'))	{
				$(opener.document).find("#adminApplyYn").val('Y');
				$(opener.document).find("#lecUserno").val("");
				$(opener.document).find("#lecUsernm").val("");
				$(opener.document).find("#comName").val("");
				$(opener.document).find("#mtTutorCode").val("");
				window.close();
			}
			else {
				$(':checkbox[id="chk"]').prop("checked", false);
			}
		} else {
		
			if(confirm('강사를 선택 하시겠습니까?')){	
				$(opener.document).find("#lecUserno").val(userNo.val());
				$(opener.document).find("#lecUsernm").val(lecUsernm);
				$(opener.document).find("#comName").val(comName);
				$(opener.document).find("#mtTutorCode").val(mtTutorCode);
				$(opener.document).find("#mtTutorCode[value='']").prop("checked", false);
				$(opener.document).find("#mtFieldCode option[value='']").attr('selected', '');
				$(opener.document).find("#mtTutorCode[value='"+mtTutorCode+"']").prop("checked", true);
				$(opener.document).find("#mtFieldCode option[value='"+mtFieldCode+"']").attr('selected', 'selected');
				
				window.close();
			}else {
				$(':radio[name="userno"]').prop("checked", false);
			}
		}
		
	}
	
</script>
<form name="pform" id="pform" action="/academy/course/lectureTutorSearch.do" method="post">
<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage }"/>"/>
<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${resultList[0].TOTAL_CNT}"/>"/>

	<div class="popup-wrap">
		<div class="popup-tit">
			<h1 class="con-tit">강사검색</h1>
		</div>
		
		<div class="popup-con">
			<div class="serch-box left-box">
				<div class="serch-box_text">
					지역 : &nbsp
					<span class="radio-wrap2">
						<span class="checks">
							<input type="radio" id="mtAreaCodeAll" name="mtAreaCodePop" title="전체" value="" checked="checked" <c:if test="${ REQUEST_DATA.mtAreaCodePop eq ''}">checked="checked"</c:if>>
							<label for="mtAreaCodeAll">전체</label>
						</span>
					</span>	
					<c:forEach items="${categoryData1}" var="result" varStatus="status">
						 <span class="radio-wrap2">
							<span class="checks">
								<input type="radio" id="mtAreaCode${status.count}" name="mtAreaCodePop" title="<c:out value="${result.MT_SUB_NAME}"/>" value="${result.MT_SUB_CODE}" <c:if test="${ REQUEST_DATA.mtAreaCodePop eq result.MT_SUB_CODE}">checked="checked"</c:if>>
								<label for="mtAreaCode${status.count}"><c:out value="${result.MT_SUB_NAME}"/></label>
							</span>
						</span>	
					</c:forEach> 
				</div>
				<div class="serch-box_text2">
					분야 : &nbsp
					<span class="radio-wrap2">
						<span class="checks">
							<input type="radio" id="mtFieldCodeAll" name="mtFieldCode" title="전체" value="" checked="checked" <c:if test="${ REQUEST_DATA.mtFieldCode eq ''}">checked="checked"</c:if>>
							<label for="mtFieldCodeAll">전체</label>
						</span>
					</span>	
					<c:forEach items="${categoryData3}" var="result" varStatus="status">
						 <span class="radio-wrap2">
							<span class="checks">
								<input type="radio" id="mtFieldCode${status.count}" name="mtFieldCode" title="<c:out value="${result.MT_SUB_NAME}"/>" value="${result.MT_SUB_CODE}" <c:if test="${ REQUEST_DATA.mtFieldCode eq result.MT_SUB_CODE}">checked="checked"</c:if>>
								<label for="mtFieldCode${status.count}"><c:out value="${result.MT_SUB_NAME}"/></label>
							</span>
						</span>	
					</c:forEach> 
				</div>
				<div class="sub-select" id="select_container">
					<select name="searchType" id="searchType" title="강사선택" id="">
						<option value="all">선택</option>
						<option value="NAME" <c:if test="${ REQUEST_DATA.searchType eq 'NAME' || not empty REQUEST_DATA.mtScCode}">selected="selected" </c:if> >이름
						<option value="PHONE" <c:if test="${ REQUEST_DATA.searchType eq 'PHONE'}">selected="selected" </c:if>>연락처</option>
						<%-- <option value="AREA"  <c:if test="${ REQUEST_DATA.searchType eq 'AREA'}">selected="selected" </c:if>>지역</option>
						<option value="FIELD" <c:if test="${ REQUEST_DATA.searchType eq 'FIELD'}">selected="selected" </c:if>>분야</option> --%>
					</select>
				</div><input type="text" id="searchWord" name="searchWord" title="강사검색 입력" value="${REQUEST_DATA.searchWord}">
				
				<button title="검색" onclick="list_page();" class="btn-submit">검색</button>
			</div>
			
			<div class="rel">
				<p>
					조회건수 <span class="txt_red"><c:out value="${resultCount}"/></span>건 &nbsp; 
					<span class="checks">
						<input type="checkbox" name="adminChk" id="adminChk" title="관리자에게 요청하기">
						<label for="adminChk">관리자에게 요청하기 (강사를 선택해 주시거나, 목록에 검색이 안 될 경우 관리자에게 요청하기를 체크하여 주세요. )</label>
					</span>
				</p>
<!-- 				<p class="abs right"><span class="checks"><input type="checkbox" name="adminChk" id="adminChk"><label for="adminChk">관리자에게 요청하기</label></span></p> -->
			</div> 

			<div class="con-tbl">
				<table class="sub-table popuptable">
					<caption>강사검색 테이블 : 이 표는 특강교육 특강(강사요청) 강사 검색 테이블입니다.</caption>
					<colgroup>
						<col style="width:auto">
						<col style="width:auto">
						<col style="width:auto">
						<col style="width:auto">
						<col style="width:auto">
						<col style="width:auto">
						<col style="width:auto">
						<col style="width:auto">
						<col style="width:auto">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">No</th>
							<th scope="col">분야</th>
							<th scope="col">이름</th>
							<th scope="col">이메일</th>
							<th scope="col">소속</th>
							<th scope="col">활동지역</th>
							<th scope="col">경력</th>
						</tr>
					</thead>
					<tbody>
						<tr><td colspan="10" align="center">등록된 데이터가 없습니다.</td></tr>
					</tbody>
				</table>
			</div>
			<c:if test="${not empty resultList}">
				<div class="bbs_control">
					<div class="paging_wrap">
						<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
					</div>
				</div>
			</c:if>

			<div class="ac">  
				<button type="submit" onclick="goExec()" title="선택" class="btn choice">선택</button>
				<a href="#" onclick="window.close();" class="btn list" title="취소">취소</a>
			</div>
		</div>

	</div><!-- / wrap-->

</form>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>