<%--
    Description : taglib include
    Modification Information
    
   	 수정일     수정자        	 수정내용
    -------     -----------------------------------
    2016.07.08  	SANGS           최초작성

--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/cfn.tld" prefix="cfn"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="ext" %>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<c:set var="req" value="${pageContext.request}"/>