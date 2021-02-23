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

<div class="wrapper clearfix">

        <!-- 왼쪽 메뉴 영역 -->
        <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>
        <!-- // 왼쪽 메뉴 영역 -->

        <div id="Right_Area">
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
                <div class="table_box tight">
                    <table cellpadding="0" cellspacing="0" class="row_type">
                        <caption>2016년 상상스토리 교육과정 일정 : 상상스토리 교육시스템 집합교육의 2016년 상상스토리 교육과정 일정입니다.</caption>
                        <colgroup>
                            <col width="115px"/>
                            <col width="70px"/>
                            <col width="40px"/>
                            <col width="160px"/>
                            <col width="175px"/>
                            <col width="60px"/>
                            <col width="60px"/>
                            <col width="85px"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th colspan="2">교육과정</th>
                                <th>코드</th>
                                <th>운영계획</th>
                                <th>온라인접수기간</th>
                                <th>모집<br/>인원</th>
                                <th>이수<br/>시간</th>
                                <th>대상자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan=6>장외영향평가서<br/>작성자 교육</td>
                                <td>1기</td>
                                <td>11</td>
                                <td class="small_space">2.16(화)~2.17(수), 2일</td>
                                <td class="small_space">1.25(월)9시~1.29(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                                <td rowspan=6>장외영향평가서 작성대상 기업</td>
                            </tr>
                            <tr>
                                <td class="no_left">2기</td>
                                <td>12</td>
                                <td class="small_space">3.15(화)~3.16(수), 2일</td>
                                <td class="small_space">2.22(월)9시~2.26(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">3기</td>
                                <td>13</td>
                                <td class="small_space">4.5(화)~4.6(수), 2일</td>
                                <td class="small_space">3.14(월)9시~3.18(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">4기</td>
                                <td>14</td>
                                <td class="small_space">5.24(화)~5.25(수), 2일</td>
                                <td class="small_space">5.2(월)9시~5.6(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">5기</td>
                                <td>15</td>
                                <td class="small_space">6.14(화)~6.15(수), 2일</td>
                                <td class="small_space">5.23(월)9시~5.27(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">6기</td>
                                <td>16</td>
                                <td class="small_space">7.12(화)~7.13(수), 2일</td>
                                <td class="small_space">6.20(월)9시~6.24(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td rowspan=6>위해관리계획서<br>작성자 교육</td>
                                <td class="no_left">1기</td>
                                <td>21</td>
                                <td class="small_space">2.23(화)~2.24(수), 2일</td>
                                <td class="small_space">2.1(월)9시~2.5(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                                <td rowspan=6>위해관리계획서 작성 대상 기업</td>
                            </tr>
                            <tr>
                                <td class="no_left">2기</td>
                                <td>22</td>
                                <td class="small_space">3.22(화)~3.23(수), 2일</td>
                                <td class="small_space">2.29(월)9시~3.4(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">3기</td>
                                <td>23</td>
                                <td class="small_space">5.10(화)~5.11(수), 2일</td>
                                <td class="small_space">4.18(월)9시~4.22(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">4기</td>
                                <td>24</td>
                                <td class="small_space">6.8(수)~6.9(목), 2일</td>
                                <td class="small_space">5.16(월)9시~5.20(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">5기</td>
                                <td>25</td>
                                <td class="small_space">7.5(화)~7.6(수), 2일</td>
                                <td class="small_space">6.13(월)9시~6.17(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">6기</td>
                                <td>26</td>
                                <td class="small_space">8.17(수)~8.18(목), 2일</td>
                                <td class="small_space">7.25(월)9시~7.29(금)18시</td>
                                <td>150명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td rowspan=2>컨설턴트 장외영향평가서 작성자 교육</td>
                                <td class="no_left">1기</td>
                                <td>31</td>
                                <td class="small_space">3.24(목)~3.25(금), 2일</td>
                                <td class="small_space">3.2(수)9시~3.8(화)18시</td>
                                <td>100명</td>
                                <td>16시간</td>
                                <td rowspan=2>장외영향평가서 작성 컨설턴트</td>
                            </tr>
                            <tr>
                                <td class="no_left">2기</td>
                                <td>32</td>
                                <td class="small_space">9.7(수)~9.8(목), 2일</td>
                                <td class="small_space">8.16(화)9시~8.19(금)18시</td>
                                <td>100명</td>
                                <td>16시간</td>
                            </tr>
                            <tr>
                                <td rowspan=8>화학사고 대응과정<br></td>
                                <td class="no_left">일반 1기</td>
                                <td>41</td>
                                <td class="small_space">3.7(월)~3.11(금), 5일</td>
                                <td class="small_space">2.15(월)9시~2.19(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                                <td rowspan=14>소방, 경찰, 지자체, 환경, 민간전문가 등 유관기관</td>
                            </tr>
                            <tr>
                                <td class="no_left">일반 2기</td>
                                <td>42</td>
                                <td class="small_space">5.16(월)~5.20(금), 5일</td>
                                <td class="small_space">4.25(월)9시~4.29(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">일반 3기</td>
                                <td>43</td>
                                <td class="small_space">7.18(월)~7.22(금), 5일</td>
                                <td class="small_space">6.27(월)9시~7.1(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">일반 4기</td>
                                <td>44</td>
                                <td class="small_space">11.7(월)~11.11(금), 5일</td>
                                <td class="small_space">10.17(월)9시~10.21(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">실무 1기</td>
                                <td>45</td>
                                <td class="small_space">6.27(월)~7.1(금), 5일</td>
                                <td class="small_space">6.7(화)9시~6.10(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">실무 2기</td>
                                <td>46</td>
                                <td class="small_space">8.22(월)~8.27(금), 5일</td>
                                <td class="small_space">8.1(월)9시~8. 5(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">특별 1기</td>
                                <td>47</td>
                                <td class="small_space">9.26(월)~9.30(금), 5일</td>
                                <td class="small_space">9.5(월)9시~9.9(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left"><span style="font-size: 9pt">특별 2기</span></td>
                                <td>48</td>
                                <td class="small_space">11.21(월)~11.25(금), 5일</td>
                                <td class="small_space">10.31(월)9시~11.4(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td rowspan=2>화학사고 예방과정</td>
                                <td class="no_left"><span style="font-size: 9pt">일반</span></td>
                                <td>51</td>
                                <td class="small_space">4.18(월)~4.22(금), 5일</td>
                                <td class="small_space">3.28(월)9시~4.1(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td>실무</td>
                                <td>52</td>
                                <td class="small_space">8.29(월)~9.2(금), 5일</td>
                                <td class="small_space">8.8(월)9시~8.12(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td rowspan=2>화학사고 수습과정</td>
                                <td class="no_left"><span style="font-size: 9pt">일반 1기</span></td>
                                <td>61</td>
                                <td class="small_space">4.25(월)~4.29(금), 5일</td>
                                <td class="small_space">4. 4(월)9시~4. 9(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left"><span style="font-size: 9pt">일반 2기</span></td>
                                <td>62</td>
                                <td class="small_space">11.28(월)~12.2(금), 5일</td>
                                <td class="small_space">11. 7(월)9시~11.11(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td rowspan=2>유해화학물질 교육<br>강사양성과정</td>
                                <td class="no_left"><span style="font-size: 9pt">1기</span></td>
                                <td>71</td>
                                <td class="small_space">6.20(월)~6.24(금), 5일</td>
                                <td class="small_space">5.30(월)9시~6. 3(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">2기</td>
                                <td>72</td>
                                <td class="small_space">9.19(월)~9.23(금), 5일</td>
                                <td class="small_space">8.29(월)9시~9. 2(금)18시</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr></tr>
                            <tr>
                                <td rowspan=2>안전교육기관<br>운영자<br>역량강화과정</td>
                                <td class="no_left"><span style="font-size: 9pt">1기</span></td>
                                <td>81</td>
                                <td class="small_space">6.10(금), 1일</td>
                                <td class="small_space">5.23(월)9시~5.27(금)18시</td>
                                <td>40명</td>
                                <td>8시간</td>
                                <td rowspan=2>유해화학물질안전교육 기관 운영자, 교육강사 등</td>
                            </tr>
                            <tr>
                                <td class="no_left"><span style="font-size: 9pt">2기</span></td>
                                <td>82</td>
                                <td class="small_space">11.18(금), 1일</td>
                                <td class="small_space">10.24(월)9시~10.28(금)18시</td>
                                <td>40명</td>
                                <td>8시간</td>
                            </tr>
                            <tr></tr>
                            <tr>
                                <td rowspan=2>현장수습조정관<br>양성과정</td>
                                <td class="no_left"><span style="font-size: 9pt">1기</span></td>
                                <td></td>
                                <td class="small_space">4.22(금), 1일</td>
                                <td>별도공지</td>
                                <td>20명</td>
                                <td>8시간</td>
                                <td rowspan=4>유역(지방)환경청, 합동방재센터 대상</td>
                            </tr>
                            <tr>
                                <td class="no_left">2기</td>
                                <td></td>
                                <td class="small_space">6.17(금), 1일</td>
                                <td>별도공지</td>
                                <td>20명</td>
                                <td>8시간</td>
                            </tr>
                            <tr>
                                <td rowspan=2>합동방재센터<br>역량강화과정</td>
                                <td class="no_left"><span style="font-size: 9pt">1기</span></td>
                                <td></td>
                                <td class="small_space">3.28(월)~4. 1(금), 5일</td>
                                <td>별도공지</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                                <td class="no_left">2기</td>
                                <td></td>
                                <td class="small_space">10.17(월)~10.21(금), 5일</td>
                                <td>별도공지</td>
                                <td>40명</td>
                                <td>35시간</td>
                            </tr>
                            <tr>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div><!-- // Contents -->
        </div>
    </div>

    <!-- 풋터 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
    <!-- // 풋터 영역 -->