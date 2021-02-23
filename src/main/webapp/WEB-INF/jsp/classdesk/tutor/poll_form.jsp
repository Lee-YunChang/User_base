<%
/****************************************
	system	: ClassDesk > 강사 > 설문 리스트
	title	: 설문 메인
	summary	: 
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<c:set var="topMenuCode" value="survey"/>
<div class="wrapper clearfix">
    <!-- 왼쪽 메뉴 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
<!-- // 왼쪽 메뉴 영역 -->

	<form name="popFrm" id="popFrm" action="/classdesk/tutor/poll/q_form.do">
		<input type="hidden" name="pollcSeqNo" id="pollcSeqNo" value="<c:out value="${listData[0].POLLCSEQNO}"/>">
		<input type="hidden" name="qNo" id="qNo" value="">
	</form>
		
	<form name="frm" id="frm" action="/classdesk/tutor/poll.do">
		<input type="hidden" name="subcmd" id="subcmd"/>
		<input type="hidden" name="openYn" id="openYn"/>
		<input type="hidden" name="pollcSeqNo" id="pollcSeqNo" value="<c:out value="${listData[0].POLLCSEQNO}"/>"> 
		<input type="hidden" name="qNo" id="qNo" value=""/>
	 <c:if test="${not empty listData}">
		<div id="Right_Area" >
			
			<!-- 테이블 -->
			<div class="table-type3">
				<table>
					<caption>기간조회</caption>
					<colgroup>
						<col width="13%" />
						<col width="42%" />
					</colgroup>
					<tbody>
						<tr>
						<th>제목</th>
							<td colspan="3"><label for="exam-title">제목</label>
							<input type="text" class="w98" name="title" id="title" value="<c:out value="${listData[0].TITLE}" />"/>
							</td>
						</tr>
						<tr>
							<th>기간</th>
							<td colspan="3">
								<input type ="radio" class="line" name="openType" id="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeAll")%>" onclick="openDateSelect(this.value);" checked/> 상시 &nbsp;
								<input type ="radio" class="line" name="openType" id="openType" value="<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>" onclick="openDateSelect(this.value);" /> 기간
								<span id="dateSelect" style="display: none;padding-top:10px">
									<label for="exam-title">제출기한</label><label for="task-date1">시작날짜선택</label>
									<input type="text" class="w15" name="sdate" id="sdate" value='<fmt:formatDate value="${listData[0].SDATE}" pattern="yyyy-MM-dd" />' readonly="readonly" /> 
									<a href="#none" onclick="$('#sdate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="시작날짜선택" /></a> 
									
									<span class="date-cut">~</span> 
									<label for="task-date2">마지막날짜선택</label>
									<input type="text" class="w15" name="edate" id="edate" value='<fmt:formatDate value="${listData[0].EDATE}" pattern="yyyy-MM-dd" />' readonly="readonly">
									<a href="#none" onclick="$('#edate').focus(); return false;" class=""><img src="/classdesk/images/btn_m_calendar.png" alt="마지막날짜선택" /></a>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
	
	
	
	<br>
	<!-- 과제리스트 -->
	<div id="Right_Area" >
		<h3 class="ico-table-blue">설문목록</h3>
	</div>
	<c:if test="${empty listData}">
	<br><b style="color: red;">* 마스터 설문은 개별 설문 등록 이전에 추가해주세요! (개별 설문 후에는 마스터 설문 등록이 불가합니다.) <br></b>
	<div align="right" style="padding-bottom: 10px;">
 		<a href="#none" onclick="fnMstBchInsert(); return false;"class="btn-large-blue"><span>마스터 설문 등록</span></a>
	</div>
	</c:if>
		<div id="Right_Area" >
			<div class="table-header-left"></div>
			<table>
				<caption>설문목록</caption>
				<colgroup>
					<col width="5%" />
					<col width="5%" />
					<col width="*" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="5%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>유형</th>
						<th>문제</th>
						<th>항목1</th>
						<th>항목2</th>
						<th>항목3</th>
						<th>항목4</th>
						<th>항목5</th>
						<th>사용여부</th>
						<th>
							<a href="#none" onclick="fnPopFrm(''); return false;" class="btn-small-white"><span class="blue">추가</span></a>
						</th>
					</tr>
				</thead>
				<tbody>
				
				<c:choose>
					<c:when test="${not empty listData}">
						<c:forEach items="${listData}" var="result" varStatus="stat">
							<tr>
								<td><c:out value="${result.RNUM}"/></td>
								<td><c:out value="${result.MT_CPOLL_NAME}"/></td>
								<td  align="middle"><c:out value="${result.SUBJECT}"/></td>
								<td><c:out value="${result.ITEM01}"/></td>
								<td><c:out value="${result.ITEM02}"/></td>
								<td><c:out value="${result.ITEM03}"/></td>
								<td><c:out value="${result.ITEM04}"/></td>
								<td><c:out value="${result.ITEM05}"/></td>
								<td><c:out value="${result.USEYN}"/></td>
								<td>
									<a href="#none" onclick="fnPopFrm('<c:out value="${result.QNO}"/>'); return false;" class="btn-small-white"><span class="orange">수정</span></a>
									<a href="#none" onclick="fnDel('<c:out value="${result.QNO}"/>'); return false;" class="btn-small-white"><span class="orange">삭제</span></a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>   
					<tr>
						<td colspan="10" align="center">현재 등록된 설문이 없습니다.</td>
					</tr>
					</c:otherwise>
				</c:choose>	
				</tbody>
			</table>
		</div>
	<!-- //과제리스트 -->
	
	<!-- 게시판 버튼영역 -->
	<c:if test="${not empty listData}">
	<div id="Right_Area">
		<div class="btn-table">
			<a href="#none" onclick="fnSave('N'); return false;" class="btn-large-blue"><span>임시저장</span></a>
			<a href="#none" onclick="fnSave('Y'); return false;" class="btn-large-green"><span>설문등록</span></a>
		</div>
	</div>
	</c:if>
	</form>
	
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">

		jQuery(document).ready(function(){
			/** datepicker init*/
			SANGS.Util.datepickerCallOptions($('#sdate'), $('#edate'));			
		});	
		
		/**************************************************
		 함수명 : fnMstBchInsert
		 설 명 : 설문 마스터 일괄저장
		***************************************************/ 
		function fnMstBchInsert(){
			 
			if(confirm('마스터 설문을 등록하시겠습니까? \n확인 버튼을 누르면 관리자에서 설정한 설문 문항이 자동 등록됩니다.')){
				$('form[name=frm]')
				.attr('action', '/classdesk/tutor/poll/mts_call_exec.do')
				.attr('method', 'post')
				.attr('target', '_cm')
				.submit();
  			}		
		}
		
		
		/**************************************************
		 함수명 : fnPopFrm
		 설 명 : 설문 문제추가 (팝업)
		***************************************************/ 
		function fnPopFrm(qNo){
			$('#qNo').val(qNo);
			SANGS.Util.openPopupSubmit($('#popFrm'), 'pollAddPop', 'width=830, height=500, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		}
		
		/**************************************************
		 함수명 : fnPopFrm
		 설 명 : 설문 문제추가 (팝업)
		***************************************************/ 
		function fnDel(qNo){
			if(confirm('삭제 하시겠습니까?')){
	 			$('#frm > input[name=qNo]').val(qNo);  
				$('#frm')
				    .attr('action', '/classdesk/tutor/poll/q_del_exec.do')
					.attr('method', 'post')
					.attr('target', '_cm')
					.submit();
			}
		}
		
		/**************************************************
		 함수명 : fnForm
		 설 명 : 폼 리로드 
		***************************************************/ 
		function fnForm() {
			window.location.href = '/classdesk/tutor/poll/form.do';
		}
		
		/**************************************************
		 함수명 : fnStatsList
		 설 명 : 페이징 이동 함수
		***************************************************/ 
		function fnStatsList() {
			window.location.href = '<c:out value="${ctx}"/>/classdesk/tutor/poll/stats.do';
		}
		
		/**************************************************
		 함수명 : fnSave
		 설 명 : 저장 함수
		***************************************************/ 		
		function fnSave(tmpOpenYn){
			if(tmpOpenYn == 'Y'){
				if ($('input[name=title]').valueEmpty()) {
					alert('제목을 입력해주세요.');
					$('input[name=title]').focus();
					return;
				}			
				
				if($.getLength($('input[name=title]')) > 200){
					 alert('제목은 200(byte) 이하로 입력해주세요.');
					 $('input[name=title]').focus();
					 return false;
				}
				
				var openType = $(':radio[name=openType]:checked').val();
				if(openType == '<%=SangsProperties.getProperty("Globals.courseSeqOpenTypeSelect")%>') {
					if ($('input[name=sdate]').valueEmpty()) {
						alert('설문기간 시작일자를 입력해주세요.');
						$('input[name=sdate]').focus();
						return;
					}		
					if ($('input[name=edate]').valueEmpty()) {
						alert('설문기간 종료일자를 입력해주세요.');
						$('input[name=edate]').focus();
						return;
					}		
				}	
				if(!confirm('설문등록 하시겠습니까?')) return false;
			}
			
			$('#openYn').val(tmpOpenYn);
			$('form[name=frm]').attr('action', '/classdesk/tutor/poll/exec.do').attr('method', 'post').attr('target', '_cm').submit();
		}

		function openDateSelect(value){
			if(value == 'D'){
				document.getElementById('dateSelect').style.display = 'block';
				
			} else if(value == 'A' || value == '') {
				document.getElementById('dateSelect').style.display = 'none';
			
			}
		}
</script>

