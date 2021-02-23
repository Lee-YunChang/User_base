<%
/****************************************************
	system	: academy > 나의강의실 > 1:1문의 등록폼
	title	: 1:1문의 등록폼
	summary	:	
	wdate	: 2013-09-06
	writer	: kim min gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
		
		//저장
		function fnSave(){

			if($('#submitYn').val() == 'Y'){
				alert('게시물이 등록중입니다. 잠시만 기다려 주세요.');
				return false;

			}
			
			if($('#bcateno option:selected').val() == '') {
				alert('문의유형을 선택해주세요.');
				$('#bcateno').focus();
				return;
			}
			
			if ($('input[name=title]').valueEmpty()) {
				alert('제목을 입력해주세요.');
				$('input[name=title]').focus();
				return;
			}
			
			if($.getLength($('input[name=title]')) > 400){
				 alert('제목은 400(byte) 이하로 입력해주세요.');
				 $('input[name=title]').focus();
				 return false;
			}
			$('#submitYn').val('Y');
			$('form[name=bbsForm]').attr('target', '_cm').attr('method', 'post').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsExec.do').submit();
		}

		//목록		
		function fnList(){
			$('#bbsNo').val('');
			$('#bcateno').val('');
			$('form[name=bbsForm]').attr('action', '<c:out value="${ctx}"/>${ctx}/academy/myclass/myBbsList.do').attr('target', '_self').submit();		
			
		}

		//상세보기
		function fnView(){
			$('form[name=bbsForm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myBbsView.do').attr('target', '_self').submit();		
			
		}
		
		//파일 업로드
		function fileUploadPreview(thisObj, preViewer) {
			/* if(/(\.java|\.class|\.cab|\.arj|\.lzh|\.exe|\.jsp|\.JSP|\.js)$/i.test(thisObj.value)) {
	            alert('업로드 가능한 파일이 아닙니다.');
	            $('#ad_fileName').val('');
	            $('input[name=ad_fileName]').val('');
	            return;
	        }

			var ext = $('#ad_file_hidden').val().split('.').pop().toLowerCase();
			
			if($.inArray(ext, ['gif','png','jpg','jpeg','hwp','xls','pptx','ppt','xlsx']) == -1) {
	            alert('업로드 가능한 파일이 아닙니다.');
			 	$('#ad_fileName').val('');
	         	$('input[name=ad_fileName]').val('');
			 	return;
		    } */
		}
		
</script>
	
<div class="contents-wrap">

	<div class="sub-wrap">

	<!-- 왼쪽 메뉴 영역 -->
	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_mypage.jsp"%>
	<!-- // 왼쪽 메뉴 영역 -->	

			<!-- 페이지 상단 타이틀 영역 -->
			<div id="Sub_Header" class="menu5">
				<div class="nav">
					<img src="/academy/images/ico_home.png" alt="Home" /><img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />마이페이지<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />1:1 문의
				</div>
				<h3>1:1 문의</h3>
				<p>나의 수강정보를 한눈에 확인할 수 있습니다.</p>
			</div>
			<!-- // 페이지 상단 타이틀 영역 -->
			
			<form id="bbsForm" name="bbsForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
			<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
			<input type="hidden" name="submitYn" id="submitYn" value="N"/>
			<input type="hidden" name="delCheckFile" id="delCheckFile" value=""/>
			<input type="hidden" name="fileno"  id="fileno" value=""/>
 			<input type="hidden" name="UPLOAD_DIR" id="UPLOAD_DIR" value="<%=SangsProperties.getProperty("Globals.bbsFilePath")%>"/>
 			
			<div id="Contents">
				<div class="bbs_write">
					<table cellpadding="0" cellspacing="0">
						<caption>1:1 문의 작성테이블:상상스토리 교육시스템의 1:1 문의 작성</caption>
						<colgroup>
							<col width="120px" />
							<col width="650px" />
						</colgroup>
						<tbody>
							<tr>
								<th><label for="bcateno">문의유형</label></th>
								<td>
									<select name="bcateno" id="bcateno" class="ad_tb_select">
										<option value="">선택</option>
										<ext:option items="${categoryData}" selected="${rowData.BCATENO}" />
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="title">제목</label></th>
								<td><input type="text" id="title" name="title" style="width:600px;"  value="<c:out value="${rowData.TITLE}"/>" title="제목"/></td>
							</tr>
							<tr>
								<th><label for="ad_fileName">첨부파일</label></th>
								<td><input type="file" id="ad_fileName" name="uploadFile" style="width:500px;" value="<c:out value="${listData[0].ORGFILE}"/>" onchange="javascript:document.getElementById('ad_fileName').value = this.value; fileUploadPreview(this, 'preView');" title="첨부파일"/></td>
							</tr>
							<tr>
								<th><label for="content">문의내용</label></th>
								<td><textarea name="content" id="content" title="문의내용" rows="12" style="width: 600px;"><c:out value="${rowData.CONTENT}" escapeXml="false"/></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="bbs_control">
					<div class="btn_group">
						<div class="btn_right">
							<a href="#" class="btn mid orange" onclick="fnSave(); return false;">등록</a>
							<a href="#" class="btn mid gray" onclick="fnList(); return false;">취소</a>
						</div>
					</div>
				</div>
				<!-- // 버튼 영역 -->

			</div><!-- // Contents -->
			
			</form>
			
		</div>
</div>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>