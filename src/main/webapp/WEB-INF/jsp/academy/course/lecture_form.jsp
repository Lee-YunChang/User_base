<%
/****************************************
    subject	: 나의공간  > 신청내역 > 상세세
    summary	:
    author	: 이진영
    date	: 2016-09-27
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript" src="/common/js/sangs_core.js"></script>
<script type="text/javascript" src="/academy/common/js/jquery.showLoading.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	//SANGS.areaCombo.init('sidoCode','guCode','dongCode');
	
	$('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
	
	 $(document).on('click', '.add_btn_minus', function(e){
		e.preventDefault();
		delcnt--;
		$(this).parents('.mainClass').remove();
		
	}); 
	

});
	
	/* function fnPop() {
		var myForm = document.frm;
		window.open("" ,"frm", "width=1300, height=925, scrollbars=yes"); 
		$("#searchWord").val($("#lecUsernm").val());
		myForm.action = '/academy/course/lectureTutorSearch.do'; 
		myForm.method = "post";
		myForm.target = "frm";
		myForm.submit();
	} */
	
	
	function  fnZipSelect(zipNo,roadAddr) {
		$("#lnmZip").val(zipNo);
		$("#lnmAdres1").val(roadAddr);
		$('.close').trigger('click'); //layer closed.
	}
	
	
	
	
	//특강 등록
	function insertInfo(slno , sltno , applyNo){
	

		if($('#applyNm').val() == ''){
			alert('신청자 성명을 입력해주세요');
			$('#applyNm').focus();
			return;
		}else if($('#applyOrganNm').val() == ''){
			alert('신청자 소속을 입력해주세요');
			$('#applyOrganNm').focus();
			return;
		/* }else if($('#sidoCode').val() == '' || $('#guCode').val() == '' || $('#dongCode').val() == '' || $('#applyOrganAddr').val() == ''){
			alert("신청지역 정보를 입력해주세요");
			$("#sidoCode").focus();
			return; */
		}else if($('#lnmZip').val() == '' || $('#lnmAdres1').val() == '' ){
			alert("신청지역 정보를 입력해주세요");
			$("#addr").focus();
			return;	
		}else if($('#eduArea').val() == ''){
			alert("교육장소를 입력해주세요");
			$("#eduArea").focus();
			return;
	/* 	}else if($('#confirmTel1').val() == '' || $('#confirmTel2').val() == '' || $('#confirmTel3').val() == ''){
			alert("유선전화를 입력해주세요");
			$("#confirmTel1").focus();
			return; */
		}else if($('#confirmMobile1').val() == '' || $('#confirmMobile2').val() == '' || $('#confirmMobile3').val() == ''){
			alert("휴대전화를 입력해주세요");
			$("#confirmMobile1").focus();
			return;
		}else if($('#email1').val() == '' || $('#email2').val() == ''){
			alert("메일주소를 입력해주세요");
			$("#email1").focus();
			return;
		}else if($('#eduSdate').val() == '' || $('#eduSdate_hh').val() == '' || $('#eduSdate_mm').val() == '' || $('#eduEdate_mm').val() == '' || $('#eduEdate_mm').val() == ''){
			alert("교육 희망일시를 입력해주세요");
			$("#eduSdate").focus();
			return; 
		
		}else if(!($('input[name=mtLecTargetCode]:checked').is(':checked'))){
			alert("교육대상를 선택해주세요");
			$("#mtLecTargetCode").focus();
			return;
		}else if($('#personCnt').val() == ''){
			alert("참석인원을 입력해주세요");
			$("#personCnt").focus();
			return;
		}else if(!($('input[name=mtLctreCodeArr]:checked').is(':checked'))){
			alert("교육희망 주제를 선택해주세요");
			$("#mtLctreCodeArr").focus();
			return;
	/* 	}else if(!($('input[name=mtLctreSystemArr]:checked').is(':checked'))){
			alert("강의진행 방식을 선택해주세요");
			$("#mtLctreSystemArr").focus();
			return;	 */
		}else if($('input[name="termAgree"]:checkbox:checked').length == 0){
			alert('개인정보취급방침에 동의해야 가입 가능합니다.');
			$('input[name="termAgree"]').focus();
			return;	
		}
		
		
		// 교육희망 일시 JSON 형식으로 넘기기
		var list = [];
		
		$('.mainClass').each(function(i){
			
			var data = {};  
			
			data.eduSdate = $(this).find('input[name=eduSdate]').val().replace(/-/g,"").toString()
							+ $(this).find('select[name=eduSdate_hh]').val().toString()
							+ $(this).find('select[name=eduSdate_mm]').val().toString();
			
			data.eduEdate = $(this).find('input[name=eduSdate]').val().replace(/-/g,"").toString()
			+ $(this).find('select[name=eduEdate_hh]').val().toString()
			+ $(this).find('select[name=eduEdate_mm]').val().toString();
			
			
			
			list.push(data);
			
		});
		
		
		console.log(JSON.stringify(list));
		
		$('#listParam').val(JSON.stringify(list));
		
		
		
		
		//이메일 합치기
	    if($('#email1').val() !='' || $('#email2').val() !='' ){
	        $('#email').val($('#email1').val() +'@'+$('#email2').val() );
	    }

	    //유선번호 합치기
	    if($('#confirmMobile1').val() !='' || $('#confirmMobile2').val() !='' || $('#confirmMobile3').val() !=''){
	        $('#confirmMobile').val($('#confirmMobile1').val() +'-'+$("#confirmMobile2").val() +'-'+$('#confirmMobile3').val() );
	    } else {
	        $('#confirmMobile').val(null);
	    }
	    
	 	//무선번호 합치기
	    if($('#confirmTel1').val() !='' || $('#confirmTel1').val() !='' || $('#confirmTel1').val() !=''){
	        $('#confirmTel').val($('#confirmTel1').val() +'-'+$("#confirmTel2").val() +'-'+$('#confirmTel3').val() );
	    } else {
	        $('#confirmTel').val(null);
	    }
	    

		var ckbs = $("input[name='mtLctreCodeArr']:checked");
		ckbs = ckbs.map(function(){
			var value = $(this).val();
			return value;
		}).get().join(",");
		
		$("#mtLctreCode").val(ckbs);
		
		var ckbs2 = $("input[name='mtFcltsCodeArr']:checked");
		ckbs2 = ckbs2.map(function(){
			var value = $(this).val();
			return value;
		}).get().join(",");
		
		$("#mtFcltsCode").val(ckbs2); 
		
		var frm = document.frm;
		
		$("#qu").val('insert');
		$("#frm").attr('target', '_self').attr('method', 'post').attr('action' , '/academy/course/lectureInsertInfo.do').submit(); 
	}
    
  	//이메일 셀렉트박스 세팅
    function emailSelect(val){
        $('#email2').val(val);
    }
    function userEmailSelect(val){
        $('#userEmail2').val(val);
    }
    
    
  //날짜를 입력 하면 오늘 날짜로부터 숫자만큼 전날의 날짜를 mm/dd/yyyy 형식으로 돌려 준다.
	var dateFormat={
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showMonthAfterYear: true, //연월 순서로 보여줌
		changeMonth: true, //월을 셀렉트박스로 표현
		changeYear: true, //년을 셀렉트박스로 표현
		dateFormat: "yy-mm-dd",
		changeMonth: true,   
		changeYear: true,	
		yearRange: "2014:2025"
	};
  	
	$.datepicker.setDefaults({
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		changeMonth: true,
			changeYear: true,
			showMonthAfterYear: true,
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: 'yy-mm-dd'
	}); 
	
	
	var delcnt = 1;
	var cnt = 0;
	function fnAdd() {
		
		
		if (delcnt >= 9) {
			alert('9개까지 등록 가능합니다.');
			return;
		}

		delcnt ++;
		var str = '';
			str = str + "<div id='num_"+delcnt+"' class='mainClass'>";
		    str = str + "<div class='form-inline timeset static'>";
		    str = str + "<div class='form-group'>";
		    str = str + "<input type='text' name='eduSdate' id='eduSdate"+delcnt+"' readonly='readonly' title='날짜선택' class='form-control datepicker'></div>&nbsp;";
		    str = str + "<label for='eduSdate"+delcnt+"' class='btn_cal btn mrg_r5' title='날짜입력'></label> </div>";
	        str = str + "<div class='form-inline timeset'>&nbsp;";
	        str = str + "<div class='form-group eduDate'>";
		    str = str + "<select title='교육시작 시간' name='eduSdate_hh' class='form-control'>";
			str = str + "<option value='08'>08</option>";
			str = str + "<option value='09'>09</option>";
			str = str + "<option value='10'>10</option>";
			str = str + "<option value='11'>11</option>";
			str = str + "<option value='12'>12</option>";
			str = str + "<option value='13'>13</option>";
			str = str + "<option value='14'>14</option>";
			str = str + "<option value='15'>15</option>";
			str = str + "<option value='16'>16</option>";
			str = str + "<option value='17'>17</option>";
			str = str + "<option value='18'>18</option>";
			str = str + "<option value='19'>19</option>";
			str = str + "<option value='20'>20</option>";
			str = str + "<option value='21'>21</option>";
			str = str + "<option value='22'>22</option>";
			str = str + "</select>&nbsp;";
			str = str + "<select title='교육시작 분' name='eduSdate_mm' class='form-control'>";
          	str = str + "<option value='00'>00</option>";
          	str = str + "<option value='05'>05</option>";
          	str = str + "<option value='10'>10</option>";
          	str = str + "<option value='15'>15</option>";
          	str = str + "<option value='20'>20</option>";
          	str = str + "<option value='25'>25</option>";
          	str = str + "<option value='30'>30</option>";
          	str = str + "<option value='35'>35</option>";
          	str = str + "<option value='40'>40</option>";
          	str = str + "<option value='45'>45</option>";
          	str = str + "<option value='50'>50</option>";
          	str = str + "<option value='55'>55</option></select> ~ ";
         	str = str + "<select title='교육종료 시간' name='eduEdate_hh' class='form-control'>";
        	str = str + "<option value='08'>08</option>";
			str = str + "<option value='09'>09</option>";
			str = str + "<option value='10'>10</option>";
			str = str + "<option value='11'>11</option>";
			str = str + "<option value='12'>12</option>";
			str = str + "<option value='13'>13</option>";
			str = str + "<option value='14'>14</option>";
			str = str + "<option value='15'>15</option>";
			str = str + "<option value='16'>16</option>";
			str = str + "<option value='17'>17</option>";
			str = str + "<option value='18'>18</option>";
			str = str + "<option value='19'>19</option>";
			str = str + "<option value='20'>20</option>";
			str = str + "<option value='21'>21</option>";
			str = str + "<option value='22'>22</option>";
			str = str + "</select>&nbsp;";
			str = str + "<select title='교육종료 시간' name='eduEdate_mm' class='form-control'>";
			str = str + "<option value='00'>00</option>";
          	str = str + "<option value='05'>05</option>";
          	str = str + "<option value='10'>10</option>";
          	str = str + "<option value='15'>15</option>";
          	str = str + "<option value='20'>20</option>";
          	str = str + "<option value='25'>25</option>";
          	str = str + "<option value='30'>30</option>";
          	str = str + "<option value='35'>35</option>";
          	str = str + "<option value='40'>40</option>";
          	str = str + "<option value='45'>45</option>";
          	str = str + "<option value='50'>50</option>";
          	str = str + "<option value='55'>55</option></select>&nbsp;";
          	str = str + "</div></div>";
			str = str + "<div class='btnAddWrap form-inline'><div class='form-group'>";         
       		str = str + "<button class='add_btn_plus' type='button' onclick='fnAdd();return false' title='추가'>";
       		str = str + "</button>&nbsp;";
			str = str + "<button class='add_btn_minus' type='button' title='삭제'>";
       		str = str + "</button>";
			str = str + "</div>";
			str = str + "</div>";
			str = str + "</div>";
		    
		 $('.addFileWrap').append(str);   
	     
		 $('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
	} 

	//파일 변경값
	function fnChange(num, pval) {R
		$("#fileName"+num).val(pval);
		
	}
	
 	
	 
	
</script>

<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_lecture.jsp"%>
            <div class="path">
                <ul>
                    <li><span class="home text-hide">홈</span></li>
                    <li>방문교육</li>
                    <li class="active">교육신청</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
               <section class="bgTop_cate03"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">교육 신청</h2>
            		</div>           	
	            </section>
				
				<section>
                	<div class="infoBox">
                    	<div class="infoBody">
                             <ul class="li_dash">
                                 <li><strong class="po_C2">아래 사항을 유의하여 기재</strong>해 주시기 바랍니다.</li>
                                 <li>① 교육 일시와 교육 주제는 상상스토리과 협의 후 최종 결정합니다.</li>
                                 <li>② 참석인원 20명 이상 교육 신청이 가능합니다. (20명 미만일 경우, 유선 협의 필요)</li>
                                 <li>③ 교육 신청내역 확인을 위해서는 <strong><u>회원가입 </u></strong> 후 교육신청을 하셔야 합니다.</li>
                                 <li><span class="po_C7"><strong>* 접수 및 문의처 : </strong> 교육취업부  <strong class="po_C4">02) 2128-8332</strong>   /  <a href="mailto:psy5466@kinfa.or.kr">psy5466@kinfa.or.kr</a></span></li>
                             </ul>
                         </div>
                     </div>
                </section>
					
			 	<hr>
					
				<section class="tableBox">
					<p class="rbltopTxt"><strong class="po_C2">* 항목은 필수적으로 입력하셔야 합니다.</strong></p>
                	<form name="frm" id="frm" action="" method="post">
						<input type="hidden" name="qu" id="qu" value=""/>
						<input type="hidden" name="email" id="email" value=""/>
						<input type="hidden" name="confirmTel" id="confirmTel" value=""/>
						<input type="hidden" name="confirmMobile" id="confirmMobile" value=""/>
						<input type="hidden" name="eduEdate" id="eduEdate" value=""/>
						<input type="hidden" name="eduEdate2" id="eduEdate2" value=""/>
						<input type="hidden" name="eduEdate3" id="eduEdate3" value=""/>
						<input type="hidden" name="eduEdate4" id="eduEdate4" value=""/>
						<input type="hidden" name="eduEdate5" id="eduEdate5" value=""/>
						<input type="hidden" name="eduEdate6" id="eduEdate6" value=""/>
						<input type="hidden" name="eduEdate7" id="eduEdate7" value=""/>
						<input type="hidden" name="eduEdate8" id="eduEdate8" value=""/>
						<input type="hidden" name="eduEdate9" id="eduEdate9" value=""/>
						<input type="hidden" name="mtLctreCode" id="mtLctreCode" value=""/>
						<input type="hidden" name="mtFcltsCode" id="mtFcltsCode" value=""/>
						<input type="hidden" name="listParam" id="listParam" value=""/>
                        	<fieldset>
                            	<legend>신청하기</legend>
                                <div class="tblWrap">
                                	<table class="writeForm">
                                    	<caption>신청하기양식(이름, 소속,지역,교육장소,개인정보등 입력)</caption>
                                        <colgroup>
                                        	<col style="width:25%">
                                            <col style="width:*">
                                        </colgroup>
                                        <tbody>
                                        	<tr>
                                            	<th scope="row"><strong class="po_C2">*</strong><label for="app_name">신청자 성명</label></th>
                                                <td>
	                                                <div class="form-inline">
	                                                    <div class="form-group w30">
	                                                    	<input type="text" id="applyNm" name="applyNm" class="form-control" title="신청자 성명 입력" maxlength="25">
	                                                    </div>
	                                                </div>
                                                 </td>
                                             </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="app_belong">기관명</label></th>
                                                  <td>
                                                      <div class="form-inline">
                                                          <div class="form-group w30">
                                                          	  <input type="text" id="applyOrganNm" name="applyOrganNm" class="form-control" title="기관명 입력" maxlength="100">
                                                          </div>
                                                      </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="app_area">신청지역</label></th>
                                                  <td>
                                                  	<div class="form-inline">
                                                       <div class="form-group w20">
                                                           <input type="text"  class="form-control" id="lnmZip" name="lelnmZip" title="우편번호" readonly="readonly">
                                                       </div>
                                                       <button type="button" name="button" id="addr" class="btn btn-sm btn-default" data-toggle="modal" data-target="#post" title="우편번호찾기">우편번호찾기</button>
                                                       <!-- <button type="button" name="button" onclick="zipSearch(); return false;" class="btn btn-sm btn-default">우편번호찾기</button> -->
                                                   </div>
                                                   <div class="form-inline address">
                                                       <div class="form-group">
                                                           <input type="text" class="form-control"  id="lnmAdres1" name="lelnmAdres1" title="주소" readonly="readonly">

                                                           <input type="text" class="form-control" id="lnmAdres2" name="lelnmAdres2" title="상세주소">
                                                       </div>
                                                   </div>
                                                  
                                                  
                                                  
                                                     <!--  <div class="form-inline"> -->
                                                                                                         
                                                         <!--  
                                                             <div class="form-group w20">
                                                              <!-- <select class="form-control" name="sidoCode" id="sidoCode" title="시도" >
												              	<option value="">선택</option>
												              </select>
												            </div>
                                                         <div class="form-group w20">
                                                          	<select class="form-control" name="guCode" id="guCode" title="구이름" >
								                   				<option value="">선택</option>
								            				</select>
                                                          </div>
                                                          <div class="form-group w20">
                                                              <select class="form-control" name="dongCode" id="dongCode" title="동이름">
								                    			<option value="">선택</option>
								            				  </select>
                                                          </div>
                                                          <div class="form-group full">
                                                          	  <input type="text" name="applyOrganAddr"  id="applyOrganAddr" class="form-control" maxlength="50" title="신청지역 상세 주소"/>
                                                      </div>
                                                          </div> -->
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="eduspot">교육장소</label></th>
                                                  <td>
                                                      <div class="form-inline">
	                                                      <div class="form-group full">
	                                                      	  <input type="text" name="eduArea" id="eduArea" class="form-control" maxlength="250" title="교육장소 입력"/>
	                                                      </div>
	                                                  </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><label for="app_phone">유선전화</label></th>
                                                  <td>
                                                      <div class="form-inline phoneNum">
                                                          <div class="form-group w20">
                                                          	  <select id="confirmTel1" name="confirmTel1" title="전화번호 앞 자리" class="form-control i-numOnly">
						                                          <option value="02">02</option>
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
                                                          	  <!-- <input type="text" maxlength="5" id="confirmTel1"  class="form-control i-numOnly" name="confirmTel1" title="전화번호 앞 자리" /> -->
                                                          </div>
                                                          <div class="form-group w20">
                                                          	  <input type="text" maxlength="4" id="confirmTel2"  class="form-control i-numOnly" name="confirmTel2" title="전화번호 가운데 자리"/>
                                                          </div>
                                                          <div class="form-group w20">
                                                              <input type="text" maxlength="4" id="confirmTel3"  class="form-control i-numOnly" name="conficonfirmTel3" title="전화번호 끝 자리" />
                                                          </div>
                                                      </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="app_Cellphone">휴대전화</label></th>
                                                  <td>
                                                      <div class="form-inline phoneNum">
                                                          <div class="form-group w20">
                                                          	  <select id="confirmMobile1" name="confirmMobile1" title="휴대폰번호 선택" class="form-control">
						                                          <option value="010">010</option>
						                                          <option value="011">011</option>
						                                          <option value="016">016</option>
						                                          <option value="017">017</option>
						                                          <option value="018">018</option>
						                                          <option value="019">019</option>
						                                      </select>
                                                          </div>
                                                          <div class="form-group w20">
                                                          	  <input type="text" id="confirmMobile2"  class="form-control i-numOnly" name="confirmMobile2" title="전화번호 가운데 자리" maxlength="4"/>
                                                          </div>
                                                          <div class="form-group w20">
                                                          	  <input type="text" id="confirmMobile3"  class="form-control i-numOnly" name="confirmMobile3" title="전화번호 가운데 자리" maxlength="4"/>
                                                          </div>
                                                      </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="app_email">이메일 주소</label></th>
                                                  <td>
                                                      <div class="form-inline">
                                                          <div class="form-group w30">
                                                              <input type="text" id="email1" name="email1" title="이메일 앞주소 입력" class="form-control" maxlength="30"/>
                                                          </div>
                                                          @&nbsp;
                                                          <div class="form-group w30">
                                                          	  <input type="text" id="email2" name="email2" title="이메일 뒷주소 입력" class="form-control" maxlength="20"/>
                                                          </div>
                                                          <div class="form-group w20">
	                                                          <select id="email3" name="email3" class="form-control-static " onchange="emailSelect(this.value);return false;"  title="이메일 직접선택">
																	<option value="">직접입력</option>
																	 	<c:forEach var="emap2" items="${categoryData}" varStatus="status2">
																        	<option value="${emap2.MT_SUB_NAME}"><c:out value="${emap2.MT_SUB_NAME}"/></option>
																        </c:forEach>
														  	  </select>
                                                          </div>
                                                      </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="hopeDate">교육 희망일시</label></th>
                                                  <td class="td-input-wrap">
	                                                  <div class="addFileWrap">
		                                                  <div class="mainClass">
		                                                  	  <div class="form-inline timeset static">
		                                                          <div class="form-group">
		                                                          	  <input type="text" name="eduSdate" id="eduSdate" readonly="readonly" title="날짜선택"  class="form-control datepicker">
		                                                          </div>
		                                                          <label for="eduSdate" class="btn_cal btn mrg_r5" title="날짜입력"></label>
		                                                     </div>
		                                                     <div class="form-inline timeset">     
		
		                                                        <div class="form-group eduDate">
		                                                        	<select title="교육시작 시간" name="eduSdate_hh" class="form-control">
		                                                        		<option value="08">08</option>
		                                                        		<option value="09">09</option>
		                                                        		<option value="10">10</option>
		                                                        		<option value="11">11</option>
		                                                        		<option value="12">12</option>
		                                                        		<option value="13">13</option>
		                                                        		<option value="14">14</option>
		                                                        		<option value="15">15</option>
		                                                        		<option value="16">16</option>
		                                                        		<option value="17">17</option>
		                                                        		<option value="18">18</option>
		                                                        		<option value="19">19</option>
		                                                        		<option value="20">20</option>
		                                                        		<option value="21">21</option>
		                                                        		<option value="22">22</option>
		                                                        	</select>
		                                                        	
		                                                       		<select title="교육시작 분" name="eduSdate_mm" class="form-control">
		                                                        		<option value="00">00</option>
		                                                        		<option value="05">05</option>
		                                                        		<option value="10">10</option>
		                                                        		<option value="15">15</option>
		                                                        		<option value="20">20</option>
		                                                        		<option value="25">25</option>
		                                                        		<option value="30">30</option>
		                                                        		<option value="35">35</option>
		                                                        		<option value="40">40</option>
		                                                        		<option value="45">45</option>
		                                                        		<option value="50">50</option>
		                                                        		<option value="55">55</option>
		                                                        	</select>
		                                                        	~                                                         	
		                                                        	<select title="교육종료 시간" name="eduEdate_hh" class="form-control">
		                                                        		<option value="08">08</option>
		                                                        		<option value="09">09</option>
		                                                        		<option value="10">10</option>
		                                                        		<option value="11">11</option>
		                                                        		<option value="12">12</option>
		                                                        		<option value="13">13</option>
		                                                        		<option value="14">14</option>
		                                                        		<option value="15">15</option>
		                                                        		<option value="16">16</option>
		                                                        		<option value="17">17</option>
		                                                        		<option value="18">18</option>
		                                                        		<option value="19">19</option>
		                                                        		<option value="20">20</option>
		                                                        		<option value="21">21</option>
		                                                        		<option value="22">22</option>
		                                                        	</select>
		                                                        	
		                                                        	<select title="교육종료 분" name="eduEdate_mm" class="form-control">
		                                                        		<option value="00">00</option>
		                                                        		<option value="05">05</option>
		                                                        		<option value="10">10</option>
		                                                        		<option value="15">15</option>
		                                                        		<option value="20">20</option>
		                                                        		<option value="25">25</option>
		                                                        		<option value="30">30</option>
		                                                        		<option value="35">35</option>
		                                                        		<option value="40">40</option>
		                                                        		<option value="45">45</option>
		                                                        		<option value="50">50</option>
		                                                        		<option value="55">55</option>
		                                                        	</select>                                                               
		                                                        </div>
		                                                      </div>
		                                                      
		                                                     
		                                                     <div class="btnAddWrap form-inline">
		                                                     	<div class="form-group">
			                                                    	<button class="add_btn_plus" type="button" onclick="fnAdd();return false" title="추가"></button>
																	<!-- <button class="add_btn_minus" type="button" onclick="fnDel('0');return false" title="삭제"></button> --> 
																	
																</div>
		                                                     </div>
	                                                     </div>
                                                      </div><!-- addFileWrap -->	
                                                  </td>
                                              
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong>교육 대상</th>
                                                  <td>
                                                  	  <c:forEach var="result"  items="${mtLecTargetCode}" varStatus="status">
                                                  	  	<label class="radio-inline" for="mtLecTargetCode_${status.index}">
									            			<input type="radio" name="mtLecTargetCode" id="mtLecTargetCode_${status.index}" value="${result.MT_SUB_CODE}" <c:if test="${result.MT_SUB_CODE eq map.MT_LEC_TARGET_CODE }" >checked="checked" </c:if>>${result.MT_SUB_NAME} 
									            	  		<c:if test="${result.MT_SUB_CODE=='TG0007'}"><input type="text" name="targetEtc"  id="targetEtc" class="form-control-static mrg_l5 w160"/></c:if>
									            	  	</label>
									            	  </c:forEach>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong><label for="attd_m">참석인원</label></th>
                                                  <td>
                                                      <div class="form-inline static">
                                                          <div class="form-group">
                                                          	  <input type="text" id="personCnt" name="personCnt" class="form-control i-numOnly" title="참석인원 입력"> 명
                                                          </div>
                                                      </div>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <th scope="row"><strong class="po_C2">*</strong>교육 희망주제</th>
                                                  <td>
                                                  	  <c:forEach var="result"  items="${mtLctreCode}" varStatus="status">
                                                  	  	  <label class="checkbox-inline" for="mtLctreCodeArr_${status.index}">
									            		  <input type="checkbox" name="mtLctreCodeArr" id="mtLctreCodeArr_${status.index}" value="${result.MT_SUB_CODE}">${result.MT_SUB_NAME}
									            	 	  </label>
									            	  </c:forEach>
                                                  </td>
                                              </tr>
                                               <tr>
                                                  <th scope="row">교육 시설정보</th>
                                                  <td>
                                                  	  <c:forEach var="result"  items="${mtFclts}" varStatus="status">
                                                  	  	  <label class="checkbox-inline" for="mtFcltsCodeArr_${status.index}">
									            		  <input type="checkbox" name="mtFcltsCodeArr" id="mtFcltsCodeArr_${status.index}" value="${result.MT_SUB_CODE}">${result.MT_SUB_NAME}
									            	 	  <c:if test="${result.MT_SUB_CODE=='FA07'}"><input type="text" name="fcltsEtc"  id="fcltsEtc" class="form-control-static mrg_l5 w160"/></c:if>
									            	 	  </label>
									            	  </c:forEach>
                                                  </td>
                                              	</tr>
                                            
                                              <tr>
                                                  <th scope="row"><label for="etc_ask">기타 요청사항</label></th>
                                                  <td>
	                                                  <div class="form-inline">
	                                                      <div class="form-group full">
	                                                          <input type="text" class="form-control" id="etc" name="etc" title="기타 요청 사항"/>
	                                                      </div>
	                                                  </div>
                                                  </td>
                                              </tr>
                                          </tbody>
                                      </table>
                                  </div>

                              </fieldset>
                          </form>
                          <p class="ico_check mrg_t15">교육은 파워포인트를 이용한 강의식으로 진행되므로, 빔프로젝터/노트북 등 필요한 기자재를 준비해 주시기 바랍니다.</p>
                      </section>
					  
					  <hr>
					  
					  <section>
	                      <fieldset>
	                          <legend>개인정보 수집·이용 동의</legend>
	                          <h3 class="sub_tit">개인정보 수집 및 이용 동의</h3>
	                          <div class="borBox">
	                              <div class="terms" tabindex="0">
	                                  <!-- <h4 class="fnt15 po_C6">제1조(목적)</h4> -->
	                                  <h5 class="po_C9 fnt13">개인정보의 수집·이용 목적</h5>
	                                  <p>① 방문교육 신청, 확정, 안내 등을 위한 업무처리</p>
					  				  <p>② 교육 관련 서비스 제공 : 교육 이벤트 안내, 교육 및 진흥원 서민금융 관련 홍보·마케팅, 서민금융 정책 개발·연구 등</p>
	                                  <hr class="hr_20">
	                                  
	                                  <h5 class="po_C9 fnt13">수집 · 이용하는 개인정보의 항목</h5>
	                                  <p>가. 수집정보</p>
									  <p>필수정보 : 신청자성명, 기관명, 신청지역, 교육장소, 휴대전화, 이메일주소 </p>
									  <br/>
									  <p>선택정보</p>
									  <p>유선전화(선택정보는 입력하지 않아도 신청이 가능합니다.)</p>
									  <br/>
									  <p>나. 기타정보</p>
									  <p>서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.</p>
									  <br/>
									  <p>※ IP Address, 쿠키, 방문일시, 서비스 이용 및 제공 기록 등</p>
									  <hr class="hr_20">
									  
									  <h5 class="po_C9 fnt13">개인정보의 보유 및 이용기간</h5>
	                                  <p>상상스토리이 금융교육포털 서비스 이용과 관련하여 수집한 개인정보는 관계법령 등의 규정에 의하며 3년 간 기록·보존하고, 기간이 경과할 경우 「개인정보보호법」 등에서 
	                                  	정하는 바에 따라 파기합니다. 단, 관계법령에서 의하여 정보보유 사유가 발생한 때에는 법률에서 정한 기간 동안 정보를 보존합니다.</p>
	                                  <hr class="hr_20">
									  
									  <h5 class="po_C9 fnt13">동의 거부 권리 및 동의 거부 시 불이익</h5>
                                  	  <p>귀하는 위 개인정보 처리에 거부할 권리가 있지만, 위 개인정보 중 필수적 정보의 수집·이용에 관한 동의는 계약의 체결 및 이행을 위하여 필수적이므로, 위 사항에 동의하셔야만 위 계약의 설정 및 유지가 가능합니다. 
                                  	  	다만, 선택정보는 입력하지 않아도 무방합니다.</p>
	                                  <hr class="hr_20">
	                              </div>
	
	                              <div class="agreeCheck text-right">
	                                  <input type="checkbox" name="termAgree" id="termAgree">
	                                  <label for="termAgree">동의합니다</label>
	                              </div>
	
	                          </div>
	
	                      </fieldset>

                          <div class="btnAreaC mrg_t30">
                              <button type="button" name="button" class="btn btn-lg btn-blue" onclick="insertInfo();return false;" title="방문교육 신청">방문교육 신청</button>
                          </div>
                      </section>
					
			</div><!-- //sub-contents -->
	
		</div><!-- //sub-wrap -->
		
		<%@ include file="/WEB-INF/jsp/academy/cmmn/jsp/post_pop.jsp"%>
		
		
	</article>
</div>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
