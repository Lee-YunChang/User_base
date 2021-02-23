<%
/****************************************************
	system	: academy > 나의강의실 > 강사게시판
	title	: 강사게시판 목록
	summary	:	
	wdate	: 2013-08-29
	writer	: kim min gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<% 
	request.setAttribute("frontMnuCode01", "lnb_myclass");
	request.setAttribute("frontMnuCode02", 0);
%>
	<!-- contents -->
	<div id="contents">
		<!-- left_menu -->
		<%-- <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb.jsp"%> --%>
		<!-- content_view -->
		<div class="cont_view">
			<!-- locaton-->
			<p class="loc" id="separate"><a href="<c:out value="${GODO_DOMAIN}"/>/main/main.do"><img src="/academy/images/ic_home.gif" alt="홈으로" /></a>&gt; 
			<a href="<c:out value="${ctx}"/>/academy/main/main.do">아카데미</a>&gt; <a href="<c:out value="${ctx}"/>/academy/myclass/myclass/list.do">나의 강의실</a>&gt; 
			<a href="<c:out value="${ctx}"/>/academy/myclass/tutor/class.do">Classdesk</a></p>
			<!-- con_title-->
			
			<form name="classForm" id="classForm" action="/classdesk/main/main.do" method="post">
				<input type="hidden" name="subcmd" id="subcmd"/>
				<input type="hidden" name="paramCourseNo" id="paramCourseNo"/>
				<input type="hidden" name="paramcSeqNo"	  id="paramcSeqNo"/>
			</form>
			
			<form name="courseForm" id="courseForm" action="/academy/myclass/tutor/class_form_pop.do" method="post">
				<input type="hidden" name="subcmd" id="subcmd"/>
				<input type="hidden" name="cseqno" id="cseqno"/>
			</form>
			
			<div class="img_tit ad">
				<p class="c_tit">나의 강의실</p>
			
			</div>
			<div class="ad_l_tit">과정차수목록<!-- <span>현재까지 고객님이 환불신청하신 내역입니다.</span> --></div>
		
			
			
			<form name="frm" id="frm" action="<c:out value="${ctx}"/>/academy/myclass/tutor/class.do"  method="post">
				<input type="hidden" name="cPage" id="cPage"/>
			
			
				<div class="ad_table" style="margin-top:35px;">
				<table class="ad_table_row ad_table_blue">
					<colgroup>
						<col width="120" />
						<col width="380" />
						<col width="120" />
						<col width="380" />
					</colgroup>
					<tbody>
						<tr>
							<th>강의형태</th>
							<td>
								<div class="ad_select ad_w100">
									<label for="ad_select_year" class="ad_label"></label>
									<select name="selectCtype" id="selectCtype" class="ad_tb_select">
										<option value="">전체</option>
										<ext:option items="${ctypeCodeData}" selected="${REQUEST_DATA.selectCtype}" />
									</select>
								</div>
								
							
								
							</td>
							<th>과정분류</th>
							<td>
								
								<div class="ad_select ad_w100">
									<label for="ad_select_month" class="ad_label"></label>
									<select name="selectCgrp" id="selectCgrp" class="ad_tb_select">
										<option value="">전체</option>
										<ext:option items="${cgrpCodeData}" selected="${REQUEST_DATA.selectCgrp}" />
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<th>교육기간</th>
							<td>
								
								<div class="ad_datepicker">
									<label for="ad_date1" class="ad_label">시작일</label>
									<input type="text" value="<c:out value="${REQUEST_DATA.searchSdate }"/>"  id="searchSdate" name="searchSdate" class="ad_calendar ad_input" style="width:55%;" readonly="readonly" title="시작일"/>
								</div>
								~
								<div class="ad_datepicker">
									<label for="ad_date2" class="ad_label">종료일</label>
									<input type="text" value="<c:out value="${REQUEST_DATA.searchEdate }"/>" id="searchEdate" name="searchEdate" class="ad_calendar ad_input" style="width:55%;" readonly="readonly" title="종료일"/>
								</div>
							
								
							</td>
							<th>과정분류</th>
							<td>
								<label for="ad_search_txt" class="ad_label"></label>
								<input type="text" name="searchWord" id="searchWord" class="ad_input" style="width:250px;" value="<c:out value="${REQUEST_DATA.searchWord}"/>" title="과정분류"/>
								<input type="image" src="/academy/images/academy/btn_s_search.png" class="ad_input_image" alt="검색" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="ad_table" style="margin-top:35px;">
			
				<table class="ad_table_col ad_table_blue">
					<colgroup>
						<col width="50" />
						<col width="120" />
						<col width="150" />
						<col width="" />
						<col width="170" />
						<col width="70" />
						<col width="70" />
					</colgroup>
					<thead>
						<tr>
							<th class="ad_cell_first">No</th>
							<th>강의형태</th>
							<th>강의분류</th>
							<th>과정명</th>
							<th>교육일자</th>
							<th>수강인원</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					
					<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
							<tr>
								<td class="ad_cell_first"><c:out value="${result.NUM}"/></td>
								<td><c:out value="${result.MT_CTYPE_NM}"/></td>
								<td><c:out value="${result.MT_CGRP_NM}"/></td>
								
								
								<td class="ad_left"><a href="#" onclick="fnUpdatePop('<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>');"><c:out value="${result.SEQ_TITLE}"/></a></td>
								<td class="ad_cell_date"><fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${result.STUDY_EDATE}" pattern="yyyy-MM-dd" /></td>
								<td>
								<c:out value="${result.USER_CNT}"/> 명
								</td>
								<td>
								<a href="#none" onclick="fnClassdeskPop('<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>');"><img src="/academy/images/academy/btn_s_classroom.png" alt="강의실" /></a>
								</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>   
						<tr>
							<td colspan="7" align="center" class="ad_cell_first">등록된 정보가 없습니다.</td>
						</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				</div>
				</form>
				<c:if test="${not empty listData}">
				
				<div class="ad_paging_wrap" style="margin-top:20px;">
					<paging:page cpage="${REQUEST_DATA.cPage}" total="${listData[0].TOTALCNT}" pageSize="10" link="javascript:move_page"/>
				</div>
				</c:if>
			</div>
		</div>
			
	
	<!-- footer -->

	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	
	<script type="text/javascript">
		$(function($) {
			
		});	
		//클래스데스크 이동
		function fnClassdeskPop(courseno, cseqno){
			$('#paramCourseNo').val(courseno);
			$('#paramcSeqNo').val(cseqno);
 			$('#classForm > input[name='subcmd']').val('main');    

			var w1 = parseInt(document.body.scrollWidth);
			var h1 = parseInt(document.body.scrollHeight);
			
			SANGS.Util.openPopupSubmit($('#classForm'), 'classdesk_pop', 'width='+w1+', height='+h1+', top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		}
		
		
		function move_page(cPage){
			$('#cPage').val(cPage);
			$('form[name=frm]').submit();
		}
		
		function fnUpdatePop(courseno, cseqno){
			
			$('#courseForm > input[name='courseno']').val(courseno);    
 			$('#courseForm > input[name='cseqno']').val(cseqno);    
 			$('#courseForm > input[name='subcmd']').val('class_form_pop');    
			 
			var w1 ='1000';
			var h1 = '500';
			
			SANGS.Util.openPopupSubmit($('#courseForm'), 'classdesk_pop', 'width='+w1+', height='+h1+', top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		
		}
	function fnUpdatePop(courseno, cseqno){
			
			$('#courseForm > input[name='courseno']').val(courseno);    
 			$('#courseForm > input[name='cseqno']').val(cseqno);    
 			$('#courseForm > input[name='subcmd']').val('class_form_pop');    
			 
			var w1 ='1000';
			var h1 = '500';
			
			SANGS.Util.openPopupSubmit($('#courseForm'), 'classdesk_pop', 'width='+w1+', height='+h1+', top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		
		}
		
		function fnRelaod(){
			
		}
	</script>