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
        <span class="bold">알림마당</span>
    </h1>
    <nav>
        <ul class="leftNavi">
            <li class="lnb_notice"><a href="/academy/helpdesk/noticeList.do" title="공지사항">공지사항</a></li>
			<li class="lnb_data4"><a href="/academy/helpdesk/boardDataList.do?bcateno=4" title="최근소식">최근소식</a></li>
			<li class="lnb_faq"><a href="/academy/helpdesk/faqList.do" title="자주묻는 질문">자주묻는 질문</a></li>
        </ul>
    </nav>
</div>