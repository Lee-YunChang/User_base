<%
/****************************************
    subject	: 교육
    summary	:
    author	: 
    date	: 
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$(document).ready(function() {
    $(".content img").each(function(){
        $(this).attr("alt", $("#bbsTitle").val());
        $(this).attr("title", $("#bbsTitle").val());
    });
    
		
    
    
});

</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_helpdesk.jsp" %>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>알림마당</li>
                <li class="active">전체 교육과정</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">전체 교육과정</h2>
            		</div>           	
	            </section>
            
			<div class="contents" id="sContents">
				
				<c:out value="${data.CONTENT}" escapeXml="false" />

			</div>

		</div><!-- //sub-contents -->

		</div>
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>