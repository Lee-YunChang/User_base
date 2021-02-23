<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
/****************************************
	subject	: 상단 공통영역
	summary	: 상단 공통영역
	author	: SANGS
	date	: 2016-06-01
****************************************/
%>

<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="java.util.List"%>
	
<% 
	
    pageContext.setAttribute("crlf", "\r\n");
    String academyPath = SangsProperties.getProperty("Globals.academy");
    
    /*사용자 권한 전역 변수*/
    String superGradeNo = SangsProperties.getProperty("Globals.userGradeNo_superAdmin");
    String tutorGradeNo = SangsProperties.getProperty("Globals.userGradeNo_eduMan");
    String userGradeNo = SangsProperties.getProperty("Globals.userGradeNo_normal");
    String tutorInCode = SangsProperties.getProperty("Globals.mtCode_MT_TUTOR_CODE_IN");
    String tutorOutCode = SangsProperties.getProperty("Globals.mtCode_MT_TUTOR_CODE_OUT");
    
    /*게시판 업로드 경로*/
    String uploadBbs =  SangsProperties.getProperty("Globals.classDeskBbsFilePath");
    
    /*파일 경로*/
    String fileRootUrl =  SangsProperties.getProperty("Globals.domain") + "/" + SangsProperties.getProperty("Globals.addFileRooturi");
    String addFileRooturi = SangsProperties.getProperty("Globals.addFileRooturi");
    
    /** 다운로드 bbs 경로 */
    String downBbsPath =  SangsProperties.getProperty("Globals.domain") + "/" + SangsProperties.getProperty("Globals.addFileRooturi") + "/" + SangsProperties.getProperty("Globals.bbsFilePath");
    
    /** 다운로드 경로 */
    String downFileRootPath = SangsProperties.getProperty("Globals.downFileRootPath");

    /* 파일 프리뷰 경로 */
    String type = ParamUtil.getStrParam(request.getParameter("type"), "CP_01")  ;
    String cdnUrl = SangsProperties.getProperty("Globals.CDNURL");  
    String url = cdnUrl + "/"+ type + "/01/start.html";
    /* 파일 프리뷰 경로끝 */
        
    String domain = SangsProperties.getProperty("Globals.domain");
    //String domains = SangsProperties.getProperty("Globals.domainSSL");
    //String domain = "";
    String domains = "";
    String godoDomain = SangsProperties.getProperty("Globals.godoDomain");
    String cDomain = SangsProperties.getProperty("Globals.contentsDomain"); //컨텐츠 도메인
    
    /*강의형태 */
    String MT_CTYPE_CODE_ONLINE = SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE");
    String MT_CTYPE_CODE_OFFLINE = SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_OFFLINE");
    
    /*과정 진행 상태 신청, 신청 종료 , 진행*/ 
    String MT_CSEQ_STATUS_CODE_APPLY = SangsProperties.getProperty("Globals.mtCode_MT_CSEQ_STATUS_CODE_APPLY");
    String MT_CSEQ_STATUS_CODE_APPLY_END = SangsProperties.getProperty("Globals.mtCode_MT_CSEQ_STATUS_CODE_APPLY_END");
    String MT_CSEQ_STATUS_CODE_STUDY = SangsProperties.getProperty("Globals.mtCode_MT_CSEQ_STATUS_CODE_STUDY");
%>

<c:set var="downBbsPath" value="<%=downBbsPath%>"/>

<c:set var="cmmnOnlineCode" value="<%=MT_CTYPE_CODE_ONLINE%>"/>
<c:set var="cmmnOfflineCode" value="<%=MT_CTYPE_CODE_OFFLINE%>"/>
