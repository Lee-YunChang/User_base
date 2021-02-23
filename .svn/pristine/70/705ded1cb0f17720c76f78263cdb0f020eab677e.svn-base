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

<c:set var="topMenuCode" value="test"/>
<script type="text/javascript">

   	var examTime = '<c:out value="${listData[0].EXAM_TIME_MS}"/>'; //제한시간 MMSS
   	var userExamTime = '<c:out value="${listData[0].USER_EXAM_TIME}"/>'; //응시시간 MMSS
   	var currentTime = 0;
   	
   	//뒤로가기 막음
   	//history.pushState(null, null, location.href); 
   	window.onpopstate = function(event) { 
   		history.go(1);
   	}
   	$(document).ready(function(e){
		/* document.onkeydown = doNotReload; */ //새로고침 막음
   		
   		//var currentTop = parseInt($('#quickmenu').css('top'));

   		$(window).scroll(function() {
   			var currentTop = -250;
   			if($(window).scrollTop() < 275 ){
   				currentTop =  10;//parseInt($('#quickmenu').css('top'));
   			}
   			
   			$('#quickmenu').stop().animate({'top': $(window).scrollTop()+currentTop+'px'}, 500);
   			  
   		});
   		
   		currentTime = examTime - userExamTime; //현재 카운트
   		
   		/**************************************************
   		 이벤트명 :  $('#shortly').countdown
   		 설 명 : 카운트 이벤트
   		 일단 사용하지 않음
   		***************************************************/ 
   		/*  $('#shortly').countdown({until: currentTime, compact: true, description: '',  format: 'MS', layout: '{mn}:{sn}',
   			    onExpiry: liftOff, onTick: watchCountdown});  */
   		
   		/**************************************************
   		 이벤트명 : $('input:radio').bind('click', function(e){
   		 설 명 : 정답 오답 라디오 바인딩
   		***************************************************/ 
   		 $('input:radio').bind('click', function(e){
   			 var index = $(this).attr('itemSeq').replace('itemSeq',''); // 클릭한 인덱스
   			/*****************************************************
   				시험 답 바인딩 영역
   			*****************************************************/
   			var itemSeq = 'itemSeq'+index;
   			//객관식
   			if($('#qType'+index).val() == 2){
   				//$('#ans_'+index).html($('#itemSeq'+index +':checked').val()); 
   				$('#ans_'+index).html($(':radio[name='+itemSeq+']:checked').val()); 
   			
   			//OX
   			}else if($('#qType'+index).val() == 1){
   				
   				//if($('#itemSeq'+index +':checked').val() == 1){
   				if($(':radio[name='+itemSeq+']:checked').val() == 1){
   					$('#ans_'+index).html('O');
   				}else{
   					$('#ans_'+index).html('X');
   				}
   			}
   			fnSubmit(index);
   		});
   		 
   		 
   		 /**************************************************
   		 이벤트명 : $('input:text, textarea').bind('focusout', function(e){
   		 설 명 : 주관식 답 바인딩
   		***************************************************/ 
   	 	 $('input:text, textarea').bind('focusout', function(e){
   	 		var index = $(this).attr('id').replace('answer','');
   			$('#ans_'+index).html($('#answer'+index).val());
   			fnSubmit(index);
      	     }); 
   		 
   	});
   	
   	/* //응시시간 세팅
   	function fnExTimeControll(){
   		var sp = $('#shortly').html().split(':');
   		if(sp[0] != 0){
   			$('#examTime').val(examTime - (Number(sp[0])*60 + Number(sp[1]))); //응시시간
   			alert(sp[0]);
   		}else{
   			$('#examTime').val(examTime - Number(sp[1])); //응시시간
   			alert(sp[1]);
   		}
   	} */
   	
   	/**************************************************
   	 함수명 : fnSubmit
   	 설 명 : 실시간 정답 UPDATE 
   	***************************************************/ 
   	function fnSubmit(index){
   		//응시시간 세팅
   		//fnExTimeControll();
   		var itemSeq = 'itemSeq'+index;
   		$('#qNo').val($('#qNo'+index).val()); //문제번호
   		$('#qSeq').val($('#qSeq'+index).val()); //출제문제 순번
   		$('#qType').val($('#qType'+index).val()); //문제유형 : 1.OX 2.객관식 4.단답형 5.서술형
   		$('#answer').val($('#answer'+index).val()); //주관식응시답안
   		$('#itemSeq').val($(':radio[name='+itemSeq+']:checked').val()); //선택답안
   		//$('#itemSeq').val($('#itemSeq'+index +':checked').val()); //선택답안
   		$('#submitYn').val('N'); //제출여부(Y,N)
   		SANGS.Util.ajax('/classdesk/user/exam/ajaxSaveRealTmAns.do', $('#ansFrm').serialize(), 'json', eval('fnSucces'));
   	}
   	
   	function fnSucces(result){
   		//alert(result);
   	}
   
   	//상상스토리에서 요구사항이 아니므로 일단 사용하지 않음.(제한시간이 지날시 자동제출)
   	/* function liftOff() { 
   	    alert('제한시간이 초과하여 자동 제출됩니다.');
   	    $('#examTime').val(examTime); 
   	    $('#submitYn').val('Y'); 
   		$('form[name=ansFrm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/user/exam/submit_exec.do').submit();
   	}  */
   	 
   	function watchCountdown(periods) { 
   	    $('#monitor').text(periods[5] + '분' + periods[6] + '초'); 
   	}
   	
   	function showScrollTop(index){
   	    var val =$('.exam-list dl').eq(index).offset();
   	    $('body,html').animate({scrollTop:val.top},300);
   	    
   	}
   	
   	function fnSave(){
   		
   		var radioArr = new Array();
   		$(":radio").each(function(i, val) {
   			if ($(this).is(':checked')) {
   				radioArr.push($(this).val());
   			}
   		});
   		
   		if("${fn:length(listData)}" == radioArr.length){
   			$('#submitYn').val('Y'); 
	   			$('form[name=ansFrm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/user/exam/submit_exec.do').submit();
   			/* if(confirm('제출한 시험지는 수정할 수 없습니다. \n제출하시겠습니까?')){
   	   			//응시시간 세팅
   	   			//fnExTimeControll();
   	   			$('#submitYn').val('Y'); 
   	   			$('form[name=ansFrm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/classdesk/user/exam/submit_exec.do').submit();
   	   		} */
   			
   		}else {
   			alert('누락된 항목이 있습니다. \n모든 항목에 정답을 입력해주세요');
   		}
   	}
   	
   	
   	function fnList() { 
   	    $('#subcmd').val('list');
   		$('form[name=ansFrm]').attr('target', '_self').attr('action', '/classdesk/user/exam/list.do').submit();
   	} 
     	
     	document.onkeydown = function(){
     	   	if(event.srcElement.type != 'text' && event.srcElement.type != 'textarea'){
     	   		if(event.keyCode == 116){
     	   			event.keyCode = 2;
     	   			return false;
     	   		}
     	  		else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)){
     	   			return false;
     	   		}else if(event.keyCode == 8){
     	  			return false;
     	  		}
     	  	}
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
		
			<!-- <section class="contTop">
                <h2 class="h2_tit">시험 <span class="ico_sec syber">온라인교육</span> <span class="po_C7 fnt12">창업/금융 실무과정 1기</span></h2>
            </section> -->
             
             <%-- <span class=""><c:out value="${REQUEST_DATA.ctypeName}"/></span>
             <span class=""><c:out value="${REQUEST_DATA.seqTitle}"/></span> --%>
				
				<!-- <div class="contents" id="sContents"> -->
			 <form name="ansFrm" id="ansFrm" action="<c:out value="${ctx}"/>/classdesk/user/exam.do" method="post" >
				<input type="hidden" name="examNo" id="examNo" value="<c:out value="${REQUEST_DATA.examNo}"/>">
				<input type="hidden" name="qNo" id="qNo">
				<input type="hidden" name="qSeq" id="qSeq">
				<input type="hidden" name="qType" id="qType">
				<input type="hidden" name="examTime" id="examTime" value="<c:out value="${listData[0].EXAM_TIME_MS}"/>">
				<input type="hidden" name="answer" id="answer">
				<input type="hidden" name="itemSeq" id="itemSeq">
				<input type="hidden" name="submitYn" id="submitYn">
				<input type="hidden" name="subcmd" id="subcmd">
				<input type="hidden" name="examType" id="examType" value="<c:out value="${REQUEST_DATA.examType}"/>">
				<input type="hidden" name="pubType" id="pubType" value="<c:out value="${REQUEST_DATA.pubType}"/>">	
				<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK}">
				<input type="hidden" name="openType" id="openType" value="${REQUEST_DATA.openType}">
				<input type="hidden" name="ctypeName" id="ctypeName" value="${REQUEST_DATA.ctypeName}">
				<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
		
				<input type="hidden" id="courseSelect" name="courseSelect" value="<c:out value="${REQUEST_DATA.courseSelect}"/>"/>
			</form>
					
				
					
		    <section>
            <h3 class="bdrTit mrg_b30"><c:out value="${listData[0].TITLE}"/></h3>	
			<form id="markingForm" name="markingForm">	
			
			<c:forEach items="${listData}" var="result" varStatus="stat">
				<input type="hidden" name="qNo<c:out value="${stat.index}"/>" id="qNo<c:out value="${stat.index}"/>" value="<c:out value="${result.QNO}" />" />
				<input type="hidden" name="qSeq<c:out value="${stat.index}"/>" id="qSeq<c:out value="${stat.index}"/>" value="<c:out value="${result.QSEQ}" />" />
				<input type="hidden" name="qType<c:out value="${stat.index}"/>" id="qType<c:out value="${stat.index}"/>" value="<c:out value="${result.QTYPE}" />" />
				<c:if test="${result.QTYPE == 1}">
					<div class="borBox">
						 <div class="textQ">
							<div class="test_num bold"><c:out value="${stat.count}"/></div>
							<div class="txt_Q"><p class="bold fnt16"><span class="po_C4">[O,X 퀴즈] </span> <c:out value="${result.QSUBJECT}"/></p></div>
						</div>
						<div class="testA">
							<ul class="ul_radio">
								<li><input type="radio" id="choice_o${stat.count}" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="1" title="답변 o">
								<label for="choice_o${stat.count}"> O
									<span class="hidden">O</span>
						</label>
							    </li>
								<li><input type="radio" id="choice_x${stat.count}" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="2" title="답변 x">
								<label for="choice_x${stat.count}"> X
									<span class="hidden">X</span>
						</label>
								</li>
							</ul>
						</div>
					</div>
					
					<hr>
					
				</c:if>
				<c:if test="${result.QTYPE == 2}">
					<div class="borBox">
						 <div class="textQ">
						 	 <div class="test_num bold"><c:out value="${stat.count}"/></div>
						 	 <div class="txt_Q"><p class="bold fnt16"><span class="po_C4">[객관식]</span> <c:out value="${result.QSUBJECT}"/></p></div>
						</div>
						<div class="testA">
							<ul class="ul_radio">
							<c:if test="${not empty result.A01}">
								<li><input type="radio" id="result01<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="1">
								<label for="result01<c:out value="${stat.index}"/>"><c:out value="${result.A01}"/></label></li>                                            
							</c:if>
							<c:if test="${not empty result.A02}">
								<li><input type="radio" id="result02<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="2">
								<label for="result02<c:out value="${stat.index}"/>"><c:out value="${result.A02}"/></label></li>                                              
							</c:if> 
							<c:if test="${not empty result.A03}">                                            
								<li><input type="radio" id="result03<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="3">
								<label for="result03<c:out value="${stat.index}"/>"><c:out value="${result.A03}"/></label></li>                                              
							</c:if>	  
							<c:if test="${not empty result.A04}">                                                                    
								<li><input type="radio" id="result04<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="4">
								<label for="result04<c:out value="${stat.index}"/>"><c:out value="${result.A04}"/></label></li>
							</c:if>
							<c:if test="${not empty result.A05}">
								<li><input type="radio" id="result05<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="5">
								<label for="result05<c:out value="${stat.index}"/>"><c:out value="${result.A05}"/></label></li>
							</c:if>
							</ul>
						</div>
					</div>
					
					<hr>
					
				</c:if>
				<c:if test="${result.QTYPE == 4 }">
					 <div class="borBox">
						<div class="textQ">
							<div class="test_num bold"><c:out value="${stat.count}"/></div>
							<div class="txt_Q"><p class="bold fnt16"><span class="po_C4">[단답형]</span> <c:out value="${result.QSUBJECT}"/></p></div>
						</div>
						<div class="testA">
							<input type="text" name="answer<c:out value="${stat.index}"/>" id="answer<c:out value="${stat.index}"/>" class="form-control testInput" title="단답형 답변">
						</div>
					</div>
					
					<hr>
					
				</c:if>
				
				<!-- 주관식 서술형-->
				<c:if test="${result.QTYPE == 5  }">
					<div class="borBox">
						<div class="textQ">
							<div class="test_num bold"><c:out value="${stat.count}"/></div>
                            <div class="txt_Q"><p class="bold fnt16"><span class="po_C4">[서술형]</span> <c:out value="${result.QSUBJECT}"/></p></div>
						</div>
						<div class="testA">
							<input type="text" name="answer<c:out value="${stat.index}"/>" id="answer<c:out value="${stat.index}"/>" class="form-control testInput" title="주관식 답안 입력">
						</div>
					</div>
					
					<hr>
					
				</c:if>
			</c:forEach>
			
		   <div class="btnAreaC">
               <button type="button" name="button" class="btn btn-lg btn-blue w130"  onclick="fnSave();return false" title="응시완료">응시완료</button>
           </div>
			
					

						<!-- <p class="ac"><a href="#none" onclick="fnSave();return false" class="btn green" title="시험 응시">시험 응시</a></p>
	
						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
						<div id="shortly" style="display: none;" ></div>
						<style>
						   #quickmenu {position:absolute; left:50%; top:10px; width:13%; margin-left:35%; } 
						</style> -->
						
			</form> 
		</section>
		</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->
	</article>
	
</div>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %>