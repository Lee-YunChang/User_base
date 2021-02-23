<%
/* *******************************************
    system  : 나의강의실 > 설문
    title   : 설문
    summary :	
    wdate   : 2016-10-13
    writer  : 황두은
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
    		$(this).parents(".btnAreaC").find("a").attr('class','btn btn-lg btn-gray');
    		$(this).parents(".btnAreaC").find("a").text('기간종료');
    	}
	});
	
	var checkArr = new Array;
	var histDataArr = new Array;
	var cnt = 0; 
	
	$(".btn").each(function(i, val) {
		var check = $(this).attr('check');
		checkArr.push(check);
	});
	
	for(var i = 0 ; i < $("#histDataCheck").val() ; i++) {
		console.log($("#histData"+i).val());
		histDataArr.push($("#histData"+i).val());
	}
	
	for(var i = 0 ; i < checkArr.length ; i++) {
		console.log("참여완료최초진입 길이="+checkArr.length);
		for(var j = 0 ; j < histDataArr.length ; j++){
			console.log("0부터 길이 까지");
			if(checkArr[i] == histDataArr[j]){
				console.log("일치값 확인");
				$("#"+ histDataArr[j]).attr('class','btn btn-lg btn-gray');
				$("#"+ histDataArr[j]).text('참여완료');
			}
		}
	}
	
});

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
	var frm = document.sform;
	frm.pollcseqno.value=pollcseqno;
	frm.cnt.value=cnt;
	$("#sform").attr("action", "/classdesk/user/poll/view.do");
	frm.submit();  
}
</script>
<div class="container" id="Subcontent" >
	<article class="subArea">
        <div class="subCntWrap">
			
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>내강의실</li>
                <li class="active">설문</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="contTop">   
                <h2 class="h2_tit">설문 <span class="ico_sec syber"><c:out value="${REQUEST_DATA.ctypeName}"/></span> <span class="po_C7 fnt12"><c:out value="${REQUEST_DATA.seqTitle}"/></span></h2>
            </section>
			
			<form name="sform" id="sform" action="/classdesk/user/poll/form.do" method="post">
				<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
		   		<input type="hidden" name="total" id="total" value="<c:out value="${fn:length(resultList)}"/>"/>
				<input type="hidden" name="pollcseqno" id="pollcseqno" value=""/>
				<input type="hidden" name="pollcseqno2" id="pollcseqno2" value=""/>
				<input type="hidden" name="writer" id="writer" value=""/>
				<input type="hidden" name="qu" id="qu" value=""/>
				<input type="hidden" name="pageMode" id="pageMode" value=""/>
				<input type="hidden" name="cnt" id="cnt" value=""/>
				<input type="hidden" name="cseqno" id="cseqno" value="${REQUEST_DATA.SES_CSEQNO}"/>
				<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
		    	<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>"/>
		    	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>"/>
		    	<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="<c:out value="${REQUEST_DATA.paramcUserNo}"/>"/>
		    	<input type="hidden" id="histDataCheck" value="<c:out value="${histData2}"/>"/>
		    	<input type="hidden" id="seqTitle" name="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
		    	<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
				
				<c:forEach items="${histData}" var="dataList" varStatus="stat">
					<input type="hidden" id="histData${stat.index }" value="<c:out value="${dataList.HISTDATA}"/>"/>
				</c:forEach>
				
				<section>
					 <c:choose>
						<c:when test="${not empty resultList}">
		                 <div class="crdBoard ">
		                 <c:set var="lastRow" value="0"/>
		                <c:forEach items="${resultList}" var="result" varStatus="stat">
		                 	 
		                     <c:if test="${stat.index == 0 || stat.index % 2 == 0}">
								<c:if test="${stat.index % 2 == 0}">
									<c:set var="lastRow" value="${lastRow+1 }" />
								</c:if>
								<div class="row">
							</c:if>
			                         <div class="col-md-6 col-sm-6 col-xs-12">
			                             <div class="crdBox">
			                                 <div class="boxInner">
			                                     <dl>
			                                         <dt class="dt_tit"><span class="po_C6 bold fnt19"><c:out value="${result.TITLE}" /></span></dt>
			                                         <dd>
			                                             <p class="li_dot2"><strong class="po_C7">기간</strong> : <c:out value="${result.SDATE}" /> ~ <c:out value="${result.EDATE}" /></p>
			                                         </dd>
			                                     </dl>
			                                     <div class="btnAreaC">
			                                     	 <input type="hidden" id="edate" class="edate" value="<c:out value="${result.EDATE}"/>">
			                                         <a href="#" id="<c:out value='${result.POLLCSEQNO}'/>" class="btn btn-lg btn-blue"  check="<c:out value='${result.POLLCSEQNO}'/>" onclick="fnApply('<c:out value='${result.POLLCSEQNO}'/>','${result.CNT}','<c:out value="${result.EDATE}"/>','<c:out value="${result.SDATE}" />');" title="설문 참여하기">참여하기</a>
			                                     	 <input type="hidden" name="applyDate" id="applyDate" value="<c:out value="${result.APPLY_DATE}"/>"/>
			                                     	 <!-- <a href="#" class="btn btn-lg btn-gray">참여완료</a> -->
			                                     </div>
			                                 </div><!-- .boxInner -->
			                             </div><!-- .crdBox -->
			                         </div><!-- .col-md-6 col-sm-6 col-xs-12 -->
								<c:if test="${stat.index > 0 && stat.index % (2*lastRow) == 0}">	
	                              	</div><!-- .row -->
	                             </c:if>
						</c:forEach>	
						</div><!-- .crdBoard -->
						</c:when>	
						<c:otherwise>
							<!-- <div class="survey-mobile no-con" style="display:block; margin-left: 20px">
								<p class="test-txt">등록된 설문이 없습니다.</p>
							</div> -->
							 <section>
		                         <div class="borBox loginWrap">
		                             <span class="icoLogin testError"></span>
		                             <p class="cltTxt po_C9">등록된 설문이 없습니다.</p>
		                         </div>
		                     </section>
						</c:otherwise>
					 </c:choose>
				</section> 
				
			</form>
		</div><!-- .subConts -->

		</div>
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp" %> 