<%
/****************************************************
    system	: academy > 집합교육
    title	: 집합교육 연간교육일정
    summary	:
    wdate	: 2016-03-24
    writer	: 김학규
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="courseURL" value="/academy/course/public/main.do?mtCtypeCode=${REQUEST_DATA.mtCtypeCode}&form=E100"/>

<div class="contents-wrap">

        <div class="sub-wrap">
        
        <!-- 왼쪽 메뉴 영역 -->
        <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>
        <!-- // 왼쪽 메뉴 영역 -->
        
            <!-- 페이지 상단 타이틀 영역 -->
            <div id="Sub_Header" class="menu2">
                <div class="nav">
                    <img src="/academy/images/ico_home.png" alt="Home" /><img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />집합교육<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />연간교육일정
                </div>
                <h3>연간교육일정</h3>
                <p>화학사고로부터 국민의 안전을 지키겠습니다.</p>
            </div>
            <!-- // 페이지 상단 타이틀 영역 -->

            <div id="Contents" tabindex="-1">

                <h5>2016년 상상스토리 교육과정 일정</h5>
                <div class="shadow_box">
                    <div class="yellow_box">
                        <p>아래 각 과정의 신청은 접수기간에만 접수되며, 접수기간 이전 이후에 신청할 경우는 대상자 선발에서 제외됩니다.</p>
                        <p>교육일정 및 교육과정은 우리원 사정에 의해  변경될 수 있습니다.</p>
                    </div>
                </div>
                <div class="table_box tight maginTop">

                <c:out value="${rowData.CONTENT}" escapeXml="false"/>

            </div>

            </div><!-- // Contents -->

        </div>
    </div>

    <!-- 풋터 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
    <!-- // 풋터 영역 -->