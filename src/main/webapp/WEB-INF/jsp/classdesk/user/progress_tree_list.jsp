<%
/* *******************************************
    system  : 나의강의실 > 온라인학습 
    title   : 메인
    summary :	
    wdate   : 2016-09-01
    writer  : SANGS
******************************************* */
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<c:set var="topMenuCode" value="study"/>

<script type="text/javascript">

	var studytime = '${progData.STUDYTIME}';
	
	function pad(nVal) {
		var tmp = ""+nVal;
		if (tmp.length < 2) {
			return "0"+tmp;
		} else {
			return tmp;
		}
	}
	
	function getToday() {
		var dt = new Date();
		var yyyy = ""+dt.getFullYear();
		var mm = pad(dt.getMonth()+1);
		var dt = pad(dt.getDate());
		
		return yyyy + "-" + mm + "-" + dt;
	}

	$(document).ready(function(){
		//간이메뉴 클릭시 원 헤더 복원
		//헤더열기	
		$('.menu_toggle').click(function(){
			//$('.menu_toggle').css('display', 'none');
			if($('#pmode').val() == 'E'){
				$('.menu_toggle_close').slideDown(500);
			}
		});
		//헤더 닫기
		$('.menu_toggle_close').click(function(){
			if($('#pmode').val() == 'E'){
				$('.menu_toggle_close').slideUp(500);
			}
			//$('.menu_toggle').css('display', 'block');
		});
		
		// 1일 학습량 초과시 학습제한
		if (studytime && Number(studytime) > 0) {
			var cnt = 0;
			var today = getToday();
			$('.edate').each(function(){
				if (today == $(this).text().split(' ')[0]) {
					cnt++;
				}
			});
			
			if (cnt >= Number(studytime)) {
			
				$('.edate').each(function(){
					if (today != $(this).text().split(' ')[0]) {
						var $obj = $(this).closest('div').find('.study');
						$obj.attr('onclick','');
						$obj.click(function(){alert('1일 학습량은 '+studytime+'차시 입니다.')});
					}
				}); 
				
				//$('.study').attr('onclick','');
				//$('.study').click(function(){alert('1일 학습량은 '+studytime+'차시 입니다.')});
			}
		}

	});
	
	function fnPageMove(url){
		$("#frm").attr("action", url);
		$("#frm").submit();
	}
</script>
<div class="container" id="Subcontent">
	<article class="subArea">
        <div class="subCntWrap">
			
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>내강의실</li>
                <li class="active">온라인학습</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
				<section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">온라인학습 <span class="ico_sec syber"><c:out value="${REQUEST_DATA.ctypeName}"/></span> <span class="po_C7 fnt12"><c:out value="${REQUEST_DATA.seqTitle}"/></span></h2>
            		</div>           	
	            </section>
           
			<form name="frm" id="frm" action="" method="post"> 
			<input type="hidden" name="pmode" id="pmode" value="L"/>
			<input type="hidden" name="bcateno" id="bcateno" value="<%=SangsProperties.getProperty("Globals.bbsBcateClassData")%>"/>
			<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
			<input type="hidden" name="cuserNo" id="cuserNo" value="${REQUEST_DATA.SES_CUSERNO}">	
			<input type="hidden" name="courseno" id="courseno" value="${REQUEST_DATA.SES_COURSENO}">
			<input type="hidden" name="cseqno" id="cseqno" value="${REQUEST_DATA.SES_CSEQNO}">
			<input type="hidden" name="seqTitle" id="seqTitle" value="${REQUEST_DATA.seqTitle}"/>
			<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
			
			<div class="contents" id="sContents">
			
			 <section>
                 <div class="infoBox">
                     <div class="infoBody">
                         <p class="mrg_b10">- 과정학습에 필요한 학습자료는 자료실에서 다운로드 받으시길 바랍니다.</p>
                         <a href="#" onclick="fnPageMove('/classdesk/bbs/list.do?select=list2');" class="btn btn-sm btn-default">자료실 바로가기 <span class="icon arr_rig"></span></a>
                     </div>
                 </div>
             </section>
			
			
			
			
			
			
			<section>
				<c:set var="CURSTUDY" value="0"/>
				<c:set var="progFrameYn">N</c:set>
						<c:choose>
						<c:when test="${rowData.OPENTYPE ne 'A'}">
						
							<!-- 기간제 과정 학습 목차 -->
							<c:choose>
							<c:when test="${not empty listData}">
								<div class="crdBoard ">
									<c:set var="lastRow" value="0"/>
									<c:forEach items="${listData}" var="result" varStatus="stat">
										<c:if test="${stat.index == 0 || stat.index % 3 == 0}">
											<c:if test="${stat.index % 3 == 0}">
												<c:set var="lastRow" value="${lastRow+1 }" />
											</c:if>
											<div class="row">
										</c:if>
                                       <div class="col-md-4 col-sm-4 col-xs-12">
                                            <div class="crdBox">
                                                <div class="boxInner">
                                                	<dl>
                                                        <dt class="dt_tit"><span class="po_C6 bold fnt19">[<c:out value="${stat.index + 1}" />차시] <c:out value="${result.SUBJECT}" /></span></dt>
                                                        <dd class="dd_study">
                                                            <ul>
                                                                <li class="li_dot2"><span class="ellipsis"><strong class="po_C7">마지막 학습일자</strong> : 
	                                                                <c:out value="${result.EDATE}" /><c:if test="${fn:length(result.EDATE) == 0}">-</c:if></span>
	                                                                <c:if test="${result.FRAMECNT eq result.FRAMESEQ}">
																		<c:set var="progFrameYn">Y</c:set>
																	</c:if>
																	<span id="prog_<c:out value="${stat.index + 1}"/>" style="display:none"><c:out value="${progFrameYn}"/></span>
																	<c:set var="progFrameYn">N</c:set>
                                                                
                                                                </li>
                                                                
                                                                <li class="li_dot2">
                                                                	<span class="ellipsis">
                                                                		<c:choose>
                                                                			<c:when test="${result.FRAMECNT > 1}">
                                                                				<strong class="po_C7">학습한 페이지수</strong> : <c:out value="${result.FRAMESEQ}" /><span>&#47;</span><c:out value="${result.FRAMECNT}"/> (<c:out value="${result.PROGRESS_VAL}" default="0"/>%)	
                                                                			</c:when>
                                                                			<c:otherwise>
                                                                				<strong class="po_C7">학습한 시간</strong> : <c:out value="${result.STUDYTIME_MM}" />분 <c:out value="${result.STUDYTIME_HH}" />초<span>&#47;</span><c:out value="${result.RUNTIME}"/>분 (<c:out value="${result.VIDEO_PERCENT}" default="0"/>%)
                                                                			</c:otherwise>
                                                                		</c:choose>
                                                                		
                                                                	</span>
                                                                </li>
                                                            </ul>
                                                        </dd>
                                                    </dl>
                                                    
                                                 
                                                  
                                                  
                                                    <div class="btnAreaC">
                                                    	<c:choose>
															<c:when test="${rowData.EDUSEQ_YN eq 'Y'}">  
															<!-- 순차학습 버튼 제어 -->
																<c:choose>
																
																	<%-- <c:when test="${result.FRAMECNT == result.FRAMESEQ}"> --%> 
																	<c:when test="${result.MT_PROG_STATUS_CODE eq 'PS0003'}">
																		<a href="#none" class="btn btn-lg btn-blue" onclick="fnOnlineStudy('Y', '<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />', '<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
																	</c:when> 
																	
																	<c:when test="${(CURSTUDY == 0 &&    (result.FRAMECNT > result.FRAMESEQ  || result.FRAMESEQ == 0 )) }">
																		<a href="#none" class="btn btn-lg btn-drkblue" onclick="fnOnlineStudy('N','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a>
																		<c:set var="CURSTUDY" value="1"/>
																	</c:when> 
																	<c:otherwise></c:otherwise>
																</c:choose>
															</c:when>  
															<c:otherwise> 
															<!-- 비순차학습 -->
																<c:choose>
																	<%-- <c:when test="${result.FRAMECNT == result.FRAMESEQ}"> --%> 
																	<c:when test="${result.MT_PROG_STATUS_CODE eq 'PS0003'}"> 
																		<a href="#none" class="btn btn-lg btn-blue" onclick="fnOnlineStudy('Y','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
																	</c:when>
																	<c:otherwise>
																		<a href="#none" class="btn btn-lg btn-drkblue" onclick="fnOnlineStudy('N','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a>
																	</c:otherwise>
																</c:choose>
															</c:otherwise>
														</c:choose>
														<!-- 학습버튼 제어 끝 -->
                                                    
                                                    </div><!-- .btnAreaC -->
                                                    
                                                    
                                                    
                                                    
                                                </div><!-- .boxInner -->
	                                          </div><!-- .crdBox -->
                                            </div><!-- .col-md-6 col-sm-6 col-xs-12 -->
                                      <c:if test="${stat.index > 0 && stat.index % (3*lastRow) == 0}">	
                                        </div><!-- .row -->
                                      </c:if>          
									</c:forEach>
									
								</div><!-- .crdBoard -->
							</c:when>
							<c:otherwise>
							<br>
							<table class="boardList">
								<tr>
									<td class="text-center">
									<strong class="fnt16 po_C7">등록된 정보가 없습니다.</strong>
									</td>
								</tr>
							</table>
							</c:otherwise>
							</c:choose><!-- 기간제 과정 학습 목차 끝-->		
						</c:when>
					
						<c:otherwise>
						<!-- 상시과정 학습 목차 -->
						<c:choose>
							<c:when test="${not empty listData}">
								<div class="crdBoard ">
								<c:set var="lastRow" value="0"/>
								<c:forEach items="${listData}" var="result" varStatus="stat">
									<c:if test="${stat.index == 0 || stat.index % 3 == 0}">
										<c:if test="${stat.index % 3 == 0}">
											<c:set var="lastRow" value="${lastRow+1 }" />
										</c:if>
										<div class="row">
									</c:if>
									<div class="col-md-4 col-sm-4 col-xs-12">
	                                	<div class="crdBox">
	                                    	<div class="boxInner">
	                                               	<dl>
														<dt class="dt_tit"><span class="po_C6 bold fnt19">[<c:out value="${stat.index + 1}" />차시]</span><c:out value="${result.SUBJECT}" /></dt>
	                                                       <dd class="dd_study">
	                                                           <ul>
	                                                               <li class="li_dot2"><span class="ellipsis"><strong class="po_C7">마지막 학습일자</strong> : 
		                                                               <c:out value="${result.EDATE}" /><c:if test="${fn:length(result.EDATE) == 0}">-</c:if></span>
		                                                               <c:if test="${result.FRAMECNT eq result.FRAMESEQ}">
																			<c:set var="progFrameYn">Y</c:set>
																		</c:if>
																		<span id="prog_<c:out value="${stat.index + 1}"/>" style="display:none"><c:out value="${progFrameYn}"/></span>
																		<c:set var="progFrameYn">N</c:set>
	                                                               
	                                                               </li>
	                                                               
	                                                               <li class="li_dot2">
                                                                	<span class="ellipsis">
                                                                		<c:choose>
                                                                			<c:when test="${result.FRAMECNT > 1}">
                                                                				<strong class="po_C7">학습한 페이지수</strong> : <c:out value="${result.FRAMESEQ}" /><span>&#47;</span><c:out value="${result.FRAMECNT}"/> (<c:out value="${result.PROGRESS_VAL}" default="0"/>%)	
                                                                			</c:when>
                                                                			<c:otherwise>
                                                                				<strong class="po_C7">학습한 시간</strong> : <c:out value="${result.STUDYTIME_MM}" />분 <c:out value="${result.STUDYTIME_SS}" />초<span>&#47;</span><c:out value="${result.RUNTIME}"/>분 (<c:out value="${result.VIDEO_PERCENT}" default="0"/>%)
                                                                			</c:otherwise>
                                                                		</c:choose>
                                                                	</span>
                                                                </li>
	                                                             
	                                                           </ul>
	                                                       </dd>
	                                                   </dl>
													   <div class="btnAreaC">
													   
	                                                   	<c:choose>
															<c:when test="${rowData.EDUSEQ_YN eq 'Y'}">  
															<!-- 순차학습 버튼 제어 -->
																<c:choose>
																	<%-- <c:when test="${result.FRAMECNT == result.FRAMESEQ}"> --%> 
																	<c:when test="${result.MT_PROG_STATUS_CODE eq 'PS0003'}"> 
																		<a href="#none" class="btn btn-lg btn-blue" onclick="fnOnlineStudy('Y','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />', '<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
																	</c:when> 
																	
																	<c:when test="${(CURSTUDY == 0 &&    (result.FRAMECNT > result.FRAMESEQ  || result.FRAMESEQ == 0 )) }">
																		<a href="#none" class="btn btn-lg btn-drkblue" onclick="fnOnlineStudy('N','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a>
																		<c:set var="CURSTUDY" value="1"/>
																	</c:when> 
																	<c:otherwise></c:otherwise>
																</c:choose>
															</c:when>  
															<c:otherwise> 
															<!-- 비순차학습 -->
																<c:choose>
																	<%-- <c:when test="${result.FRAMECNT == result.FRAMESEQ}"> --%> 
																	<c:when test="${result.MT_PROG_STATUS_CODE eq 'PS0003'}">
																		<a href="#none" class="btn btn-lg btn-blue" onclick="fnOnlineStudy('Y','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
																	</c:when>
																	<c:otherwise>
																		<a href="#none" class="btn btn-lg btn-drkblue" onclick="fnOnlineStudy('N','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a>
																	</c:otherwise>
																</c:choose>
															</c:otherwise>
														</c:choose>
														<!-- 학습버튼 제어 끝 -->
														
														
														
														
														
													   </div><!-- .btnAreaC -->
	                                    	</div><!-- .boxInner -->
	                                	</div><!-- .crdBox -->
									</div><!-- .col-md-6 col-sm-6 col-xs-12 -->
	                                     <c:if test="${stat.index > 0 && stat.index % (3*lastRow) == 0}">	
	                                       </div><!-- .row -->
	                                     </c:if>          
									</c:forEach>
									
								</div><!-- .crdBoard -->
							</c:when>
							<c:otherwise>
							<br>
							<table class="boardList">
								<tr>
									<td class="text-center">
									<strong class="fnt16 po_C7">등록된 정보가 없습니다.</strong>
									</td>
								</tr>
							</table>
							</c:otherwise>
						
						</c:choose><!-- 상시과정 학습 목차 끝-->
						
						</c:otherwise>
					</c:choose> 
											
			</section>
			
			</form>
			
			<form id="popFrm" name="popFrm" method="POST" action="<c:out value="${ctx}"/>/classdesk/online/progExec.do">
				<input type="hidden" name="cuserNo" id="cuserNo" value="${REQUEST_DATA.SES_CUSERNO}">	
				<input type="hidden" name="treeno" id="treeno" value="">
				<input type="hidden" name="courseno" id="courseno" value="${REQUEST_DATA.SES_COURSENO}">
				<input type="hidden" name="cseqno" id="cseqno" value="${REQUEST_DATA.SES_CSEQNO}">
				<input type="hidden" name="frameseq" id="frameseq" value="">
				<input type="hidden" name="studytime" id="studytime" value="">
				<input type="hidden" name="val" id="val" value="">
				<input type="hidden" name="sdate" id="sdate" value="">
				<input type="hidden" name="edate" id="edate" value="">
				<input type="hidden" name="studycnt" id="studycnt" value="">
				<input type="hidden" name="movsec" id="movsec" value="">
				<input type="hidden" name="compDate" id="compDate" value="">
				<input type="hidden" name="lastFrameseq" id="lastFrameseq" value="">
				<input type="hidden" name="frameCompStatus" id="frameCompStatus" value="">
				<input type="hidden" name="oldFrameCompStatus" id="oldFrameCompStatus" value="">
				<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK}">
				<input type="hidden" name="progExecYn" id="progExecYn" value="${progExecYn}"/>
				<input type="hidden" name="seqTitle" id="seqTitle" value=""/>
				<input type="hidden" name="isPass" id="isPass" value="">
				
			</form>
				
			<form id="reFrm" name="reFrm" method="post" action="<c:out value="${ctx}"/>/classdesk/user/progress/treeList.do">
				<input type="hidden" name="subcmd" id = "subcmd" value="" /> 
			</form> 

			</div><!-- //contents-->

		</div><!-- //sub-contents -->
	</article>
</div>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>

<script type="text/javascript"> 
	
	var w1 = parseInt(document.body.scrollWidth);
	var h1 = parseInt(document.body.scrollHeight);
	
	var pop = null;
	
	
	// 학습창 로딩(팝업)
	function fnOnlineStudy(ispass, movsec, avgFramseq, tno, cWidth, cHeight, cflag){
		$.ajax({
			url : "/classdesk/user/exam/leExamBeAfterCheck.do",
            data : { cseqno :'<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>'},
            dataType : "json",
            type : 'post',
            success : function(data) {
            	
            	if(data.beCheckCnt < 1){
        			alert('사전시험에 참여 후 학습 가능합니다.');
        			$("#frm").attr("action", "/classdesk/user/exam/list.do");
        			$("#frm").submit();
        		}
            	else {
            		
            		// 학습 참여 시작 -------------->
            		
            		var paramCourseNo = $("#paramCourseNo").val();

            		if(paramCourseNo == 50 || paramCourseNo == 49 || paramCourseNo == 51 ) { //신규컨텐츠(장애인차별예방교육,세계선언)이고 모바일 접속일 경우 수강 불가
            			
            			if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
            				alert('해당 컨텐츠는 PC로 학습하여 주세요.');
            				return false;
            			}  
            			
            		}
            		
            		var w1 = parseInt(document.body.scrollWidth);
            		var h1 = parseInt(document.body.scrollHeight);
            		
            		
            	/* 	console.log(movsec);
            		console.log("avgFramseq==>" + avgFramseq)
            		
            		
            		if( movsec >= 100 || avgFramseq >= 100) {
            			ispass = 'Y';
            		} */
            		
            	    var courseno =	'<c:out value="${REQUEST_DATA.SES_COURSENO}"/>';
            	    var cseqno = 	'<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>';
            		var cuserNo =	'<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>';
            		var treeno =	tno;
            		var url = 		'<c:out value="${ctx}"/>/classdesk/online/prog.do?courseno='+courseno+'&cseqno='+cseqno+'&cuserNo='+cuserNo+'&treeno='+treeno+'&ispass='+ispass; 
            		var eduseqYn =	'<c:out value="${rowData.EDUSEQ_YN}"/>';
            		if(cflag > 0 && eduseqYn == 'Y') {
            			// 복습이 아니고 && 순차학습일때
            			if(cflag > 1) {
            				// 1차시 이후 학습하기 버튼을 클릭했을때
            				var progYn = $('#prog_'+(cflag-1)).text();
            				if(progYn != 'Y') {
            					// 이전 회차 학습이 완료되지 않았을 경우
            					alert('이전 회차 학습을 완료해야만 학습이 가능 합니다.');
            					return;
            				}
            			}
            		}
            		
            		
            		//컨텐츠로 전환
            		//if($('#pmode').val() == 'L') {
            		
            		if(!pop || pop.closed){
            			$('#eduList').css('display','none');
            			$('#eduPlay').css('display','block');
            			$('#pmode').val('E');
            			$('#eduPlayFrame').attr('src',url);
            			$('#eduPlayFrame').css('width', cWidth+'px');
            			$('#eduPlayFrame').css('height', cHeight+'px');
            			$('body').addClass('contentsBody');
            			
            			//기존 메뉴숨김, 컨텐츠용 간이메뉴버튼 보이기
            			//$('#gnb').css('display', 'none');
            			//$('.menu_toggle').css('display', 'block');
            			//$('.menu_toggle_close').css('display', 'none');
            			
            			pop = window.open(url,"progress_popup", "width=1100,  height=800, resizable=yes, scrollbars=yes");
                       
            		}
            	}
            	
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
		});
	}
	
	
	// 복습하기 - 학습창 로딩(팝업)
	function fnOnlineReStudy(movsec, avgFramseq, tno,cWidth, cHeight, cflag){

		var w1 = parseInt(document.body.scrollWidth);
		var h1 = parseInt(document.body.scrollHeight);
		var ispass= "N";
		if( movsec >= 100 || avgFramseq >= 100) {
			ispass = 'Y';
		}
		
		var msg = "학습기간이 종료되어 진도처리가 되지 않습니다.\n진도처리를 원하실 경우 관리자에게 학습기간 연장을 요청해주세요.";
		if(confirm(msg)) {
		
		    var courseno =	'<c:out value="${REQUEST_DATA.SES_COURSENO}"/>';
		    var cseqno = 	'<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>';
			var cuserNo =	'<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>';
			var treeno =	tno;
			var url = 		'<c:out value="${ctx}"/>/classdesk/online/prog.do?courseno='+courseno+'&cseqno='+cseqno+'&cuserNo='+cuserNo+'&treeno='+treeno+'&ispass='+ispass; 
			var eduseqYn =	'<c:out value="${rowData.EDUSEQ_YN}"/>';
			
			if(cflag > 0 && eduseqYn == 'Y') { // 복습이 아니고 && 순차학습일때
				if(cflag > 1) {
					// 1차시 이후 학습하기 버튼을 클릭했을때
					var progYn = $('#prog_'+(cflag-1)).text();
					if(progYn != 'Y') {
						// 이전 회차 학습이 완료되지 않았을 경우
						alert('이전 회차 학습을 완료해야만 학습이 가능 합니다.');
						return;
					}
				}
			}
			//컨텐츠로 전환
			if($('#pmode').val() == 'L') {				 
				$('#eduList').css('display','none');
				$('#eduPlay').css('display','block');
				$('#pmode').val('E');
				$('#eduPlayFrame').attr('src',url);
				$('#eduPlayFrame').css('width', cWidth+'px');
				$('#eduPlayFrame').css('height', cHeight+'px');
				$('body').addClass('contentsBody');
				
				//기존 메뉴숨김, 컨텐츠용 간이메뉴버튼 보이기
				//$('#gnb').css('display', 'none');
				//$('.menu_toggle').css('display', 'block');
				//$('.menu_toggle_close').css('display', 'none');
				//alert('마지막까지 학습 완료해야 진도처리됩니다.');
				
			}
		}
			
	}
	
	function fnList(){
        location.reload();
	}

	function progExec(frameseq,treeno,lastFrameseq,studytime,movsec,frame_comp_status,old_frame_comp_status,seqTitle,isPass) {
	
		/* alert('progExec');
		alert("frameseq :" + frameseq);
		alert("treeno :" + treeno);
		alert("lastFrameseq :" + lastFrameseq);
		alert("studytime :" + studytime);
		alert("movsec :" + movsec);
		alert("frame_comp_status :" + frame_comp_status);
		alert("old_frame_comp_status :" + old_frame_comp_status);
		alert("seqTitle :" + seqTitle);
		alert("isPass :" + isPass); */
		
		if(frame_comp_status === undefined) return false;
		
	//	return false;
		
		var form = document.popFrm;
		
		form.isPass.value=isPass;
		form.frameseq.value=frameseq;
		form.treeno.value=treeno;
		form.lastFrameseq.value=lastFrameseq;
		form.studytime.value=studytime;
		form.movsec.value=movsec;
		form.frameCompStatus.value = frame_comp_status;
		form.oldFrameCompStatus.value = old_frame_comp_status;
		form.seqTitle.value=seqTitle;
		//$("#popFrm").attr("action", "/classdesk/online/progExec.do");
		//$("#popFrm").submit();
		
		
		 $.ajax({
	            url : "/classdesk/online/progExec.do",
	            data : $('#popFrm').serialize(),
	            dataType : "json",
	            type : 'post',
	            success : function(res) { 
	            	//alert('진도');
	            	$('#frm').attr("action", "/classdesk/user/progress/treeList.do").submit();
	            },
	            error : function(e) {
	                alert("학습창 진도체크중에 오류가 발생하였습니다.");
	                console.log(e.responseText);
	            }
	      });
		 
	}
</script>