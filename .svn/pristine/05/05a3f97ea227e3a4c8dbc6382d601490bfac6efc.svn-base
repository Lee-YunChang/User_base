<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상상스토리 사용자포털</title>
<link rel="stylesheet" href="/academy/common/css/common.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/main.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/sub.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/mobile.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
<link rel="stylesheet" href="/academy/common/css/jquery-ui.min.css?version=<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">

<script type="text/javascript">
var filter = "win16|win32|win64|mac|macintel";
var result = "";

if ( navigator.platform  ) {
    if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
        result = 'mobile';
    } else {
        result = "pc";
    }
}

    $(document).ready(function() {
    	//공지팝업
		'<c:if test="${noticePopCount > 0 }">'
	        '<c:forEach items="${noticePopList}" var="result" varStatus="status" >'
	            if($.cookie('notice_<c:out value="${result.POP_NO}"/>') != 'ok_<c:out value="${result.POP_NO}"/>'){
					//SANGS.Util.openPopup('<c:out value="${ctx}"/>/academy/main/main/notice_pop.do?popNo=<c:out value="${result.POP_NO}"/>', 'main_pop_<c:out value="${result.POP_NO}"/>','width=<c:out value="${result.WIDTH_SIZE}"/>, height=<c:out value="${result.HEIGHT_SIZE}"/>, top=<c:out value="${result.LOC_TOP_PX}"/>, left=<c:out value="${result.LOC_LEF_PX}"/>, resizable=no, status=no, menubar=no, toolbar=no, scrollbars=yes, location=no');
					$("#mainLayer_popup<c:out value='${status.count}'/>").css('display' , 'block');
					var top = Number(Number('<c:out value="${result.LOC_TOP_PX}"/>') + ('<c:out value="${result.HEIGHT_SIZE}"/>'/2));
			        var left = Number(Number('<c:out value="${result.LOC_LEF_PX}"/>') + ('<c:out value="${result.WIDTH_SIZE}"/>'/2));
			        
			        //디바이스가 pc일경우
					if(result == 'pc'){
						document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.width = '<c:out value="${result.WIDTH_SIZE}"/>%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.height = '<c:out value="${result.HEIGHT_SIZE}"/>%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.top = '<c:out value="${result.LOC_TOP_PX}"/>%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.left = '<c:out value="${result.LOC_LEF_PX}"/>%';
				        document.getElementById("mainLayer_bg<c:out value='${status.count}'/>").style.height = '<c:out value="${result.HEIGHT_SIZE}"/>%';
					}
					
					//디바이스가 모바일일 경우
					if(result == 'mobile'){
						document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.width = '70%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.height = '70%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.top = '50%';
				        document.getElementById("mainLayer_popup<c:out value='${status.count}'/>").style.left = '50%';
				        document.getElementById("mainLayer_bg<c:out value='${status.count}'/>").style.height = '70%';
					}
			        var content = $('#mainLayer_bg'+'<c:out value="${status.count}"/>').text();
			          
			        $('#mainLayer_bg'+'<c:out value="${status.count}"/>').html(content);
	            }
	        '</c:forEach>';
	    '</c:if>';

    });
    
  //팝업닫기
   	function layerPop(cnt){
   		$('#mainLayer_popup'+cnt).css('display' , 'none');
   	}
   	
    //쿠키등록
    function setCookie( name, value, expiredays ){
        var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    }
    
    //쿠키삭제
    function deleteCookie( name, value, expiredays ){
    	var todayDate = new Date();
        todayDate.setDate( todayDate.getDate() + expiredays );
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
    }
</script>
</head>
<body>

		<img alt="미오픈 이미지" src="/academy/images/main/open_popup.png">
	
		<c:forEach items="${noticePopList}" var="result" varStatus="status" >
				<div class="mainLayer_popup" id="mainLayer_popup${status.count}" style="display: none;">
					<div class="mainLayer-tit" id="mainLayer-tit">
						<p><c:out value="${result.POP_TITLE}" /></p>
						<button title="닫기" class="layer_close pop_close" onclick="layerPop('<c:out value="${status.count}" />');return false;">닫기</button>
					</div>
					<div class="mainLayer_bg bg3" id="mainLayer_bg${status.count}">
						<c:out value="${result.POP_CONTENT}" escapeXml="false"/>
					</div>
					<div class="mainLayer_bottom" id="mainLayer_bottom" align="right">
						<p class="checks" id="checkBox">
							<input type="checkbox" name="close_view${status.count}" id ="close_view${status.count}" popNo="<c:out value="${result.POP_NO}"/>" check="0" style="margin-left:10px;" />
							<label for="close_view${status.count}"> 오늘 하루 이 창을 열지 않음 </label>
							<button title="닫기" class="mainLayer_btn" onclick="layerPop('<c:out value="${status.count}" />');return false;">[닫기]</button>
						</p>
					</div>
				</div>
		</c:forEach> 
			
		</div><!-- //contents -->
		<div class="bg-layer"></div>
</body>
</html>