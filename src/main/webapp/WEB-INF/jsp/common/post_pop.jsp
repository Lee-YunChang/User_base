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
		$('#srchText').bind('keydown', function(e) {
            if (e.keyCode == 13) { // enter key
            	fnSearch();
                return false;
            }
        });
		
		$('#searchSe').change(function(){
	    	$('.pop_txt_field div[id^=txt_]').hide();
	    	$('.pop_txt_field div[id=txt_'+$(this).val()+']').show();
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
	
	function fnSearch(){
		$('#zipTable').showLoading();
		$.ajax({
	        url: '/common/getPostAjax.do',
	        type: 'POST',
	        data:{
	        	searchSe : $('#searchSe').val(),
	        	srchText : $('#srchText').val()
	             },
	        dataType : 'xml',
	        success: function(xmlData){
	        	$('#zipBody').html('');
	        	$('#zipTable').hideLoading();
	            if ($(xmlData).find('returnCode').text() != '00'){
	            	alert($(xmlData).find('errMsg').text());
	            	return;
	            }
	            
	            if ($('searchSe').val()=='oldpost'){
		            $(xmlData).find('detailList').each(function(idx){
		            	appendHtml =
		            	'<tr>'
	                        +'<td class="zipCode">'+$(this).find('zipNo').text()+'</td>'
	                        +'<td><a href="#"><div class="blue">'+$(this).find('adres').text()+'</div></a></td>'
	                    +'</tr>';
		            	$("#zipBody").append(appendHtml);
		            });
	            }else{
	            	$(xmlData).find('newAddressList').each(function(idx){
                        appendHtml =
                        '<tr>'
                            +'<td class="zipCode">'+$(this).find("zipNo").text()+'</td>'
                            +'<td><a href="#"><div class="blue">'+$(this).find('lnmAdres').text()+'</div></a><div>'+$(this).find('rnAdres').text()+'</div></td>'
                        +'</tr>';
                        $('#zipBody').append(appendHtml);
                    });
	            }
	        },
	        error: function(){
	        	$('#zipTable').hideLoading();
	            alert ('알 수 없는 에러발생.!!');
	        }
	    });
	}

</script>
</head>
<body id="pop_wrap">

<div id="popup">
		<div class="pop_header clearfix">
			<h1>우편번호 찾기</h1>
			<a href="javascript:self.close();" title="닫기"><img src="/academy/images/ico_pop_close.png" alt="닫기" /></a>
		</div>

		<div class="pop_wrap">

			<!-- 도로명주소 폼 -->
			<div class="shadow_box" style="display: block;">
				<div class="yellow_box">
					<select id="searchSe" title="검색구분">
                	<option value="road">도로명+건물번호</option>
				    <option value="dong">동(읍/면/리)명+지번</option>
				    <option value="oldpost">구 지번</option>
                </select>&nbsp;
					<input type="text" id="srchText" name="srchText" title="주소 검색" style="width: 150px;" placeholder="도로명+건물번호"/> <a href="#" onclick="fnSearch(); return false;" class="btn brown">검색</a>
				</div>
			</div>
			<!-- // 도로명주소 폼 -->
			
			<div class="table_box tight" style="margin-top: 10px;">

				<table cellpadding="0" cellspacing="0" class="row_type" id="zipTable">
			    	<caption>주소 검색 결과:이 표는 주소 검색 결과입니다.</caption>
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
	</div>


</body>
</html>
