<%
/****************************************************
	system	: 일반교육 > 온라인과정 폼
	title	: 수강과정 목록
	summary	:	
	wdate	: 2016-09-19
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 

<script type="text/javascript" src="/academy/common/js/jwplayer-6/jwplayer.js"></script> 
<script type="text/javascript" src="/academy/common/js/jwplayer-6/jwplayer.html5.js"></script>

<script type="text/javascript">

$(document).ready(function(){

	jwplayer('player').setup({
		
		 file: "rtmp://112.175.102.51:1935/vod/mp4:160/01/01.mp4",
		primary: "flash",
		controls: true, //컨트롤바 
		width: "100%",
		aspectratio:"16:9", 
		events: {
				onSertupError: function(data){
					alert('data' + data);
				}
		
		}
	});
	
});

</script>
<body id="player">

	           
<!-- 					<div id="player"> -->
						<video  width="100%" height="200"  controls="controls"  id="vd"  style="display: none;">
							<source src="" type="video/mp4" >
						</video>
	

</body>


