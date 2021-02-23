<%
/****************************************
	system	: ClassDesk > 강사 > 시험 > 문제은행 
	title	: 문제목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="test"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<!-- 시험출제 -->
	

	<div class="table-title mg-t18 clearfix">
		<h3 class="ico-table-blue">출제정책별 문제관리</h3>
	</div>
	 
	<form id="popFrm" name="popFrm" method="post" action="/classdesk/tutor/quizbank/list.do">
 	<input type="hidden" name="secNo" id="secNo" value="<c:out value='${REQUEST_DATA.secNo}'/>"/>
 	<input type="hidden" name="examNo" id="examNo" value="<c:out value='${REQUEST_DATA.examNo}'/>"/> 
 	
 	<div class="table-type2">
		<div class="table-header-left"></div>
	
		<table id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 검색영역입니다.">
			<caption>검색영역</caption>
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="40%"> 
			</colgroup>
			<thead>
				<tr>
					<th>출제정책</th>
					<td class="left">
						<span id="setArea" >
									<select name="selectSetList" id="selectSetList" onchange="fnChSetList(this.value);">
										<c:choose>
											<c:when test="${not empty subListData}">
 												<c:forEach items="${subListData}" var="result" varStatus="stat">
							 						<option value="<c:out value="${result.SECNO}"/>"  <c:if test="${result.SECNO == REQUEST_DATA.secNo}"> selected</c:if> ><c:out value="${result.SECTITLE}"/></option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<option value="0">등록된 세트가 없습니다</option>
											</c:otherwise>
										</c:choose>
									</select>
 						</span>
					</td>
					<th>세트명</th>
					<td>
						<select name="searchQtype">
								<option value="">전체</option>
						 		<option value="1" <c:if test="${REQUEST_DATA.searchQtype == 1}"> selected </c:if>>OX</option>
						 		<option value="2" <c:if test="${REQUEST_DATA.searchQtype == 2}"> selected </c:if>>객관식</option>
						 		<option value="4" <c:if test="${REQUEST_DATA.searchQtype == 4}"> selected </c:if>>서술형</option>
					 			<option value="5" <c:if test="${REQUEST_DATA.searchQtype == 5}"> selected </c:if>>단답형</option>
						</select>
						&nbsp; <input type="text" name="qsubject" value="<c:out value="${REQUEST_DATA.qsubject}"/>" onKeyPress="if(event.keyCode==13){fnQuizList();} " />   
						<a href="#" onclick="fnQuizList();"  class="btn-small-orange" title="출제정책 검색"><span>검색</span></a> 
					</td>
				</tr>
			</thead>
		
		</table>
	</div>
	<br/>			
 	<div class="table-title clearfix">
		
	<div class="btn-group">
			<div class="btn-group"> 
				<a href="#none" onclick="fnPopForm('q_excel_form'); return false;" class="btn-small-blue" title="문제일괄등록"><span>문제일괄등록</span></a>
			</div>
		</div>
	</div>
 
	<div class="table-type1">
		<div class="table-header-left"></div>   
		
		<input type="hidden" name="qNo" id="qNo"/>
		<table  id="set_exam" summary="상상스토리 교육시스템 클래스데스크의 출제시험입니다.">
			<caption>출제시험</caption>
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="5%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>문제유형</th>
					<th>문제</th>
					<th>정답</th>
					<th>등록일자</th>
					<th>사용여부</th>
					<th><a href="#none" onclick="fnSavePop('0')" class="btn-small-white" title="문제 추가"><span class="blue">추가</span></a>  </th>
				</tr>
			</thead>
			<tbody>
				
				<c:choose>
					<c:when test="${not empty listData}">
 						<c:forEach items="${listData}" var="result" varStatus="stat">
	 						<tr>
								<td><c:out value="${result.RNUM}"/></td>
								<td>
									<c:choose>
									 	<c:when test="${result.QTYPE == 1}"> OX </c:when>
									 	<c:when test="${result.QTYPE == 2}"> 객관식 </c:when> 
									 	<c:when test="${result.QTYPE == 4}"> 단답형</c:when>
									 	<c:when test="${result.QTYPE == 5}"> 서술형</c:when>
										<c:otherwise>-</c:otherwise>
									</c:choose> 
								</td>
								<td class="left">
									<pre><c:out value="${result.QSUBJECT}"/></pre>
									<c:if test= "${not empty result.QSUBJECT_FILE}">
									<img src="<c:out value="${ctx}"/>/classdesk/fileview.do?type=R&qno=<c:out value="${result.QNO}"/>&targetFile=QSUBJECT_FILE"  alt="문제이미지" onerror="this.src='/classdesk/images/thumb_noimage.gif'" style="max-width: 99%" /> 
 								</c:if>
								</td>
								<td>
										<c:choose>
											<c:when test="${result.QTYPE == 1}">
												<c:if test="${result.RCODE ==  1}">O</c:if>
												<c:if test="${result.RCODE ==  2}">X</c:if>
											</c:when>
											
											<c:when test="${result.QTYPE == 2}">
												<c:out value="${result.RCODE}"/>
												<c:if test="${empty result.RCODE}"><c:out value="${result.RTEXT}"/></c:if>
											</c:when> 
											<c:when test="${ result.QTYPE == 4  || result.QTYPE == 5 }">
												<c:out value="${result.RTEXT}"/>
											</c:when>
											<c:otherwise>
												<c:out value="${result.RTEXT}"/>
											</c:otherwise>
										</c:choose>
								</td>
								<td><fmt:formatDate value="${result.WDATE}" pattern="yyyy-MM-dd" /></td>
								<td>
									<c:choose>
										<c:when test="${result.USEYN eq 'Y'}">
											<span class="blue_b">Y</span>
										</c:when>
										<c:otherwise>
											<span class="red_b">N</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<a href="#none" onclick="fnSavePop('<c:out value="${result.QNO}"/>'); return false;" class="btn-small-white" title="문제 수정"><span class="orange">수정</span></a>
									<a href="#none" onclick="fnDel('<c:out value="${result.QNO}"/>'); return false;" class="btn-small-white" title="문제 삭제"><span class="red">삭제</span></a>
								</td>
							</tr>
						</c:forEach> 
					</c:when>
					<c:otherwise>
						<tr> <td colspan="7">등록된 정보가 없습니다.</td></tr>
					</c:otherwise>
				</c:choose>
			 
			</tbody>
		</table>

	</div>
	</form>
	
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" onclick="fnExemList(); return false;" class="btn-large-blue" title="이전 목록"><span class="blue">이전</span></a>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
	
	<script type="text/javascript">
	<!--
          
    	/**************************************************
    	 함수명 : fnExemList
    	 설 명 : 시험 폼 페이지 이동 
    	***************************************************/ 
    	function fnExemList() { 
    		$('#popFrm').attr('target', '_self').attr('method', 'POST').attr('action', '/classdesk/tutor/exam/form.do').submit();
    	}
    	  
    	/**************************************************
    	 함수명 : fnQuizList
    	 설 명 : 현재 페이지 이동 
    	***************************************************/
    	function fnQuizList() { 
    		$('#popFrm').attr('target', '_self').attr('method', 'POST').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/quizbank/q_list.do').submit();
    	}
    	
    	
    	/**************************************************
    	 함수명 : fnSavePop
    	 설 명 : 문제 등록/수정 팝업폼
    	***************************************************/
    	function fnSavePop(qNo){
    		$('#qNo').val(qNo);
    		$('#popFrm').attr('action', '/classdesk/tutor/quizbank/q_form.do')
    		SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop3', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
    	}
    	
    	/**************************************************
    	 함수명 : fnDel
    	 설 명 : 문제 삭제 함수 
    	***************************************************/
    	function fnDel(qNo){
    		  var answer = confirm ('삭제하시겠습니까?');
    		  if(answer){
    			  $('#qNo').val(qNo);
    			  $('#popFrm').attr('target', '_cm').attr('method', 'POST').attr('action', '/classdesk/tutor/quizbank/q_del_exec.do').submit();
    		  }
    	}
    	
    	/**************************************************
    	 함수명 : fnPopForm
    	 설 명 : EXCEL 문제 일괄등록 팝업 
    	***************************************************/
    	function fnPopForm(subcmd){
            $('#popFrm').attr('action', '/classdesk/tutor/quizbank/' + subcmd + '.do')
    		SANGS.Util.openPopupSubmit($('#popFrm'), 'qFormPop2', 'width=830, height=660, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
    	}
    	
    	/**************************************************
    	 함수명 : fnChSetList
    	 설 명 : 출제정책 검색
    	***************************************************/
    	function fnChSetList(sno){
    		$('#secNo').val(sno);
    		fnQuizList();
    	}

	//-->
	</script>

