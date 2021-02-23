<%
/****************************************************
	system	: 우편번호 찾기
	summary	:	
	wdate	: 2016-09-10
	writer	: 이진영
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%> --%>
<script type="text/javascript">
	 $(document).ready(function(){
		
	 	// 엔터 검색
		$('#srchText').bind('keydown', function(e) {
            if (e.keyCode == 13) { // enter key
            	getAddr();
                return false;
            }
        });

		
	    $('#zipTable').on('click','.txt_blue',function(e){
	    	e.preventDefault();
	    	var data = {
	            'zip_code' : $(this).parents('tr').find('.zipCode').text(),
	            'adres' : $(this).text(),
	            'gubun' : '<c:out value="${params.gubun}"/>'
	        };
	        if (opener) {
	            opener.fnZipCodePopupCallBack(data);
	            self.close();
	        }
	    }); 
	});

	 function getAddr(currentPage){
		 $("#currentPage").val(currentPage);
		 
		if( $("#srchText").val() == '') {
			alert('도로명이나 지역명을 입력해주세요.');
			$("#srchText").focus();
		}
		else {
			$('#zipTable').showLoading();
			$.ajax({
			     url :"/common/getNewPostAjax.do"
				,type:"post"
				,data:$("#form").serialize()
				,dataType:"xml"
				,success:function(xmlStr){
					$('#zipBody').html('');
		        	$('#zipTable').hideLoading();
		            if ($(xmlStr).find('totalCount').text() == '0'){
		            	alert('검색결과가 없습니다. 검색어에 잘못된 철자가 없는지, 정확한 주소인지 다시 한번 확인해 주세요.');
		            	return;
		            }
					if(xmlStr != null){
						makeList(xmlStr);
					}
				}
			});
		}
	}
	
	function makeList(xmlStr){
		var htmlStr = "";
		var pageStr = "";
		$(xmlStr).find("juso").each(function(){
			var zipNo = $(this).find('zipNo').text();
			var roadAddr = $(this).find('roadAddr').text();
			htmlStr += "<tr>";
			htmlStr += "<td class='zipCode'>"+$(this).find('zipNo').text() +"</td>";
			htmlStr += "<td><a href='#none' onclick='fnZipSelect("+zipNo+',"'+roadAddr+'"'+"); return false;' title='주소'><span class='txt_blue'>"+$(this).find('roadAddr').text() +"</span></a><br/>"+ $(this).find('jibunAddr').text()+"</td>";
			htmlStr += "</tr>";
		});
		$("#zipBody").html(htmlStr);
	}
</script>
		<form name="form" id="form" method="post">
			<input type="hidden" id="cPage" name="cPage" value="value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
			<input type="hidden" id="currentPage" name="currentPage" value="1"/><!-- 현재 페이지. -->
			<input type="hidden" id="countPerPage" name="countPerPage" value="100000"/> <!-- 페이지당 출력 목록 수. 기본값은 10 -->
	<!-- popup 지점검색-->
	    <article>
	        <div class="modal" id="post" tabindex="-1" role="dialog" aria-labelledby="postLabel" aira-hidden="true">
	            <div class="modal-dialog">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-modal="Close" title="닫기"><span aria-hidden="true" class="text-hide">닫기</span></button>
	                        <h4 class="modal-title" id="postLabel">우편번호 검색</h4>
	                    </div>
	
	                </div>
	                <div class="modal-body">
	                    <section>
	                        <div class="searchWrap">
	                            <form>
	                                <fieldset>
	                                    <legend class="sr-only">검색</legend>
	                                    <div class="formSearch">
	                                        <div class="onlyOneBtn">
	                                            <input type="text" id="srchText" name="srchText" title="검색어입력" class="textBox">
	                                            <button type="button" name="button" onclick="getAddr();return false;" class="btn-mint" title="검색">검색</button>
	                                        </div>
	                                    </div>
	                                </fieldset>
	                            </form>
	                        </div>
	                        <p class="fnt13 po_C7 mrg_t5">읍/면/동/리 + 지번 <span class="po_C4">예)어진동307-19</span>, 시/군/구 + 도로명, 동명 또는 건물명 <span class="po_C4">예)동해시 중앙로,여수 중앙동</span></p>
	                    </section>
	                    <hr class="hr_20">
	                    <section>
	                        <div class="tblWrap scroll_table" id="tblWrap">
	                            <table class="dataTbl" id="zipTable">
	                                <caption>우편번호,주소</caption>
	                                <colgroup>
	                                    <col style="width:30%">
	                                </colgroup>
	                                <thead>
	                                    <tr>
	                                        <th scope="col">우편번호</th>
	                                        <th scope="col">주소</th>
	                                    </tr>
	                                </thead>
	                                <tbody id="zipBody">
	                                    <!-- 검색결과 전 -->
	                                    <tr>
	                                        <td colspan="2" class="text-center">
	                                            검색어를 입력하세요.
	                                        </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                            <%-- <paging:page cpage="${currentPage}" total="${totalCount}" pageSize="${countPerPage}" link="javascript:move_page" /> --%>
	                        </div>
							
	                    </section>
	                </div>
	            </div>
	        </div>
	    </article>
	    <!-- //popup -->
	
	
	
	
	
	<!-- <div class="popup-wrap">
		<div class="popup-tit">
			<h1 class="con-tit">우편번호 찾기</h1>
		</div>
		<div>도로명이나 지역명을 이용해서 검색해 보세요.</div>
		<div>건물번호, 번지를 함께 입력하시면 더욱 정확한 결과가 검색됩니다. 예) 삼일대로 340, 저동1가 1-2</div>
		
		<div class="popup-con">
			
			<form name="form" id="form" method="post">
			<input type="hidden" name="currentPage" value="1"/>현재 페이지.
			<input type="hidden" name="countPerPage" value="50"/> 페이지당 출력 목록 수. 기본값은 10
			
			<div id="list"></div>

			<div class="pop_wrap">
				도로명주소 폼			
				<div class="serch-box shadow_box" style="display: block;">
					<input type="text" id="srchText" name="srchText" placeholder="예) 삼일대로 340, 저동1가 1-2" title="주소 검색" />
					<a href="#" onclick="getAddr();return false;" class="btn-submit" title='검색'>검색</a>
				</div>
				// 도로명주소 폼
				
				<div class="table_box tight" style="margin-top: 10px;">
	
					<table cellpadding="0" cellspacing="0" class="row_type sub-table popuptable" id="zipTable">
				    	<caption>주소 검색 결과 : 상상스토리 교육시스템 우편번호 찾기의 주소 검색 결과입니다.</caption>
				    	<thead>
				        	<tr>
				            	<th scope="col" width="25%">우편번호</th>
				                <th scope="col" width="75%">주소</th>
				            </tr>
				        </thead>
						<tbody id="zipBody">
				        </tbody>
				    </table>
				</div>
			</div>//.pop_wrap
		</form>
		</div>

	</div>/ wrap -->


<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>