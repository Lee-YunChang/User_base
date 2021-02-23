<%
/****************************************************
    system	: academy > 기업회원관리 > 기업담당자 변경 팝업
    title	: 수강과정 목록
    summary	:
    wdate	: 2015-05-21
    writer	: kim hak kyu
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ taglib uri = "/WEB-INF/tlds/academy-paging-taglib.tld" prefix="paging" %>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%>

<script type="text/javascript">

$(document).ready(function(){
    if(e.keyCode == 13){
        fnList();
    }
});

//페이지 이동
function move_page(cPage){
    $('#cPage').val(cPage);
    $('form[name=frm]').attr('action', '<c:out value="${ctx}"/>/academy/myclass/comGradeChn.do').submit();
}


function fnList(){
    $('#cPage').val(1);
    $('#frm').submit();
}


//기업담당자 선정 AJAX;
function comMngrSubmit(userNo){

    //targetUserNo : 담당자 선정대상 userNo
    //nowUserNo : 현재 기업담당자 userNo

    var nowUserNo = "<c:out value="${REQUEST_DATA.SES_USERNO}"/>";
    var targetUserNo = userNo;
    var comNo = "<c:out value="${REQUEST_DATA.comNo}"/>";

    if(confirm("기업담당자 변경을 하시겠습니까? (즉시변경됩니다)")){
        $.ajax({
            url: '/academy/myclass/comMngrChnAjax.do',
            type: 'POST',
            data:{
                nowUserNo : nowUserNo
                , targetUserNo : targetUserNo
                , comNo : comNo
                 },
            dataType : 'json',
            success: function(data){
                if(data == 1){
                    alert('저장 되었습니다.');
                    callbackComMngrSubmit();
                } else{
                    alert('변경중 오류가 발생하였습니다.');
                }
            },
            error: function(){
                alert ('알 수 없는 에러발생.!!');
            }
        });

    }

}

//기업담당자 변경 처리후 작업
function callbackComMngrSubmit(){

    //로그아웃 처리

    //부모창 로그아웃 페이지로 이동
    self.parent.opener.window.logoutExec();
    window.close();
}


</script>

<body>
    <div id="popup">
        <div class="pop_header clearfix">
            <h1>기업 담당자 변경</h1>
            <a href="#" title="닫기"><img src="/academy/images/ico_pop_close.png" alt="닫기" /></a>
        </div>




        <div class="pop_wrap">

            <div class="shadow_box">
                <div class="yellow_box">
                     <p class="t_red">기업담당자 변경즉시 변경하신 아이디로 권한이 부여되며, 담당자 변경 시 로그아웃됩니다.</p>
                </div>
            </div>

            <form name="frm" id="frm" action="/academy/myclass/comGradeChn.do" method="post">
                <input type="hidden" id="comNo" name="comNo"  value="<c:out value="${REQUEST_DATA.comNo}"/>">
                <input type="hidden" id="cPage" name="cPage"  value="<c:out value="${REQUEST_DATA.cPage}"/>">

            <!-- 단체등록(엑셀) 폼 -->

            <div class="table_box">
                    <table cellpadding="0" cellspacing="0" class="col_type">
                        <caption>종사자 검색 : 상상스토리 교육시스템 온라인교육명단관리의 종사자 검색입니다.</caption>
                        <colgroup>
                            <col width="50px"/>
                            <col width="182px" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="no_left"><label for="searchMode">검색어</label></th>
                                <td>
                                    <select id="searchMode" name="searchMode" style="width:90px;">
                                        <option value="">전체</option>
                                        <option value="userName" <c:if test="${REQUEST_DATA.searchMode eq 'userName'}">selected</c:if>>성명</option>
                                        <option value="userId" <c:if test="${REQUEST_DATA.searchMode eq 'userId'}">selected</c:if>>아이디</option>
                                    </select>
                                    <input type="text" id="searchWord" name="searchWord" title="검색어" style="width: 150px;" value="<c:out value="${REQUEST_DATA.searchWord}"/>" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="btn_area clearfix" style="margin-bottom: 20px;">
                    <div class="btn_group_center">
                        <a href="#" onclick="javascript:fnList();return false;" class="btn big brown" title="기업종사자조회">조회</a>
                    </div>
                </div>
                </form>

                <div class="table_box">
                    <table cellpadding="0" cellspacing="0" class="row_type">
                        <caption>종사자 등록 : 상상스토리 교육시스템 기업회원관리의 종사자 등록입니다.</caption>
                        <colgroup>
                            <col width="10px"/>
                            <col width="50px"/>
                            <col width="50px"/>
                            <col width="50px"/>
                            <col width="50px"/>
                            <col width="50px"/>
                            <col width="50px"/>
                            <col width="50px"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>아이디</th>
                                <th>이름</th>
                                <th>연락처</th>
                                <th>부서</th>
                                <th>직급</th>
                                <th>가입일</th>
                                <th>기업담당자 선정</th>

                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="result" items="${resultList}" varStatus="status">
                            <tr>
                                <td><c:out value="${result.RNUM}"/></td>
                                <td><c:out value="${result.UNITY_ID}"/></td>
                                <td><c:out value="${result.MBERNM}"/></td>
                                <td><c:out value="${result.MOBLPHON}"/></td>
                                <td><c:out value="${result.DEPT_NAME}"/></td>
                                <td><c:out value="${result.POSITION_NAME}"/></td>
                                <td><c:out value="${result.RGSDE}" escapeXml="false"/></td>
                                <td><a href="#" onclick="comMngrSubmit('<c:out value="${result.USERNO}"/>');" class="btn small gray" title="담당자변경">담당자 변경</a></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- 페이징, 버튼 영역 -->

                <div class="bbs_control">
                    <c:if test="${not empty resultList}">
                        <div class="paging_wrap">
                            <paging:page cpage="${REQUEST_DATA.cPage}" total="${resultList[0].TOTALCNT}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page"/>
                        </div>
                    </c:if>
                <!-- // 페이징, 버튼 영역 -->

                </div>


                <div class="btn_area clearfix">
                    <div class="btn_group_center">
                        <a href="#" onclick="fnForm();" class="btn big orange" title="등록">등록</a>
                        <a href="#" class="btn big gray" title="취소">취소</a>
                    </div>
                </div>

        </div><!-- //.pop_wrap -->
    </div>

    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>

</body>
