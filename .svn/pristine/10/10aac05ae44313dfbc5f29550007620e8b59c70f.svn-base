<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
    subject	: [공통] > 온라인 교육 > LEFT 영역
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
    	
    	$("#lecture11").on("click",function(){
    		alert("준비중 입니다.");
    		$("#lecture11").focus();
    	});
    });
    
</script>
<div class="leftMn">
    <h1 class="ltTitle">
        <span class="bold">온라인 교육</span>
    </h1>
    <nav>
        <ul class="leftNavi">
        	<li class="lnb_onMain"><a href="/academy/course/onMain.do" title="교육 안내">교육 안내</a></li>
        	<li class="lnb_lon"><a href="/academy/course/onDetail.do?ref1=LON&mtScCode=SC1001" title="대출이용자 교육">대출이용자 교육</a></li>
        	<!-- <li class="lnb_organ"><a href="/academy/course/onCategoryList.do?ref1=ORGAN" title="기관별 맞춤형 교육">기관별 맞춤형 교육</a></li> -->
        	<!-- <li class="lnb_organ"><a href="/academy/course/onDetail.do?ref1=ORGAN&mtScCode=SC4002" title="기관별 맞춤형 교육">기관별 맞춤형 교육</a></li> -->
        	<li class="lnb_organ"><a href="/gg.do" title="기관별 맞춤형 교육">기관별 맞춤형 교육</a></li>
        	<li class="lnb_cnsmr"><a href="/academy/course/onDetail.do?ref1=CNSMR&mtScCode=SC3002" title="일반학습자 교육">일반학습자 교육</a></li>
        	<!-- /academy/course/onDetail.do?ref1=EMP -->
        	<!-- <li class="lnb_emp"><a href="#none" id="lecture11">전문인력양성 교육</a></li> -->
        	<li class="lnb_emp"><a href="#none" onclick="Chkwwww()">전문인력양성 교육</a></li>
<!--         	<li class="lnb_relation"><a href="/academy/course/onDetailRelationCourse.do?&ref1=REL&mtScCode=SC8001" title="협력기관 교육">협력기관 교육</a></li> -->
        	<li class="lnb_relation"><a href="/academy/course/onDetail.do?&ref1=RELATION&mtScCode=SC8001" title="협력기관 교육">협력기관 교육</a></li>
        </ul>
    </nav>
</div>