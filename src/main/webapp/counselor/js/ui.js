// JavaScript Document

var win_w = 0;

$(document).ready(function(){
//    init()
    leftNav();
    win_w = $(window).width()
    revNav()

})
$(window).resize(function(){
    win_w = $(window).width()
    revNav()
});
function revNav(){

    $('#menuArea .btnCLose').on('click',function(){
        $('#menuArea').removeClass('active')
    })
    $('.gnb>ul>li').on('mouseover',function(){
        if (win_w >= 1024){
            var indexNum = $('.gnb>ul>li').index(this)
            $('#header').addClass('active')
            $('.gnb>ul>li>ul').slideDown(100);
            $('.gnb .arrow').stop().css({marginLeft:indexNum*135}).addClass('active');
            return false;
        }

    })
    $('#header').on('mouseleave',function(){
        if (win_w >= 1024){
            $('#header').removeClass('active')
            $('.gnb>ul>li>ul').slideUp(100);
            $('.gnb .arrow').removeClass('active');
            return false;
        }
    })
    $('.gnb>ul>li>a').on('click',function(){
        if (win_w < 1024){
            $(this).parent().addClass('active')
            $(this).next().slideDown(200);
            $(this).parent().siblings('li').removeClass('active')
            $(this).parent().siblings('li').find('ul').slideUp(200)
            return false;
        }

    })

}

//if()

function leftNav() {
    $('#header .mobMenu .btnMenu').on('click',function(){
        $('.menuWrap').addClass('active')
    })
    $('.mMenuBLock .closeMenu').on('click',function(){
        $('.menuWrap').removeClass('active')
    })
}


function init(){
    $('#header .topUtil .searchBtn').on('click',function(){
        $('#header .searchSub').toggle();
        return false;
    })
    $("[data-role='toggleList']>li>a").on('click',function(){
        $(this).next().slideToggle(200).parent().toggleClass('active');
        $(this).parent().siblings('li').removeClass('active').find('ul').slideUp(200);
        return false;
    })
    $('.listType01 dt a').on('click',function(){
        $(this).parent().addClass('active')
        $(this).parents().siblings('dl').find('dt').removeClass('active')
        return false;
    })
    $('.bibleListHeader .btnHead .openPlayer').on('click',function(){
        $('.bibleListHeader .playerArea').slideToggle(200)
        return false;

    })
    $("#readCon").change(function(){
        if($("#readCon").is(":checked")){
            $('.readContent').addClass('active')
        }else{
            $('.readContent').removeClass('active')
        }
    });


}
var popName = '';
var overay = $('<div class="overay-layer"></div>')
var overay_sec = $('<div class="overay-layer-sec"></div>')
function layer_init(name){
    popName = name;
    var layer = $('.popupWrap[data-role="'+ name +'"]');
//    var layer_w = -layer.outerWidth()/2;
//    var layer_h = -layer.outerHeight()/2;
    overay.appendTo('.lightBoxArea').fadeIn() // 11
    layer.fadeIn()
//
//    if($('.popupLayer.active').size()>=2){
//        overay_sec.appendTo('.popupWrap').fadeIn()
//    }else if($('.popupLayer.active').size()===1){
//        overay.appendTo('.popupWrap').fadeIn()
//    }
    return false;
}

function layer_close(e){
    $(overay).fadeOut(function(){
        $(overay).remove();
    })
    $(e).parents('.popupWrap').fadeOut()
    return false;
}

