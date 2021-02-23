<%
/****************************************
    subject	: 나의공간  > 신청내역 > 상세세
    summary	:
    author	: 이진영
    date	: 2016-09-27
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
  
    // 목록
    function fnList() {
    	$("#frm").attr("action", "/academy/myclass/aprsltList.do").submit();
    }
    
    // 저장
    function fnExec(slno, sltno) {
    	var form = document.frm;
		form.slno.value = slno;
		form.sltno.value = sltno;
    	$("#frm").attr("action", "/academy/myclass/aprsltExec.do").submit();
    }
</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
            <div class="path">
            	<ul>
                	<li><span class="home text-hide">홈</span></li>
                    <li>나의공간</li>
                    <li class="active">신청내역</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
                 <section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
	                <div class="contTop">
	                	<h2 class="h2_tit">신청내역</h2>
	                </div>
	           </section>
                
				<form name="frm" id="frm" action="/academy/myclass/aprsltView.do" method="post">
				<input type="hidden" name="pageMode" id="pageMode" value=""/>
				<input type="hidden" name="slno" id="slno" value=""/>
				<input type="hidden" name="sltno" id="sltno" value=""/>
				<input type="hidden" name="fileno" id="fileno" value=""/>
				<input type="hidden" name="mtScCode" id="mtScCode" value=""/>
				<input type="hidden" name="qu" id="qu" value="${REQUEST_DATA.qu }"/>
				
				<section class="tableBox">
				<h3 class="main_tit">신청내역</h3>
					<div class="tblWrap">
                 	<table class="writeForm">
                 		<caption>신청내역</caption>
                         	<colgroup>
                             	<col style="width:25%">
                                 <col style="width:*">
                             </colgroup>
                             <tbody>
                             	<tr>
                                 	<th scope="row">신청자 성명</th>
                                     <td><c:out value="${result.APPLY_NM}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">신청자 소속</th>
                                     <td><c:out value="${result.APPLY_ORGAN_NM}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">신청지역</th>
									 <td>
									 	<%-- <c:out value="${result.SIDO_NAME}"/> <c:out value="${result.GU_NAME}"/> 
						            	<c:out value="${result.DONG_NAME}"/> <c:out value="${result.APPLY_ORGAN_ADDR}"/> --%>
										<c:out value="${result.LE_LNM_ADRES1}"/> (<c:out value="${result.LE_LNM_ZIP}"/>)<br />
										<c:out value="${result.LE_LNM_ADRES2}"/>
									 </td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육장소</th>
                                     <td><c:out value="${result.EDU_AREA}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">유선전화</th>
                                     <td><c:out value="${result.APPLY_TEL}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">휴대전화</th>
                                     <td><c:out value="${result.APPLY_PHONE}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">이메일 주소</th>
                                     <td><c:out value="${result.APPLY_EMAIL}"/></td>
                                 </tr>
                                  <tr>
                                     <th scope="row">교육 희망일시</th>
                                     <td>
                                     	<c:forEach items="${dateResult}" var="edu" varStatus="stat">
		                                     		<c:out value="${edu.EDU_SDATE}" /> ~ <c:out value="${edu.EDU_EDATE}" /> <br>
		                                </c:forEach> 
		                                 
                                     </td>
                                 </tr>
                                 
                                  <tr>
                                     <th scope="row">교육대상</th>
                                     <td>
                                     	<c:out value="${result.LEC_TARET_NAME}"/>
										<c:if test="${result.MT_LEC_TARGET_CODE == 'TG0007'}">(<c:out value="${result.TARGET_ETC}"/>)</c:if>
                                     </td>
                                 </tr>
                                 
                                 <tr>
                                     <th scope="row">참석 인원</th>
                                     <td><c:out value="${result.PERSON_CNT}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육 희망주제</th>
                                     <td><c:out value="${result.mtLctreName}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육 시설정보</th>
                                     <td><c:out value="${result.mtFcltsName}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row"><label for="etc1">기타내용</label></th>
									 <td><c:out value="${result.EDU_CONTENTS}"/></td>
                                 </tr>
                             </tbody>
                 		</table>
             		</div>
             		<hr>
             		<div class="btnAreaR">
						<a href="#none" onclick="fnList();return false;" class="btn btn-drkblue btn-sm" title="신청내역 목록">목록</a>
					</div>
            	 </section>

			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
