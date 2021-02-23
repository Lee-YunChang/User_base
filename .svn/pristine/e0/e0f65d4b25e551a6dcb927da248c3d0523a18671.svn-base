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
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/counsel_header_inc.jsp"%>
<script type="text/javascript" src="/common/js/sangs_core.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery.showLoading.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	 $(document).on('click', '.add_btn_minus', function(e){
		e.preventDefault();
		delcnt--;
		$(this).parents('.mainClass').remove();
		
	}); 
	

});
	
	/* function fnPop() {
		var myForm = document.frm;
		window.open("" ,"frm", "width=1300, height=925, scrollbars=yes"); 
		$("#searchWord").val($("#lecUsernm").val());
		myForm.action = '/academy/course/lectureTutorSearch.do'; 
		myForm.method = "post";
		myForm.target = "frm";
		myForm.submit();
	} */
	
	
	function  fnZipSelect(zipNo,roadAddr) {
		$("#lnmZip").val(zipNo);
		$("#lnmAdres1").val(roadAddr);
		$('.close').trigger('click'); //layer closed.
	}
	
	
	function go_exec(qu){
		  
	  	//alert(qu);
	  	$("#qu").val(qu);
	  	
    	var form = document.frm;
    	
    	/* 유효성 체크 시작 */
    	if($('#applyNm').val() == ''){
			alert('신청자 성명을 입력해주세요');
			$('#applyNm').focus();
			return;
		}/*else if($('#lnmZip').val() == '' || $('#lnmAdres1').val() == '' ){
			alert("신청지역 정보를 입력해주세요");
			$("#addr").focus();
			return;	
		} else if($('#confirmTel1').val() == '' || $('#confirmTel2').val() == '' || $('#confirmTel3').val() == ''){
			alert("유선전화를 입력해주세요");
			$("#confirmTel1").focus();
			return; 
		} */else if($('#confirmMobile1').val() == '' || $('#confirmMobile2').val() == '' || $('#confirmMobile3').val() == ''){
			alert("휴대전화를 입력해주세요");
			$("#confirmMobile1").focus();
			return;
		}else if($('#email1').val() == '' || $('#email2').val() == ''){
			alert("메일주소를 입력해주세요");
			$("#email1").focus();
			return;
		}else if(form.mtCounselCateCode.value == ''){
			alert("상담분야를 선택해주세요");
			form.mtCounselCateCode.value.focus();
			return;
		}else if(form.mtJobCode.value == ''){
			alert("직종분류를 선택해주세요");
			form.mtJobCode.value.focus();
			return;
		}else
    	
        if(form.title.value == ''){
            alert('제목을 입력해 주세요.');
            $("#title").focus();
            return;
        }
        
    	//이메일 합치기
	    if($('#email1').val() !='' || $('#email2').val() !='' ){
	        $('#email').val($('#email1').val() +'@'+$('#email2').val() );
	    }

	    //유선번호 합치기
	    if($('#confirmMobile1').val() !='' || $('#confirmMobile2').val() !='' || $('#confirmMobile3').val() !=''){
	        $('#confirmMobile').val($('#confirmMobile1').val() +'-'+$("#confirmMobile2").val() +'-'+$('#confirmMobile3').val() );
	    } else {
	        $('#confirmMobile').val(null);
	    }
	    
	 	//무선번호 합치기
	    if($('#confirmTel1').val() !='' || $('#confirmTel1').val() !='' || $('#confirmTel1').val() !=''){
	        $('#confirmTel').val($('#confirmTel1').val() +'-'+$("#confirmTel2").val() +'-'+$('#confirmTel3').val() );
	    } else {
	        $('#confirmTel').val(null);
	    }
    	
	    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		form.content.value = document.getElementById("content").value;
		
	    //내용
		var str=form.content.value;
		
		str = str.replace(/&nbsp;/g,"");
		str = str.replace(/<p>/g,"");
		str = str.replace(/<\/p>/g,"");
		str = str.replace(/\r\n/g,"");
		
		if(str.length<=0) {
			alert("내용을 입력해 주세요.");
			$("#content").focus();
			return false;
		}
		
		//이용약관 동의
		if($('#termAgree:checkbox:checked').length == 0){
			alert('개인정보 수집 및 이용 동의 악관에 동의해야 가입 가능합니다.');
			$('#termAgree').focus();
			return;	
		}
		
	    var fileNum = $("#filesCount").val() * 1 + 1;
		if(confirm("저장하시겠습니까?")) {
			$(".td-input-wrap").children("#eduDate_").each(function(){
				$(this).attr("id","eduDate_"+fileNum);
				$(this).children().find(".inputtxt").attr("id","fileName"+fileNum);
				$(this).children().find(".file_input_hidden").attr("id","uploadFile"+fileNum);
				$(this).children().find(".file_input_hidden").attr("name","uploadFile"+fileNum);
				$(this).children().find(".file_input_hidden").attr("onchange",fileNum+", this.value, 0");
				$(this).children().find(".scale-down").attr("onclick","fnDel("+fileNum +");return false");
				fileNum = fileNum + 1;
			});
			$("#frm").attr("action", "/academy/counselor/counselorExec.do").submit();
		}
    } 
    
    function delete_exec(qu){
    	$("#qu").val(qu);
			if(confirm("삭제하시겠습니까?")) {
				$("#frm").attr("action", "/academy/counselor/counselorExec.do").submit();
			}
			
    }
	
  	//이메일 셀렉트박스 세팅
    function emailSelect(val){
        $('#email2').val(val);
    }
    function userEmailSelect(val){
        $('#userEmail2').val(val);
    }
		
	var delcnt = 1;
	var cnt = 0;
	//파일 삭제
	function deleteReportFile(fileId , fileSeq , saveFile , saveFilePath, cnt){
			    var cnt = cnt;
			    var fileId = fileId;
				var fileSeq = fileSeq;
				var saveFilePath = saveFilePath;
				var saveFile = saveFile;
					if(confirm("기존파일을 삭제하시겠습니까?")){
				         $.ajax({
				            url : "/academy/tutor/deleteTutorBoardFile.do",
				            data : {fileId : fileId, fileSeq : fileSeq , saveFilePath : saveFilePath , saveFile : saveFile},
				            dataType : "json",
				            type : 'post',
				            success : function(res) { 
				            	if(res == "SUCCESS"){
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
					}else {
						return;
					}
			}
		  
		
		var cnt = 1;
		
		// 파일 추가
		function fnAdd() {
			if($("#count").val() != ''){
				cnt = $("#count").val();
			}
			cnt++;
			$("#count").val(cnt);
			
			if (cnt > 8) {
				alert('9개까지 등록 가능합니다.');
				return;
			}
			$(".td-input-wrap").append("<div id='eduDate_' class='input-wrap mb15'><div class='file-wrap'><input type='hidden' id='fileName' class='inputtxt size2' readonly='readonly' ><div class='file_input_div'> <input type='file' id='uploadFile' name='uploadFile' class='file_input_hidden' onchange='fnChange(this.value , 0);'>	<span class='timebtn'><button class='add_btn_plus' type='button' onclick='fnAdd();return false' title='추가 'style='margin-right:3px;'></button><button class='add_btn_minus' type='button' id='fnDel' title='삭제'></button></span></div></div></div>");
		}
		
		// 파일 삭제
		$(document).on('click', '#fnDel', function(){ 
			/* if ( $(".td-input-wrap").children("#eduDate_").length == 1) {
				alert("더이상 삭제하실 수 없습니다.");
				return;
			} */
			
			var cnt = $("#count").val();
			
			cnt -= 1;
			
			$("#count").val(cnt);
			
			$(this).closest("#eduDate_").remove();
		});
	//파일 변경값
	function fnChange(num, pval) {
		$("#fileName"+num).val(pval);ss
		
	}
	
</script>

<div class="container" id="Subcontent">
    <article class="subArea type2">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_counsel.jsp"%>
            <div class="path">
                <ul>
                    <li><span class="home text-hide">홈</span></li>
                    <li>재무상담</li>
                    <li class="active">상담신청</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
               <section class="bgTop_cate03"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">상담 신청</h2>
            		</div>           	
	            </section>
				
				<section class="tableBox">
					<p class="rbltopTxt"><strong class="po_C2">* 항목은 필수적으로 입력하셔야 합니다.</strong></p>
                	<form name="frm" id="frm" action="#none" method="post" enctype="multipart/form-data" >
						<input type="hidden" name="qu" id="qu" value=""/>
						<input type="hidden" name="email" id="email" value=""/>
						<input type="hidden" name="confirmTel" id="confirmTel" value=""/>
						<input type="hidden" name="confirmMobile" id="confirmMobile" value=""/>
						
						<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
						<input type="hidden" name="searchWord" id="searchWord" value=""/>
						<input type="hidden" name="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.tutorFilePath")%>"/>
						<input type="hidden" name="delCheckFile" value=""/>
					    <input type="hidden" name="oFileNo" id="fileId" value=""/>
						<input type="hidden" name="filename" id="filename" value=""/>
						<input type="hidden" name="ftype" id="ftype" value=""/>
						<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
						<input type="hidden" name="fileId" id="fileId" value=""/>
						<input type="hidden" name="saveFile" id="saveFile" value=""/>
						<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
						
						<input type="hidden" name="count" id="count" value="${fn:length(listData)}" />
						
						<input type="hidden" name="filesCount" id="filesCount" value="${fileList[0].FILETOTALCOUNT}" />
						<c:set var ="mobilPhoneNo" value="${fn:split(memberInfo.MOBLPHON,'-')}"/>
						
                        	<fieldset>
                            	<legend>신청하기</legend>
                                <div class="tblWrap">
                                	<table class="writeForm type02">
                                    	<caption>신청하기양식(이름, 소속,지역,교육장소,개인정보등 입력)</caption>
                                        <colgroup>
                                        	<col style="width:25%">
                                            <col style="width:*">
                                        </colgroup>
                                        <tbody>
                                        	<tr>
                                            	<th scope="row"><strong class="po_C2">*</strong><label for="app_name">신청자 성명</label></th>
                                                <td>
	                                                <div class="form-inline">
	                                                    <div class="form-group w30">
	                                                    	<input type="text" id="applyNm" name="applyNm" class="form-control" title="신청자 성명 입력" maxlength="25" value='<c:out value="${memberInfo.MBERNM}"></c:out>'>
	                                                    </div>
	                                                </div>
                                                 </td>
                                             </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="app_area">신청지역</label></th>
                                                  <td>
                                                  	<div class="form-inline">
                                                       <div class="form-group w20">
                                                           <input type="text"  class="form-control" id="lnmZip" name="lelnmZip" title="우편번호" readonly="readonly" value='<c:out value="${memberInfo.LNM_ZIP}"></c:out>'>
                                                       </div>
                                                       <button type="button" name="button" id="addr" class="btn-sm btn-default search_addr" data-toggle="modal" data-target="#post" title="우편번호찾기">우편번호찾기</button>
                                                       <!-- <button type="button" name="button" onclick="zipSearch(); return false;" class="btn btn-sm btn-default">우편번호찾기</button> -->
                                                   </div>
                                                   <div class="form-inline address">
                                                       <div class="form-group">
                                                           <input type="text" class="form-control"  id="lnmAdres1" name="lelnmAdres1" title="주소" readonly="readonly" value='<c:out value="${memberInfo.LNM_ADRES1}"></c:out>'>

                                                           <input type="text" class="form-control" id="lnmAdres2" name="lelnmAdres2" title="상세주소" value='<c:out value="${memberInfo.LNM_ADRES2}"></c:out>'>
                                                       </div>
                                                   </div>
                                                  
                                                  
                                                  
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><label for="app_phone">유선전화</label></th>
                                                  <td>
                                                      <div class="form-inline phoneNum">
                                                          <div class="form-group w20">
                                                          	  <select id="confirmTel1" name="confirmTel1" title="전화번호 앞 자리" class="form-control i-numOnly">
						                                          <option value="02">02</option>
						                                          <option value="031">031</option>
						                                          <option value="032">032</option>
						                                          <option value="033">033</option>
						                                          <option value="041">041</option>
						                                          <option value="042">042</option>
						                                          <option value="043">043</option>
						                                          <option value="044">044</option>
						                                          <option value="051">051</option>
						                                          <option value="052">052</option>
						                                          <option value="053">053</option>
						                                          <option value="054">054</option>
						                                          <option value="055">055</option>
						                                          <option value="061">061</option>
						                                          <option value="062">062</option>
						                                          <option value="063">063</option>
						                                          <option value="064">064</option>
						                                          <option value="070">070</option>
						                                      </select>
                                                          	  <!-- <input type="text" maxlength="5" id="confirmTel1"  class="form-control i-numOnly" name="confirmTel1" title="전화번호 앞 자리" /> -->
                                                          </div>
                                                          <div class="form-group w20">
                                                          	  <input type="text" maxlength="4" id="confirmTel2"  class="form-control i-numOnly" name="confirmTel2" title="전화번호 가운데 자리"/>
                                                          </div>
                                                          <div class="form-group w20">
                                                              <input type="text" maxlength="4" id="confirmTel3"  class="form-control i-numOnly" name="conficonfirmTel3" title="전화번호 끝 자리" />
                                                          </div>
                                                      </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="app_Cellphone">휴대전화</label></th>
                                                  <td>
                                                      <div class="form-inline phoneNum">
                                                          <div class="form-group w20">
                                                          	  <select id="confirmMobile1" name="confirmMobile1" title="휴대폰번호 선택" class="form-control">
						                                          <option value="010" <c:if test="${mobilPhoneNo[0] == '010'}">selected="selected"</c:if>>010</option>
						                                          <option value="011" <c:if test="${mobilPhoneNo[0] == '011'}">selected="selected"</c:if>>011</option>
						                                          <option value="016" <c:if test="${mobilPhoneNo[0] == '016'}">selected="selected"</c:if>>016</option>
						                                          <option value="017" <c:if test="${mobilPhoneNo[0] == '017'}">selected="selected"</c:if>>017</option>
						                                          <option value="018" <c:if test="${mobilPhoneNo[0] == '018'}">selected="selected"</c:if>>018</option>
						                                          <option value="019" <c:if test="${mobilPhoneNo[0] == '019'}">selected="selected"</c:if>>019</option>
						                                      </select>
                                                          </div>
                                                          <div class="form-group w20">
                                                          	  <input type="text" id="confirmMobile2"  class="form-control i-numOnly" name="confirmMobile2" title="전화번호 가운데 자리" maxlength="4" value='<c:out value="${mobilPhoneNo[1]}"></c:out>' />
                                                          </div>
                                                          <div class="form-group w20">
                                                          	  <input type="text" id="confirmMobile3"  class="form-control i-numOnly" name="confirmMobile3" title="전화번호 가운데 자리" maxlength="4" value='<c:out value="${mobilPhoneNo[2]}"></c:out>'/>
                                                          </div>
                                                      </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="app_email">이메일 주소</label></th>
                                                  <td>
                                                      <div class="form-inline">
                                                          <div class="form-group w30">
                                                              <input type="text" id="email1" name="email1" title="이메일 앞주소 입력" class="form-control" maxlength="30" value='<c:out value="${memberInfo.EMAILFRONT}"></c:out>'/>
                                                          </div>
                                                          @&nbsp;
                                                          <div class="form-group w30">
                                                          	  <input type="text" id="email2" name="email2" title="이메일 뒷주소 입력" class="form-control" maxlength="20" value='<c:out value="${memberInfo.EMAILLAST}"></c:out>'/>
                                                          </div>
                                                          <div class="form-group w20">
	                                                          <select id="email3" name="email3" class="form-control-static " onchange="emailSelect(this.value);return false;"  title="이메일 직접선택">
																	<option value="">직접입력</option>
																	 	<c:forEach var="emap2" items="${categoryData}" varStatus="status2">
																        	<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
																        </c:forEach>
														  	  </select>
                                                          </div>
                                                      </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong>상담 분야</th>
                                                  <td>
                                                  	  <c:forEach var="result"  items="${mtLecCounselCode}" varStatus="status">
                                                  	  	<label class="radio-inline" for="mtCounselCateCode_${status.index}">
									            			<input type="radio" name="mtCounselCateCode" id="mtCounselCateCode_${status.index}" value="${result.MT_SUB_CODE}" <c:if test="${result.MT_SUB_CODE eq map.MT_CATE_CODE }" >checked="checked" </c:if>>${result.MT_SUB_NAME} 
									            	  		<%-- <c:if test="${result.MT_SUB_CODE=='CC0007'}"><input type="text" name="targetEtc"  id="targetEtc" class="form-control-static mrg_l5 w160"/></c:if> --%>
									            	  	</label>
									            	  </c:forEach>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong>직종 분류</th>
                                                  <td>
                                                  	  <c:forEach var="result"  items="${mtJobCode}" varStatus="status">
                                                  	  	<label class="radio-inline" for="mtJobCode_${status.index}">
									            			<input type="radio" name="mtJobCode" id="mtJobCode_${status.index}" value="${result.MT_SUB_CODE}" <c:if test="${result.MT_SUB_CODE eq map.MT_JOB_CODE }" >checked="checked" </c:if>>${result.MT_SUB_NAME} 
									            	  		<%-- <c:if test="${result.MT_SUB_CODE=='CJ0007'}"><input type="text" name="targetEtc"  id="targetEtc" class="form-control-static mrg_l5 w160"/></c:if> --%>
									            	  	</label>
									            	  </c:forEach>
                                                  </td>
                                              </tr>
                                            <tr>
                                               <th scope="col"><strong class="po_C2">*</strong>공개 여부</th>
                                               <td>
                                                   <label title="예" class="radio-inline">
                                                       <input type="radio" name="openYn" id="openY" value="Y">
                                                      		 예
                                                   </label>
                                                   <label title="아니오" class="radio-inline">
                                                       <input type="radio" name="openYn" id="openN" value="N" checked="checked">
                                                      	 아니오
                                                   </label>
                                               </td>
                                           </tr>
                                           <tr>
                                               <th scope="col"><strong class="po_C2">*</strong>대면 상담 신청 여부</th>
                                               <td>
                                                   <label title="예" class="radio-inline">
                                                       <input type="radio" name="deepYn" id="deepYnY" value="Y">
                                                      		 예
                                                   </label>
                                                   <label title="아니오" class="radio-inline">
                                                       <input type="radio" name="deepYn" id="deepYnN" value="N" checked="checked">
                                                      	 아니오
                                                   </label>
                                               </td>
                                           </tr>
                                           <tr>
                                            	<th scope="row"><strong class="po_C2">*</strong><label for="app_name">제목</label></th>
                                                <td>
	                                                <div class="form-inline">
	                                                    <div class="form-group full">
	                                                    	<input type="text" id="title" name="title" class="form-control" title="제목" value='<c:out value="${rowData.TITLE}"></c:out>'>
	                                                    </div>
	                                                </div>
                                                 </td>
                                             </tr>
										      <tr>					         
										         <td class="td_cont_input" style="width:100%;" colspan="2">
										               <div>
										                   <!-- [필수]에디터 안에 글내용 영역 -->
										                   <textarea name="content" id="content" rows="22"  style="width:100%;" ><c:out value="${rowData.CONTENT}" escapeXml="false"/></textarea>
										               </div>
										               <script type="text/javascript">
															var oEditors = [];
															nhn.husky.EZCreator.createInIFrame({
															    oAppRef: oEditors,
															    elPlaceHolder: "content",
															    sSkinURI: "/academy/common/smarteditor/SmartEditor2Skin.html",
															    fCreator: "createSEditor2"
															});
														</script>
										         </td>
										      </tr>
										      <%-- <tr>
										        	<th scope="row">파일첨부</th>
													<td class="td-input-wrap">
													<c:choose>
														<c:when test="${not empty listData}">
														<c:forEach var="fileList" items="${listData}" varStatus="status">
														<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
															<div  id="eduDate_${status.count}" class="input-wrap mb15"  >
																	<input type="hidden" id="fileName2${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
																	<a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down">
																		<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
																	<!-- </a> -->
																	<span class="timebtn">
																		<a class="scale-down btn red small" onclick="deleteReportFile('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.FILE_SEQ}"/>' , '<c:out value="${fileList.SAVFILE}"/>' ,'<c:out value="${fileList.SAVPATH}"/>', '<c:out value="${status.count}"/>');return false"  title="삭제">삭제</a>
																	</span>
																	<c:if test="${status.count ne 1}">
																	<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
																	<div class="file_input_div">
																	  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
																		<span class="timebtn">
																			<button class="add_btn_plus" type="button" onclick="fnAdd();return false" title="추가"></button>
																			<!-- <button class="add_btn_minus" type="button" id="fnDel" title="삭제"></button> -->
																		</span>
																	</c:if>
															</div>
															</div>
														</c:forEach>
														</c:when>
													<c:when test="${empty listData}">
													<div  id="eduDate_" class="input-wrap mb15">
														<div class="file-wrap">
															<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
															<div class="file_input_div">
															  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
																<span class="timebtn">
																	<button class="add_btn_plus" type="button" onclick="fnAdd();return false" title="추가"></button>
																	<!-- <button class="add_btn_minus" type="button" id="fnDel" title="삭제"></button> -->
																</span>
															</div>
														</div>
													</div>
													</c:when>
													</c:choose>
													</td>
										        </tr> --%>
                                          </tbody>
                                      </table>
                                  </div>

                              </fieldset>
                          </form>
                      </section>
					  
					  <hr>
					  
					  <section>
	                      <fieldset>
	                          <legend>개인정보 수집·이용 동의</legend>
	                          <h3 class="sub_tit mb15">개인정보 수집 및 이용 동의</h3>
	                          <div class="borBox">
	                              <div class="terms" tabindex="0">
	                                  <!-- <h4 class="fnt15 po_C6">제1조(목적)</h4> -->
	                                  <h5 class="po_C9 fnt13">개인정보의 수집·이용 목적</h5>
	                                  <p>① 방문교육 신청, 확정, 안내 등을 위한 업무처리</p>
					  				  <p>② 교육 관련 서비스 제공 : 교육 이벤트 안내, 교육 및 진흥원 서민금융 관련 마케팅 등</p>
	                                  <hr class="hr_20">
	                                  
	                                  <h5 class="po_C9 fnt13">수집 · 이용하는 개인정보의 항목</h5>
	                                  <p>가. 수집정보</p>
									  <p>필수정보 : 신청자성명, 기관명, 신청지역, 교육장소, 휴대전화, 이메일주소 </p>
									  <br/>
									  <p>선택정보</p>
									  <p>유선전화(선택정보는 입력하지 않아도 신청이 가능합니다.)</p>
									  <br/>
									  <p>나. 기타정보</p>
									  <p>서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.</p>
									  <br/>
									  <p>※ IP Address, 쿠키, 방문일시, 서비스 이용 및 제공 기록 등</p>
									  <hr class="hr_20">
									  
									  <h5 class="po_C9 fnt13">개인정보의 보유 및 이용기간</h5>
	                                  <p>상상스토리이 금융교육포털 서비스 이용과 관련하여 수집한 개인정보는 관계법령 등의 규정에 의하며 3년 간 기록·보존하고, 기간이 경과할 경우 「개인정보보호법」 등에서 
	                                  	정하는 바에 따라 파기합니다. 단, 관계법령에서 의하여 정보보유 사유가 발생한 때에는 법률에서 정한 기간 동안 정보를 보존합니다.</p>
	                                  <hr class="hr_20">
									  
									  <h5 class="po_C9 fnt13">동의 거부 권리 및 동의 거부 시 불이익</h5>
                                  	  <p>귀하는 위 개인정보 처리에 거부할 권리가 있지만, 위 개인정보 중 필수적 정보의 수집·이용에 관한 동의는 계약의 체결 및 이행을 위하여 필수적이므로, 위 사항에 동의하셔야만 위 계약의 설정 및 유지가 가능합니다. 
                                  	  	다만, 선택정보는 입력하지 않아도 무방합니다.</p>
	                                  <hr class="hr_20">
	                              </div>
	
	                              <div class="agreeCheck text-right">
	                                  <input type="checkbox" name="termAgree" id="termAgree">
	                                  <label for="termAgree">동의합니다</label>
	                              </div>
	
	                          </div>
	
	                      </fieldset>

                          <div class="btnAreaC mrg_t30">
                              <button type="button" name="button" class="btn btn-lg btn-blue" onclick="go_exec('insert');return false;" title="방문교육 신청">상담 신청</button>
                          </div>
                      </section>
					
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
		
		<%@ include file="/WEB-INF/jsp/academy/cmmn/jsp/post_pop.jsp"%>
		
		
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
