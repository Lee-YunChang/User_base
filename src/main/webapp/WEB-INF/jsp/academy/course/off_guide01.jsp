<%
/****************************************************
    system	: academy > 집합교육
    title	: 집합교육
    summary	:
    wdate	: 2015-06-05
    writer	: 김학규
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<c:set var="courseURL" value="/academy/course/public/main.do?mtCtypeCode=${REQUEST_DATA.mtCtypeCode}&form=E100"/>

<script type="text/javascript">

    function fnLink(){
        window.open('http://nics.me.go.kr','_blank')
    }
</script>

<div class="contents-wrap">

        <div class="sub-wrap">

        <!-- 왼쪽 메뉴 영역 -->
        <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>
        <!-- // 왼쪽 메뉴 영역 -->
        
            <!-- 페이지 상단 타이틀 영역 -->
            <div id="Sub_Header" class="menu2">
                <div class="nav">
                    <img src="/academy/images/ico_home.png" alt="Home" /><img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />집합교육<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />수강신청 안내
                </div>
                <h3>수강신청 안내</h3>
                <p>화학사고로부터 국민의 안전을 지키겠습니다.</p>
            </div>
            <!-- // 페이지 상단 타이틀 영역 -->

            <!-- <div id="Contents" tabindex="-1">
                <h5 class="numbering"><span>1</span>과정별 일정확인</h5>
                <h5 class="numbering"><span>2</span>수강신청</h5>
                <div class="paragraph">
                    <p>
                        1) 과정을 선택하고 ‘신청’버튼을 클릭합니다.<br />
                        * <strong class="t_green">신청</strong> : 신청가능<br />
                        * <strong class="t_green">대기</strong> : 대기자 신청가능<br />
                        * <strong class="t_green">마감</strong> : 과정 종료 또는 대기 마감<br />
                    </p>
                    <p>2) 과정 안내문은 신청 이후 메일로 발송됩니다.</p>
                    <p>3) 대기신청인 경우 교육 2~3일 전까지 교육담당자로부터 별도 수강가능 전화를 받는 경우에만 입과 가능합니다.</p>
                </div>
                <h5 class="numbering"><span>3</span>수강료 입금 (<strong class="t_orange">27,000원/1일</strong>)</h5>
                <div class="paragraph">
                    <p>1) 입금계좌</p>
                    <div class="table_box">
                        <table cellpadding="0" cellspacing="0" class="row_type" summary="상상스토리 교육시스템 집합교육의 입금계좌입니다.">
                            <caption>입금계좌</caption>
                            <colgroup>
                                <col width="325px"/>
                                <col width="150px"/>
                                <col width="90px"/>
                                <col width="187px"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>과정</th>
                                    <th>계좌번호</th>
                                    <th>은행명</th>
                                    <th>예금주</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>장외영향평가서 작성자 교육과정</td>
                                    <td rowspan="3">679-910070-41205</td>
                                    <td rowspan="3">하나은행</td>
                                    <td rowspan="3">상상스토리<br />(부기명 : 장외, 위해교육)</td>
                                </tr>
                                <tr>
                                    <td>위해관리계획서 작성자 교육과정</td>
                                </tr>
                                <tr>
                                    <td>컨설턴트를 위한 장외영향평가서 작성자 교육과정</td>
                                </tr>
                                <tr>
                                    <td>화학사고 대응과정</td>
                                    <td rowspan="6">679-910024-90204</td>
                                    <td rowspan="6">하나은행</td>
                                    <td rowspan="6">상상스토리<br />(부기명 : 연구개발 교육과)</td>
                                </tr>
                                <tr>
                                    <td>화학사고 예방과정</td>
                                </tr>
                                <tr>
                                    <td>화학사고 수습과정</td>
                                </tr>
                                <tr>
                                    <td>유해화학물질 교육강사 양성과정</td>
                                </tr>
                                <tr>
                                    <td>현장수습조정관 양성과정</td>
                                </tr>
                                <tr>
                                    <td>합동방재센터 역량강화과정</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <p>
                    2) 납부시 주의사항<br />
                    - 교육수수료 납부는 교육실시 7일 전까지 입금해야함(납부기한 내 미입금시 교육 자동 취소)<br />
                    - 교육생 확인을 위한 “성명 및 교육과정 코드번호” 기재(예시 : ‘홍길동 11’ 또는 ‘홍길동 화학사고 예방 1기’)<br />
                    - 계산서 발급 불가
                    </p>
                </div>
                <h5 class="numbering"><span>4</span>과정입과</h5>
                <div class="paragraph">
                    <p>1) 교육시작 당일 08:50까지 교육장에 도착하시면 됩니다. (필기구 준비)</p>
                </div>
                <h5 class="numbering"><span>5</span>과정종료 및 수료</h5>
                <div class="paragraph">
                    <p>1) 상상스토리 원장은 과정별 이수자에게 교육 수료증을 교부합니다.</p>
                    <p>2) 교육 종료시 수강료에 대한 영수증을 드립니다.</p>
                </div>
                <h5 class="numbering"><span>6</span>기타</h5>
                <div class="paragraph">
                    <p>1) 신청자가 5명 이하인 경우 해당 과정이 취소될 수 있습니다.</p>
                    <p>2) 교육일정은 당사의 사정에 따라 부득이하게 변경될 수 있습니다.</p>
                </div>

                <div class="btn_area clearfix">
                    <div class="btn_group_center">
                        <a href="#" onclick="javascript:fnLink(); return false;" class="btn big orange" title="새창으로 안내합니다.">상상스토리 홈페이지 바로가기</a>
                    </div>
                </div> -->

                <div id="Contents">
                <h5 class="numbering"><span>1</span>과정별 일정확인</h5>
                <h5 class="numbering"><span>2</span>수강신청 접수</h5>
                <div class="paragraph">
                    <p>
                        상상스토리 교육시스템<a href="http://edunics.me.go.kr" alt="교육시스템(http://edunics.me.go.kr)으로 이동">(http://edunics.me.go.kr)</a>에 접속하여<br/>
                        회원가입 → 로그인 → 집합교육 → 해당과정(자세히 보기) → <strong class="t_green">신청</strong>
                    </p>

                </div>
                <h5 class="numbering"><span>3</span> 교육대상자 선발 후 개별 이메일 통보</h5>

                <h5 class="numbering"><span>4</span>수강료 입금 : 27,000원/1일(입금계좌: 개별 안내)</h5>

                <h5 class="numbering"><span>5</span>과정 입교</h5>
                <div class="paragraph">
                    <p>1) 교육시작 당일 08:50까지 교육장에 도착하시면 됩니다.(필기구 준비)</p>
                </div>
                <h5 class="numbering"><span>6</span>과정 종료 및 수료</h5>
                <div class="paragraph">
                    <p>1) 상상스토리 원장은 과정별 이수자에게 교육 수료증을 교부합니다.</p>
                    <p>2) 교육 종료시 수강료에 대한 영수증을 드립니다.</p>
                </div>
                <h5 class="numbering"><span>7</span>기타</h5>
                <div class="paragraph">
                    <p>1) 신청자가 5명 이하인 경우 해당 과정이 취소될 수 있습니다.</p>
                    <!-- <p>2) 교육 일정은 본 원의 사정에 의하여 부득이하게 변경될 수 있습니다. </p> -->
                    <p>2) 교육일정 및 교육과정은 우리원 사정에 의해 변경될 수 있습니다.
                        </br>&nbsp;&nbsp;&nbsp;&nbsp;※ 홈페이지 공지사항을 참고하시기를 바랍니다.</p>
                </div>

            </div><!-- // Contents -->
        </div>
    </div>

    <!-- 풋터 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
    <!-- // 풋터 영역 -->