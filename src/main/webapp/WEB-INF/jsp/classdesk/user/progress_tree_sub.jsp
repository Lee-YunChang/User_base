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
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_online_inc.jsp"%>
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

	// 강의실로 돌아가기
	function fnOnlineMain(url){
		$("#leftMenuFrm").attr("action", url);
		$("#leftMenuFrm").submit();
	}
</script>
	
<div class="contents-wrap">

	<div class="sub-wrap" style="padding:0px">
			
		<!-- 왼쪽 메뉴 영역 -->
		<div class="sub-gnb" id="sub-gnb">
		    <h2 class="sub-c7">학습하기</h2><!-- 서브 메뉴1부터 sub-c1 ~ sub-c6-->
		    
		    <form name="leftMenuFrm" id="leftMenuFrm" action="" method="post">
		    	<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
		    	<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>"/>
		    	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>"/>
		    	<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="<c:out value="${REQUEST_DATA.paramcUserNo}"/>"/>
		    	<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
		    	<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
		    </form>
		    
		    <ul>
		    	<li class="lnb_myCourse"><a href="#none" onclick="fnOnlineMain('/classdesk/user/progress/treeMain.do'); return false;" title="강의실로 돌아가기">강의실로 돌아가기</a></li>
		    </ul>
		</div>

		<div class="sub-contents">

			<div class="sub-tit">
				<h3>학습하기</h3>
				<p class="ellipsis">
					<span class="new_tit-bd"><span class="new_tit bg4">온라인교육</span></span>
					<c:out value="${REQUEST_DATA.seqTitle}"/> 
				</p>
			</div>

			<form name="frm" id="frm" action="" method="post"> 
			<input type="hidden" name="pmode" id="pmode" value="L"/>
			<input type="hidden" name="bcateno" id="bcateno" value="<%=SangsProperties.getProperty("Globals.bbsBcateClassData")%>"/>
			<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
			</br><p style="color: red;font-weight: bold;">* 교육 기간이 아닐 경우 진도체크가 되지 않습니다.</p>
			<div class="contents" id="sContents">
					<ul class="edu-list">
						<c:set var="CURSTUDY" value="0"/>
						<c:set var="progFrameYn">N</c:set>
						<c:choose>
						<c:when test="${rowData.OPENTYPE ne 'A'}">
							<!-- 기간제 과정 학습 목차 -->
							<c:choose>
							<c:when test="${not empty listData}">
								<c:forEach items="${listData}" var="result" varStatus="stat">
									<li>
										<div class="edu-wrap">
											<dl>
												<dt><span class="bold txt_green">[<c:out value="${stat.index + 1}" />차시]</span><c:out value="${result.SUBJECT}" /></dt>
												<dd class="height118">
													<dl class="dl-list bg1">
														<dt>마지막 학습일자</dt>
														<dd class="edate"><c:out value="${result.EDATE}" /><c:if test="${fn:length(result.EDATE) == 0}">-</c:if></dd>
														<c:if test="${result.FRAMECNT eq result.FRAMESEQ}">
															<c:set var="progFrameYn">Y</c:set>
														</c:if>
														<span id="prog_<c:out value="${stat.index + 1}"/>" style="display:none"><c:out value="${progFrameYn}"/></span>
														<c:set var="progFrameYn">N</c:set>
													</dl>
													<dl class="dl-list bg2">
														<dt>학습한 페이지수</dt>
														<dd class="bold txt_blue"><c:out value="${result.FRAMESEQ}" /><span>&#47;</span><c:out value="${result.FRAMECNT}"/> (<c:out value="${result.PROGRESS_VAL}" default="0"/>%)</dd>
													</dl>
												</dd>
											</dl>
											<!-- 학습버튼 제어 시작 -->
											<c:choose>
												<c:when test="${rowData.EDUSEQ_YN eq 'Y'}">  
												<!-- 순차학습 버튼 제어 -->
													<c:choose>
														<c:when test="${result.FRAMECNT == result.FRAMESEQ}"> 
															<a href="#none" class="btn-m green abs" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />', '<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
														</c:when> 
														
														<c:when test="${(CURSTUDY == 0 &&    (result.FRAMECNT > result.FRAMESEQ  || result.FRAMESEQ == 0 )) }">
															<a href="#none" class="btn-m blue abs study" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a>
															<c:set var="CURSTUDY" value="1"/>
														</c:when> 
														<c:otherwise></c:otherwise>
													</c:choose>
												</c:when>  
												<c:otherwise> 
												<!-- 비순차학습 -->
													<c:choose>
														<c:when test="${result.FRAMECNT == result.FRAMESEQ}"> 
															<a href="#none" class="btn-m green abs" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
														</c:when>
														<c:otherwise>
															<a href="#none" class="btn-m blue abs study" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a>
															
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
											<!-- 학습버튼 제어 끝 -->
										</div>
									</li>
								</c:forEach>
							</c:when>
							<c:otherwise><li>등록된 정보가 없습니다.</li></c:otherwise>
						</c:choose><!-- 기간제 과정 학습 목차 끝-->		
					</c:when>
					
					<c:otherwise>
						<!-- 상시과정 학습 목차 -->
						<c:choose>
							<c:when test="${not empty listData}">
								<c:forEach items="${listData}" var="result" varStatus="stat">
								<li>
									<div class="edu-wrap">
										<dl>
											<dt><span class="bold txt_green">[<c:out value="${stat.index + 1}" />차시]</span><c:out value="${result.SUBJECT}" /></dt>
											<dd class="height118">
												<dl class="dl-list bg1">
													<dt>마지막 학습일자</dt>
													<dd class="edate"><c:out value="${result.EDATE}" /><c:if test="${fn:length(result.EDATE) == 0}">-</c:if></dd>
													<c:if test="${result.FRAMECNT eq result.FRAMESEQ}">
														<c:set var="progFrameYn">Y</c:set>
													</c:if>
													<span id="prog_<c:out value="${stat.index + 1}"/>" style="display:none"><c:out value="${progFrameYn}"/></span>
													<c:set var="progFrameYn">N</c:set>
												</dl>
												<dl class="dl-list bg2">
													<dt>학습한 페이지수</dt>
													<dd class="bold txt_blue"><c:out value="${result.FRAMESEQ}" /><span>&#47;</span><c:out value="${result.FRAMECNT}"/> (<c:out value="${result.PROGRESS_VAL}" default="0"/>%)</dd>
												</dl>
											</dd>
										</dl>
										<!-- 학습버튼 제어 시작 -->
										<c:choose>
											<c:when test="${rowData.RE_STUDY_YN ne 'Y'}">
											<!-- 학습기간일때. -->
												<c:choose>
													<c:when test="${rowData.EDUSEQ_YN eq 'Y'}">  
													<!-- 순차학습 버튼 제어 -->
														<c:choose>
																<c:when test="${result.FRAMECNT == result.FRAMESEQ}"> 
																	<a href="#none" class="btn-m green abs" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
																</c:when> 
																
																<c:when test="${CURSTUDY == 0 && (result.FRAMECNT > result.FRAMESEQ  || result.FRAMESEQ == 0)}">
																	<a href="#none" class="btn-m blue abs study" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a>
																	<c:set var="CURSTUDY" value="0"/>
																	</c:when>
																<c:otherwise></c:otherwise>
														</c:choose>
													</c:when>  
														<c:otherwise> <!-- 비순차학습 -->
														<c:choose>
																<c:when test="${result.FRAMECNT == result.FRAMESEQ}"> 
																	<a href="#none" class="btn-m green abs" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
																</c:when> 
																
																<c:when test="${CURSTUDY == 0 && (result.FRAMECNT > result.FRAMESEQ  || result.FRAMESEQ == 0 )}">
																	<a href="#none" class="btn-m blue abs study" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a>
																	<c:set var="CURSTUDY" value="0"/>
																	</c:when> 
																<c:otherwise></c:otherwise>
														</c:choose>
														</c:otherwise>
												</c:choose> 
											</c:when>
											<c:when test="${rowData.RE_STUDY_YN eq 'Y' && rowData.ISPASS eq 'Y'}">
												<a href="#none" class="btn-m green abs" onclick="fnOnlineStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
											</c:when>
											<c:when test="${rowData.RE_STUDY_YN eq 'Y' && (rowData.ISPASS eq '' || rowData.ISPASS ne 'Y')}">
												<a href="#none" class="btn-m blue abs" onclick="fnOnlineReStudy('<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
											</c:when>
										</c:choose>
											
									</div>
								</li>
								</c:forEach>
							</c:when>
							<c:otherwise><li>등록된 정보가 없습니다.</li></c:otherwise>
						</c:choose><!-- 상시과정 학습 목차 끝-->
					</c:otherwise>
					</c:choose>				
					</ul>

					<p class="ac"><a href="#none" class="more-w" title="더보기">더보기</a></p>

					<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>

				</div>
				<!-- //contents-->
				
				<!-- <div id="eduPlay" style="display:none;" >
					<iframe name="eduPlayFrame" id="eduPlayFrame" src="" style="z-index:-99;" title="eduPlay" allowfullscreen></iframe>
				</div> -->
			
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

</div><!-- //sub-wrap -->

<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_online_inc.jsp" %>

<script type="text/javascript"> 
	
	var w1 = parseInt(document.body.scrollWidth);
	var h1 = parseInt(document.body.scrollHeight);
	
	// 학습창 로딩(팝업)
	function fnOnlineStudy(movsec, avgFramseq, tno, cWidth, cHeight, cflag){
		var paramCourseNo = $("#paramCourseNo").val();

		if(paramCourseNo == 50 || paramCourseNo == 49 || paramCourseNo == 51 ) { //신규컨텐츠(장애인차별예방교육,세계선언)이고 모바일 접속일 경우 수강 불가
			
			if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
				alert('해당 컨텐츠는 PC로 학습하여 주세요.');
				return false;
			}  
			
		}
		
		var w1 = parseInt(document.body.scrollWidth);
		var h1 = parseInt(document.body.scrollHeight);
		
		var ispass= "N";
		if( movsec >= 100 || avgFramseq >= 100) {
			ispass = 'Y';
		}
		
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
			
			window.open(url,"progress_popup", "width=1100,  height=800, resizable=yes, scrollbars=yes");
           
		}
	}
	
	// 재학습 - 학습창 로딩(팝업)
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
		$("#popFrm").attr("action", "/classdesk/online/progExec.do");
		$("#popFrm").submit();
		
	}
</script>
<!-- 분리 -->