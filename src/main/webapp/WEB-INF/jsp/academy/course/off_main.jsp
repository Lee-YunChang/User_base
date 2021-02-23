<%
/****************************************************
	system	: 집합교육
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
$(function(){
	
	$("#ready1_2").on("click",function(){
		alert("준비중 입니다.");
		$("#ready1_2").focus();
	});
	$("#ready1_3").on("click",function(){
		alert("준비중 입니다.");
		$("#ready1_3").focus();
	});
	$("#ready1_4").on("click",function(){
		alert("준비중 입니다.");
		$("#ready1_4").focus();
	});
	$("#ready1_5").on("click",function(){
		alert("준비중 입니다.");
		$("#ready1_5").focus();
	});
	$("#ready1_6").on("click",function(){
		alert("준비중 입니다.");
		$("#ready1_6").focus();
	});
});
</script>

<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_offline.jsp"%>
            <div class="path">
            	<ul>
                	<li><span class="home text-hide">홈</span></li>
                    <li>집합 교육</li>
                    <li class="active">교육 안내</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
                <section class="bgTop_cate02"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">교육안내</h2>
            		</div>           	
	            </section>
                
                <section>
	                <div class="borBoxW3">
	                    <ul class="li_dash">
	                        <li class="po_C7 fnt15"><strong>상상스토리</strong>에서는 <strong class="po_C10">대상자별 다양한 주제의 집합교육</strong>을 개설하고 있습니다.</li>
	                    </ul>
	                    <p class="mrg_l10">※ 집합교육 신청을 위하여 회원가입이 필요합니다. 회원가입 시 학습이력 관리 등이 제공됩니다.</p>
	                </div>
	            </section>
	
	            <hr>
	            <section>
	                <h3 class="main_tit">과정소개</h3>
	                <div class="tblWrap">
	                    <table class="dataTbl2 text-center">
	                        <caption>구분소개(구분,교육목적,주요과정)</caption>
	                        <colgroup>
	                            <col style="width:25%">
	                            <col style="width:30%">
	                        </colgroup>
	                        <thead>
	                            <tr>
	                                <th scope="col">구분</th>
	                                <th scope="col">교육목적</th>
	                                <th scope="col">주요과정</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td>
	                                    <span>대출이용자 교육</span>
	                                </td>
	                                <td>
	                                    <span>창업·경영에 대한 전문적인<br>지식 제공을 통한 자활지원</span>
	                                </td>
	                                <td>
	                                    <ul class="mrg_t5 mrg_b5">
	                                        <li><a title="창업금융" href="/academy/course/offDetail.do?ref1=LON&mtScCode=SC5001">창업금융</a></li>
	                                    </ul>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span>전문인력양성 교육</span>
	                                </td>
	                                <td>
	                                    <span>서민 및 취약계층의 접점에<br>있는 직원들의 역량 향상</span>
	                                </td>
	                                <td>
	                                    <ul>
	                                        <li><a title="금융소비자 상담과정" href="#none" id="ready1_2">금융소비자 상담과정</a></li>
	                                        <li><a title="강사 양성과정" href="#none" id="ready1_3">강사 양성과정</a></li>
	                                    </ul>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span>일반학습자 교육</span>
	                                </td>
	                                <td>
	                                    <span>금융 이해력 제고를 통한 적절한<br>의사결정을 할 수 있도록 지원</span>
	                                </td>
	                                <td>
	                                    <ul>
	                                        <li><a title="금융특강" href="#none" id="ready1_4">금융특강</a></li>
	                                        <li><a title="취업특강" href="#none" id="ready1_5">취업특강</a></li>
	                                    </ul>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>
	                                    <span>기관별 맞춤형 교육</span>
	                                </td>
	                                <td>
	                                    <span>유관기관의 특정 대상자에 대한<br>금융역량 향상</span>
	                                </td>
	                                <td>
	                                    <ul>
	                                        <li><a title="개설예정" href="#none" id="ready1_6">개설예정</a></li>
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
                                    <div>학습</div>                                    
                                </div>
                            </li>
                            <li class="li_arr"></li>
                            <li>
                                <div class="step03">
                                    <div>평가 및 결과</div>                                    
                                </div>
                            </li>
                            <li class="li_arr"></li>
                            <li>
                                <div class="step04">
                                    <div>수료증 발급</div>                                    
                                </div>
                            </li>  
                            <li class="li_arr"></li>                          
                            <li>
                                <div class="step05">
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