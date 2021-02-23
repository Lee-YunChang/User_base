//달력 포맷 정의 
var dateFormat={
	 dayNamesMin:['일','월','화','수','목','금','토'],
	 monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	 showMonthAfterYear: true, //연월 순서로 보여줌
	 changeMonth: true, //월을 셀렉트박스로 표현
	 changeYear: true, //년을 셀렉트박스로 표현
	 dateFormat: "yy-mm-dd",
	 buttonImage:"/images/mngr/btn_cal.png"
		 
};	


$(function () {
	
	/* 게시판 마우스 오버 */
	$('.ad_bbs_list table tbody tr').hover(function() {
		$(this).addClass('ad_bbs_hover');
	}, function() {
		$(this).removeClass('ad_bbs_hover');
	});
	
	
	/* 셀렉트박스 */
	//$(".ad_tb_select").selectbox();
	
	//$('input[type=radio]').ezMark();
	
	
	/* 달력 */
	$('.ad_calendar').click(function() {
		$('#comRegDate').addClass('ad_datepicker_calendar');
	});
	
	$( ".ad_calendar" ).datepicker({
		dateFormat: 'yy-mm-dd',
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		autoSize: "false",
		showOn: "both",
		yearRange: 'c-200:c+8',
	  	buttonImageOnly: true,
	  	buttonImage: "/academy/images/ico_calendar.png"
	});
	
	
	$.fn.valueEmpty = function(msg) {
		
		if ($.trim($(this).val()).length < 1) {
			if(msg != undefined){
				alert(msg);
				$(this).focus();
			}
			return true;
		} else {
			return false;
		}
	};
	
});


var initPage = function(){
	
	/**
	 * $location 	: 상단 경로 영역 (객체)
	 * initUrl		: 현재 URL 정보
	 * ctxPath		: 웹루트 경로
	 * locationPath	: 상단 경로 정보
	 */
	var $location		= $('p[class="loc"]').not("#separate");
	var initUrl			= $.trim($('#initPageData #commonInitUrl').text());
	var locationPath	= $('#initPageData #commonLocationPath').html();
	
	var  godoPath = $('#godoPath').val();
	
	
	//alert($.trim(locationPath));
	
	// 상단 경로 정보가 있으면 표시해준다.
	if( $.trim(locationPath) != '' ){
		$location.html(
			'<a href="' + godoPath + '/main.do"><img src="/academy/images/ic_home.gif" alt="홈으로" /></a> > '
			+ locationPath
		);
	}
	
	// 상단 메뉴
	/*
	$('.topMenu1Btn').on('mouseenter', function(e){
		var $topMenu	= $(e.currentTarget);
		var index		= $topMenu.parent().index(); 
		
		$('.topMenu1Btn').removeClass('on');
		$('.topMenu1Btn:eq(0)').removeClass('on1');
		$('.topMenu1Btn + .dep_w').addClass('dn');
		$('.dep2', 'ul[class^="dep"]').addClass('dn');
		
		$topMenu.addClass(( index == 0 ) ? 'on1' : 'on');
		$('+ .dep_w', $topMenu).removeClass('dn');
		
		$('a', $topMenu.parent()).each(function(){
			var $a		= $(this);
			var depth	= $a.attr('menulevel');
			
			
			//console.log(initUrl);
			
			if( initUrl == $.trim($a.attr('href')) && $.trim($a.attr('href')) != '' ){
				$a.addClass('dep' + depth + 'on');
				selectTopMenu($a.parent().parent());
			}
		});
	});
	
	$('.dep1').on('mouseleave', function(e){
		$('.topMenu1Btn').removeClass('on');
		$('.topMenu1Btn:eq(0)').removeClass('on1');
		$('.topMenu1Btn + .dep_w').addClass('dn');
	});
	
	
	$('.subMenuBtn').on('mouseenter', function(e){
		var $topSubMenu	= $(e.currentTarget);
		var $parent		= $topSubMenu.parent().parent();
		var menuLevel	= parseInt($topSubMenu.attr('menulevel'), 10);
		
		if( menuLevel >= 2 && menuLevel <= 4 ){
			$('.' + $parent.attr('class') + ' a').removeClass('dep' + menuLevel + 'on');
			$('a:eq(0)', $parent.parent()).addClass('dep' + (menuLevel - 1) + 'on');
			$('.dep' + (menuLevel + 1)).removeClass('dep' + (menuLevel + 1) + 'on');
			$topSubMenu.addClass('dep' + menuLevel + 'on');
			
			$('.dep' + (menuLevel + 1)).addClass('dn');
		}
		
		$('+ .under3MenuBtn', $topSubMenu).removeClass('dn');
	});
	
	$('.subMenuBtn').on('mouseleave', function(e){
		var $topSubMenu	= $(e.currentTarget);
		var menuLevel	= parseInt($topSubMenu.attr('menulevel'), 10);
		
		if( menuLevel >= 2 && menuLevel <= 4 ){
			$topSubMenu.removeClass('dep' + menuLevel + 'on');
		}
	});
	*/
	
	// 좌측 메뉴 기본 세팅을 한다.
	//$('.ldep3').hide();
	/*$('ul[class^="ldep"] li a').on('click', function(){
		var $menu	= $(this);
		var $next	= $menu.next();
		var depth	= parseInt($menu.parent().parent().attr('class').replace('ldep', ''), 10);
		
		if( $next.is('ul') ){
			if( $next.is(":visible") ){
				$menu.removeClass('now');
				
				$('.ldep' + (depth + 1) + ':visible').slideUp(300);
				return false;
			}else if( !$next.is(":visible") ){
				$('a', $menu.parent().parent()).removeClass('now');
				$menu.addClass('now');
				
				$('.ldep' + (depth + 1) + ':visible').slideUp(300);
				$next.slideDown(300);
				
				return false;
			}
		}
	});*/
	
	// 좌측 메뉴를 선택해준다.
	/*$('.lnb a').each(function(){
		var $a = $(this);
		
		if( initUrl == $.trim($a.attr('href')) ){
			$a.addClass('now');
			selectLeftMenu($a.parent().parent());
		}
	});*/
};


var selectTopMenu = function( obj ){
	if( obj.is('ul') ){
		var depth = parseInt(obj.attr('class').replace('dep', ''), 10);
		
		if( depth > 2 ){
			$('a:eq(0)', obj.parent()).addClass('dep' + (depth - 1) + 'on');
			obj.removeClass('dn');
			
			selectTopMenu(obj.parent().parent());
		}
	}
};

/**
 * ajax 공통 모듈
 * url : 
 * data :
 * dataType : json / html / xml / text
 * callback : 콜백함수
 */	
function ajaxSubmit(url, data, dataType, callback){
	
	$.ajax({
		url : url,
		data : data,
		dataType : dataType,
		type : 'POST',
		success : function(result) {
			callback(result);
		},
		error : function(e) {
			alert("error :" + e.responseText);
		}
	});	
	
}

/**
 * ajax 공통 모듈
 * url : 
 * data :
 * dataType : json / html / xml / text
 * callback : 콜백함수
 */	
function ajaxSubmit2(url, data, dataType, callback){
	
	$.ajax({
		url : url,
		data : data,
		dataType : dataType,
		type : 'POST',
		async: false,
		success : function(result) {
			callback(result);
		},
		error : function(e) {
			alert("error :" + e.responseText);
		}
	});	
	
}

//오직 숫자만 입력 허용
function onlyNum2(id) {
	$('#'+id).numeric();
	$('#'+id).css("ime-mode","disabled");

	
}

//숫자, 알파벳만 허용
function onlyNumAlpha(id) {
	$('#'+id).numeric({allow:"abcdefghijklmnopqrstuvwxyz"});
	$('#'+id).css("ime-mode","disabled");

	
}


//매뉴얼 다운로드 
function downManualDoc(fileName) {
	if(fileName == "")
		return;
	var _fileDownFrm = document.fileDownFrm;
	_fileDownFrm.filepath.value = "";
	_fileDownFrm.filename.value = fileName;
	_fileDownFrm.orgfilename.value = fileName;
	_fileDownFrm.downType.value ="sd";	// 매뉴얼 다운로드
	_fileDownFrm.target = "hiddenDownloadFrame";
	_fileDownFrm.submit();
}


//준비중입니다.
function no_link(){
	alert("준비중입니다.");
}



//비밀번호
function fn_encrypt(str){
	return fn_encode(escape(str));
}

function fn_encode(input){
	var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	var output = "";
	var chr1,chr2,chr3;
	var enc1, enc2, enc3, enc4;
	var i =0;
	do{
		chr1 = input.charCodeAt(i++);
		chr2 = input.charCodeAt(i++);
		chr3 = input.charCodeAt(i++);
		enc1 = chr1 >> 2;
		enc2 = ((chr1 & 3) <<  4 | (chr2 >> 4));
		enc3 = ((chr2 & 15) <<  2 | (chr3 >> 6));
		enc4 = chr3 & 63;
		if(isNaN(chr2)){
			enc3 = enc4 =64;
		}else if(isNaN(chr3)){
			enc4 =64;
		}
		output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2) + keyStr.charAt(enc3) + keyStr.charAt(enc4);
		
	}while(i<input.length);
	return output;
}