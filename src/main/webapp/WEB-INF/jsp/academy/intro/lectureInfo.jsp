<%
/****************************************
    subject	: 사이트맵
    summary	:
    author	: 김학규
    date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">


// 조회
function fnSearch(page) {

    if(page)
        $('#cPage').val(page);

    $('#frm').attr('target', '_self');
    $('#frm').submit();
}


function fnDetail(bbsNo){
    $('#bbsNo').val(bbsNo);
    $('form[name=frm]').attr('target', '_self');
    $('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/helpdesk/noticeView.do').submit();
}

function move_page(cPage){
    $('#cPage').val(cPage);
    $('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/helpdesk/noticeList.do').submit();
}
</script>

<div class="container" id="Subcontent">
	<article class="subArea">
        <div class="subCntWrap">
			
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_footer.jsp"%>
		
			<div class="path">
            	<ul>
                	<li><span class="home text-hide">홈</span></li>
                    <li>이용안내</li>
                    <li class="active">수강신청 안내</li>
                </ul>
            </div>
			<div class="subConts" id="sub-content">
               <section class="bgTop_cate08"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			 <h2 class="h2_tit">수강신청 안내</h2>
	            		</div>           	
	          	  </section>

				
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
</div>
<!-- footer -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>