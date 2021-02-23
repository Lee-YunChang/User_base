<%
/****************************************************
	system	: academy > 나의강의실 > 강사게시판
	title	: 강사게시판 목록
	summary	:	
	wdate	: 2013-08-29
	writer	: kim min gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(){

	$(".accordion-toggle").on("click" , function(){
		var check = $("#checkCount").val();
		var bbsNo = $(this).attr("bbsNo");
		var bcateNo = $(this).attr("bcateNo"); 
		var viewCount = $(this).attr("viewCount");
		
		
		if(check == 'Y'){
			$.ajax({
				url : "/academy/helpdesk/faqCountUpdate.do",
				data : {check : check , bbsNo : bbsNo , bcateNo : bcateNo},
	            dataType : "json",
	            type : 'post',
	            success : function(data){
	            	$("#viewCount"+viewCount).html(data);
	            },
	            error : function(e) {
	                alert("error :" + e.responseText);
	            }
			});
			
			$("#checkCount").val("N");
			$(this).attr("title","자주묻는질문 상세보기 닫기"); 
		}else if(check == 'N'){
			$("#checkCount").val("Y");
			$(this).attr("title","자주묻는질문 상세보기 열기"); 
		}
	});
	
});

//탭이동
function fnTab(url, tabNo) {
	$("#tabNo").val(tabNo);
	$("#qu").val('');
	$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
}
</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_helpdesk.jsp" %>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>알림마당</li>
                <li class="active">자주묻는 질문</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">자주묻는 질문</h2>
            		</div>           	
	            </section>
			
            
            <section>
            	<div class="bluelineTabWrap">
                	<ul class="bluelineTab free">
                		<li class="<c:if test="${REQUEST_DATA.tabNo == 0 || REQUEST_DATA.tabNo == null}"> active</c:if>"><a title="전체" href="#none" onclick="fnTab('/academy/helpdesk/faqList.do', '0'); return false;">전체</a></li>
                		<li class="<c:if test="${REQUEST_DATA.tabNo == 1}"> active</c:if>"><a title="회원정보 관련" href="#none" onclick="fnTab('/academy/helpdesk/faqList.do', '1'); return false;">회원정보 관련</a></li>
					 	<li class="<c:if test="${REQUEST_DATA.tabNo == 2}"> active</c:if>"><a title="온라인교육 관련" href="#none" onclick="fnTab('/academy/helpdesk/faqList.do', '2'); return false;">온라인교육 관련</a></li>
						<li class="<c:if test="${REQUEST_DATA.tabNo == 3}"> active</c:if>"><a title="방문교육 관련" href="#none" onclick="fnTab('/academy/helpdesk/faqList.do', '3'); return false;">방문교육 관련</a></li>
			 			<li class="<c:if test="${REQUEST_DATA.tabNo == 4}"> active</c:if>"><a title="강사 관련" href="#none" onclick="fnTab('/academy/helpdesk/faqList.do', '4'); return false;">강사 관련</a></li>
						<%--<li class="<c:if test="${REQUEST_DATA.tabNo == 5}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/helpdesk/faqList.do', '5'); return false;">기타</a></li> --%>
	                </ul>
	            </div>
	        </section>
	
	        <hr>
	        
	        <form id="frm" name="frm" action="" method="post">
				<input type="hidden" id="checkCount" name="checkCount" value="Y">
				<input type="hidden" id="tabNo" name="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>">
			</form>
	        
	        <section>
	            <div class="panel-group darkbdr qna" id="accordion-panel">
	                <c:forEach items="${listData}" var="result" varStatus="status">	
		                <div class="panel">
		                    <div class="panel-heading">
		                        <h5 class="panel-title">
		                            <a title="내용보기" bbsNo="${result.BBSNO}" bcateNo="${result.BCATENO}" viewCount="${status.count}" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion-panel" href="#qna${status.count}Panel">
		                              <span class="panel_cir">Q</span>
		                              <span class="panel_txt"><c:out value="${result.TITLE}"/></span>
	                                  <span class="panel_updw"></span>
		                            </a>
		                        </h5>
		                    </div>
		                    <div id="qna${status.count}Panel" class="panel-collapse collapse">
		                        <div class="panel-body">
		                            <span class="panel_cir2">A</span>
		                            <div class="po_C8"><c:out value="${result.CONTENT}" escapeXml="false"/></div>
		                          </div>
		                    </div>
		                </div>
		            </c:forEach>
	            </div>
	        </section>

			</div>

		</div><!-- //sub-contents -->
	</article>

</div><!-- //contents-->
	
	<!-- footer -->
	
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
