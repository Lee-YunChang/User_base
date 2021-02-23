<%--
	Description : 
	 
	Modification Information
	수정일		수정자			수정내용
	-------		-----------------------------------
	2015.04.01 	SANGS			최초작성

--%>

<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	HttpServletResponse res = ((HttpServletResponse) response);
	  //교차 프레임 스크립팅 방어 누락
	  res.addHeader("X-Frame-Options", "DENY");
	  //HTTP Strict-Transport-Security 헤더 누락
	  res.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
	  //Missing "X-Content-Type-Options" header
	  res.addHeader("X-Content-Type-Options", "nosniff");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Error</title>
    <link rel="stylesheet" href="/academy/common/css/style.css">
    <link rel="stylesheet" href="/academy/common/fonts/font.css">
    <link rel="stylesheet" href="/academy/common/css/bootstrap_jy.css">
</head>
<body>
	<a href="#Subcontent" class="sr-only sr-only-focusable">콘텐츠로 바로가기</a>
        <div id="Wrapper">
            <header>
                <div class="semin_header">
                    <!-- Navigation -->
                    <nav class="navbar navbar-default" role="navigation">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="globalWrap clearfix">
                            <div class="container center-block">
                            <a class="navbar-brand" href="/academy/main/main.do"><div class="logo"><span class="text-hide">상상스토리</span></div></a>


                            </div>
                        </div>

                    </nav>
                </div>

            </header>
            <!-- content -->
            <div class="container" id="Subcontent">
                <article class="subArea">
                    <div class="mrg_t10">

                        <section>
                            <div class="borBox loginWrap">
                                <span class="icoLogin error"></span>
                                <p class="cltTxt po_C9">죄송합니다.<br>요청하신 페이지를 찾을 수 없습니다.</p>
                                <p class="fnt16 bold mrg_t20"><span class="po_C10">방문하시려는 페이지의 주소</span>를 정확하게 입력하셨나요?<br>다시 한번 확인해 주세요! 감사합니다.</p>
                                <div class="btnAreaC mrg_t20">
                                    <a href="/academy/main/main.do" class="btn btn-lg btn-blue">홈페이지로 이동</a>
                                </div>
                            </div>

                        </section>

                    </div>
                </article>

            </div>
            <!--// content -->

        </div>

</body>
</html>