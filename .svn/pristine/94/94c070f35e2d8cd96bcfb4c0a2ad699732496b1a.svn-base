<%--
    Description : 상상스토리 > 금융상식 test
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.07.07  이진영           최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
	function fnSave() {

		var num = $(".number");

		var radioQno = new Array(); // 문제
		var radioArr = new Array(); // 선택 한 답 
		// 설문 등록 
		$(":radio").each(function(i, val) {
			if ($(this).is(':checked')) {
				radioArr.push($(this).val());
				radioQno.push($(this).attr('radio'));
			}
		});

		if (num.length == radioQno.length) {

			$("#radioQno").val(radioQno);
			$("#radioArr").val(radioArr);

			// alert($("#radioArr").val());
			
			$('form[name=comsen]').attr('target', '_self').attr('action',
					'/classdesk/helpdesk/comsenTest_submit.do').submit();

		} else {
			alert('누락된 항목이 있습니다. \n모든 항목에 정답을 입력해주세요.');
			document.documentElement.scrollTop = 0;
		}

	}
</script>

<div class="container" id="Subcontent">
	<article class="subArea">
		<div class="subCntWrap">
<%-- 			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_helpdesk.jsp"%> --%>
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_dataRoom.jsp"%>
			<div class="path">
				<ul>
					<li><span class="home text-hide">홈</span></li>
					<li>알림마당</li>
					<li class="active">금융상식 TEST</li>
				</ul>
			</div>
			<div class="subConts" id="sub-content">
				<section class="bgTop_cate04"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">금융상식 TEST</h2>
            		</div>           	
	            </section>

				<section>
					<form name="comsen" id="comsen"
						action="/classdesk/helpdesk/comsenTest_submit.do" method="post">

						<input type="hidden" name="radioQno" id="radioQno" />
						<!-- 문제 -->
						<input type="hidden" name="radioArr" id="radioArr" />
						<!-- 선택한 답 -->

						<hr>

						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">1</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[재무설계]</span> 재무설계의 우선순위를 결정하는 요인이 아닌 것은 무엇입니까?

									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="testA01" id="testA01_1"radio="1"value="1"><label for="testA01_1">개인의 가치관이나 생활철학 등 주관적인 판단에 따라 달라진다.</label></li>
									<li><input type="radio" name="testA01" id="testA01_2"radio="1"value="2"><label for="testA01_2">본인이나 가족이 어느 연령대에 속하는가에 따라 달라진다.</label></li>
									<li><input type="radio" name="testA01" id="testA01_3"radio="1" value="3"><label for="testA01_3">가까운 미래보다 먼 미래에 필요한 과제를 우선순위로 두어야 한다.</label></li>
									<li><input type="radio" name="testA01" id="testA01_4"radio="1"value="4"><label for="testA01_4">재무설계의 우선순위는 절대적인 것이 아니므로 수시로 수정·보완되어야 한다.</label></li>
								</ul>
							</div>
						</div>
						
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">2</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[재무설계] </span> 수입·지출관리를 위한 구체적인 실천방법이 아닌 것은 무엇입니까?
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="testA02" id="testA02_1"radio="1"value="1"><label for="testA02_1">가계부를 작성한다.</label></li>
										<li><input type="radio" name="testA02" id="testA02_2"radio="1"value="2"><label for="testA02_2">반드시 현금만을 사용한다.</label></li>
										<li><input type="radio" name="testA02" id="testA02_3"radio="1" value="3"><label for="testA02_3">체크카드를 이용한다.</label></li>
										<li><input type="radio" name="testA02" id="testA02_4"radio="1"value="4"><label for="testA02_4">현금영수증을 등록한다.</label></li>
									</ul>
								</div>
							</div>
						
						 <hr>
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">3</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[재무설계]</span> 체크카드를 이용할 경우의 장점이 아닌 것은 무엇입니까?
									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="testA03" id="testA03_1"radio="3" value="1"><label for="testA03_1">소득공제율이 신용카드보다 높아 연말정산 시 추가적인 세금혜택을 받을 수 있다.</label></li>
									<li><input type="radio" name="testA03" id="testA03_2"radio="3"value="2"><label for="testA03_2">연회비를 조금만 부담하면, 신용카드와 비슷한 부가서비스 혜택을 받는다.</label></li>
									<li><input type="radio" name="testA03" id="testA03_3"radio="3"value="3"><label for="testA03_3">미래의 소비를 미리 당겨쓰는 무분별한 소비를 줄일 수 있다.</label></li>
									<li><input type="radio" name="testA03" id="testA03_4"radio="3"value="4"><label for="testA03_4">발급이 쉽고, 현금잔고 내에서 이용하기 때문에 규모 있는 지출계획을 세울 수 있다.</label></li>
								</ul>
							</div>
						</div>
						<hr>
						
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">4</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[저축과 소비]</span> 기존 대출이자를 낮추는 금리인하요구권에 해당하는 조건이 아닌 것은 무엇입니까?
									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="testA04" id="testA04_1" radio="4" value="1"> <label for="testA04_1">연소득이 크게 증가한 경우</label></li>
									<li><input type="radio" name="testA04" id="testA04_2" radio="4" value="2"> <label for="testA04_2">직장 내에서 직위가 상승한 경우</label></li>
									<li><input type="radio" name="testA04" id="testA04_3" radio="4" value="3"> <label for="testA04_3">신용등급이 상향된 경우 </label></li>
									<li><input type="radio" name="testA04" id="testA04_4" radio="4" value="4"> <label for="testA04_4">국가경제가 어려워진 경우</label></li>
								</ul>
							</div>
						</div>
						<hr>
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">5</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[저축과 소비]</span> 저축을 해야 하는 이유가 아닌 것은 무엇입니까?
									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="testA05" id="testA05_1"radio="5" value="1"> <label for="testA05_1">뜻밖의 사고에 대비할 수 있다.</label></li>
									<li><input type="radio" name="testA05" id="testA05_2"radio="5" value="2"> <label for="testA05_2">소득이 줄거나 끊기는 장래에 대비할 수 있다.</label></li>
									<li><input type="radio" name="testA05" id="testA05_3"radio="5" value="3"><label for="testA05_3">이자와 저축이 증가하는 것을 맛볼 수 있다.</label></li>
									<li><input type="radio" name="testA05" id="testA05_4"radio="5" value="4"> <label for="testA05_4">일을 스스로 할 수 있는 능력을 가질 수 있게 된다.</label></li>
								</ul>
							</div>
						</div>
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">6</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[저축과 소비] </span> 금융지능지수(FQ)가 뜻하는 것이 아닌 것은 무엇입니까?
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="testA06" id="testA06_1"radio="5" value="1"> <label for="testA06_1">자신이 소유한 금융지식을 자각한다.</label></li>
										<li><input type="radio" name="testA06" id="testA06_2"radio="5" value="2"> <label for="testA06_2">충동적인 결론을 제어한다.</label></li>
										<li><input type="radio" name="testA06" id="testA06_3"radio="5" value="3"><label for="testA06_3">지능 및 감성지수가 출중하다.</label></li>
										<li><input type="radio" name="testA06" id="testA06_4"radio="5" value="4"> <label for="testA06_4">합리적인 선택을 할 수 있다.</label></li>
									</ul>
								</div>
							</div>
						
						<hr>
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">7</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[저축과 소비]</span> 금리가 오르면, 채권가격은 어떻게 될까요?

									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="testA07" id="testA07_1"radio="7" value="1"> <label for="testA07_1">오른다.</label></li>
									<li><input type="radio" name="testA07" id="testA07_2"radio="7" value="2"> <label for="testA07_2">변함 없다.</label></li>
									<li><input type="radio" name="testA07" id="testA07_3"radio="7" value="3"><label for="testA07_3">내린다.</label></li>
								</ul>
							</div>
						</div>
						<hr>
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">8</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[저축과 소비]</span> 이자율이 가장 낮은 금융상품은 무엇입니까?
									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="testA08" id="testA08_1"radio="8" value="1"> <label for="testA08_1">보통예금</label></li>
									<li><input type="radio" name="testA08" id="testA08_2"radio="8" value="2"> <label for="testA08_2">정기예금</label></li>
									<li><input type="radio" name="testA08" id="testA08_3"radio="8" value="3"><label for="testA08_3">정기적금</label></li>
									
								</ul>
							</div>
						</div>
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">9</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[저축과 소비] </span> 합리적인 소비와 선택을 위한 방법이 아닌 것은 무엇입니까?
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="testA09" id="testA09_1"radio="5" value="1"> <label for="testA09_1">싼 물건이라면 우선 사고 본다.</label></li>
										<li><input type="radio" name="testA09" id="testA09_2"radio="5" value="2"> <label for="testA09_2">사고 싶은 물건이 현재 자산의 소득으로 유지할 수 있는지 확인한다.</label></li>
										<li><input type="radio" name="testA09" id="testA09_3"radio="5" value="3"> <label for="testA09_3">사기 전에 좀더 저렴한 판매처가 있는지 알아본다.</label></li>
										<li><input type="radio" name="testA09" id="testA09_4"radio="5" value="4"> <label for="testA09_4">사고 싶은 물건이 반드시 필요한 것인지 더 생각해본다.</label></li>
									</ul>
								</div>
							</div>
						
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">10</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[부채관리] </span> 대출과 관련하여 틀린 것은 무엇입니까?
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="testA010" id="testA010_1"radio="5" value="1"> <label for="testA010_1">대출을 적절하게 활용하면 경제적능력을 확장하는 효과가 있다.</label></li>
										<li><input type="radio" name="testA010" id="testA010_2"radio="5" value="2"> <label for="testA010_2">채무불이행이 되면 신용하락의 위험도 커진다.</label></li>
										<li><input type="radio" name="testA010" id="testA010_3"radio="5" value="3"><label for="testA010_3">대출에는 그만큼 비용과 책임 따른다.</label></li>
										<li><input type="radio" name="testA010" id="testA010_4"radio="5" value="4"> <label for="testA010_4">신용과 대출은 상관관계가 높지 않다.</label></li>
									</ul>
								</div>
							</div>
						
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">11</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[부채관리] </span> 현명하게 돈 빌리는 방법과 관계 없는 것은 무엇입니까?
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="testA011" id="testA011_1"radio="5" value="1"> <label for="testA011_1">금리 인상기에는 변동금리를 선택한다.</label></li>
										<li><input type="radio" name="testA011" id="testA011_2"radio="5" value="2"> <label for="testA011_2">대출목적이 단순히 소비를 늘리기 위한 것인지 곰곰이 생각해본다.</label></li>
										<li><input type="radio" name="testA011" id="testA011_3"radio="5" value="3"><label for="testA011_3">향후 현금흐름을 감안하여 적정한 대출규모를 정한다.</label></li>
										<li><input type="radio" name="testA011" id="testA011_4"radio="5" value="4"> <label for="testA011_4">대출비용을 최대한 낮추도록 한다.</label></li>
									</ul>
								</div>
							</div>
						
						<hr>
						
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">12</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[부채관리]</span>  올바른 신용카드 쓰기와 관계 없는 것은 무엇입니까?
									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="testA012" id="testA012_1"radio="12" value="1"> <label for="testA012_1">신용카드는 가급적 보유 개수를 제한하는 것이 바람직하다.</label></li>
									<li><input type="radio" name="testA012" id="testA012_2"radio="12" value="2"> <label for="testA012_2">신용카드를 발급 받을 때는 만일의 사태에 대비해 한도를 최대한 높여야 한다.</label></li>
									<li><input type="radio" name="testA012" id="testA012_3"radio="12" value="3"><label for="testA012_3">신용카드를 대여하거나 보관에 과실이 있는 경우 책임이 있다.</label></li>
									<li><input type="radio" name="testA012" id="testA012_4"radio="12" value="4"> <label for="testA012_4">신용카드는 받는 즉시 카드 뒷면에 서명하여야 한다.</label></li>
								</ul>
							</div>
						</div>
						
						<hr>
						
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">13</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[부채관리]</span>  일정기간 이자만 내다가 그 기간이 지나면 원금을 함께 갚아나가는 방식은 무엇입니까?
									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="testA013" id="testA013_1"radio="13" value="1"> <label for="testA013_1">만기 일시 상환식</label></li>
									<li><input type="radio" name="testA013" id="testA013_2"radio="13" value="2"> <label for="testA013_2">거치식</label></li>
									<li><input type="radio" name="testA013" id="testA013_3"radio="13" value="3"><label for="testA013_3">원리금 균등 분할식</label></li>
									<li><input type="radio" name="testA013" id="testA013_4"radio="13" value="4"><label for="testA013_4">원금 균등 분할식</label></li>
								</ul>
							</div>
						</div>
						
						<hr>
						
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">14</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[부채관리] </span> 불법인 채권추심행위가 아닌 것은 무엇입니까?
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
									<li><input type="radio" name="testA014" id="testA014_1"radio="13" value="1"> <label for="testA014_1">야간에 채무자나 관계인을 방문하여 평온을 심하게 해치는 경우</label></li>
									<li><input type="radio" name="testA014" id="testA014_2"radio="13" value="2"> <label for="testA014_2">채무자를 감금하거나 위계나 위력을 사용하는 경우</label></li>
									<li><input type="radio" name="testA014" id="testA014_3"radio="13" value="3"><label for="testA014_3">채무자 외의 사람에게 채무에 관한 사실을 알리는 경우</label></li>
									<li><input type="radio" name="testA014" id="testA014_4"radio="13" value="4"><label for="testA014_4">다수인이 모인 장소에서 채무자 외의 사람에게 채무에 관한 사항을 공연히 알리는 경우</label></li>
								</ul>
								</div>
							</div>
						
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">15</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[부채관리] </span> 효율적인 대출상환 전략이 아닌 것은 무엇입니까?
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="testA015" id="testA015_1"radio="13" value="1"> <label for="testA015_1"> 먼저 연체한 대출부터 상환한다.</label></li>
										<li><input type="radio" name="testA015" id="testA015_2"radio="13" value="2"> <label for="testA015_2">대출잔액이 큰 대출부터 상환한다.</label></li>
										<li><input type="radio" name="testA015" id="testA015_3"radio="13" value="3"><label for="testA015_3">상환기일이 일찍 도래하는 대출부터 상환한다.</label></li>
										<li><input type="radio" name="testA015" id="testA015_4"radio="13" value="4"><label for="testA015_4">여러 대출을 단순화하고 이자율이 높은 대출부터 상환한다.</label></li>
									</ul>
								</div>
							</div>
						
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">16</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[신용관리] </span> 다음 중 신용등급에 관한 설명으로 올바른 것은 무엇인가?   
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="testA016" id="testA016_1"radio="13" value="1"> <label for="testA016_1">신용카드를 많이 발급받으면 신용등급에 악영향을 미친다.</label></li>
										<li><input type="radio" name="testA016" id="testA016_2"radio="13" value="2"> <label for="testA016_2">개인소득이 높은 경우 신용등급에 좋은 영향을 미친다. </label></li>
										<li><input type="radio" name="testA016" id="testA016_3"radio="13" value="3"><label for="testA016_3">연체를 상환하는 즉시 신용등급이 회복된다.</label></li>
										<li><input type="radio" name="testA016" id="testA016_4"radio="13" value="4"><label for="testA016_4">통신요금, 공공요금(전기,수도 등)을 성실히 납부하면 신용등급 향상에 도움이 된다.</label></li>
									</ul>
								</div>
							</div>
						
						<hr>
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">17</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[신용관리]</span>  신용은 단기간에 나빠지기는 쉬우나, 단기간에 좋아지는 것은 어렵다. 
									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="choice_o17" id="choice_o17"radio="17" value="1" title="답변 o"> <label for="choice_o17"> O<span class="hidden">O</span></label></li>
									<li><input type="radio" name="choice_o17" id="choice_x17"radio="17" value="2" title="답변 x"> <label for="choice_x17"> X <span class="hidden">X</span></label></li>
								</ul>
							</div>
						</div>
						<hr>
						<div class="borBox">
							<div class="textQ">
								<div class="test_num bold number">18</div>
								<div class="txt_Q">
									<p class="bold fnt16">
										<span class="po_C4">[신용관리]</span>  신용카드 이용금액의 일부만 결제하고 나머지 금액은 다음달로 이월시키는 리볼빙결제는 부득이한 경우에만 단기간 이용하는 것이 좋다.  
									</p>
								</div>
							</div>
							<div class="testA">
								<ul class="ul_radio">
									<li><input type="radio" name="choice_o18" id="choice_o18"radio="18" value="1" title="답변 o"> <label for="choice_o18"> O<span class="hidden">O</span></label></li>
									<li><input type="radio" name="choice_o18" id="choice_x18"radio="18" value="2" title="답변 x"> <label for="choice_x18"> X <span class="hidden">X</span></label></li>
								</ul>
							</div>
						</div>
						
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">19</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[금융사기 예방] </span> 다음 중 전형적인 대출사기의 유형이 아닌 것은 무엇인가? 
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="testA019" id="testA019_1"radio="13" value="1"> <label for="testA019_1">기존의 대출을 저금리 대출로 전환해준다며 중개수수료를 요구하는 경우 </label></li>
										<li><input type="radio" name="testA019" id="testA019_2"radio="13" value="2"> <label for="testA019_2">대출 부적격자에게 신용등급을 조정해주겠다며 선이자를 요구하는 경우 </label></li>
										<li><input type="radio" name="testA019" id="testA019_3"radio="13" value="3"><label for="testA019_3">대출시 채무불이행에 대비한 부대비용을 요구하는 경우</label></li>
										<li><input type="radio" name="testA019" id="testA019_4"radio="13" value="4"><label for="testA019_4">금융기관에서 대출에 필요한 각종 서류를 요구하는 경우</label></li>
									</ul>
								</div>
							</div>
						
						<hr>
						
							<div class="borBox">
								<div class="textQ">
									<div class="test_num bold number">20</div>
									<div class="txt_Q">
										<p class="bold fnt16">
											<span class="po_C4">[금융사기 예방] </span> 채권자가 채무자에게 동의를 받지 않은 채권추심은 불법이다.  
										</p>
									</div>
								</div>
								<div class="testA">
									<ul class="ul_radio">
										<li><input type="radio" name="choice_o20" id="choice_o20"radio="20" value="1" title="답변 o"> <label for="choice_o20"> O<span class="hidden">O</span></label></li>
										<li><input type="radio" name="choice_o20" id="choice_x20"radio="20" value="2" title="답변 x"> <label for="choice_x20"> X <span class="hidden">X</span></label></li>
									</ul>
								</div>
							</div>
						

						<hr>
						<div class="btnAreaC">
							<button type="button" name="button"
								onclick="fnSave();return false" class="btn btn-lg btn-blue w130" style="padding: 6px 12px;" title="TEST 결과 보기">TEST 결과 보기</button>
						</div>

					</form>
				</section>

			</div>
		</div>
	</article>
</div>

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->