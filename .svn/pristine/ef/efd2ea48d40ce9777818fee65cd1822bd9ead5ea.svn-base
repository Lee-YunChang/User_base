<%--
    Description : 지식터 > 교육자료
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.07.07  이진영           최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%-- <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> --%>


<html lang="ko">
<head>
<meta charset="utf-8">
<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
<link type="text/css" href="/academy/common/skin/blue.monday/css/jplayer.blue.monday2.css" rel="stylesheet" />
<script type="text/javascript" src="/academy/common/js/jquery.jplayer.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	
	var height = screen.height;
	var width= screen.width ;
	//window.resizeTo(width, height);
	//window.onresize = new Function("window.resizeTo("+width+","+ height+")");
	
	var fullscreenAt = false;
	
    // 맛보기강의
    var sampleYn = $("#sampleYn").val();
    //var perviewUrl =  'http://hmredu.sangs.kr:9880' + $("#contentsUrl").val();
    //var contentsImgUrl = 'http://hmredu.sangs.kr:9880' + $("#contentsImgUrl").val();
    var perviewUrl = $("#contentsUrl").val();
    var contentsImgUrl = $("#contentsImgUrl").val();
    
    if(perviewUrl != '' && $("#sampleYn").val() == 'Y') {
	    startPlay1(perviewUrl, contentsImgUrl, width - 100 , height - 100 ); 
	    
	    //영상 롤오버시 바 활성화 처리
	    $(".jp-audio, video, .jp-jplayer img").mouseenter(function() { 
			$(this).find(".jp-type-single").stop(true, true).fadeIn();
		}).mouseleave(function() {
			$(this).find(".jp-type-single").stop(true, true).fadeOut();
		});
	    
	    $(".jp-full-screen").click(function() {
			if(fullscreenAt) {
				$(".jp-audio .jp-type-single").css("position", "relative"); 
				$(".jp-audio .jp-type-single").css("bottom", "0px");
				$(".showControl").css('display' , 'block');
				$(".showControl").hide();
				fullscreenAt = false;
			}else {
				$(".jp-audio .jp-type-single").css("position", "absolute"); 
				$(".jp-audio .jp-type-single").css("bottom", "60px");
				$(".showControl").css('display' , 'block');
				$(".showControl").show();
				fullscreenAt = true;
			}
		});
	    
		$(window).keyup(function(e) {
			if(e.keyCode==27) { 
				$(".jp-audio .jp-type-single").css("position", "relative"); 
				$(".jp-audio .jp-type-single").css("bottom", "0px"); 
				$(".showControl").css('display' , 'block');
				$(".showControl").show();
				fullscreenAt = false; 
			}
		});
	       
	    
		function startPlay1(file, image, width, height){
			var videoArea1 ='';
				
			$("#jquery_jplayer_1").jPlayer({
				ready: function () {
					$(this).jPlayer("setMedia", {
					m4v: file,
					poster: image
					});
				},
	    		size: {
	    			 width: width, 
	   		  	 height: height
	 			   },
	    		   supplied: "m4v, ogv",
	    		  swfPath: "/academy/common/js/",
	    		  cssSelectorAncestor: "#jp_container_1",
	    		   useStateClassSkin: true,
	    			autoBlur: false,
	    			smoothPlayBar: true,
	    			keyEnabled: true,
	    			remainingDuration: true,
	    			toggleDuration: true
	   		  });
	   		  //$("#jp_poster_0").attr("style", "width:613px; height: 350px; margin:Auto; ");
		}
    }
    var videoTitle = $('#videoTitle').val();
    
	$('#jquery_jplayer_1').children().each(function(index, element) {
	 	if($(this).attr("id") == "jp_poster_0") { 
	 		$(this).attr("alt",videoTitle+"의 썸네일 이미지 ");
	 		
		} else if($(this).attr("id") == "jp_video_0"){ 
			$(this).attr("title",videoTitle+"의 동영상");
		}
	});
});

</script>
</head>
<title>${REQUEST_DATA.title}</title>
<form name="frm" id="frm" action="" method="post">
	<input type="hidden" id="contentsUrl" value="${REQUEST_DATA.contentsUrl}" />
	<input type="hidden" id="contentsImgUrl" value="${REQUEST_DATA.contentsImgUrl}" />
	<input type="hidden" id="videoTitle" name="videoTitle" value="${REQUEST_DATA.videoTitle}">
	<input type="hidden" id="imgTitle" name="imgTitle" value="${REQUEST_DATA.imgTitle}">
	<input type="hidden" id="sampleYn" value="Y"/>

<div class="contents" id="sContents">
	<div class="movie-player">
		<!-- <img src="/academy/images/sub/test.png" alt="동영상 이미지"> -->
		<div class="video_frame" style="padding-top:18px">
			<span class="top"></span>
			<div class="middle" id="videoArea1" style="display:inline-block;">
				<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
					<div id="jquery_jplayer_1" class="jp-jplayer"></div>
					<div class="jp-type-single">
						<div class="jp-gui jp-interface">
							<div class="showControl" style="display:block;">
								<div class="jp-volume-controls">
									<button title="mute" class="jp-mute" role="button" tabindex="0">mute</button>
									<button title="max volume" class="jp-volume-max" role="button" tabindex="0">max volume</button>
									<div class="jp-volume-bar">
										<div class="jp-volume-bar-value"></div>
									</div>
								</div>
							</div>
							<div class="jp-controls-holder">
								<div class="jp-controls">
									<button title="play" class="jp-play" role="button" tabindex="0">play</button>
									<button title="stop" class="jp-stop" role="button" tabindex="0">stop</button>
								</div>
								<div class="showControl" style="display:block;">
									<div class="jp-progress">
										<div class="jp-seek-bar">
											<div class="jp-play-bar"></div>
										</div>
										<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
										<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
									</div>
								</div>
								<div class="jp-toggles">
									<button title="repeat" class="jp-repeat" role="button" tabindex="0">repeat</button>
									<button title="full screen" class="jp-full-screen" role="button" tabindex="0">full screen</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<span class="bottom"></span>											
		</div>
	</div><!-- player 영역 -->
</div><!-- //contents-->
</form>
</html>