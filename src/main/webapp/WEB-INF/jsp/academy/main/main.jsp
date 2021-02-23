﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/main_popup_header.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<script type="text/javascript">

    $(document).ready(function() {
    	
    	
    	$("#lecture").on("click",function(){
    		alert("준비중 입니다.");
    	});

     	$("#lecture2").on("click",function(){
    		alert("준비중 입니다.");
    	});
     	
     	$("#lecture66").on("click",function(){
    		alert("준비중 입니다.");
    	});
 
	    //상시설문
	    '<c:if test="${not empty alwaysPollPop.POLLCSEQNO}">'
		    if($.cookie('poll_<c:out value="${alwaysPollPop.POLLCSEQNO}"/>') != 'pollok_<c:out value="${alwaysPollPop.POLLCSEQNO}"/>'){
				SANGS.Util.openPopup('<c:out value="${ctx}"/>/academy/main/poll/pollPop.do', 'main_pop_<c:out value="${alwaysPollPop.POLLCSEQNO}"/>','width=650, height=350, top=50, left=50, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
	        }
	    '</c:if>';
	    
    });
	
  	//수강신청 안내
    function fnGuidePop(){
        window.open('/academy/helpdesk/lecApplyGuide.do','guidePop','width=790, height=800, scrollbars=YES');
    }
    
    //공지사항 자세히 보기
    function fnDetail(bbsNo){
        $('#bbsNo').val(bbsNo);
        $('#frm').attr('action', '/academy/helpdesk/noticeView.do');
        $('#frm').submit();
    }
  	//교육안내 자세히 보기
	function fnGuidDetail(bbsNo){
        $('#bbsNo').val(bbsNo);
       	$('#frm').attr('action', '/academy/helpdesk/boardView.do');
        $('#frm').submit();
    }

 /*   	//팝업닫기
   	function layerPop(cnt){
   		$('#mainLayer_popup'+cnt).css('display' , 'none');
   	} */
   	
   	
    //쿠키등록
    function setCookie( name, value, expiredays ){
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    }
    
    //쿠키삭제
    function deleteCookie( name, value, expiredays ){
    	var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    }
    
    function fnCompPrintPop() {
    	window.open('/academy/myclass/compGuidePop.do','guidePop','width=790, height=800, scrollbars=YES')
    }
    
     
</script>

<!-- 레이어팝업시작 -->
		<script type="text/javascript">
		function setCookie(name, value, expiredays){
			var todayDate = new Date();
				todayDate.setDate (todayDate.getDate() + expiredays);
				document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
			}
		
		
		function closeWin(cnt){
			 if($("#close_view"+cnt).is(":checked")){
				 $.cookie('main_pop'+cnt , 'sunday'+cnt, 1);// 쿠키 생성
				 
				// alert($.cookie('sunday'+cnt));
				 layerPop(cnt);
			 } else {
				 layerPop(cnt);
			 }
			
		}
		
		function layerPop(cnt){
	   		//alert(cnt);
	   		$('#main_pop'+cnt).css('display' , 'none');
	   	}
		
		</script>
		
<script type="text/javascript">
$(function(){
	
	pevent();
});
 
function pevent(){
	
	for(var i = 0; i < '${fn:length(noticePopList)}'; i++){
	
		var name = "sunday"+i ;
		
		getCookie(name);
		
		function getCookie(name){
			
			var nameOfCookie = name + "=";
			var x = 0;
			while (x <= document.cookie.length){
				var y = (x + nameOfCookie.length);
				if (document.cookie.substring(x, y) == nameOfCookie){
				if ((endOfCookie = document.cookie.indexOf(";", y)) == -1){
				endOfCookie = document.cookie.length;
				}
				return unescape (document.cookie.substring(y, endOfCookie));
				}
				x = document.cookie.indexOf (" ", x) + 1;
				if (x == 0) break;
			}
			return "";
		}
		if (getCookie("main_pop"+i) != "sunday"+i){
			
			$('#main_pop'+i).css('display' , 'block');
		}
		
	}// for
	
}

</script>		

<form name="frm" id="frm" action="/academy/main/main.do" method="post">
<input type="hidden" name="courseno" id="courseno" value=""/>
<input type="hidden" name="cseqno" id="cseqno" value=""/>
<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
<input type="hidden" name="mode" id="mode" value=""/>
<input type="hidden" name="target" id="target" value=""/>
</form>

 	<c:forEach items="${noticePopList}" var="result" varStatus="status" > 
     
      	<div id="main_pop${status.index}" class="main_pop" style="top:<c:out value='${result.LOC_TOP_PX}%'/>; left:<c:out value='${result.LOC_LEF_PX}%'/>; display:none;">
    		<div style="position:relative; height:100%; overflow:hidden">
               <div class="modal-content">
                   <div class="modal-header">
                       <button title="닫기" type="button" class="close" onclick="layerPop('<c:out value="${status.index}" />');return false;"><span aria-hidden="true" class="text-hide">닫기</span></button>
                       <h4 class="modal-title" id=""><c:out value="${result.POP_TITLE}" /></h4>
                   </div>

               </div>
               <div class="modal-body" style="overflow: auto;">
                 ${result.POP_CONTENT}
               </div>
               <div class="modal-footer">
                   <p class="checks" id="checkBox">
					<!-- name="close_view${status.count}" -->
					<input type="checkbox" name="close_view${status.index}" id ="close_view${status.index}" popNo="<c:out value="${result.POP_NO}"/>" check="0" style="margin-left:10px;" />
					<label for="close_view${status.count}"> 오늘 하루 이 창을 열지 않음 </label>
					<button title="닫기" class="mainLayer_btn" onclick="closeWin('<c:out value="${status.index}" />');return false;"><a id="pop-close-btn" class="close_view${status.count}" href="javascript:closeWin('<c:out value="${status.index}" />')">[닫기]</a></button>
				</p>
               </div>
           </div>
     	</div>
     	 
      </c:forEach> 


	 <div id="Maincontent" style="width: 100%;">
	 
	 		<c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/academy/main/main.do'}">
                 <div tabindex="-1" class="container center-block">
	                    <script type="text/javascript">
	                        $(document).ready(function(){
	                        	$('.visu_img').show();
	                        	
	                            $(".visu_slide").bxSlider({
	                                auto:true,
	                                autoControls:true
	                            });
	                        })
	                    </script>
	                    
	                    
	                    <div class="main_visu" tabindex="-1">
	                        <div class="visu_slide" tabindex="-1">
	                        	<c:forEach items="${bannerList}"  var="result" varStatus="status">
	                        		<div tabindex="-1" class="visu_img" <c:if test="${status.count > 1 }"> style="display: none;" </c:if>>
		                                <a title="<c:out value="${result.URL}"/>" tabindex="-1" href="<c:out value="${result.URL}"/>" class="pc_banner"><img tabindex="-1" src="/edu-data/upload/edbbs/banner/<c:out value='${result.SAVFILE}'/>" alt="<c:out value='${result.SAVFILE}'/>"></a><!--  pc일때 -->
		                                <a title="<c:out value="${result.URL}"/>" tabindex="-1" href="<c:out value="${result.URL}"/>" class="mobil_banner"><img tabindex="-1" src="/edu-data/upload/edbbs/banner/<c:out value='${result.MOB_SAVFILE}'/>" alt="<c:out value='${result.MOB_SAVFILE}'/>"></a><!--  모바일일때 -->
		                            </div>
		                        </c:forEach> 
	                        </div> 
	                    </div>
	                </div>
                </c:if>
                
         <div class="topArea">
             <div class="container">
                 <section class="mainIcons">
                     <div class="row">
                         <div class="col-md-2 col-sm-4 col-xs-6">
                             <a title="메뉴1" class="mainIcon link01" href="/academy/course/onDetail.do?ref1=LON&mtScCode=SC1001">
                             	<span class="iconImg"></span><span><font color="yellow">메뉴1</font></span>
                             	<div class="iconTxt"><font color="yellow">메뉴1</font></div>
                             </a>
                         </div> 
                         <div class="col-md-2 col-sm-4 col-xs-6">
                             <a title="메뉴2" class="mainIcon link02" href="/academy/course//onDetail.do?ref1=CNSMR&mtScCode=SC3002">
                             	<span class="iconImg"></span><span><font color="yellow">메뉴2</font></span>
                             	<div class="iconTxt"><font color="yellow">메뉴2</font></div>
                             </a>
                         </div>
                         <div class="col-md-2 col-sm-4 col-xs-6">
                         <!-- /academy/course//onDetail.do?ref1=EMP" -->
                             <a title="메뉴3" class="mainIcon link03" href="#none" id="lecture2">
                             	<span class="iconImg"></span><span><font color="yellow">메뉴3</font></span>
                             	<div class="iconTxt"><font color="yellow">메뉴3</font></div>
                             </a>
                         </div>
                         <div class="col-md-2 col-sm-4 col-xs-6">
                             <a title="메뉴4" class="mainIcon link04" href="/academy/helpdesk/comsenTestList.do">
                             	<span class="iconImg"></span><span>메뉴4</span>
                             	<div class="iconTxt">메뉴4</div>
                             </a>
                         </div>
                         <div class="col-md-2 col-sm-4 col-xs-6">
                             <a title="메뉴5" class="mainIcon link05" href="/academy/helpdesk/annualSchedule.do">
                             	<span class="iconImg"></span><span>메뉴5</span>
                             	<div class="iconTxt">메뉴5</div>
                             </a>
                         </div>
                         <div class="col-md-2 col-sm-4 col-xs-6">
                             <a title="메뉴6" class="mainIcon link06" href="#none" onclick="fnGuidePop()">
                             	<span class="iconImg"></span><span>메뉴6</span>
                             	<div class="iconTxt">메뉴6</div>
                             </a>
                         </div>
                     </div>
                 </section>
                 <section class="midBox borBox">
                     <div class="row">
                         <div class="col-sm-6 col-xs-12">
                             <p class="callCenter">
                                 <strong class="po_C3">문의</strong>
                                 <span class="po_C4">1544-4691</span>
                                 <span class="fnt13">(상담시간 평일 오전9시 ~ 오후6시)</span>
                             </p>
                         </div>
                         <div class="col-sm-6 col-xs-12">
                             <ul class="mid_surpt">
                                 <li><a title="방문 안내" href="/academy/course/lectureInfo.do" class="classinfo">방문 안내</a></li>
                                 <li><a title="수료증 출력" href="/academy/myclass/myclassList.do" class="classprint" ">수료증 출력</a></li>
                                 <li><a title="자주묻는 질문" href="/academy/helpdesk/faqList.do" class="freque">자주묻는 질문</a></li>
                             </ul>
                         </div>
                     </div>
                 </section>
             </div>
         </div>


         <div class="botArea">
             <div class="container">
                 <div class="row">
                 	<div class="col-md-6 col-sm-6 col-xs-12">
                     	<!-- <script type="text/javascript">
	                        $(document).ready(function(){
	                            $(".ul_reltSite").bxSlider({
	                                auto:true,
	                                autoControls:true
	                            });
	                        })
	                    </script> -->
                     	 <section id="eduFsite">
                     	 	 <h3 class="eduTit"><font color="yellow">관련 기관&nbsp;(바로가기)</font></h3>
                     	 	 <div class="borBox">
		                     	 <ul class="ul_reltSite">
		                     	 	<li>
		                     	 		<ul class="ul_sitelink">
		                     	 			<li>
		                     	 				<div>
				                             	 	<span class="span1">
					                             	 	<a title="희망·내일키움통장 참여자의 금융역량 up!" id="lecture66" href="#none">
					                             	 		<span class="banner" tabindex="-1">
					                             	 			<img src="/academy/images/main/bogun.png" alt="보건복지부" tabindex="-1"/>
					                             	 		</span>
					                             	 	</a>
				                             	 	</span>
				                             	 	
				                             	 	<span class="span2">
					                             	 	<a title="희망·내일키움통장 참여자의 금융역량 up!" id="lecture66" href="#none">
					                             	 		<span class="banner" tabindex="-1">
					                             	 			<img src="/academy/images/main/bockgi.png" alt="보건복지부" tabindex="-1"/>
					                             	 		</span>
					                             	 	</a>
				                             	 	</span>
			                             	 	</div>
			                             	 </li>
			                             	 
			                             	 <li>
			                             	 	<div>
				                             	 	<span class="span1">
					                             	 	<a title="희망·내일키움통장 참여자의 금융역량 up!" id="lecture66" href="#none">
					                             	 		<span class="banner" tabindex="-1">
					                             	 			<img src="/academy/images/main/logo4.png" alt="보건복지부" tabindex="-1"/>
					                             	 		</span>
					                             	 	</a>
				                             	 	</span>
				                             	 	
				                             	 	<span class="span2">
					                             	 	<a title="희망·내일키움통장 참여자의 금융역량 up!" id="lecture66" href="#none">
					                             	 		<span class="banner" tabindex="-1">
					                             	 			<img src="/academy/images/main/ggArt.png" alt="보건복지부" tabindex="-1"/>
					                             	 		</span>
					                             	 	</a>
				                             	 	</span>
			                             	 	</div>
			                             	 </li>
			                             	 
			                             	 <li>
			                             	 	<div>
				                             	 	<span class="span1">
					                             	 	<a title="희망·내일키움통장 참여자의 금융역량 up!" id="lecture66" href="#none">
					                             	 		<span class="banner" tabindex="-1">
					                             	 			<img src="/academy/images/main/sangs_logo2.png" alt="보건복지부" tabindex="-1"/>
					                             	 		</span>
					                             	 	</a>
				                             	 	</span>
				                             	 	
				                             	 	<span class="span2">
					                             	 	<a title="희망·내일키움통장 참여자의 금융역량 up!" id="lecture66" href="#none">
					                             	 		<span class="banner" tabindex="-1">
					                             	 			<img src="/academy/images/main/bogun.png" alt="보건복지부" tabindex="-1"/>
					                             	 		</span>
					                             	 	</a>
				                             	 	</span>
			                             	 	</div>
			                             	 </li>
			                             	 
			                             	 <li>
			                             	 	<div>
				                             	 	<span class="span1">
					                             	 	<a title="희망·내일키움통장 참여자의 금융역량 up!" id="lecture66" href="#none">
					                             	 		<span class="banner" tabindex="-1">
					                             	 			<img src="/academy/images/main/gygi.png" alt="보건복지부" tabindex="-1"/>
					                             	 		</span>
					                             	 	</a>
				                             	 	</span>
				                             	 	
				                             	 	<span class="span2">
					                             	 	<a title="희망·내일키움통장 참여자의 금융역량 up!" id="lecture66" href="#none">
					                             	 		<span class="banner" tabindex="-1">
					                             	 			<img src="/academy/images/main/econedu.png" alt="보건복지부" tabindex="-1"/>
					                             	 		</span>
					                             	 	</a>
				                             	 	</span>
			                             	 	</div>
			                             	 </li>
			                             </ul>
		                     	 	</li> 
		                     	 </ul>
	                     	 </div>
                         </section>
                        
                     </div>
                 
                 
                   	 <div class="col-md-6 col-sm-6 col-xs-12">
                         <section class="borBox boardTab">
                             <div role="tabpanel">
                                 <!-- Nav tabs -->
                                 <div class="notitabs">
                                     <ul class="nav nav-tabs" role="tablist">
                                     	<li role="presentation" >
                                             <a title="공지사항" href="#notiTab02" aira-controls="notiTab02" role="tab" data-toggle="tab">공지사항</a>
                                        </li>
                                        <li role="presentation" class="active">
                                             <a title="생활 정보" href="#notiTab01" aira-controls="notiTab01" role="tab" data-toggle="tab">생활 정보</a>
                                        </li>
                                     </ul>
                                 </div>
                                 <!-- Tab panes -->
                                 <div class="tab-content">
                                     <div role="tabpanel" class="tab-pane active" id="notiTab01">
                                         <div class="tabpanelCont">
										 <c:choose>	
											<c:when test="${not empty dataList}">
												<div class="notiContTop"> 
													<c:forEach items="${dataList}" var="result" varStatus="status" begin="0" end="0">
														<dl>
		                                                     <dt class="dt_noti"><a title="자세히 보기" href="/academy/dataRoom/dataroomBoardList.do?bcateno=6&&bbsNo=${result.BBSNO}" class="bold"><span class="ellipsis">${result.TITLE}</span></a></dt>
		                                                     <dd><div class="ellipsis">
		                                                     <%-- <c:out value="${fn:substring(result.NO_TAG_CONTENT,0,30)}"/> --%>
		                                                     <c:out value='${result.NO_TAG_CONTENT.replaceAll("\\\<.*?\\\>","")}' />
		                                                     <c:set value='${result.NO_TAG_CONTENT.replaceAll("\\\<.*?\\\>","")}' var='test'/>
		                                                     <script>
		                                                     console.log("${test}");
		                                                     </script>
		                                                     <c:if test="${fn:length(result.NO_TAG_CONTENT) > 30 }">..</c:if>
		                                                     </div></dd>
		                                                 </dl>
													</c:forEach>
												</div>
													<div class="notiContBot">
		                                                 <ul>
															<c:forEach items="${dataList}" var="result" varStatus="status" begin="1" end="3">
																<li class="li_noti li_dot">
			                                                         <a title="자세히 보기" href="/academy/dataRoom/dataroomBoardView.do?bcateno=6&&bbsNo=${result.BBSNO}" alt="New" class="ico_new"><span class="ellipsis">${result.TITLE}</span></a>
			                                                         <span class="noti_date">${result.WDATE}</span>
			                                                     </li>
															</c:forEach>
														</ul>
													</div>
												
											</c:when>
										 </c:choose>
                                         </div>
                                         <a title="금융생활정보 더보기" href="/academy/helpdesk/boardDataList.do?bcateno=6" class="notibtnMore"><span class="text-hide">금융생활정보 더보기</span></a>
                                     </div>
                                     <div role="tabpanel" class="tab-pane" id="notiTab02">
                                         <div class="tabpanelCont">
										 <c:choose>	
											<c:when test="${not empty noticeList}">
												<div class="notiContTop">
													<c:forEach items="${noticeList}" var="notice" varStatus="status2" begin="0" end="0">
														<dl>
		                                                    <dt class="dt_noti"><a title="자세히 보기" href="/academy/helpdesk/noticeView.do?bbsNo=${notice.BBSNO}" class="bold"><span class="ellipsis">${notice.TITLE}</span></a></dt>
		                                                   	<dd><div class="ellipsis"><c:out value="${fn:substring(notice.NO_TAG_CONTENT,0,30)}" escapeXml="false"/><c:if test="${fn:length(notice.NO_TAG_CONTENT) > 30 }">..</c:if> </div></dd>
		                                                </dl>
													</c:forEach>
												</div>
													<div class="notiContBot">
		                                                 <ul>
		                                                 	<c:forEach items="${noticeList}" var="notice" varStatus="status2" begin="1" end="3">
			                                                 	<li class="li_noti li_dot">
			                                                         <a title="자세히 보기" href="/academy/helpdesk/noticeView.do?bbsNo=${notice.BBSNO}" alt="New" class="ico_new"><span class="ellipsis">${notice.TITLE}</span></a>
			                                                         <span class="noti_date">${notice.WDATE}</span>
			                                                     </li>
			                                                </c:forEach>
		                                                 </ul>
	                                                 </div>
											</c:when>
										 </c:choose>	
                                         </div>
                                         <a title="공지사항 더보기" href="/academy/helpdesk/noticeList.do" class="notibtnMore"><span class="text-hide">공지사항 더보기</span></a>
                                     </div>
                                 </div>
                             </div>
                         </section>
                     </div>
                 </div>
             </div>
         </div>
     </div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
		