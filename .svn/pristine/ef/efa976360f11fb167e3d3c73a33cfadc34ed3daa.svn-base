<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<!-- 201609, SangSangStory(C) namhoon Jo -->
<!DOCTYPE Html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, maximum-scale=1.0, user-scalable=yes" />
<title></title>
<script type="text/javascript" src="/academy/common/js/jwplayer-6/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/academy/common/js/jwplayer-6/jwplayer.js"></script>
<script type="text/javascript" src="/academy/common/js/jwplayer-6/jwplayer.html5.js"></script>


<!-- //팝업내용 -->

<script type="text/javascript">
var fileUrl = "";
$(document).ready(function(){

	$('title').text(opener.$('#goodname').val() + "(맛보기 영상)" );
	
	
	
	var deviceChk = "";

	var agent = navigator.userAgent.toLowerCase();
	var isIOS = (agent.indexOf("iphone")>-1||agent.indexOf("ipad")>-1||agent.indexOf("ipod")>-1);
	var isANDROID = (agent.match('android') != null);
	var isMSIE80 = (agent.indexOf("msie 6.0")>-1||agent.indexOf("msie 7.0")>-1||agent.indexOf("msie 8.0")>-1);

	
	if (isANDROID || isIOS) {
		$('#vd').show();
		var videoSeek = document.getElementById('vd');
		videoSeek.play();
		
		
	} else {
		//fileUrl = "rtmp://112.175.102.51:1935/vod/mp4:intro/intro.mp4";
		
		$('.jp-no-solution').show();
		 jwplayer('player').setup({
			provider: "rtmp",
			file: "rtmp://112.175.102.51:1935/vod/mp4:"+$('#courseno').val()+"/sample.mp4",
			controls: true, //컨트롤바 
			width: "100%",
			//height: "100%",
			autostart:true,
			aspectratio:"16:9", 
			fallback:true,
			events: {
					onSertupError: function(data){
						alert('error' + data);
					}
			
			}
		});
	}
});


</script>


</head>
<!-- //팝업타이틀 -->
<body>
<form action="">
	<input type="hidden" name="courseno" id="courseno" value="${REQUEST_DATA.courseno}">
</form>

<!-- 팝업내용 -->
 <div id="player">
 <video  width="100%" height="300"  controls="controls"  id="vd"  style="display: none;"> 
	 <source src="http://112.175.102.51:1935/vod/_definst_/${REQUEST_DATA.courseno}/sample.mp4/playlist.m3u8" type="video/mp4" >
</video>
</div>

<div class="jp-no-solution" style="display: none;">
			<span>Update Required</span>
			미디어를 재생하려면 브라우저를 최신 버전으로 업데이트하거나 플래시 플러그인을 업데이트 해야합니다.<a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
		</div>
</body>
</html>




