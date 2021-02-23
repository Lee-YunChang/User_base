<%
/****************************************
    system  : ClassDesk > 강사 > BBS 내용보기
    title   : 과제 목록
    summary :   
    wdate   : 2015-04-01
    writer  : SANGS
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>


<c:set var="bcateno"><c:out value="${REQUEST_DATA.bcateno}" default="${cfn:getProperty('Globals.bbsBcateClassData')}"/></c:set>
<c:set var="topMenuCode">
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassNotice')}">notice</c:if>
    <c:if test="${bcateno == cfn:getProperty('Globals.bbsBcateClassData')}">data</c:if>
</c:set>

<script type="text/javascript">
	
	// 페이징 이동 함수
	function fnList() {
		//$('#bbsForm').attr('target', '_self').attr('action', '/classdesk/bbs/list.do').submit();
		
		$('#bbsForm').attr('action', '/classdesk/main/main.do').submit();
		
	}
	
	//파일다운로드
	function filedown(fileId, bbsNo, fileSeq){
		var frm = document.bbsForm;
		frm.fileId.value = fileId;
		frm.bbsNo.value = bbsNo;
		frm.fileSeq.value = fileSeq;
		$('#bbsForm').attr('action', '/academy/bbsFiledown.do').submit(); 
	}
	
	//다음버튼 클릭
	function nextClick(bbsNo){
		if(bbsNo.length != 0){
			$("#bbsNo").val(bbsNo);
			$("#bbsForm").attr("action", "/classdesk/bbs/view.do").submit();
		}else{
			alert("처음페이지 입니다.");
			return;
		}
	}

	//이전버튼 클릭
	function prevClick(bbsNo){
		if(bbsNo.length != 0){
			$("#bbsNo").val(bbsNo);
			$("#bbsForm").attr("action", "/classdesk/bbs/view.do").submit();
		}else{
			alert("마지막페이지 입니다.");
			return;
		}
	}
</script>

<c:set var="bbsBcateClassNotice"><%=SangsProperties.getProperty("Globals.bbsBcateClassNotice")%></c:set>
<c:set var="bbsBcateClassData"><%=SangsProperties.getProperty("Globals.bbsBcateClassData")%></c:set>
<c:choose>
	<c:when test="${REQUEST_DATA.select eq 'list1' }">
		<span><c:set var="menuTitle">공지사항</c:set></span>
	</c:when>
	<c:otherwise>
		<span><c:set var="menuTitle">자료실</c:set></span>
	</c:otherwise>
</c:choose>
<div class="container" id="Subcontent">
	<article class="subArea">
        <div class="subCntWrap">
			
		<%-- <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_classdesk.jsp"%> --%>
		    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
		<div class="path">
            <ul>
                <li><span class="home text-hide">홈</span></li>
                <li>내강의실</li>
                <li class="active">${menuTitle}</li>
            </ul>
        </div>
		<div class="subConts" id="sub-content">
			<section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			 <h2 class="h2_tit">${menuTitle} <span class="ico_sec syber"><c:out value="${REQUEST_DATA.ctypeName}"/></span> <span class="po_C7 fnt12"><c:out value="${REQUEST_DATA.seqTitle}"/></span></h2>
            		</div>           	
	            </section>
             
			<form id="bbsForm" name="bbsForm"  method="post">
				<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
				<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
				<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
				<input type="hidden" name="bcateno"  id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/> 
				<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
				<input type="hidden" name="fileId"  id="fileId" value=""/>
				<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
				<input type="hidden" name="lnb_menu" id="lnb_menu" value="${lnb_menu}"/>
				<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK}">
				<%-- <input type="hidden" name="select" id="select" value="<c:out value="${REQUEST_DATA.select}"/>"/> --%>
				<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
				<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
			 	<input type="hidden" id="courseSelect" name="courseSelect" value="<c:out value="${REQUEST_DATA.courseSelect}"/>"/>
			</form>
			
			
			<!-- table -->
            <section class="tableBox">

                <div class="tblWrap">
                    <table class="writeForm">
                        <caption>공지사항 글상세</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col style="width:30%">
                            <col style="width:20%">
                            <col style="width:30%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">제목</th>
                                <td colspan="3"><c:out value="${rowData.TITLE}"/></td>
                            </tr>
                            <tr>
                                <th scope="row">작성일</th>
                                <td><c:out value="${rowData.WDATE}"/></td>
                                <th scope="row">조회수</th>
                                <td><c:out value="${rowData.RCNT}"/></td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="txt2">첨부파일</span></th>
                                <td colspan="3">
                                	<c:if test="${not empty listData}">
										<c:forEach items="${listData}" var="result" varStatus="status">
												<a href="#" onclick="filedown('<c:out value="${result.FILE_ID}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.FILE_SEQ}" />');return false;" class="btn-down" title="첨부파일 다운로드"><c:out value="${result.ORGFILE}"/></a><br>
										</c:forEach>
									</c:if>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="td_cont">
                                	<div style="min-height: 252px">
                                		<c:out value="${rowData.CONTENT}" escapeXml="false"/>
                                	</div>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>



                <hr>

                <div class="btnAreaR">
                    <a href="#" class="btn btn-drkblue btn-sm" onclick="fnList();return false">목록</a>
                </div>

                <hr>

                <div class="tblWrap">
                    <table class="writeForm prevNext">
                        <caption>이전글 다음글</caption>
                        <colgroup>
                            <col style="width:20%">
                            <col style="width:*">
                        </colgroup>
                        <tbody>
                            
                            <tr>
                                <th scope="row">
                                    <span class="list_up">다음글</span>
                                </th>
                                <c:choose>
									<c:when test="${rowData.BBSNO_NEXT_TITLE eq null or rowData.BBSNO_NEXT_TITLE eq ''}">
										<td> 다음글이 없습니다</td>	
									</c:when>
									<c:when test="${rowData.BBSNO_NEXT_TITLE ne null or nrowData.BBSNO_NEXT_TITLE ne ''}">
										<td><a href="#none" onclick="nextClick('<c:out value="${rowData.BBSNO_NEXT}"/>');return false"><c:out value="${rowData.BBSNO_NEXT_TITLE}"/></a></td>
									</c:when>
								</c:choose>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <span class="list_dw">이전글</span>
                                </th>
                               <c:choose>
									<c:when test="${rowData.BBSNO_PREV_TITLE eq null or rowData.BBSNO_PREV_TITLE eq ''}">
										<td> 이전글이 없습니다</td>	
									</c:when>
									<c:when test="${rowData.BBSNO_PREV_TITLE ne null or rowData.BBSNO_PREV_TITLE ne ''}">
										<td><a href="#none" onclick="prevClick('<c:out value="${rowData.BBSNO_PREV}"/>');return false"><c:out value="${rowData.BBSNO_PREV_TITLE}"/></a></td>
									</c:when>
								</c:choose>
                            </tr>
                        </tbody>
                    </table>
                </div>


            </section>
            <!--// table -->

		</div><!-- //sub-contents -->
	
	</div><!-- //sub-wrap -->
</article>
</div>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->