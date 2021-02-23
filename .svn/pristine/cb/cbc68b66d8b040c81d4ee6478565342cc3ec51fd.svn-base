<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 201609, SangSangStory(C) namhoon Jo -->
<!DOCTYPE Html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, maximum-scale=1.0, user-scalable=yes" />
<title>상상스토리 사용자포털 홍보동영상</title>
<script type="text/javascript" src="/academy/common/js/jwplayer-6/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/academy/common/js/jwplayer-6/jwplayer.js"></script>
<script type="text/javascript" src="/academy/common/js/jwplayer-6/jwplayer.html5.js"></script>


<!-- //팝업내용 -->

<script type="text/javascript">
var fileUrl = "";
$(document).ready(function(){

	
	var deviceChk = "";

	var agent = navigator.userAgent.toLowerCase();
	var isIOS = (agent.indexOf("iphone")>-1||agent.indexOf("ipad")>-1||agent.indexOf("ipod")>-1);
	var isANDROID = (agent.match('android') != null);
	var isMSIE80 = (agent.indexOf("msie 6.0")>-1||agent.indexOf("msie 7.0")>-1||agent.indexOf("msie 8.0")>-1);

	
	if (isANDROID || isIOS) {
		$('#vd').show();
		var videoSeek = document.getElementById('vd');
		videoSeek.src = "http://112.175.102.51:1935/vod/_definst_/160/01/01.mp4/playlist.m3u8";
		videoSeek.play();
		
		
	} else {
		//fileUrl = "rtmp://112.175.102.51:1935/vod/mp4:intro/intro.mp4";
		
		$('.jp-no-solution').show();
		 jwplayer('player').setup({
			// provider: "rtmp",
			//file: "rtmp://112.175.102.51:1935/vod/mp4:99/01/01.mp4",
			 file: "rtmp://112.175.102.51:1935/vod/mp4:160/01/01.mp4",
			 //file: "http://112.175.102.51:9090/web/intro/intro.mp4",
			
			 /*modes:[
			        {type:"flash", src:"/academy/common/js/jwplayer-6/player.swf"}
			 
			        
			 ],
			 */
			 
			//file: "rtmp://112.175.102.51:2000/vod/mp4:intro/intro.mp4",
			//file: "http://116.67.74.75:2000/vod/1/01/01.mp4/playlist.m3u8",
			
			//flashplayer: "/academy/common/js/jwplayer-6/jwplayer.flash.swf",
			//rtmp : {
			//	bufferlength: 3 
			//},
			//file: "rtmp://110.93.25.36/sangs/mp4:ingun/1/01/01.mp4",
			
			/* 
			playlist:[{
				sources:[{
					file: "rtmp://116.67.74.75:1935/vod/mp4:1/01/01.mp4"
				}, {
					file: "http://116.67.74.75:1935/vod/1/01/01.mp4/playlist.m3u8"
				}
				]	
			}], */
			//file: "rtmp://116.67.74.75:1935/vod/mp4:1/01/01.mp4",
			//file: "http://112.175.102.51/vod/intro/intro.mp4",
			//file: "http://localhost:8080/01.mp4",
			//type: typeText, 
			//image: "images/bg.JPG",
			//mute: false,  
			primary: "flash",
			controls: true, //컨트롤바 
			width: "100%",
			//height: "100%",
			autostart:true,
			aspectratio:"16:9", 
			//fallback:true,
			events: {
					onSertupError: function(data){
						alert('data' + data);
					}
			
			}
		  
			
	
		});
	}

});


</script>


</head>
<!-- //팝업타이틀 -->
<body>
<!-- 팝업내용 -->
 <div id="player">
  <video  width="100%" height="300"  controls="controls"  id="vd"  style="display: none;"> 
	 <source src="" type="video/mp4" >
</video>
</div>

</body>
</html>




