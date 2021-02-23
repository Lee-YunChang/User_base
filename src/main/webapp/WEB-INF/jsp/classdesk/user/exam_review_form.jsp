<%
/****************************************
	system	: ClassDesk > 사용자 > 시험
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
<script type="text/javascript">

	$(function(){
		//alert("${fn:length(ListDataB)}");
		//alert("${listData}");
	});

	function fnList() { 
   	    /* $('#subcmd').val('list');
   		$('form[name=ansFrm]').attr('target', '_self').attr('action', '/classdesk/user/exam/list.do').submit(); */
   		history.go(-1);
		//$('form[name=ansFrm]').attr('action', '/classdesk/main/main.do').submit();
   	} 


</script>			
<div class="container" id="Subcontent">
	<article class="subArea">
        <div class="subCntWrap">
			
		<%-- <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%> --%>
		 <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
				<div class="path">
					<ul>
						<li><span class="home text-hide">홈</span></li>
						<li>내강의실</li>
						<li class="active">시험</li>
					</ul>
				</div>
				
				<div class="subConts" id="sub-content">
				<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit"> 시험 <span class="ico_sec syber">온라인교육</span> <span class="po_C7 fnt12"><c:out value="${REQUEST_DATA.ctypeName}" /> <c:out value="${REQUEST_DATA.seqTitle}" /></span></h2>
            		</div>           	
	            </section>
				

			<section>
				<form name="ansFrm" id="ansFrm" action="<c:out value="${ctx}"/>/classdesk/user/exam.do" method="post" >
					<input type="hidden" name="subcmd" id="subcmd">
					<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK}">
					<input type="hidden" name="openType" id="openType" value="${REQUEST_DATA.openType}">
					<input type="hidden" name="ctypeName" id="ctypeName" value="${REQUEST_DATA.ctypeName}">
					<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
				</form>
				<h3 class="bdrTit mrg_b30"><c:out value="${listData[0].TITLE}"/></h3>
				<c:set var="sum" value="0" /> <!-- 사전 점수 -->
				<c:set var="sum2" value="0" /> <!-- 사후 개수 -->
				<c:forEach items="${ListDataB}" var="result" varStatus="stat">
						<c:if test="${stat.first}">						
							<c:set var="sum" value="${result.VAL_CNT}" /> 
						</c:if>
						<c:if test="${stat.last}">						
							<c:set var="sum2" value="${result.VAL_CNT}" /> 
						</c:if>
				</c:forEach>
				
					<!-- <span class="red_b" id="monitor"></span> -->
					<c:forEach items="${listData}" var="result" varStatus="stat">
						<input type="hidden" name="qNo<c:out value="${stat.index}"/>" id="qNo<c:out value="${stat.index}"/>" value="<c:out value="${result.QNO}" />" />
						<input type="hidden" name="qSeq<c:out value="${stat.index}"/>" id="qSeq<c:out value="${stat.index}"/>" value="<c:out value="${result.QSEQ}" />" />
						<input type="hidden" name="qType<c:out value="${stat.index}"/>" id="qType<c:out value="${stat.index}"/>" value="<c:out value="${result.QTYPE}" />" />
						<c:if test="${result.QTYPE == 1}">
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold"><c:out value="${stat.count}"/></div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[O,X 퀴즈]</span> <c:out value="${result.QSUBJECT}"/>
										</p>
									</div>
									<c:choose>
										<c:when test="${result.ISRIGHT == 'Y'}">
											<div class="qresult bgright">
												<span class="sr-only">맞음</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="qresult bgwrong">
												<span class="sr-only">틀림</span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" disabled="disabled" id="choice_o${stat.count}" <c:if test="${result.ITEMSEQ eq '1'}"> checked="checked"</c:if> value="1" title="답변 o">
										<label for="choice_o${stat.count}">O</label></li>
										<li><input type="radio" disabled="disabled" id="choice_x${stat.count}" <c:if test="${result.ITEMSEQ eq '2'}"> checked="checked"</c:if> value="2" title="답변 x">
										<label for="choice_x${stat.count}">X</label></li>
									</ul>
								</div>
								<div class="rAnswer">
									<p class="bold fnt15 po_C7">
										<span class="po_C2 pad_r5">정답</span> <c:out value="${result.RCODE }"/>												</p>
								</div>
							</div>
						
							<hr/>
						</c:if>
						<c:if test="${result.QTYPE == 2}">
							
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold"><c:out value="${stat.count}"/></div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[객관식]</span> <c:out value="${result.QSUBJECT}"/>
										</p>
									</div>
									<c:choose>
										<c:when test="${result.ISRIGHT == 'Y'}">
											<div class="qresult bgright">
												<span class="sr-only">맞음</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="qresult bgwrong">
												<span class="sr-only">틀림</span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<c:if test="${not empty result.A01}">
											<li><input type="radio" disabled="disabled" id="result01<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '1'}"> checked="checked"</c:if> value="1">
											<label for="result01<c:out value="${stat.index}"/>"><c:out value="${result.A01}"/></label></li>
										</c:if>
										<c:if test="${not empty result.A02}">
											<li><input type="radio" disabled="disabled" id="result02<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '2'}"> checked="checked"</c:if> value="2">
											<label for="result02<c:out value="${stat.index}"/>"><c:out value="${result.A02}"/></label></li>
										</c:if>
										<c:if test="${not empty result.A03}">
											<li><input type="radio" disabled="disabled" id="result03<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '3'}"> checked="checked"</c:if> value="3">
											<label for="result03<c:out value="${stat.index}"/>"><c:out value="${result.A03}"/></label></li>
										</c:if>
										<c:if test="${not empty result.A04}">
											<li><input type="radio" disabled="disabled" id="result04<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '4'}"> checked="checked"</c:if> value="4">
											<label for="result04<c:out value="${stat.index}"/>"><c:out value="${result.A04}"/></label></li>
										</c:if>
										<c:if test="${not empty result.A05}">
											<li><input type="radio" disabled="disabled" id="result05<c:out value="${stat.index}"/>" <c:if test="${result.ITEMSEQ eq '5'}"> checked="checked"</c:if> value="5">
											<label for="result05<c:out value="${stat.index}"/>"><c:out value="${result.A05}"/></label></li>
										</c:if>
									</ul>
								</div>
								<div class="rAnswer">
									<p class="bold fnt15 po_C7">
										<span class="po_C2 pad_r5">정답</span> <c:out value="${result.RCODE }"/>												</p>
								</div>
							</div>
							
							<hr/>
						</c:if>
						<c:if test="${result.QTYPE == 4}">
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold"><c:out value="${stat.count}"/></div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[단답형]</span> <c:out value="${result.QSUBJECT}"/>
										</p>
									</div>
									<c:choose>
										<c:when test="${result.ISRIGHT == 'Y'}">
											<div class="qresult bgright">
												<span class="sr-only">맞음</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="qresult bgwrong">
												<span class="sr-only">틀림</span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="testA">
									<p class="p_answer"><c:out value="${result.ANSWER}"/></p>
								</div>
								<div class="rAnswer">
									<p class="bold fnt15 po_C7">
										<span class="po_C2 pad_r5">정답</span> <c:out value="${result.ANSWER }" escapeXml='false'/>
									</p>
								</div>
							</div>
							
							<hr/>
						</c:if>
						
						<!-- 주관식 서술형-->
						<c:if test="${result.QTYPE == 5  }">
							
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold"><c:out value="${stat.count}"/></div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[서술형]</span> <c:out value="${result.QSUBJECT}"/>
										</p>
									</div>
									<c:choose>
										<c:when test="${result.ISRIGHT == 'Y'}">
											<div class="qresult bgright">
												<span class="sr-only">맞음</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="qresult bgwrong">
												<span class="sr-only">틀림</span>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="testA">
									<p class="p_answer"><c:out value="${result.ANSWER}"/></p>
								</div>
								<div class="rAnswer">
									<p class="bold fnt15 po_C7">
										<span class="po_C2 pad_r5">해설</span> <c:out value="${result.SUMMARY }" escapeXml='false'/>
									</p>
								</div>
							</div>
							
							<hr/>
						</c:if>
					</c:forEach>
					<div class="bigRbar">
                   <%--  <p class="msg">총 <c:out value="${fn:length(listData)}" /> 문제 중 <span class="po_C10"></span>를 맞히셨습니다.</p> --%>
                    <p class="msg mrg_t5">사전시험 점수(<c:out value="${sum}" />개) 사후시험 점수(<c:out value="${sum2}" />개) <br> ‘<span class="po_C2">
                    					  <c:set var="total" value="0" /> 
                    					  <c:if test="${sum > sum2}">
                    					  	<c:set var="total" value="${sum - sum2}" /> 
                    					  	사전시험 보다 ${total}개 </span>’ 낮습니다.</p>
                    					  </c:if>
                    					  <c:if test="${sum < sum2}">
                    					  	<c:set var="total" value="${sum2 - sum}" /> 
                    					  	사전시험 보다 ${total}개 </span>’ 높습니다.</p>
                    					  </c:if>
                    					  <c:if test="${sum == sum2}">
                    					  	<c:set var="total" value="${sum}" /> 
                    					  	사전시험과 사후시험 결과가 </span>’ 같습니다.</p>
                    					  </c:if>
	                </div>
	
	                <hr>
					<div class="btnAreaC">
                        <button title="목록" type="button" name="button" onclick="fnList();return false" class="btn btn-lg btn-drkblue">목록</button>
                    </div>
			</section>

			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>