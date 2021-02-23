<%
/****************************************
    subject	: 지원센터 > 공지사항 보기
    summary	:
    author	: 김학규
    date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="서민과 금융소비자 무료 온라인 교육 및 방문 금융교육, 종합상담사 양성, 1:1 재무상담 교육포털">
<meta property="og:type" content="website">
<meta property="og:title" content="상상스토리 사용자포털">
<meta property="og:description" content="서민과 금융소비자 무료 온라인 교육 및 방문 금융교육, 종합상담사 양성, 1:1 재무상담 교육포털">
<meta property="og:image" content="/academy/images/common/top_logo.png">
<meta property="og:url" content="http://edu.kinfa.or.kr">
<title>상상스토리 사용자포털 ${REQUEST_DATA.title}</title>
<link rel="canonical" href="http://edu.kinfa.or.kr">
<link rel="shortcut icon" href="/academy/images/main/CI2.png">
<link rel="apple-touch-icon" href="/academy/images/main/CI2.ico" type="image/x-icon">
<link rel="stylesheet" href="/academy/common/css/mobile.css" media="all">
<link rel="stylesheet" href="/academy/common/css/laypop.css" media="all">
<link rel="stylesheet" href="/academy/common/css/style.css" media="all">
<link rel="stylesheet" href="/academy/common/fonts/font.css" media="all">
<link rel="stylesheet" href="/academy/common/css/bootstrap_jy.css" media="all">
<link rel="stylesheet" href="/academy/common/css/jquery-ui.min.css" media="all">
<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="/academy/common/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery.simple-sidebar.min.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery.jqtransform.js" ></script>
<script type="text/javascript" src="/academy/common/js/jquery.alphanumeric.pack.js"></script>  
<script type="text/javascript" src="/academy/common/js/jquery.cookie.js"></script> 

<script type="text/javascript" src="/academy/common/js/lodash/lodash.js" charset="utf-8"></script>
<script type="text/javascript" src="/academy/common/js/underscore/underscore.string.js" charset="utf-8"></script>
<script type="text/javascript" src="/academy/common/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="/common/js/makePCookie.js"></script>
<script type="text/javascript" src="/academy/common/js/common.js"></script>
<script type="text/javascript" src="/academy/common/js/ui.js"></script>
<script type="text/javascript" src="/common/js/sangs_core.js"></script>
<style>
/* 	.messages { padding-left:18px; padding-right:18px; padding-top:18px; margin: 0px; height: 359px; width: 100%; resize: none; border: solid; border-color:#cccccc; border-width: 1px; } */
 	.messages { word-break:break-all;word-wrap:break-word; padding-left:18px; padding-right:18px; padding-top:18px; margin: 0px; height: 359px; width: 100%; resize: none; border: solid; border-color:#cccccc; border-width: 1px; }
	#senderSpen {font-weight: bold;}
	
	.balloonArea 
	{
		float:right;
		text-align: right;
		width:100%;
		word-break:break-all;
		word-wrap:break-word;
		margin-top:-11px;
	}
	
	
	.myBalloon 
	{ 
		display: inline-block; 
		position: relative; 
		background: #ffe004; 
		max-width: 100%; 
		margin: 0 0px 10px; 
		padding : 8px; 
		border-radius : 10px; 
		margin-top: 6px; 
	}	

	.myBalloon:after 
	{
		content: ''; 
		position: absolute; 
		border-top: 10px solid transparent; 
		border-right: 8px solid transparent; 
		border-left: 10px solid #ffe004; 
		bottom: 13px; 
		right: -16px; 
	}
	
	.yourBalloon 
	{
		display: inline-block;
		position: relative;
		background: #f5efef;
		max-width: 100%;
		margin: 0 15px 10px;
		padding : 8px;
		border-radius : 10px;
		margin-top: 6px;
	}
	
	.yourBalloon:after 
	{
	    content: '';
	    position: absolute;
	    border-top: 10px solid transparent;
	    border-right: 8px solid #f5efef;
	    border-left: 10px solid transparent;
	    bottom: 13px;
	    left: -16px;
	}
		
</style>

<script type="text/javascript">

	// 소켓 connection
	$(document).ready(function() {
		
		openSocket();
	})
	
</script>


<body>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
			<div class="path">
	            <ul>
	                <li><span class="home text-hide">홈</span></li>
	                <li>내 강의실</li>
	                <li class="active">문의하기</li>
	            </ul>
        	</div>
			<div class="subConts" id="sub-content">
				<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			<h2 class="h2_tit">문의하기</h2>
	            		</div> 
            	</section>
            	
				<div class="contents" id="sContents">
			
					<div id="wrap">
<!-- 						<textarea id="messages" readonly="readonly"></textarea> -->
						<div id="messages" class="messages" style="overflow:auto" >
						<div id="arrow_box" class="arrow_box" style="overflow:auto" >
						</div>
					</div>
				
					<section class="tableBox">
						<div class="tblWrap">
							<input type="text" id="sender" value="${REQUEST_DATA.SES_USERID }" style="display: none;">
						</div>
												
						<div class="titSearchWrap" style="margin-top: 18px;">
							<button type="button" onclick="openSocket();" style="display: none">Open</button>
							<input type="text" id="messageinput" class="form-control" value="" style="width: 99%;" onkeypress="if(event.keyCode==13){send();return false}">
					        <button class="btn btn-sm btn-mint" onclick="send();">전송</button>
						</div>
					</section>
					
			</div><!-- //contents-->

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</article>
</div>
</body> 

<script>

	var ws;
	var messages=document.getElementById("messages");
	
	function openSocket(){
		
		if(ws!==undefined && ws.readyState!==WebSocket.CLOSED) {
			writeResponse("WebSocket is already opened.");
			return;
		}
		
    //웹소켓 객체 만드는 코드  
// 	    ws=new WebSocket("ws://keledu.sangs.kr/websocket/chat/echo.do"); 
// 	    ws=new WebSocket("ws://192.168.20.152:8085/websocket/chat/echo.do");
	    ws=new WebSocket("ws://localhost:8085/websocket/chat/echo.do");
	    
	    
	    ws.onopen=function(event){
	    	
	    	console.log("::::::::::::::::::::::::::connection success");
	    	
	    	if(event.data===undefined) return;
	        writeResponse(event.data);
	    };
	    
	    ws.onmessage=function(event){
	    	console.log(":::::::::connection success >>> :::::::::: 메시지 전송 버튼 클릭 :::::::");
	        writeResponse(event.data);
	    };
	    
	    ws.onclose=function(event){
	        writeResponse("종료하겠습니다.");
	    }
	}
	
	function send() {
		
		if('' == $('#messageinput').val()) {
			alert('내용을 입력해주세요.');
			return false;
		}
		
		var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
		ws.send(text);
		text="";
		$('#messageinput').val('');
	}
	
	function closeSocket(){
		ws.close();
	}
	
	function writeResponse(text){
// 		messages.innerHTML+="<br/>"+text;

		var sender;
		var content;

		var textArr = new Array();
		textArr = text.trim().split(":");
		
		for(var i = 0; i < textArr.length; i++) {
			console.log("i" + i + ">>>>" + textArr[i]);
			sender = textArr[0];
			content = textArr[1];
		}
			
		if(sender.trim() != '${REQUEST_DATA.SES_USERID}' && sender.trim() != 'admin') {
			
			$('#messages').append("<div style='margin-top:-11px;'><span style='font-weight:bold;'>" + sender + "</span><span class='yourBalloon'>" + content + "</span></div>" );
		
		} else if(sender.trim() != '${REQUEST_DATA.SES_USERID}' && sender.trim() == 'admin') {
			
			$('#messages').append("<div style='margin-top:-11px;'><span style='font-weight:bold; color:blue;'>" + sender + "</span><span class='yourBalloon'>" + content + "</span></div>" );
			
		} else if(sender.trim() == '${REQUEST_DATA.SES_USERID}' ) {
			
			$('#messages').append("<div class='balloonArea'><span class='myBalloon'>" + content + "</span></div><br>" );
			
		} 
		
		// 본인이 쓴글 아이디 노출 안되게끔!
		/* else if(sender.trim() == '${REQUEST_DATA.SES_USERID}' && sender.trim() != 'admin' ) {
			
			$('#messages').append("<div class='balloonArea'><span class='myBalloon'>" + content + "</span><span style='font-weight:bold;'>" + sender + "</span></div><br>" );
		}
		 */
		var top = $('#messages').prop('scrollHeight');
		$('#messages').scrollTop(top);
	}

</script>
