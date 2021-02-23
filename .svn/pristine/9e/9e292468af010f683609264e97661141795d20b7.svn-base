<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
    subject	: [공통] > 마이페이지 > LEFT 영역
    summary	: LEFT 영역
    author	: SANGS
    date	: 2015-06-01
****************************************/
%>
<script type="text/javascript">
    $(document).ready(function(){
    	
    	// 클래스 데스크 필수 파라미터 쿠키 저장
		if ($("#paramCourseNo").val() != '') {
			$.cookie('classdeskCookieParamCourseNo','',{expires:-1, path:'/'});
			$.cookie('classdeskCookieParamcSeqNo','',{expires:-1, path:'/'});
			$.cookie('classdeskCookieParamcUserNo','',{expires:-1, path:'/'});
			$.cookie('classdeskCookieParamUserNo','',{expires:-1, path:'/'});
			$.cookie('classdeskCookieSeqTitle','',{expires:-1, path:'/'});
			
			$.cookie('classdeskCookieParamCourseNo',"<c:out value="${REQUEST_DATA.paramCourseNo}"></c:out>",{expires:7, path:'/'});
			$.cookie('classdeskCookieParamcSeqNo',"<c:out value="${REQUEST_DATA.paramcSeqNo}"></c:out>",{expires:7, path:'/'});
			$.cookie('classdeskCookieParamcUserNo',"<c:out value="${REQUEST_DATA.paramcUserNo}"></c:out>",{expires:7, path:'/'});
			$.cookie('classdeskCookieParamUserNo',"<c:out value="${REQUEST_DATA.userNo}"></c:out>",{expires:7, path:'/'});
			$.cookie('classdeskCookieSeqTitle',"<c:out value="${REQUEST_DATA.seqTitle}"></c:out>",{expires:7, path:'/'});
		}
    	
		$('.ul_gnb').find('.gnb_<c:out value="${menu_nm}"/>').addClass('on');
		$('.leftNavi').find('.lnb_<c:out value="${lnb_menu}"/> a').addClass('active');
    });
    
    function fnLeftMenuMove(url){
    	$("#leftMenuFrm").attr("action", url);
    	$("#leftMenuFrm").attr('target', '');
    	if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
    		if(url == '/classdesk/user/progress/treeMain.do') {
    			$("#leftMenuFrm").attr("action", '/classdesk/user/progress/treeList.do');
    		}
    	}
    	$("#leftMenuFrm").submit();
    }
    
    // 온라인학습 메뉴 이동
    function fnOnlineMenuMove(purl) {
    	var gsWin = window.open('about:blank','online');

		var url = purl;
		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
			url =  '/classdesk/user/progress/treeList.do';
		}  
		else {
			url =  '/classdesk/user/progress/treeMain.do';
		}
        $("#leftMenuFrm").attr('action' , url);
        $("#leftMenuFrm").attr('target', 'online');
        $("#leftMenuFrm").submit();
    }
    
</script>
<form name="leftMenuFrm" id="leftMenuFrm" action="" method="post">
	<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
	<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>"/>
	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>"/>
	<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="<c:out value="${REQUEST_DATA.paramcUserNo}"/>"/>
	<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
	<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
</form>
<div class="leftMn">
    <h1 class="ltTitle">
        <span class="bold">학습하기</span>
    </h1>
    <nav>
        <ul class="leftNavi">
            <li class="lnb_myCourse"><a href="#none" onclick="fnLeftMenuMove('/classdesk/main/main.do'); return false;" title="강의실홈">강의실 홈</a></li>
			<c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,0,1) == 1 }">
	    		<li class="lnb_progress" ><a href="#none" onclick="fnLeftMenuMove('/classdesk/user/progress/treeList.do'); return false;"title="온라인학습">온라인학습</a></li>
	    	</c:if>
	    	<c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,2,3) == 1 }">
	    		<li class="lnb_tutorexam"><a href="#none" onclick="fnLeftMenuMove('/classdesk/user/exam/list.do'); return false;" title="시험">시험</a></li>
	    	</c:if>
	    	<c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,3,4) == 1 }">
	    		<li class="lnb_tutorpoll"><a href="#none" onclick="fnLeftMenuMove('/classdesk/user/poll/list.do'); return false;" title="설문">설문</a></li>
	    	</c:if>
	    	<c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,4,5) == 1 }">
	    		<li class="lnb_bbslist1"><a href="#none" onclick="fnLeftMenuMove('/classdesk/bbs/list.do?select=list1'); return false;" title="공지사항">공지사항</a></li>
	    	</c:if>
	        <c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,5,6) == 1 }">
	    		<li class="lnb_bbslist2"><a href="#none" onclick="fnLeftMenuMove('/classdesk/bbs/list.do?select=list2'); return false;" title="자료실">자료실</a></li>
	    	</c:if>
        </ul>
    </nav>
</div>