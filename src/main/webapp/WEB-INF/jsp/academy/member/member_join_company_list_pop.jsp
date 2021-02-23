<%
/****************************************************
    system	: academy > 회원 > 비밀번호 변경 팝업창
    title	: 비밀번호 변경 팝업창
    summary	:
    wdate	: 2015-03-02
    writer	: kim hak gyu
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge; requiresActiveX=true;" />

<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>

<title>상상스토리 사용자포털</title>

<link rel="stylesheet" href="<c:out value='/academy/common/css/common.css'/>" type="text/css" />

<script type="text/javascript">

$(this).click(function(){
    //alert(jQuery('input:radio[name="companyList"]:checked').val());
});


//선택기업으로 등록
function submitCompany() {

    var comNo = jQuery('input:radio[name="companyList"]:checked').val();
    var tel =  $('#'+comNo+"_TEL").val().split('-');

    //데이터 세팅
    var data={
        'COMNO' : comNo,
        'COMNAME' : $('#'+comNo+"_COMNAME").val(),
        'BIZNO' : $('#'+comNo+"_BIZNO").val(),
        'ZIP' : $('#'+comNo+"_ZIP").val(),
        'ZIP1' : $('#'+comNo+"_ZIP1").val(),
        'ZIP2' : $('#'+comNo+"_ZIP2").val(),
        'ADDR01' : $('#'+comNo+"_ADDR01").val(),
        'ADDR02' : $('#'+comNo+"_ADDR02").val(),
        'CEO' : $('#'+comNo+"_CEO").val(),
        'TEL1' : tel[0],
        'TEL2' : tel[1],
        'TEL3' : tel[2],
        /* 'COM_REG_DATE' : $('#'+comNo+"_COM_REG_DATE").val(), */
        'BIZCND' : $('#'+comNo+"_BIZCND").val(),
        'INDUTY' : $('#'+comNo+"_INDUTY").val(),
        'MT_ORG_CODE' : $('#'+comNo+"_MT_ORG_CODE").val(),
        'COMPMNGR' : $('#'+comNo+"_COMPMNGR").val(),
        'COM_REG_GB' : $('#'+comNo+"_COM_REG_GB").val()

    };

    opener.returnCompanyInfo(data);
    self.close();

}

</script>



</head>
<body>

<form name="companyForm" id="companyForm" action="" method="post">
<input type="hidden" name="bizNo" id="bizNo" value=""/>
<input type="hidden" name="comNo" id="comNo" value=""/>
</form>
    <div id="popup">
        <div class="pop_header clearfix">
            <h1>검색결과</h1>
            <a href="javascript:self.close();" title="닫기"><img src="/academy/images/ico_pop_close.png" alt="닫기" /></a>
        </div>

        <div class="pop_wrap">

            <div class="shadow_box">
                <div class="yellow_box">
                     <p>아래의 검색된 기업 이외에 신규 기업을 등록하시려면 <strong class="t_blue">상상스토리 042-605-7074</strong>으로 문의하셔서 기업등록을 요청해주시기 바랍니다.</p>
                </div>
            </div>

            <!-- 조회 버튼 클릭 후 리스트 생성 -->
            <div class="table_box" style="margin-top: 20px;">
                <table cellpadding="0" cellspacing="0" class="row_type">
                    <caption>소속업체 조회 목록 : 상상스토리 교육시스템의 소속업체 조회 목록입니다.</caption>
                    <colgroup>
                        <col width="50px"/>
                        <col width="130px"/>
                        <col width="110px"/>
                        <col width="px"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>회사명</th>
                            <th>사업자 번호</th>
                            <th>관할기관</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty resultList}">
                            <c:forEach items="${resultList}" var="result" varStatus="stat">
                                <tr class="line_<c:out value="${stat.index}"/>">
                                    <td><input type="radio" id="companyList_<c:out value="${result.COMNO}"/>" name="companyList"  value="<c:out value="${result.COMNO}"/>"/><!-- 사업자일련번호 -->
                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_COMNAME" id="<c:out value="${result.COMNO}"/>_COMNAME" value="<c:out value="${result.COMNAME}"/>"/><!-- 사업체명 -->

                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_BIZNO" id="<c:out value="${result.COMNO}"/>_BIZNO" value="<c:out value="${result.BIZNO}"/>"/><!-- 사업자 등록번호 -->

                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_ADDR01" id="<c:out value="${result.COMNO}"/>_ADDR01" value="<c:out value="${result.ADDR01}"/>"/><!-- 주소1 -->

                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_ADDR02" id="<c:out value="${result.COMNO}"/>_ADDR02" value="<c:out value="${result.ADDR02}"/>"/><!-- 주소2 -->

                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_ZIP" id="<c:out value="${result.COMNO}"/>_ZIP" value="<c:out value="${result.ZIP}"/>"/><!-- 우편번호 -->
                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_ZIP1" id="<c:out value="${result.COMNO}"/>_ZIP1" value="<c:out value="${result.ZIP1}"/>"/><!-- 우편번호1 -->

                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_ZIP2" id="<c:out value="${result.COMNO}"/>_ZIP2" value="<c:out value="${result.ZIP2}"/>"/><!-- 우편번호2 -->

                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_CEO" id="<c:out value="${result.COMNO}"/>_CEO" value="<c:out value="${result.CEO}"/>"/><!-- 대표자 -->

                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_TEL" id="<c:out value="${result.COMNO}"/>_TEL" value="<c:out value="${result.TEL}"/>"/><!-- 전화번호1 -->

                                    <%-- <input type="hidden" name="<c:out value="${result.COMNO}"/>_COM_REG_DATE" id="<c:out value="${result.COMNO}"/>_COM_REG_DATE" value="<c:out value="${result.COM_REG_DATE}"/>"/> --%><!-- 설립일 -->

                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_BIZCND" id="<c:out value="${result.COMNO}"/>_BIZCND" value="<c:out value="${result.BIZCND}"/>"/><!-- 종목 -->
                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_INDUTY" id="<c:out value="${result.COMNO}"/>_INDUTY" value="<c:out value="${result.INDUTY}"/>"/><!-- 업태 -->
                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_MT_ORG_CODE" id="<c:out value="${result.COMNO}"/>_MT_ORG_CODE" value="<c:out value="${result.MT_ORG_CODE}"/>"/><!-- 소속관할코드 -->
                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_COMPMNGR" id="<c:out value="${result.COMNO}"/>_COMPMNGR" value="<c:out value="${result.COMPMNGR}"/>"/><!-- 기업관리자존재 유무 -->
                                    <input type="hidden" name="<c:out value="${result.COMNO}"/>_COM_REG_GB" id="<c:out value="${result.COMNO}"/>_COM_REG_GB" value="<c:out value="${result.COM_REG_GB}"/>"/><!-- 사업자구분 -->
                                    
                                    </td>
                                    <td><label for="select01"><c:out value="${result.COMNAME}"/></label></td>
                                    <td><c:out value="${result.BIZNO}"/></td>
                                    <td><c:out value="${result.MT_ORG_NAME}"/></td>
                                </tr>
                            </c:forEach>
                        </c:when>

                        <c:otherwise>
                            <c:if test="${empty listData}">
                                <tr><td colspan="5" align="center">등록된 정보가 없습니다.</td></tr>
                            </c:if>
                        </c:otherwise>

                    </c:choose>
                    </tbody>
                </table>
            </div>
            <!-- // 조회 버튼 클릭 후 리스트 생성 -->

            <div class="btn_area clearfix">
                <div class="btn_group_center">
                    <a href="#" onclick="javascript:submitCompany();" class="btn big orange" title="선택기업으로 등록">선택기업으로 등록</a>
                </div>
            </div>

        </div><!-- //.pop_wrap -->
    </div>
</body>
</html>
