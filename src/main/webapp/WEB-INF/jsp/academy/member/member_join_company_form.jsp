<%
/****************************************************
    system	: academy > 회원 > 회원가입
    title	: 회원가입
    summary	:
    wdate	: 2015-03-02
    writer	: kim hak gyu
*****************************************************/
%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">

$(document).ready(function(){

    if('<c:out value="${msg}"/>' != ''){
        alert('<c:out value="${msg}"/>');
    }

    onlyNum2('bizNo1');
    onlyNum2('bizNo2');
    onlyNum2('bizNo3');

    onlyNum2('zip');
    //onlyNum2('postCode1');
    //onlyNum2('postCode2');

    onlyNum2('tel2');
    onlyNum2('tel3');

    $('#mberGrade1, #mberGrade2').click(function(){

            if($('input[name="mberGrade"]:radio:checked').val() == 'M') {

                $('#companyMngr').css('display','block');
                $('#companyGradeCode').val('M');//유해화학물질관리자 회원으로 등록

            }else{

                $('#companyMngr').css('display','none');
                $('#companyGradeCode').val('P'); // 기업회원(종사자)로 등록
            }
    });

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

    //신규기업일 경우에만 작동
    if('Y' == $('#comModifyYn').val() ){
        $('#comRegDate').focus();
    }

} */

//2단계_기업정보 저장
function fnSave() {

    if($('#multipleYn').val() == 'Y'){
        alert('등록중입니다. 잠시만 기다려주세요.');
        return false;
    }

    /* if($('#mngrYn').val() == 'Y'){
        $('#mberGrade2').attr('checked', true);
        $('#companyGradeCode').val('M');
    } */
    if($('#mngrYn').val() == 'N'){
        // 이미 기업담당자가 있는경우
        $('#mberGrade1').attr('checked', true);
        $('#companyGradeCode').val('P');
    }
    else {
        $('#companyGradeCode').val('M');
    }
    var mberGradeChk = $('input:radio[name="mberGrade"]:checked').val();
    if( mberGradeChk == 'P' && $("#companyNewYn").val() == 'Y'){
        alert("등록되지 않은 사업장 입니다.\n사업장을 등록하시기 위해서는 유해화학물질관리자\n(기업담당자)가 먼저 가입해야 합니다.");
        return;
    }

    //종사자등록일경우 유효성체크 패스
    if($('#passCheck').val() == 'N'){

        //유효성 체크 시작
        //회사명
        if($('#comName').val() == ''){
            alert('회사명을 입력해 주세요.');
            $('#comName').focus();
            return false;
        }

        //사업자번호
        if($('#bizNo1').val() == '' || $('#bizNo2').val() == '' || $('#bizNo3').val() == ''){
            alert('사업자번호를 입력해 주세요.');
            $('#bizNo1').focus();
            return false;
        }

        //대표자명
        if($('#ceo').val() == ''){
            alert('대표자명을 입력해 주세요.');
            $('#ceo').focus();
            return false;
        }
        //사업장주소
        if($('#zip').val() == ''){
            alert('사업장주소를 입력해 주세요.');
            $('#zip').focus();
            return false;
        }
        if($('#addr1').val() == ''){
            alert('사업장주소를 입력해 주세요.');
            $('#addr1').focus();
            return false;
        }

        //설립일
        /* if($('#comRegDate').val() == ''){
            alert('설립일을 입력해 주세요.');
            $('#comRegDate').focus();
            return false;
        } */

        //전화번호
        if($('#tel1').val() == '' || $('#tel2').val() == '' || $('#tel3').val() == ''){
            alert('전화번호를 입력해 주세요.');
            $('#tel1').focus();
            return false;
        }

        //업태
        if($('#upteaNm').val() == ''){
            alert('업태를 입력해 주세요.');
            $('#upteaNm').focus();
            return false;
        }


        //종목
        if($('#upjongNm').val() == ''){
            alert('종목을 입력해 주세요.');
            $('#upjongNm').focus();
            return false;
        }

        //관할기관
        if($('#mtOrgCode').val() == ''){
            alert('관할기관을 입력해 주세요.');
            $('#mtOrgCode').focus();
            return false;
        }

    }
    //등록 실행
    if(confirm('해당 기업소속으로 가입 하시겠습니까?')){
        $('#multipleYn').val('Y');
        //$('#zip').val($('#postCode1').val()+$('#postCode2').val());
        $('#BIZNO').val($('#bizNo1').val()+'-'+$('#bizNo2').val()+'-'+$('#bizNo3').val());
        $('#tel').val($('#tel1').val()+'-'+$('#tel2').val()+'-'+$('#tel3').val());
        $('#frm').submit();

    }

}

//우편번호 검색팝업
function fnPostPop(){

    window.open('/academy/common/common/postJoin.do','postPop','width=600,height=450, scrollbars=YES');
}

//우편번호 결과 콜백
function fnZipCodePopupCallBack(data){
    $("#zip").val(data.zip_code);
    $('#addr01').val(data.adres);
    $('#addr02').focus();
}

//기업정보 검색 (ajax)
function onSearchCompany(){

    if(jQuery('input:radio[name="mberGrade"]:checked').val() ==null){
        alert('회원분류를 선택해 주세요.');
        return false;
    }

    if( $('#comName').val()=='' || $('#bizNo1').val() == '' || $('#bizNo2').val() == '' || $('#bizNo3').val() == '') {
        alert('회사명과 사업자번호를 입력해 주세요.');
        return false;
    } else {

        $('#BIZNO').val($('#bizNo1').val()+'-'+$('#bizNo2').val()+'-'+$('#bizNo3').val());

        ajaxSubmit('/academy/user/memberSearchCompany.do',
                {  bizNo : $('#bizNo1').val()+'-'+$('#bizNo2').val()+'-'+$('#bizNo3').val()
                    , comName : $('#comName').val()
                    , comno : $('#COMNO').val()
                }, 'json',
                eval('resultSearchCompany')
        );

    }

}

function resultSearchCompany(data){
    var values = data.resultList;
    $("#companyNewYn").val('N'); // 신규기업등록 여부

    if(data[0].COMNAME != null && data[0].COMNAME != undefined) {
        $.each(data, function( index, value ) {
            //alert("순번 = " +index+  " 값 = " + value.COMNAME);

                //1개 기업일경우
                var companyCnt = value.companyCnt;
                if(value.resultCnt < 2){
                    alert('등록되어 있는 사업장 입니다.\n개인정보 입력 후 회원가입이 완료됩니다.');

                    $('#companyViewHelp').css('display','block');

                    $('#companyGradeCode').val('P'); // 기업회원(종사자)로 등록
                    $('#seachYn').val('Y');
                    $('#COMNO').val(value.COMNO);

                    $('.compInfo').css('display','block');
                    $('#comModifyYn').val('N');

                    //사업장 정보 세팅
                    $('.comName').html(value.COMNAME);
                    $('#comNm').val(value.COMNAME);
                    $('.bizNo').html(value.BIZNO);

                    var zip = value.ZIP;
                    if(zip.length > 5){
                        zip = value.ZIP1 + "-" + value.ZIP2;
                    }
                    $('#zip').val(zip);
                    $('#addr01').val(value.ADDR01);
                    $('#addr02').val(value.ADDR02);
                    $('#ceo').val(value.CEO);

                    $('#tel1').val(value.TEL1);
                    $('#tel2').val(value.TEL2);
                    $('#tel3').val(value.TEL3);

                    if(value.COM_REG_GB == 'P'){
                        $('input[id="comRegGb1"]').attr('checked', true);
                    } else if(value.COM_REG_GB == 'C'){
                        $('input[id="comRegGb2"]').attr('checked', true);
                    }
                    $('#comRegGb1').attr('disabled', true);
                    $('#comRegGb2').attr('disabled', true);
                    $('#ceo').attr('readonly', true);

                    $('#searchPostCode').attr('disabled', true);
                    //$('#postCode1').attr('readonly', true);
                    //$('#postCode2').attr('readonly', true);
                    $('#zip').attr('readonly', true);
                    $('#addr01').attr('readonly', true);
                    $('#addr02').attr('readonly', true);
                    //$('#comRegDate').removeClass('ad_calendar');
                    //$('#comRegDate').attr('disabled', true);
                    //$('#comRegDateBtn').attr('disabled', true);

                    $('#mberGrade1').attr('readonly', true);
                    $('#mberGrade2').attr('readonly', true);

                    $('#tel1').attr('disabled', true);
                    $('#tel2').attr('readonly', true);
                    $('#tel3').attr('readonly', true);
                    $('#upteaNm').attr('readonly', true);
                    $('#upjongNm').attr('readonly', true);

                    //$('#comRegDate').val(value.COM_REG_DATE);
                    $('#upteaNm').val(value.BIZCND);

                    $('#upjongNm').val(value.INDUTY);
                    $('#mtOrgCode').attr('disabled', true);
                    $('select[name="mtOrgCode"]').val(value.MT_ORG_CODE);

                    $('#passCheck').val('Y');//유효성체크 패스

                    $('#frm').attr('action', '/academy/user/memberJoinForm.do');

                    //유해화학물질관리자가 있으면 맨 밑에 텍스트를 뿌려주고
                    //체크박스를 옮김
                    if(value.COMPMNGR != ''){

                        $('input[id=mberGrade1]').attr('checked', true);
                        $('input[id=mberGrade2]').attr('checked', false);

                        if(jQuery('input:radio[name="mberGrade"]:checked').val() == 'M'){
                            $('.compMngrText').html('<p class="redFont">* 이미 유해화학물질관리자가 존재하므로 기업회원으로 가입합니다.</p>');
                            jQuery('input:radio[name="mberGrade"]:input[value="P"]').prop('checked', true);

                        }

                    }else {

                        $('input[id=mberGrade1]').attr('checked', false);
                        $('input[id=mberGrade2]').attr('checked', true);

                        $('.compMngrText').text('');
                        $('#mngrYn').val('Y'); //유해화학물질관리자 여부 Y

                    }

                //1개 이상기업일경우
                }else if(value.resultCnt > 1) {
                    $('#companyViewHelp').css('display','block');

                    //url 세팅
                    window.open('','companyPop','width=550,height=500, scrollbars=YES');
                    //경로 세팅
                    $('#frm').attr('action','/academy/user/memberJoinCompanyListPop.do');
                    //타겟 지정
                    $('#frm').attr('target','companyPop');
                    //파라미터 삽입 사업자번호

                    $('#frm').submit();
                    return false;

                //기업이 없을경우
                }else {

                    $("#companyNewYn").val('Y');
                    var mberGradeChk = $('input:radio[name="mberGrade"]:checked').val();
                    if( mberGradeChk == 'P') {
                        alert("등록되지 않은 사업장 입니다.\n사업장을 등록하시기 위해서는 유해화학물질관리자\n(기업담당자)가 먼저 가입해야 합니다.");
                        return;
                    }
                    else {
                        if(companyCnt > 0) {
                            alert('승인되지 않은 기업입니다. 관리자에게 문의하세요.');
                            return;
                        }
                        else {
                            alert('등록되지 않은 사업장 입니다.\n사업장을 등록하셔야 가입할 수 있습니다.\n다음단계에서 사업장 정보를 등록할 수 있습니다.');
                        }
                    }

                    $('#companyViewHelp').css('display','none');
                    $('#comModifyYn').val('Y');
                    //초기화
                    $('.comName').html('');
                    $('.bizNo').html('');
                    //$('#postCode1').val('');
                    //$('#postCode2').val('');
                    $('#zip').val('');
                    $('#addr01').val('');
                    $('#addr02').val('');
                    $('#ceo').val('');
                    $('#tel1').val('');
                    $('#tel2').val('');
                    $('#tel3').val('');
                    //$('#comRegDate').val('');
                    $('#upteaNm').val('');
                    $('#upjongNm').val('');

                    $('#comRegGb1').attr('disabled', false);
                    $('#comRegGb2').attr('disabled', false);
                    $('#ceo').attr('readonly', false);


                    $('#searchPostCode').attr('disabled', false);
                    //$('#postCode1').attr('readonly', false);
                    //$('#postCode2').attr('readonly', false);
                    $('#zip').attr('readonly', false);
                    $('#addr01').attr('readonly', false);
                    $('#addr02').attr('readonly', false);
                    //$('#comRegDate').addClass('ad_calendar');
                    //$('#comRegDate').attr('disabled', false);

                    $('#mberGrade1').attr('readonly', false);
                    $('#mberGrade2').attr('readonly', false);

                    $('#tel1').attr('disabled', false);
                    $('#tel2').attr('readonly', false);
                    $('#tel3').attr('readonly', false);
                    $('#upteaNm').attr('readonly', false);
                    $('#upjongNm').attr('readonly', false);

                    $('#companyGradeCode').val('M');//유해화학물질관리자 회원으로 등록
                    $('#seachYn').val('Y');

                    $('#COMNO').val(data);

                    $('.comName').html($('#comName').val());
                    $('#comNm').val($('#comName').val());
                    $('.bizNo').html($('#BIZNO').val());

                    $('.compInfo').css('display','block');
                    $('.compInfo').attr('readonly', false);

                    $('.compMngrText').html('')
                    $('#mtOrgCode').val('');
                    $('#mtOrgCode').attr('disabled', false);

                    //$('input[id=mberGrade1]').attr('checked', false);
                    //$('input[id=mberGrade2]').attr('checked', true);
                    //$('#frm').attr('action', '/academy/user/memberJoinCompanyExec.do');

                }

        });
    } else {
        $("#companyNewYn").val('Y');
        var mberGradeChk = $('input:radio[name="mberGrade"]:checked').val();
        if( mberGradeChk == 'P') {
            alert("등록되지 않은 사업장 입니다.\n사업장을 등록하시기 위해서는 유해화학물질관리자\n(기업담당자)가 먼저 가입해야 합니다.");
            return;
        }
        else {
            if(data[0].companyCnt > 0) {
                alert('승인되지 않은 기업입니다. 관리자에게 문의하세요.');
                return;
            }
            else {
                alert('등록되지 않은 사업장 입니다.\n사업장을 등록하셔야 가입할 수 있습니다.\n다음단계에서 사업장 정보를 등록할 수 있습니다.');
            }
        }
        $('#passCheck').val('N');
        $('#comModifyYn').val('Y');
        //초기화
        $('.comName').html('');
        $('#comNm').val('');
        $('.bizNo').html('');
        //$('#postCode1').val('');
        //$('#postCode2').val('');
        $('#zip').val('');
        $('#addr01').val('');
        $('#addr02').val('');
        $('#ceo').val('');
        $('#tel1').val('');
        $('#tel2').val('');
        $('#tel3').val('');
        //$('#comRegDate').val('');
        $('#upteaNm').val('');
        $('#upjongNm').val('');

        $('#comRegGb1').attr('disabled', false);
        $('#comRegGb2').attr('disabled', false);
        $('#ceo').attr('readonly', false);

        $('#searchPostCode').attr('disabled', false);
        //$('#postCode1').attr('readonly', false);
        //$('#postCode2').attr('readonly', false);
        $('#zip').attr('readonly', false);
        $('#addr01').attr('readonly', false);
        $('#addr02').attr('readonly', false);
        //$('#comRegDate').addClass('ad_calendar');
        //$('#comRegDate').attr('disabled', false);

        $('#mberGrade1').attr('readonly', false);
        $('#mberGrade2').attr('readonly', false);

        $('#tel1').attr('disabled', false);
        $('#tel2').attr('readonly', false);
        $('#tel3').attr('readonly', false);
        $('#upteaNm').attr('readonly', false);
        $('#upjongNm').attr('readonly', false);

        $('#companyGradeCode').val('M');//유해화학물질관리자 회원으로 등록
        $('#seachYn').val('Y');

        $('#COMNO').val(data);

        $('.comName').html($('#comName').val());
        $('#comNm').val($('#comName').val());
        $('.bizNo').html($('#BIZNO').val());

        $('.compInfo').css('display','block');
        $('.compInfo').attr('readonly', false);

        $('.compMngrText').html('')
        $('#mtOrgCode').val('');
        $('#mtOrgCode').attr('disabled', false);

        //$('input[id=mberGrade1]').attr('checked', false);
        //$('input[id=mberGrade2]').attr('checked', true);

        $('#mngrYn').val('Y');
        $('#frm').attr('action', '/academy/user/memberJoinCompanyExec.do');
    }

}

//기업 선택리스트 팝업에서 받은 데이터 세팅
function returnCompanyInfo(value){

    $('#companyGradeCode').val('P'); // 기업회원(종사자)로 등록
    $('#seachYn').val('Y');
    $('#COMNO').val(value.COMNO);

    $('.compInfo').css('display','block');
    $('#comModifyYn').val('N');

    //사업장 정보 세팅
    $('.comName').html(value.COMNAME);
    $('#comNm').val(value.COMNAME);
    $('.bizNo').html(value.BIZNO);
    //$('#postCode1').val(value.ZIP1);
    //$('#postCode2').val(value.ZIP2);
    var zip = value.ZIP;
    if(zip.length > 5){
        zip = value.ZIP1 + "-" + value.ZIP2;
    }
    $('#zip').val(zip);
    $('#addr01').val(value.ADDR01);
    $('#addr02').val(value.ADDR02);
    $('#ceo').val(value.CEO);

    $('#tel1').val(value.TEL1);
    $('#tel2').val(value.TEL2);
    $('#tel3').val(value.TEL3);
    if(value.COM_REG_GB == 'P'){
    $('input[id=comRegGb1]').attr('checked', true);
    } else if(value.COM_REG_GB == 'C'){
        $('input[id=comRegGb2]').attr('checked', true);
    }
    $('#comRegGb1').attr('disabled', true);
    $('#comRegGb2').attr('disabled', true);
    $('#ceo').attr('readonly', true);
    $('#searchPostCode').attr('disabled', true);
    //$('#postCode1').attr('readonly', true);
    //$('#postCode2').attr('readonly', true);
    $('#zip').attr('readonly', true);
    $('#addr01').attr('readonly', true);
    $('#addr02').attr('readonly', true);
    //$('#comRegDate').removeClass('ad_calendar');
    //$('#comRegDate').attr('disabled', true);
    //$('#comRegDateBtn').attr('disabled', true);

    $('#mberGrade1').attr('readonly', true);
    $('#mberGrade2').attr('readonly', true);

    $('#tel1').attr('disabled', true);
    $('#tel2').attr('readonly', true);
    $('#tel3').attr('readonly', true);
    $('#upteaNm').attr('readonly', true);
    $('#upjongNm').attr('readonly', true);
    //$('#comRegDate').val(value.COM_REG_DATE);
    $('#upteaNm').val(value.BIZCND);

    $('#upjongNm').val(value.INDUTY);
    $('#mtOrgCode').attr('disabled', true);
    $('select[name="mtOrgCode"]').val(value.MT_ORG_CODE);

    $('#passCheck').val('Y');//유효성체크 패스

    $('#frm').attr('target', '_self');
    $('#frm').attr('action', '/academy/user/memberJoinForm.do');

    //유해화학물질관리자가 있으면 맨 밑에 텍스트를 뿌려주고
    //체크박스를 옮김
    if(value.COMPMNGR != ''){

        $('input[id=mberGrade1]').attr('checked', true);
        $('input[id=mberGrade2]').attr('checked', false);

        if(jQuery('input:radio[name="mberGrade"]:checked').val() == 'M'){
            $('.compMngrText').html('<p class="redFont">* 이미 유해화학물질관리자가 존재하므로 기업회원으로 가입합니다.</p>');
            jQuery('input:radio[name="mberGrade"]:input[value="P"]').prop('checked', true);
        }

        $('#mngrYn').val('N'); //유해화학물질관리자 여부 N
    }else {
        $('.compMngrText').text('');
        $('#mngrYn').val('Y'); //유해화학물질관리자 여부 Y
    }

}

</script>

<div class="contents-wrap">

    <form name="frm" id="frm" action="/academy/user/memberJoinCompanyForm.do" method="post">
    <input type="hidden" name="multipleYn" id="multipleYn" value="N"/>
    <input type="hidden" name="BIZNO" id="BIZNO" value=""/>
    <input type="hidden" name="tel" id="tel" value=""/>
    <input type="hidden" name="COMNO" id="COMNO" value=""/>
    <input type="hidden" name="comNm" id="comNm" value=""/>
    <input type="hidden" name="companyGradeCode" id="companyGradeCode" value="<c:out value="${REQUEST_DATA.companyGradeCode}" />" /><!-- 회원분류 -->
    <input type="hidden" name="comModifyYn" id="comModifyYn" value=""/><!-- 기업정보 수정가능여부 -->
    <input type="hidden" name="mngrYn" id="mngrYn" value="N"/><!-- 유해화학물질관리자 여부 -->
    <input type="hidden" name="passCheck" id="passCheck" value="N"/><!-- 유효성체크 패스(이미 등록된 기업일경우) -->
    <input type="hidden" name="companyNewYn" id="companyNewYn" value="N"/>
   
    <div class="sub-wrap">
    	<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_etc.jsp"%>
    	
            <!-- 페이지 상단 타이틀 영역 -->
            <div id="Sub_Header" class="menu6">
                <div class="nav">
                    <img src="/academy/images/ico_home.png" alt="Home" /><img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />기타<img src="/academy/images/ico_nav_arrow.png" alt="&gt;" />회원가입
                </div>
                <h3>회원가입</h3>
                <p>상상스토리 교육시스템을 찾아주셔서 감사합니다.</p>
            </div>
            <!-- // 페이지 상단 타이틀 영역 -->

            <div id="Contents" tabindex="-1">

                <img src="/academy/images/join_step02.png" alt="2. 기업정보 등록" class="step_bar" />

                <!-- 회원분류 선택 시작 -->
                <h5>회원분류 선택</h5>
                <ul class="join_part clearfix">
                    <li><label for="mberGrade1"><input type="radio" id="mberGrade1" name="mberGrade" value="P"/>일반회원<span>유해화학물질 관련 법정교육 수강생을 위한 <br />해당 사업장의 종사자와 취급자에 해당됩니다.</span></label></li>
                    <li><label for="mberGrade2"><input type="radio" id="mberGrade2" name="mberGrade" value="M"/>유해화학물질관리자(기업담당자)<span style="margin-top:5px">기업의 관리자로 지정되어 해당 사업장 내의 종사<br />자/취급자 온라인 교육 명단을 등록하고 이수 현 <br />황과 기업정보를 관리하는 자에 해당됩니다.</span></label></li>
                </ul>

                <!-- 회원분류 끝 -->

                <!-- 기업정보 -->
                    <h5>기업정보 조회</h5>
                    <div class="shadow_box">
                        <div class="yellow_box">
                        <p>기업정보 조회 후 등록되어 있지 않은 사업장일 경우 신규로 등록하여야 합니다.<span class="t_blue">(유해화학물질관리자(기업담당자))</span><br />
                        <p>기업정보를 등록하는 자가 해당 사업장의 관리자가 됩니다.<br />
                        <strong class="t_blue">(기업담당자 권한 : 해당 사업장의 종사자, 취급자 명단등록, 사업장 정보관리)</strong></p>
                        <p>동일한 사업자번호를 사용하는 사업장 추가 시 관리자에게 기업등록을 요청해 주시기 바랍니다.</p>
                        <p>신규등록되는 사업장은 상상스토리 승인을 받으셔야 정상적으로 로그인 및 일반회원 가입이 가능합니다.</p>
                        <p>신규로 등록되는 사업장은 사업자등록증을 FAX.042-605-7095로 보내시면 담당자가 승인처리 드립니다.<br />승인처리 후 이용할 수 있습니다.</p>
                        </div>
                    </div>

                    <div class="shadow_box">
                        <div class="company_box">
                            <div><label for="comName">회사명</label><input type="text" id="comName" name="comName" style="width: 150px;" /></div>
                            <div><label for="bizNo1">사업자번호</label><input type="text" id="bizNo1" name="bizNo1" style="width: 50px;" maxlength="3"/> - <input type="text" id="bizNo2" name="bizNo2" title="사업자번호 가운데자리" style="width: 50px;" maxlength="2"/> - <input type="text" id="bizNo3" name="bizNo3" title="사업자번호 끝자리" style="width: 80px;" maxlength="5"/></div>
                            <a href="#" onclick="javascript:onSearchCompany();return false;" class="btn blue" title="기업정보조회">기업정보조회</a>
                        </div>
                    </div>
                <!--  //기업정보 -->

                <div class="compInfo" style="display:none;">
                <h5>기업정보 입력</h5>

                    <div id="companyViewHelp" class="shadow_box" style="display: none;">
                        <div class="yellow_box">
                        <p><strong class="t_orange_b">업체정보가 비어있는 경우 가입을 먼저 완료하신 후 기업담당자의 마이페이지 &gt; 기업정보관리에서 수정할 수 있습니다.</strong></p>
                        </div>
                    </div>

                <div class="table_box">
                    <table cellpadding="0" cellspacing="0" class="col_type">
                        <caption>기업정보 등록 : 상상스토리 교육시스템 마이페이지의 기업정보 등록입니다.</caption>
                        <colgroup>
                            <col width="150px"/>
                            <col width="" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>회사명</th>
                                <td class="comName">

                                </td>
                            </tr>
                            <tr>
                                <th>개인/법인</th>
                                <td>
                                    <input type="radio" id="comRegGb1" name="comRegGb" value="P" checked="checked" /><label for="comRegGb1">개인</label>
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="radio" id="comRegGb2" name="comRegGb" value="C" /><label for="comRegGb2">법인</label>
                                </td>
                            </tr>
                            <tr>
                                <th>사업자번호</th>
                                <td class="bizNo">

                                </td>
                            </tr>
                            <tr>
                                <th><label for="ceo">대표자명</label></th>
                                <td>
                                    <input type="text" id="ceo" name="ceo" style="width: 300px;" />
                                </td>
                            </tr>
                            <tr>
                                <th><label for="zip">사업장주소</label></th>
                                <td>
                                    <input type="text" id="zip" name="zip" placeholder="우편번호">
                                    <a href="#" id="searchPostCode" onclick="javascript:fnPostPop();return false;"class="btn gray" title="새창으로 안내합니다.(우편번호찾기)">우편번호 찾기</a>
                                    <br/>
                                    <input type="text" id="addr01" name="addr01" placeholder="사업장주소 앞부분" style="width: 379px;" value="<c:out value="${companyInfo.ADDR01}"/>">
                                    <input type="text" id="addr02" name="addr02" title="사업장주소 나머지부분" style="width: 200px;" value="<c:out value="${companyInfo.ADDR02}"/>" />

                                    <!-- <input type="text" id="postCode1" name="postCode1" style="width: 60px;" maxlength="3" readonly="readonly"/>
                                    - <input type="text" id="postCode2" name="postCode2" title="사업장주소 우편번호 뒷자리" style="width: 60px;" maxlength="3" readonly="readonly" />
                                    <a href="#" id="searchPostCode" onclick="javascript:searchPostCode();return false;"class="btn gray">우편번호 찾기</a>
                                    <br />
                                    <input type="text" id="addr01" name="addr01" title="사업장주소 앞부분" style="width: 279px;" />
                                    <input type="text" id="addr02" name="addr02" title="사업장주소 나머지부분" style="width: 300px;" /> -->
                                </td>
                            </tr>
                            <!-- <tr>
                                <th><label for="comRegDate">설립일</label></th>
                                <td>
                                    <input type="text" id="comRegDate" name="comRegDate" class="ad_calendar" style="width: 135px;" />
                                    <a href="#" id="comRegDateBtn" onclick="javascript:fnCalendar(); return false;" class="btn gray ad_calendar"><img src="/academy/images/ico_calendar.png" alt="날짜선택"/></a>
                                </td>
                            </tr> -->
                            <tr>
                                <th><label for="tel1">사무실전화번호</label></th>
                                <td>
                                    <select id="tel1" name="tel1" style="width: 60px;">
                                        <option value="">선택</option>
                                        <option value="02" >02</option>
                                        <option value="031">031</option>
                                        <option value="032">032</option>
                                        <option value="033">033</option>
                                        <option value="041">041</option>
                                        <option value="042">042</option>
                                        <option value="043">043</option>
                                        <option value="044">044</option>
                                        <option value="051">051</option>
                                        <option value="052">052</option>
                                        <option value="053">053</option>
                                        <option value="054">054</option>
                                        <option value="055">055</option>
                                        <option value="061">061</option>
                                        <option value="062">062</option>
                                        <option value="063">063</option>
                                        <option value="064">064</option>
                                        <option value="070">070</option>
                                    </select>
                                    - <input type="text" id="tel2" name="tel2" title="전화번호 가운데자리" style="width: 60px;" maxlength="4"  />
                                    - <input type="text" id="tel3" name="tel3" title="전화번호 끝자리" style="width: 60px;"  maxlength="4" />
                                </td>
                            </tr>
                            <tr>
                                <th><label for="upteaNm">업태</label></th>
                                <td>
                                    <input type="text" id="upteaNm" name="upteaNm" style="width: 300px;" />
                                </td>
                            </tr>
                            <tr>
                                <th><label for="upjongNm">종목</label></th>
                                <td>
                                    <input type="text" id="upjongNm" name="upjongNm"style="width: 300px;" />
                                </td>
                            </tr>
                            <tr>
                                <th><label for="mtOrgCode">관할기관</label></th>
                                <td>
                                    <select id="mtOrgCode" name="mtOrgCode" title="관할기관">
                                        <option value="">선택</option>
                                        <c:out value="${cfn:getComboOptions2(companyOrgList, REQUEST_DATA.mtCode)}"  escapeXml="false"/>
                                    </select>
                                    <span class="t_blue orgText"></span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="compMngrText">
                </div>

                <div class="btn_area clearfix">
                    <div class="btn_group_center">
                        <a href="#" onclick="javascript:fnSave(); return false;" class="btn big green" title="기업정보 저장">다음</a>
                    </div>
                </div>

                </div><!-- compInfo 클래스 끝 -->

            </div><!-- // Contents -->
        </div>

    </form>
</div>

    <!-- 풋터 영역 -->
    <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
    <!-- // 풋터 영역 -->