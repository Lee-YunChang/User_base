<%
/****************************************************
	system	: academy > 회원 > 회원가입
	title	: 회원가입
	summary	:	
	wdate	: 2015-03-02
	writer	: kim hak gyu 
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
                        <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_etc.jsp"%>
                        <div class="path">
                            <ul>
                                <li><span class="home text-hide">홈</span></li>
                                <li>회원가입</li>
                                <li class="active">회원가입완료</li>
                            </ul>
                        </div>
                        <div class="subConts" id="sub-content">
                            <section class="contTop">                                
                                <h2 class="h2_tit">회원가입</h2>
                            </section>

                            <section>
                                <div class="borBox loginWrap">
                                    <span class="icoLogin complete"></span>
                                    <p class="cltTxt po_C7"><span class="po_C4">회원가입</span>이 완료되었습니다.</p>
                                    <p class="cltMsg"><strong>상상스토리 통합 교육포털에 <span class="po_C4">가입</span></strong>되셨습니다.<br>
                                    로그인을 통해 <strong>다양한 혜택(과정수강, 수료증 등)</strong>을 누릴 수 있습니다.</p>
                                    <div class="btnAreaC mrg_t20">
                                        <a href="/academy/common/login.do" class="btn btn-lg btn-blue">로그인</a>
                                        <a href="/academy/main/main.do" class="btn btn-lg btn-gray">홈으로</a>
                                    </div>
                                </div>

                            </section>


                        </div>
                    </div>
                </article>
            </div>

	<!-- 풋터 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
	<!-- // 풋터 영역 -->
