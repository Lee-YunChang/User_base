<%
/****************************************************
	system	: 일반교육 > 온라인과정 폼
	title	: 수강과정 목록
	summary	:	
	wdate	: 2016-09-19
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 

<script type="text/javascript" src="/academy/common/js/jwplayer-6/jwplayer.js"></script> 
<script type="text/javascript" src="/academy/common/js/jwplayer-6/jwplayer.html5.js"></script>

<script type="text/javascript">
    /**
     * 201906추가
     * Youtube API 로드
     */
     
     
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/iframe_api";
    
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    /**
     * onYouTubeIframeAPIReady 함수는 필수로 구현해야 한다.
     * 플레이어 API에 대한 JavaScript 다운로드 완료 시 API가 이 함수 호출한다.
     * 페이지 로드 시 표시할 플레이어 개체를 만들어야 한다.
     */
    var player;
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('youtubeArea', {
            height: '400',            
            width: '800',             
            videoId: '${rowData.YOUTUBE_URL}',
            playerVars: {            
                controls: '2'
            },
            events: {
                'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
                'onStateChange': onPlayerStateChange,    // 플레이어의 상태가 변경될 때마다 실행
                
            }
        });
    }
    
    
    function onPlayerReady(event) {}
    
    var playerState;
    function onPlayerStateChange(event) {
    	playerState = event.data == YT.PlayerState.ENDED ? '' :
    	event.data == YT.PlayerState.PLAYING ? '' :
        event.data == YT.PlayerState.PAUSED ? '' :
        event.data == YT.PlayerState.BUFFERING ? '' :
        event.data == YT.PlayerState.CUED ? '' :
        event.data == -1 ? '시작되지 않음' : '예외';

        // 재생여부를 통계로 쌓는다.
        collectPlayCount(event.data);
    }

    
    var played = false;
    function collectPlayCount(data) {
    	if (data == YT.PlayerState.PLAYING && played == false) {

    		played = true;

            // COUTUP + 1 > START
            $.ajax({
            	url : "/academy/course/countUpAjaxExec.do",
         		data : {
         					cseqno : $('#cseqno').val()
         				},
          		dataType : "json",
          		type : 'post',
		        success : function(res) {},
		        error : function(e) {
		            alert("error :" + e.responseText);
		        }
      		});
            
         	// COUTUP + 1 > END
         	
        }
    }

</script>

<script type="text/javascript">
$(document).ready(function(){
	
	$('.modal-backdrop').click(function(){
		$('.modal-backdrop').hide();
		$('#layer_01').attr('style','display:none;');
		$('#layer_02').attr('style','display:none;');
	})
	
});

//파일추가
function fnChange(num, pval) {
	$("#fileName"+num).val(pval);
}

$(document).ready(function(){
	var applyYn = '<c:out value="${rowData.APPLY_YN}"/>' ;
	if(applyYn == 'Y'){
		$('#saveTag').css('display' , 'none');
		$('#failTag').css('display' , 'inline-block');
		$('#classMove').css('display' , 'inline-block'); 
	}else if(applyYn == 'N'){
		$('#saveTag').css('display' , 'inline-block');
		$('#failTag').css('display' , 'none');
		$('#classMove').css('display' , 'none');
	}
	
	$('#test').on('click', function(){
		alert(111);
	})
});


//시설유형코드 onchange
function fnFcltsTypeCode(obj1, obj2){
	//var phtml = '';
	//$("#area2").html(phtml);
	ajaxSpecialAreaCategory({
		mtCode : "<%=SangsProperties.getProperty("Globals.mtCode_MT_JOB_KND_CODE")%>"
		, name : "fcltsTypeCode"
		, target : "select_container2"
		, value1 : obj1
		, value2 : obj2
	});
}

function ajaxSpecialAreaCategory(p) {

	$.ajax({
		url : "/academy/common/ajaxCategory.do",
		type : "POST",
		dataType : "html",
		data : {
			"mtCode" : p.mtCode
			,"ref3" : p.value1
			,"mtSubCode" : p.value2
		},
		success : function(data) {
			
			$("#"+p.target).html("");
			var html = "<select name='jobKndCode' title='직종선택' id='jobKndCode' >";
			html = html+ data;
			html = html + "</select>";
		
			$("#"+p.target).html(html);
			$("#"+p.target).jqTransform();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("데이터를 불러오는데 실패하였습니다.(error : "+errorThrown+")");
		}
	});
}

function fnList() {
	$("#cseqno").val("");
	$("#courseno").val("");
	$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/onDetail.do').submit();
}

function fnApplyResult(){
	$('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/common/applyResult.do').submit();
}

function fnResult(courseno, cseqno, duplVal){
	$('#resultForm > input[name="cseqno"]').val(cseqno);
	$('#resultForm > input[name="courseno"]').val(courseno);
	
	$('form[name=frm]').attr('method', 'post').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do').submit();
}	

function fnReturnPage(pmode){
	location.href='/academy/course/onCategoryList.do';	
}

//강의실로이동
function fnMove() {
	var targetYn = $('#targetYn').val();
	if(targetYn.trim() == 'Y'){
		$("#frm").attr("action", "/classdesk/main/main.do");
		$("#frm").submit();
	}else{
		alert("선발인원이 아닙니다.");
		return;
	}
}

//수강취소
function fnCancel() {
	if(confirm('수강신청을 취소 하시겠습니까?')) {
		if( $('#multipleCancelYn').val() == 'Y'){
         alert('취소중입니다 잠시만 기다려주세요.');
         return false;
     }

     $('#multipleCancelYn').val('Y');
     $('#frm').attr('target', '_self').attr('method', 'post').attr('action', '<c:out value="${ctx}"/>/academy/course/common/cancel_exec.do').submit();
	}
}


//기관 검색팝업
function fnCompanyPop(){
	var form = document.frm;
	var orgName = $("#orgName").val();
	//window.open.opener.test(orgName);
	
	$("#searchWord").val(orgName);
  	window.open("/academy/user/memberCompanyJoin.do","companyPop","width=950,height=750, scrollbars=YES");
  	form.action = "/academy/user/memberCompanyJoin.do";
  	form.target = "companyPop" ;
  	form.method = "post";
  	form.submit();
}

//기관/단체명 결과 콜백
function fnCodePopupCallBack(data){
	$("#orgName").val(data.orgName);
	$("#comno").val(data.comNo);
	$("#comname").val(data.comname);
	$("#orgCode").val(data.orgCode);
}
	
//파일다운로드
function filedown(fileid, fileseq){
	$('#fileid').val(fileid);
	$('#fileseq').val(fileseq);
	$('form[name=frm]').attr('action', '/academy/course/filedown.do').submit();
}

//자막파일다운로드
function txtFiledown(fileid, fileseq){
	$('#fileid').val(fileid);
	$('#fileseq').val(fileseq);
	$('form[name=frm]').attr('action', '/academy/course/txtFiledown.do').submit();
}

//수강신청ajax
var submitted = false;
function fnSaveAjax(sugangYn,openType){
	if($('#logUserNo').val() == 0 && $('#logUserId').val() == ""){
		alert("로그인이 필요합니다.");
	} else {
		$('body').css('overflow','hidden').bind('touchmove',function(e){e.preventDefault()});
		$(window).bind('touchmove',function(e){e.preventDefault()});
		var bodyHS = $('html').height();
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
	
	   /*  var fileSubmitYn = $('#fileSubmitYn').val();
	    var temp = '';
	    if(fileSubmitYn=='Y'){
		    $('input:file').each(function(index, element) {
		    	temp = temp+$(this).val();
			});
		    if(temp.length == 0){//파일 등록 안했으면
		    	alert('첨부파일을 등록하여 주세요.');
		    	return false;
		    }
	    } */
	    
	    if(sugangYn == 'Y'  || openType == 'A'){
	    	$.ajax({
	    		url : '/academy/course/common/apply_ajaxExec.do',
	    		type : 'post',
	    		data : frmData,
	    		dataType : 'json',
	    		success : function(data) {
	    			if(data.msg == 'fail'){
	    				alert('수강신청에 실패하였습니다.');
	    			} else if(data.msg == 'max'){
	    				alert('신청인원이 초과되어 수강신청에 실패하였습니다.');
	    			} else{
	    				document.frm.paramcUserNo.value = data.msg;
	    				$('#layer_01').css('display' , 'inline-block');
	    				$('.modal-backdrop').attr('style','height:'+bodyHS+'px; '+'z-index:999;');
	    				$('#failTag').css('display' , 'inline-block');
	    				$('#classMove').css('display' , 'inline-block');
	    				$('#saveTag').css('display' , 'none');
	    				$('#cuserno').val(data.msg);
	    				$("#targetYn").val(data.targetYn);
	    				$(document).off(".disableScroll");
	    		    	submitted = false;
	    			}
	    		}
	    	}); 
	    
	    }else{
	    	alert("수강신청 기간이 아닙니다.");
	    }
	}
}

/* function fileUpload(data) {
	
	var fileSubmitYn = $('#fileSubmitYn').val();
    var temp = '';
    var idx = 0;
    if(fileSubmitYn=='Y'){
	    $('input:file').each(function(index, element) {
	    	temp = temp+$(this).val();
	    	idx++;
		});
	    if(temp.length == 0){//파일 등록 안했으면
	    	alert('첨부파일을 등록하여 주세요.');
	    	return false;
	    }
    }
	var formData = new FormData(); 
	for(var i = 0 ; i < idx ; i ++ ){
		formData.append("uploadFile"+i, $("input[name=uploadFile]")[i].files[0]); 
	}
	formData.append("cseqno", $("input[name=cseqno]").val());
	formData.append("UPLOAD_DIR", $("input[name=UPLOAD_DIR]").val());
	formData.append("cuserno", data);
	
	$.ajax({ 
		url: '/academy/course/common/apply_saveFile.do',
		data: formData, 
		processData: false, 
		contentType: false, 
		type: 'POST',
		success: function(data)
		{ 
			//$('#layer_01').css('display' , 'block');
			$('#failTag').css('display' , 'inline-block');
			$('#classMove').css('display' , 'inline-block');
			$('#saveTag').css('display' , 'none');
			$('#cuserno').val(data);
		} 
	});

} */


//수강취소ajax
function fnCancelAjax(){
	$('body').css('overflow','hidden').bind('touchmove',function(e){e.preventDefault()});
	var bodyHS = $('html').height();
	var frmData = $('form[name=frm]').serialize();
	var cancelYn = '<c:out value="${REQUEST_DATA.cancelYn}"/>'
	if(cancelYn  == 'N'){
		alert('신청취소 기간이 아닙니다.');
		return;
	}else{
		if(confirm('수강신청을 취소 하시겠습니까?')) {
			if( $('#multipleCancelYn').val() == 'Y'){
		         alert('취소중입니다 잠시만 기다려주세요.');
		         return false;
		     }else{
			$.ajax({
				url : '/academy/course/common/cancel_ajaxExec.do',
				type : 'post',
				data : frmData,
				dataType : 'json',
				success : function(data) {
					if(data == 'fail'){
						alert('수강취소에 실패하였습니다.');
					}
					if(data == 'succsess'){
						$('#layer_02').css('display' , 'block');
						$('.modal-backdrop').attr('style','height:'+bodyHS+'px; '+'z-index:999;');
						$('#failTag').css('display' , 'none'); // 취소
						$('#classMove').css('display' , 'none'); // 목록
						$('#saveTag').css('display' , 'inline-block'); // 신청
						$('#cuserno').val('');
						$(document).off(".disableScroll");
					}
				}
			});
			}
		}else{
			return false;
		}
	}	
}


function fnCourseSampleMovie(){
	
	var url = "/academy/course/sampleVod.do";
	
	url+= "?courseno="+$('#courseno').val();
	
	window.open(url, "sampleVod","width=1200,height=700");
}

function pC(){
	$('.modal-backdrop').hide();
	$('body').css({overflow:'unset'}).unbind('touchmove');
	return false;
}
</script>


<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_online.jsp"%>
            <div class="path">
            	<ul>
                	<li><span class="home text-hide">홈</span></li>
                    <li>온라인 교육</li>

                    <li class="active"><c:out value="${depthName.REF2}"/></li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
            	
           	   <section class="bgTop_cate01">
	            	<div class="contTop">
	            		<h2 class="h2_tit" id="TT">
	                		<c:out value="${depthName.REF2}" />
						</h2>
					</div>
	           </section>

			<form name="frm" id="frm" action="/academy/course/onForm.do" method="post">
			<input type="hidden" name="goodname" id="goodname" value="<c:out value="${rowData.SEQ_TITLE}"/>"/>
			<input type="hidden" name="price" value="<c:out value="${rowData.PRICE}"/>"/>
			<input type="hidden" name="searchWord" id="searchWord" value=""/> 
			<input type="hidden" name="cseqno" id="cseqno"  value="<c:out value="${rowData.CSEQNO}"/>"/>
			<input type="hidden" name="courseno" id="courseno"  value="<c:out value="${rowData.COURSENO}"/>"/>
			<input type="hidden" name="cuserno" id="cuserno"  value="<c:out value="${rowData.CUSERNO}"/>"/>
			<input type="hidden" name="targetYn" id="targetYn"  value="<c:out value="${rowData.TARGETYN}"/>"/>
			<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value='${REQUEST_DATA.mtScCode}'/>"/>
			<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
			<input type="hidden" name="ref1" id="ref1" value="<c:out value="${REQUEST_DATA.ref1}"/>"/>
			<input type="hidden" name="applyChk" id="applyChk" value="N"/><!-- 과정 중복수강방지 -->
			<input type="hidden" name="multipleCancelYn" id="multipleCancelYn" value="N" />
			<input type="hidden" name="startDate"  id="startDate" value="<c:out value="${rowData.STUDY_SDATE}"/>">
			<input type="hidden" name="endDate"  id="endDate" value="<c:out value="${rowData.STUDY_EDATE}"/>">
			<input type="hidden" name="fileid"  id="fileid" value="">
			<input type="hidden" name="fileseq"  id="fileseq" value="">
		
			<input type="hidden" name="logUserNo" id="logUserNo"  value="<c:out value="${REQUEST_DATA.SES_USERNO}"/>"/>
			<input type="hidden" name="logUserId" id="logUserId"  value="<c:out value="${REQUEST_DATA.SES_USERID}"/>"/>
			
			<!-- 강의실 이동 -->
			<input type="hidden" name="paramcSeqNo" id="paramcSeqNo"  value="<c:out value="${rowData.CSEQNO}"/>"/>
			<input type="hidden" name="paramCourseNo" id="paramCourseNo"  value="<c:out value="${rowData.COURSENO}"/>"/>
			<input type="hidden" name="paramcUserNo" id="paramcUserNo"  value="<c:out value="${rowData.CUSERNO}"/>"/>
			<input type="hidden" name="CLASSDESK" id="CLASSDESK"  value="<c:out value="${rowData.CLASS_DESK}"/>"/>
			
			<input type="hidden" id="fileSubmitYn" value="<c:out value="${rowData.FILE_SUBMIT_YN}"/>"/>
			
			
			<section class="tableBox">
			
				<c:choose>
				
					<c:when test="${rowData.YOUTUBE_URL ne '' && rowData.MT_CONTENTS_CODE == 'CT0001'}">
						<div class="iframebox">
							<div id="youtubeArea"></div>
						</div><br/>
					</c:when>
					
					<c:when test="${empty rowData.YOUTUBE_URL && rowData.MT_CONTENTS_CODE == 'CT0002'}">
						<div id="player">
							<video  width="100%" height="200"  controls="controls"  id="vd"  style="display: none;">
								<source src="" type="video/mp4" >
							</video>
						</div><br/><br/>
					</c:when>	
					
					<c:when test="${empty rowData.YOUTUBE_URL}">
						<div class="thumbnailArea">
<%-- 							<img src="/sangs-data/course/${rowData.SAVFILE}"/><br/><br/><!-- 개발 서버 --> --%>
<%-- 							<img src="<c:out value='${rowData.SAVPATH}/${rowData.SAVFILE}'/>"/> --%>
							<img src="<c:out value='/five/${rowData.SAVFILE}'/>"/>
						</div>
					</c:when>
					
				</c:choose>
             	<h3 class="main_tit">교육안내</h3>

                 <div class="tblWrap">
                 	<table class="writeForm">
                     	<caption>교육안내</caption>
                         	<colgroup>
                             	<col style="width:25%">
                                 <col style="width:*">
                             </colgroup>
                             <tbody>
                             <c:if test="${rowData.MT_CTYPE_CODE == 'DAAA00' || rowData.MT_CTYPE_CODE == 'DAAA02' }">
                             	<tr>
                                 	<th scope="row">교육분류</th>
                                     <td><span class="txt_blue bold"><c:out value="${rowData.MT_SC_NAME}"/></span></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육명</th>
                                     <td><span class="txt_blue bold"><c:out value="${rowData.SEQ_TITLE}"/></span></td>
                                 </tr>
                             <%--     <tr>
                                     <th scope="row">신청기간</th>
                                     <c:if test="${rowData.OPENTYPE eq 'D'}">
								<td>
									<p><c:out value="${rowData.APPLY_SDATE}"/> ~ <c:out value="${rowData.APPLY_EDATE}"/></p>
								</td>
							</c:if>
							<c:if test="${rowData.OPENTYPE eq 'A'}">
								<td>
									<p>상시 운영</p>
								</td>
							</c:if>
                                 </tr> --%>
                                 <tr>
                                     <th scope="row">교육소개</th>
                                     <td><c:out value="${fn:replace(rowData.RESULT_DESCRIPTION, newline, '<br>')}" escapeXml="false"/></td>
                                 </tr>
                                 <c:if test="${empty rowData.MT_CONTENTS_CODE }">
	                                 <tr>
	                                     <th scope="row">교육대상</th>
	                                     <td><c:out value="${rowData.BTARGET}"/></td>
	                                 </tr>
	                                 <tr>
	                                     <th scope="row">교육기간</th>
	                                     <td>
											<c:if test="${rowData.OPENTYPE == 'D'}">
												<c:out value="${rowData.STUDY_SDATE}"/> ~ <c:out value="${rowData.STUDY_EDATE}"/>
											</c:if>
											<c:if test="${rowData.OPENTYPE == 'A'}">
												신청일로부터 <c:out value="${rowData.EDUDAY}"/>일
											</c:if>
										</td>
	                                 </tr>
	                                <%--  <tr>
	                                     <th scope="row">1일학습량</th>
	                                     <td><c:out value="${rowData.STUDYTIME}"/>차시</td>
	                                 </tr> --%>
	                                <%--   <tr>
	                                     <th scope="row">평가방법</th>
	                                     <td><c:out value="${rowData.COMPLETION}"/></td>
	                                 </tr> --%>
	                                 <tr>
	                                 	<th scope="row">교육시간</th>
	                                 	<td> <c:out value="${rowData.STUDYTIME_TOT}"/>분</td>
	                                 </tr>
	                                 <tr>
	                                     <th scope="row">평가방법</th>
	                                     <td><c:out value="${rowData.COMPLETION}"/></td>
	                                 </tr>
	                                  <tr>
	                                     <th scope="row">커리큘럼</th>
	                                     <td>
	                                     	<c:if test="${not empty curricuiumList}">
	                                     	 <c:forEach items="${curricuiumList}" var="result" varStatus="status">
	                                     	 	${result.SUBJECT} <br/>
	                                     	 </c:forEach>
	                                     	 </c:if>
	                                     	 <c:if test="${empty curricuiumList}">
	                                     	 
	                                     	 </c:if>
	                                     </td>
	                                 </tr>
	                                 
	                                 <tr>
	                                     <th scope="row">첨부파일</th>
	                                     <td>
									<c:if test="${not empty fileMap }">
										<c:forEach var="file" items="${fileMap}" varStatus="status">
											<a href="#none" onclick="filedown('<c:out value="${file.FILE_ID}"/>', '<c:out value="${file.FILE_SEQ}"/>');" class="btn-down" title="첨부파일 다운로드">${file.ORGFILE}</a>	
										</c:forEach>
									</c:if>
									<c:if test="${empty fileMap }"><c:out value="첨부파일이 없습니다."/></c:if>
	                                     </td>
	                                 </tr>
	                                 <tr>
	                                  	<th>샘플 강의</th>
	                                  	<td>
	                                  		<c:if test="${rowData.SAMPLMS_LE_YN eq 'Y'}">
	                                  			<input type="button" class="btn btn-sm" style="background-color: yellow;" onclick="fnCourseSampleMovie(); return false;" title="미리보기" value="미리 보기"/>
	                                  		</c:if>
	                                  		<c:if test="${rowData.SAMPLMS_LE_YN ne 'Y'}">
	                                  			샘플 강의가 없습니다.
	                                  		</c:if>
	                                  		<c:if test="${not empty txtFileMap }">
												<c:forEach var="file" items="${txtFileMap}" varStatus="status">
	                                  				<input type="button" class="btn btn-sm" style="background-color: yellow;" onclick="filedown('<c:out value="${file.FILE_ID}"/>', '<c:out value="${file.FILE_SEQ}"/>');" title="자막 다운로드" value="자막 다운로드"/>
			                                  	</c:forEach>
											</c:if>
	                                  	</td>
	                                  </tr>
	                             </c:if>
                             <%-- <tr>
                                  	<th>자막 다운로드</th>
                                  	<td>
                                  		<c:if test="${not empty txtFileMap }">
											<c:forEach var="file" items="${txtFileMap}" varStatus="status">
                                  				<input type="button" class="btn btn-sm" style="background-color: yellow;" onclick="filedown('<c:out value="${file.FILE_ID}"/>', '<c:out value="${file.FILE_SEQ}"/>');" title="자막 다운로드" value="자막 다운로드"/>
		                                  	</c:forEach>
										</c:if>
										<c:if test="${empty txtFileMap }">
											등록된 자막이 없습니다.
										</c:if>
                                  	</td>
                             </tr> --%>
                             </c:if>
                            <c:if test="${rowData.MT_CTYPE_CODE == 'DAAA01'}">
                             	<tr>
                                 	<th scope="row">교육분류</th>
                                     <td><span class="txt_blue bold"><c:out value="${rowData.MT_SC_NAME}"/></span></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육과정명</th>
                                     <td><span class="txt_blue bold"><c:out value="${rowData.SEQ_TITLE}"/></span></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">신청기간</th>
                                     <c:if test="${rowData.OPENTYPE eq 'D'}">
										<td>
											<p><c:out value="${rowData.APPLY_SDATE}"/> ~ <c:out value="${rowData.APPLY_EDATE}"/></p>
										</td>
									</c:if>
									<c:if test="${rowData.OPENTYPE eq 'A'}">
										<td>
											<p>상시 운영</p>
										</td>
									</c:if>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육기간</th>
                                     
                                    <td>
										<c:if test="${rowData.OPENTYPE == 'D'}">
											<c:out value="${rowData.STUDY_SDATE}"/> ~ <c:out value="${rowData.STUDY_EDATE}"/>
										</c:if>
										<c:if test="${rowData.OPENTYPE == 'A'}">
											신청일로부터 <c:out value="${rowData.EDUDAY}"/>일 이내
										</c:if>
									</td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육시간</th>
                                     <td><c:out value="${rowData.STUDYTIME_TOT}"/>분</td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육장소</th>
                                     <td><c:out value="${rowData.EDU_PLACE}"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육설명</th>
                                     <td><c:out value="${fn:replace(rowData.RESULT_DESCRIPTION, newline, '<br>')}" escapeXml="false"/></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">교육대상</th>
                                     <td><c:out value="${fn:replace(rowData.RESULT_TARGET, newline, '<br>')}" escapeXml="false"/></td>
                                 </tr>
                                  <tr>
                                     <th scope="row">신청인원</th>
                                     <td><span><c:out value="${rowData.COURSE_USER_CNT}"/>명</span>/<span class="txt_red bold"><c:out value="${rowData.MAX_CNT}"/>명</span></td>
                                 </tr>
                                 <tr>
                                     <th scope="row">첨부파일</th>
                                     <td>
										<c:if test="${not empty fileMap }">
											<c:forEach var="file" items="${fileMap}" varStatus="status">
												<a href="#none" onclick="filedown('<c:out value="${file.FILE_ID}"/>', '<c:out value="${file.FILE_SEQ}"/>');" class="btn-down" title="첨부파일 다운로드">${file.SAVFILE}</a>	
											</c:forEach>
										</c:if>
										<c:if test="${empty fileMap }"><c:out value="첨부파일이 없습니다."/></c:if>
									</td>
                                  </tr>
                                  <tr>
                                  	<th>샘플 강의</th>
                                  	<td>
                                  	</td>
                                  </tr>
                             </c:if> 
                             </tbody>
                 		</table>
             		</div>
             		
             		<hr/>
             		
	             	<div class="btnAreaC">
					<c:if test="${empty rowData.MT_CONTENTS_CODE}">
	                       <button type="button" id="saveTag" name="button" class="btn btn-lg btn-blue" onclick="fnSaveAjax('<c:out value="${rowData.SUGANG_YN}"/>', '<c:out value="${rowData.OPENTYPE}"/>');return false;" title="수강신청">수강신청</button>
		                   <button type="button" id="classMove" name="button" class="btn btn-lg btn-blue" onclick="fnMove(); return false;" title="강의실이동">강의실</button>
		                   <button type="button" id="failTag" name="button" class="btn btn-lg btn-orange" onclick="fnCancelAjax(); return false;" title="신청취소">수강취소</button>
		                   <button type="button" name="button" class="btn btn-lg btn-drkblue" onclick="fnList(); return false;" title="목록">목록</button>
             		</c:if>
             		
             		<c:if test="${not empty rowData.MT_CONTENTS_CODE}">
             			<button type="button" name="button" class="btn btn-lg btn-drkblue" onclick="fnList(); return false;" title="목록">목록</button>
             		</c:if>
	                </div>
            	 </section>
			
				</form>
	
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
	</article>
</div>
<!-- 레이어 팝업 부분 -->
<div class="modal-backdrop in"></div>
<div class="layer_popup" id="layer_01" style="display: none;">
  <div class="layer-tit">
    <p>신청완료</p>
    <button title="닫기" class="layer_close pop_close" onclick="pC();">닫기</button>
  </div>
  <div class="layer_bg bg1">
    <p>신청 되었습니다.</p>
    <button title="닫기" class="btn-m pop_close" onclick="pC();">닫기</button>
  </div>
</div>
<div class="layer_backdrop in"></div>
<div class="layer_popup" id="layer_02" style="display: none;">
  <div class="layer-tit">
    <p>신청취소</p>
    <button title="닫기" class="layer_close pop_close" onclick="pC();">닫기</button>
  </div>
  <div class="layer_bg bg1">
    <p>신청이 취소되었습니다.</p>
    <button title="닫기" class="btn-m pop_close" onclick="pC();">닫기</button>
  </div>
</div>
<!-- 레이어 팝업 부분 끝 -->

<script type="text/javascript">
	
	var deviceChk = "";
	var agent = navigator.userAgent.toLowerCase();;
	var isIOS = (agent.indexOf("iphone")>-1||agent.indexOf("ipad")>-1||agent.indexOf("ipod")>-1);
	var isANDROID = (agent.match('android') != null);
	var isMSIE80 = (agent.indexOf("msie 6.0")>-1||agent.indexOf("msie 7.0")>-1||agent.indexOf("msie 8.0")>-1);
	

	// 	var test = $('#cseqno').val();
	// 	var fileUrl = "rtmp://112.175.102.51:1935/vod/mp4:"+test+"/01/01.mp4";
	var fileUrl = "";
	var mobilFileUrl = "http://112.175.102.51:1935/vod/_definst_/160/01/01.mp4/playlist.m3u8"
	
	
	if (isANDROID || isIOS) {

		$('#vd').show();
		var videoSeek = document.getElementById('vd');
		videoSeek.src = mobilFileUrl;
		
		// 플레이어 재생 버튼 클릭 시, COUNT + 1
		var played = 0;
		
		if( played == 0 ) {
			$.ajax({
				url : "/academy/course/countUpAjaxExec.do",
				data : {
							cseqno : $('#cseqno').val()
		         		},
		        dataType : "json",
		        type : 'post',
		        success : function(res) {
		        	played = 1;
		        },
		        error : function(e) {
		        	alert("error :" + e.responseText);
				}
		     });
		}
		 	
		videoSeek.play();
	
	} else if('${rowData.MT_CONTENTS_CODE}' == 'CT0002') {
		jwplayer('player').setup({
		
			 file: "rtmp://112.175.102.51:1935/vod/mp4:160/01/01.mp4",
// 			file: fileUrl,
			primary: "flash",
			controls: true, //컨트롤바 
			width: "100%",
			aspectratio:"16:9", 
			image : "/five/${rowData.SAVFILE}",
			events: {
					onSertupError: function(data){
						alert('data' + data);
					}
			
			}
		});
	
		 
		 // 플레이어 재생 버튼 클릭 시, COUNT + 1
		 var played = 0;
		 jwplayer().onPlay(function () { 
		 	
		 	if( played == 0 ) {
		 		
		 		$.ajax({
		 			url : "/academy/course/countUpAjaxExec.do",
		 			data : {
		 						cseqno : $('#cseqno').val()
		         			},
		         	dataType : "json",
		         	type : 'post',
		         	success : function(res) {
		         		played = 1;
		         	},
		         	error : function(e) {
		         		alert("error :" + e.responseText);
				    }
		         });
		 	}
		 	
		 });
	}
		 
</script>

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->