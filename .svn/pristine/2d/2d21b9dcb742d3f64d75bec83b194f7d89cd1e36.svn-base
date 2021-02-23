<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/main_popup_header.jsp"%>
<html>
<!-- 팝업타이틀 -->
<head>
<title><c:out value="${alwaysPollPop.TITLE}"/></title>
</head>
<!-- //팝업타이틀 -->
<body>
<!-- 팝업내용 -->
<div class="ad_popup_cont">
	<form id="frm" name="frm" method="post" action="">
	</form>
    <div class="ad_table">
	   <p id="textArea"><c:out value="${alwaysPollPop.TITLE}" escapeXml="false"/></p>
	   <p id="dateArea"><c:out value="${alwaysPollPop.SDATE}"/> ~ <c:out value="${alwaysPollPop.EDATE}"/></p>
       <button onclick="movePoll();return false" title="설문 참여하기">설문 참여하기</button>
    </div>

    <div class="main_pop_foot_btn clearfix">
    	<div class="anoView">
    		<p class="checks">
	    		<input type="checkbox" id="ad_today_close_check" name="ad_today_close_check" check="0" title="오늘 하루 이 창을 열지 않음"/><label for="ad_today_close_check"> 오늘 하루 이 창을 열지 않음</label>
	        	<a href="#" onclick="self.close();" title="설문 닫기">[닫기]</a>
        	</p>
        </div>
    </div>
</div>
</body>
<!-- //팝업내용 -->

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>
<style type="text/css">
	/*  body {background:#fffcf2;}
	.ad_table {margin-top:5%;text-align:center;}
	.ad_table #textArea {font-size:2em;font-weight:700;color:#333;margin-bottom:10px;}
	.ad_table #dateArea {font-size:1.4em;margin-top:10px;color:#ffffff;background:#6b6c6e;border:1px solid #6b6c6e;border-radius:30px;padding:5px 5px;width:300px;margin:0 auto;}
	.ad_table button {background:#00AEE7;margin-top:100px;width:200px;height:50px;font-size:1.2em;font-weight:700;color:#ffffff;border:0;text-align:center;}
 */
 	
body{background-color:#f4f4f4;}
.ad_table{text-align: center;width: 500px; border: 3px solid #dfdfdf;  padding: 20px; margin: 0 auto; margin-top: 24px; background: #fff; height: 230px;}

.ad_table #textArea {    font-size: 2.2em;    font-weight: 700;    color: #333;    margin-bottom: 10px;    padding: 15px;text-align: center;}

.ad_table #dateArea {  text-align: center;font-size: 1.4em;   color: #ffffff;  background: #6b6c6e; border: 1px solid #6b6c6e;  border-radius: 30px;  padding: 5px 5px;  width: 300px;  margin: 0 auto;}

.ad_table button { margin:0 auto; background: #00AEE7;  margin-top: 48px;  width: 200px;  height: 50px;  font-size: 1.5em;  font-weight: 700;  color: #ffffff;  border: 0;  text-align: center;}
    .anoView {position:absolute;bottom:0;left:0;width:100%;background-color:#ddd;}
    .anoView p {color:#484848;text-align:right;height:23px;line-height:23px;padding-right:15px;}
</style>

<script type="text/javascript">

	$(document).ready(function() {
	    //setWindowResize();
	    window.document.title = '상시설문';
	    
	    $('input[type=checkbox]').click(function(e){
	    	if($(this).attr("check") == 0){
	    		$(this).attr("check" , "1");
	    		setCookie("poll_<c:out value="${alwaysPollPop.POLLCSEQNO}"/>", "pollok_<c:out value="${alwaysPollPop.POLLCSEQNO}"/>" ,1);
	    	}else if($(this).attr("check") == 1){
	    		$(this).attr("check" , "0");
	    		deleteCookie("poll_<c:out value="${alwaysPollPop.POLLCSEQNO}"/>", "pollok_<c:out value="${alwaysPollPop.POLLCSEQNO}"/>" ,-1);
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
    
    //상시설문 이동
    function movePoll(){
    	opener.parent.location = "/academy/poll/pollForm.do";
    	window.close(); 
    }

</script>
</html>