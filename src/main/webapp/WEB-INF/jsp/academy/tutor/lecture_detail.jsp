<%
/****************************************************
    system	: 나의공간 > 강사정보관리 > 리스트
    title	: 강사정보관리
    summary	:
    wdate	: 2016-09-20
    writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$(function(){
	
	$( "#uploadFile1" ).click(function() {
		if($("#imgCheck1").length > 0){
			if(confirm('첨부 파일은 하나만 등록할 수 있습니다. 기존의 파일을 삭제 후 수정 하시겠습니까?')){
				$("#qu").val("update");
				$("#myTutorFileCode").val("update");
				
			}
		}
	});
	
	("body").on("click","#resume",function(){
		$('#frm').attr('action', '/academy/tutor/lectureResumeDown.do').submit();
	})
	
});




//삭제
function deleteReportFile(saveFile , saveFilePath){
	/* alert(saveFile);
	alert(saveFilePath);
	 */
	 if(confirm("파일을 삭제하시겠습니까?")){
		$('#qu').val('delete');
		$('#saveFile').val(saveFile);
		$('#saveFilePath').val(saveFilePath);
		$('#frm').attr('action', '/academy/tutor/deleteLecture.do').submit();
	}else{
		return false;
	} 
}



//파일다운로드
function filedown(fileName){
	// alert(fileName);
	$("#filename").val(fileName);
	$("#frm").attr("action", "/academy/tutor/noticeFiledown.do").submit(); 
}


	//우편번호찾기
	function zipSearch(){
		window.open("/academy/common/common/post.do","post_pop", "width=750,height=650, scrollbars=YES");
	}


	//우편번호 콜백 스크립트
	function fnZipCodePopupCallBack(data){
	 	var zipCodes = data.zip_code.split('-');
	 	$('#zipno').val(data.zip_code);
	 	$('#addr1').val(data.adres);
	 	$('#addr2').val('');
	 	$('#addr2').focus();
	}
	
	// 탭이동
	function fnTab(url, tabNo) {
		$("#tabNo").val(tabNo);
		$("#qu").val('');
		$('form[name=frm]').attr('target', '_self').attr('action', url).submit();
	}
	
	// 수정 폼으로 나오도록
	function goUpdate(qu){
		$("#qu").val(qu);
		$("#frm").attr("action", "/academy/tutor/lectureDetail.do").submit();	
	}
	
	// 저장
	function goInsert(){
		if('' == $("#mtFieldCode").val()) {
	    	alert('강의분야를 선택해 주세요.');
	    	$("#mtFieldCode").focus();
	    	return;
	    }
		
		 if(confirm("수정하시겠습니까?")){
			$("#frm").attr("action", "/academy/tutor/tutorUpdate.do").submit();	
		}else{
			return false;
		} 
	}

	function selectTitle(selectTitle){
		$("#entrstYear").val('');
		$("#frm").submit();
	}
	
	function downHangel() {
		$("#frm").attr("action", "/academy/tutor/lectureResumeDown.do").submit();	
		$("#frm").submit();
	}
	
</script>
<div class="container" id="Subcontent">
	
	<article class="subArea">
    	<div class="subCntWrap">
        	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_tutor.jsp" %>
            <div class="path">
            	<ul>
                	<li><span class="home text-hide">홈</span></li>
                    <li>강사공간</li>
                    <li class="active">강사정보관리</li>
                </ul>
            </div>            
            	<div class="subConts" id="sub-content">
            		<section class="bgTop_cate06"><!--   카테고리별 이미지 추가  -->
	            		<div class="contTop">
	            			 <h2 class="h2_tit">강사정보관리</h2>
	            		</div>           	
	          	  </section>

                    <section>
                    	<div class="bluelineTabWrap">
                        	<ul class="bluelineTab">
                        		<li class="<c:if test="${REQUEST_DATA.tabNo == 0}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureDetail.do', '0'); return false;">정보 관리</a></li>
								<li class="<c:if test="${REQUEST_DATA.tabNo == 1}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureHisList.do', '1'); return false;">타기관 강의이력</a></li>
								<li class="<c:if test="${REQUEST_DATA.tabNo == 3}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lecturePersonalList.do', '3'); return false;">방문교육 강의이력</a></li>
								<li class="<c:if test="${REQUEST_DATA.tabNo == 2}"> active</c:if>"><a href="#none" onclick="fnTab('/academy/tutor/lectureCommitteeList.do', '2'); return false;">집합교육 강의이력</a></li>
                            </ul>
                        </div>
                     </section>

                     <hr class="hr_20">

					<form name="frm" id="frm" action="/academy/tutor/lectureDetail.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="userno" id="userno" value="${tutor[0].USERNO }"/>
					<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
					<input type="hidden" name="qu" id="qu" value="<c:out value='${REQUEST_DATA.qu}'/>"/>
					<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
					<input type="hidden" name="saveFile" id="saveFile" value=""/>
					<input type="hidden" name="filename" id="filename" value=""/>
					<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
					<input type="hidden" name="downDir" id="downDir" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
 					
 					<section>
 						<div class="text-right">
		                	<button class="btn btn-sm btn-drkblue" type="button" onclick="downHangel(); return false;" title="강사 이력서 다운로드">강사 이력서 다운로드</button>
		                </div>
 					</section>
 					
 					<hr class="hr_20">
 					
 					<!-- table -->
                     <section class="tableBox">
                     	<h3 class="main_tit">강사정보</h3>
                     	<div class="tblWrap">
                        	<table class="writeForm">
                            	<caption>강사정보(학력,학교,전공 등)</caption>
                                <colgroup>
                                	<col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                </colgroup>
                                <tbody>
                                	<tr>
                                    	<th scope="row">구분</th>
                                        <td>
											<c:out value="${tutor[0].MT_TUTOR_FIELD_NAME}"/>
                                        </td>
                                        <th scope="row">강의분야</th>
                                        <td>
                                        	<c:choose>
												<c:when test="${REQUEST_DATA.qu eq 'insert' }">
													<select name="mtFieldCode" id="mtFieldCode" class="form-control">
                                                        <option value="">선택하세요</option>
                                                       	<c:forEach var="result" items="${mtFieldList}" varStatus="status">
								                    		<option value="${result.MT_SUB_CODE}" <c:if test="${tutor[0].MT_FIELD_NAME == result.MT_SUB_NAME}">selected</c:if>>${result.MT_SUB_NAME}</option>
								                    	</c:forEach>
                                                    </select>
												</c:when>
												<c:otherwise>
													<c:out value="${tutor[0].MT_FIELD_NAME}"/>
												</c:otherwise>
											</c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<th scope="row">강의지역(1순위)</th>
                                        <td>
                                            <c:choose>
												<c:when test="${REQUEST_DATA.qu eq 'insert' }">
													<select name="mtArea1Code" id="mtArea1Code" class="form-control">
									            	<option value="" >선택</option>
									                <c:forEach var="result" items="${mtAreaList}" varStatus="status">
									                	<option value="${result.MT_SUB_CODE}" <c:if test="${tutor[0].MT_AREA1_NAME == result.MT_SUB_NAME}">selected</c:if>>${result.MT_SUB_NAME}</option>
									                </c:forEach>
								                 </select>
												</c:when>
												<c:otherwise>
													<c:out value="${tutor[0].MT_AREA1_NAME}"/>
												</c:otherwise>
											</c:choose>
                                         </td>
                                         <th scope="row">강의지역(2순위)</th>
                                         <td>
                                         	<c:choose>
												<c:when test="${REQUEST_DATA.qu eq 'insert' }">
													<select name="mtArea2Code" id="mtArea1Code" class="form-control">
								                    	<option value="" >선택</option>
								                    		<c:forEach var="result" items="${mtAreaList}" varStatus="status">
								                    		<option value="${result.MT_SUB_CODE}" <c:if test="${tutor[0].MT_AREA2_NAME == result.MT_SUB_NAME}">selected</c:if>>${result.MT_SUB_NAME}</option>
								                    		</c:forEach>
							                    	</select>
												</c:when>
												<c:otherwise>
													<c:out value="${tutor[0].MT_AREA2_NAME}"/>
												</c:otherwise>
											</c:choose>
                                          </td>
                                    </tr>
                                    <tr>
                                    	<th scope="row">최종학력</th>
                                        <td>
                                        	<c:choose>
												<c:when test="${REQUEST_DATA.qu eq 'insert' }">
													<select name="mtAcdmcrCode" id="mtAcdmcrCode" class="form-control">
										            	<option value="" >선택</option>
								                    		<c:forEach var="result" items="${mtAcdmcrList}" varStatus="status">
								                    			<option value="${result.MT_SUB_CODE}" <c:if test="${tutor[0].MT_ACDMCR_NAME == result.MT_SUB_NAME}">selected</c:if>>${result.MT_SUB_NAME}</option>
								                    		</c:forEach>
							                    	</select>
												</c:when>
												<c:otherwise>
													<c:out value="${tutor[0].MT_ACDMCR_NAME}"/>
												</c:otherwise>
											</c:choose>
                                         </td>
                                         <th scope="row">졸업년월</th>
                                        <td>
                                             <c:choose>
												<c:when test="${REQUEST_DATA.qu eq 'insert' }">
													<input type="text" name="school_out_dt" id="school_out_dt"class="form-control" maxlength="7"  title="졸업년월" placeholder="2014.03" value='<c:out value="${tutor[0].SCHOOL_OUT_DT}"/>' style="width:97%">
												</c:when>
												<c:otherwise>
													<c:out value="${tutor[0].SCHOOL_OUT_DT}"/>
												</c:otherwise>
											</c:choose>
                                         </td>
                                         
                                         
                                    </tr>
                                    <tr>
                                    	<th scope="row">학교</th>
                                        <td>
                                        	<c:choose>
												<c:when test="${REQUEST_DATA.qu eq 'insert' }">
													<input type="text" name="schul" id="schul"class="form-control" title="학교입력" value='<c:out value="${tutor[0].SCHUL}"/>' style="width:97%">
												</c:when>
												<c:otherwise>
													<c:out value="${tutor[0].SCHUL}"/>
												</c:otherwise>
											</c:choose>
                                        </td>
                                        <th scope="row">전공</th>
                                        <td>
                                             <c:choose>
												<c:when test="${REQUEST_DATA.qu eq 'insert' }">
													<input type="text" name="major" id="major"class="form-control" title="전공입력" value='<c:out value="${tutor[0].MAJOR}"/>' style="width:97%">
												</c:when>
												<c:otherwise>
													<c:out value="${tutor[0].MAJOR}"/>
												</c:otherwise>
											</c:choose>
                                         </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">자격증</th>
                                        <td colspan="3">
                                        	<c:choose>
												<c:when test="${REQUEST_DATA.qu eq 'insert' }">
													<input type="text" name="crqfc" id="crqfc"class="form-control" title="자격증입력" value='<c:out value="${tutor[0].CRQFC}"/>' style="width:97%">
												</c:when>
												<c:otherwise>
													<c:out value="${tutor[0].CRQFC}"/>
												</c:otherwise>
											</c:choose>
                                        </td>
                                    </tr>
	                                         <tr>
		                                        <th>첨부파일</th>
												<td colspan="3">
													 <div class="form-inline">
                                                        <c:choose>
                                                        	<c:when test="${REQUEST_DATA.qu eq 'insert' }">
                                                        		
																<c:forEach items="${fileList}" var="result" varStatus="status">
												            		
												            		<c:set value="${status.count}" var="file1"/>
												            			<div class="form-group">
												            				<%-- <span class="txt_sky link"><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</span> --%>
			                                                           		<a class="a_file" href="#none"  title="첨부파일 다운로드"onclick="filedown('<c:out value="${result.ORGFILE}" />');return false" ><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</a>
			                                                            	<button onclick="deleteReportFile('<c:out value="${result.SAVEFILE}"/>' , '<c:out value="${result.SAVEPATH}"/>');return false"  class="btn btn-orange btn-sm" title="삭제">삭제</button>
			                                                            </div>
						
										            			</c:forEach>
												            	<c:if test="${file1 == null}">
												            	<div class="form-group">
											            			<label for="uploadFile1" class="btn btn-sm btn-default">파일선택</label><input type="file" name="uploadFile1" id="uploadFile1" style="display: none;" onchange="javascript: document.getElementById('fileName1').value = this.value">
											            		</div>
											            		<div class="form-group">
	                                                            	<input type="text" id="fileName1" class="form-control" readonly="readonly">
	                                                            </div>
																</c:if>
											            	</c:when>
											            	<c:otherwise>
											            		<c:forEach items="${fileList}" var="result" varStatus="status">
												            			<c:set value="${status.count}" var="file1"/>
												            			<div class="form-group">
												            				<p class="a_file"><a class="a_file" href="#none"  title="첨부파일 다운로드"onclick="filedown('<c:out value="${result.ORGFILE}" />');return false" ><c:out value="${result.ORGFILE}"/>(<c:out value="${result.FSIZE}"/> KB)</a></p>
			                                                            </div>
						
										            			</c:forEach>
												            	<c:if test="${file1 == null}">
												            		첨부파일이 없습니다.
												            	</c:if>
											            	
															</c:otherwise>
															</c:choose>
														</div>
												</td>
                                   			 </tr>
                        		</tbody>
                      		</table>
                      </div>
                                
                      <hr>
                      <!-- table -->
                     <section class="tableBox">
                     	<h3 class="main_tit">경력사항</h3>
                     	<div class="tblWrap">
                        	<table class="writeForm">
                            	<caption>경력사항</caption>
                            		<colgroup>
                                	<col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                </colgroup>
                                <tbody>
                                	<tr>
                                        <th scope="row">현 직장</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="workAfter" id="workAfter"class="form-control" title="현 직장 입력" value='<c:out value="${tutor[0].WORK_AFTER}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${tutor[0].WORK_AFTER}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                      <th scope="row">입사년월</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="work_in_dt" id="work_in_dt"class="form-control" title="입사년월" maxlength="7" placeholder="2017.03" value='<c:out value="${tutor[0].WORK_IN_DT}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${tutor[0].WORK_IN_DT}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">부서</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="dept_nm" id="dept_nm"class="form-control" title="현 직장 부서 입력" value='<c:out value="${tutor[0].DEPT_NM}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${tutor[0].DEPT_NM}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                      <th scope="row">직위</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="position_nm" id="position_nm" class="form-control" title="현 직장 직위 입력" value='<c:out value="${tutor[0].POSITION_NM}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${tutor[0].POSITION_NM}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                    </tr>
                                    
                                    <tr>
                                    	<td colspan="4" style="height: 20px;"></td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">전직장1</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="work_nm2" id="work_nm2"class="form-control" title="전 직장 입력" value='<c:out value="${jobList[0].WORK_NM}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${jobList[0].WORK_NM}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                      <th scope="row">부서/직위</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="dept_info2" id="dept_info2"class="form-control" placeholder="생산/과장" title="전 직장 부서/직위 입력" value='<c:out value="${jobList[0].DEPT_INFO}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${jobList[0].DEPT_INFO}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                    </tr>
                                   
                                    <tr>
                                        <th scope="row">입사년월</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="work_in_dt2" id="work_in_dt2"class="form-control" maxlength="7" title="전 직장 입사년월 입력" placeholder="2012.03" value='<c:out value="${jobList[0].WORK_IN_DT}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${jobList[0].WORK_IN_DT}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                      <th scope="row">퇴사년월</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="work_out_dt2" id="work_out_dt2"class="form-control" maxlength="7" title="전 직장 퇴사년월 입력" placeholder="2015.08" value='${jobList[0].WORK_OUT_DT}' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${jobList[0].WORK_OUT_DT}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                    </tr>
                                    
                                    <tr>
                                    	<td colspan="4" style="height: 20px;"></td>
                                    </tr>
                                    
                                     <tr>
                                        <th scope="row">전직장2</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="work_nm3" id="work_nm3"class="form-control" title="전 직장 입력" value='<c:out value="${jobList[1].WORK_NM}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${jobList[1].WORK_NM}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                      <th scope="row">부서/직위</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="dept_info3" id="dept_info3"class="form-control" placeholder="영업/대리" title="전 직장 부서/직위 입력" value='<c:out value="${jobList[1].DEPT_INFO}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${jobList[1].DEPT_INFO}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                    </tr>
                                    
                                    <tr>
                                        <th scope="row">입사년월</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="work_in_dt3" id="work_in_dt3"class="form-control" maxlength="7" title="전 직장 입사년월 입력" placeholder="1999.03"value='<c:out value="${jobList[1].WORK_IN_DT}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${jobList[1].WORK_IN_DT}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                      <th scope="row">퇴사년월</th>
                                     <td>
                                     	<c:choose>
											<c:when test="${REQUEST_DATA.qu eq 'insert' }">
												<input type="text" name="work_out_dt3" id="work_out_dt3"class="form-control" maxlength="7" title="전 직장 퇴사년월 입력" placeholder="2001.08" value='<c:out value="${jobList[1].WORK_OUT_DT}"/>' style="width:97%">
											</c:when>
											<c:otherwise>
												<c:out value="${jobList[1].WORK_OUT_DT}"/>
											</c:otherwise>
										</c:choose>
                                     </td>
                                    </tr>
                                </tbody>
                             </table>
                        </div>
                     </section>
                            	
                      <hr>          
                      <div class="btnAreaC">
                    	<c:if test="${REQUEST_DATA.qu == '' || REQUEST_DATA.qu ne 'insert' }">
							<a href="#none" onclick="goUpdate('insert'); return false"; class="btn btn-blue btn-lg" title="수정">수정</a>
						</c:if>
						<c:if test="${REQUEST_DATA.qu == 'insert' }">
							<a href="#none" onclick="goInsert(); return false;" class="btn btn-blue btn-lg" title="수정">수정</a>
							<a href="#none" onclick="goUpdate(''); return false;" class="btn btn-gray btn-lg" title="취소">취소</a>
						</c:if>
                      </div>

                      </section>
                      <!--// table -->

        	</div>
    	</div>
    </article>
                
</div>

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->