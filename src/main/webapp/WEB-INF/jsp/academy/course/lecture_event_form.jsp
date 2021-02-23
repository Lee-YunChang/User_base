<%
/****************************************
	subject	: 방문교육 > 방문교육1
	summary	: 
	author	: 서혁진
	date	: 2019-05-14
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
	<script type="text/javascript">
	
	function move_page(cPage){
		$('#cPage').val(cPage);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/course/lectureEvent.do').submit();
	} 

	//검색
	function searchWord(){
		$('#cPage').val(1);
		$("#searchWord").val($("#searchText").val());
		$("#frm").attr("action" , "/academy/course/lectureEvent.do").submit();
	}

	//상세보기
	function fnView(bbsNo){
		$("#bbsNo").val(bbsNo);
		$("#searchWord").val($("#searchText").val());
		$("#frm").attr("action", "/academy/course/lectureEventDetail.do").submit();
	}

	  function go_exec(qu){
		  
		  	//alert(qu);
		  	$("#qu").val(qu);
		  	
	    	var form = document.frm;
	    	
	    	/* 유효성 체크 시작 */
	        if(form.title.value == ''){
	            alert('제목을 입력해 주세요.');
	            return;
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
				return false;
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
				$("#frm").attr("action", "/academy/course/lectureboardExec.do").submit();
			}
	    } 
	    
	    function delete_exec(qu){
	    	$("#qu").val(qu);
				if(confirm("삭제하시겠습니까?")) {
					$("#frm").attr("action", "/academy/course/lectureboardExec.do").submit();
				}
				
	    } 
	
	/* 
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
		 if ( $(".td-input-wrap").children("#eduDate_").length == 1) {
			alert("더이상 삭제하실 수 없습니다.");
			return;
		} 
		
		var cnt = $("#count").val();
		
		cnt -= 1;
		
		$("#count").val(cnt);
		
		$(this).closest("#eduDate_").remove();
	});
 */
</script>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_lecture.jsp"%>
			<div class="path">
           		<ul>
               		<li><span class="home text-hide">홈</span></li>
                    <li>방문교육</li>
                    <li class="active"><c:out value="온라인교육후기"/></li>
                </ul>
            </div>
			<div class="subConts" id="sub-content">
				<section class="contTop">
                	
                     <h2 class="h2_tit"><c:out value="${categoryData.BCATENAME}"/></h2>
                </section>

	
					<form name="frm" id="frm" action="" method="post"  enctype="multipart/form-data">
						<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
						<input type="hidden" name="bbsNo" id="bbsNo" value="${rowData.BBSNO}"/>
						<input type="hidden" name="prevBbsNo" id="prevBbsNo" value="${rowData.BBSNO_PREV}"/>
						<input type="hidden" name="nextBbsNo" id="nextBbsNo" value="${rowData.BBSNO_NEXT}"/>
						<input type="hidden" name="qu" id="qu" value=""/>
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
					
					<!-- table -->
	                <section class="tableBox">
	                	
	                     <div class="tblWrap">
	                     	<table class="writeForm">
	                     	<caption>글쓰기</caption>
						      <colgroup>
						          <col style="width:25%">
						          <col style="width:*">
						      </colgroup>
						      <tbody>
						      <tr>
						            <th scope="row">제목 <em class="po_C2">*</em></th>
						            <td>
						        		<input type="text" title="제목" class="form-control" name="title" id="title" value='<c:out value="${rowData.TITLE}"></c:out>' style="width:600px"/>
						            </td>
						      <tr>					         
						         <td class="td_cont_input" colspan="2">
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
							      <!--  <tr>
							        	<th scope="row">파일첨부</th>
										<td class="td-input-wrap">
										<c:choose>
											<c:when test="${not empty listData}">
											<c:forEach var="fileList" items="${listData}" varStatus="status">
											<input type="hidden" name="fileNum${status.count}" id="fileNum${status.count}" value="${fileList.FILE_ID}">
												<div  id="eduDate_${status.count}" class="input-wrap mb15"  >
														<input type="hidden" id="fileName2${status.count}" class="inputtxt size2" readonly="readonly" value="${fileList.ORGFILE}">
														<%-- <a href="#" onclick="filedown('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.SAVFILE}"/>' , '<c:out value="${fileList.FTYPE}"/>' , '<c:out value="${fileList.ORGFILE}"/>','<c:out value="${fileList.FILE_SEQ}"/>')" class="btn-down"> --%>
															<span><c:out value="${fileList.ORGFILE}"/>(<c:out value="${fileList.FILE_SIZE}"/>KB)</span>
														</a> 
														<span class="timebtn">
															<a class="scale-down btn red small" onclick="deleteReportFile('<c:out value="${fileList.FILE_ID}"/>' , '<c:out value="${fileList.FILE_SEQ}"/>' , '<c:out value="${fileList.SAVFILE}"/>' ,'<c:out value="${fileList.SAVPATH}"/>', '<c:out value="${status.count}"/>');return false"  title="삭제">삭제</a>
														</span>
														<c:if test="${status.count ne 1}">
														<input type="hidden" id="fileName" class="inputtxt size2" readonly="readonly" >
														<div class="file_input_div">
														  <input type="file" id="uploadFile" name="uploadFile" class="file_input_hidden" onchange="fnChange(this.value , 0);">
															<span class="timebtn">
																<button class="add_btn_plus" type="button" onclick="fnAdd();return false" title="추가"></button>
																<button class="add_btn_minus" type="button" id="fnDel" title="삭제"></button> ㄴ
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
														<button class="add_btn_minus" type="button" id="fnDel" title="삭제"></button> 
													</span>
												</div>
											</div>
										</div>
										</c:when>
										</c:choose>
										</td>
							        </tr> --> 
							      </tbody>
						    </table>
	                     </div>
	                     <div class="text-right mrg_t20" >
						    <c:if test="${rowData.USERNO ne REQUEST_DATA.SES_USERNO}">
							  	<a href="#" onclick="go_exec('insert'); return false;" class="btn btn-drkblue btn-lg">등록</a>
						  	</c:if>
						  	<c:if test="${rowData.USERNO eq REQUEST_DATA.SES_USERNO}">
							    <button type="button" onclick="go_exec('update'); return false" class="btn btn-blue btn-lg" title="수정">수정</button>
							    <button type="button" onclick="delete_exec('delete'); return false;" class="btn btn-orange btn-lg" title="삭제">삭제</button>
						    </c:if>
						    <button type="button" onclick="history.back();return false;" class="btn btn-gray btn-lg" title="취소">취소</button>
						</div>
	                     </form>
	                </section><!--// table -->
			</div><!-- //sub-contents -->

		</div>
	</article>
</div>	 
	 
<!-- footer -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>