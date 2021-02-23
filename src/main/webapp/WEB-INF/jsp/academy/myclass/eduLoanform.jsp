<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%
/****************************************
	subject	: 사용자 마이페이지 수료증 (집합교육)
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>수료확인서</title>
    <link rel="stylesheet" href="/academy/common/css/style.css">
    <link rel="stylesheet" href="/academy/common/fonts/font.css">
    <link rel="stylesheet" href="/academy/common/css/bootstrap_jy.css">
</head>
<body> 

	<div class="print_Certi gung">
            <div class="certi_top" style="height: 43px;"></div>
            <div class="certi_mid">
                <div class="certi_cont">
                    <p><img src="/academy/images/common/certifi_tit.png" alt="수료확인서"></p>
                    <div class="dl_certi_nm mi_10">
                        <dl class="dl_certi b_t">
                            <dt><img src="/academy/images/common/certifi_name.png" alt="성명"></dt>
                            <dd><span>${list[0].MBERNM}</span></dd>
                        </dl>

                        <dl class="dl_certi b_t">
                            <dt><img src="/academy/images/common/certifi_birth.png" alt="생일"></dt>
                            <dd><span>${list[0].BRTHDY}</span></dd>
                        </dl>
                    </div> <br/>
                    <p class="dl_certi_txt_ch">
                      <!--  <img src="/academy/images/common/certifi_txt.png" alt="위 사람은 창업자금대출 의무교육을 모두 수료하였습니다."> -->
                      위 사람은 ${list[0].FND_USECD_NM}-${list[0].GDNM}/${list[0].FND_KND_NM} 교육을 모두 수료하였습니다.
                    </p>
                    <!-- ${list[0].GDNM} -->
                </div>
				
                <div class="tblWrap certiTbl">
                    <table class="dataTbl text-center">
                        <caption>수료과정 목록</caption>
                        <colgroup>
                            <col style="width:26%">
                            <col style="width:*">
                            <col style="width:20%">
                            <col style="width:12%">
                        </colgroup>
                        <thead>
                            <tr style="height: 20px;">
                                <th scope="col" style="height: 20px;padding: 1px;">과정구분</th>
                                <th scope="col" style="height: 20px;padding: 1px;">과정명</th>
                                <th scope="col" style="height: 20px;padding: 1px;">수료일</th>
                                <th scope="col" style="height: 20px;padding: 1px;">시간</th>
                            </tr>
                        </thead>
                        <tbody>
                        	
                        	<c:set var="count" value="0" /> <!-- 총 시간 합계 -->
                           	<c:forEach items="${list}" var="result" varStatus="status">
                           <tr>
                           		<td style="height: 30px;padding: 1px;">${result.MT_SC_NAME}</td>
                           		<td style="height: 30px;padding: 1px;">${result.SEQ_TITLE}</td>
                           		<td style="height: 30px;padding: 1px;">${result.COMPDATE}</td>
                           		<td style="height: 30px;padding: 1px;">${result.STUDYTIME_TOT}분</td>
                           		<c:set var="count" value="${count + result.STUDYTIME_TOT}" />
                            </tr>
                           	</c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th scope="row" colspan="3" class="bgfoot" style="height: 30px;padding: 1px;">총 합계</th>
                                <td style="height: 30px;padding: 1px;">${count}분</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div clas="certi_sign">
                    <p class="ymd">${list[0].TODAY_HH}년 ${list[0].TODAY_MM}월 ${list[0].TODAY_DD}일</p>
                    <p class="text-center mrg_t15"><img src="/academy/images/common/certifi_from.png" alt="상상스토리"></p>
                </div>
            </div>
            <div class="certi_bot"></div>
        </div>
	<script type="text/javascript">
 		window.print();
 	</script>

</body>
</html>  