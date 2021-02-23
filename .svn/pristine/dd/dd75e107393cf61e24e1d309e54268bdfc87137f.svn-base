<%--
    Description : 회원가입 > 약관동의
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.11.02  구동림           최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(e){
	$('input:radio').bind('click', function(e){
		//한문제당 하나의 보기만 선택할 수 있게
		var qno = $(this).attr('radio');
		$('.question input[radio^="'+qno+'"]').not(this).prop('checked', false);
	});
});

var radioQno = new Array(); // 문제 번호
var radioArr = new Array(); // 선택 답

var keyValue = {}; // 선택 값 임시 저장 

var question = new Array();
var temp = [];

$("body").on("click",".btnSvy",function(){
	
	
	question.push($(this).attr('radio'));
	
	$.each(question, function(key, value){
		if($.inArray(value, temp) === -1){
			temp.push(value);
		}
	});
	
	if(temp.length <= $("#itemCnt2").val()){
		
		for(var i = 0; i < temp.length; i++){
			
			keyValue[$(this).attr('radio')] = $(this).val();
			
		}
		$("#check").val(Object.keys(keyValue).length);
		
		if($("#itemCnt2").val() == $("#check").val()){
				
			for(key in keyValue){
				radioQno.push(key);
				radioArr.push(keyValue[key]);
					
			}

			for(var i = 0; i < $("#check").val(); i++){
				if(radioQno[i] == $(this).attr('radio')){
						radioQno = new Array();
						radioArr = new Array();
						$("#radioQno").val("");
						$("#radioArr").val("");
				}
			
			}
			
			for(key in keyValue){
				radioQno.push(key);
				radioArr.push(keyValue[key]);
					
			}
			
			$("#radioQno").val(radioQno);
			$("#radioArr").val(radioArr);
			
		}
	}
	
});


function fnApply(){
	
	
	/* 
	// validation 
	//객관식 문항 중 복수 응답 항목
	for(var i = 0 ; i < $("#itemCntQno").val() ; i++) {
		//복수 응답 항목의 보기 갯수만큼 회전
		for(var j = 0 ; j < $("#itemCnt"+i).val() ; j++) {
			var qnoInfo=$("#itemCntQNO"+i).val();
			//복수 응답 항목의 보기 중 하나도 선택하지 않았다면
			if($("input:checkbox[check='"+qnoInfo+"']:checked").length == 0){
				alert('누락된 항목이 있습니다. \n모든 항목에 정답을 입력해주세요.');
				return false;
			}
		}
	} */
	
 	//객관식 문항 중 복수 응답 불가 항목
	if($("#itemCnt2").val() != $("#check").val()){
		alert('누락된 항목이 있습니다. \n모든 항목에 정답을 입력해주세요.');
		return false;
	}
	 
	 
/* 	 
	//주관식 문항 
	var textQno = new Array();
	var textArr = new Array();
	var matches = 0;
	$("textarea").each(function(i, val) {
		var notEmpty = $.trim($(this).val());
		if(notEmpty.length == 0) {//빈칸이라면
	    matches++;
	  } else {//값이 있다면
		  textArr.push(new String($(this).val()));
		  textQno.push($(this).attr('textQno'));
	  }
	});
	if(matches > 0){
		alert('누락된 항목이 있습니다. \n모든 항목에 정답을 입력해주세요.');
		return false;
	} */
/* 	
	var checkboxQno = new Array();
	var checkboxArr = new Array();
	// 설문 등록 
	$(":checkbox").each(function(i, val) {
		if ($(this).is(':checked')) {
			checkboxArr.push($(this).val());
			checkboxQno.push($(this).attr('check'));
		}
	});
	
	
	$("#checkboxQno").val(checkboxQno);
	$("#checkboxArr").val(checkboxArr);	
	
  */
	
	//응답수 +1
	var cnt = Number($("#cnt").val()) + 1;
	$("#cnt").val(cnt); 
	
	if(confirm("제출한 설문은 수정할 수 없습니다.\n제출하시겠습니까?")){
		$("#markingForm").submit();
	}
	
}
</script>

<div class="container" id="Subcontent">
	<article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_helpdesk.jsp" %>
		<div class="path">
        	<ul>
            	<li><span class="home text-hide">홈</span></li>
                <li class="active">상시설문</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="contTop">
            	
                <h2 class="h2_tit">상시설문</h2>
            </section>
            
			<section>
	            <div class="borBox">
	            	<form id="markingForm" name="markingForm" action="/academy/poll/exec.do" method="post">
						<input type="hidden" name="pollcseqno" id="pollcseqno"	value="<c:out value="${REQUEST_DATA.pollcseqno}"/>"> 
						<input type="hidden" name="CLASSDESK" id="CLASSDESK"	value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>" /> 
						<input type="hidden" name="paramCourseNo" id="paramCourseNo"	value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>" /> 
						<input type="hidden" name="paramcSeqNo" id="paramcSeqNo"value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>" /> 
						<input type="hidden" id="itemCntQno" value="<c:out value="${itemCntQno}"/>" />	
						<input type="hidden" id="itemCnt2"	value="<c:out value="${itemCnt2}"/>" />	
						<input type="hidden" name="radioQno" id="radioQno" /> 
						<input type="hidden" name="radioArr" id="radioArr" /> 
						<input type="hidden" name="checkboxQno" id="checkboxQno" /> 
						<input type="hidden" name="checkboxArr" id="checkboxArr" /> 
						<input type="hidden" name="textQno" id="textQno" /> 
						<input type="hidden" name="textArr" id="textArr" /> 
						<input type="hidden" name="cnt" id="cnt" value="<c:out value="${REQUEST_DATA.cnt}"/>" /> 
						
						<input type="hidden" id="check" value=""/> <!-- 객관식 체크 여부 변수 -->
						
						<c:forEach var="itemCnt" items="${itemCnt}" varStatus="stat">
							<input type="hidden" id="itemCntQNO${stat.index}" value="<c:out value="${itemCnt.QNO}"/>" />
							<input type="hidden" id="itemCnt${stat.index}" value="<c:out value="${itemCnt.ITEMCNT}"/>" />
						</c:forEach>
						
						<c:forEach var="moduleList" items="${moduleList}"	varStatus="status1">
							<div class="textQ">
			                    <div class="servey_num bold">설문 ${status1.count}</div>
			                    <div class="txt_Q servey"><p class="bold fnt16"><c:out value='${moduleList.CPOLL_TITLE}' /></p></div>
			                </div>
			                <div class="serveyA">	
						<c:forEach var="questionList" items="${questionList}"	varStatus="status2">
							<c:if test="${moduleList.CPOLL_TITLE == questionList.CPOLL_TITLE}">
							
								
								<input type='hidden' id='countItem'  >
								<input type='hidden' id='qno'	value="<c:out value='${questionList.QNO}'/>" /> 
								<input type='hidden' id='doubleAtyn' >
								<input	type='hidden' id='cpollTitleValue' > 
								
								<div class="col-xs-7">
                                     <div class="serveyTxt">
                                        <c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00'}">
                                        	<div class="sev_q"><c:out value='${status2.count}' />. <c:out value='${questionList.SUBJECT}' /></div>
                                        </c:if>
                                       	<c:if test="${questionList.MT_CPOLL_CODE ne 'JBAA00'}">	
                                        	<p class="po_C7"><c:out value='${status2.count}' />. <c:out value='${questionList.SUBJECT}' /></p>
										</c:if>
										<c:if test="${questionList.PERIOD != '' && questionList.PERIOD != null}">[<c:out value="${questionList.PERIOD}"/>교시 ${questionList.LIB_SUBJECT}]</c:if>
									</div>
								</div>
								<%-- 
								<c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00'}">
									
									<input type="text" class="form-control testInput" id="l-school" textQno="${questionList.QNO}"  name="${questionList.QNO}" title="">
								
								</c:if> --%>
							<c:if test="${questionList.MT_CPOLL_CODE ne 'JBAA00'}">	
							<div class="row">
							
								<div class="col-xs-5">
                                    <ul class="serveyAnum">
                                     	<c:set value="1" var="count" />
										<c:forEach var="resultList" items="${resultList}" varStatus="status3">
											<c:if test="${questionList.QNO == resultList.QNO}">
												<c:if	test="${resultList.ITEM_SUBJECT != null && resultList.ITEM_SUBJECT != ''}">
													<c:if test="${questionList.MT_CPOLL_CODE eq 'JBBA00'}">
														<c:if test="${questionList.DOUBLE_AT eq 'N'}">
															<c:if test="${count <= 5}">
																<li><button class="btnSvy" type="button" name="test" id="radio${status3.count}" radio="${questionList.QNO}" value="${resultList.ITEMNO}" title="객관식답변">${count}</button></li>
																<c:set var="count" value="${count+1 }" /> 
															</c:if>
														</c:if>
													</c:if>
												</c:if>
											</c:if>
										</c:forEach>
										<c:if test="${count == 5 }">
											<c:set var="count" value="1" />
										</c:if>
									</ul>
								</div><!-- .col-xs-5 -->
							</div><!-- .row -->
							</c:if>
						</c:if>
					</c:forEach>
					</div><!-- .serveyA -->
					
				</div><!-- .borBox -->	
				
				<hr>
				
		</c:forEach>
	 	<div class="btnAreaC">
            <button type="button" name="button" onclick="fnApply();return false" class="btn btn-lg btn-blue" title="설문조사 참여하기">설문조사 참여하기</button>
        </div>
	
	        </section>

			</div><!-- //contents-->

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->
	
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->