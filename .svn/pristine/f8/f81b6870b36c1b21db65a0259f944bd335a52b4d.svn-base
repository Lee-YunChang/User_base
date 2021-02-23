<%
/****************************************
    subject	: 나의강의실 > 수강 리스트
    summary	:
    author	: 이진영
    date	: 2016-09-27
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/common/js/sangs_core.js"></script>

<script type="text/javascript">

    function fnList(){
        location.href='/academy/myclass/myclassList.do';
    } 

    //일반과정 신청취소
    function fnCancel(cuserno, pmStatusCode, seqTitle){
        if( $('#multipleCancelYn').val() == 'Y'){
            alert('취소중입니다 잠시만 기다려주세요.');
            return false;
        }

        var msg = '과정 신청을 취소하시겠습니까?';
        if(confirm(msg)){
            $('#multipleCancelYn').val('Y');
            //$('input[name=paymentUid]').val(paymentUid);
            $('input[name=seqTitle]').val(seqTitle);
            $('input[name=cuserno]').val(cuserno);
            $('input[name=pmStatusCode]').val(pmStatusCode);
            $('#cancelForm').attr('target', '_self').attr('method', 'post').attr('action', '<c:out value="${ctx}"/>/academy/course/common/cancel_exec.do').submit();
        }
    }

    //클래스데스크 이동
    function fnClassdesk(cuserNo, courseno, cseqno, userNo, CLASSDESK, seqTitle, ctypeName, mtEduinfoCode){
    	var form = document.classForm;
    	var ctypeName = ctypeName;
    	if(mtEduinfoCode == '1'){
    		ctypeName = '의무교육';
    	}
    	form.userNo.value = userNo;
    	form.paramcUserNo.value = cuserNo;
    	form.paramcSeqNo.value = cseqno;
    	form.CLASSDESK.value = CLASSDESK;
    	form.paramCourseNo.value = courseno;
    	form.seqTitle.value = encodeURIComponent(seqTitle);
    	form.ctypeName.value = encodeURIComponent(ctypeName);
        $('#classForm').attr('action', '/classdesk/main/main.do');
        $('#classForm').attr('target', '');
        $('#classForm').submit();

        //SANGS.Util.openPopupSubmit($('#classForm'), 'classdesk_pop', 'width='+w1+', height='+h1+', top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');//, resizable=no
    }

    //등록후 리턴 페이지
    function fnList(){
        $('#rForm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do').submit();
    }

    
    
    function fnLoanCertPrint(){
    	if($('#loanPrdCode').valueEmpty('대출상품을 선택해 주세요.')) return false;
    	 if($('#pass_yn').val() == 'Y'){
            var w1 =1070;
            var h1 = 900;
			$('#rForm').attr('action', '/academy/common/eduLoanform.do');
            SANGS.Util.openPopupSubmit($('#rForm'), 'certLoan_pop', 'width='+w1+', height='+h1+', top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
			
		}else{
			alert('"'+$('#loanPrdGrpNm').val()+'-'+$('#loanPrdNm').val()+'/'+$('#loanKndNm').val()+ '" 대출상품의 과목을  \n이수하지 않아 수료증출력은 불가합니다.');
		}
    	 
    	
    }
    
    //수료증 출력
    function fnCertPrint(cuserNo, courseno, cseqno, userNo , subCmd,sdate,edate){
    	var mtcTypeCodeOnline = '<%=SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE")%>';
    	if(subCmd == mtcTypeCodeOnline){//온라인학습이면
    		subCmd = "01";
    	}
    	else {//집합과정이면
    		subCmd = "02";
    	}
    	
        $('#certPrintForm > input[name=subcmd]').val(subCmd);
        $('#certPrintForm > input[name=userNo]').val(userNo);
        $('#certPrintForm > input[name=cuserNo]').val(cuserNo);
        $('#certPrintForm > input[name=courseNo]').val(courseno);
        $('#certPrintForm > input[name=cseqNo]').val(cseqno);
        $('#sdate').val(sdate);
        $('#edate').val(edate);
        var w1 =1070;
        var h1 = 900;

        SANGS.Util.openPopupSubmit($('#certPrintForm'), 'cert_pop', 'width='+w1+', height='+h1+', top=0, left=0, resizable=yes, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
    }

    //수료증 출력 안내
    function fnGuidePop(){
        window.open('/academy/myclass/compGuidePop.do','guidePop','width=790, height=800, scrollbars=YES');
    }

    //과정 삭제
    function fnDelete(cuserNo, userNo){
        var msg = '과정 및 수강 정보를 삭제하실 경우 복구가 불가능합니다.\n그래도 삭제하시겠습니까?';

        if(confirm(msg)){
            $('#delForm > input[name=CUSERNO]').val(cuserNo);
            $('#delForm > input[name=USERNO]').val(userNo);

            $('#delForm').submit();
        }
    }
    
    function selectLoanDatas(data){
    	$('#loanFindYn').val('Y');
    	$('#loanPrdGrp').val(data.pcode);
    	$('#loanPrdGrpNm').val(data.pname);
    	$('#loanPrdCode').val(data.code);
    	$('#loanPrdNm').val(data.name);
    	$('#loanKndCode').val(data.knd);
    	$('#loanKndNm').val(data.kndnm);
    	$('#rForm')
    		.attr('target', '_self')
    		.attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do')
    		.attr('method', 'POST')
    		.submit();
    }
    
    
    
    function goList(){
    	$('#loanPrdGrp').val('');
    	$('#loanPrdGrpNm').val('');
    	$('#loanPrdCode').val('');
    	$('#loanPrdNm').val('');
    	$('#loanKndCode').val('');
    	$('#loanKndNm').val('');
    	
    	$('#rForm')
    		.attr('target', '_self')
    		.attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do')
    		.attr('method', 'POST')
    		.submit();
    	
    }
    

</script>

<c:set var="MT_PM_STATUS_CODE_NOTPAY" value='<%=SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_NOTPAY") %>' /><!-- CourseCmmCode.MT_PM_STATUS_CODE_NOTPAY -->
<c:set var="MT_PM_STATUS_CODE_INPAY" value='<%=SangsProperties.getProperty("Globals.mtCode_MT_PM_STATUS_CODE_INPAY") %>' /><!-- CourseCmmCode.MT_PM_STATUS_CODE_INPAY -->
<c:set var="MT_SUPPORT_CARD_CODE_NOT" value='<%=SangsProperties.getProperty("Globals.mtCode_MT_SUPPORT_CARD_CODE_NOT") %>' /><!-- CourseCmmCode.MT_SUPPORT_CARD_CODE_NOT -->

<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
            <div class="path">
                <ul>
                    <li><span class="home text-hide">홈</span></li>
                    <li>내강의실</li>
                    <li class="active">수강현황</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
            	<section class="bgTop_cate05"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">수강현황</h2>
            		</div>           	
	            </section>
            	
                
			<!-- 리턴 폼 -->
            <form name="rForm" id="rForm" action="" target="_self">
                <input type="hidden" name="subcmd"/>
                <input type="hidden" name="loanPrdGrp" id="loanPrdGrp" value="${REQUEST_DATA.loanPrdGrp }"/>
                <input type="hidden" name="loanPrdGrpNm" id="loanPrdGrpNm" value="${REQUEST_DATA.loanPrdGrpNm }"/>
                <input type="hidden" name="loanPrdCode" id="loanPrdCode" value="${REQUEST_DATA.loanPrdCode }"/>
                <input type="hidden" name="loanPrdNm" id="loanPrdNm" value="${REQUEST_DATA.loanPrdNm }"/>
                <input type="hidden" name="loanKndCode" id="loanKndCode" value="${REQUEST_DATA.loanKndCode }"/>
                <input type="hidden" name="loanKndNm" id="loanKndNm" value="${REQUEST_DATA.loanKndNm }"/>
                <input type="hidden" name="userNo" id="userNo" value="${REQUEST_DATA.SES_USERNO}"/>
                <input type="hidden" name="loanFindYn" id="loanFindYn" value=""/>
                
                <!-- view에서 사용하는 필드 --> 
                <input type="hidden"  id="pass_yn" value="${resultLoanPassInfo.PASS_YN }"/>
            </form>
            <!-- CLASSDESK 폼 -->
            <form name="classForm" id="classForm" action="/classdesk/main.do" method="post">
                <input type="hidden" name="subcmd" id="class_subcmd"/>
                <input type="hidden" name="userNo" id="userNo" value=""/>
                <input type="hidden" name="paramCourseNo" id="paramCourseNo" value=""/>
                <input type="hidden" name="paramcSeqNo" id="paramcSeqNo" value=""/>
                <input type="hidden" name="paramcUserNo" id="paramcUserNo" value=""/>
                <input type="hidden" name="CLASSDESK" id="CLASSDESK"/>
                <input type="hidden" name="seqTitle" id="seqTitle"/>
    			<input type="hidden" name="ctypeName" id="ctypeName"/>
            </form>

            <!-- 수료증 출력 폼 -->
            <form name="certPrintForm" id="certPrintForm" action="<c:out value="${ctx}"/>/academy/common/eduform.do">
                <input type="hidden" name="subcmd" id="subcmd" value=""/>
                <input type="hidden" name="userNo" id="userNo" value=""/>
                <input type="hidden" name="courseNo" id="courseNo" value=""/>
                <input type="hidden" name="cseqNo" id="cseqNo" value=""/>
                <input type="hidden" name="cuserNo" id="cuserNo" value=""/>
                <input type="hidden" name="sdate" id="sdate" value=""/>
                <input type="hidden" name="edate" id="edate" value=""/>
            </form>


            <!-- 신청취소 폼 -->
            <form name="cancelForm" id="cancelForm" action="">
                <!-- 임시 -->
                <input type="hidden" name="paymentUid" />
                <input type="hidden" name="cuserno" />
                <input type="hidden" name="pmStatusCode" />
                <input type="hidden" name="seqTitle" />
                <input type="hidden" name="eduMode" value="M"/>
                <input type="hidden" id="multipleCancelYn" name="multipleCancelYn" value="N" />

            </form>

            <!-- 과정삭제 폼 -->
            <form name="delForm" id="delForm" action="<c:out value="${ctx}"/>/academy/myclass/del_course_exec.do" method="post">
                <input type="hidden" name="CUSERNO" />
                <input type="hidden" name="USERNO" />
            </form>
            
            <section>
            	<div class="infoBox">
                	<div class="infoBody">
                    	<ul class="li_dash">
                        	<li>본 페이지에서는 고객님의 교육 수강 현황을 조회하실 수 있습니다.</li>
                            <li>교육을 완료하신 경우에 한하여 수료증 출력이 가능합니다.</li>
                         </ul>
                         <a href="#" onclick="fnGuidePop();return false;" class="btn btn-sm btn-default" title="수료증출력">수료증 출력안내 <span class="icon arr_rig"></span></a>
                   		<!-- <button type="button" class="btn btn-sm btn-mint mrg_l5" name="">수료확인서 출력</button> -->
                    </div>
                </div>
            </section>
            <hr class="hr_20">
            <section>
            	<div class="text-right">
	            	
	            	<button class="btn btn-sm btn-orange" type="button" data-toggle="modal" data-target="#ch_myClass" title="대출상품 검색">대출상품 검색</button>
	            	<button class="btn btn-sm btn-drkblue" type="button" onclick="goList(); return false;" title="강좌 전체조회">강좌 전체조회</button>
            	</div>
            	
            	
            	<c:if test="${not empty REQUEST_DATA.loanPrdCode}">
                <div class="text-right" style="margin-top: 10px;">
                	<span class="ch_class">
	            		<strong class="po_C4 bold">${REQUEST_DATA.loanPrdGrpNm} - ${REQUEST_DATA.loanPrdNm } /  ${REQUEST_DATA.loanKndNm } </strong>상품의 강좌가 선택되었습니다.
	            	</span>
                </div>
                </c:if>
             
            </section> 
			<div class="contents" id="sContents">
				<section>
                	<h3 class="main_tit mrg_t20">온라인교육(수강중)</h3>
                   	<div class="classListwrap">
                    <c:choose>
			        	<c:when test="${not empty listData && onLectureCount > 0 }">
			                <c:forEach items="${listData}" var="result" varStatus="stat">
                         		<c:if test="${result.MT_CTYPE_NM eq '온라인교육' && result.ISPASS ne 'Y'}">
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
	                                        <table>
	                                        <caption>온라인교육과정 정보</caption>
	                                        <tbody>
	                                        <tr>
	                                            <th scope="row">교육과정</th>
	                                            <td><c:out value="${result.SEQ_TITLE}"/></td>
	                                        </tr>
	                                        <tr>
		                                       <th scope="row">진도율</th>
			                                    <td>
				                                    <div class="graf-wrap">
														<div class="persent">
															<c:if test="${result.PROG_PER >= 100}">
																	100<%-- <c:out value="${result.PROG_PER}" default="0"/> --%>
																</c:if>
																<c:if test="${result.PROG_PER ne 100 and result.PROG_PER >= 1 and result.PROG_PER < 100}">
																	<%-- <fmt:formatNumber value="${result.PROG_PER}" pattern=".00"/> --%>
																	<fmt:parseNumber value="${result.PROG_PER}" integerOnly='true'/>
																</c:if>
																<c:if test="${result.PROG_PER ne 100 and result.PROG_PER > 0 and result.PROG_PER < 1}">
																	0
																</c:if>
																<c:if test="${result.PROG_PER ne 100 and result.PROG_PER eq 0}">
																	0
																</c:if>
																%
															</div>
														<div class="grafbox">
															<div class="graf">
																<div class="grafing" style="width:<c:out value="${result.PROG_PER}" default="0"/>%"></div>
															</div>
														</div>
													</div>
			                                    </td> 
		                                     </tr>
		                                    </tbody>
		                                    </table>
	                                    </div>
	                                    <div class="col-sm-6 col-xs-12">
                                        	<div class="tblCellwrap">
                                            	<div class="tblCell"><!-- 버튼 일때 비활성화 disabled / a태그일때 disabled 클래스 추가 -->
													<button type="button" class="btn btn-orange btn-sm" onclick="fnCancel('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.MT_PM_STATUS_CODE}"/>','<c:out value="${result.SEQ_TITLE}" />'); return false;" title="신청취소">신청취소</button>		
													<c:choose>
														<c:when test="${result.ISPASS eq 'Y'}">
															<button type="button" class="btn btn-drkblue btn-sm" onclick="fnCertPrint('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>' , '<c:out value="${result.MT_CTYPE_CODE }"/>','<fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyy.MM.dd" />','<fmt:formatDate value="${result.STUDY_EDATE}" pattern="yyyy.MM.dd" />');"  title="수료증(수료)">수료증</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="btn btn-drkblue btn-sm" onclick="javascript:alert('수료된 과정이 아닙니다.')" title="수료증(미수료)" disabled="disabled">수료증</button>
														</c:otherwise>
													</c:choose>	
														
		                                            <c:choose>
														<c:when test="${result.MT_CTYPE_CODE eq REQUEST_DATA.mtCtypeCodeOnline}">
															<button type="button" onclick="fnClassdesk('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${result.CLASS_DESK}"/>','<c:out value="${result.SEQ_TITLE}"/>','<c:out value="${result.MT_CTYPE_NAME}"/>','<c:out value="${result.MT_EDUINFO_CODE}"/>');"  class="btn btn-blue btn-sm" title="강의실(입장)">강의실</button>
														</c:when>
													</c:choose>
	                                        	</div>
	                                    	</div>
                                		</div>
                            		</div>
                               	</c:if>
                           	</c:forEach>
                       	</c:when>
                       	<%-- <c:when test="${lectureCount.ONLINE_CNT <= 0}">
                        		수강중인 온라인 교육이 없습니다.
                        </c:when> --%>
                       	<c:otherwise>
                       		수강중인 온라인 교육이 없습니다.
                       	</c:otherwise>
                   	</c:choose>
             	</div>
             	
             	<section>
                	<h3 class="main_tit mrg_t20">온라인교육(수료)</h3>
                   	<div class="classListwrap">
                    <c:choose>
			        	<c:when test="${not empty listData && onLectureCount > 0}">
			                <c:set var="ONISCNT" value="0"/>
			                <c:forEach items="${listData}" var="result" varStatus="stat">
                         		<c:if test="${result.MT_CTYPE_NM eq '온라인교육' && result.ISPASS eq 'Y'}">
                         		<c:set var="ONISCNT" value="${ONISCNT+1}"/>
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
	                                        <table>
	                                        <caption>수료 온라인교육과정 정보</caption>
	                                        <tbody>
	                                        <tr>
	                                            <th scope="row">교육과정</th>
	                                            <td><c:out value="${result.SEQ_TITLE}"/></td>
	                                        </tr>
	                                        <tr>
		                                       <th scope="row">진도율</th>
			                                    <td>
				                                    <div class="graf-wrap">
														<div class="persent">
															<c:if test="${result.PROG_PER >= 100}">
																	100<%-- <c:out value="${result.PROG_PER}" default="0"/> --%>
																</c:if>
																<c:if test="${result.PROG_PER ne 100 and result.PROG_PER >= 1 and result.PROG_PER < 100}">
																	<%-- <fmt:formatNumber value="${result.PROG_PER}" pattern=".00"/> --%>
																	<fmt:parseNumber value="${result.PROG_PER}" integerOnly='true'/>
																</c:if>
																<c:if test="${result.PROG_PER ne 100 and result.PROG_PER > 0 and result.PROG_PER < 1}">
																	0
																</c:if>
																<c:if test="${result.PROG_PER ne 100 and result.PROG_PER eq 0}">
																	0
																</c:if>
																%
															</div>
														<div class="grafbox">
															<div class="graf">
																<div class="grafing" style="width:<c:out value="${result.PROG_PER}" default="0"/>%"></div>
															</div>
														</div>
													</div>
			                                    </td> 
		                                     </tr>
		                                    </tbody>
		                                    </table>
	                                    </div>
	                                    <div class="col-sm-6 col-xs-12">
                                        	<div class="tblCellwrap">
                                            	<div class="tblCell"><!-- 버튼 일때 비활성화 disabled / a태그일때 disabled 클래스 추가 -->
                                                    <button type="button" class="btn btn-orange btn-sm" onclick="fnCancel('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.MT_PM_STATUS_CODE}"/>','<c:out value="${result.SEQ_TITLE}" />'); return false;" title="신청취소">신청취소</button>		
													<c:choose>
														<c:when test="${result.ISPASS eq 'Y'}">
															<button type="button" class="btn btn-drkblue btn-sm" onclick="fnCertPrint('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>' , '<c:out value="${result.MT_CTYPE_CODE }"/>','<fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyy.MM.dd" />','<fmt:formatDate value="${result.STUDY_EDATE}" pattern="yyyy.MM.dd" />');"  title="수료증(수료)">수료증</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="btn btn-drkblue btn-sm" onclick="javascript:alert('수료된 과정이 아닙니다.')" title="수료증(미수료)" disabled="disabled">수료증</button>
														</c:otherwise>
													</c:choose>	
														
		                                            <c:choose>
														<c:when test="${result.MT_CTYPE_CODE eq REQUEST_DATA.mtCtypeCodeOnline}">
															<button type="button" onclick="fnClassdesk('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${result.CLASS_DESK}"/>','<c:out value="${result.SEQ_TITLE}"/>','<c:out value="${result.MT_CTYPE_NAME}"/>','<c:out value="${result.MT_EDUINFO_CODE}"/>');"  class="btn btn-blue btn-sm" title="강의실(입장)">강의실</button>
														</c:when>
													</c:choose>
	                                        	</div>
	                                    	</div>
                                		</div>
                            		</div>
                               	</c:if>
                           	</c:forEach>
                           	<c:if test="${ONISCNT == 0}">
                           		수료한 온라인 교육이 없습니다.
                           	</c:if>
                       	</c:when>
                       	<c:otherwise>
                       		수료한 온라인 교육이 없습니다.
                       	</c:otherwise>
                   	</c:choose>
             	</div>
              	</section>
              	
              	<hr>
              	
              	</section>

                            <hr>
                            <section>
                                <h3 class="main_tit mrg_t20">집합교육(수강중)</h3>
                                <div class="classListwrap">
                                <c:choose>
                                <c:when test="${not empty listData  && offLectureCount > 0}">
					                <c:forEach items="${listData}" var="result" varStatus="stat">
                               			<c:if test="${result.MT_CTYPE_NM eq '집합교육' && result.ISPASS ne 'Y'}">
		                                    <div class="row">
		                                        <div class="col-sm-6 col-xs-12">
		                                            <table>
		                                                <caption>집합교육과정 정보</caption>
		                                                <tbody>
		                                                    <tr>
		                                                        <th scope="row">교육과정</th>
		                                                        <td><c:out value="${result.SEQ_TITLE}"/></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th scope="row">학습기간</th>
		                                                        <td>
			                                                        <c:if test="${result.OPENTYPE eq 'D'}">
																			<dd><fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyy.MM.dd" /> ~  <fmt:formatDate value="${result.STUDY_EDATE}" pattern="yyyy.MM.dd" /></dd>
																	</c:if>
																	<c:if test="${result.OPENTYPE eq 'A'}">
																		<dd>상시운영</dd>
																	</c:if>
		                                                        </td>
		                                                    </tr>
		                                                </tbody>
	                                            </table>
	                                        </div>
	                                        
	                                        
	                                        <div class="col-sm-6 col-xs-12">
	                                            <div class="tblCellwrap">
	                                                <div class="tblCell"><!-- 버튼 일때 비활성화 disabled / a태그일때 disabled 클래스 추가 -->
	                                                <c:choose>
														<c:when test="${result.CANCEL_YN eq 'Y' && result.OPENTYPE eq 'D'}">
			                                        		<button type="button" class="btn btn-orange btn-sm" onclick="fnCancel('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.MT_PM_STATUS_CODE}"/>','<c:out value="${result.SEQ_TITLE}" />'); return false;" title="신청취소">신청취소</button>
			                                            </c:when>
														<c:otherwise>
															<button type="button" class="btn btn-orange btn-sm" onclick="javascript:alert('신청취소 기간이 아닙니다.')" title="신청취소" disabled="disabled">신청취소</button>
														</c:otherwise>
													</c:choose>
	                                                <c:choose>
	                                                	<c:when test="${result.ISPASS eq 'Y'}">
															<button type="button" class="btn btn-drkblue btn-sm" onclick="fnCertPrint('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>' , '<c:out value="${result.MT_CTYPE_CODE }"/>','<fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyy.MM.dd" />','<fmt:formatDate value="${result.STUDY_EDATE}" pattern="yyyy.MM.dd" />');"  title="수료증(수료)">수료증</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="btn btn-drkblue btn-sm" onclick="javascript:alert('수료된 과정이 아닙니다.')" title="수료증(미수료)" disabled="disabled">수료증</button>
														</c:otherwise>   
	                                                </c:choose>    
	                                                   <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMdd" var="now"/>
	                                                   <fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyyMMdd" var="date"/>
	                                                   
	                                                <c:choose>
														<c:when test="${now >= date}">
															<button type="button" onclick="fnClassdesk('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${result.CLASS_DESK}"/>','<c:out value="${result.SEQ_TITLE}"/>','<c:out value="${result.MT_CTYPE_NAME}"/>','<c:out value="${result.MT_EDUINFO_CODE}"/>');"  class="btn btn-blue btn-sm" title="강의실(입장)">강의실</button>
														</c:when>
														<c:when test="${now < date}">
															<button type="button" onclick="fnClassdesk('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${result.CLASS_DESK}"/>','<c:out value="${result.SEQ_TITLE}"/>','<c:out value="${result.MT_CTYPE_NAME}"/>','<c:out value="${result.MT_EDUINFO_CODE}"/>');"  class="btn btn-blue btn-sm" title="강의실(입장)" disabled="disabled">강의실</button>
														</c:when>
													</c:choose>
	                                                </div>
                                            	</div>
		                                	</div>
		                                	
		                                	
		                            	</div>
                                	</c:if>
                            	</c:forEach>
                        	</c:when>
                        	<%-- <c:when test="${lectureCount.OFFLINE_CNT <= 0}">
                        		수강중인 집합 교육이 없습니다.
                        	</c:when> --%>
                        	<c:otherwise>
                       			수강중인 집합 교육이 없습니다.
                       		</c:otherwise>
                    	</c:choose>
                	</div>
            	</section>
            	
            	<hr>
            	
                <section>
                	<h3 class="main_tit mrg_t20">집합교육(수료)</h3>
                     	<div class="classListwrap">
                         	<c:choose>
                                <c:when test="${not empty listData  && offLectureCount > 0}">
                                	<c:set var="OFFISCNT" value="0"/>
					                <c:forEach items="${listData}" var="result" varStatus="stat">
                               			<c:if test="${result.MT_CTYPE_NM eq '집합교육' && result.ISPASS eq 'Y'}">
                               				<c:set var="OFFISCNT" value="${OFFISCNT+1}"/>
		                                    <div class="row">
		                                        <div class="col-sm-6 col-xs-12">
		                                            <table>
		                                                <caption>수료 집합교육과정 정보</caption>
		                                                <tbody>
		                                                    <tr>
		                                                        <th scope="row">교육과정</th>
		                                                        <td><c:out value="${result.SEQ_TITLE}"/></td>
		                                                    </tr>
		                                                    <tr>
		                                                        <th scope="row">학습기간</th>
		                                                        <td>
			                                                        <c:if test="${result.OPENTYPE eq 'D'}">
																			<dd><fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyy.MM.dd" /> ~  <fmt:formatDate value="${result.STUDY_EDATE}" pattern="yyyy.MM.dd" /></dd>
																	</c:if>
																	<c:if test="${result.OPENTYPE eq 'A'}">
																		<dd>상시운영</dd>
																	</c:if>
		                                                        </td>
		                                                    </tr>
		                                                </tbody>
	                                            </table>
	                                        </div>
	                                        
	                                        
	                                        <div class="col-sm-6 col-xs-12">
	                                            <div class="tblCellwrap">
	                                                <div class="tblCell"><!-- 버튼 일때 비활성화 disabled / a태그일때 disabled 클래스 추가 -->
	                                                <c:choose>
														<c:when test="${result.CANCEL_YN eq 'Y' && result.OPENTYPE eq 'D'}">
			                                        		<button type="button" class="btn btn-orange btn-sm" onclick="fnCancel('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.MT_PM_STATUS_CODE}"/>','<c:out value="${result.SEQ_TITLE}" />'); return false;" title="신청취소">신청취소</button>
			                                            </c:when>
														<c:otherwise>
															<button type="button" class="btn btn-orange btn-sm" onclick="javascript:alert('신청취소 기간이 아닙니다.')" title="신청취소" disabled="disabled">신청취소</button>
														</c:otherwise>
													</c:choose>
	                                                <c:choose>
	                                                	<c:when test="${result.ISPASS eq 'Y'}">
															<button type="button" class="btn btn-drkblue btn-sm" onclick="fnCertPrint('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>' , '<c:out value="${result.MT_CTYPE_CODE }"/>','<fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyy.MM.dd" />','<fmt:formatDate value="${result.STUDY_EDATE}" pattern="yyyy.MM.dd" />');"  title="수료증(수료)">수료증</button>
														</c:when>
														<c:otherwise>
															<button type="button" class="btn btn-drkblue btn-sm" onclick="javascript:alert('수료된 과정이 아닙니다.')" title="수료증(미수료)" disabled="disabled">수료증</button>
														</c:otherwise>   
	                                                </c:choose>    
	                                                   <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyyMMdd" var="now"/>
	                                                   <fmt:formatDate value="${result.STUDY_SDATE}" pattern="yyyyMMdd" var="date"/>
	                                                   
	                                                <c:choose>
														<c:when test="${now >= date}">
															<button type="button" onclick="fnClassdesk('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${result.CLASS_DESK}"/>','<c:out value="${result.SEQ_TITLE}"/>','<c:out value="${result.MT_CTYPE_NAME}"/>','<c:out value="${result.MT_EDUINFO_CODE}"/>');"  class="btn btn-blue btn-sm" title="강의실(입장)">강의실</button>
														</c:when>
														<c:when test="${now < date}">
															<button type="button" onclick="fnClassdesk('<c:out value="${result.CUSERNO}"/>','<c:out value="${result.COURSENO}"/>','<c:out value="${result.CSEQNO}"/>','<c:out value="${result.USERNO}"/>','<c:out value="${result.CLASS_DESK}"/>','<c:out value="${result.SEQ_TITLE}"/>','<c:out value="${result.MT_CTYPE_NAME}"/>','<c:out value="${result.MT_EDUINFO_CODE}"/>');"  class="btn btn-blue btn-sm" title="강의실(입장)" disabled="disabled">강의실</button>
														</c:when>
													</c:choose>
	                                                </div>
                                            	</div>
		                                	</div>
		                                	
		                                	
		                            	</div>
                                	</c:if>
                            	</c:forEach>
                            	<c:if test="${OFFISCNT == 0}">
                            		수료한 집합 교육이 없습니다.
                            	</c:if>
                        	</c:when>
                        	<%-- <c:when test="${lectureCount.OFFLINE_CNT <= 0}">
                        		수강중인 집합 교육이 없습니다.
                        	</c:when> --%>
                        	<c:otherwise>
                       			수료한 집합 교육이 없습니다.
                       		</c:otherwise>
                    	</c:choose>
                	</div>
                	
	             	<div class="btnAreaC mrg_t30 memberEdit">
	                 	 <button type="button" class="btn btn-lg btn-mint mrg_l5" name="" onclick="fnLoanCertPrint(); return false;" title="수료확인서 출력">수료확인서 출력</button>
	                 </div>
	                 
            	</section>
            	
                 
                 
			</div><!-- //contents-->
			
			<!-- popup-->
			 <%@ include file="/WEB-INF/jsp/common/layer/ly_loan.jsp"%>
                <!-- //popup -->
			
			</div><!-- //sub-contents -->
		</div>
	</article>
	
</div>
    
<!-- footer -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>