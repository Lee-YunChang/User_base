<%--
    Description : 지식터 > 영화신청
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.10.24  구동림           최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	function movieDown(savPath , bbsNo , orgFile, bcateNo , savFile){
		$("#savPath").val(savPath);
		$("#bbsNo").val(bbsNo);
		$('#filename').val(encodeURIComponent(savFile));
		$("#fileName").val(orgFile);
		$('#downDir').val("excelSample/"); //운영루트
		//$('#downDir').val("edbbs/"+bcateNo+"/"+bbsNo+"/"); //test개발 루트
		$('#ftype').val("");
		$("#frm").attr("action" , "/academy/filedown.do").submit();
	}
	
	//신청서 다운로드
	function submitFile(savFile){
		$('#ftype').val("download");
		$('#filename').val(savFile);
		$('#fileName').val(savFile);
		$("#frm").attr("action" , "/academy/filedown.do").submit();
	}
</script>

<div class="contents-wrap">

	<div class="sub-wrap">
			
		<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_eduinfo.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>지식터</span></li>
				<li class="location"><span>영화신청</span></li>
			</ul>

			<div class="sub-tit">
				<h3>영화신청</h3>
				<p>상상스토리이 제작한 영화의 DVD를 신청하실 수 있습니다.</p>
			</div>
			
			<div class="contents" id="sContents">
				<form method="post" action="/academy/filedown.do" id="frm" name="frm">
					<input type="hidden" name="savPath" id="savPath" value=""/>
					<input type="hidden" name="filename" id="filename" value=""/>
					<input type="hidden" name="ftype" id="ftype" value=""/>
					<input type="hidden" name="fileName" id="fileName" value=""/>
					<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
					<input type="hidden" name="downDir" id="downDir" value=""/>
					<input type="hidden" id="movieFileDown" name="movieFileDown" value="">
				</form>
				<div class="human-movie">
					<div class="moviebox top">
						<h3 class="con-tit">문화콘텐츠 신청안내</h3>
						<p class="mb50">
							- 상상스토리는 문화확산을 목적으로 콘텐츠 자료를 보급하고 있습니다. 교육이나 홍보에 활용하실 단체는 아래 첨부된 신청서를 작성 후, 이메일(public@nhrc.go.kr)로 보내 주시면 우편(우체국택배)으로 발송해 드리겠습니다.
						</p>
						<h3 class="con-tit mb30">영화/DVD등 홍보자료 신청 안내 및 <span class="txt_red">주의사항</span></h3>
						<ul class="list-bd-dashed">
							<li class="bg1 d-table"><span class="d-table-cell">1) 신청서 내에 있는 자료만을 신청하실 수 있으며, 임의대로 신청서를 변경하시면 안 됩니다.</span></li>
							<li class="bg2 d-table"><span class="d-table-cell">2) 신청하신 자료는 기관 공용으로 활용해 주시기 바랍니다. 발송된 콘텐츠 내역은 관리되고 있으므로, 이미 발송된 기관과 콘텐츠는 중복해서 재발송이 안됩니다. </span></li>
							<li class="bg3 d-table"><span class="d-table-cell">3) 자료 신청 시에는 <span class="txt_red">반드시 우편번호와 주소를 정확하게 기입</span>해 주셔야 발송오류를 방지하실 수 있습니다.</span> </li>
							<li class="bg4 d-table"><span class="d-table-cell">4) 콘텐츠의 신청비용은 무료이며, <span class="txt_red">배송비는 착불</span>입니다. (6천원 이하) </span></li>
							<li class="bg5 d-table"><span class="d-table-cell">5) 신청하신 콘텐츠는 매주 1회 일괄 배송되며, 신청일에 따라서 <span class="txt_red">3일∼7일 후 수령 가능</span>합니다. <span class="d-block">(그 외 문의사항 : 박영주 02-2125-9878)</span></span></li>
						</ul>
						<div class="translation">
							<span class="bg1">
								<em class="ellipsis">문화콘텐츠 활용신청서 다운받기</em>
								<c:set value="${fn:replace(moveReqsList2[0].SAVPATH , splitStr , 'edu-data/') }" var="jpgSavPath"/>
							</span><a href="#none" onclick="movieDown('<c:out value="${jpgSavPath}"/>' , '<c:out value="${moveReqsList2[0].BBSNO}"/>' , '<c:out value="${moveReqsList2[0].ORGFILE}"/>' , '<c:out value="${moveReqsList2[0].BCATENO}"/>' , '<c:out value="${moveReqsList2[0].SAVFILE}"/>');return false" title="문화콘텐츠 활용신청서 다운로드">다운로드</a>
						</div>
					</div>
					
					<div class="moviebox">
						<h3 class="con-tit">문화콘텐츠 활용 가이드 (학습지도안)</h3>
						<div class="download-box">
							<ul class="downlist">
								<c:forEach items="${moveReqsList}" var="result" varStatus="status">
									<c:set value="${fn:indexOf(result.SAVPATH, 'upload')}" var="index"/>
									<c:set value="${fn:substring(result.SAVPATH , 1 , index) }" var="splitStr"/>
									<c:set value="${fn:replace(result.SAVPATH , splitStr , 'edu-data/') }" var="jpgSavPath"/>
									
									<li>
										<div class="translation-wrap">
											<div class="translation gray">
												<span>
													<em class="ellipsis">
														<c:out value="${result.TITLE}"/>
													</em>
												</span><a href="#none" onclick="movieDown('<c:out value="${jpgSavPath}"/>' , '<c:out value="${result.BBSNO}"/>' , '<c:out value="${result.ORGFILE}"/>' , '<c:out value="${result.BCATENO}"/>' , '<c:out value="${result.SAVFILE}"/>');return false" title="다운로드">다운로드</a>
											</div>
										</div>
									</li>
								</c:forEach>	
							</ul>
						</div>
					</div>
				</div>
				
				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>

			</div>
			
		</div><!-- //contents-->

	</div><!-- //sub-contents -->

</div><!-- //sub-wrap -->
	
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->
