<%
/****************************************************
	system	: 나의공간 > 특강관리
	title	: 
	summary	:	
	wdate	: 2016-08-30
	writer	: 이진영
*****************************************************/
%> 
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
function fnList() {
	$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/tutor/specialLectureAll.do').submit();
}

function fnSearch(){
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/tutor/specialLectureAll.do');
	$('#frm').submit();

}

function fnCourseDetail(slno){
	$('#slno').val(slno);
	$('form[name=frm]').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/tutor/specialLectureAllView.do');
	$('#frm').submit();
}

//수강신청ajax
var submitted = false;
function fnSaveAjax(slno){
	$('#slno').val(slno);
	
	if(submitted == true) { 
		alert('수강신청 처리중 입니다. 잠시만 기다려주세요.');
		return; 
	}
	var frmData = $('form[name=frm]').serialize();
	var toDate = new Date();
	var year = toDate.getFullYear().toString();
    var month = (toDate.getMonth() + 1).toString();
    var day = toDate.getDate().toString();
    if(day.length < 2){
    	day = '0'+day;
    }
    
    var today = year+'-'+month+'-'+day;
    
    	$.ajax({
    		url : '/academy/course/common/SpecilaLectureApply_ajaxExec.do',
    		type : 'post',
    		data : frmData,
    		dataType : 'json',
    		success : function(data) {
    			if(data.msg == 'fail'){
    				alert('수강신청에 실패하였습니다.');
    			} else if(data.msg == 'overlap') {
    				alert('신청중인 특강입니다.');
    			} else if(data.msg == 'login') {
    				alert('로그인이 필요한 페이지 입니다.');
    			} else{
    				//fileUpload(data);
    				$('#layer_01').css('display' , 'block');
    		    	submitted = true;
    			}
    		}
    	}); 
}
</script>
<div class="container" id="Subcontent" tabindex="-1">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp" %>
		<div class="path">
			<ul>
				<li><span class="home text-hide">홈</span></li>
		        <li>강사공간</li>
		        <li class="active">진행중인특강</li>
			</ul>
		</div>
		<div class="subConts" id="sub-content">
			<section class="contTop">
				
                <h2 class="h2_tit">진행중인특강</h2>
            </section>
                
			<div class="contents" id="sContents">

						<form name="frm" id="frm" action="/academy/tutor/specialLectureAllView.do" method="post">
			                <input type="hidden" name="slno" id="slno" value=""/>
			                <input type="hidden" name="mtLecStatusCode" id="mtLecStatusCode" value=""/>
			                
							<div class="serch-box">
								<select name="searchType" id="searchType">
									<option value="all" <c:if test="${empty REQUEST_DATA.searchType}"> selected="selected" </c:if> > 전체 </option>
									<option value="applyOrganNm" <c:if test="${REQUEST_DATA.searchType eq 'applyOrganNm'}"> selected="selected" </c:if> > 신청소속  </option>
									<option value="eduArea" <c:if test="${REQUEST_DATA.searchType eq 'detail_Cn'}"> selected="selected" </c:if> > 교육장소  </option>
									<option value="lecTargetName" <c:if test="${REQUEST_DATA.searchType eq 'lecTargetName'}"> selected="selected" </c:if> > 교육대상  </option>
									<option value="lecLctreName" <c:if test="${REQUEST_DATA.searchType eq 'lecLctreName'}"> selected="selected" </c:if> > 교육주제  </option>
								</select>
							<input type="text" name="schSeqTitle" title="검색어입력" value="<c:out value="${REQUEST_DATA.schSeqTitle}"/>"><button class="btn-submit" onclick="fnSearch(); return false;" title="검색">검색</button>
							</div>
			            </form>
									
						<div class="tabArea">
								
								<ul class="edu-list">
								 <c:choose>
				                    <c:when test="${not empty specialLectureAll}">
				                    <c:forEach items="${specialLectureAll}" var="result" varStatus="stat">
									<li>
										<div class="edu-wrap type02">
											<dl>
												<dt><c:out value="${result.SEQ_TITLE}"/></dt>
												<dd class="info-wrap">
													<ul class="list-info">
														<li>
															<dl>
																<dt>소속 :</dt>
																<dd><c:out value="${result.APPLY_ORGAN_NM}"/></dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>교육 희망일 :</dt>
																<dd><c:out value="${result.EDU_SDATE}"/> ~ <c:out value="${result.EDU_EDATE}"/></dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>교육 협의일 :</dt>
																<dd><c:out value="${result.DS_SDATE}"/> ~ <c:out value="${result.DS_EDATE}"/></dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>교육 장소 :</dt>
																<dd><c:out value="${result.EDU_AREA}"/></dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>교육 희망주제 :</dt>
																<dd><c:out value="${result.mtLctreName}"/></dd>
															</dl>
														</li>
														<li>
															<dl>
																<dt>교육 인원 :</dt>
																<dd><c:out value="${result.PERSON_CNT}"/>명</dd>
															</dl>
														</li>
													</ul>
												</dd>
											</dl>
											<div class="btn-list abs">
												<ul>
													<li><button onclick="fnCourseDetail('<c:out value="${result.SLNO}"/>'); return false;" class="btn-m" title="자세히보기">자세히보기</button></li>
													<li><button onclick="fnSaveAjax('<c:out value="${result.SLNO}"/>'); return false;" class="btn-m blue" title="신청하기">신청하기</button></li>			
												</ul>
											</div>	
										</div>
									</li>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<div class="survey-mobile no-con" style="display:block; margin-left: 20px">
											<c:if test="${REQUEST_DATA.schSeqTitle eq ''}">
												<p class="test-txt">등록된 자료실글이 없습니다.</p>
											</c:if>
											<c:if test="${REQUEST_DATA.schSeqTitle ne ''}">
												<p class="test-txt">검색결과가 없습니다.</p>
											</c:if>
										</div>
									</c:otherwise>
								</c:choose>
								</ul>

								<p class="ac"><a href="#none"  class="more-w" title="더보기">더보기</a></p>
						</div> <!-- // tab -->

						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>
				
					<div class="layer_popup" id="layer_01" style="display: none;">
						<div class="layer-tit">
							<p>신청완료</p>
							<button class="layer_close pop_close" onclick="fnList()" title="닫기">닫기</button>
						</div>
						<div class="layer_bg bg1">
							<p>신청 되었습니다.</p>
							<button class="btn-m pop_close" onclick="fnList()" title="닫기">닫기</button>
						</div>
					</div>
					
					<div class="layer_popup" id="layer_02" style="display: none;">
						<div class="layer-tit">
							<p>신청취소</p>
							<button class="layer_close pop_close" onclick="return false;" title="닫기">닫기</button>
						</div>
						<div class="layer_bg bg1">
							<p>신청이 취소되었습니다.</p>
							<button class="btn-m pop_close" onclick="return false;" title="닫기">닫기</button>
						</div>
					</div>
				
				</div><!-- //contents-->

			</div><!-- //sub-contents -->

		</div><!-- //sub-wrap -->
	</article>
</div>
		
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->