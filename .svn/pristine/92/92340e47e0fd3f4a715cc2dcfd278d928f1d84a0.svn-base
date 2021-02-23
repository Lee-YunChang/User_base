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
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="topMenuCode" value="test"/>

<div class="wrapper clearfix">
    <!-- 왼쪽 메뉴 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
	<!-- // 왼쪽 메뉴 영역 -->

	<!-- //개설과목명 -->
	<!-- 시험리스트 -->
	<div id="Right_Area">
		<h3 class="ico-table-blue">시험리스트</h3>
	</div>
	
	<form name="frm" action="">
		<input type="hidden" name="examNo" id="examNo" value="">	 
		<div id="Right_Area">
			<div class="table-header-left"></div>
			
			<!-- 기간제 운영일 경우 -->
			<c:choose>
				<c:when test="${rowData.OPENTYPE ne 'A' }">
				<table>
					<caption>시험 게시판</caption>
					<colgroup>
						<col width="5%" />
						<col width="5%" />
						<col width="*" />
						<col width="5%" />
						<col width="20%" />
						<col width="7%" />
						<col width="7%" />
						<col width="7%" />
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>구분</th>
							<th>시험</th>
							<th>배점</th>
							<th>응시기간</th>
							<th>응시인원</th> 
							<th>상태</th>
							<th>-</th>
						</tr>
					</thead>
					<tbody>
					
					<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
								<tr>
									<td><c:out value="${result.RNUM}"/></td>
									<td><c:out value="${result.EXAM_TYPE_NM}"/></td>
									<td class="left"><c:out value="${result.TITLE}"/></td>
									<td><c:out value="${result.EVAL}"/></td>
									<td>
										<c:out value="${result.SDATE}"  />   ~ <c:out value="${result.EDATE}"  />						
									</td>
									<!-- 기간운영일시 노출 -->
								
									<td><em class="red_b"><c:out value="${result.SCNT}"/></em>/<c:out value="${result.TOTCNT}"/></td>
									
									<c:choose>
										<c:when test="${result.OPENYN eq 'N'}">
										<td><em class="blue_b">작성중</em></td>
										<td>
												<a href="#none" class="btn-small-white"  onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'form'); return false;" ><span class="blue">등록</span></a>
										</td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${result.RESULTYN eq 'Y'}">
												<td><em class="green_b">채점완료</em></td>
												<td>
														<a href="#none"  onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'user_list'); return false;"  class="btn-small-white"><span class="green">결과</span></a>
												</td>
												</c:when>
												
												<c:otherwise>
													<c:choose>
	  													<c:when test="${result.ENDYN eq 'Y'}">
															<td><em class="red_b">시험종료</em></td>
														</c:when>
														<c:otherwise>
															<td>
																	<c:choose>
																		<c:when test="${result.SAVEYN eq 'Y'}"><em class="green_b">진행중</em></c:when>
																		<c:otherwise>시험대기</c:otherwise>
																	</c:choose>
															</td>
															
															
														</c:otherwise>
													</c:choose>
													
													<td>
														<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'form'); return false;" class="btn-small-white"><span class="green">수정</span></a>
														<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'user_list'); return false;" class="btn-small-white"><span class="red">채점</span></a>
													</td>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
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
			</c:when>
			
		
			<c:otherwise>
				<!-- 상시운영 관련 시험 목록 -->
					<table id="itemList">
					<caption>시험 게시판</caption>
					<colgroup>
						<col width="5%" />
						<col width="5%" />
						<col width="*" />
						<col width="5%" />
						<col width="20%" />
						<col width="7%" />
						<col width="7%" />
						<col width="7%" />
					</colgroup>
					<thead>
						<tr>
							<th>No.</th>
							<th>구분</th>
							<th>시험</th>
							<th>배점</th>
							<th>응시조건</th>
							<th>응시인원</th> 
							<th>-</th>
							<th>사용여부</th>
						</tr>
					</thead>
					<tbody>
					
					<c:choose>
						<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
								<tr>
									<td><c:out value="${result.RNUM}"/></td>
									<td><c:out value="${result.EXAM_TYPE_NM}"/></td>
									<td class="left"><c:out value="${result.TITLE}"/></td>
									<td><c:out value="${result.EVAL}"/></td>
									<td>
										<!-- 상시일 경우 -->
										<c:choose>
											<c:when test="${rowData.OPENTYPE eq 'A' }">
												진도율 <c:out value="${rowData.EXAM_PROG_PERCENT}"/>% 이상 충족시(복습기간 제외)
											</c:when>
											<c:otherwise>
												<c:out value="${result.SDATE}"  />   ~ <c:out value="${result.EDATE}"  />
											</c:otherwise>
										</c:choose>									
									</td>
									<!-- 기간운영일시 노출 -->
								
									<td><em class="red_b"><c:out value="${result.SCNT}"/></em>/<c:out value="${result.TOTCNT}"/></td>
									
									<c:choose>
										<c:when test="${result.OPENYN eq 'N'}">
										<td>
												<a href="#none" class="btn-small-white"  onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'form'); return false;" ><span class="blue">등록</span></a>
										</td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${result.RESULTYN eq 'Y'}">
												<td>
														<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'form'); return false;" class="btn-small-white"><span class="green">수정</span></a>
														<a href="#none"  onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'user_list'); return false;"  class="btn-small-white"><span class="green">결과</span></a>
												</td>
												</c:when>
												
												<c:otherwise> 
													<td>
														<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'form'); return false;" class="btn-small-white"><span class="green">수정</span></a>
														<a href="#none" onclick="fnForm('<c:out value="${result.EXAMNO}"/>', 'user_list'); return false;" class="btn-small-white"><span class="red">채점</span></a>
													</td>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
									
									<td> 
											<c:if test="${result.OPENYN eq 'Y'}"> 
											<input type = "radio" name= "useCheck" id="useCheck" value="<c:out value="${result.USEYN}" default="N"/>"<c:if test="${result.USEYN eq 'Y'}" >checked="checked"  </c:if>   />
											</c:if>
 											<input type = "hidden" name= "useYn" id="useYn" value="<c:out value="${result.USEYN}" default="N"/>" />
											<input type = "hidden" name= "useExamNo" id="useExamNo" value="<c:out value="${result.EXAMNO}"/>" />
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
			</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>	
	<!-- //시험리스트 -->
	<!-- 게시판 버튼영역 -->
	<div id="Right_Area">
		<div class="btn-table">
			<a href="#none" onclick="fnCreate(); return false;" class="btn-large-blue"><span>시험등록</span></a>
		</div>
	</div>
	<!-- //게시판 버튼영역 -->
	
	
	<script type="text/javascript">
	
		function fnForm(examNo, cmd){  
			$('#examNo').val(examNo);
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/' + cmd + '.do').submit();
		}
		
		function fnCreate(){
			<c:if test="${fn:length(listData) > 4}">
				alert('시험은 최대 5건 까지\n등록할 수 있습니다.');
				return false;
			</c:if> 
			 
			$('#examNo').val('');
			$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/form.do').submit();
		}
		
		$(function($) {
			$('input[name=useCheck]:radio').click(function(e){
				
				$sthis = $(this).parent().find('input[name=useYn]');
				
				$sthis.val('Y');
				
				$('input[name*=useYn]').not($sthis).val('N');
				
				fnUsseExec();
				
			});
		});
		/**************************************************
		 함수명 : fnList
		 설 명 : 페이징 이동 함수
		***************************************************/ 
		function fnList() {
			$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/list.do').submit();
		}
		
		function fnUsseExec() {
			var answer = confirm ('해당 시험을 사용 하시겠습니까?');
			if(answer){ 
				$('form[name=frm]').attr('target', '_cm').attr('action', '<c:out value="${ctx}"/>/classdesk/tutor/exam/use_exec.do').submit();
			} 
		}  
	
	</script>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
