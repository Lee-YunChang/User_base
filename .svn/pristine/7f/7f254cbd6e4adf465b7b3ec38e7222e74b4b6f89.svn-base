<%
/****************************************************
	system	:  클래스데스크 > 설문 > 엑셀다운
	title		: 과정별 설문 결과  엑셀 다운
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<% 
    response.setContentType("application/vnd.ms-excel; charset=utf-8");
    response.setHeader("Content-Description", "JSP Generated Data");  
	response.setHeader("Content-Disposition", "attachment;filename=poll_result_list.xls;");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
table th { background-color:#6EE3F7;} 
</style> 
</head>
<body>
	<table border="1">
		<tr>
			<th colspan="3">설문조사 결과보기</th>
		</tr>
		<tr>
			<th>과정명</th>
			<td colspan="2"><c:out value="${rowData.SEQ_TITLE}"/></td> 
		</tr> 
		<tr>
			<th>학습기간</th>
			<td colspan="2">
			<c:choose>
				<c:when test="${openType eq 'A'}">상시</c:when>
				<c:otherwise>
					<c:out value="${rowData.STUDY_SDATE}"/> ~ <c:out value="${rowData.STUDY_EDATE}"/>
				</c:otherwise>
			</c:choose>
			</td> 
		</tr> 
		<tr>
			<th>설문명</th>
			<td colspan="2"><c:out value="${listData[0].TITLE }"/></td> 
		</tr> 
		<tr>
			<th>참여자 수 / 수강생 수</th>
			<td colspan="2"><c:out value="${listData[0].TOTCNT }"/>명 /  <c:out value="${rowData.CNT}"/>명</td> 
		</tr> 
	</table> 
	<br/> 
	<table border="1">
		<tr>
			<th>문항</th>
			<th>응답율</th>
			<th>응답자수</th>
		</tr>

		<c:if test="${not empty listData}">
 			<c:forEach items="${listData}" var="result" varStatus="stat">
				<tr>
					<td colspan="3" style="background-color: #ffff95;"  ><c:out value="${stat.count}"/>. <c:out value="${result.SUBJECT}"/></td>
				</tr>
 				<c:if test="${result.MT_CPOLL_CODE eq 'JBBA00' }">
 					
 					<c:if test="${not empty result.ITEM01}">
						<tr>
							<td>&nbsp;&nbsp;1) <c:out value="${result.ITEM01}"/></td>
							<td><c:out value="${result.PERCENT1}"/>%</td>
							<td align="right"><c:out value="${result.CNT1}"/>명</td>
						</tr>
					</c:if>
					
					<c:if test="${not empty result.ITEM02}">
						<tr>
							<td>&nbsp;&nbsp;2) <c:out value="${result.ITEM02}"/></td>
							<td><c:out value="${result.PERCENT2}"/>%</td>
							<td align="right"><c:out value="${result.CNT2}"/>명</td>
						</tr>
					</c:if>
					
					<c:if test="${not empty result.ITEM03}">
						<tr>
							<td>&nbsp;&nbsp;3) <c:out value="${result.ITEM03}"/></td>
							<td><c:out value="${result.PERCENT3}"/>%</td>
							<td align="right"><c:out value="${result.CNT3}"/>명</td>
						</tr>
					</c:if>
					
					<c:if test="${not empty result.ITEM04}">
						<tr>
							<td>&nbsp;&nbsp;4) <c:out value="${result.ITEM04}"/></td>
							<td><c:out value="${result.PERCENT4}"/>%</td>
							<td align="right"><c:out value="${result.CNT4}"/>명</td>
						</tr>
					</c:if>
					<c:if test="${not empty result.ITEM05}">
						<tr>
							<td>&nbsp;&nbsp;5) <c:out value="${result.ITEM05}"/></td>
							<td><c:out value="${result.PERCENT5}"/>%</td>
							<td align="right"><c:out value="${result.CNT5}"/>명</td>
						</tr>
					</c:if> 
 				</c:if>
			</c:forEach>
		</c:if>
	</table>

	<br/>
	<table border="1">
		<tr>
			<th>문제번호</th>
			<th>문항</th>
			<th>설문응답</th>
		</tr>
		<c:if test="${not empty desListData}">
 			<c:forEach items="${desListData}" var="desResult" varStatus="stat"> 
			 <tr>
				<td align="center"><c:out value="${desResult.QNO}"/></td>
				<td><c:out value="${desResult.SUBJECT}"/></td>
				<td>(<c:out value="${desResult.USERNAME}"/>) <c:out value="${desResult.ANSWER}"/></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
</html>