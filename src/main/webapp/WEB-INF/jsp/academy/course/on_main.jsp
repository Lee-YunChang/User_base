<%
/****************************************************
	system	: 일반교육 > 온라인 교육
	title	: 일반과정 신청 및 수강안내 목록
	summary	:	
	wdate	: 
	writer	: 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">


</script>

<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_online.jsp"%>
            <div class="path">
            	<ul>
                	<li><span class="home text-hide">홈</span></li>
                    <li>온라인 교육</li>
                    <li class="active">교육 안내</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
            	<section class="bgTop_cate01"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">교육 안내</h2>
            		</div>           	
	                 
	            </section>
            
            
                <section>
                    <div class="borBoxW3">
                        <ul class="li_dash">
                            <li class="po_C7 bold fnt15">상상스토리의 온라인교육은 <span class="po_C10">언제 어디서든 이용자 특성을 고려한 맞춤형 콘텐츠를 제공</span>합니다.</li>
                        </ul>
                        <p class="mrg_l10">※ 온라인 교육 수강을 위하여 회원가입이 필요합니다. 회원가입 시 학습이력 관리 등이 제공됩니다.</p>
                    </div>
                </section>

                <hr>
                <section>
                    <h3 class="main_tit">교육 안내</h3>
                    <div class="tblWrap">
                        <table class="dataTbl2 text-center">
                            <caption>과정소개(과목,교육목적,주요내용)</caption>
                            <colgroup>
                                <col style="width:25%">
                                <col style="width:30%">
                                <col style="width:25%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">교육 대상자</th>
                                    <th scope="col">과정</th>
                                    <th scope="col">과목</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <span>대출이용자 교육</span>
                                    </td>
                                    <td>
                                        <ul class="mrg_t5 mrg_b5">
                                            <li><a title="미소금융" class="a_link" href="/academy/course/onDetail.do?ref1=LON&mtScCode=SC1001">미소금융</a></li>
                                            <li><a title="햇살론" class="a_link" href="/academy/course/onDetail.do?ref1=LON&mtScCode=SC1002">햇살론</a></li>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul class="mrg_t5 mrg_b5">
                                        	<li style="margin: 5px;">24과목</li>
                                        	<li style="margin: 5px;">5과목</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>기관별 맞춤형 교육</span>
                                    </td>
                                    <td>
                                        <ul class="mrg_t5 mrg_b5">
                                        	<li><a title="희망·내일키움 통장" class="a_link" onclick="javascript:alert('준비중 입니다.');">희망·내일키움 통장</a></li>
                                            <!-- <li><a class="a_link" href="/academy/course/onDetail.do?ref1=ORGAN&mtScCode=SC4001">희망·내일키움 톨장</a></li> -->
                                            <li><a title="경기도 일하는 청년통장" class="a_link" href="/academy/course/onDetail.do?ref1=ORGAN&mtScCode=SC4002">경기도 일하는 청년통장</a></li>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul class="mrg_t5 mrg_b5">
                                        	<li style="margin: 5px;">준비중</li>
                                        	<li style="margin: 5px;">7과목</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>일반학습자 교육</span>
                                    </td>
                                    <td>
                                        <ul>
                                        	<li><a title="금융" class="a_link" href="/academy/course/onDetail.do?ref1=CNSMR&mtScCode=SC3002">금융</a></li>
                                            <li><a title="법률복지" class="a_link" href="/academy/course/onDetail.do?ref1=CNSMR&mtScCode=SC3003">법률복지</a></li>
                                            <li><a title="취업" class="a_link" href="/academy/course/onDetail.do?ref1=CNSMR&mtScCode=SC3004">취업</a></li>
                                            <li><a title="창업/사업운영" class="a_link" href="/academy/course/onDetail.do?ref1=CNSMR&mtScCode=SC3001">창업/사업운영</a></li>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul class="mrg_t5 mrg_b5">
                                        	<li style="margin: 5px;">15과목</li>
                                        	<li style="margin: 5px;">12과목</li>
                                        	<li style="margin: 5px;">17과목</li>
                                        	<li style="margin: 5px;">12과목</li>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>

                <hr>

                <section>
                    <h3 class="main_tit">진행과정</h3>
                    <div class="newStep">
                        <ul>
                            <li>
                                <div class="step01">
                                    <div>회원가입</div>                                    
                                </div>
                            </li>
                            <li class="li_arr"></li>
                            <li>
                                <div class="step02">
                                    <div>학습 전 평가</div>                                    
                                </div>
                            </li>
                            <li class="li_arr"></li>
                            <li>
                                <div class="step03">
                                    <div>과정 학습</div>                                    
                                </div>
                            </li>
                            <li class="li_arr"></li>
                            <li>
                                <div class="step04">
                                    <div>학습 후 평가</div>                                    
                                </div>
                            </li>  
                            <li class="li_arr"></li>                          
                            <li>
                                <div class="step05">
                                    <div>수료증 발급</div>                                    
                                </div>
                            </li> 
                            <li class="li_arr"></li>
                            <li>
                                <div class="step06">
                                    <div>이력관리</div>                                    
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>

            </div>
        </div>
    </article>
</div>
	
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->