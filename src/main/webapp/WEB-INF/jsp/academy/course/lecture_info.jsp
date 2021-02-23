<%
/****************************************************
	system	: 대출의무 과정소개
	title	: 일반과정 신청 및 수강안내 목록
	summary	:	
	wdate	: 2017-06-22
	writer	: 이진영 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<script type="text/javascript">

//파일다운로드
function filedown(fname,orgFile){
	$('#filename').val(encodeURIComponent(fname));
	$('#fileName').val(encodeURIComponent(orgFile));
	$('form[name=frm]').attr('action', '/academy/filedown.do').submit();
}
</script>
<form name="frm" id="frm" action="/academy/filedown.do"  method="post">
						<input type="hidden" name="downDir" id="downDir" value=""/>
						<input type="hidden" name="broDown" id="broDown" value="Y"/>
						<input type="hidden" name="filename" id="filename" value="special_lecture_info.pdf"/>
						<input type="hidden" name="ftype" id="ftype" value="bro"/>
						<input type="hidden" name="saveFilePath" id="saveFilePath" value=""/>
						<input type="hidden" name="orgFileNm" id="orgFileNm" value=""/>
</form>
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_lecture.jsp"%>
            <div class="path">
                <ul>
                    <li><span class="home text-hide">홈</span></li>
                    <li>방문교육</li>
                    <li class="active">교육 안내</li>
                </ul>
            </div>
            <div class="subConts" id="sub-content">
            
            	<section class="bgTop_cate03"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">교육 안내</h2>
            		</div>           	
	            </section>

				<section>
                    <div class="borBoxW3">
                        <ul class="li_dash">
                            <li class="po_C7 fnt15"><strong>상상스토리</strong>에서는 서민의 금융이해력 제고를 위한 <strong class="po_C10">‘찾아가는 금융교육’</strong>을 실시합니다.</li>
                        </ul>
                        <p class="mrg_l10">※ 신청정보 조회를 위해서는 회원가입이 필요합니다.</p>
                    </div>
                </section>
             	<!-- <p class="a_file rbltopTxt"><a class="a_file" title="첨부파일 다운로드" href="javascript:sampleFileDown();">방문교육 안내 브로셔 다운로드</a></p> -->
               
               <div class="text-right">
                  <a title="안내자료 다운로드" href="#" class="btn btn-sm btn-default mrg_t15" onclick="filedown('special_lecture_info.pdf','special_lecture_info.pdf')">안내자료 다운로드 &nbsp;
                    <button type="button" class="addfile" title="파일다운로드" ><span class="text-hide">파일다운로드</span></button>
                  </a>
                </div>
                <hr>
               <section>
                                <h3 class="main_tit">과정소개</h3>
                                <div class="borBoxW4">
                                  <ul>
                                    <li>
                                      <img src="../../../academy/images/sub/c-img01.png" alt="교육대상 이미지">
                                      <div class="t_area">
                                        <h2>교육대상</h2>
                                        <span>서민 등 금융교육이 필요한 모든 계층</span>
                                      </div>
                                    </li>
                                    <li>
                                      <img src="../../../academy/images/sub/c-img02.png" alt="교육시간 이미지">
                                      <div class="t_area">
                                        <h2>교육시간</h2>
                                        <span>보통 1회 교육에 1~2시간 정도 소요</span>
                                      </div>
                                    </li>
                                    <li>
                                      <img src="../../../academy/images/sub/c-img03.png" alt="교육내용 이미지">
                                      <div class="t_area">
                                        <h2>교육내용</h2>
                                        <span>총 9개 주제를 바탕으로 신청기관과 협의하여 최종 결정</span>
                                      </div>
                                    </li>
                                    <li>
                                      <img src="../../../academy/images/sub/c-img04.png" alt="교육방식 이미지">
                                      <div class="t_area">
                                        <h2>교육방식</h2>
                                        <span>교육 신청기관에 대한 방문 교육을 원칙으로 하며, 신청기관과의 협의 하에 교육방식을 결정</span>
                                      </div>
                                    </li>
                                    <li>
                                      <img src="../../../academy/images/sub/c-img05.png" alt="강사 이미지">
                                      <div class="t_area">
                                        <h2>강사</h2>
                                        <span>금융회사 업무 경력 10년 이상, 다수의 금융강의 경험을 보유한 전문가</span>
                                      </div>
                                    </li>
                                    <li>
                                      <img src="../../../academy/images/sub/c-img06.png" alt="교육특징 이미지">
                                      <div class="t_area">
                                        <h2>교육특징</h2>
                                        <ul>
                                          <li><div class="cir_num">1</div>교육대상자 특성을 반영한 실용적인 맞춤형 금융교육</li>
                                          <li><div class="cir_num">2</div>서민금융에 대한 전문적인 콘텐츠와 전문가 보유</li>
                                          <li><div class="cir_num">3</div>참석인원 20명 이상 시 교육개설이 가능</li>
                                        </ul>
                                      </div>
                                    </li>
                                  </ul>
                                </div>
                            </section>
              <!--   <section>
                    <h3 class="main_tit">교육 안내</h3>
                    <h4 class="sub_tit mrg_t20">교육 대상</h4>
                    <p class="h4_cont">서민, 금융취약계층, 청년.대학생, 어르신, 군인 등 금융교육이 필요한 모든 계층</p>
                    <h4 class="sub_tit mrg_t20">교육 시간</h4>
                    <p class="h4_cont">보통 1회 교육에 1~2시간 정도 소요</p>
                    <h4 class="sub_tit mrg_t20">교육 내용</h4>
                    <p class="h4_cont">총 9개 주제를 바탕으로 신청기관과 협의하여 최종 결정</p>
                    <h4 class="sub_tit mrg_t20">교육 방식</h4>
                    <p class="h4_cont">교육 신청기관에 대한 방문 교육을 원칙으로 하며, 신청기관과의 협의 하에 교육방식을 결정</p>
                    <h4 class="sub_tit mrg_t20">강사</h4>
                    <p class="h4_cont">금융회사 업무 경력 10년 이상, 다수의 금융강의 경험을 보유한 전문가</p>
                    <h4 class="sub_tit mrg_t20">교육 특징</h4>
                    <ul class="h4_cont">
                        <li>① 교육대상자 특성을 반영한 실용적인 맞춤형 금융교육</li>
                        <li>② 서민금융에 대한 전문적인 콘텐츠와 전문가 보유</li>
                        <li>③ 참석인원 15명 이상 시 교육개설이 가능</li>
                    </ul>
                </section> -->

                <hr class="mrg_t20">
                <section>
                    <h3 class="main_tit">교육주제</h3>
                    <div class="tblWrap">
                        <table class="dataTbl2 text-center">
                            <caption>과정소개(과목,교육목적,주요내용)</caption>
                            <colgroup>
                                <col style="width:10%">
                                <col style="width:25%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">주제</th>
                                    <th scope="col">주요내용</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <span>1</span>
                                    </td>
                                    <td>
                                        <span>재무설계</span>
                                    </td>
                                    <td class="text-left">
                                        <ul class="li_dash">
                                            <li>재무설계의 필요성, 인생설계와 재무설계, 재무설계 방법</li>
                                        </ul>
                                        <!-- <div class="mrg_b5"><a href="" class="btn btn-default bold">세부 내용 확인<span class="icon arr_rig"></span></a></div> -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>2</span>
                                    </td>
                                    <td>
                                        <span>저축과소비</span>
                                    </td>
                                    <td class="text-left">
                                        <ul class="li_dash">
                                            <li>어떤 저축을 선택할까?, 노후자금 저축액, 나의 소비진단</li>
                                            <li>지출 계획표 / 인생 가계부 쓰기, 합리적 소비와 선택</li>
                                        </ul>
                                       <!--  <div class="mrg_b5"><a href="" class="btn btn-default bold">세부 내용 확인<span class="icon arr_rig"></span></a></div> -->
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>3</span>
                                    </td>
                                    <td>
                                        <span>부채관리</span>
                                    </td>
                                    <td class="text-left">
                                        <ul class="li_dash">
                                            <li>대출받을 때 따져봐야 할 것, 주의사항</li>
                                            <li>서민을 위한 금융상품, 나의 부채 수준 진단</li>
                                            <li>신용카드 잘 활용하기</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>4</span>
                                    </td>
                                    <td>
                                        <span>신용관리</span>
                                    </td>
                                    <td class="text-left">
                                        <ul class="li_dash">
                                            <li>신용상태 진단, 신용의 정의와 필요성</li>
                                            <li>신용평가 반영요소, 개인신용관리 10계명</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>5</span>
                                    </td>
                                    <td>
                                        <span>금융사기예방</span>
                                    </td>
                                    <td class="text-left">
                                        <ul class="li_dash">
                                            <li>사금융거래시 유의사항, 불법사금융 피해예방</li>
                                            <li>불법채권추심, 보이스피싱 대응, 금융사기 피해사례</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>6</span>
                                    </td>
                                    <td>
                                        <span>서민금융의이해</span>
                                    </td>
                                    <td class="text-left">
                                        <ul class="li_dash">
                                            <li>서민금융제도 이용</li>
                                            <li>채무구제제도 안내</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>7</span>
                                    </td>
                                    <td>
                                        <span>생활&middot;복지</span>
                                    </td>
                                    <td class="text-left">
                                        <ul class="li_dash">
                                            <li>재무&middot;신용 문제가 있을 때, 생계 유지, 생활위기, 주택문제</li>
                                            <li>일자리 지원, 임신출산 지원, 장학금 제도, 의료, 노후준비, 생활법률 등</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>8</span>
                                    </td>
                                    <td>
                                        <span>창업금융</span>
                                    </td>
                                    <td class="text-left">
                                        <ul class="li_dash">
                                            <li>창업의 절차, 사업 아이템 선정 및 상권분석, 사업타당성 분석과 사업게획서 작성, <br/>서민금융 및 창업금융 안내</li>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
				
               <hr class="mrg_t20"> 
               <section>
                    <h3 class="main_tit">진행과정</h3>
                    
                    <div class="newStep">
                        <ul class="step5">
                            <li>
                                <div class="step01">
                                    <div>교육 협의</div>                                    
                                </div>
                            </li>
                            <li class="li_arr"></li>
                            <li>
                                <div class="step02">
                                    <div>신청 및 확정</div>                                    
                                </div>
                            </li>
                            <li class="li_arr"></li>
                            <li>
                                <div class="step03">
                                    <div>교육 준비</div>                                    
                                </div>
                            </li>
                            <li class="li_arr"></li>
                            <li>
                                <div class="step04">
                                    <div>교육 실시</div>                                    
                                </div>
                            </li>  
                            <li class="li_arr"></li>                          
                            <li>
                                <div class="step05">
                                    <div>확인</div>                                    
                                </div>
                            </li> 
                            
                        </ul>
                    </div>
                </section>
				
				<div class="btnAreaC mrg_t30">
                    <a href="/academy/course/lectureForm.do"class="btn btn-lg btn-blue" title="방문교육신청">방문교육 신청</a>
                </div>
            </div>
        </div>
    </article>
</div>
	
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->