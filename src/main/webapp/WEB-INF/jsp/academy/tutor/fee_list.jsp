<%
/****************************************
	subject	: 나의 강의실 > 강사료 목록
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.sangs.util.StringUtil"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<%
	String lectCode = SangsProperties.getProperty("Globals.mtCode_MT_FEE_TYPE_CODE_LECT");
	String etcCode = SangsProperties.getProperty("Globals.mtCode_MT_FEE_TYPE_CODE_ETC");
	String ojtCode = SangsProperties.getProperty("Globals.mtCode_MT_FEE_TYPE_CODE_OJT");

%>
<c:set var="LECTCODE" value="<%=StringUtil.getContent(lectCode)%>"/>
<c:set var="ETCCODE" value="<%=StringUtil.getContent(etcCode)%>"/>
<c:set var="OJTCODE" value="<%=StringUtil.getContent(ojtCode)%>"/>


<fmt:formatDate value="${now}" pattern="yyyy" var="year" />
<fmt:formatDate value="${now}" pattern="MM" var="month" />
	
	<!-- contents -->
	<div id="contents">
		<!-- left_menu -->
		<%-- <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb.jsp"%> --%>
		<div class="cont_view">
			<!-- locaton-->
			<p class="loc" id="separate"><a href="<c:out value="${GODO_DOMAIN}"/>/main.do"><img src="/academy/images/ic_home.gif" alt="홈으로" /></a>&gt; 
			<a href="<c:out value="${ctx}"/>/academy/main/main.do">아카데미</a>&gt; <a href="<c:out value="${ctx}"/>/academy/myclass/myclass/list.do">나의 강의실</a>&gt; 
			 <a href="<c:out value="${ctx}"/>/academy/myclass/tutorfee/list.do">강사료 관리</a></p>
			<!-- con_title-->
			<div class="img_tit ad">
				<p class="c_tit">나의 강의실</p>
			</div>
			
			<!--게시판 타이틀-->
			<div class="board_title">
				<p class="b_tit"><img src="/academy/images/academy/cnt_ad_t6.png" alt="강사료 관리" /></p>
			</div>
			
			<!-- 검색 -->
			<form id="frm" name="frm">
			<div class="ad_table" style="margin-top:35px;">
				<table class="ad_table_row ad_table_blue">
					<colgroup>
						<col width="120" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th>검색</th>
							<td>
								<div class="ad_select ad_w100">
									<label for="ad_select_year" class="ad_label">연도</label>
									<select name="searchYear" id="searchYear" class="ad_tb_select">
									
									<c:forEach begin="0" end="10" var="x" varStatus="stat" >
										<option value="<c:out value="${2013+x}"/>" <c:if test="${REQUEST_DATA.searchYear eq  2013+x }">selected="selected"</c:if> ><c:out value="${2013+x}"/></option>
									</c:forEach>
									</select>
								</div>
								
								
								<div class="ad_select ad_w100">
									<label for="ad_select_month" class="ad_label">월</label>
									<select name="searchMonth" id="searchMonth" class="ad_tb_select">
										<c:forEach begin="1" end="12" var="x" varStatus="stat" >
										<option value="<c:out value="${x}"/>"  <c:if test="${REQUEST_DATA.searchMonth eq x}">selected="selected"</c:if>><c:out value="${x}"/>월</option>
										</c:forEach>
									</select>
								</div>
								<input type="image" src="/academy/images/academy/btn_s_search.png" class="ad_input_image" alt="검색" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		<div class="ad_table_btm_wrap ad_clearfix">
				<div class="ad_table_btm_btn">
					<a href="#none" onclick="fnExcelDown(); return false;"><img src="/academy/images/academy/btn_m_excelDown.png" alt="엑셀다운" /></a>
				</div>
			</div>
			<!-- //검색 -->
			
			<!-- 부가업무료내역 -->
			
				<input type="hidden" name="subcmd" id="subcmd" value="list"/>
				<input type="hidden" name="mtFeeTypeCode" id="mtFeeTypeCode"/>
			
			<div class="ad_table" style="margin-top:30px;">
			
				<!-- 내용 타이틀 -->
				<div class="ad_l_tit">부가업무료 내역</div>
				<!-- //내용 타이틀 -->
				
				<!-- 컬럼이 가로로 구분되는 테이블의 경우 class="ad_table_col" 추가 / 세로로 구분되는 테이블의 경우 class="ad_table_row" 추가 -->
				<!-- 테이블의 색상은 ad_table_blue / ad_table_purple 2종류 -->
				
				<table class="ad_table_col ad_table_blue">
					<colgroup>
						<col width="120" />
						<col width="70" />
						<col width="120" />
						<col width="" />
						<col width="150" />
						<col width="120" />
						<col width="120" />
					</colgroup>
					<thead>
						<tr>
							<th class="ad_cell_first">업무일자</th>
							<th>요일</th>
							<th>근무구분</th>
							<th>업무명</th>
							<th>업무시간</th>
							<th>진행상태</th>
							<th>부가업무료</th>
						</tr>
					</thead>
					<tbody>
					
					
					<c:choose>
						<c:when test="${not empty etcListData}">
							<c:set var="checks" value="00000000"/>
							<c:forEach items="${etcListData}" var="result" varStatus="stat">
								<c:set var="checks" value="${result.WORK_TIME}"/> 
								<c:set var="check_array" value="${fn:split(checks,';')}"/> 
							<tr>
								<td class="ad_cell_first"><fmt:formatDate value="${result.FEE_DATE}" pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${result.WEEK}"/></td>
								<td><c:out value="${result.MT_WORK_TYPE_NM}"/></td>
								<td><c:out value="${result.FEE_SUMMARY}"/></td>
								<td>
									<c:forEach items="${check_array}" var="r" varStatus="s">
									<c:if test="${s.index > 0 }"><br></c:if>
									 <span><c:out value="${fn:substring(r,0,2)}"/> : <c:out value="${fn:substring(r,2,4)}"/> 
									~ <c:out value="${fn:substring(r,4,6)}"/> : <c:out value="${fn:substring(r,6,8)}"/></span>
									</c:forEach> 
								</td>
								<td>
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
								<td class="ad_cell_first" colspan="6"><strong>부가업무료 합계</strong></td>
								<td><fmt:formatNumber value="${priceData.SUM_ETC}" type="number" groupingUsed="true" /></td>
							</tr>
						
						</c:when>
						<c:otherwise>   
						<tr>
							<td colspan="6" align="center">등록된 정보가 없습니다.</td>
						</tr>
						</c:otherwise>
					</c:choose>	
					</tbody>
				</table>
			</div>
			
			<!-- 9월 3일자 수정 ad_table_btm_wrap 추가 -->
			<div class="ad_table_btm_wrap ad_clearfix">
				<div class="ad_table_btm_btn">
					<a href="#none" onclick="fnForm('<c:out value="${ETCCODE}"/>'); return false;"><img src="/academy/images/academy/btn_m_regist.png" alt="등록" /></a>
				</div>
			</div>

			<div class="ad_table" style="margin-top:30px;">
			
				<!-- 내용 타이틀 -->
				<div class="ad_l_tit">OJT 내역</div>
				<!-- //내용 타이틀 -->
				
				<!-- 컬럼이 가로로 구분되는 테이블의 경우 class="ad_table_col" 추가 / 세로로 구분되는 테이블의 경우 class="ad_table_row" 추가 -->
				<!-- 테이블의 색상은 ad_table_blue / ad_table_purple 2종류 -->
				
				<table class="ad_table_col ad_table_blue">
					<colgroup>
						<col width="120" />
						<col width="70" />
						<col width="120" />
						<col width="" />
						<col width="150" />
						<col width="120" />
						<col width="120" />
					</colgroup>
					<thead>
						<tr>
							<th class="ad_cell_first">업무일자</th>
							<th>요일</th>
							<th>근무구분</th>
							<th>업무명</th>
							<th>업무시간</th>
							<th>진행상태</th>
							<th>부가업무료</th>
						</tr>
					</thead>
					<tbody>
					
					
					<c:choose>
						<c:when test="${not empty ojtListData}">
							<c:set var="checks" value="00000000"/>
							<c:forEach items="${ojtListData}" var="result" varStatus="stat">
								<c:set var="checks" value="${result.WORK_TIME}"/> 
								<c:set var="check_array" value="${fn:split(checks,';')}"/> 
							<tr>
								<td class="ad_cell_first"><fmt:formatDate value="${result.FEE_DATE}" pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${result.WEEK}"/></td>
								<td><c:out value="${result.MT_WORK_TYPE_NM}"/></td>
								<td><c:out value="${result.FEE_SUMMARY}"/></td>
								<td>
									<c:forEach items="${check_array}" var="r" varStatus="s">
									<c:if test="${s.index > 0 }"><br></c:if>
									 <span><c:out value="${fn:substring(r,0,2)}"/> : <c:out value="${fn:substring(r,2,4)}"/> 
									~ <c:out value="${fn:substring(r,4,6)}"/> : <c:out value="${fn:substring(r,6,8)}"/></span>
									</c:forEach> 
								</td>
								<td>
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
								<td class="ad_cell_first" colspan="6"><strong>부가업무료 합계</strong></td>
								<td><fmt:formatNumber value="${priceData.SUM_OJT}" type="number" groupingUsed="true" /></td>
							</tr>
						
						</c:when>
						<c:otherwise>   
						<tr>
							<td colspan="6" align="center">등록된 정보가 없습니다.</td>
						</tr>
						</c:otherwise>
					</c:choose>	
					</tbody>
				</table>
			</div>
			
			<!-- 9월 3일자 수정 ad_table_btm_wrap 추가 -->
			<div class="ad_table_btm_wrap ad_clearfix">
				<div class="ad_table_btm_btn">
					<a href="#none" onclick="fnForm('<c:out value="${OJTCODE}"/>'); return false;"><img src="/academy/images/academy/btn_m_regist.png" alt="등록" /></a>
				</div>
			</div>
			
			
			<!-- //부가업무료내역 -->
			
			<!-- 강의료내역 -->
			<!-- 일반과정 -->
			<div class="ad_table" style="margin-top:30px;">
			
				<!-- 내용 타이틀 -->
				<div class="ad_l_tit">강의료 내역</div>
				<!-- //내용 타이틀 -->
				
				<!-- 컬럼이 가로로 구분되는 테이블의 경우 class="ad_table_col" 추가 / 세로로 구분되는 테이블의 경우 class="ad_table_row" 추가 -->
				<!-- 테이블의 색상은 ad_table_blue / ad_table_purple 2종류 -->
				
				<table class="ad_table_col ad_table_blue">
					<colgroup>
						<col width="120" />
						<col width="70" />
						<col width="120" />
						<col width="" />
						<col width="150" />
						<col width="120" />
						<col width="120" />
					</colgroup>
					<thead>
						<tr>
							<th class="ad_cell_first">강의일자</th>
							<th>요일</th>
							<th>근무구분</th>
							<th>업무명</th>
							<th>강의시간</th>
							<th>진행상태</th>
							<th>강의료</th>
						</tr>
					</thead>
					
					<c:choose>
						<c:when test="${not empty lectListData}">
						<c:set var="checks" value="00000000"/>
							<c:forEach items="${lectListData}" var="result" varStatus="stat">
								<c:set var="checks" value="${result.WORK_TIME}"/> 
								<c:set var="check_array" value="${fn:split(checks,';')}"/> 
							<tr>
								<td class="ad_cell_first"><fmt:formatDate value="${result.FEE_DATE}" pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${result.WEEK}"/></td>
								<td><c:out value="${result.MT_WORK_TYPE_NM}"/></td>
								<td><c:out value="${result.MT_CGRP_NM}"/></td>
								
								<td>
								<c:forEach items="${check_array}" var="r" varStatus="s">
								<c:if test="${s.index > 0 }"><br></c:if>
								 <span><c:out value="${fn:substring(r,0,2)}"/> : <c:out value="${fn:substring(r,2,4)}"/> 
								~ <c:out value="${fn:substring(r,4,6)}"/> : <c:out value="${fn:substring(r,6,8)}"/></span>
								</c:forEach> 
								</td>
								<td>
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
								<td class="ad_cell_first" colspan="6"><strong>강의료 합계</strong></td>
								<td><fmt:formatNumber value="${priceData.SUM_LECT}" type="number" groupingUsed="true" /></td>
							</tr>
						
						</c:when>
						<c:otherwise>   
						<tr>
							<td colspan="6" align="center">등록된 정보가 없습니다.</td>
						</tr>
						</c:otherwise>
					</c:choose>	
				</table>
			</div>

			

			<!-- 9월 3일자 수정 ad_table_btm_wrap 추가 -->
			<div class="ad_table_btm_wrap ad_clearfix">
				<div class="ad_table_btm_btn">
					<a href="#none" onclick="fnForm('<c:out value="${LECTCODE}"/>'); return false;"><img src="/academy/images/academy/btn_m_regist.png" alt="등록" /></a>
				</div>
			</div>
			<!-- //강의료내역 -->
			
			<!-- 총계 내역 -->
			<!-- 일반과정 -->
			<div class="ad_table" style="margin-top:30px;">
			
				<!-- 내용 타이틀 -->
				<div class="ad_l_tit">총계 내역</div>
				<!-- //내용 타이틀 -->
				
				<!-- 컬럼이 가로로 구분되는 테이블의 경우 class="ad_table_col" 추가 / 세로로 구분되는 테이블의 경우 class="ad_table_row" 추가 -->
				<!-- 테이블의 색상은 ad_table_blue / ad_table_purple 2종류 -->
				
				<table class="ad_table_col ad_table_blue">
					<colgroup>
						<col width="150" />
						<col width="" />
						<col width="200" />
					</colgroup>
					<thead>
						<tr>
							<th class="ad_cell_first">업무일자</th>
							<th colspan="2" class="ad_right"><fmt:formatNumber value="${priceData.SUM_TOT}" type="number" groupingUsed="true" /></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="ad_cell_first" rowspan="2">공제내역</td>
							<td class="ad_left">법인예수제세 (총 금액의 3%, 원 단위이하절사)</td>
							<td class="ad_right"><fmt:formatNumber value="${priceData.GONGJE_PRICE}" type="number" groupingUsed="true" /></td>
						</tr>
						<tr>
							<td class="ad_left">기타예수제세 (법인예수제세의 10%, 원 단위절사)</td>
							<td class="ad_right"><fmt:formatNumber value="${priceData.ETC_PRICE}" type="number" groupingUsed="true" /></td>
						</tr>
						<tr>
							<td class="ad_cell_first">실수령액</td>
							<td colspan="2" class="ad_right"><fmt:formatNumber value="${priceData.T_PRICE}" type="number" groupingUsed="true" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
			<!-- //총계 내역 -->
		</div>
	</div>
	
	<!-- footer -->

	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	
	<script type="text/javascript">
		$(function($) {
			
		});	
		
		
		function fnExcelDown(){
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/tutorfee/list_excel.do').attr('target', '_self').submit();
		}
		
		
		function fnList(){
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/tutorfee/list.do').attr('target', '_self').submit();		
		}
		
		
		
		function fnForm(mtFeetCode){
			$('#mtFeeTypeCode').val(mtFeetCode);
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/tutorfee/form.do').attr('target', '_self');	
			
			SANGS.Util.openPopupSubmit($('#frm'), 'tutor_fee_pop', 'width=800, height=400, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		}
		
	</script>