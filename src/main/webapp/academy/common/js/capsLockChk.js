//작성일 : 2015-07-24
//작성자 : 김학규
//비밀번호 입력시 CapsLock 감지해서 툴팁 표시해주는 js파일



$(function(){

	  $(window).resize(function(){
		  //updateBP($('#login_pw').offset().left+100, $('#login_pw').offset().top-50);//pageX, pageY 현재 마우스의 x,y좌표값 전송
	  });
	  
	  $('#login_pw').blur(function(){
		  hideBalloon();
	  });
	  
	
	
	//html 요소를 동적 생성 position:absolute
	var balloon = $("<div class='balloon' style='position:absolute'><img src='/academy/images/capslock_alert.png' alt='capsLock'/></div>").appendTo("body");
	balloon.hide();
	//말풍선의 좌표값 실시간 갱신 기준 : 마우스 커서
	function updateBP(x,y){
		balloon.css({left:x+15, top:y});
		//imgs.css({left:x+15, top:y+15});

	}

	//풍선 도움말 표시하는 함수
	function showBalloon(){
		balloon.stop(); //이미 애니메이션 중인경우 중지
		balloon.css("opacity",0).show();// 투명한상태로 표시
		balloon.animate({opacity:1},200);//0.2초후에 투명도를 1로
	}
	//풍선도움말을 숨기는 함수
	function hideBalloon(){
		balloon.stop();
		balloon.animate({opacity:0},200,function(){
			balloon.hide();
		});
		
	}

	$('#login_pw, #userPassword, #userPassword2, #newUnityPassword, #newUnityPasswordChk, #unityPassword').bind('keypress', function(e) {

		
    var keyCode  = 0;
    var shiftKey  = false;
    keyCode   = e.keyCode;
    shiftKey   = e.shiftKey;
    if (((keyCode >= 65 && keyCode <= 90)&& !shiftKey)||((keyCode >= 97 && keyCode <= 122)&& shiftKey)) {

		var element = $(this);//현재 실행중인 li를 담음
		var text = element.attr("title");// 선택된 li의 title을 담음
		element.attr("title","");//기존 title속성 초기화
		
		updateBP(element.offset().left+20, element.offset().top-34);//pageX, pageY 현재 마우스의 x,y좌표값 전송
		showBalloon();

    }else{
    	hideBalloon();
	}

   });

});