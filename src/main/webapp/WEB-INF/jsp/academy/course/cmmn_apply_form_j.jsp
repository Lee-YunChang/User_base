<%
/****************************************************
    system  : academy > 나의강의실 > 수강과정
    title   : 수강과정 목록
    summary :
    wdate   : 2015-05-19
    writer  : kim hak kyu
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%> 
	
<script type="text/javascript">

var scrBizrno= '<c:out value="${userData.BIZNO}"/>'; //사업자번호
var scrComName= '<c:out value="${userData.COMNAME}"/>'; //회사명
var scrMobile= '<c:out value="${userData.MOBILE}"/>';
var FREE_COURSE = false;

$(document).ready(function(){
});

//저장
function fnSave() {

    var frm = document.frm;

    if($('#dept_name').val() == ''){
        alert('부서를 기입하여 주세요.');
        $('#dept_name').focus();
        return false;
    }
    if($('#position_name').val() == ''){
        alert('직급을 기입하여 주세요.');
        $('#position_name').focus();
        return false;
    }
    if($("input[name='sex']:checked").val() == null || $("input[name='sex']:checked").val() == ''){
        alert('성별을 선택해 주세요.');
        $('#sex').focus();
        return false;
    }
    if($('#ses_mobile').val() ==''){
        alert('사무실전화번호를 기입하여 주세요.');
        $('#ses_mobile').focus();
        return false;
    }
    if($('#moblphon').val() ==''){
        alert('휴대전화번호를 기입하여 주세요.');
        $('#moblphon').focus();
        return false;
    }

    if($("input[name='cpi_yn']:checked").val() == null || $("input[name='cpi_yn']:checked").val() == 'n'){
        alert('약관에 동의해야 신청 가능합니다.');
        $('#cpi_yn').focus();
        return false;
    }

    if($('#applyChk').val() == 'Y'){
        alert('신청중입니다. 잠시만 기다려주세요.');
        return false;
    }


    if(confirm('신청 하시겠습니까?')){
        $('#frm').attr('method', 'post');
        $('#frm').attr('target', '_cm');
        $('#frm').attr('action',    '<c:out value="${ctx}"/>/academy/course/common/apply_exec.do');
        $('#applyChk').val('Y');

        $('#frm').submit();
    }

}

function fnList() {
    $('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclass/list.do').submit();
}

function fnApplyResult(){
    //location.href='/academy/course/common/applyResult.do';
    $('#frm').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/course/common/applyResult.do').submit();
}

function fnResult(courseno, cseqno, duplVal){
    $('#resultForm > input[name="cseqno"]').val(cseqno);
    $('#resultForm > input[name="courseno"]').val(courseno);

    $('form[name=frm]').attr('method', 'post').attr('target', '_self').attr('action', '<c:out value="${ctx}"/>/academy/myclass/myclassList.do').submit();
}


function fnReturnPage(pmode){
    if('on' == pmode) {
        location.href='/academy/course/onMain.do';
    } else if('off' == pmode){
        location.href='/academy/course/offMain.do';
    }

}

function fnCancel() {

    if('E' == $('#eduMode').val())  {

    } else if ('J' == $('#eduMode').val()) {
        localtion.href='/academy/course';
    }
}
</script>

<div class="contents-wrap">

        <div class="sub-wrap">
        <!-- 왼쪽 메뉴 영역 -->
        <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>
        <!-- // 왼쪽 메뉴 영역 -->
        
            <!-- 페이지 상단 타이틀 영역 -->
            <div id="Sub_Header" class="menu2">
                <div class="nav">
                    <img src="/academy/images/ico_home.png" alt="Home" />
                    <img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />
                        <c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA00'}">온라인교육</c:if>
                        <c:if test="${REQUEST_DATA.mtCtypeCode eq 'DAAA01'}">집합교육</c:if>
                    <img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />과정소개 및 일정
                </div>
                <h3>과정소개 및 일정</h3>
            </div>
            <!-- // 페이지 상단 타이틀 영역 -->

            <form name="frm" id="frm" action="/academy/course/common/apply_form.do" method="post">
            <input type="hidden" name="goodname" value="<c:out value="${rowData.SEQ_TITLE}"/>"/>
            <input type="hidden" name="price" value="<c:out value="${rowData.PRICE}"/>"/>
            <input type="hidden" name="subcmd" id="subcmd"/>
            <input type="hidden" name="cseqno" id="cseqno"  value="<c:out value="${rowData.CSEQNO}"/>"/>
            <input type="hidden" name="courseno" id="courseno"  value="<c:out value="${rowData.COURSENO}"/>"/>
            <input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
            <input type="hidden" name="pmusrcd" id="pmusrcd" value="<c:out value="${REQUEST_DATA.SES_MOBILE}"/>"/>
            <input type="hidden" name="paymentInputname" id="paymentInputname" value="<c:out value="${REQUEST_DATA.SES_USERNAME}"/>"/>
            <input type="hidden" name="applyChk" id="applyChk" value="N"/><!-- 과정 중복수강방지 -->
            <input type="hidden" name="eduMode" id="eduMode" value="<c:out value="${REQUEST_DATA.eduMode}"/>"/><!-- 신청폼 left메뉴 제어용 집합: J 온라인교육 : E -->
            <input type="hidden" name="mtPmBillCode" id="mtPmBillCode2" value="<%=SangsProperties.getProperty("Globals.mtCode_MT_PM_BILL_APPLY") %>" />
            <input type="hidden" name="mtPmPayCode" id="mtPmPayCode3" value="SGBANK" />

            <div id="Contents" tabindex="-1">

                <h5>과정신청</h5>
                <div class="paragraph">
                    <p class="dot">대상자선정을 위해 모든 항목은 빠짐없이 기재하여 주십시오.</p>
                    <p class="dot">교육대상자 최종확정 및 교육진행 세부사항은 마이페이지 및 공지사항에서 확인할 수 있습니다.</p>
                    <p class="dot">교육 참가 신청서를 허위로 기재하는 경우 교육신청이 취소 될 수 있습니다.</p>
                </div>
                <div class="table_box">
                    <table cellpadding="0" cellspacing="0" class="col_type">
                        <caption>과정신청 : 상상스토리 교육시스템 나의강의실의 과정신청입니다.</caption>
                        <colgroup>
                            <col width="150px"/>
                            <col width="" />
                            <col width="150px"/>
                            <col width="" />
                        </colgroup>
                        <tbody>
							<tr>
                                <th>과정명</th>
                                <td colspan="3"><strong class="t_orange"><c:out value="${rowData.SEQ_TITLE}"/></strong></td>
                            </tr>
                            <tr>
                                <th>수강료</th>
                                <td colspan="3">
                                <c:choose>
                                    <c:when test="${not empty rowData.CSEQNO && rowData.CSEQNO > 0 && rowData.PRICE == 0}">
                                        <strong>무료과정</strong><br />
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber value="${rowData.PRICE}" type="number" groupingUsed="true" />원
                                    </c:otherwise>
                                </c:choose>

                                </td>
                            </tr>
                            <tr>
                                <th>기관명</th>
                                <td><c:out value="${userData.COMNAME}"/></td>
                                <th>사업자번호</th>
                                <td><c:out value="${userData.BIZNO}" /></td>
                            </tr>
                            <tr>
                                <th>사업장주소</th>
                                <td colspan="3"><c:out value="${userData.ADDR01}" /> <c:out value="${userData.ADDR02}" /></td>
                            </tr>
                            <tr>
                                <th>부서명</th>
                                <td><input type="text" id="dept_name" name="dept_name" value="${userData.COM_DEPT_NAME}" title="부서명"/></td>
                                <th>직급</th>
                                <td><input type="text" id="position_name" name="position_name" value="${userData.COM_POSITION_NAME}" title="직급"/></td>
                            </tr>
                            <tr>
                                <th>성명</th>
                                <td><c:out value="${userData.USERNAME}"/></td>
                                <th>성별</th>
                                <td><input type="radio" name="sex" id="sex" value="M" title="남자"/> 남&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="F" title="여자"/> 여</td>
                            </tr>
                            <tr>
                                <th>사무실전화번호</th>
                                <td><input type="text" id="ses_mobile" name="ses_mobile" value="<c:out value="${userData.HYPEN_TEL}"/>" title="사무실 전화 번호"/></td>
                                <th>휴대전화번호</th>
                                <td><input type="text" id="moblphon" name="moblphon" value="<c:out value="${userData.HYPEN_MOBILE}"/>" title="휴대 전화 번호"/></td>
                            </tr>
                            <tr>
                                <th>이메일주소</th>
                                <td colspan="3"><c:out value="${REQUEST_DATA.SES_EMAIL}"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <h5>개인정보 수집&middot;이용 동의서</h5>
                <div class="shadow_box">
                    <div class="bg_gray">
                        <textarea title="개인정보 수집 및 이용 동의서" rows="13" cols="80" class="info_text" style="width: 750px; overflow-y:scroll" readonly="readonly">환경부 상상스토리에서는 교육에 참여하는 자에 대한 개인정보를 수집‧이용하고자 하오니, 다음의 사항에 대하여 충분히 읽어보신 후, 동의 여부를 체크하여 주시기 바랍니다.

▶ 개인정보 수집 및 이용 동의
1. 수집·이용하려는 개인정보의 항목
- 필수사항 : 성명, 소속(회사 및 부서명), 직급, 생년월일, 성별, 사무실 전화번호, 휴대전화번호, 전자우편 주소
- 선택사항 : -

2. 개인정보의 수집·이용 목적
- 교육과정 운영

3. 개인정보 이용기간 및 보유기간
- 교육종료 후 3년

※ 관련근거: 공공기록물 관리에 관한법률, 환경부 개인정보 보호지침

※ 귀하께서는 개인정보 제공 및 활용에 거부할 권리가 있습니다.
 ○ 거부에 따른 불이익 : 위 제공사항은 교육 진행에 반드시 필요한 사항으로 거부하실 경우 교육 참여가 불가함을 알려드립니다.


◈ 수집한 개인정보는 정보주체의 동의 없이 수집한 목적 외로 사용하거나 제3자에게 제공되지 않습니다.
◈ 만 14세 미만 아동인 경우 반드시 법적대리인의 동의가 필요합니다.


본인은 위와 같이 “개인정보 수집․이용 제공 동의서” 내용을 명확히 이해하였으며, 이에 동의합니다.
                        </textarea>
                    </div>
                </div>
                <div class="check_agree">
                    <input type="radio" name="cpi_yn" id="cpi_yn" value="y" title="동의함"/> 동의함&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="cpi_yn" value="n" title="동의하지않음"/> 동의하지 않음
                </div>

                <div class="btn_area clearfix">
                    <div class="btn_group_center">
                        <a href="#" onclick="javascript:fnSave();return false;" class="btn big orange" title="신청">신청</a>
                        <a href="#" onclick="javascript:history.back(); return false;" class="btn big gray" title="취소">취소</a>
                    </div>
                </div>

            </div><!-- // Contents -->

            </form>
        </div>
</div>

<!-- 풋터 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->