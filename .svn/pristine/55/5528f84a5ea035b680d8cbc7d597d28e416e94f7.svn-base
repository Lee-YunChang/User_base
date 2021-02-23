<%
/****************************************
	system	: ClassDesk > 강사 > 성적
	title	: 과제 목록
	summary	:	
	wdate   : 2015-04-01
	writer  : SANGS
****************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<c:set var="topMenuCode" value="result"/>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/header_inc.jsp"  %> 

	<!-- //개설과목명 -->
	 <!-- 성적정보 -->
	<div class="table-title clearfix">
		<h3 class="ico-table-blue">수강생 성적 정보 </h3>
		<br><br><br> &nbsp;  
					<a href="#none" class="btn-small-purple" onclick="fnPop('mail')"><span>메일보내기</span></a>
					<a href="#none" class="btn-small-purple" onclick="fnPop('sms')"><span>SMS</span></a>  
					<a href="#none" class="btn-small-brown" onclick="fnExcel()"><span>엑셀다운로드</span></a>  
		<div class="btn-group">
			<div class="btn-group">
 				<a href="#none" onclick="fnAttendVal();" class="btn-small-orange"><span>출석점수부여</span></a>
			</div>
		</div>
	</div>
	<form id="resultForm" name="resultForm"  method="post" action="/classdesk/common/mail.do">
	<input type="hidden" name="subcmd" id="subcmd"/>
	<div class="table-type4">
		<div class="table-header-left"></div>
		<table id="itemList">
			<caption>과제</caption>
			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="*" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="5%" />
				<col width="10%" />
				<col width="10%" />
				<col width="5%" />
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2"><label for="isall">전체선택</label>
						<input type="checkbox" class="input_chbox" style="border:0px" name="isall"  id="isall"  onclick="MsgUserAllCheck();">
						
					</th>
					<th rowspan="2">번호</th>
					<th rowspan="2">이름</th>
					<th rowspan="2">소속</th>
					<th colspan="2">진도(<c:out value="${rowData.EVAL_PROGRESS}" default="0" /> )</th>
					<th rowspan="2">과제(<c:out value="${rowData.EVAL_REPORT}"  default="0"/>)</th>
					<th colspan="2">시험(<c:out value="${rowData.EVAL_EXAM_MT + rowData.EVAL_EXAM_FINAL}" default="0"/>)</th>
					<th rowspan="2">출석(<c:out value="${rowData.EVAL_ATTEND}"  default="0"/>)</th>
					<th rowspan="2">총점</th>
					<th rowspan="2">수료여부<br>(기준 :<c:out value="${rowData.COMP_VAL}" default="0" /> 점)</th>
					<th rowspan="2">수료코드 <BR>(발급일자)</th>
					<th rowspan="2">석차</th>
				</tr>
				<tr>
					<th>교재(<c:out value="${rowData.FRAMECNT}" default="0" />p)</th>
					<th>점수</th>
					<th>중간(<c:out value="${rowData.EVAL_EXAM_MT}" default="0"/>)</th>
					<th>최종(<c:out value="${rowData.EVAL_EXAM_FINAL}" default="0"/>)</th>
				</tr>
			</thead>
			<!-- 접근성 인증을 위해 각각의 label과 id를 번호화 시켜야함 // 접근은 name으로 할 것 -->
			<tbody>
				<c:choose>
					<c:when test="${not empty listData}">
							<c:forEach items="${listData}" var="result" varStatus="stat">
							
									<tr>
										<td>
											<label for="list-check1">선택</label>
											<input type="checkbox" name="msg_user" id="msg_user" value="<c:out value="${result.USERID}"/>/<c:out value="${result.USERNAME}"/>/<c:out value="${result.EMAIL}"/>/<c:out value="${result.MOBILE}"/>"/>
											<input type="hidden" name="recUserList" id ="recUserList" value = "<c:out value="${result.USERID}"/>/<c:out value="${result.USERNAME}"/>/<c:out value="${result.EMAIL}"/>/<c:out value="${result.MOBILE}"/>" />
										</td>
										<td><c:out value="${stat.count}"/></td>
										<td><c:out value="${result.USERNAME}" default="-"/><br />(<c:out value="${result.USERID}" default="-"/>)</td>
										<td><c:out value="${result.COMNAME}" default="-"/></td>
										<td>
											<input type="hidden"  name="cuserNo" id="cuserNo" value="<c:out value="${result.CUSERNO}" default="0"/>" /> 
											<div class="table-inline-box1">  
												<label for="prog-point1">진도포인트</label>
												<c:out value="${result.FRAMESEQ}" default="0"/><strong>P</strong> <BR/>
												 <label for="prog-per1">진도퍼센트</label>
												<c:if test="${rowData.FRAMECNT > 0 }">
													(<c:out value="${result.PROG}" default="0"/><strong>%</strong> )				
												</c:if>
													
											</div>
										
										</td>
										<td><label for="progressVal">진도점수</label>
											<input type="text" class="w50" name="progressVal" id="progressVal" value="<c:out value="${result.PROGRESS_VAL}" default="0"/>" onkeyup="lfn_keychk(this);"  maxlength="5"  /> 점</td>
										<td><label for="reportVal">과제점수</label><input type="text" class="w50" name="reportVal" id="reportVal" value="<c:out value="${result.REPORT_VAL}" default="0" />" onkeyup="lfn_keychk(this);"   maxlength="5"   /> 점</td>
										<td><label for="examMtVal">중간시험점수</label><input  type="text" class="w50" name="examMtVal" id="examMtVal" value="<c:out value="${result.EXAM_MT_VAL}" default="0"/>"  onkeyup="lfn_keychk(this);"  maxlength="5"  /> 점</td>
										<td><label for="examFinalVal">최종시험점수</label>
											<input type="text" class="w50" name="examFinalVal" id="examFinalVal" value="<c:out value="${result.EXAM_FINAL_VAL}" default="0"/>" onkeyup="lfn_keychk(this);"   maxlength="5"   /> 점</td>
										<td><label for="attendVal">출석점수</label><input type="text" class="w50" name="attendVal" id="attendVal" value="<c:out value="${result.ATTEND_VAL}" default="0"/>"  onkeyup="lfn_keychk(this);" maxlength="5"  /> 점  </td>
										<td>
											<span class="red_b" id = "finalValOut" name = "finalValOut">
												<c:out value="${result.FINAL_VAL}" default="0"/>
											</span>
											<input type="hidden"  name="finalVal" id="finalVal" value="<c:out value="${result.FINAL_VAL}" default="0"/>"/>
										</td>
										<td>
											<label for="ispass">수료여부</label> 
												<span class="blue_b">
													<c:if test="${result.ISPASS eq 'N'}">미수료</c:if>
													<c:if test="${result.ISPASS eq 'Y'}">수료</c:if>
												</span>
											<%-- <select name="ispass" id="ispass">
												<option value="N" <c:if test="${result.ISPASS eq 'N'}">selected="selected"</c:if>> 미수료</option>
												<option value="Y"  <c:if test="${result.ISPASS eq 'Y'}">selected="selected"</c:if>> 수료</option>
											</select>  --%>
												<input type="hidden"  name="ispass" id="ispass" value="<c:out value="${result.ISPASS}" default="N"/>"/>
										</td>
										<td>
											<label for="ispass">수료여부</label>
											<span class="blue_b">
												<c:choose>
													<c:when test="${result.ISPASS eq 'Y'}">
														<c:out value="${result.COMPCODE}" default="-"/><br/>(<fmt:formatDate value="${result.COMPDATE}" pattern="yyyy-MM-dd" />)
													</c:when>
													<c:otherwise>
													 - 
													</c:otherwise>
												</c:choose>
											</span>
											
										</td>
										<td>
											<span class="blue_b"><c:out value="${result.RANK}" default="0"/> </span>
											<input type = "hidden" name="rank" id="rank" value= "<c:out value="${result.RANK}" default="0"/>"> 
										</td>
									</tr>
									
									 
								</c:forEach>
						</c:when>
						<c:otherwise>   
									<tr>
										<td colspan="14" align="center">등록된 정보가 없습니다.</td>
									</tr>
					</c:otherwise>
						
 				</c:choose>

			</tbody>
		</table>
	</div>
	</form>
	<!-- //성적정보 -->
	<!-- 게시판 버튼영역 -->
	<div class="table-btn-group">
		<div class="btn-table">
			<a href="#none" class="btn-large-blue"  onclick="fnForm('N');"><span>성적반영</span></a>
			<a href="#none" class="btn-large-blue"  onclick="fnForm('Y');"><span>최종성적반영</span></a>
		</div>
	</div>
    
    <%@ include file="/WEB-INF/jsp/classdesk/cmmn/inc/footer_inc.jsp" %>
 
	
	<!-- //게시판 버튼영역 -->
	<script type="text/javascript">
	<!--

	 	// 총점 자동 계산 함수 호출
	 	$(document).ready(function(){
	 		$('input').bind({
	 			keyup : function(){
	 				fnChFinalVal();
	 			}
	 		});
	 		
	 		fnChFinalVal();
	 	});
	
	 	// 총점 자동계산
	 	function fnChFinalVal(){
			 var compVal = Number('<c:out value="${rowData.COMP_VAL}"/>');  

 	 		 $('#itemList tbody tr').each(function(i){
	 			    var sum=0;
	 				for(j=5; j<10; j++){ 
		 				sum+=  Number($(this).find('td').eq(j).find('input').attr('value'));
		 			}
	 				
	 				if(sum < compVal  ){
	 					$(this).find('td').eq(11).find('span').html('미수료'); 
	 					$(this).find('td').eq(11).find('span').attr('class', 'red_b');
	 					$(this).find('td').eq(11).find('input').val('N');
 	 					
	 				}else{
	 					$(this).find('td').eq(11).find('span').html('수료');
	 					$(this).find('td').eq(11).find('span').attr('class', 'blue_b');
	 					$(this).find('td').eq(11).find('input').val('Y');
 
 	 				}
	 				
	 				$(this).find('td').eq(10).find('span').html(sum);
	 				$(this).find('td').eq(10).find('input').val(sum);
	 				   
	 		 }); 
 	 		 // 점수별 수료 여부 자동 계산 
 	 		 fnComp();
 	 		 fnRank();
 	 	} 
	 	
	 	
	 	function fnRank(){
	 		var pNum=0;
	 		$('#itemList tbody tr').each(function(i){
	 			pNum = Number($(this).find('td').eq(10).find('span').html());
	 		
	 			var rankCnt = 1;
		 		$('#itemList tbody tr').each(function(j){
		 			if(pNum <  Number($(this).find('td').eq(10).find('span').html())){
		 				
		 				rankCnt++;
		 			}
		 		});	
	 			$('#itemList tbody tr').eq(i).find('td').eq(13).find('span').html(rankCnt); 
	 			$('#itemList tbody tr').eq(i).find('td').eq(13).find('input').val(rankCnt); 
	 			
	 		}); 
	 	}
	 	
	 	// 총점에 따른 수료여부 자동 계산
	 	function fnComp(){ 
	 		var compCode = '';
 	 		var compVal = Number('<c:out value="${rowData.COMP_VAL}"/>');  
	 		
	 		$('input[name=finalVal]').each(function(i){
	 			if( Number($(this).val()) < compVal ){
	 				//compCode = 'N'; 
  	 				//$('#ispass > option[value = ' + compCode + ']').eq(i).attr('selected', 'ture');  
  	 				$(this).find('td').eq(11).find('span').eq(i).html('미수료');
 					$(this).find('td').eq(11).find('span').eq(i).attr('class', 'red_b');
 					$(this).find('td').eq(11).find('input').eq(i).val('N');
	 			}else{
	 				//compCode = 'Y';
  	 				//$('#ispass > option[value = ' + compCode + ']').eq(i).attr('selected', 'ture'); 
  	 				$(this).find('td').eq(11).find('span').eq(i).html('수료');
 					$(this).find('td').eq(11).find('span').eq(i).attr('class', 'blue_b');
 					$(this).find('td').eq(11).find('input').eq(i).val('Y');
	 			}
 			 
	 		}); 
	 	}

	 	function lfn_keychk(obj){
	 	    var val = obj.value;
	 	    var re = /[^0-9|.]/gi;
	 	    
	 	    obj.value = val.replace(re, '');
	 	       
	 	    var split = val.split('.');
	 	    
	 	    if(split.length > 2) {  //콤마 1개 이상 못들어오도록.
	 	        obj.value = val.substr(0,val.length-1);
	 	    }
	 	    
	 	    if(split[1] != null){  //소수점 아래 한자리 넘지못하도록.
	 	        if(split[1].length > 2) {
	 	            obj.value = val.substr(0,val.length-1);
	 	        }
	 	    }
	 	} 

		
		// 출석점수부여
		function fnAttendVal() {
			
			var answer = confirm ('출석점수를 일괄 부여 하시겠습니까? \n확인시 모든 수강생의 출석점수는 <c:out value="${rowData.EVAL_ATTEND}"/>점 이됩니다.');
			
			if(answer) {
			    $('input[name=attendVal]').each(function(i){
			        $(this).val('<c:out value="${rowData.EVAL_ATTEND}"/>');
			    });
		    } else {
			    return false;
			}
				
			fnChFinalVal();
		}
		
 		// 성적반영
		function fnForm(chVal){
 			
 			var finalYn = chVal;
 			// 진도점수 체크
 			var result = true;
			 $('input[name=progressVal]').each(function(i){
  	 		     if( Number($(this).val()) > Number( '<c:out value="${rowData.EVAL_PROGRESS}"/>') ){
		        	 alert('진도점수가 기준 점수를 초과였습니다.');
		        	 $(this).focus();
		        	 result = false;
		        	 return false;
		         }
			 });
			 
			 if(!result) return;
			 
 			// 과제점수
 			$('input[name=reportVal]').each(function(i){
 	  	 		 if( Number($(this).val()) > Number('<c:out value="${rowData.EVAL_REPORT}"/>') ){
		        	 alert('과제점수가 기준 점수를 초과였습니다.');
		        	 $(this).focus();
		        	 result = false;
		        	 return false;
		         }
			 });
 			if(!result) return;
 			// 중간시험점수
 			$('input[name=examMtVal]').each(function(i){
 		         if( Number($(this).val()) > Number('<c:out value="${rowData.EVAL_EXAM_MT}"/>') ){
		        	 alert('중간시험 점수가 기준 점수를 초과였습니다.');
		        	 $(this).focus();
		        	 result = false;
		        	 return false;
		         }
			 });
 			if(!result) return;
 			// 최종시험점수
 			$('input[name=examFinalVal]').each(function(i){
 	 	  	 	if( Number($(this).val()) > Number('<c:out value="${rowData.EVAL_EXAM_FINAL}"/>') ){
		        	 alert('최종시험 점수가 기준 점수를 초과였습니다.');
		        	 $(this).focus();
		        	 result = false;
		        	 return false;
		         }
			 });
 			if(!result) return;
 			// 출석 점수
 			$('input[name=attendVal]').each(function(i){
 	 	  	 	if( Number($(this).val()) > Number('<c:out value="${rowData.EVAL_ATTEND}"/>') ){

		        	 alert('출석 점수가 기준 점수를 초과였습니다.');
		        	 $(this).focus();
		        	 result = false;
		        	 return false;
		         }
			 });
 			if(!result) return;
 			// 시험 점수 체크 (최종)
 			
 			// 출석점수 체크
 			//최종성적반영
 			if(finalYn=='Y'){
 				if(confirm('최종 성적 반영시 "수료증(수료코드)"이 발급되며, 기존 수료 코드가 존재하는 수강생은 수료 코드가 신규 발급됩니다.\n최종 성적을 반영 하시겠습니까?')){
 					// 사용자 정보 데이터 전송
 				   
 					$('form[name=resultForm]')
 						.attr('target', '_cm')
 						.attr('action', '/classdesk/tutor/result/result_final_exec.do')
 						.submit();
 		 		}
 			// 성적반영
 			}else{
 				if(confirm('성적을 반영 하시겠습니까?')){
 					$('form[name=resultForm]')
 						.attr('target', '_cm')
 						.attr('action', '/classdesk/tutor/result/result_exec.do')
 						.submit();
 		 		}
 			}

	 		
		}
		
		// 페이징 이동 함수
		function fnList() {
			$('#resultForm')
				.attr('target', '_self')
				.attr('action', '/classdesk/tutor/result/result_form.do').submit();
		}
		// 엑셀다운로드
		function fnExcel() {
			$('#resultForm')
				.attr('target', '_self')
				.attr('action', '/classdesk/tutor/result/result_excel.do').submit();
		}
		
		function fnPop(type){
			var popType = type ;
			var w1= 1000;

			if(popType == 'mail'){
				$('form[name=resultForm]')
 				.attr('action', '/classdesk/common/mail/form.do');
			}else if( popType == 'sms'){
				w1 = 615;
				$('form[name=resultForm]') 				
					.attr('action', '/classdesk/common/sms/form.do');
 			}
			
			SANGS.Util.openPopupSubmit($('#resultForm'), 'qFormPop', 'width='+w1+', height=772, top=0, left=0, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
		}
		
    //-->
	</script>
	 