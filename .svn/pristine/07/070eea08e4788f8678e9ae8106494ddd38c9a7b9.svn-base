<%
/****************************************************
	system	: 과정관리 > 과정진행관리 > 과정별 출석부
	title	: 30시간 이상 출석부 출력
	summary	:	
	wdate	: 2016-05-11
	writer	: 
*****************************************************/
%>
<%@ page contentType="application/x-msdownload; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/cfn.tld" prefix="cfn"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="ext" %>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="com.sangs.util.SangsUtil" %>
<%@ page import="java.util.List"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.*"%>
<%
	String today = SangsUtil.getToday("yyyy-MM-dd");
	String fileNm = "강사이력서_"+today+".xls";
	String filename = new String(fileNm.getBytes("euc-kr"),"iso-8859-1");
	
	response.setContentType("application/x-msdownload;charset=utf-8");
    response.setHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(fileNm, "utf-8") + ";");
	
    DecimalFormat df = new DecimalFormat("00");
	Calendar currentCalendar = Calendar.getInstance();
	//현재 날짜 구하기
	String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
	String strMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
	String strDay = df.format(currentCalendar.get(Calendar.DATE));
	String strDate = strYear + strMonth + strDay;
%>
<html>
    <head>
        <meta http-equiv='Content-Type' content='application/x-msdownload; charset=utf-8'/>
        <title>이 력 서</title>
        <style type="text/css">
            /* reset */
            body,div,dl,dt,dd,ul,li,ol,h1,h2,h3,h4,h6,pre,code,fieldset,legend,textarea,p,blockquote,th,td,input,select,textarea,button{margin:0;padding:0}
            fieldset,img{border:0 none}
            blockquotemq,li{list-style:none}
            blockquote::before, blockquote:after,q::before,q::before,q::after{content:'';content:none}
            button{border:0}
            table{border-collapse:collapse;border-spacing:0;width:100%}
            body{font-size:14px;color:#000;font-family: NanumGothic,Gulim}
            .resumeWrap{width:700px;border:2px solid #999;margin:20px auto}
            .top{padding:20px;font-size: 30px;color:#000;text-align: center;}
            .tblBox{border-top:1px solid #999;border-bottom:1px solid #999}
            .writeForm tbody th{background:#f1f1f1;padding:3px 15px ;height:40px;text-align: center;border-bottom:1px solid #ccc;border:1px solid #ccc;color:#000}
            .writeForm tbody td{padding:3px 15px;height:40px;border-bottom:1px solid #ccc;border:1px solid #ccc;}
            .writeForm tr > th:first-child{border-left:0}
            .writeForm tr > td:last-child{border-right:0}

            caption{font-size: 0;text-indent: -9999px}
            .form-control{width:100%;display: block;padding:7px}
            .name{width:120px;display: inline-block;}
            .bottom{padding:20px 50px}
            .bottom > p{margin:20px 0}

        </style>
    </head>
    <body>
        <div class="resumeWrap">
        	<table>
        		<tr>
        			<td colspan="9" class="top">
        				이 &nbsp; &nbsp;  력 &nbsp; &nbsp; 서
        			</td>
        		</tr>
        		<tr>
        			<td colspan="9">
        			</td>
        		</tr>
       		</table>
            <div class="middle">
                <div class="tblBox">
                    <table class="writeForm">
                        <colgroup>
                            <col style="width:17%">
                            <col style="width:33%">
                            <col style="width:17%">
                            <col style="width:33%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row" colspan="2">성명</th>
                                <td colspan="2">${tutor[0].MBERNM}</td>
                                <th scope="row" colspan="2">생년월일</th>
                                <td colspan="3">${tutor[0].BRTHDY}</td>
                            </tr>
                            <tr>
                                <th scope="row" colspan="2">연락처</th>
                                <td colspan="2">${tutor[0].MOBLPHON}
                                </td>
                                <th scope="row" colspan="2">이메일</th>
                                <td colspan="3">
                                	${tutor[0].EMAIL}
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" colspan="2">주소</th>
                                <td colspan="7">
                                	${tutor[0].LNM_ADRES1} ${tutor[0].LNM_ADRES2}
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" colspan="2">최종학력</th>
                                <td colspan="7">
                                	${tutor[0].MT_ACDMCR_NAME}
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" colspan="2">학교</th>
	                                <td colspan="2">
	                                	${tutor[0].SCHUL}
	                                </td>
                                <th scope="row" colspan="2">전공</th>
	                                <td colspan="3">
	                                	${tutor[0].MAJOR}
	                                </td>
                            </tr>
                            <tr>
                            	<td colspan="9">
                            	</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="tblBox" style="margin-top:5px">
                    <table class="writeForm">
                        <colgroup>
                            <col style="width:9%">
                            <col style="width:*">
                            <col style="width:20%">
                            <col style="width:20%">
                            <col style="width:20%">

                        </colgroup>
                        <tbody>
                        	<tr>
                        		<th colspan='9' style='text-align: center;'>경 력 사 항</th>
                        	</tr>
                            <tr>
                                <th scope="col" colspan="2">입사년월</th>
                                <th scope="col" colspan="2">퇴사년월</th>
                                <th scope="col" colspan="2">회사</th>
                                <th scope="col" style="border-right:0" colspan="3">부서/직위</th>
                            </tr>
                            <c:forEach var="data" items="${jobList}">
                            	<tr>
	                                <td colspan="2">${data.WORK_IN_DT }</td>
	                                <td colspan="2">${data.WORK_OUT_DT }</td>
	                                <td colspan="2">${data.WORK_NM }</td>
	                                <td colspan="3">${data.DEPT_INFO }</td>
	                            </tr>
                            </c:forEach>
                            <tr>
                            	<td colspan="9">
                            	</td>
                            </tr>
                            <tr>
                        		<th colspan='9' style='text-align: center;'>강 의 이 력</th>
                        	</tr>
                            <tr>
                                <th scope="col" colspan="2">교육기관</th>
                                <th scope="col" colspan="2">교육대상</th>
                                <th scope="col" colspan="2">교육기간</th>
                                <th scope="col" style="border-right:0" colspan="3">강의주제</th>
                            </tr>
                            <c:forEach var="data" items="${hisList}">
                            	<tr>
	                                <td colspan="2">${data.APPLY_ORGAN }</td>
	                                <td colspan="2">${data.TARGET }</td>
	                                <td colspan="2">${data.START_DT} ~ ${data.END_DT}</td>
	                                <td colspan="2">${data.THEMA }</td>
	                            </tr>
                            </c:forEach>
                            <c:forEach var="data" items="${resultList}">
                            	<tr>
	                                <td colspan="2">${data.APPLY_ORGAN_NM }</td>
	                                <td colspan="2">${data.TARGET_NAME }</td>
	                                <td colspan="2">${data.DS_SDATE } ~ ${data.DS_EDATE }</td>
	                                <td colspan="3">${data.mtLctreName }</td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="bottom">
                    <p style="text-align:center">위에 기재한 사항은 틀림이 없습니다.</p>
                    <p style="text-align:center">&nbsp; &nbsp;<%=strYear%>년 &nbsp;<%=strMonth%>월 &nbsp;<%=strDay%>일</p>
                    <p style="text-align:right"><span>성명: </span><span class="name">${tutor[0].MBERNM}</span><span>(인)</span></p>
                </div>



            </div>
        </div>

    </body>
    </html>
