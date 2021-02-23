<%
/* *******************************************
    system  : 나의강의실 > 강의실 홈
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
<c:set var="topMenuCode" value="main"/>
<script  type="text/javascript"> 
$(document).ready(function(e){
	
	var d = new Date();
	var sysdate = d.getFullYear() +'-'+ Number(d.getMonth()+1)+'-'+d.getDate();
    $(".edate").each(function(i, val) { 
    	var edate = new Date($(this).val());
    	if(d > edate) {
    		$(this).parents(".btnAreaC").find("a").attr('class','btn btn-sm btn-gray join');
    		$(this).parents(".btnAreaC").find("a").text('기간종료');
    	}
	});
	
	var checkArr = new Array;
	var histDataArr = new Array;
	var cnt = 0; 
	
	$(".join").each(function(i, val) {
		var check = $(this).attr('check');
		checkArr.push(check);
	});
	
	for(var i = 0 ; i < $("#histDataCheck").val() ; i++) {
		//console.log($("#histData"+i).val());
		histDataArr.push($("#histData"+i).val());
	}
	
	for(var i = 0 ; i < checkArr.length ; i++) {
		//console.log("참여완료최초진입 길이="+checkArr.length);
		for(var j = 0 ; j < histDataArr.length ; j++){
			//console.log("0부터 길이 까지");
			if(checkArr[i] == histDataArr[j]){
				//console.log("일치값 확인");
				$("#"+ histDataArr[j]).attr('class','btn btn-drkblue btn-sm join');
				$("#"+ histDataArr[j]).text('참여완료');
			}
		}
	}
	
});





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










function fnApply(pollcseqno,cnt,edate,sdate){
	
	for(var i = 0 ; i < $("#histDataCheck").val() ; i++) {
		if(pollcseqno == $("#histData"+i).val()){
			alert('이미 참여하셨습니다');
			return false;
		}
	}
	
	var d = new Date();
	var day = d.getDate().toString();
	if(day.length < 2){
		day = '0'+day;
	}
	
   	var now = new Date(); 
   	var todayAtMidn = new Date(now.getFullYear(), now.getMonth(), now.getDate());

   	var edate = new Date(edate);
   	var sdate = new Date(sdate);
   	
   	todayAtMidn.setHours(0,0,0,0);
   	edate.setHours(0,0,0,0);
   	sdate.setHours(0,0,0,0);

   	if (todayAtMidn.getTime() > edate.getTime() || todayAtMidn.getTime() < sdate.getTime())
   	{
   		alert('설문 기간이 아닙니다.');
   		return false;
   	}
	var frm = document.frm;
	frm.pollcseqno.value=pollcseqno;
	frm.cnt.value=cnt;
	$("#frm").attr("action", "/classdesk/user/poll/view.do");
	frm.submit();  
}

// 시험

$(function(){
	$("#sum").on("click",function(){
		alert("시험을 보셨습니다");
	});
});



function fnForms(examNo, cmd, edate, examTime, pupType, examType) {

		$("#examEdate").val(edate);
		$("#examTime").val(examTime);
		$("#pupType").val(pupType); // 출제방식 (순차, 랜덤)
		$("#examType").val(examType); // 시험유형 (사전, 사후)

	/* 	var progPercent = parseInt('<c:out value="${examRowData.EXAM_PROG_PERCENT}"/>'); */
		   var userPercent = parseInt('<c:out value="${examProgData}"/>'); 

		//alert('현재 학습 진도율은 ' +userPercent+ '% 입니다.');

		
		$.ajax({
					url : "/classdesk/user/exam/leExamBeAfterCheck.do",
					data : {
						cseqno : '<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>',
						examType : examType,
						examNo : examNo
					},
					dataType : "json",
					type : 'post',
					success : function(data) {
						// 시험 결과보기
						if (cmd == 'review_form') {
							$('#examNo').val(examNo);
							$('form[name=frm]').attr('action',
									'/classdesk/user/exam/' + cmd + '.do')
									.submit();
						} else {
							// 사전시험
							if (examType == 'B') {

								if (data.beCheckCnt > 0) {
									alert('이미 사전시험에 참여하였습니다.');
									return;
								}

							} else if (examType == 'A') {
								// 사후시험
								if (data.beCheckCnt < 1) {
									alert('사전시험 참여 후, 사후시험 참여가 가능합니다.');
									return;
								}
								if (userPercent < 80) {
									alert('학습 진도율이 80% 이상일 때 사후시험 참여가 가능합니다.');
									return;
								}
							}

							$('#examNo').val(examNo);
							$('form[name=frm]').attr('action','/classdesk/user/exam/' + cmd + '.do').submit();
						}

					},
					error : function(e) {
						alert("error :" + e.responseText);
					}
				});
	}


</script>
<script type="text/javascript"> 

	function errimg(img){ 
		img.src='/classdesk/images/thumb_noimage.gif';
	}
	
	$(document).ready(function() {

			$('#schOnline').change(function() {
					$('#courseSelect').find('option').each(function() {
					$(this).remove();
					});

					$('#courseSelect').append('<option value="">선택</option>');

					var selectVal = $(this).val();
					if (selectVal != '') {
						var params = $('#frm').serialize();

					$.ajax({
						url : '/classdesk/main/mainSelect.do',
						type : "POST",
						data : params,
						dataType : "json",
						success : function(data) {
							for (var i = 0; i < data.result.length; i++) {
								$('#courseSelect').append("<option value='"+data.result[i].CUSERNO+","+ data.result[i].CSEQNO+","+ data.result[i].COURSENO+","+ data.result[i].CLASS_DESK+","+ data.result[i].SEQ_TITLE+","+data.result[i].MT_CTYPE_NAME + "'" + "</option>"+data.result[i].SEQ_TITLE);
								}
							}	
						});
					}
				})
		
	});
	
	
	function fnForm(bbsNo, cmd, select){
		
		if(select == 1){
			$("#select").val("list1");
		}else {
			$("#select").val("list2");
		}
		
		$('#bbsNo').val(bbsNo);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/classdesk/bbs/' + cmd + '.do').submit();
	}
	
	
	function selectTitle(selectTitle){
		
		var frm = document.frm;
		//frm.courseSelect.value = selectTitle.value;
		frm.submit();
	}
	
	//파일다운로드
	function filedown(fileId, bbsNo, fileSeq){
		
		
		var frm = document.frm;
		$("#fileId").val(fileId);
		$("#fileSeq").val(fileSeq);
		/* frm.fileId.value = fileId;
		frm.bbsNo.value = bbsNo;
		frm.fileSeq.value = fileSeq; */
		$('#frm').attr('action', '/classdesk/main/fileDown.do').submit(); 
	} 
	
	
	
	function moveEducationPop() {
		$('#frm').attr('action', '/classdesk/online/onlineEdu.do');
		$('#frm').attr('method', 'post');
		$('#frm').attr('target', 'onlineEdu');
		window.open("", "onlineEdu","width=1200,height=700");	
		$('#frm').submit();
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
                	<li class="active">강의실</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
            	 	<section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">강의실</h2>
            		</div>           	
	            </section>
            
			 <form name="frm" id="frm" action="/classdesk/main/main.do" method="post">
			 	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
				<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
				<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
				<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
				<input type="hidden" name="select" id="select" value=""/> 
				<input type="hidden" name="searchWord" id="searchWord" value=""/>
				<input type="hidden" name="CLASSDESK" id="CLASSDESK" 	value="${REQUEST_DATA.CLASSDESK }"/>
				<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
				<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
				<input type="hidden" id="fileId" name="fileId" value=""/>
				<input type="hidden" id="fileSeq" name="fileSeq" value=""/>
				
				 <!-- 설문 -->
				<input type="hidden" name="pollcseqno" id="pollcseqno" value=""/> 
				<input type="hidden" name="cnt" id="cnt" value=""/>
				<input type="hidden" id="histDataCheck" value="<c:out value="${pollHistData2}"/>"/>
				
				
				<!-- 시험 -->
				<input type="hidden" name="subcmd" id="subcmd" value=""> 
				<input type="hidden" name="examNo" id="examNo" value=""> 
				<input type="hidden" name="examEdate" id="examEdate" value=""> 
				<input type="hidden" name="examTime" id="examTime" value=""> 
				<input type="hidden" name="pupType" id="pupType" value=""> 
				<input type="hidden" name="examType" id="examType" value=""> 
				<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>" /> 
				<input type="hidden" name="ctypeName" id="ctypeName value="<c:out value="${REQUEST_DATA.ctypeName}"/>" /> 
				<input type="hidden" name="openType" id="openType" value="<c:out value="${examRowData.OPENTYPE}"/>" />
				
				
				<section>
                	<div class="searchWrap">
                        	<fieldset>
                            	<legend class="sr-only">검색 </legend>
                                  <div class="sel2Search">
                                  	<div class="form-inline">
                                    	<label for="schOnline" class="bold po_C9">강의선택</label>
                                    	<div class="form-group classec">
                                    		<select name="schOnline" id="schOnline"  class="form-control" title="강의선택">
												<option value="DAAA01" <c:if test="${rowData.MT_CTYPE_CODE == 'DAAA01'}">selected="selected"</c:if>>집합과정</option>	
												<option value="DAAA00" <c:if test="${rowData.MT_CTYPE_CODE == 'DAAA00'}">selected="selected"</c:if>>온라인과정</option>
											</select>
                                        </div>

                                        <div class="form-group classtit">
                                        	<select name="courseSelect" id="courseSelect" class="form-control" title="과정선택">
												<c:forEach items="${selectList}" var="result">
													<option <c:if test="${result.CSEQNO eq  REQUEST_DATA.paramcSeqNo}"> selected="selected"</c:if> value="<c:out value="${result.CUSERNO}" />,<c:out value="${result.CSEQNO}" />,<c:out value="${result.COURSENO}"/>,<c:out value="${result.CLASS_DESK}"/>,<c:out value="${result.SEQ_TITLE}"/>,<c:out value="${result.MT_CTYPE_NAME}"/>" ><c:out value="${result.SEQ_TITLE}"/></option>	
												</c:forEach>	
											</select>
                                        </div>
                                        	<button type="submit" name="button" class="btn btn-sm btn-mint" onclick="selectTitle(this);" title="검색">검색</button>
                                    </div>

                                  </div>
                           </fieldset>
                    </div>
                </section>
                
                
                
                 <section class="tableBox"> 
                 
                 
                 
                	 <c:if test="${rowData.MT_CTYPE_CODE eq 'DAAA00'}"> 
               		 <hr>
                		<h3 class="main_tit">온라인학습</h3>
                	 </c:if>
              
                	<c:if test="${rowData.MT_CTYPE_CODE eq 'DAAA00'}">  
                    <div class="tblWrap">
                    	<table class="dataTbl text-center">
                        	<caption>온라인학습</caption>
                            	<colgroup>
                                	<col style="width:10%">
                                	<col style="width:*">
                                	<col style="width:30%">
                                	<col style="width:20%">
                                    <col style="width:15%">
                                </colgroup>
                                <thead>
                                	<tr>
                                		<th cope="col">No</th>
                                		<th cope="col">차시명</th>
                                		<th cope="col">진도율</th>
                                		<!-- <th cope="col">마지막 수강일</th> -->
                                		<th cope="col"><span class="sr-only">복습/학습 신청</span></th>
                                	</tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${onResultList}" var="result" varStatus="stat">
                                	<tr>
                                			<td>
                                				${stat.count}차시
                                			</td>
                                			<td>
                                				${result.SUBJECT}
                                			</td>
                                			<td>
                                			 	
                                				<c:choose>
                                           			<c:when test="${result.FRAMECNT > 1}">
                                           				<strong class="po_C7">학습한 페이지수</strong> : 
                                           					<c:out value="${result.FRAMESEQ}" /><span>&#47;</span><c:out value="${result.FRAMECNT}"/> 
                                           					(<c:out value="${result.PROGRESS_VAL}" default="0"/>%)	
                                           			</c:when>
                                           			<c:otherwise>
                                           				<!-- <strong class="po_C7">학습한 시간</strong> :  -->
                                           					<c:out value="${result.STUDYTIME_MM}" default="0" />분 <%-- <c:out value="${result.STUDYTIME_SS}" default="0" />초 --%><span>&nbsp;&#47;&nbsp;</span><c:out value="${result.RUNTIME}"/>분 
                                           					(<c:out value="${result.VIDEO_PERCENT}" default="0"/>%)
                                           			</c:otherwise>
                                           		</c:choose>
                                			</td>
                                			<%-- <td>
                                				${result.EDATE}
                                			</td> --%>
                                			<td>
                                			
                                				<c:choose>
													<%-- <c:when test="${result.FRAMECNT == result.FRAMESEQ}"> --%> 
													<c:when test="${result.MT_PROG_STATUS_CODE eq 'PS0003'}"> 
														<a href="#none" class="btn btn-blue btn-s" onclick="fnOnlineStudy('Y','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>', '<c:out value="${result.CON_HEIGHT}"/>', '0');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기">복습하기</a>
													</c:when>
													<c:otherwise>
<%-- 														<a href="#none" class="btn btn-orange btn-sm" onclick="fnOnlineStudy('N','<c:out value="${result.MOVSEC}" />', '<c:out value="${result.AVG_FRAMSEQ}" />','<c:out value="${result.TREENO}" />','<c:out value="${result.CON_WIDTH}"/>','<c:out value="${result.CON_HEIGHT}"/>', '<c:out value="${stat.index + 1}"/>');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</a> --%>
														<a href="#none" class="btn btn-orange btn-sm" onclick="moveEducationPop(); return false;">학습하기</a>
													</c:otherwise>
												</c:choose>
                                			</td>
                                    </tr>
                                	</c:forEach>
	                        	</tbody>
	                    	</table>
	                	</div>
	                </section>
               
           
                 
                
            <hr/>
	                 <section class="tableBox">
	                	<h3 class="main_tit">시험</h3>
	                	
	                    <div class="tblWrap">
	                    	<table class="dataTbl text-center">
	                        	<caption>시험</caption>
	                            	<colgroup>
	                                	<col style="width:10%">
	                                	<col style="width:*">
	                                	<col style="width:30%">
	                                	<col style="width:20%">
	                                    <col style="width:15%">
	                                </colgroup>
	                                <thead>
	                                	<tr>
	                                		<th cope="col">No</th>
	                                		<th cope="col">구분</th>
	                                		<th cope="col">점수</th>
	                                		<!-- <th cope="col">제출일</th> -->
	                                		<th cope="col"><span class="sr-only">시험/결과  보기</span></th>
	                                	</tr>
	                                </thead>
	                                <tbody>
	                                	 <c:forEach items="${examListData}" var="result" varStatus="stat">
	                                	 	<tr>
	                                	 		<td> ${stat.count} </td>
	                                	 		<c:if test="${result.EXAM_TYPE eq 'B' }">
	                                	 			<td> ${result.TITLE} </td>
	                                	 		</c:if>
	                                	 		<c:if test="${result.EXAM_TYPE eq 'A'}">
	                                	 			<td> ${result.TITLE} </td>
	                                	 		</c:if>
	                                	 		<td>
	                                	 			<c:if test="${result.USER_SUBMITYN eq 'Y' }">
															<fmt:formatNumber value="${result.SCORE}" pattern="0"/>점 / ${result.EVAL}점                                	 			
	                                	 			</c:if>
	                                	 			<c:if test="${result.USER_SUBMITYN ne 'Y' }">
															${result.EVAL} 점	                                	 			
	                                	 			</c:if>
	                                	 		 </td>
	                                	 	<%-- 	<td> ${result.SDATE} ~ ${result.EDATE} </td> --%>
	                                	 		
	                                	 		<td>
	                                	 		
	                                	 			<c:choose>
															<c:when test="${result.ENDYN eq 'Y' }">
																<span class="btn btn-sm btn-gray">기간 종료</span>
															</c:when>
															<c:when test="${result.EXAM_TYPE eq 'A' && (not empty result.CUSERNO || not empty result.USER_SUBMITYN)}">
																<!-- 사후시험 > 결과확인 -->
																<a href="#none" onclick="fnForms('<c:out value="${result.EXAMNO}"/>','review_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>', '<c:out value="${result.EXAM_TYPE}"/>'); return false;"  class="btn btn-sm btn-drkblue" title="결과보기 <c:out value="${result.USER_SUBMITYN}"/>">
																	<span class="gray">결과보기</span>
																</a>
															</c:when>
															<c:when
																test="${result.EXAM_TYPE eq 'B' && (not empty result.CUSERNO || not empty result.USER_SUBMITYN)}">
																<a title="응시완료" href="#none" id="sum" class="btn btn-sm btn-drkblue"><span class="gray">응시완료</span></a>
															</c:when>
															<c:when
																test="${empty result.CUSERNO && empty result.USER_SUBMITYN}">
																<a title="응시하기" href="#none" onclick="fnForms('<c:out value="${result.EXAMNO}"/>','submit_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>', '<c:out value="${result.EXAM_TYPE}"/>'); return false;"
																	class="btn btn-sm btn-blue" title="응시하기 <c:out value="${result.USER_SUBMITYN}"/>">
																	<span class="blue">응시하기 <c:out value="${result.USER_SUBMITYN}" /></span>
																</a>
															</c:when>
														</c:choose>
	                                	 		
	                                	 		</td>
	                                	 	</tr>
	                                	 </c:forEach>
		                        	</tbody>
		                    	</table>
		                	</div>
		                	
		                </section>
             		 </c:if>     
             
                <hr/>
                
                <c:forEach items="${pollHistData}" var="dataList" varStatus="stat">
					<input type="hidden" id="histData${stat.index}" value="<c:out value="${dataList.HISTDATA}"/>"/>
				</c:forEach>
                
              
              	 <section class="tableBox">
		                	<h3 class="main_tit">설문</h3>
		
		                    <div class="tblWrap">
		                    	<table class="dataTbl text-center">
		                        	<caption>설문</caption>
		                            	<colgroup>
		                                	<col style="width:10%">
		                                	<col style="width:*">
		                                	<col style="width:30%">
		                                	<col style="width:20%">
		                                </colgroup>
		                                <thead>
		                                	<tr>
		                                		<th cope="col">No</th>
		                                		<th colspan="2" cope="col" align="center">설문명</th>
		                                		<th cope="col"><span class="sr-only">설문참여/결과  보기</span></th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                	 <c:choose>
											<c:when test="${not empty pollResultList}">
												<c:forEach items="${pollResultList}" var="result" varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td colspan="2" class="text-center">
			                                    		<div class="ellipsis">
			                                    			${result.TITLE}
			                                    		</div>
			                                    	</td>
			                                    	<td class="btnAreaC"> 
			                                    	
			                                    	<input type="hidden" id="edate" class="edate" value="<c:out value="${result.EDATE}"/>">
			                                         <a href="#none" id="<c:out value='${result.POLLCSEQNO}'/>" class="btn btn-blue btn-sm join"  check="<c:out value='${result.POLLCSEQNO}'/>" onclick="fnApply('<c:out value='${result.POLLCSEQNO}'/>','${result.CNT}','<c:out value="${result.EDATE}"/>','<c:out value="${result.SDATE}" />');" title="설문 참여하기">참여하기</a>
			                                     	 <input type="hidden" name="applyDate" id="applyDate" value="<c:out value="${result.APPLY_DATE}"/>"/>
												</tr>
												</c:forEach>
											</c:when>
											</c:choose>
			                        	</tbody>
			                    	</table>
			                	</div>
			                	
			                </section>
			                
              
					<hr>
				
	                <section class="tableBox">
		                	<h3 class="main_tit">공지사항</h3>
		                    
			                	<div class="tblWrap">
		                    	<table class="dataTbl text-center">
		                        	<caption>공지사항</caption>
		                            	<colgroup>
		                                	<col style="width:10%">
		                                	<col style="width:*">
		                                	<col style="width:30%">
		                                	<col style="width:20%">
		                                </colgroup>
		                                <thead>
		                                	<tr>
		                                		<th cope="col">No</th>
		                                		<th cope="col">제목</th>
		                                		<th cope="col">작성일</th>
		                                		<th cope="col">조회수</th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                	<c:choose>
											<c:when test="${not empty courselistData}">
												<c:forEach items="${courselistData}" var="result" varStatus="status">
		                                		<tr>
				                                        <c:if test="${result.TOPYN eq 'Y'}">
				                                			<td class="text-center po_C2">
															[공지]
															</td>
														</c:if>
														<c:if test="${result.TOPYN eq 'N'}">
															<td>
															${courselistCount-(REQUEST_DATA.cPage-1)*10-status.count+1}
															</td>
														</c:if>
				                                    </td>
			                                		
			                                		
			                                    	<td class="text-left">
			                                    		<div class="ellipsis">
															 <c:if test="${result.TOPYN eq 'Y'}">
					                                    		<a href="#none" class="noti_tit" onclick="fnForm('<c:out value="${result.BBSNO}"/>','view','1'); return false;" title="<c:out value="${result.TITLE}"/>">
																	<c:out value="${result.TITLE}"/>
																	
																<c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if>
																</a>
															</c:if>
															 <c:if test="${result.TOPYN eq 'N'}">
					                                    		<a href="#none" class="" onclick="fnForm('<c:out value="${result.BBSNO}"/>','view','1'); return false;" title="<c:out value="${result.TITLE}"/>">
																	<c:out value="${result.TITLE}"/>
																	
																<c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if>
																</a>
															</c:if>
			                                    		</div>
			                                    	</td>
			                                      	<td> <c:out value="${result.WDATE}" /> </td>
			                                      	<td> <c:out value="${result.RCNT}"/></span> </td>
				                                </tr>
		                                    	</c:forEach>
		                                    	</c:when>
		                                    	</c:choose>
			                        	</tbody>
			                    	</table>
			                	</div>
			                	
			                	
			                	
			                	
			                </section> 

							<hr/>
							
							 <section class="tableBox">
		                	<h3 class="main_tit">자료실</h3>
		
		                    <div class="tblWrap">
		                    	<table class="dataTbl text-center">
		                        	<caption>자료실</caption>
		                            	<colgroup>
		                                	<col style="width:10%">
		                                	<col style="width:*">
		                                	<col style="width:30%">
		                                	<col style="width:20%">
		                                </colgroup>
		                                <thead>
		                                	<tr>
		                                		<th cope="col">No</th>
		                                		<th cope="col">제목</th>
		                                		<th cope="col">작성일</th>
		                                		<th cope="col">조회수</th>
		                                	</tr>
		                                </thead>
		                                <tbody>
		                                	 <c:choose>
											<c:when test="${not empty courselistData2}">
												<c:forEach items="${courselistData2}" var="result" varStatus="status">
		                                		<tr>
				                                        <c:if test="${result.TOPYN eq 'Y'}">
			                                			<td class="text-center po_C2">
															[공지]
														</td>
														</c:if>
														<c:if test="${result.TOPYN eq 'N'}">
														<td>	
															${courselistCount2-(REQUEST_DATA.cPage-1)*10-status.count+1}
					                                    </td>
														</c:if>
			                                		
			                                    	<td class="text-left">
			                                    		<div class="ellipsis">
			                                    		<c:if test="${result.TOPYN eq 'Y'}">
					                                    		<a href="#none" class="noti_tit" onclick="fnForm('<c:out value="${result.BBSNO}"/>','view','2'); return false;" title="<c:out value="${result.TITLE}"/>">
																	<c:out value="${result.TITLE}"/>
																	
																<c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if>
																</a>
															</c:if>
															 <c:if test="${result.TOPYN eq 'N'}">
					                                    		<a href="#none" class="" onclick="fnForm('<c:out value="${result.BBSNO}"/>','view','2'); return false;" title="<c:out value="${result.TITLE}"/>">
																	<c:out value="${result.TITLE}"/>
																	
																<c:if test="${result.DATE_DIFF < 7}"><span class="new" title="새글"></span></c:if>
																</a>
															</c:if>
			                                    		</div>
			                                    	</td>
			                                      	<td> <c:out value="${result.WDATE}" /> </td>
			                                      	<td> <c:out value="${result.RCNT}"/></span> </td>
				                                </tr>
		                                    	</c:forEach>
		                                    	</c:when>
		                                    	</c:choose>
			                        	</tbody>
			                    	</table>
			                	</div>
			                	
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
	
	
			</div><!-- //sub-contents -->
	

		</div><!-- //sub-contents -->
	</article>
	
	
	
	
</div><!-- //sub-wrap -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>


<script type="text/javascript"> 
	
	var w1 = parseInt(document.body.scrollWidth);
	var h1 = parseInt(document.body.scrollHeight);
	
	var pop = null;
	
	
	function keyCheck() {
	
	    var keycode = event.keyCode;
	    if (keycode == 16) { alert("Shift키는 사용하실 수 없습니다!!"); return false; }
	    if (keycode == 17) { alert("Ctrl키는 사용하실 수 없습니다!!"); return false; }
	    if (keycode == 18) { alert("Alt키는 사용하실 수 없습니다!!"); return false; }
	 }
	
	document.onkeydown = keyCheck;
	
	// 학습창 로딩(팝업)
	function fnOnlineStudy(ispass, movsec, avgFramseq, tno, cWidth, cHeight, cflag){
		if (event.shiftKey) {
			return false;
		}
		// pressed ctrl
		if (event.ctrlKey) {
			// do something
			return false;
		}
		// pressed alt
		if (event.altKey) {
			return false;
			// do something
		}
		// pressed with shift and ctrl
		if (event.shiftKey && event.ctrlKey) {
			return false;
			// do something
		}
		$.ajax({
			url : "/classdesk/user/exam/leExamBeAfterCheck.do",
            data : { cseqno :'<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>'},
            dataType : "json",
            type : 'post',
            success : function(data) {
            	if(data.beCheckCnt < 1){
        			alert('사전시험에 참여 후 학습 가능합니다.');
        			//$("#frm").attr("action", "/classdesk/user/exam/list.do");
        			//$("#frm").submit();
        		}
            	else {
            		
            		// 학습 참여 시작 -------------->
            		
            		var paramCourseNo = $("#paramCourseNo").val();

            		/* if(paramCourseNo == 50 || paramCourseNo == 49 || paramCourseNo == 51 ) { //신규컨텐츠(장애인차별예방교육,세계선언)이고 모바일 접속일 경우 수강 불가
            			
            			if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
            				alert('해당 컨텐츠는 PC로 학습하여 주세요.');
            				return false;
            			}  
            			
            		} */
            		
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
            		
            		
            		
            /* 		var eduseqYn =	'<c:out value="${rowData.EDUSEQ_YN}"/>';
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
            		 */
            		
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
			
			
/* 			var eduseqYn =	'<c:out value="${rowData.EDUSEQ_YN}"/>';
			
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
			} */
			
			
			
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
	 	console.log("frameseq :" + frameseq);
		console.log("treeno :" + treeno);
		console.log("lastFrameseq :" + lastFrameseq);
		console.log("studytime :" + studytime);
		console.log("movsec :" + movsec);
		console.log("frame_comp_status :" + frame_comp_status);
		console.log("old_frame_comp_status :" + old_frame_comp_status);
		console.log("seqTitle :" + seqTitle);
		console.log("isPass :" + isPass);  
		
		
		//if(frame_comp_status === undefined) return false;
		
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
	            	$('#frm').attr("action", "/classdesk/main/main.do").submit();
	            },
	            error : function(e) {
	                alert("학습창 진도체크중에 오류가 발생하였습니다.");
	                console.log(e.responseText);
	            }
	      });
		 
	}
</script>

