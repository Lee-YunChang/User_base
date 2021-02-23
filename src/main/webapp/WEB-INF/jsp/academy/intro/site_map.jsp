<%
/****************************************
    subject	: 사이트맵
    summary	:
    author	: 김학규
    date	: 2015-06-04
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$(function(){
	$("#lecture4").on("click",function(){
		alert("준비중 입니다.");
	});
	
	$("#lecture10").on("click",function(){
		alert("준비중 입니다.");
	});
	
	$("#lecture16").on("click",function(){
		alert("준비중 입니다.");
	});
	$("#lecture4_1").on("click",function(){
		alert("준비중 입니다.");
	});
	$("#lecture4_2").on("click",function(){
		alert("준비중 입니다.");
	});
});

// 조회
function fnSearch(page) {

    if(page)
        $('#cPage').val(page);

    $('#frm').attr('target', '_self');
    $('#frm').submit();
}


function fnDetail(bbsNo){
    $('#bbsNo').val(bbsNo);
    $('form[name=frm]').attr('target', '_self');
    $('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/helpdesk/noticeView.do').submit();
}

function move_page(cPage){
    $('#cPage').val(cPage);
    $('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/helpdesk/noticeList.do').submit();
}
</script>

<div class="container" id="Subcontent">
	<article class="subArea">
        <div class="subCntWrap">
			
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_footer.jsp"%>
		
			<div class="path">
            	<ul>
                	<li><span class="home text-hide">홈</span></li>
                    <li>이용안내</li>
                    <li class="active">전체메뉴</li>
                </ul>
            </div>
			<div class="subConts" id="sub-content">
               <section class="bgTop_cate08"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			 <h2 class="h2_tit">전체메뉴</h2>
	            		</div>           	
	          	  </section>

			<section>
	            <ul class="siteAll">
	                <li>
	                    <dl>
	                        <dt class="text-center"><span>알림마당</span></dt>
	                        <dd>
	                            <ul class="site_dash">
	                               <li><a title="공지사항" href="/academy/helpdesk/noticeList.do">공지사항</a></li>
                                   <li><a title="소식" href="/academy/helpdesk/boardDataList.do?bcateno=4">소식</a></li>
                                   <li><a title="생활 정보" href="/academy/helpdesk/boardDataList.do?bcateno=6">생활 정보</a></li>
                                   <li><a title="자주묻는질문" href="/academy/helpdesk/faqList.do">자주묻는질문</a></li>
                                   <li><a title="상식 TEST" href="/academy/helpdesk/comsenTestList.do">상식 TEST</a></li>
                                   <li><a title="용어사전" href="http://www.fss.or.kr/fss/kr/info/financial/financedic.jsp" target="_blank">용어사전</a></li>
	                            </ul>
	                            <span class="siteIco site04"></span>
	                        </dd>
	                    </dl>
	                </li>
	                <li>
	                    <dl>
	                        <dt class="text-center"><span>회원서비스</span></dt>
	                        <dd>
	                            <ul class="site_dash">
	                                <li><a title="로그인" href="/academy/common/login.do">로그인</a></li>
	                                <li><a title="회원가입" href="/academy/user/memberJoinForm.do">회원가입</a></li>
	                                <li><a title="아이디/비밀번호 찾기" href="/academy/user/memberIdPw.do">아이디/비밀번호 찾기</a></li>
	                                <li><a title="개인정보관리" href="/academy/myclass/memberModifyAuthForm.do">개인정보관리</a></li>
	                            </ul>
	                            <span class="siteIco site09"></span>
	                        </dd>
	                    </dl>
	                </li>
	                <li>
	                    <dl>
	                        <dt class="text-center"><span>이용안내</span></dt>
	                        <dd>
	                            <ul class="site_dash">
	                                <li><a title="이용약관" href="/academy/intro/agree1.do">이용약관</a></li>
	                                <li><a title="개인정보처리방침" href="http://www.kinfa.or.kr/home/operation_guide/individual_information.jsp" onclick="javascript:window.open(this.href,'새창','width=1100,height=800');return false;" target="_blank" >개인정보처리방침</a></li>
	                                <li><a title="저작권보호정책" href="/academy/intro/agree3.do">저작권보호정책</a></li>
	                                <li><a title="찾아오시는 길" href="/academy/intro/introGuide.do">찾아오시는 길</a></li>
	                                <li><a title="전체메뉴" href="/academy/intro/siteMap.do">전체메뉴</a></li>
	                            </ul>
	                            <span class="siteIco site10"></span>
	                        </dd>
	                    </dl>
	                </li>
	            </ul>
	        </section>
				
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
</div>
<!-- footer -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>