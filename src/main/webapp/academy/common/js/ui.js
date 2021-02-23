
//const mq = window.matchMedia("(min-width:1024px)");

$(document).load($(window).bind("resize", checkPosition));

//메뉴gnb
$(document).ready(function(){
	checkPosition();
   //mq.addListener(widthChange);
   //widthChange(mq);
});

function checkPosition()
{
    if($(window).width() < 1024){
    	widthChange(false);
    } else {
    	widthChange(true);
    }
}

function widthChange(mq){
	$('body').attr('style', 'overflow-y')

	if(mq){
		$(".menuClose").trigger('click');
		$(".a_1dep").unbind();
    	//$(".menuClose").unbind('click');
    	$(".a_1dep").removeClass("selected");
    	$(".subMnWrap").hide();
    	
    	
		var $selector = $(".a_1dep"); 
		$selector.mouseover(function(){
            $(this).addClass("selected");
            $(".subMnWrap").show();
        });
		$selector.focus(function(){
            $(this).addClass("selected");
            $(".subMnWrap").show();
        });
		$selector.mouseout(function(){
            $(this).removeClass("selected");
        });
		$selector.blur(function(){
            $(this).removeClass("selected");
        });
        var gnbArea = $(".seominGnbWrap > .container");
        $(gnbArea).mouseleave(function(){
            $(".subMnWrap").hide();
        }); 
        $(".final_2dep").blur(function(){
        	$(".subMnWrap").hide();
        }); 
        
    }else{
    	$(".a_1dep").unbind();
    	$(".seominGnbWrap > .container").unbind('mouseleave');
    	$(".a_1dep").attr("href","#");
    	
        $("#btn-sidebar").click(function(){
            var contHeight = $("#Wrapper").height();
            $(".dimed").fadeIn(400);
            $(".formobile").removeClass("transL");
            $(".dimed").css("height",contHeight);
            $(".formobile").addClass("transR");
            
            
            $('body').attr('style', 'overflow-y:hidden')
            
            //$(".formobile").css("height",contHeight);
        });

        $(".a_1dep").click(function(){
            $(".a_1dep").removeClass("selected");
            $(".subMnWrap").hide();
            $(this).addClass("selected");
            $(this).next(".subMnWrap").show();
            
            
            
            
        });
        $(".menuClose").click(function(){
            $(".formobile").removeClass("transR");
            $(".formobile").addClass("transL");
            //$(".dimed").fadeOut(400);
            $(".dimed").hide();
            $('body').attr('style', 'overflow-y')
        });
    }
}


//더보기
$(document).ready(function(){
    $(".btnListmore").click(function(){
        $(".crdBoard").removeClass("hidden_row");
        $(this).hide();
    });
});

//tab
$(document).ready(function(){
    var tablink = $(".bluelineTab > li");
    $(tablink).click(function(){
        $(tablink).removeClass("active");
        $(this).addClass("active");
    });
});
// reply
/*$(document).ready(function(){
    var btnEdit = $(".reBtns > .btnedit");
    var btnok = $(".reEdit > .btn");
    var btnReply = $(".reBtns > .btnReply");
    $(btnEdit).click(function(){
        $(this).parent(".reBtns").hide();
        $(this).parent(".reBtns").siblings(".reEdit").show();
    });
    $(btnok).click(function(){
        $(this).parent(".reEdit").hide();
        $(this).parent(".reEdit").siblings(".reBtns").show();
    });
    $(btnReply).click(function(){
        $(this).parent(".reBtns").parent(".re_list").siblings(".li_answer").show();
    });
});*/

//설문 버튼

$(document).ready(function(){
    $(".btnSvy").click(function(){
        $(this).parent("li").siblings("li").children(".btnSvy").removeClass("active");
        $(this).addClass("active");
    });
});


$(document).ready(function(){
    var headH = $(".semin_header").height();
    var gnbH = $(".gnbposi").height();
    var footerH = $(".footerWrap").height();
    var winH = $(window).height();
    var ContH = winH-footerH-headH-gnbH;
    $("#Subcontent").css("min-height",ContH);
    $(window).resize(function(){
        var headH = $(".semin_header").height();
        var gnbH = $(".gnbposi").height();
        var footerH = $(".footerWrap").height();
        var winH = $(window).height();
        var ContH = winH-footerH-headH-gnbH;
        $("#Subcontent").css("min-height",ContH);
    });
});
