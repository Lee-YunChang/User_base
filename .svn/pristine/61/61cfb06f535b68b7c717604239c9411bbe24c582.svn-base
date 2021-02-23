 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.sangs.session.UserSessionManager" %>
<%@ page import = "com.sangs.session.UserSessionVO" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

 <head>
 	 <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="서민과 금융소비자 무료 온라인 교육 및 방문 금융교육, 종합상담사 양성, 1:1 재무상담 교육포털">
        <meta property="og:type" content="website">
		<meta property="og:title" content="상상스토리 상담포털">
		<meta property="og:description" content="서민과 금융소비자 무료 온라인 교육 및 방문 금융교육, 종합상담사 양성, 1:1 재무상담 교육포털">
		<meta property="og:image" content="/academy/images/common/top_logo.png">
		<meta property="og:url" content="http://edu.kinfa.or.kr">
        <title>상상스토리 사용자포털 ${REQUEST_DATA.title}</title>
        <link rel="canonical" href="http://edu.kinfa.or.kr">
        <link rel="shortcut icon" href="/academy/images/main/CI2.png">
		<link rel="apple-touch-icon" href="/academy/images/main/CI2.ico" type="image/x-icon">
        <link rel="stylesheet" href="/academy/common/css/mobile.css" media="all">
        <link rel="stylesheet" href="/academy/common/css/laypop.css" media="all">
        <link rel="stylesheet" href="/academy/common/css/style.css" media="all">
        <link rel="stylesheet" href="/academy/common/fonts/font.css" media="all">
        <link rel="stylesheet" href="/academy/common/css/jquery-ui.min.css" media="all">
    	<script type="text/javascript" src="/academy/common/js/jquery.min.js"></script>
        <script type="text/javascript" src="/academy/common/js/jquery.bxslider.min.js"></script>
        <script type="text/javascript" src="/academy/common/js/jquery.simple-sidebar.min.js"></script>
		<script type="text/javascript" src="/academy/common/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="/academy/common/js/jquery.jqtransform.js" ></script>
		<script type="text/javascript" src="/academy/common/js/jquery.alphanumeric.pack.js"></script>  
		<script type="text/javascript" src="/academy/common/js/jquery.cookie.js"></script> 
		
		<script type="text/javascript" src="/academy/common/js/lodash/lodash.js" charset="utf-8"></script>
		<script type="text/javascript" src="/academy/common/js/underscore/underscore.string.js" charset="utf-8"></script>
		<script type="text/javascript" src="/academy/common/smarteditor/js/HuskyEZCreator.js"></script>
		<script type="text/javascript" src="/common/js/makePCookie.js"></script>
		<!-- <script type="text/javascript" src="/academy/common/js/academy.js"></script> -->
        <script type="text/javascript" src="/academy/common/js/common.js"></script>
        <script type="text/javascript" src="/academy/common/js/ui.js"></script>
        <script type="text/javascript" src="/common/js/sangs_core.js"></script>
		<c:set var="isLoginAt"><c:out value="${REQUEST_DATA.SES_ISLOGIN}"/></c:set>
		<c:set var="isUserNo"><c:out value="${REQUEST_DATA.SES_USERNO}"/></c:set>
 	
 	
	<meta charset="UTF-8">
	<meta name="Author" content="" />
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->
	<title>상상스토리</title>
	<link rel="stylesheet" href="/counselor/css/bootstrap.css" media="all">
	<link rel="stylesheet" href="/counselor/css/style.css" media="all">
	<script type="text/javascript" src="/counselor/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/counselor/js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="/counselor/js/ui.js"></script>
	<script type="text/javascript" src="/counselor/js/bootstrap.min.js"></script>
	
</head>
 <aside class="topUtil">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <ul class="utilMenu">
                    	<c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
	                        <li><a href="/academy/common/login.do?returnUrl=/academy/counselor/main.do">로그인</a></li>
	                        <li><a href="/academy/user/memberJoinForm.do">회원가입</a></li>
	                        <li><a href="/academy/user/memberIdPw.do">아이디/비밀번호 찾기</a></li>
                        </c:if>
                        <c:if test="${REQUEST_DATA.SES_USERNO > 0}">
                        	<li><a href="#none"><strong>${REQUEST_DATA.SES_USERNAME}</strong> 님의 방문을 환영합니다 &nbsp;&nbsp;</a></li>
                        	<li><a title="로그아웃" href="/academy/counselor/logout.do" class="btn_login Out">로그아웃</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
</aside>
<header id="header" class="clearfix"><!-- header -->
        <div class="container">
            <h1><a href="/academy/counselor/main.do"><img src="/counselor/images/img_logo.png" alt="상상스토리"></a></h1>
            <div class="mobMenu">
                <p class="hamMenu"><button type="button" class="btnMenu"><img src="/counselor/images/mobile/btn_menu.png" width="29" alt="메뉴열기"></button></p>
                <c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
                	<p class="account">
                		<a href="/academy/common/login.do?returnUrl=/academy/counselor/main.do">
               				<font style="display: inline-block;color: #289ccb; font-weight: bold; position: absolute;">로그인</font>
                			<img src="/counselor/images/mobile/login.png" width="22" alt="로그인"/>
               			</a>
               		</p>
                </c:if>
                <c:if test="${REQUEST_DATA.SES_USERNO > 0}">
                	<p class="account"><a href="/academy/counselor/logout.do"><img src="/counselor/images/mobile/logout.png" width="22" alt="로그아웃"></a></p>
                </c:if>
            </div>
            <div class="menuWrap">
                <div class="overay"></div>
                <div class="mMenuBLock">
                    <header class="menuHeader clearfix">
                        <h2>전체메뉴</h2>
                    </header>
                    <nav class="gnb">
                        <ul>
                            <li class="active">
                                <a href="#">상담소개</a>
                                <ul>
                                    <li><a href="/academy/counselor/counselorIntro.do">온라인 1:1맞춤형<br>심화 상담소개</a></li>
                                    <li><a href="/academy/counselor/onMain.do">이용방법 안내</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">상담안내</a>
                                <ul>
                                    <li><a href="/academy/counselor/counselorForm.do">상담신청</a></li>
                                    <li><a href="/academy/counselor/boardList.do">상담내역조회</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">상담자료실</a>
                                <ul>
                                	<li><a href="/academy/counselor/openBoardList.do">상담사례</a></li>
                                    <li><a href="/academy/counselor/bestList.do">Best상담</a></li>
                                    <!-- <li><a href="#">상담사례</a></li> -->
                                </ul>
                            </li>
                            <li>
                                <a href="#">알림마당</a>
                                <ul>
                                    <li><a href="/academy/counselor/helpdesk/noticeList.do">공지사항</a></li>
                                    <li><a href="/academy/counselor/helpdesk/boardDataList.do?bcateno=6">금융생활정보</a></li>
                                    <li><a href="/academy/counselor/faqList.do">자주묻는 질문</a></li>
                                    <li><a href="/academy/counselor/helpdesk/boardDataList.do?bcateno=4">진흥원 소식</a></li>
                                </ul>
                            </li>
                        </ul>
                        <span class="arrow"></span>
                    </nav>
                    <p class="btnCLose"><button type="button" class="closeMenu"><img src="/counselor/images/mobile/close.png" width="12" alt="닫기"></button></p>
                </div>
            </div>
        </div>
    </header><!-- //header -->