<%
/****************************************
	system	: ClassDesk > 강사 > 시험
	title	: 시험 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS 
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
	
<div class="table-type1">
		
		<div class="table-header-left"></div>
		<table id="randomList">
			<caption>출제시험</caption>
			<colgroup>
				<col width="5%" />
				<col width="15%" />
				<col width="*" />
				<col width="7%" />
				<col width="7%" />
				<col width="7%" />
				<col width="7%" />
				<col width="7%" />
			</colgroup>
			<thead>
 				<tr>
					<th>No.</th>
					<th>출제정책</th>
					<th>설명</th>
					<th>문항 배점</th>
					<th>응시문제수</th>
					<th>사용여부</th>
					<th>등록문제수</th>
					<!-- 접근성 인증을 위해 새창이 열릴 경우 title="새창"과 target="_blank" 표시 -->
					<th>문제<%-- <a href="#none"><img src="/classdesk/images/btn_s_setup.png" alt="응시문제설정" /></a> <a href="#" title="새창" target="_blank"><img src="/classdesk/images/btn_s_add.png" alt="추가" /></a> --%></th>
				</tr>
			</thead>
			<tbody>
			
			<c:choose>
				<c:when test="${not empty subListData}">
					<c:forEach items="${subListData}" var="result" varStatus="stat">
					 	<input type="hidden" name="secNo" id="secNo<c:out value="${stat.index}"/>" value="<c:out value="${result.SECNO }" />"> 
						<tr id = "quizList">
							<td><c:out value="${result.RNUM}"/></td>
							<td><label for="exam-sectitle">출제항목</label><input type="text" class="w98" name="secTitle" id="secTitle<c:out value="${stat.index}"/>" value="<c:out value="${result.SECTITLE}"/>" /></td>
							<td><label for="exam-description">설명</label><input type="text" class="w98" name="description" id="description<c:out value="${stat.index}"/>" value="<c:out value="${result.DESCRIPTION}"/>" /></td>
							<td><label for="exam-allot">배점</label><input type="text" class="w98" name="allot" id="allot<c:out value="${stat.index}"/>" numberonly="true"  value="<c:out value="${result.ALLOT}"/>" /></td>
							<td><label for="exam-totalqnum">출제문제수</label><input type="text" class="w98" name="totalQnum" id="totalQnum<c:out value="${stat.index}"/>" numberonly="true" value="<c:out value="${result.TOTALQNUM}"/>" /></td>
							<td><label for="exam-leUseYn">사용여부</label>
								<select name="leUseYn" id="leUseYn<c:out value="${stat.index}"/>" onchange="fnLeUseYn('<c:out value="${stat.index}"/>', this.value)" style="width: 90%;" > 
									<option value="Y"<c:if test="${result.USEYN eq 'Y'}"> selected </c:if>>Y</option>
									<option value="N" <c:if test="${result.USEYN eq 'N' || empty result.USEYN}"> selected </c:if>>N</option>
								</select>
							</td>
							<td><label for="exam-totalqnum">등록문제수</label> <c:out value="${result.EX_CNT}"/><input type="hidden" class="w98" name="exCnt" id="exCnt<c:out value="${stat.index}"/>" value="<c:out value="${result.EX_CNT}"/>" /></td>
							<td> 
								<a href="#none" class="btn-small-white" onclick="fnExamQform('<c:out value="${result.SECNO}"/>'); return false;"><span class="green">문제목록</span></a>
							</td>
						</tr>
					</c:forEach>
					 
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8" align="center">등록된 정보가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
</div>