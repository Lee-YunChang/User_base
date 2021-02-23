<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
	subject	: [공통] > 안내공간 > LEFT 영역
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
	
</script>
<div class="leftMn">
    <h1 class="ltTitle">
        <span class="bold">자료실</span>
    </h1>
    <nav>
        <ul class="leftNavi">
			<li class="lnb_data6"><a href="/academy/dataRoom/dataroomBoardList.do?bcateno=6" title="생활 정보">생활 정보</a></li>
			<li class="lnb_comsenTest"><a href="/academy/helpdesk/comsenTestList.do" title="상식 TEST">상식 TEST</a></li>
			<li class="lnb_data9"><a href="http://www.fss.or.kr/fss/kr/info/financial/financedic.jsp" onclick="javascript:window.open(this.href,'새창','width=1100,height=800,scrollbars=yes');return false;" taget="_blank" class="a_2dep" title="용어사전">용어사전</a></li>
			<li class="lnb_data1041"><a href="/academy/dataRoom/dataroomBoardList.do?bcateno=1041" title="웹툰">웹툰</a></li>
			<li class="lnb_data1042"><a href="/academy/dataRoom/dataroomBoardList.do?bcateno=1042" title="카드뉴스">카드뉴스</a></li>
			
        </ul>
    </nav>
</div>