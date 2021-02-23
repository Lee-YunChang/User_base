<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
	response.setContentType("application/vnd.ms-excel; charset=UTF-8");
	response.setHeader("Content-Disposition", "attachment;filename=result_list.xls;");
%>

<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   
<style type="text/css">
table th { background-color:#6EE3F7;} 

</style> 
</head>
<body>
<p>
	<h2>부가 업무료 내역</h2>
</p>
	<table border="1">
		<colgroup>
			<col width="120" />
			<col width="70" />
			<col width="120" />
			<col width="" />
			<col width="150" />
			<col width="120" />
			<col width="120" />
		</colgroup>
			<tr>
				<th>업무일자</th>
				<th>요일</th>
				<th>근무구분</th>
				<th>업무명</th>
				<th>업무시간</th>
				<th>진행상태</th>
				<th>부가업무료</th>
			</tr>
		<c:choose>
			<c:when test="${not empty etcListData}">
				<c:set var="checks" value="00000000"/>
				<c:forEach items="${etcListData}" var="result" varStatus="stat">
					<c:set var="checks" value="${result.WORK_TIME}"/> 
					<c:set var="check_array" value="${fn:split(checks,';')}"/> 
				<tr>
					<td align="center"><fmt:formatDate value="${result.FEE_DATE}" pattern="yyyy-MM-dd" /></td>
					<td align="center"><c:out value="${result.WEEK}"/></td>
					<td align="center"><c:out value="${result.MT_WORK_TYPE_NM}"/></td>
					<td align="center"><c:out value="${result.FEE_SUMMARY}"/></td>
					<td align="center">
						<c:forEach items="${check_array}" var="r" varStatus="s">
						<c:if test="${s.index > 0 }"><br></c:if>
						 <span><c:out value="${fn:substring(r,0,2)}"/> : <c:out value="${fn:substring(r,2,4)}"/> 
						~ <c:out value="${fn:substring(r,4,6)}"/> : <c:out value="${fn:substring(r,6,8)}"/></span>
						</c:forEach> 
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${result.SIGN_YN eq 'Y'}">
								확정
							</c:when>
							<c:otherwise>  
								신청						
							</c:otherwise>
						</c:choose>	
					</td>
					<td><fmt:formatNumber value="${result.HOUR_PRC}" type="number" groupingUsed="true" /></td>
				</tr>
				</c:forEach>
				
				<tr>
					<td colspan="6" align="center"><strong>부가업무료 합계</strong></td>
					<td><fmt:formatNumber value="${priceData.SUM_ETC}" type="number" groupingUsed="true" /></td>
				</tr>
				
			</c:when>
			<c:otherwise>   
			<tr>
				<td colspan="7" align="center">등록된 정보가 없습니다.</td>
			</tr>
			</c:otherwise>
		</c:choose>	
	</table>	
			
			
			
<p style="margin-top: 30px;">
	<h2>OJT 내역</h2>
</p>			
				
	<table border="1">
		<colgroup>
			<col width="120" />
			<col width="70" />
			<col width="120" />
			<col width="" />
			<col width="150" />
			<col width="120" />
			<col width="120" />
		</colgroup>
			<tr>
				<th>업무일자</th>
				<th>요일</th>
				<th>근무구분</th>
				<th>업무명</th>
				<th>업무시간</th>
				<th>진행상태</th>
				<th>부가업무료</th>
			</tr>
		
		<c:choose>
			<c:when test="${not empty ojtListData}">
				<c:set var="checks" value="00000000"/>
				<c:forEach items="${ojtListData}" var="result" varStatus="stat">
					<c:set var="checks" value="${result.WORK_TIME}"/> 
					<c:set var="check_array" value="${fn:split(checks,';')}"/> 
				<tr>
					<td align="center"><fmt:formatDate value="${result.FEE_DATE}" pattern="yyyy-MM-dd" /></td>
					<td align="center"><c:out value="${result.WEEK}"/></td>
					<td align="center"><c:out value="${result.MT_WORK_TYPE_NM}"/></td>
					<td align="center"><c:out value="${result.FEE_SUMMARY}"/></td>
					<td align="center">
						<c:forEach items="${check_array}" var="r" varStatus="s">
						<c:if test="${s.index > 0 }"><br></c:if>
						 <span><c:out value="${fn:substring(r,0,2)}"/> : <c:out value="${fn:substring(r,2,4)}"/> 
						~ <c:out value="${fn:substring(r,4,6)}"/> : <c:out value="${fn:substring(r,6,8)}"/></span>
						</c:forEach> 
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${result.SIGN_YN eq 'Y'}">
								확정
							</c:when>
							<c:otherwise>  
								신청						
							</c:otherwise>
						</c:choose>	
					</td>
					<td align="center"><fmt:formatNumber value="${result.HOUR_PRC}" type="number" groupingUsed="true" /></td>
				</tr>
				</c:forEach>
				
				<tr>
					<td colspan="6" align="center"><strong>부가업무료 합계</strong></td>
					<td><fmt:formatNumber value="${priceData.SUM_OJT}" type="number" groupingUsed="true" /></td>
				</tr>
			
			</c:when>
			<c:otherwise>   
			<tr>
				<td colspan="7" align="center">등록된 정보가 없습니다.</td>
			</tr>
			</c:otherwise>
		</c:choose>	
	</table>			
	
<p style="margin-top: 30px;">
	<h2>강의료 내역</h2>
</p>					
				
				
	<table border="1">
		<colgroup>
			<col width="200" />
			<col width="100" />
			<col width="120" />
			<col width="" />
			<col width="200" />
			<col width="150" />
			<col width="150" />
		</colgroup>
			<tr>
				<th>강의일자</th>
				<th>요일</th>
				<th>근무구분</th>
				<th>업무명</th>
				<th>강의시간</th>
				<th>진행상태</th>
				<th>강의료</th>
			</tr>
		
		<c:choose>
			<c:when test="${not empty lectListData}">
			<c:set var="checks" value="00000000"/>
				<c:forEach items="${lectListData}" var="result" varStatus="stat">
					<c:set var="checks" value="${result.WORK_TIME}"/> 
					<c:set var="check_array" value="${fn:split(checks,';')}"/> 
				<tr>
					<td align="center"><fmt:formatDate value="${result.FEE_DATE}" pattern="yyyy-MM-dd" /></td>
					<td align="center"><c:out value="${result.WEEK}"/></td>
					<td align="center"><c:out value="${result.MT_WORK_TYPE_NM}"/></td>
					<td align="center"><c:out value="${result.MT_CGRP_NM}"/></td>
					
					<td align="center">
					<c:forEach items="${check_array}" var="r" varStatus="s">
					<c:if test="${s.index > 0 }"><br></c:if>
					 <span><c:out value="${fn:substring(r,0,2)}"/> : <c:out value="${fn:substring(r,2,4)}"/> 
					~ <c:out value="${fn:substring(r,4,6)}"/> : <c:out value="${fn:substring(r,6,8)}"/></span>
					</c:forEach> 
					</td>
					<td align="center">
						<c:choose>
							<c:when test="${result.SIGN_YN eq 'Y'}">
								확정
							</c:when>
							<c:otherwise>  
								신청						
							</c:otherwise>
						</c:choose>	
					</td>
					<td><fmt:formatNumber value="${result.HOUR_PRC}" type="number" groupingUsed="true" /></td>
				</tr>
				</c:forEach>
				
				<tr>
					<td  align="center" colspan="6"><strong>강의료 합계</strong></td>
					<td><fmt:formatNumber value="${priceData.SUM_LECT}" type="number" groupingUsed="true" /></td>
				</tr>
			
			</c:when>
			<c:otherwise>   
			<tr>
				<td colspan="7" align="center">등록된 정보가 없습니다.</td>
			</tr>
			</c:otherwise>
		</c:choose>	
	</table>		


<p style="margin-top: 30px;">
	<h2>총계 내역</h2>
</p>					
			
	<table border="1">
		<colgroup>
			<col width="200" />
			<col width="" />
			<col width="200" />
		</colgroup>
			<tr>
				<th>업무일자</th>
				<th colspan="6" align="right"><fmt:formatNumber value="${priceData.SUM_TOT}" type="number" groupingUsed="true" /></th>
			</tr>
			<tr>
				<td align="center" rowspan="2">공제내역</td>
				<td  colspan="5" align="left" width="900">법인예수제세 (총 금액의 3%, 원 단위이하절사)</td>
				<td  align="right"><fmt:formatNumber value="${priceData.GONGJE_PRICE}" type="number" groupingUsed="true" /></td>
			</tr>
			<tr>
				<td  colspan="5" align="left" >기타예수제세 (법인예수제세의 10%, 원 단위절사)</td>
				<td><fmt:formatNumber value="${priceData.ETC_PRICE}" type="number" groupingUsed="true" /></td>
			</tr>
			<tr>
				<td align="center" >실수령액</td>
				<td  colspan="6"><fmt:formatNumber value="${priceData.T_PRICE}" type="number" groupingUsed="true" /></td>
			</tr>
	</table>
			
				
</body>
</html>