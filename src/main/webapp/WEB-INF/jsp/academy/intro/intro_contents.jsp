<%--
    Description : 안전교육홍보실
     
    Modification Information
  	 수정일     수정자         수정내용
    -------     -----------------------------------
    2015.06.03  SANGS           최초작성

--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 

    <link type="text/css" href="/academy/common/skin/blue.monday/css/jplayer.blue.monday.css" rel="stylesheet" />
    <script type="text/javascript" src="/academy/common/js/jquery.jplayer.min.js"></script>
    
    <script type="text/javascript">
    
    $(document).ready(function(){
        initPage();
        
        // 홍보동영상 재생
        startPlay1("/edu-data/download/contents1.mp4", "/edu-data/download/contents1.jpg", "100%", "350");
        startPlay2("/edu-data/download/contents2.mp4", "/edu-data/download/contents2.jpg", "100%", "350");
        startPlay3("/edu-data/download/contents3.mp4", "/edu-data/download/contents3.jpg", "100%", "350");
        
        //영상 롤오버시 바 활성화 처리
        $(".middle").mouseenter(function() { 
        	$(this).find(".jp-audio").stop(true, true).fadeIn();
        }).mouseleave(function() {
        	$(this).find(".jp-audio").stop(true, true).fadeOut();
        });

        function startPlay1(file, image, width, height){
     		  var videoArea1 = 
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
	     			autoBlur: true,
	     			smoothPlayBar: true,
	     			keyEnabled: true,
	     			remainingDuration: true,
	     			toggleDuration: true
     		  });
     		  $("#jp_poster_0").attr("style", "width:613px; height: 350px; margin:Auto; ");
		}
        function startPlay2(file, image, width, height){
        	var videoArea2 = 
        		$("#jquery_jplayer_2").jPlayer({
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
	     		  cssSelectorAncestor: "#jp_container_2",
	     		   useStateClassSkin: true,
	     			autoBlur: false,
	     			smoothPlayBar: true,
	     			keyEnabled: true,
	     			remainingDuration: true,
	     			toggleDuration: true
  		  	});
        	$("#jp_poster_1").attr("style", "width:613px; height: 350px; margin:Auto;");
		}
        function startPlay3(file, image, width, height){
        	var videoArea3 = 
        		$("#jquery_jplayer_3").jPlayer({
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
	     		  cssSelectorAncestor: "#jp_container_3",
	     		   useStateClassSkin: true,
	     			autoBlur: false,
	     			smoothPlayBar: true,
	     			keyEnabled: true,
	     			remainingDuration: true,
	     			toggleDuration: true
  		  		});
        		$("#jp_poster_2").attr("style", "width:613px; height: 350px; margin:Auto;");
		}
        
		$('#GNB').find('.gnb_<c:out value="${menu_nm}"/>').addClass('on');
		$('#LNB ul').find('.lnb_<c:out value="${lnb_menu}"/>').addClass('on');

    });

    </script>
    
	<div class="contents-wrap">	
		
		<div class="sub-wrap">
			<!-- 왼쪽 메뉴 영역 -->
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_intro.jsp"%>
			<!-- // 왼쪽 메뉴 영역 -->
			
			<!-- 페이지 상단 타이틀 영역 -->
			<div id="Sub_Header" class="menu1">
				<div class="nav">
					<img src="/academy/images/ico_home.png" alt="Home" /><img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />교육안내<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />안전교육홍보실
				</div>
				<h3>안전교육홍보실</h3>
				<p>상상스토리은 다양한 화학사고 예방 교육콘텐츠를 제공합니다.</p>
			</div>
			<!-- // 페이지 상단 타이틀 영역 -->

			<div id="Contents" tabindex="-1">
			
				<!-- <img src="/common/images/preparing.png" alt="페이지 준비 중 입니다. 이용에 불편을 드려 죄송합니다. " /> -->
				
				<h5>유해화학물질 안전교육 홍보동영상</h5>
				<img src="/academy/images/intro_contents.png" alt="유해화학물질 안전교육에 대해 알아봅니다. 일상생활이나 유해화학물질을 다루는 직장에서 일어날 수 있는 사고 사례와 관련 화학물질의 특성 및 위험성 그리고 대처법에 안전이와 함께 알아봅니다." />
				<br/>
				 <div class="video_frame" style="padding-top:18px">
					<span class="top"></span>
					<div class="middle" id="videoArea1" style="height:325px !important; padding: 0 28px 20px 29px !important;">
					<div id="jquery_jplayer_1" class="jp-jplayer"></div>
						<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
						<div class="jp-type-single">
							<div class="jp-gui jp-interface">
								<div class="jp-volume-controls">
									<button title="mute" class="jp-mute" role="button" tabindex="0">mute</button>
									<button title="max volume" class="jp-volume-max" role="button" tabindex="0">max volume</button>
									<div class="jp-volume-bar">
										<div class="jp-volume-bar-value"></div>
									</div>
								</div>
								<div class="jp-controls-holder">
									<div class="jp-controls">
										<button title="play" class="jp-play" role="button" tabindex="0">play</button>
										<button title="stop" class="jp-stop" role="button" tabindex="0">stop</button>
									</div>
									<div class="jp-progress">
										<div class="jp-seek-bar">
											<div class="jp-play-bar"></div>
										</div>
										<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
										<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
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
					
					<span class="top"></span>
					<div class="middle" id="videoArea2" style="height:325px !important; padding: 0 28px 20px 29px !important;">
					<div id="jquery_jplayer_2" class="jp-jplayer" style="width:613px !important; margin:Auto;"></div>
						<div id="jp_container_2" class="jp-audio" role="application" aria-label="media player">
						<div class="jp-type-single">
							<div class="jp-gui jp-interface">
								<div class="jp-volume-controls">
									<button title="mute" class="jp-mute" role="button" tabindex="0">mute</button>
									<button title="max volume" class="jp-volume-max" role="button" tabindex="0">max volume</button>
									<div class="jp-volume-bar">
										<div class="jp-volume-bar-value"></div>
									</div>
								</div>
								<div class="jp-controls-holder">
									<div class="jp-controls">
										<button title="play" class="jp-play" role="button" tabindex="0">play</button>
										<button title="stop" class="jp-stop" role="button" tabindex="0">stop</button>
									</div>
									<div class="jp-progress">
										<div class="jp-seek-bar">
											<div class="jp-play-bar"></div>
										</div>
										<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
										<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
									</div>
									<div class="jp-toggles">
										<button title="repeat" class="jp-repeat" role="button" tabindex="0">repeat</button>
										<!-- <button class="jp-full-screen" role="button" tabindex="0">full screen</button>  -->
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					<span class="bottom"></span>
					
					<span class="top"></span>
					<div class="middle" id="videoArea3" style="height:325px !important; padding: 0 28px 20px 29px !important;">
					<div id="jquery_jplayer_3" class="jp-jplayer"></div>
						<div id="jp_container_3" class="jp-audio" role="application" aria-label="media player">
						<div class="jp-type-single">
							<div class="jp-gui jp-interface">
								<div class="jp-volume-controls">
									<button title="mute" class="jp-mute" role="button" tabindex="0">mute</button>
									<button title="max volume" class="jp-volume-max" role="button" tabindex="0">max volume</button>
									<div class="jp-volume-bar">
										<div class="jp-volume-bar-value"></div>
									</div>
								</div>
								<div class="jp-controls-holder">
									<div class="jp-controls">
										<button title="play" class="jp-play" role="button" tabindex="0">play</button>
										<button title="stop" class="jp-stop" role="button" tabindex="0">stop</button>
									</div>
									<div class="jp-progress">
										<div class="jp-seek-bar">
											<div class="jp-play-bar"></div>
										</div>
										<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
										<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
									</div>
									<div class="jp-toggles">
										<button title="repeat" class="jp-repeat" role="button" tabindex="0">repeat</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					<span class="bottom"></span>
				</div>

			</div><!-- // Contents -->

		</div>
		
	</div>
	
	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->
