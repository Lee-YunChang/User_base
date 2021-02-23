<%@page import="java.net.HttpCookie"%>
<%
/****************************************
	subject	: [공통] 상단영역
	summary	: 상단영역
	author	: SANGS
	date	: 2016-05-01
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.sangs.session.UserSessionManager" %>
<%@ page import = "com.sangs.session.UserSessionVO" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="서민과 금융소비자 무료 온라인 교육 및 방문 금융교육, 종합상담사 양성, 1:1 재무상담 교육포털">
        <meta property="og:type" content="website">
		<meta property="og:title" content="상상스토리 사용자포털">
		<meta property="og:description" content="서민과 금융소비자 무료 온라인 교육 및 방문 금융교육, 종합상담사 양성, 1:1 재무상담 교육포털">
		<meta property="og:image" content="/academy/images/common/top_logo.png">
		<meta property="og:url" content="http://edu.kinfa.or.kr">
        <title>상상스토리 사용자포털 </title>
        <link rel="canonical" href="http://edu.kinfa.or.kr">
        <link rel="shortcut icon" href="/academy/images/main/CI2.png">
		<link rel="apple-touch-icon" href="/academy/images/main/CI2.ico" type="image/x-icon">
        <link rel="stylesheet" href="/academy/common/css/mobile.css" media="all">
        <link rel="stylesheet" href="/academy/common/css/laypop.css" media="all">
        <link rel="stylesheet" href="/academy/common/css/style.css" media="all">
        <link rel="stylesheet" href="/academy/common/fonts/font.css" media="all">
        <link rel="stylesheet" href="/academy/common/css/bootstrap_jy.css" media="all">
        <link rel="stylesheet" href="/academy/common/css/jquery-ui.min.css" media="all">
    	<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
        <script type="text/javascript" src="/academy/common/js/jquery.bxslider.min.js"></script>
        <script type="text/javascript" src="/academy/common/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/academy/common/js/jquery.simple-sidebar.min.js"></script>
		<script type="text/javascript" src="/academy/common/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="/academy/common/js/jquery.jqtransform.js" ></script>
		<script type="text/javascript" src="/academy/common/js/jquery.alphanumeric.pack.js"></script>  
		<script type="text/javascript" src="/academy/common/js/jquery.cookie.js"></script> 

		<script type="text/javascript" src="/academy/common/js/lodash/lodash.js" charset="utf-8"></script>
		<script type="text/javascript" src="/academy/common/js/underscore/underscore.string.js" charset="utf-8"></script>
		<script type="text/javascript" src="/academy/common/smarteditor/js/HuskyEZCreator.js"></script>
		<script type="text/javascript" src="/common/js/makePCookie.js"></script>
		<script type="text/javascript" src="/academy/common/js/academy.js"></script>
        <script type="text/javascript" src="/academy/common/js/common.js"></script>
        <script type="text/javascript" src="/academy/common/js/ui.js"></script>
        <script type="text/javascript" src="/common/js/sangs_core.js"></script>
<c:set var="isLoginAt"><c:out value="${REQUEST_DATA.SES_ISLOGIN}"/></c:set>
<c:set var="isUserNo"><c:out value="${REQUEST_DATA.SES_USERNO}"/></c:set>
<%
	String user_id = UserSessionManager.getUserSessionVO(request).getUserId();
	/* Cookie cookie = new Cookie("UID", user_id);
	cookie.setPath("/");
	cookie.setSecure(true);
	response.addCookie(cookie);  */
	response.addHeader("Set-Cookie", "UID="+user_id+";path=/; secure HttpOnly");
%>
<script type="text/javascript">

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



$("document").ready(function(){
	
	$.datepicker.setDefaults({
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		changeMonth: true,
		changeYear: true,
		showMonthAfterYear: true,
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: 'yy-mm-dd'
	});
	
 	var dateFormat={
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','121'],
		showMonthAfterYear: true, //연월 순서로 보여줌
		changeMonth: true, //월을 셀렉트박스로 표현
		changeYear: true, //년을 셀렉트박스로 표현
		dateFormat: "yy-mm-dd",
		changeMonth: true,   
		changeYear: true,
		yearRange: "2014:2025"
	};
	
	_.templateSettings = {
			interpolate: /\{\{\=(.+?)\}\}/gim,
			evaluate: /\{\{([\s\S]+?)\}\}/gim,
			escape: /\{\{\-(.+?)\}\}/gim
		};
	
	//input에 숫자만 입력받는 이벤트
	$(document).on("keyup", ".i-numOnly" ,function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") ); });
	$(document).on("blur", ".i-numOnly" ,function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") ); });
	
	
	/* 접속 모바일 및 pc 구분 */
	var filter = "win16|win32|win64|mac";
	var device = "PC";
	
	if(navigator.platform){
		if(0 > filter.indexOf(navigator.platform.toLowerCase())){
			device = "Mobile";
		}else {
			device = "PC";
		}
	}
	
        if(device == "PC"){
        } else {
        	$(".a_1dep").attr("href","#");
        }
   
});
	
	function fnIsLoginChk() {
		var isLoginAt = '${isLoginAt}';
		var isUserNo = '${isUserNo}';
		
		var isChk = '1';
		if(isLoginAt == 'N' || isUserNo < 1) {
			isChk = '0';
		}
		return isChk;
	}
	
	function Chkwwww(){
		if('${REQUEST_DATA.SES_TUTOR_AT}'=='Y'){
			window.location.href="/academy/course/onDetail.do?ref1=EMP";
		}else{
			alert("접근 권한이 부족합니다. 관리자 승인 후 접근이 가능합니다.");
		}
	}
	
$(function(){
    	
    	$("#ready2").on("click",function(){
    		alert("준비중 입니다.");
    		$("#offfocus").focus();
    	});
    	$("#ready3").on("click",function(){
    		alert("준비중 입니다.");
    		$('#offfocus').focus();
    	});
    	$("#ready3_1").on("click",function(){
    		alert("준비중 입니다.");
    		$("#offfocus").focus();
    	});
    	$("#ready3_2").on("click",function(){
    		alert("준비중 입니다.");
    		$("#offfocus").focus();
    	});
    });
    
    
    
</script>
</head>



<!-- 수직스크롤 항상 보이도록 -->
<body style="overflow-y:scroll;">
	<c:choose>
		<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/academy/main/main.do'}">
			<a href="#Maincontent" class="sr-only sr-only-focusable">메인콘텐츠로 가기</a>
		</c:when>
		<c:otherwise>
			<a href="#sub-content" class="sr-only sr-only-focusable">콘텐츠로 바로가기</a>
		</c:otherwise>
	</c:choose>

<form name="leftMenuFrm" id="leftMenuFrm" action="" method="post">
	<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>"/>
	<input type="hidden" name="paramCourseNo" id="paramCourseNo" value="<c:out value="${REQUEST_DATA.paramCourseNo}"/>"/>
	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value="<c:out value="${REQUEST_DATA.paramcSeqNo}"/>"/>
	<input type="hidden" name="paramcUserNo" id="paramcUserNo" value="<c:out value="${REQUEST_DATA.paramcUserNo}"/>"/>
	<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
	<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
</form>

            <header>
                <div class="semin_header">
                    <!-- Navigation -->
                    <nav class="navbar navbar-default" role="navigation">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="globalWrap clearfix">
                            <div class="container center-block">
                            <a title="상상스토리" class="navbar-brand" href="/academy/main/main.do"><div class="logo"><span class="text-hide">상상스토리</span></div></a>

                                <div class="navbar-header">
                                    <div class="nav navbar-right top-nav">
                                        <c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
                                        <span class="top_global">
                                            <a title="회원가입" href="/academy/user/memberJoinAgree.do" class="a_join">회원가입</a>
<!--                                             <a title="회원가입" href="/academy/user/memberJoinForm.do" class="a_join">회원가입</a> -->
                                            <a title="아이디/비밀번호 찾기" href="/academy/user/memberIdPw.do" class="a_idpw">아이디/비밀번호 찾기</a>
                                        </span>

                                        <a title="로그인" href="/academy/common/login.do" class="btn_login">
                                        <div class="mobileLogTxt"><font style="color: #289ccb !important;">로그인</font></div>
                                        <span>로그인</span></a>
                                        </c:if>
                                        <c:if test="${REQUEST_DATA.SES_USERNO > 0}">
                                        <%-- ${REQUEST_DATA.SES_USERNAME} --%>
                                        <span class="top_global">
                                        	<strong>${REQUEST_DATA.SES_USERNAME}</strong> 님의 방문을 환영합니다 &nbsp;&nbsp;
                                            <!-- <a href="/academy/myclass/myclassList.do" class="a_mypage">나의공간</a> -->
                                        </span>
                                        <a title="로그아웃" href="/academy/common/logout.do" class="btn_login Out"><span>로그아웃</span></a>
                                        </c:if>
                                        <a title="전체메뉴" href="/academy/intro/siteMap.do" class="btn_sitemap"><span class="siteTxt">전체메뉴</span></a>
                                        <button type="button" class="navbar-toggle" id="btn-sidebar" title="전체메뉴">
                                            <span class="sr-only">전체메뉴</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="gnbposi">
                            <div class="seominGnbWrap">
                                <div class="container center-block">
                                	
                                	<!-- 상단메뉴 시작 --> 
                                	<div class="formobile" id="main-sidebar">
									    <ul class="ul_gnb">
									        <!-- 대메뉴 -->
									        <c:forEach items="${rootMenuList}" var="result" varStatus="stat">
									    	<li>
							            		<a title="${result.MENU_NAME}" href="${result.LINK}" class="a_1dep"><span><c:out value="${result.MENU_NAME}"/></span></a>
										        	<div class="subMnWrap">
	                                                    <ul>
													        <c:forEach items="${subMenuList}" var="subResult" varStatus="stat">
												            	<c:if test="${result.MENU_CODE == subResult.P_MENU_CODE}">
													            	<c:if test="${subResult.MENU_DIV == '2'}">
			                                                        	<li><a title="${subResult.MENU_NAME}" href="${subResult.LINK}" class="a_2dep">${subResult.MENU_NAME}</a></li>
			                                                        	<c:set var="menuCode" value="${subResult.MENU_CODE}" />
					                                                </c:if>
													            </c:if>
													            <c:if test="${menuCode == subResult.P_MENU_CODE}">
													            	<c:if test="${subResult.MENU_DIV == '3'}">
			                                                        	<li><a title="${subResult.MENU_NAME}" href="${subResult.LINK}" class="a_3dep">...${subResult.MENU_NAME}</a></li>
													            	</c:if>
													            </c:if>
			                                                </c:forEach>
	                                                    </ul>
	                                                </div>
									        </li>
									        </c:forEach>
									    </ul>
									</div>
							        <!-- 상단메뉴 끝 -->
                                
                                   
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </header>
<!-- 공통 다운로드 폼 -->
<form id="fd_fileDownFrm" name="fileDownFrm" method="post" action="/academy/filedown.do" >
	<input type="hidden" name="filepath" value=""/>
	<input type="hidden" name="filename" value=""/>
	<input type="hidden" name="orgfilename" value=""/>
	<input type="hidden" name="encYn" value=""/>
	<input type="hidden" name="downType" value=""/>
	<input type="hidden" name="containsKey" value="sd"/>
	<input type="hidden" id="sampleDown" name="sampleDown"  value="sampleDown"/>
</form>
<iframe name="hiddenDownloadFrame" title="hiddenDownloadFrame" style="width: 0px; height:0px;display:none;"></iframe>
</body>	
</html>