<%--
	Description : 
	 
	Modification Information
	수정일		수정자			수정내용
	-------		-----------------------------------
	2015.04.01 	SANGS			최초작성

--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<script type="text/javascript">
	$(document).ready(function(){
		
		// 엔터 검색
		$('#srchText').bind('keydown', function(e) {
            if (e.keyCode == 13) { // enter key
            	getAddr();
                return false;
            }
        });

		
	    $('#zipTable').on('click','.blue',function(e){
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

	function getAddr(){
		if( $("#srchText").val() == '') {
			alert('도로명이나 지역명을 입력해주세요.');
			$("#srchText").focus();
		}
		else {
			$('#zipTable').showLoading();
			$.ajax({
			     url :"/common/getNewPostAjaxJoin.do"
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
		$(xmlStr).find("juso").each(function(){
			htmlStr += "<tr>";
			htmlStr += "<td class='zipCode'>"+$(this).find('zipNo').text() +"</td>";
			htmlStr += "<td><a href='javascript:fnZipSelect();' title='주소'><span class='blue'>"+$(this).find('roadAddr').text() +"</span></a><br/>"+ $(this).find('jibunAddr').text()+"</td>";
			htmlStr += "</tr>";
		});
		$("#zipBody").html(htmlStr);
	}

	function enterSearch() {
		if (event.keyCode==13) getAddr();
	}
</script>
</head>

<body id="pop_wrap">
	
	<div id="popup">
		
		<div class="pop_header clearfix">
			<h1>우편번호 찾기</h1>
			<a href="javascript:self.close();" title="닫기"><img src="/academy/images/ico_pop_close.png" alt="닫기" /></a>
		</div>
		<div class="shadow_box">
			<div class="yellow_box">
				 <p>도로명이나 지역명을 이용해서 검색해 보세요.<br/>건물번호, 번지를 함께 입력하시면 더욱 정확한 결과가 검색됩니다. <span class="t_blue"> 예) 가정북로 90, 장동 23-7</span></p>
			</div>
		</div>
		
		<form name="form" id="form" method="post">
			<input type="hidden" name="currentPage" value="1"/><!-- 현재 페이지. -->
			<input type="hidden" name="countPerPage" value="50"/> <!-- 페이지당 출력 목록 수. 기본값은 10 -->
			
			<div id="list"></div>

			<div class="pop_wrap">
			<!-- 도로명주소 폼 -->
			<div class="shadow_box" style="display: block;">
				<input type="text" id="srchText" name="srchText" title="주소 검색" style="width: 250px;height:20px" placeholder="예) 가정북로 90, 장동 23-7"/> 
				<a href="#" onclick="getAddr();return false;" class="btn brown" title="검색">검색</a>
			</div>
			<!-- // 도로명주소 폼 -->
			
			<div class="table_box tight" style="margin-top: 10px;">

				<table cellpadding="0" cellspacing="0" class="row_type" id="zipTable">
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
			
			
			</div><!-- //.pop_wrap -->
		</form>
	</div>


</body>
</html>
