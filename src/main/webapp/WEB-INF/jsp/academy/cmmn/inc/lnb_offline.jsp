<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
    subject	: [공통] > 집합 교육 > LEFT 영역
    summary	: LEFT 영역
    author	: SANGS
    date	: 2015-06-01
****************************************/
%>
<script type="text/javascript">
    $(document).ready(function(){
		$('.ul_gnb').find('.gnb_<c:out value="${menu_nm}"/>').addClass('on');
		$('.leftNavi').find('.lnb_<c:out value="${lnb_menu}"/> a').addClass('active');
    });
    
$(function(){
    	
    	$("#ready1").on("click",function(){
    		alert("준비중 입니다.");
    		$("#ready1").focus();
    	});
    	$("#ready2_1").on("click",function(){
    		alert("준비중 입니다.");
    		$("#ready2_1").focus();
    	});
    	$("#ready2_2").on("click",function(){
    		alert("준비중 입니다.");
    		$("#ready2_2").focus();
    	});
    });
</script>
<div class="leftMn">
    <h1 class="ltTitle">
        <span class="bold">집합 교육</span>
    </h1>
    <nav>
        <ul class="leftNavi">
        	<li class="lnb_offMain"><a href="/academy/course/offMain.do" title="교육 안내">교육 안내</a></li>
        	<li class="lnb_lon"><a href="/academy/course/offDetail.do?ref1=LON&mtScCode=SC5001" title="대출이용자 교육">대출이용자 교육</a></li>
        	
        	<!-- <li class="lnb_organ"><a href="/academy/course/offDetail.do?ref1=ORGAN">유관기관 교육</a></li> -->
        	<li class="lnb_organ"><a id="ready2_1" href="#none" title="기관별 맞춤형 교육">기관별 맞춤형 교육</a></li>
        	<!-- <li class="lnb_cnsmr"><a href="/academy/course/offDetail.do?ref1=CNSMR">일반학습자 교육</a></li> -->
        	<li class="lnb_cnsmr"><a id="ready2_2" href="#none" title="일반학습자 교육">일반학습자 교육</a></li>
        	<!-- <li class="lnb_emp"><a href="/academy/course/offDetail.do?ref1=EMP">전문인력양성 교육</a></li> -->
        	<li class="lnb_emp"><a id="ready1" href="#none" title="전문인력양성 교육">전문인력양성 교육</a></li>
        	<li class="lnb_intro"><a href="/academy/course/introGuide.do" title="찾아오시는 길">찾아오시는 길</a></li>
        </ul>
    </nav>
</div>
