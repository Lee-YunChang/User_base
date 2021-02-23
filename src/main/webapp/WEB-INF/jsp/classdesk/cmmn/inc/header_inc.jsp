<%--
    Description : 아카데미 헤더
     
    Modification Information
    수정일     수정자         수정내용
    -------     -----------------------------------
    2015.04.08  SANGS           최초작성

--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8;" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <link rel="stylesheet" type="text/css" href="/classdesk/common/css/jquery-ui-1.9.0.custom.css"/>
    <link rel="stylesheet" type="text/css" href="/classdesk/common/css/classdesk.css" />
        
    <script type="text/javascript" src="/classdesk/common/js/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery-ui-1.9.0.custom.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery.cookie.js"></script> 
    <script type="text/javascript" src="/common/js/makePCookie.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/jquery.countdown.js"></script>
    <script type="text/javascript" src="/common/js/sangs_core.js"></script>
    <script type="text/javascript" src="/classdesk/common/js/keysecurity.js"></script>
    
    
    <title>::: 상상스토리 사용자포털 강의실 :::</title>
    
    <script type="text/javascript">
    //<![CDATA[
    var menuCd = "<c:out value='${topMenuCode}'/>";  // 상단 메뉴코드
    //]]>
    
    jQuery(document).ready(function() {
    
        //상단 메뉴 on / off 처리
        if(jQuery("#gnb").find("ul li span").hasClass(menuCd)){
            jQuery("."+menuCd)
                .parent()
                .addClass(jQuery("."+menuCd).parent().attr("class")+" on");
        }
        
     
        $.browser.chrome = $.browser.webkit && !!window.chrome;
        $.browser.safari = $.browser.webkit && !window.chrome;
             
        var w1 = parseInt(screen.width);
        var h1 = parseInt(screen.height);
        
        if($.browser.chrome == true) {
            window.resizeTo(w1, h1); 
        } else if($.browser.mozilla == true) {
            // alert("mozilla");
        }
        /*
        else if($.browser.msie == true) {
         //   alert("IE");
        }
        else if($.browser.safari == true) {
         // alert("safari");
        }   
        else if($.browser.opera == true) {
         //   alert("Opera");
        }
        */
    });
    
    </script>
</head>
<body>

<iframe id="_cm" name="_cm" title="hidden command page" style="display:none"></iframe>

<%--
<b>REQUEST_DATA</b><br/>
REQUEST_DATA.SES_GRADENO : ${REQUEST_DATA.SES_GRADENO}<br/> 
USERGRADENO : ${USERGRADENO}<br/>
SUPERGRADENO : ${SUPERGRADENO}<br/>
REQUEST_DATA.SES_GRADENO : ${REQUEST_DATA.SES_GRADENO}<br/>
TUTORGRADENO : ${TUTORGRADENO}
<br/>
<br/>
<b>COMMON_DATA</b><br/>
COMMON_DATA.CLASS_DESK : ${COMMON_DATA.CLASS_DESK}<br/>
--%>

<!-- header -->
<div id="header" class="clearfix">
    <!-- tnb영역 -->
    
    <!-- //tnb영역 --> 
	<a href="#content" class="skip" title="본문 바로가기">본문 바로가기</a>
	
	<a href="#" class="menu_toggle" style="display: none;" title="메뉴 열기"><img src="/classdesk/images/menu_toggle.png" alt="메뉴 열기" /></a>
	
    <!-- gnb메뉴 -->
    <div id="gnb" class="menu_toggle_close">
    
        <!-- 사용자 gnb -->
        <%-- <c:if test="${(REQUEST_DATA.SES_GRADENO eq USERGRADENO) or (REQUEST_DATA.SES_GRADENO eq COMPMNGRGRADENO)  }"> --%>
        <!-- gnb메뉴의 on/off 효과는 css로 처리됨 (on상태일 경우 a태그 class="on" 추가) -->
        <!-- 접근성 인증을 위한 메뉴별 텍스트 반드시 작성할 것 (gnb_menu1,2... 은 순서 구분을 위한 용도 > 차후 키보드 컨트롤 활용) -->
        <ul>
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/main.do?from=E310" class="gnb_menu0" title="강의실 메인"><span class="main">강의실 메인</span></a>
            </li>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,0,1) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/user/progress/treeList.do?from=E320" class="gnb_menu1" title="온라인학습"><span class="study">온라인학습</span></a>
            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,2,3) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/user/exam/list.do?from=E340" class="gnb_menu3" title="시험"><span class="test">시험</span></a>
            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,3,4) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/user/poll/list.do?from=E360" class="gnb_menu5" title="설문"><span class="survey">설문</span></a>
            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,4,5) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/bbs/list.do?pbcateno=<c:out value="${cfn:getProperty('Globals.bbsPcateClassNotice')}"/>&bcateno=<c:out value="${cfn:getProperty('Globals.bbsBcateClassNotice')}"/>&from=E370" class="gnb_menu6" title="공지사항"><span class="notice">공지사항</span></a>
            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,5,6) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/bbs/list.do?pbcateno=<c:out value="${cfn:getProperty('Globals.bbsPcateClassData')}"/>&bcateno=<c:out value="${cfn:getProperty('Globals.bbsBcateClassData')}"/>&from=E380" class="gnb_menu7" title="자료실"><span class="data">자료실</span></a>
            </li>
            </c:if>
        </ul>
        <%--</c:if>
        
        <!-- 관리자 gnb -->
        
        <c:if test="${REQUEST_DATA.SES_GRADENO eq SUPERGRADENO ||  REQUEST_DATA.SES_GRADENO eq TUTORGRADENO}">
        <!-- gnb메뉴의 on/off 효과는 css로 처리됨 (on상태일 경우 a태그 class="on" 추가) -->
        <!-- 접근성 인증을 위한 메뉴별 텍스트 반드시 작성할 것 (gnb_menu1,2... 은 순서 구분을 위한 용도 > 차후 키보드 컨트롤 활용) -->
        <ul>
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/main.do" class="gnb_menu0" title="강의실 메인"><span class="main">강의실 메인</span></a>
            </li>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,0,1) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/tutor/progress/tree_list.do" class="gnb_menu1" title="온라인 학습"><span class="study">온라인학습</span></a>
            </li>
            </c:if>
            
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,7,8) == 1}">
            <li>
            <a href="<c:out value="${ctx}"/>/classdesk/tutor/discuss/list.do?pbcateno=<c:out value="${cfn:getProperty('Globals.bbsPcateClassDiscuss')}"/>&bcateno=<c:out value="${cfn:getProperty('Globals.bbsBcateClassDiscuss')}"/>" class="gnb_menu8" title="토론"><span class="discuss">토론</span></a>
            </li>
            </c:if> 
            
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,1,2) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/tutor/report/list.do" class="gnb_menu2" title="과제"><span class="task">과제</span></a>
            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,2,3) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/tutor/exam/list.do" class="gnb_menu3" title="시험"><span class="test">시험</span></a>
            </li>
            </c:if>
            <li>
            <c:choose>
                <c:when test="${COMMON_DATA.OPENTYPE eq 'A'}">
                    <a href="<c:out value="${ctx}"/>/classdesk/tutor/result/result_always_form.do" class="gnb_menu4" title="성적"><span class="result">성적</span></a>
                </c:when>
                <c:otherwise>
                    <a href="<c:out value="${ctx}"/>/classdesk/tutor/result/result_form.do" class="gnb_menu4" title="성적"><span class="result">성적</span></a>
                </c:otherwise>
            </c:choose>
            </li>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,4,5) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/tutor/poll/list.do" class="gnb_menu5" title="설문"><span class="survey">설문</span></a>
            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,5,6) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/bbs/list.do?pbcateno=<c:out value="${cfn:getProperty('Globals.bbsPcateClassNotice')}"/>&bcateno=<c:out value="${cfn:getProperty('Globals.bbsBcateClassNotice')}"/>" class="gnb_menu6" title="공지사항"><span class="notice">공지사항</span></a>
            </li>
            </c:if>
            <c:if test="${fn:substring(COMMON_DATA.CLASS_DESK,6,7) == 1}">
            <li>
                <a href="<c:out value="${ctx}"/>/classdesk/bbs/list.do?pbcateno=<c:out value="${cfn:getProperty('Globals.bbsPcateClassData')}"/>&bcateno=<c:out value="${cfn:getProperty('Globals.bbsBcateClassData')}"/>" class="gnb_menu7" title="자료실"><span class="data">자료실</span></a>
            </li>
            </c:if>
        </ul>
        </c:if> --%>
        
        <a href="#" class="menu_toggle_close" style="display:none;" title="메뉴 열기"><img src="/classdesk/images/menu_toggle_close.png" alt="메뉴 열기" /></a>
        
    </div>
    
    
    <!-- //gnb메뉴 -->
    <div class="header-line"></div>
</div>
<!-- //header -->
<!-- 개설과목명 -->

<!-- content -->
<div id="content">  