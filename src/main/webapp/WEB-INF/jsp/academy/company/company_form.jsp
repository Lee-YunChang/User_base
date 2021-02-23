<%
/****************************************************
    system	: academy > 나의강의실 > 수강과정
    title	: 수강과정 목록
    summary	:
    wdate	: 2015-05-20
    writer	: kim hak kyu
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 

<script type="text/javascript">
$(document).ready(function(){

    onlyNum2('tel2');
    onlyNum2('tel3');
    //$( '#comRegDate' ).datepicker(dateFormat);

    //데이터 널체크
    $(".input_chk").each(function() {
        if($(this).val() == ''){
            $(this).addClass("null_chk");
        }
    }).keyup(function() {
        $(this).removeClass("null_chk");
    }).keypress(function() {
        $(this).removeClass("null_chk");
    }).change(function() {
        $(this).removeClass("null_chk");
    });


    var mtOrgCode = "<c:out value="${companyInfo.MT_ORG_CODE}"/>"


    if("" == mtOrgCode){
        $(".orgText").html("");
    }else if("OG0001" == mtOrgCode){
        $(".orgText").html("관할지역 : 서울, 경기(시흥방재센터 관할지역 제외)");
    }else if("OG0002" == mtOrgCode){
        $(".orgText").html("관할지역 : 부산, 경남(남해군·하동군, 울산방재센터 관할지역 제외)");
    }else if("OG0003" == mtOrgCode){
        $(".orgText").html("광주, 제주, 전남(여수방재센터 관할지역 제외)");
    }else if("OG0004" == mtOrgCode){
        $(".orgText").html("대전, 세종, 충남(서산방재센터 관할지역 제외), 충북(원주청 관할지역 제외)");
    }else if("OG0005" == mtOrgCode){
        $(".orgText").html("전북(익산방재센터 관할지역 제외)");
    }else if("OG0006" == mtOrgCode){
        $(".orgText").html("대구, 경북(구미방재센터 관할지역 제외)");
    }else if("OG0007" == mtOrgCode){
        $(".orgText").html("강원, 충북(충주시·제천시·음성군·단양군·괴산군)");
    }else if("OG0008" == mtOrgCode){
        $(".orgText").html("인천, 경기(시흥시·안산시)");
    }else if("OG0009" == mtOrgCode){
        $(".orgText").html("울산, 경남(양산시)");
    }else if("OG0010" == mtOrgCode){
        $(".orgText").html("전남(여수시·광양시·순천시), 경남(남해군·하동군)");
    }else if("OG0011" == mtOrgCode){
        $(".orgText").html("충남(아산시·서산시·당진시·서천군·청양군·홍성군·예산군·태안군·보령군)");
    }else if("OG0012" == mtOrgCode){
        $(".orgText").html("전북(군산시·익산시)");
    }else if("OG0013" == mtOrgCode){
        $(".orgText").html("</br>경북(김천시·안동시·구미시·영주시·상주시·문경시·군위군·의성군·성주군·칠곡군·예천군)");
    }


    $("#mtOrgCode").change(function(){
        var orgCode = $("#mtOrgCode option:selected").val();

        /*
        OG0001 한강유역 환경청
        OG0002 낙동강 유역 환경청
        OG0003 영산강 유역 환경청
        OG0004 금강유역 환경청
        OG0005 새만금 지방 환경청
        OG0006 대구지방 환경청
        OG0007 원주지방 환경청
        OG0008 시흥 화학재난 합동방재센터
        OG00009 울산 화학재난 합동방재센터
        OG00010 여수 화학재난 합동방재센터
        OG00011 서산 화학재난 합동방재센터
        OG00012 익산 화학재난 합동방재센터
        OG00013 구미 화학재난 합동방재센터

        */
        if("" == orgCode){
            $(".orgText").html("");
        }else if("OG0001" == orgCode){
            $(".orgText").html("관할지역 : 서울, 경기(시흥방재센터 관할지역 제외)");
        }else if("OG0002" == orgCode){
            $(".orgText").html("관할지역 : 부산, 경남(남해군·하동군, 울산방재센터 관할지역 제외)");
        }else if("OG0003" == orgCode){
            $(".orgText").html("광주, 제주, 전남(여수방재센터 관할지역 제외)");
        }else if("OG0004" == orgCode){
            $(".orgText").html("대전, 세종, 충남(서산방재센터 관할지역 제외), 충북(원주청 관할지역 제외)");
        }else if("OG0005" == orgCode){
            $(".orgText").html("전북(익산방재센터 관할지역 제외)");
        }else if("OG0006" == orgCode){
            $(".orgText").html("대구, 경북(구미방재센터 관할지역 제외)");
        }else if("OG0007" == orgCode){
            $(".orgText").html("강원, 충북(충주시·제천시·음성군·단양군·괴산군)");
        }else if("OG0008" == orgCode){
            $(".orgText").html("인천, 경기(시흥시·안산시)");
        }else if("OG0009" == orgCode){
            $(".orgText").html("울산, 경남(양산시)");
        }else if("OG0010" == orgCode){
            $(".orgText").html("전남(여수시·광양시·순천시), 경남(남해군·하동군)");
        }else if("OG0011" == orgCode){
            $(".orgText").html("충남(아산시·서산시·당진시·서천군·청양군·홍성군·예산군·태안군·보령군)");
        }else if("OG0012" == orgCode){
            $(".orgText").html("전북(군산시·익산시)");
        }else if("OG0013" == orgCode){
            $(".orgText").html("</br>경북(김천시·안동시·구미시·영주시·상주시·문경시·군위군·의성군·성주군·칠곡군·예천군)");
        }

    });

});


//버튼 달력 출력
/* function fnCalendar(){
    $('#comRegDate').focus();
} */
//저장
function fnSave() {
    //유효성체크

    //회사명
    if('' == $('#comName').val()){
        alert('회사명을 입력해 주세요.');
        return false;
    }
    //대표자명
    if('' == $('#ceo').val()){
        alert('대표자명을 입력해 주세요.');
        return false;
    }
    //우편번호
    if('' == $('#zip').val()){
        alert('우편번호를 입력해 주세요.');
        return false;
    }
    /* if('' == $('#zip1').val()){
        alert('우편번호를 입력해 주세요.');
        return false;
    }
    //우편번호
    if('' == $('#zip2').val()){
        alert('우편번호를 입력해 주세요.');
        return false;
    } */
    //세부주소
    if('' == $('#addr01').val()){
        alert('세부주소 입력해 주세요.');
        return false;
    }
    //설립일
    /* if('' == $('#comRegDate').val()){
        alert('설립일을 입력해 주세요.');
        return false;
    } */
    //전화번호
    if('' == $('#tel1').val()){
        alert('전화번호를 입력해 주세요.');
        return false;
    }
    //전화번호
    if('' == $('#tel2').val()){
        alert('전화번호를 입력해 주세요.');
        return false;
    }
    //전화번호
    if('' == $('#tel3').val()){
        alert('전화번호를 입력해 주세요.');
        return false;
    }
    //회사명
    if('' == $('#comName').val()){
        alert('회사명을 입력해 주세요.');
        return false;
    }
    //종목
    if('' == $('#upjongNm').val()){
        alert('종목을 입력해 주세요.');
        return false;
    }
    //업태
    if('' == $('#upteaNm').val()){
        alert('업태를 입력해 주세요.');
        return false;
    }
    //관할기관
    if('' == $('#mtOrgCode').val()) {
        alert('관할기관을 입력해 주세요.');
        return false;
    }

    if(confirm('수정 하시겠습니까?')){
        $('#tel').val($('#tel1').val() + '-'+ $('#tel2').val() +'-' + $('#tel3').val());
        //$('#zip').val($('#zip1').val() + $('#zip2').val());
        $('#frm').submit();

    }

}

//우편번호 팝업창
function fnPostPop(){

    window.open('/academy/common/common/post.do','postPop','width=800,height=600, scrollbars=YES');
}

//우편번호 결과 콜백
function fnZipCodePopupCallBack(data){
    $("#zip").removeClass("null_chk");
    $("#addr01").removeClass("null_chk");
    $("#zip").val(data.zip_code);
    $('#addr01').val(data.adres);
    $('#addr02').focus();
}

//기업담당자 변경 팝업 호출
function comGradeChn() {

    window.open("/academy/myclass/comGradeChn.do","comGradeChnPop", "width=700,height=500,scrollbars=yes, resizeable=N' ");

}

//기업 담당자 변경후 로그아웃 진행
function logoutExec(){
    $("#frm").attr("action", "/academy/common/logout.do");
    $("#frm").submit();

}
</script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

    // 우편번호 관련
    function fnExecPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
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
                    <img src="/academy/images/ico_home.png" alt="Home" /><img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />마이페이지<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />기업정보<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />기업정보관리
                </div>
                <h3>기업정보관리</h3>
                <p>나의 수강정보를 한눈에 확인할 수 있습니다.</p>
            </div>
            <!-- // 페이지 상단 타이틀 영역 -->
            <form name="frm" id="frm" action="/academy/myclass/companyExec.do" method="post">
            <input type="hidden" name="comNo" id="comNo" value="<c:out value="${companyInfo.COMNO}"/>"/>
            <input type="hidden" name="bizNo" id="bizNo" value="<c:out value="${companyInfo.BIZNO}"/>"/>
            <input type="hidden" name="tel" id="tel" value="<c:out value="${companyInfo.TEL}"/>"/>
            <%-- <input type="hidden" name="zip" id="zip" value="<c:out value="${companyInfo.ZIP}"/>"/> --%>

            <div id="Contents" tabindex="-1">
                <div class="table_box">
                    <table cellpadding="0" cellspacing="0" class="col_type">
                        <caption>기업정보 수정 : 상상스토리 교육시스템 마이페이지의 기업정보 수정입니다.</caption>
                        <colgroup>
                            <col width="150px"/>
                            <col width="" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label for="comName"><span class="star">*</span>회사명</label></th>
                                <td>
                                    <input type="text" id="comName" name="comName" style="width: 300px;" value="<c:out value="${companyInfo.COMNAME}"/>" class="input_chk" title="<c:out value="${companyInfo.COMNAME}"/>"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="star">*</span>개인/법인</th>
                                <td>
                                    <input type="radio" id="company1" name="comRegGb" value="P" <c:if test="${companyInfo.COM_REG_GB eq 'P' || companyInfo.COM_REG_GB eq null }">checked</c:if> title="개인"/><label for="company1">개인</label>
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="radio" id="company2" name="comRegGb" value="C" <c:if test="${companyInfo.COM_REG_GB eq 'C' }">checked</c:if> title="법인" /><label for="company2">법인</label>
                                </td>
                            </tr>
                            <tr>
                                <th>사업자번호</th>
                                <td>
                                    <c:out value="${companyInfo.BIZNO}"/>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="ceo"><span class="star">*</span>대표자명</label></th>
                                <td>
                                    <input type="text" id="ceo" name="ceo" style="width: 300px;" value="<c:out value="${companyInfo.CEO}"/>" class="input_chk" title="대표자명"/>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="zip1"><span class="star">*</span>사업장주소</label></th>
                                <td>
                                    <c:if test="${fn:length(companyInfo.ZIP)> 5}">
                                        <c:set var="zip1" value="${fn:substring(companyInfo.ZIP,0,3)}"/>
                                        <c:set var="zip2" value="${fn:substring(companyInfo.ZIP,3,6)}"/>
                                        <input type="text" id="zip" name="zip" value="<c:out value="${zip1}"/>-<c:out value="${zip2}"/>" placeholder="우편번호" title="우편번호" class="input_chk">
                                    </c:if>
                                    <c:if test="${fn:length(companyInfo.ZIP) < 6}">
                                        <c:set var="zipcode" value="${companyInfo.ZIP}"/>
                                        <input type="text" id="zip" name="zip" value="<c:out value="${zipcode}"/>" placeholder="우편번호" title="새우편번호" class="input_chk">
                                    </c:if>
                                    <a href="#" onclick="javascript:fnPostPop();return false;"class="btn gray" title="우편번호 찾기 창으로 안내합니다.">우편번호 찾기</a>  <!-- fnExecPostcode() -->
                                    <br/>
                                    <input type="text" id="addr01" name="addr01" title="사업장주소 앞부분" placeholder="사업장주소 앞부분" style="width: 379px;" value="<c:out value="${companyInfo.ADDR01}"/>" class="input_chk">
                                    <input type="text" id="addr02" name="addr02" title="사업장주소 나머지부분" style="width:180px;" value="<c:out value="${companyInfo.ADDR02}"/>" class="input_chk"/>

                                </td>
                            </tr>
                            <%-- <tr>
                                <th><label for="comRegDate"><span class="star">*</span>설립일</label></th>
                                <td>
                                    <input type="text" id="comRegDate"name="comRegDate" style="width: 135px;" class="ad_calendar input_chk"  value="<c:out value="${companyInfo.COM_REG_DATE}"/>"/>
                                    <a href="#" id="comRegDateBtn" onclick="javascript:fnCalendar(); return false;" class="btn gray"><img src="/academy/images/ico_calendar.png" alt="날짜선택"/></a>
                                </td>
                            </tr> --%>
                            <tr>
                                <th><label for="tel1"><span class="star">*</span>사무실전화번호</label></th>
                                <td>
                                    <select id="tel1" name="tel1" style="width: 60px;" class="input_chk">
                                        <option value="02"   <c:if test="${companyInfo.tel1 eq '02'}">selected</c:if>>02</option>
                                        <option value="031" <c:if test="${companyInfo.tel1 eq '031'}">selected</c:if>>031</option>
                                        <option value="032" <c:if test="${companyInfo.tel1 eq '032'}">selected</c:if>>032</option>
                                        <option value="033" <c:if test="${companyInfo.tel1 eq '033'}">selected</c:if>>033</option>
                                        <option value="041" <c:if test="${companyInfo.tel1 eq '041'}">selected</c:if>>041</option>
                                        <option value="042" <c:if test="${companyInfo.tel1 eq '042'}">selected</c:if>>042</option>
                                        <option value="043" <c:if test="${companyInfo.tel1 eq '043'}">selected</c:if>>043</option>
                                        <option value="044" <c:if test="${companyInfo.tel1 eq '044'}">selected</c:if>>044</option>
                                        <option value="051" <c:if test="${companyInfo.tel1 eq '051'}">selected</c:if>>051</option>
                                        <option value="052" <c:if test="${companyInfo.tel1 eq '052'}">selected</c:if>>052</option>
                                        <option value="053" <c:if test="${companyInfo.tel1 eq '053'}">selected</c:if>>053</option>
                                        <option value="054" <c:if test="${companyInfo.tel1 eq '054'}">selected</c:if>>054</option>
                                        <option value="055" <c:if test="${companyInfo.tel1 eq '055'}">selected</c:if>>055</option>
                                        <option value="061" <c:if test="${companyInfo.tel1 eq '061'}">selected</c:if>>061</option>
                                        <option value="062" <c:if test="${companyInfo.tel1 eq '062'}">selected</c:if>>062</option>
                                        <option value="063" <c:if test="${companyInfo.tel1 eq '063'}">selected</c:if>>063</option>
                                        <option value="064" <c:if test="${companyInfo.tel1 eq '064'}">selected</c:if>>064</option>
                                        <option value="070" <c:if test="${companyInfo.tel1 eq '070'}">selected</c:if>>070</option>
                                    </select>
                                    - <input type="text" id="tel2" title="tel2" name="tel2" value="<c:out value="${companyInfo.tel2}"/>" maxlength="4" title="전화번호 가운데자리" style="width: 60px;" class="input_chk"/>
                                    - <input type="text" id="tel3" title="tel3" name="tel3" value="<c:out value="${companyInfo.tel3}"/>" maxlength="4" title="전화번호 끝자리" style="width: 60px;" class="input_chk"/>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="upteaNm"><span class="star">*</span>업태</label></th>
                                <td>
                                    <input type="text" id="upteaNm" name="upteaNm" style="width: 300px;" value="<c:out value="${companyInfo.UPTEA_NM}"/>" class="input_chk" title="업태"/>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="upjongNm"><span class="star">*</span>종목</label></th>
                                <td>
                                    <input type="text" id="upjongNm" name="upjongNm" style="width: 300px;" value="<c:out value="${companyInfo.UPJONG_NM}"/>" class="input_chk" title="종목"/>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="mtOrgCode"><span class="star">*</span>관할기관</label></th>
                                <td>
                                    <select id="mtOrgCode" name="mtOrgCode" title="관할기관" class="input_chk">
                                        <option value="">선택</option>
                                        <c:out value="${cfn:getComboOptions2(companyOrgList, companyInfo.MT_ORG_CODE)}"  escapeXml="false"/>
                                    </select>
                                    <span class="t_blue orgText">
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th>기업담당자</th><td><c:out value="${userInfo.USERNAME}"/>(<c:out value="${userInfo.USERID}"/>) <a href="#" onclick="comGradeChn(); return false;" class="btn small gray" title="변경">변경</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="btn_area clearfix">
                    <div class="btn_group_center">
                        <a href="#" onclick="fnSave(); return false;" class="btn big orange" title="기업정보수정">기업정보 수정</a>
                        <a href="#" class="btn big gray" title="취소">취소</a>
                    </div>
                </div>

            </div><!-- // Contents -->

            </form>

        </div>
    </div>
    <!-- footer -->

    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>

