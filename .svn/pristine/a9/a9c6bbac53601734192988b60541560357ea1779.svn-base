<%
/****************************************************
    system	: academy > 일반과정 신청 및 수강안내
    title	: 일반과정 신청 및 수강안내 목록
    summary	:
    wdate	: 2013-09-10
    writer	: kim min gyu
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="courseURL" value="/academy/course/public/main.do?mtCtypeCode=${REQUEST_DATA.mtCtypeCode}&form=E100"/>

<script type="text/javascript">

</script>

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

            <div id="Contents">

                <h5>2015년 상상스토리 교육과정 일정</h5>
                <div class="shadow_box">
                    <div class="yellow_box">
                        <p>아래 각 과정의 신청은 접수기간에만 접수되며, 접수기간 이전 이후에 신청할 경우는 대상자 선발에서 제외됩니다.</p>
                    </div>
                </div>
                <div class="table_box tight">
                    <table cellpadding="0" cellspacing="0" class="row_type">
                        <caption>2015년 상상스토리 교육과정 일정 테이블 : 상상스토리 교육시스템 집합교육의 2015년 상상스토리 교육과정 일정입니다.</caption>
                        <colgroup>
                            <col width="165px"/>
                            <col width="120px"/>
                            <col width="120px"/>
                            <col width="80px"/>
                            <col width="80px"/>
                            <col width="85px"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>과정명</th>
                                <th>접수기간</th>
                                <th>교육기간</th>
                                <th>이수시간</th>
                                <th>정원</th>
                                <th>신청</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                            <c:when test="${not empty listData}">
                                <c:forEach items="${listData}" var="result" varStatus="stat">
                                    <tr>
                                        <td><c:out value="${result.COURSETITLE}"/></td>
                                        <td><c:out value="${result.APPLY_SDATE}"/> ~ <c:out value="${result.APPLY_EDATE}"/></td>
                                        <td><c:out value="${result.STUDY_SDATE}"/> ~ <c:out value="${result.STUDY_EDATE}"/></td>
                                        <td><c:out value="${result.STUDYTIME}" default="-"/>시간</td>
                                        <td><c:out value="${result.COURSE_USER_CNT}"/>/<c:out value="${result.FIX_CNT}"/></td>
                                        <td>
                                            <jsp:useBean id="toDay" class="java.util.Date" />
                                            <c:set var="day"><fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" /></c:set>
                                            <c:set var="statusCode"><%=SangsProperties.getProperty("Globals.mtCode_MT_CSEQ_STATUS_CODE_APPLY_END")%></c:set>
                                            <!-- 신청기간체크, 정원체크, 개설상태에 따라 신청버튼 노출 -->
                                            <c:choose>
                                                <c:when test="${ (result.APPLY_SDATE >= day || result.APPLY_EDATE >= day)
                                                    && result.MAX_CNT > result.COURSE_USER_CNT
                                                    && result.MT_CSEQ_STATUS_CODE < statusCode }">
                                                    <a href="#" onclick="javascript:fnCourseApply('<c:out value="${result.COURSENO}"/>', '<c:out value="${result.CSEQNO}"/>'); return false;" class="btn blue" title="신청">신청</a>
                                                </c:when>
                                                <c:otherwise><button title="마감" class="btn gray">마감</button></c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="6" align="center">등록된 정보가 없습니다.</td></tr>
                            </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

            </div><!-- // Contents -->
        </div>
    </div>

    <!-- 풋터 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
    <!-- // 풋터 영역 -->