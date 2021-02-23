<%
/****************************************************
    system	: 시스템관리 > 커뮤니티코드관리 > 리스트
    title	: 커뮤니티코드관리
    summary	:
    wdate	: 2013-09-20
    writer	: 구동림
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		dateFormat={
				yearRange: "2014:2025"
			};
		
		$('.datapicker').datepicker(dateFormat);
	});
	
	
	function delBtn(hisno , cnt){
		var hisno = hisno;
		var cnt = cnt;
		
		if(hisno != ''){
			if(confirm("삭제 하시겠습니까?")){
		        $.ajax({
		            url : "/academy/tutor/deleteMberAjax.do",
		            data : {hisno : hisno, type : 'D'},
		            dataType : "json",
		            type : 'post',
		            success : function(res) { 
		            	if(res == 'SUCCESS'){
		            		alert("삭제되었습니다.");	
		            	}else{
		            		alert('fail');
		            	}
		            	$("#eduDate_"+cnt).remove();
		            },
		            error : function(e) {
		                alert("error :" + e.responseText);
		            }
		        }); 
			}
		
		}else{
			$("#eduDate_"+cnt).remove();
		}
	}
	
	var delcnt = 1;
	function fnAdd() {
		
		var cnt = $("#scaleCnt").val();
		if(cnt.length == 0){
			cnt = 1;
		}
		if (cnt >= 9) {
			alert('9개까지 등록 가능합니다.');
			return;
		}

		cnt ++;
		delcnt ++;
		var str = '';
		    str = str + "<tr id='eduDate_"+cnt+"' class='input-wrap mb15'>";
		    str = str + "<td><input type='text' id='thema' name='thema' class='form-control' title='교육희망주제 입력' ></td>";
		    
		    str = str + "<td><div class='row inputDate' id='eduDate_1'><div class='col-sm-6'><input name='startDt' id='startDt"+cnt+"' title='날짜선택'  class='form-control datepicker'></div>";
		    str = str + "<div class='col-sm-6'><input name='endDt' id='endDt"+cnt+"' title='날짜선택'  class='form-control datepicker'></div></div></td>";
		    
		    str = str + "<td><input type='text' id='applyOrgan' name='applyOrgan' class='form-control' title='소속 입력' value=''></td>";
		    str = str + "<td><input type='text' id='target' name='target' class='form-control' title='교육대상 입력'></td>";
		    str = str + "<td><input type='text' id='personCnt' name='personCnt' class='form-control' title='인원 입력'></td>";
		    str = str + "<td class='btn-td'>";
		    str = str + "<span class='timebtn'>";
		    str = str + "<button class='btn_plus btn' onclick='fnAdd();return false' title='추가'></button>";
		    str = str + "&nbsp";
		    str = str + "<button class='btn_minus btn' onclick='fnDel("+cnt+");return false' title='삭제'></button>";
		    str = str + "</span>";
		    str = str + "</td>";
		    str = str + "</tr>";
	     
		    
		 $('#itemList').append(str);   
		    
	     //$("#eduDate_"+(cnt-1)).after(str);
	     $("#cnt").val(cnt);
	     $("#scaleCnt").val(cnt);
	     
	     $('.datepicker').datepicker();
	}

	//파일 변경값
	function fnChange(num, pval) {
		$("#fileName"+num).val(pval);
		
	}
	
	function fnDel(val) {
		if (delcnt == 1) {
			alert("더이상 삭제하실 수 없습니다.");
			$("#hisTbl tr").attr("id" , "eduDate_1");
			return;
		}
		
		var row = $("#eduDate_"+val);
		row.fadeOut("fast", function()
		{
			delcnt--;
			row.remove();
			$("#cnt").val(delcnt);
			if(delcnt == 1){
				$("#scaleCnt").val($("#startCnt").val());
			}else{
				$("#scaleCnt").val(delcnt);
			}
		});
		
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
		$("#frm").attr("action", "/academy/tutor/lectureHisList.do").submit();	
	}
	
	// 등록
	function goInsert(){
		if(confirm("등록 하시겠습니까?")){
			$("#frm").attr("action", "/academy/tutor/lectureHisInsert.do").submit();
		}else{
			return false;
		}
	}
	function selectTitle(selectTitle){
		$("#entrstYear").val('');
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

					<form name="frm" id="frm" action="/academy/tutor/lectureHisList.do" method="post">
					<input type="hidden" name="userno" id="userno" value="${tutor[0].USERNO }"/>
					<input type="hidden" name="tabNo" id="tabNo" value="<c:out value='${REQUEST_DATA.tabNo}'/>"/>
					<input type="hidden" name="qu" id="qu" value=""/>
					<input type="hidden" name="cnt" id="cnt" value="1"/>
					<!-- <input type="hidden" name="satrtDt" id="satrtDt" value=""/>
					<input type="hidden" name="endDt" id="endDt" value=""/> -->
					
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
                   
                   <hr>
                   
                   <!-- table -->
                   <section class="tableBox">
                       <div class="tblWrap tableScrollx">
                          <table class="dataTbl text-center">
                             <caption>타기관 강의이력</caption>
                                <colgroup>
                                    <col style="width:*">
                                    
                                    <col style="width:25%">
                                    <col style="width:15%">
                                    <col style="width:12%">
                                    <col style="width:9%">
                                    
                                    <c:if test="${REQUEST_DATA.qu eq 'insert' }"><col style="width:13%"></c:if>
                                </colgroup>
                                <thead>
	                                <tr>
	                                    <th scope="col">교육희망 주제</th>
	                                    <th scope="col">교육기간</th>
	                                    <th scope="col">소속</th>
	                                    <th scope="col">교육대상</th>
	                                    <th scope="col">인원</th>
	                                    <c:if test="${REQUEST_DATA.qu eq 'insert' }"><th scope="col">추가/삭제</th></c:if>
	                                </tr>
                                </thead>
                                <tbody id="itemList">
                                   <c:if test="${REQUEST_DATA.qu ne 'insert' }">
										<c:if test="${fn:length(hisList) > 0}">
							   				<c:forEach var="result" items="${hisList}" varStatus="status">
												<tr>
													<td><c:out value="${result.THEMA}"/></td>
													<td><span class="d-inline dateTxt"><c:out value="${result.START_DT}"/></span> ~ <span class="d-inline dateTxt"><c:out value="${result.END_DT}"/></span></td>
													<td><c:out value="${result.APPLY_ORGAN}"/></td>
													<td><c:out value="${result.TARGET}"/></td>
													<td><c:out value="${result.PERSON_CNT}"/></td>
												</tr>
											</c:forEach>
					    				</c:if>
						    			
						    			<c:if test="${fn:length(hisList) == 0}">
						    				<tr><td colspan="5">등록된 이력이 없습니다.</td></tr>
						    			</c:if>
						    		</c:if>
						    		<c:if test="${REQUEST_DATA.qu eq 'insert' }">
						    			<c:forEach var="result" items="${hisList}" varStatus="status">
						    				<c:set value="${status.count}" var="startCnt"></c:set>
							    			<tr id="eduDate_${status.count}" class="input-wrap mb15">
							    				<input type="hidden" name="hisno" id="hisno" value="${result.HISNO}"/>
												<td><input type="text" id="thema" name="thema" class="form-control" title="교육희망주제 입력"  value="<c:out value="${result.THEMA}"/>"></td>
												<td>
													<div class="row inputDate" id="eduDate_1">
                                                        <div class="col-sm-6">
	                                                        <input name="startDt" id="startDt${status.index+1}" class="form-control datapicker" value="<c:out value="${result.START_DT}"/>" readonly="readonly" title="시작일">
                                                        </div>
                                                        <div class="col-sm-6">
	                                                        <input name="endDt" id="endDt${status.index+1}" class="form-control datapicker" value="<c:out value="${result.END_DT}"/>" readonly="readonly" title="종료일">
                                                        </div>
	                                                </div>
												</td>
												<td><input type="text" id="applyOrgan" name="applyOrgan" class="form-control" title="소속 입력" value="${result.APPLY_ORGAN}"></td>
												<td><input type="text" id="target" name="target" class="form-control" title="교육대상 입력" value="<c:out value="${result.TARGET}"/>"></td>
												<td><input type="text" id="personCnt" name="personCnt" class="form-control" title="인원 입력" value="<c:out value="${result.PERSON_CNT}"/>"></td>
												<td class="btn-td">
												<span id="test" class="timebtn">
													<button class="btn_plus btn" onclick="fnAdd();return false" title="추가"></button>
													<button class="btn_minus btn" onclick="delBtn('<c:out value="${result.HISNO}" />' , '<c:out value="${status.count}" />');return false" title="삭제"></button>
												</span>
												</td>
											</tr>
										</c:forEach>
							    		<input type="hidden" name="startCnt" id="startCnt" value="${startCnt}"/>
							    		<input type="hidden" name="scaleCnt" id="scaleCnt" value="${startCnt}"/>
							    		<c:if test="${empty hisList}">
							    			<tr id="eduDate_1" class="input-wrap mb15">
								    			<td><input type="text" id="thema" name="thema" class="form-control" title="교육희망주제 입력"  value=""></td>
												<td>
													<div class="row inputDate" id="eduDate_1">
                                                        <div class="col-sm-6">
	                                                        <input name="startDt" id="startDt" class="form-control datapicker">
                                                        </div>
                                                        <div class="col-sm-6">
	                                                        <input name="endDt" id="endDt" class="form-control datapicker">
                                                        </div>
	                                                </div>
												</td>
												<td><input type="text" id="applyOrgan" name="applyOrgan" class="form-control" title="소속 입력" value=""></td>
												<td><input type="text" id="target" name="target" class="form-control" title="대상 입력" value=""></td>
												<td><input type="text" id="personCnt" name="personCnt" class="form-control" title="인원 입력" value=""></td>
												<td class="btn-td">
												<span id="test" class="timebtn">
													<button class="btn_plus btn" onclick="fnAdd();return false" title="추가"></button>
													<button class="btn_minus btn" onclick="fnDel(1);return false" title="삭제"></button>
												</span>
												</td>
											</tr>
											
							    		</c:if>
						    		</c:if>
                                        </tbody>
                                    </table>
                                </div>
								
								
								
                                <div class="btnAreaC mrg_t30">
                                	<c:if test="${REQUEST_DATA.qu == '' || REQUEST_DATA.qu ne 'insert' }">
										<a href="#none" onclick="goUpdate('insert'); return false"; class="btn btn-blue btn-lg">수정</a>
									</c:if>
									<c:if test="${REQUEST_DATA.qu == 'insert' }">
										<a href="#none" onclick="goInsert(''); return false;" class="btn btn-blue btn-lg" >등록</a>
										<a href="#none" onclick="fnTab('/academy/tutor/lectureHisList.do', '1'); return false;" class="btn btn-gray btn-lg" >취소</a>
									</c:if>
                                </div>

                            </section>
                            <!--// table -->
			</div><!-- //sub-contents -->
		</div>
	</article>
</div>		 
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->