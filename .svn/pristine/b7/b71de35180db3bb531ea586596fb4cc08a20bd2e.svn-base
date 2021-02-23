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
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="">
<meta name="keywords" content=" ">
<meta name="description" content=" ">
<meta name="copyright" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${REQUEST_DATA.title}</title>
<link rel="stylesheet" href="/academy/common/css/common.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/main.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/sub.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/mobile.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/jquery-ui.min.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<!-- <link rel='stylesheet' href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/> 
<link rel="stylesheet" href="/academy/common/css/jquery-ui-1.9.0.custom.css"> -->
<script src="/academy/common/js/jquery.min.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />" ></script>
<script src="/academy/common/js/jquery-ui.min.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script src="/academy/common/js/jquery.bxslider.min.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script src="/academy/common/js/jquery.jqtransform.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />" ></script>
<script src="/academy/common/js/keysecurity.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />" ></script>
<script type="text/javascript" src="/classdesk/common/js/jquery.countdown.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script src="/academy/common/js/common.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script src="/academy/common/js/main.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<!--[if lte IE 9]>
<link rel="stylesheet" href="/academy/common/css/common_ie9.css">
<![endif]-->
<!--[if lt IE 9]>
<script src="/academy/common/plugins/html5shiv.min.js"></script>
<script src="/academy/common/plugins/respond.min.js"></script>
<![endif]-->

<script type="text/javascript" src="/academy/common/js/jquery.alphanumeric.pack.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/jquery.showLoading.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/lodash/lodash.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/jquery.cookie.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script> <!-- 메인 팝업 쿠키 --> 
<script type="text/javascript" src="/academy/common/js/capsLockChk.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/js/academy.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/common/js/sangs_core.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<script type="text/javascript" src="/academy/common/smarteditor/js/HuskyEZCreator.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />" charset="utf-8"></script>
<script type="text/javascript" src="/common/js/makePCookie.js?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />"></script>
<c:set var="isLoginAt"><c:out value="${REQUEST_DATA.SES_ISLOGIN}"/></c:set>
<c:set var="isUserNo"><c:out value="${REQUEST_DATA.SES_USERNO}"/></c:set>
<%
	String user_id = UserSessionManager.getUserSessionVO(request).getUserId();
	Cookie cookie = new Cookie("UID", user_id);
	cookie.setPath("/");
	response.addCookie(cookie);
%>
	
<script type="text/javascript">
	$(function(){
		$('#select_container').jqTransform();
		
		var filter = "win16|win32|win64|mac|macintel";
	    var result = "";
	    
        if ( navigator.platform  ) {
            if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
                result = 'mobile';
            } else {
                result = "pc";
            }
        }
        //공지팝업
		'<c:if test="${noticePopCount > 0 }">'
	        '<c:forEach items="${noticePopList}" var="result" varStatus="status" >'
	        if($.cookie('notice_<c:out value="${result.POP_NO}"/>') != 'ok_<c:out value="${result.POP_NO}"/>'){
					//SANGS.Util.openPopup('<c:out value="${ctx}"/>/academy/main/main/notice_pop.do?popNo=<c:out value="${result.POP_NO}"/>', 'main_pop_<c:out value="${result.POP_NO}"/>','width=<c:out value="${result.WIDTH_SIZE}"/>, height=<c:out value="${result.HEIGHT_SIZE}"/>, top=<c:out value="${result.LOC_TOP_PX}"/>, left=<c:out value="${result.LOC_LEF_PX}"/>, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
					$("#mainLayer_popup<c:out value='${status.count}'/>").css('display' , 'block');
					var top = Number(Number('<c:out value="${result.LOC_TOP_PX}"/>') + ('<c:out value="${result.HEIGHT_SIZE}"/>'/2));
			        var left = Number(Number('<c:out value="${result.LOC_LEF_PX}"/>') + ('<c:out value="${result.WIDTH_SIZE}"/>'/2));
			        
			        //디바이스가 pc일경우
					if(result == 'pc'){
						document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.width = '<c:out value="${result.WIDTH_SIZE}"/>%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.height = '<c:out value="${result.HEIGHT_SIZE}"/>%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.top = '<c:out value="${result.LOC_TOP_PX}"/>%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.left = '<c:out value="${result.LOC_LEF_PX}"/>%';
				        document.getElementById("mainLayer_bg<c:out value='${status.count}'/>").style.height = '<c:out value="${result.HEIGHT_SIZE}"/>%';
					}
					
					//디바이스가 모바일일 경우
					if(result == 'mobile'){
						document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.width = '70%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.height = '70%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.top = '50%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.left = '50%';
				        document.getElementById("mainLayer_bg<c:out value='${status.count}'/>").style.height = '70%';
					}
			        var content = $('#mainLayer_bg'+'<c:out value="${status.count}"/>').text();
			          
			        $('#mainLayer_bg'+'<c:out value="${status.count}"/>').html(content);
	            }
	        '</c:forEach>';
	    '</c:if>';

	    $('#checkBox input[type=checkbox]').on('click' , function(){
	    	var popNo = $(this).attr('popNo');

	    	if($(this).attr("check") == 0){
	    		$(this).attr("check" , "1");
	    		setCookie("notice_"+popNo, "ok_"+popNo ,1);
	    	}else if($(this).attr("check") == 1){
	    		$(this).attr("check" , "0");
	    		deleteCookie("notice_"+popNo, "ok_"+popNo ,-1);
	    	}
	    })
	    
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
</script>

</head>
<body>

<c:forEach items="${noticePopList}" var="result" varStatus="status" >
	<div class="mainLayer_popup" id="mainLayer_popup${status.count}" style="display: none;">
		<div class="mainLayer-tit" id="mainLayer-tit">
			<p><c:out value="${result.POP_TITLE}" /></p>
			<button class="layer_close pop_close" onclick="layerPop('<c:out value="${status.count}" />');return false;">닫기</button>
		</div>
		<div class="mainLayer_bg bg3" id="mainLayer_bg${status.count}">
			<c:out value="${result.POP_CONTENT}" escapeXml="false"/>
		</div>
		<div class="mainLayer_bottom" id="mainLayer_bottom" align="right">
			<p class="checks" id="checkBox">
				<input type="checkbox" name="close_view${status.count}" id ="close_view${status.count}" popNo="<c:out value="${result.POP_NO}"/>" check="0" style="margin-left:10px;" title="오늘 하루 이 창을 열지 않음" />
				<label for="close_view${status.count}"> 오늘 하루 이 창을 열지 않음 </label>
				<button class="mainLayer_btn" onclick="layerPop('<c:out value="${status.count}" />');return false;">[닫기]</button>
			</p>
		</div>
	</div>
</c:forEach> 
<div id="skipnav"><a href="#contents" title="본문내용바로가기">본문내용 바로가기</a></div>
	
<div class="wrap">
	<div class="header-wrap">
		<div id="header">
			<h1><a href="/academy/main/main.do"><img src="/academy/images/main/logo.png" alt="상상스토리 로고"></a></h1>
			<c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
				<a href="/academy/common/login.do" class="top-btn" title="로그인 바로가기"><img src="/academy/images/main/m_login.png" alt="모바일 로그인"></a> <!-- 모바일 로그인 메뉴 -->
			</c:if>
			<c:if test="${REQUEST_DATA.SES_USERNO > 0}">
				<a href="/academy/common/logout.do" class="top-btn" title="로그아웃"><img src="/academy/images/main/m/m_logout.png" alt="모바일 로그아웃"></a> <!-- 모바일 로그인 메뉴 -->
			</c:if>
			<c:if test="${REQUEST_DATA.SES_USERNO == 0 or REQUEST_DATA.SES_USERNO eq null}">
				<ul class="topmenu">
					<li><a href="/academy/common/login.do" class="login" title="로그인">로그인</a></li>
					<li><a href="/academy/user/memberJoinAgree.do" class="join" title="회원가입">회원가입</a></li>
					<li><a href="/academy/user/memberIdPw.do" class="id-serch" title="ID/PW찾기">ID/PW 찾기</a></li>
				</ul>
			</c:if>
			<c:if test="${REQUEST_DATA.SES_USERNO > 0}">
	            <div class="logout abs">
					<p><span><c:out value="${REQUEST_DATA.SES_USERNAME}"/></span>(<span><c:out value="${REQUEST_DATA.SES_USERID}"/></span>) 님의 방문을 환영합니다.</p>
					<a href="/academy/common/logout.do" title="로그아웃">로그아웃</a>
				</div>
	        </c:if>
		</div>
					
		<!-- pc gnb-->
		<div class="gnb-wrap" id="gnb-wrap">
			<div class="gnb" id="gnb">
				<ul>
					<li><a href="/academy/intro/intro.do" title="상상스토리">상상스토리</a>
						<ul class="depth2 bg-none">
							<li><a href="/academy/intro/intro.do" title="소개">소개</a></li>
							<li><a href="/academy/intro/introGuide.do" title="오시는 길">오시는 길</a></li>
						</ul>
					</li>
					<li><a href="/academy/course/courseInfo.do" title="배움터">배움터</a>
						<ul class="depth2">
							<li><a href="/academy/course/courseInfo.do" title="교육과정소개">교육과정소개</a></li>
							<li><a href="/academy/course/onMain.do" title="사이버교육">사이버교육</a></li>
							<li><a href="/academy/course/offMain.do" title="집합교육">집합교육</a></li>
							<li><a href="/academy/course/cpseduMain.do" title="의무교육">의무교육</a></li>
							<li><a href="/academy/course/lectureMain.do" title="특강교육">특강교육</a></li>
							<li><a href="/academy/course/openEduMain.do" title="열린교육">열린교육</a></li>
						</ul>
					</li>
					<li><a href="/academy/eduinfo/eduDataList.do">지식터</a>
						<ul class="depth2 pl20">
							<li><a href="/academy/eduinfo/eduDataList.do" title="교육자료">교육자료</a></li>
							<li><a href="/academy/eduinfo/contentsList.do" title="교육컨텐츠">교육콘텐츠</a></li>
						</ul>
					</li>
					<li><a href="/academy/helpdesk/noticeList.do" title="안내터">안내터</a>
						<ul class="depth2">
							<li><a href="/academy/helpdesk/noticeList.do" title="공지사항">공지사항</a></li>
							<li><a href="/academy/helpdesk/boardList.do" title="교육안내">교육안내</a></li>
							<li><a href="/academy/helpdesk/offSchedule.do" title="집합교육일정표">집합교육일정표</a></li>
							<li><a href="/academy/helpdesk/faqList.do" title="자주묻는질문">자주묻는질문</a></li>
						</ul>
					</li>
					<li><a href="/academy/myclass/myclassList.do" title="나의공간">나의공간</a>
						<ul class="depth2">
							<li><a href="/academy/myclass/myclassList.do" title="나의수강현황">나의 수강현황</a></li>
							<li><a href="/academy/myclass/aprsltList.do" title="특강교육/방문교육 신청내역">신청내역</a></li>
							<li><a href="/academy/myclass/memberModifyAuthForm.do" title="개인정보관리">개인정보관리</a></li>
							<%-- <c:if test="${REQUEST_DATA.SES_TUTOR_AT eq 'Y'}">
							<li><a href="/academy/tutor/lectureDetail.do" title="강사정보관리">강사정보관리</a></li>
							<li><a href="/academy/tutor/tutorCmmntyList.do" title="강사커뮤니티">강사커뮤니티</a></li>
							</c:if> --%>
						</ul>
					</li>
					<li><a href="/classdesk/main/main.do" title="나의강의실">나의강의실</a>
						<ul class="depth2">
							<li><a href="/classdesk/main/main.do" title="강의실홈">강의실 홈</a></li>
						</ul>
					</li>
				</ul>
				<div class="depth2-bg"></div>
			</div>
		</div>	
		<!-- pc gnb -->

		<!-- m gnb -->
		<div class="gnb-layer">
			<div class="gnb-menu">
				<h2><a href="#none" class="m_close" title="전체메뉴">전체메뉴</a></h2>
				<ul class="acco-container">
					<li><a href="/academy/intro/intro.do" class="btn-acco" title="상상스토리">상상스토리</a>
						<ul class="m-inner acco-view">
							<li><a href="/academy/intro/intro.do" title="소개">소개</a></li>
							<li><a href="/academy/intro/introGuide.do" title="오시는길">오시는 길</a></li>
						</ul>
					</li>
					<li><a href="/academy/course/courseInfo.do" class="btn-acco" title="배움터">배움터</a>
						<ul class="m-inner acco-view">
							<li><a href="/academy/course/courseInfo.do" title="교육과정소개">교육과정소개</a></li>
							<li><a href="/academy/course/onMain.do" title="사이버교육">사이버교육</a></li>
							<li><a href="/academy/course/offMain.do" title="집합교육">집합교육</a></li>
							<li><a href="/academy/course/cpseduMain.do" title="의무교육">의무교육</a></li>
							<li><a href="/academy/course/lectureMain.do" title="특강교육">특강교육</a></li>
							<li><a href="/academy/course/openEduMain.do" title="열린교육">열린교육</a></li>
						</ul>
					</li>
					<li><a href="/academy/eduinfo/eduDataList.do" class="btn-acco" title="지식터">지식터</a>
						<ul class="m-inner acco-view">
							<li><a href="/academy/eduinfo/eduDataList.do" title="교육자료">교육자료</a></li>
							<li><a href="/academy/eduinfo/contentsList.do" title="교육콘텐츠">교육콘텐츠</a></li>
						</ul>
					</li>
					<li><a href="#none" class="btn-acco" title="안내터">안내터</a>
						<ul class="m-inner acco-view">
							<li><a href="/academy/helpdesk/noticeList.do" title="공지사항">공지사항</a></li>
							<li><a href="/academy/helpdesk/boardList.do" title="교육안내">교육안내</a></li>
							<li><a href="/academy/helpdesk/offSchedule.do" title="집합교육일정표">집합교육일정표</a></li>
							<li><a href="/academy/helpdesk/faqList.do" title="자주묻는질문">자주묻는질문</a></li>
						</ul>
					</li>
					<li><a href="#none" class="btn-acco" title="나의공간">나의공간</a>
						<ul class="m-inner acco-view">
							<li><a href="/academy/myclass/myclassList.do" title="나의수강현황">나의 수강현황</a></li>
							<li><a href="/academy/myclass/aprsltList.do" title="특강교육/방문교육 신청내역">신청내역</a></li>
							<li><a href="/academy/myclass/memberModifyAuthForm.do" title="개인정보관리">개인정보관리</a></li>
							<%-- <c:if test="${REQUEST_DATA.SES_TUTOR_AT eq 'Y'}">
							<li><a href="/academy/tutor/lectureDetail.do" title="강사정보관리">강사정보관리</a></li>
							<li><a href="/academy/tutor/tutorCmmntyList.do" title="강사커뮤니티">강사커뮤니티</a></li>
							</c:if> --%>
						</ul>
					</li>
					<li><a href="/classdesk/main/main.do" class="btn-acco" title="나의강의실">나의강의실</a>
					    <ul class="m-inner acco-view">
					    	<li class="lnb_myCourse"><a href="/classdesk/main/main.do" title="강의실홈">강의실 홈</a></li>
					        <c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,0,1) == 1 }">
					    		<li class="lnb_progress"><a href="#none" onclick="fnOnlineMenuMove('/classdesk/user/progress/treeList.do');return false;" title="학습하기">학습하기</a></li>
					    	</c:if>
					        <c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,1,2) == 1 }">
					    		<li class="lnb_report"><a href="#none" onclick="fnLeftMenuMove('/classdesk/user/report/list.do'); return false;" title="과제">과제</a></li>
					    	</c:if>
					    	<c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,7,8) == 1 }">
					    		<li class="lnb_discuss"><a href="#none" onclick="fnLeftMenuMove('/classdesk/user/discuss/list.do'); return false;" title="토론">토론</a></li>
					    	</c:if>
					    	<c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,2,3) == 1 }">
					    		<li class="lnb_tutorexam"><a href="#none" onclick="fnLeftMenuMove('/classdesk/user/exam/list.do'); return false;" title="시험">시험</a></li>
					    	</c:if>
					    	<c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,4,5) == 1 }">
					    		<li class="lnb_tutorpoll"><a href="#none" onclick="fnLeftMenuMove('/classdesk/user/poll/list.do'); return false;" title="설문">설문</a></li>
					    	</c:if>
					    	<c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,5,6) == 1 }">
					    		<li class="lnb_bbslist1"><a href="#none" onclick="fnLeftMenuMove('/classdesk/bbs/list.do?select=list1'); return false;" title="공지사항">공지사항</a></li>
					    	</c:if>
					        <c:if test="${fn:substring(REQUEST_DATA.CLASSDESK,6,7) == 1 }">
					    		<li class="lnb_bbslist2"><a href="#none" onclick="fnLeftMenuMove('/classdesk/bbs/list.do?select=list2'); return false;" title="자료실">자료실</a></li>
					    	</c:if>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="left-area">
			<a href="#none" class="btn-gnb btn-prev btn-splite" title="모바일메뉴"><span class="hide"><img src="/academy/images/main/m_menu.png" alt="모바일 메뉴"></span></a>
		</div>
		<!-- //m gnb -->
	</div><!-- //header-wrap -->	
		
	<!-- 공통 다운로드 폼 -->
	<form id="fd_fileDownFrm" name="fileDownFrm" method="post" action="/academy/filedown.do" >
		<input type="hidden" name="filepath" value=""/>
		<input type="hidden" name="filename" value=""/>
		<input type="hidden" name="orgfilename" value=""/>
		<input type="hidden" name="encYn" value=""/>
		<input type="hidden" name="downType" value=""/>
		<input type="hidden" id="sampleDown" name="sampleDown"  value="sampleDown"/>
	</form>
	<iframe name="hiddenDownloadFrame" title="hiddenDownloadFrame" style="width: 0px; height:0px;display:none;"></iframe>
	