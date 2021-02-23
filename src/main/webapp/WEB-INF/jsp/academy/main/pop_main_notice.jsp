<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/main_popup_header.jsp"%>
<html>
<!-- 팝업타이틀 -->
<head>
<title><c:out value="${rowData.POP_TITLE}" /></title>
</head>
<!-- //팝업타이틀 -->

<!-- 팝업내용 -->
<div class="ad_popup_cont">
    <div class="ad_table">
       <p id="textArea"> <c:out value="${rowData.POP_CONTENT}" escapeXml="false"/></p>
    </div>

    <div class="main_pop_foot_btn clearfix">
    	<div class="anoView">
    		<p class="checks">
	    		<input type="checkbox" id="ad_today_close_check" name="ad_today_close_check" check="0" title="오늘 하루 이 창을 열지 않음"/><label for="ad_today_close_check"> 오늘 하루 이 창을 열지 않음</label>
	        	<a href="#" onclick="self.close();" title="팝업 닫기">[닫기]</a>
        	</p>
        </div>
    </div>
</div>
<!-- //팝업내용 -->

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>
<style type="text/css">
    .anoView { position: absolute; bottom: 0; left: 0; width: 100%; background-color:#ddd; }
    .anoView p { color:#484848; text-align:right;  height:23px; line-height:23px; padding-right:15px; }
</style>
<script type="text/javascript">

	$(document).ready(function() {
	    //setWindowResize();
	    
	    $('input[type=checkbox]').click(function(e){
	    	if($(this).attr("check") == 0){
	    		$(this).attr("check" , "1");
	    		setCookie("notice_<c:out value="${rowData.POP_NO}"/>", "ok_<c:out value="${rowData.POP_NO}"/>" ,1);
	    	}else if($(this).attr("check") == 1){
	    		$(this).attr("check" , "0");
	    		deleteCookie("notice_<c:out value="${rowData.POP_NO}"/>", "ok_<c:out value="${rowData.POP_NO}"/>" ,-1);
	    	}
	    }); 
	});

    function fnGoNotice(){
        window.close();
        opener.window.location.href = "<c:out value="${ctx}"/>/academy/notice/notice/list.do";

    }

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
    
    function closeWin() {
		var popNo = $("#popNo").val();
	    if(document.getElementById("close_view").checked) {
	        setCookie("main_popup_<c:out value="+ popNo +"/>", "done" , 1);
	    }
	    windowClose();
	}

</script>
</html>