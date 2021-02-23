<%--
    Description : 상상스토리 > 금융상식 test
     
    Modification Information
  	 수정일     		수정자         수정내용
    -------     -----------------------------------
    2016.07.07  이진영           최초작성

--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>

<script type="text/javascript">
$(function (){
});


function fnSave(){
	
	location.href="/academy/helpdesk/comsenTestList.do";
	
}	

</script>
		
<div class="container" id="Subcontent">
    <article class="subArea">
        <div class="subCntWrap">
            
<%--             <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_helpdesk.jsp"%> --%>
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
			
            
            <c:set var="result" value="0" /> <!-- 맞춘 개수 -->
            <c:set var="test1" value="${tmpRadioArr[0]}" />
            <c:set var="test2" value="${tmpRadioArr[1]}" />
            <c:set var="test3" value="${tmpRadioArr[2]}" />
            <c:set var="test4" value="${tmpRadioArr[3]}" />
            <c:set var="test5" value="${tmpRadioArr[4]}" />
            <c:set var="test6" value="${tmpRadioArr[5]}" />
            <c:set var="test7" value="${tmpRadioArr[6]}" />
            <c:set var="test8" value="${tmpRadioArr[7]}" />
            <c:set var="test9" value="${tmpRadioArr[8]}" />
            <c:set var="test10" value="${tmpRadioArr[9]}" />
            <c:set var="test11" value="${tmpRadioArr[10]}" />
            <c:set var="test12" value="${tmpRadioArr[11]}" />
            <c:set var="test13" value="${tmpRadioArr[12]}" />
            <c:set var="test14" value="${tmpRadioArr[13]}" />
            <c:set var="test15" value="${tmpRadioArr[14]}" />
            <c:set var="test16" value="${tmpRadioArr[15]}" />
            <c:set var="test17" value="${tmpRadioArr[16]}" />
            <c:set var="test18" value="${tmpRadioArr[17]}" />
            <c:set var="test19" value="${tmpRadioArr[18]}" />
            <c:set var="test20" value="${tmpRadioArr[19]}" />
            
            <section>
            	
                <h3 class="bdrTit mrg_b30">금융상식TEST 결과</h3>
 				
 				<div class="bigRbar" id="report">
                </div>
 				<hr/>
				
				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">1</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[재무설계]</span> 재무설계의 우선순위를 결정하는 요인이 아닌 것은 무엇입니까?
                        </div>
                        	<c:choose>
								<c:when test="${test1 eq '3'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
	               
					<div class="testA">
			                        <ul class="ul_radio">
			                        <c:if test="${test1 eq '1'}">
			                            <li><input type="radio" disabled="disabled" name="testA01" id="testA01_1" radio="1" checked="checked"  value="1"> <label for="testA01_1">개인의 가치관이나 생활철학 등 주관적인 판단에 따라 달라진다.</label></li>
			                        </c:if>
			                        <c:if test="${test1 ne '1'}">
			                            <li><input type="radio" disabled="disabled" name="testA01" id="testA01_2" radio="1"  value="1"> <label for="testA01_2">개인의 가치관이나 생활철학 등 주관적인 판단에 따라 달라진다.</label></li>
			                        </c:if>
			                        <c:if test="${test1 eq '2'}">     
			                            <li><input type="radio" disabled="disabled" name="testA01" id="testA01_3" radio="1"  checked="checked" value="2"> <label for="testA01_3">본인이나 가족이 어느 연령대에 속하는가에 따라 달라진다.</label></li>
			                        </c:if>
			                        <c:if test="${test1 ne '2'}">     
			                            <li><input type="radio" disabled="disabled" name="testA01" id="testA01_4" radio="1"  value="2"> <label for="testA01_4">본인이나 가족이 어느 연령대에 속하는가에 따라 달라진다.</label></li>
			                        </c:if>     
			                        <c:if test="${test1 eq '3'}">     
			                            <li><input type="radio" disabled="disabled" name="testA01" id="testA01_5" checked="checked" radio="1" value="3"><label for="testA01_5">가까운 미래보다 먼 미래에 필요한 과제를 우선순위로 두어야 한다.</label></li>
			                        </c:if>    
			                        <c:if test="${test1 ne '3'}">
			                        	<li><input type="radio" disabled="disabled" name="testA01" id="testA01_6" radio="1" value="3"><label for="testA01_6">가까운 미래보다 먼 미래에 필요한 과제를 우선순위로 두어야 한다.</label></li>
			                        </c:if>    
			                         <c:if test="${test1 eq '4'}"> 
										 <li><input type="radio" disabled="disabled" name="testA01" id="testA01_7" checked="checked" radio="1" value="4"> <label for="testA01_7">재무설계의 우선순위는 절대적인 것이 아니므로 수시로 수정·보완되어야 한다.</label></li>			     	                    
			                         </c:if>
			                         <c:if test="${test1 ne '4'}"> 
			                            <li><input type="radio" disabled="disabled" name="testA01" id="testA01_8" radio="1" value="4"> <label for="testA01_8">재무설계의 우선순위는 절대적인 것이 아니므로 수시로 수정·보완되어야 한다.</label></li>
			                         </c:if>
			                        </ul>
			                    </div>
							
                    
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 가까운 미래보다 먼 미래에 필요한 과제를 우선순위로 두어야 한다. <br>
							<span class="po_C2 pad_r5">해설</span> 먼 미래보다는 가까운 미래에 대한 것을 우선순위로 하는 것이 좋습니다. 
						</p>
					</div>
                    
                </div>
				
				
				<hr>
				
			
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">2</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[재무설계] </span> 수입·지출관리를 위한 구체적인 실천방법이 아닌 것은 무엇입니까?

							</div>
							 <c:choose>
								<c:when test="${test2 eq '2'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
		                    
									<div class="testA">
										<ul class="ul_radio">
			                        <c:if test="${test2 eq '1'}">
			                            <li><input type="radio" disabled="disabled" name="ex2" id="ex_1_1" radio="1" checked="checked"  value="1"> <label for="ex_1_1">개인의 가치관이나 생활철학 등 주관적인 판단에 따라 달라진다.</label></li>
			                        </c:if>
			                        <c:if test="${test2 ne '1'}">
			                            <li><input type="radio" disabled="disabled" name="ex2" id="ex_1_2" radio="1"  value="1"> <label for="ex_1_2">개인의 가치관이나 생활철학 등 주관적인 판단에 따라 달라진다.</label></li>
			                        </c:if>
			                        <c:if test="${test2 eq '2'}">     
			                            <li><input type="radio" disabled="disabled" name="ex2" id="ex_1_3" radio="1"  checked="checked" value="2"> <label for="ex_1_3">본인이나 가족이 어느 연령대에 속하는가에 따라 달라진다.</label></li>
			                        </c:if>
			                        <c:if test="${test2 ne '2'}">     
			                            <li><input type="radio" disabled="disabled" name="ex2" id="ex_1_4" radio="1"  value="2"> <label for="ex_1_4">본인이나 가족이 어느 연령대에 속하는가에 따라 달라진다.</label></li>
			                        </c:if>     
			                        <c:if test="${test2 eq '3'}">     
			                            <li><input type="radio" disabled="disabled" name="ex2" id="ex_1_5" radio="1" checked="checked" value="3"><label for="ex_1_5">가까운 미래보다 먼 미래에 필요한 과제를 우선순위로 두어야 한다.</label></li>
			                        </c:if>    
			                        <c:if test="${test2 ne '3'}">
			                        	<li><input type="radio" disabled="disabled" name="ex2" id="ex_1_6" radio="1" value="3"><label for="ex_1_6">가까운 미래보다 먼 미래에 필요한 과제를 우선순위로 두어야 한다.</label></li>
			                        </c:if>    
			                         <c:if test="${test2 eq '4'}"> 
										 <li><input type="radio" disabled="disabled" name="ex1" id="ex_1_7" radio="1" checked="checked" value="4"> <label for="ex_1_7">재무설계의 우선순위는 절대적인 것이 아니므로 수시로 수정·보완되어야 한다.</label></li>			     	                    
			                         </c:if>
			                         <c:if test="${test2 ne '4'}"> 
			                            <li><input type="radio" disabled="disabled" name="ex2" id="ex_1_8" radio="1" value="4"> <label for="ex_1_8">재무설계의 우선순위는 절대적인 것이 아니므로 수시로 수정·보완되어야 한다.</label></li>
			                         </c:if>
			                        </ul>
									</div>
							
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 반드시 현금만을 사용한다. <br>
							<span class="po_C2 pad_r5">해설</span> 본인의 재정상태에 맞게 신용카드, 체크카드, 현금 등을 적절하게 사용하는 것이 필요합니다.
						</p>
						</div>
					</div>
              

				<hr>

				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">3</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[재무설계]</span> 체크카드를 이용할 경우의 장점이 아닌 것은 무엇입니까?

                        </div>
                        	<c:choose>
								<c:when test="${test3 eq '2'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
	              
								<div class="testA">
			                        <ul class="ul_radio">
			                        	<c:if test="${test3 eq '1'}">
			                            	<li><input type="radio" name="testA03" id="testA01_3_1" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA01_3_1">소득공제율이 신용카드보다 높아 연말정산 시 추가적인 세금혜택을 받을 수 있다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test3 ne '1'}">
			                            	<li><input type="radio" name="testA03" id="testA01_3_2" radio="1" disabled="disabled" value=""> <label for="testA01_3_2">소득공제율이 신용카드보다 높아 연말정산 시 추가적인 세금혜택을 받을 수 있다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test3 eq '2'}">
			                           		 <li><input type="radio" name="testA03" id="testA01_3_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA01_3_3">연회비를 조금만 부담하면, 신용카드와 비슷한 부가서비스 혜택을 받는다.</label></li>
			                            </c:if>
			                            <c:if test="${test3 ne '2'}">
			                            	 <li><input type="radio" name="testA03" id="testA01_3_4" radio="1" disabled="disabled" value=""> <label for="testA01_3_4">연회비를 조금만 부담하면, 신용카드와 비슷한 부가서비스 혜택을 받는다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test3 eq '3'}">
			                            	<li><input type="radio" name="testA03" id="testA01_3_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA01_3_5">미래의 소비를 미리 당겨쓰는 무분별한 소비를 줄일 수 있다.</label></li>
			                            </c:if>
			                            <c:if test="${test3 ne '3'}">
			                            	<li><input type="radio" name="testA03" id="testA01_3_6" radio="1" disabled="disabled" value=""><label for="testA01_3_6">미래의 소비를 미리 당겨쓰는 무분별한 소비를 줄일 수 있다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test3 eq '4'}">
				                            <li><input type="radio" name="testA03" id="testA01_3_7" radio="1" disabled="disabled" checked="checked" value=""> <label for="testA01_3_7">발급이 쉽고, 현금잔고 내에서 이용하기 때문에 규모 있는 지출계획을 세울 수 있다.</label></li>
			                            </c:if>
			                            <c:if test="${test3 ne '4'}">
				                            <li><input type="radio" name="testA03" id="testA01_3_8" radio="1" disabled="disabled" value=""> <label for="testA01_3_8">발급이 쉽고, 현금잔고 내에서 이용하기 때문에 규모 있는 지출계획을 세울 수 있다.</label></li>
			                            </c:if>
			                        </ul>
			                    </div>
				
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 연회비를 조금만 부담하면, 신용카드와 비슷한 부가서비스 혜택을 받는다. <br>
							<span class="po_C2 pad_r5">해설</span> 체크카드는 연회비 없이 현금 잔고 내에서 이용 가능한 카드입니다.
						</p>
					</div>
                    
                </div>

				<hr>
				
				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">4 </div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[재무설계]</span> 기존 대출이자를 낮추는 금리인하요구권에 해당하는 조건이 아닌 것은 무엇입니까?
                        </div>
                        	<c:choose>
								<c:when test="${test4 eq '4'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
								<div class="testA">
			                        <ul class="ul_radio">
			                      		<c:if test="${test4 eq '1'}">
			                            	<li><input type="radio" name="testA04" id="testA01_4_1" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA01_4_1">연소득이 크게 증가한 경우</label></li>
			                        	</c:if>
			                        	<c:if test="${test4 ne '1'}">
			                            	<li><input type="radio" name="testA04" id="testA01_4_2" radio="1"  disabled="disabled" value=""> <label for="testA01_4_2">연소득이 크게 증가한 경우</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test4 eq '2'}">
			                           		 <li><input type="radio" name="testA04" id="testA01_4_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA01_4_3">직장 내에서 직위가 상승한 경우</label></li>
			                            </c:if>
			                            <c:if test="${test4 ne '2'}">
			                            	 <li><input type="radio" name="testA04" id="testA01_4_4" radio="1"  disabled="disabled" value=""> <label for="testA01_4_4">직장 내에서 직위가 상승한 경우</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test4 eq '3'}">
			                            	<li><input type="radio" name="testA04" id="testA01_4_5" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA01_4_5">신용등급이 상향된 경우 </label></li>
			                            </c:if>
			                            <c:if test="${test4 ne '3'}">
			                            	<li><input type="radio" name="testA04" id="testA01_4_6" radio="1"  disabled="disabled" value=""> <label for="testA01_4_6">신용등급이 상향된 경우 </label></li>
			                            </c:if>
			                            
			                            <c:if test="${test4 eq '4'}">
				                            <li><input type="radio" name="testA04" id="testA01_4_7" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA01_4_7">국가경제가 어려워진 경우</label></li>
			                            </c:if>
			                            <c:if test="${test4 ne 4}">
				                            <li><input type="radio" name="testA04" id="testA01_4_8" radio="1"  disabled="disabled" value=""> <label for="testA01_4_8">국가경제가 어려워진 경우</label></li>
			                            </c:if>
			                        </ul>
			                    </div>
                    
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 국가경제가 어려워진 경우 <br>
							<span class="po_C2 pad_r5">해설</span> 본인의 연소득이 증가한 경우, 승진한 경우, 신용등급이 상승한 경우 등과 같은 요인이 발생하였을 경우 금융기관에 금리인하를 요구할 수 있습니다.
						</p>
					</div>
                    
                </div>
				
				<hr>
				
				 <div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">5</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[저축과 소비]</span> 저축을 해야 하는 이유가 아닌 것은 무엇입니까?
                        </div>
                        	<c:choose>
								<c:when test="${test5 eq '4'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
	                
								<div class="testA">
			                        <ul class="ul_radio">
			                        	<c:if test="${test5 eq '1'}">
			                            	<li><input type="radio" name="testA05" id="testA05_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA05_1">뜻밖의 사고에 대비할 수 있다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test5 ne '1'}">
			                            	<li><input type="radio" name="testA05" id="testA05_2"  radio="1" disabled="disabled" value=""> <label for="testA05_2">뜻밖의 사고에 대비할 수 있다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test5 eq '2'}">
			                           		 <li><input type="radio" name="testA05" id="testA05_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA05_3">소득이 줄거나 끊기는 장래에 대비할 수 있다.</label></li>
			                            </c:if>
			                            <c:if test="${test5 ne '2'}">
			                            	 <li><input type="radio" name="testA05" id="testA05_4" radio="1" disabled="disabled" value=""> <label for="testA05_4">소득이 줄거나 끊기는 장래에 대비할 수 있다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test5 eq '3'}">
			                            	<li><input type="radio" name="testA05" id="testA05_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA05_5">이자와 저축이 증가하는 것을 맛볼 수 있다.</label></li>
			                            </c:if>
			                            <c:if test="${test5 ne '3'}">
			                            	<li><input type="radio" name="testA05" id="testA05_6" radio="1" disabled="disabled" value=""><label for="testA05_6">이자와 저축이 증가하는 것을 맛볼 수 있다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test5 eq '4'}">
				                            <li><input type="radio" name="testA05" id="testA05_7" radio="1" disabled="disabled" checked="checked" value=""> <label for="testA05_7">일을 스스로 할 수 있는 능력을 가질 수 있게 된다.</label></li>
			                            </c:if>
			                            <c:if test="${test5 ne '4'}">
				                            <li><input type="radio" name="testA05" id="testA05_8" radio="1" disabled="disabled" value=""> <label for="testA05_8">일을 스스로 할 수 있는 능력을 가질 수 있게 된다.</label></li>
			                            </c:if>
			                        </ul>
			                    </div>
						
                    
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 일을 스스로 할 수 있는 능력을 가질 수 있게 된다. <br>
							<span class="po_C2 pad_r5">해설</span> 저축을 하면 불의사고의 경제적 위험과 불확실한 미래를 대비할 수 있고, 이자와 저축액이 증가하는 즐거움을 느낄 수 있습니다. 
						</p>
					</div>
                    
                </div>
				
				<hr>
				
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">6</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[저축과 소비] </span> 금융지능지수(FQ)가 뜻하는 것이 아닌 것은 무엇입니까?</p>
							</div>
							 <c:choose>
								<c:when test="${test6 eq '3'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
												                        <ul class="ul_radio">
			                        	<c:if test="${test6 eq '1'}">
			                            	<li><input type="radio" name="testA06" id="testA06_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA01_1">자신이 소유한 금융지식을 자각한다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test6 ne '1'}">
			                            	<li><input type="radio" name="testA06" id="testA06_2"  radio="1" disabled="disabled" value=""> <label for="testA06_2">자신이 소유한 금융지식을 자각한다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test6 eq '2'}">
			                           		 <li><input type="radio" name="testA06" id="testA06_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA06_3">충동적인 결론을 제어한다.</label></li>
			                            </c:if>
			                            <c:if test="${test6 ne '2'}">
			                            	 <li><input type="radio" name="testA06" id="testA06_4" radio="1" disabled="disabled" value=""> <label for="testA06_4">충동적인 결론을 제어한다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test6 eq '3'}">
			                            	<li><input type="radio" name="testA06" id="testA06_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA06_5">지능 및 감성지수가 출중하다.</label></li>
			                            </c:if>
			                            <c:if test="${test6 ne '3'}">
			                            	<li><input type="radio" name="testA06" id="testA06_6" radio="1" disabled="disabled" value=""><label for="testA06_6">지능 및 감성지수가 출중하다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test6 eq '4'}">
				                            <li><input type="radio" name="testA06" id="testA06_7" radio="1" disabled="disabled" checked="checked" value=""> <label for="testA06_7">합리적인 선택을 할 수 있다.</label></li>
			                            </c:if>
			                            <c:if test="${test6 ne '4'}">
				                            <li><input type="radio" name="testA06" id="testA06_8" radio="1" disabled="disabled" value=""> <label for="testA06_8">합리적인 선택을 할 수 있다.</label></li>
			                            </c:if>
			                        </ul>
									</div>
						
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 지능 및 감성지수가 출중하다. <br/>
							<span class="po_C2 pad_r5">해설</span> 금융지능지수(FQ)는 IQ나 EQ처럼 금융에 관한 특정한 분야에서 지성을 나타내는 태도입니다.
						</p>
						</div>
					</div>

				<hr>
				
				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">7</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[저축과 소비]</span> 금리가 오르면, 채권가격은 어떻게 될까요?
                        </div>
                        	<c:choose>
								<c:when test="${test7 eq '3'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
								<div class="testA">
			                        <ul class="ul_radio">
			                       		<c:if test="${test7 eq '1'}">
			                            	<li><input type="radio" name="testA07" id="testA07_1" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA07_1">오른다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test7 ne '1'}">
			                            	<li><input type="radio" name="testA07" id="testA07_2" radio="1" disabled="disabled" value=""> <label for="testA07_2">오른다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test7 eq '2'}">
			                           		 <li><input type="radio" name="testA07" id="testA07_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA07_3">변함 없다.</label></li>
			                            </c:if>
			                            <c:if test="${test7 ne '2'}">
			                            	 <li><input type="radio" name="testA07" id="testA07_4" radio="1" disabled="disabled" value=""> <label for="testA07_4">변함 없다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test7 eq '3'}">
			                            	<li><input type="radio" name="testA07" id="testA07_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA07_5">내린다.</label></li>
			                            </c:if>
			                            <c:if test="${test7 ne '3'}">
			                            	<li><input type="radio" name="testA07" id="testA07_6" radio="1" disabled="disabled" value=""><label for="testA07_6">내린다.</label></li>
			                            </c:if>
			                            
			                           
			                        </ul>
			                    </div>
                    
                   			 <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 내린다. <br>
							<span class="po_C2 pad_r5">해설</span> 채권가격과 금리는 역의 관계를 가지고 있습니다. 즉, 금리가 오르면 채권가격은 떨어지고 금리가 떨어지면 채권가격은 오르게 됩니다.
						</p>
					</div>
                    
                </div>
				
				<hr>
				
				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">8</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[저축과 소비]</span> 이자율이 가장 낮은 금융상품은 무엇입니까?
                        </div>
                        	<c:choose>
								<c:when test="${test8 eq '1'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
								<div class="testA">
			                        <ul class="ul_radio">
			                        	<c:if test="${test8 eq '1'}">
			                            	<li><input type="radio" name="testA08" id="testA08_1" radio="1" checked="checked"  disabled="disabled" value=""> <label for="testA08_1">보통예금</label></li>
			                        	</c:if>
			                        	<c:if test="${test8 ne '1'}">
			                            	<li><input type="radio" name="testA08" id="testA08_2" radio="1" disabled="disabled" value=""> <label for="testA08_2">보통예금</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test8 eq '2'}">
			                           		 <li><input type="radio" name="testA08" id="testA08_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA08_3">정기예금</label></li>
			                            </c:if>
			                            <c:if test="${test8 ne '2'}">
			                            	 <li><input type="radio" name="testA08" id="testA08_4" radio="1" disabled="disabled" value=""> <label for="testA08_4">정기예금</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test8 eq '3'}">
			                            	<li><input type="radio" name="testA08" id="testA08_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA08_5">정기적금</label></li>
			                            </c:if>
			                            <c:if test="${test8 ne '3'}">
			                            	<li><input type="radio" name="testA08" id="testA08_6" radio="1" disabled="disabled" value=""><label for="testA08_6">정기적금</label></li>
			                            </c:if>
			                          
			                        </ul>
			                    </div>
                    
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 보통예금 <br>
							<span class="po_C2 pad_r5">해설</span> 보통예금은 수시 입출금이 가능한 편리한 측면이 있는 반면, 보통 금리는 가장 낮은 금융상품입니다.
						</p>
					</div>
                    
                </div>
				
				<hr>
					
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">9</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[저축과 소비] </span> 합리적인 소비와 선택을 위한 방법이 아닌 것은 무엇입니까?

							</div>
							 <c:choose>
								<c:when test="${test9 eq '1'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
										<ul class="ul_radio">
										
							<c:if test="${test9 eq '1'}">
			                            	<li><input type="radio" name="testA09" id="testA09_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA09_1">싼 물건이라면 우선 사고 본다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test9 ne '1'}">
			                            	<li><input type="radio" name="testA09" id="testA09_2"  radio="1" disabled="disabled" value=""> <label for="testA09_2">싼 물건이라면 우선 사고 본다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test9 eq '2'}">
			                           		 <li><input type="radio" name="testA09" id="testA09_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA09_3">사고 싶은 물건이 현재 자산의 소득으로 유지할 수 있는지 확인한다.</label></li>
			                            </c:if>
			                            <c:if test="${test9 ne '2'}">
			                            	 <li><input type="radio" name="testA09" id="testA09_4" radio="1" disabled="disabled" value=""> <label for="testA09_4">사고 싶은 물건이 현재 자산의 소득으로 유지할 수 있는지 확인한다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test9 eq '3'}">
			                            	<li><input type="radio" name="testA09" id="testA09_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA09_5">사기 전에 좀더 저렴한 판매처가 있는지 알아본다.</label></li>
			                            </c:if>
			                            <c:if test="${test9 ne '3'}">
			                            	<li><input type="radio" name="testA09" id="testA09_6" radio="1" disabled="disabled" value=""><label for="testA09_6">사기 전에 좀더 저렴한 판매처가 있는지 알아본다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test9 eq '4'}">
				                            <li><input type="radio" name="testA09" id="testA09_7" radio="1" disabled="disabled" checked="checked" value=""> <label for="testA09_7">사고 싶은 물건이 반드시 필요한 것인지 더 생각해본다.</label></li>
			                            </c:if>
			                            <c:if test="${test9 ne '4'}">
				                            <li><input type="radio" name="testA09" id="testA09_8" radio="1" disabled="disabled" value=""> <label for="testA09_8">사고 싶은 물건이 반드시 필요한 것인지 더 생각해본다.</label></li>
			                            </c:if>
									    
									    
										</ul>
									</div>
						
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 싼 물건이라면 우선 사고 본다. <br>
							<span class="po_C2 pad_r5">해설</span> 아무리 저렴한 물건이라도 본인이 필요한 물건을 구매하는 것이 합리적인 소비입니다.
						</p>
						</div>
					</div>
					
				<hr>
				
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">10</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[부채관리] </span> 대출과 관련하여 틀린 것은 무엇입니까?
							</div>
							 <c:choose>
								<c:when test="${test10 eq '4'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
										<ul class="ul_radio">
							<c:if test="${test10 eq '1'}">
			                            	<li><input type="radio" name="testA010" id="testA010_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA010_1">대출을 적절하게 활용하면 경제적능력을 확장하는 효과가 있다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test10 ne '1'}">
			                            	<li><input type="radio" name="testA010" id="testA010_2"  radio="1" disabled="disabled" value=""> <label for="testA010_2">대출을 적절하게 활용하면 경제적능력을 확장하는 효과가 있다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test10 eq '2'}">
			                           		 <li><input type="radio" name="testA010" id="testA010_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA010_3">채무불이행이 되면 신용하락의 위험도 커진다.</label></li>
			                            </c:if>
			                            <c:if test="${test10 ne '2'}">
			                            	 <li><input type="radio" name="testA010" id="testA010_4" radio="1" disabled="disabled" value=""> <label for="testA010_4">채무불이행이 되면 신용하락의 위험도 커진다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test10 eq '3'}">
			                            	<li><input type="radio" name="testA010" id="testA010_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA010_5">대출에는 그만큼 비용과 책임 따른다.</label></li>
			                            </c:if>
			                            <c:if test="${test10 ne '3'}">
			                            	<li><input type="radio" name="testA010" id="testA010_6" radio="1" disabled="disabled" value=""><label for="testA010_6">대출에는 그만큼 비용과 책임 따른다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test10 eq '4'}">
				                            <li><input type="radio" name="testA010" id="testA010_7" radio="1" disabled="disabled" checked="checked" value=""> <label for="testA010_7">신용과 대출은 상관관계가 높지 않다.</label></li>
			                            </c:if>
			                            <c:if test="${test10 ne '4'}">
				                            <li><input type="radio" name="testA010" id="testA010_8" radio="1" disabled="disabled" value=""> <label for="testA010_8">신용과 대출은 상관관계가 높지 않다.</label></li>
			                            </c:if>
									    
										</ul>
									</div>
						
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 신용과 대출은 상관관계가 높지 않다. <br>
							<span class="po_C2 pad_r5">해설</span> 신용과 대출은 상관관계가 높습니다.
						</p>
						</div>
					</div>
					
				<hr>
				
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">11</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[부채관리] </span> 현명하게 돈 빌리는 방법과 관계 없는 것은 무엇입니까?
							</div>
							 <c:choose>
								<c:when test="${test11 eq '1'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
										<ul class="ul_radio">
										<c:if test="${test11 eq '1'}">
			                            	<li><input type="radio" name="testA011" id="testA011_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA011_1">금리 인상기에는 변동금리를 선택한다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test11 ne '1'}">
			                            	<li><input type="radio" name="testA011" id="testA011_2"  radio="1" disabled="disabled" value=""> <label for="testA011_2">금리 인상기에는 변동금리를 선택한다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test11 eq '2'}">
			                           		 <li><input type="radio" name="testA011" id="testA011_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA011_3">대출목적이 단순히 소비를 늘리기 위한 것인지 곰곰이 생각해본다.</label></li>
			                            </c:if>
			                            <c:if test="${test11 ne '2'}">
			                            	 <li><input type="radio" name="testA011" id="testA011_4" radio="1" disabled="disabled" value=""> <label for="testA011_4">대출목적이 단순히 소비를 늘리기 위한 것인지 곰곰이 생각해본다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test11 eq '3'}">
			                            	<li><input type="radio" name="testA011" id="testA011_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA011_5">향후 현금흐름을 감안하여 적정한 대출규모를 정한다.</label></li>
			                            </c:if>
			                            <c:if test="${test11 ne '3'}">
			                            	<li><input type="radio" name="testA011" id="testA011_6" radio="1" disabled="disabled" value=""><label for="testA011_6">향후 현금흐름을 감안하여 적정한 대출규모를 정한다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test11 eq '4'}">
				                            <li><input type="radio" name="testA011" id="testA011_7" radio="1" disabled="disabled" checked="checked" value=""> <label for="testA011_7">대출비용을 최대한 낮추도록 한다.</label></li>
			                            </c:if>
			                            <c:if test="${test11 ne '4'}">
				                            <li><input type="radio" name="testA011" id="testA011_8" radio="1" disabled="disabled" value=""> <label for="testA011_8">대출비용을 최대한 낮추도록 한다.</label></li>
			                            </c:if>
										</ul>
									</div>
						
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 금리 인상기에는 변동금리를 선택한다. <br>
							<span class="po_C2 pad_r5">해설</span> 금리인하기에는 변동금리를, 금리인상기에는 고정금리를 선택하는 것이 유리합니다.
						</p>
						</div>
					</div>
				
				<hr>
						
				
				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">12</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[부채관리]</span> 올바른 신용카드 쓰기와 관계 없는 것은 무엇입니까?
                        </div>
                        	<c:choose>
								<c:when test="${test12 eq '2'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
								<div class="testA">
			                        <ul class="ul_radio">
			                        	<c:if test="${test12 eq '1'}">
			                            	<li><input type="radio" name="testA012" id="testA012_1" checked="checked"  radio="1" disabled="disabled" value=""> <label for="testA012_1">신용카드는 가급적 보유 개수를 제한하는 것이 바람직하다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test12 ne '1'}">
			                            	<li><input type="radio" name="testA012" id="testA012_2" radio="1" disabled="disabled" value=""> <label for="testA012_2">신용카드는 가급적 보유 개수를 제한하는 것이 바람직하다.</label></li>
			                        	</c:if>
			                        	<c:if test="${test12 eq '2'}">
			                           		 <li><input type="radio" name="testA012" id="testA012_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA012_3">신용카드를 발급 받을 때는 만일의 사태에 대비해 한도를 최대한 높여야 한다.</label></li>
			                            </c:if>
			                            <c:if test="${test12 ne '2'}">
			                            	 <li><input type="radio" name="testA012" id="testA012_4" radio="1" disabled="disabled" value=""> <label for="testA012_4">신용카드를 발급 받을 때는 만일의 사태에 대비해 한도를 최대한 높여야 한다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test12 eq '3'}">
			                            	<li><input type="radio" name="testA012" id="testA012_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA012_5">신용카드를 대여하거나 보관에 과실이 있는 경우 책임이 있다.</label></li>
			                            </c:if>
			                            <c:if test="${test12 ne '3'}">
			                            	<li><input type="radio" name="testA012" id="testA012_6" radio="1" disabled="disabled" value=""><label for="testA012_6">신용카드를 대여하거나 보관에 과실이 있는 경우 책임이 있다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test12 eq '4'}">
				                            <li><input type="radio" name="testA012" id="testA012_7" radio="1" disabled="disabled" checked="checked" value=""> <label for="testA012_7">신용카드는 받는 즉시 카드 뒷면에 서명하여야 한다.</label></li>
			                            </c:if>
			                            <c:if test="${test12 ne '4'}">
				                            <li><input type="radio" name="testA012" id="testA012_8" radio="1" disabled="disabled" value=""> <label for="testA012_8">신용카드는 받는 즉시 카드 뒷면에 서명하여야 한다.</label></li>
			                            </c:if>
			                        </ul>
			                    </div>
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 신용카드를 발급 받을 때는 만일의 사태에 대비해 한도를 최대한 높여야 한다. <br>
							<span class="po_C2 pad_r5">해설</span> 신용카드 한도는 본인의 재정상태와 소비패턴에 맞게 설정하는 것이 올바른 방법입니다.
						</p>
					</div>
                    
                </div>
				
				<hr>		
						
				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">13</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[부채관리]</span> 일정기간 이자만 내다가 그 기간이 지나면 원금을 함께 갚아나가는 방식은 무엇입니까?
                        </div>
                        	<c:choose>
								<c:when test="${test13 eq '2'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
								<div class="testA">
			                        <ul class="ul_radio">
			                        	<c:if test="${test13 eq '1'}">
			                            	<li><input type="radio" name="testA013" id="testA013_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA013_1">만기 일시 상환식</label></li>
			                        	</c:if>
			                        	<c:if test="${test13 ne '1'}">
			                            	<li><input type="radio" name="testA013" id="testA013_2" radio="1" disabled="disabled" value=""> <label for="testA013_2">만기 일시 상환식</label></li>
			                        	</c:if>
			                        	<c:if test="${test13 eq '2'}">
			                           		 <li><input type="radio" name="testA013" id="testA013_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA013_3">거치식</label></li>
			                            </c:if>
			                            <c:if test="${test13 ne '2'}">
			                            	 <li><input type="radio" name="testA013" id="testA013_4" radio="1" disabled="disabled" value=""> <label for="testA013_4">거치식</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test13 eq '3'}">
			                            	<li><input type="radio" name="testA013" id="testA013_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA013_5">원리금 균등 분할식</label></li>
			                            </c:if>
			                            <c:if test="${test13 ne '3'}">
			                            	<li><input type="radio" name="testA013" id="testA013_6" radio="1" disabled="disabled" value=""><label for="testA013_6">원리금 균등 분할식</label></li>
			                            </c:if>	

							 <c:if test="${test13 eq '4'}">
			                            	<li><input type="radio" name="testA013" id="testA013_7" radio="1" disabled="disabled" checked="checked" value=""><label for="testA013_7">원금 균등 분할식</label></li>
			                            </c:if>
			                            <c:if test="${test13 ne '4'}">
			                            	<li><input type="radio" name="testA013" id="testA013_8" radio="1" disabled="disabled" value=""><label for="testA013_8">원금 균등 분할식</label></li>
			                            </c:if>                          
			                          
			                        </ul>
			                    </div>
                    
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 거치식 <br>
							<span class="po_C2 pad_r5">해설</span> 만기 일시 상환은 일정기간 이자만 납입 후 만기 원금을 일시상환하는 방식이며, 거치식은 일정기간 이자만 내다가 그 기간이 지나면 원금을 함께 갚아나가는 방식입니다. 원리금 균등 분할식은 총원리금을 대출기간 동안 균등하게 상환하는 방식이며, 원금 균등 분할식은 대출기간에 균등하게 원금을 납부하고, 잔액에 따른 이자를 납부하는 방식입니다.
						</p>
					</div>
                    
                </div>
						
				<hr>		
						
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">14</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[부채관리] </span> 불법인 채권추심행위가 아닌 것은 무엇입니까?

							</div>
							 <c:choose>
								<c:when test="${test14 eq '3'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
										<ul class="ul_radio">
							<c:if test="${test14 eq '1'}">
			                            	<li><input type="radio" name="testA014" id="testA014_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA014_1">야간에 채무자나 관계인을 방문하여 평온을 심하게 해치는 경우</label></li>
			                        	</c:if>
			                        	
							<c:if test="${test14 ne '1'}">
			                            	<li><input type="radio" name="testA014" id="testA014_2" radio="1" disabled="disabled" value=""> <label for="testA014_2">야간에 채무자나 관계인을 방문하여 평온을 심하게 해치는 경우</label></li>
			                        	</c:if>

			                            <c:if test="${test14 eq '2'}">
			                           		 <li><input type="radio" name="testA014" id="testA014_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA014_3">채무자를 감금하거나 위계나 위력을 사용하는 경우</label></li>
			                            </c:if>
			                            <c:if test="${test14 ne '2'}">
			                            	 <li><input type="radio" name="testA014" id="testA014_4" radio="1" disabled="disabled" value=""> <label for="testA014_4">채무자를 감금하거나 위계나 위력을 사용하는 경우</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test14 eq '3'}">
			                            	<li><input type="radio" name="testA014" id="testA014_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA014_5">채무자 외의 사람에게 채무에 관한 사실을 알리는 경우</label></li>
			                            </c:if>
			                            <c:if test="${test14 ne '3'}">
			                            	<li><input type="radio" name="testA014" id="testA014_6" radio="1" disabled="disabled" value=""><label for="testA014_6">채무자 외의 사람에게 채무에 관한 사실을 알리는 경우</label></li>
			                            </c:if>	

							 <c:if test="${test14 eq '4'}">
			                            	<li><input type="radio" name="testA014" id="testA014_7" radio="1" disabled="disabled" checked="checked" value=""><label for="testA014_7">다수인이 모인 장소에서 채무자 외의 사람에게 채무에 관한 사항을 공연히 알리는 경우</label></li>
			                            </c:if>
			                            <c:if test="${test14 ne '4'}">
			                            	<li><input type="radio" name="testA014" id="testA014_8" radio="1" disabled="disabled" value=""><label for="testA014_8">다수인이 모인 장소에서 채무자 외의 사람에게 채무에 관한 사항을 공연히 알리는 경우</label></li>
			                            </c:if>                   
										</ul>
									</div>
						
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 채무자 외의 사람에게 채무에 관한 사실을 알리는 경우 <br>
							<span class="po_C2 pad_r5">해설</span>  채무자 외의 사람에게 채무에 관한 사실을 알리는 경우는 불법 채권추심행위가 아닙니다.
						</p>
						</div>
					</div>
				
				<hr>
				
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">15</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[부채관리] </span> 효율적인 대출상환 전략이 아닌 것은 무엇입니까?

							</div>
							 <c:choose>
								<c:when test="${test15 eq '2'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
										<ul class="ul_radio">
											
							<c:if test="${test15 eq '1'}">
			                            	<li><input type="radio" name="testA015" id="testA015_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA015_1">먼저 연체한 대출부터 상환한다.</label></li>
			                        	</c:if>
							<c:if test="${test15 ne '1'}">
			                            	<li><input type="radio" name="testA015" id="testA015_2" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA015_2">먼저 연체한 대출부터 상환한다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test15 eq '2'}">
			                           		 <li><input type="radio" name="testA015" id="testA015_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA015_3">대출잔액이 큰 대출부터 상환한다.</label></li>
			                            </c:if>
			                            <c:if test="${test15 ne '2'}">
			                            	 <li><input type="radio" name="testA015" id="testA015_4" radio="1" disabled="disabled" value=""> <label for="testA015_4">대출잔액이 큰 대출부터 상환한다.</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test15 eq '3'}">
			                            	<li><input type="radio" name="testA015" id="testA015_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA015_5">상환기일이 일찍 도래하는 대출부터 상환한다.</label></li>
			                            </c:if>
			                            <c:if test="${test15 ne '3'}">
			                            	<li><input type="radio" name="testA015" id="testA015_6" radio="1" disabled="disabled" value=""><label for="testA015_6">상환기일이 일찍 도래하는 대출부터 상환한다.</label></li>
			                            </c:if>	

							 <c:if test="${test15 eq '4'}">
			                            	<li><input type="radio" name="testA015" id="testA015_7" radio="1" disabled="disabled" checked="checked" value=""><label for="testA015_7">여러 대출을 단순화하고 이자율이 높은 대출부터 상환한다.</label></li>
			                            </c:if>
			                            <c:if test="${test15 ne '4'}">
			                            	<li><input type="radio" name="testA015" id="testA015_8" radio="1" disabled="disabled" value=""><label for="testA015_8">여러 대출을 단순화하고 이자율이 높은 대출부터 상환한다.</label></li>
			                            </c:if> 
										</ul>
									</div>
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 대출잔액이 큰 대출부터 상환한다. <br>
							<span class="po_C2 pad_r5">해설</span> 여러 대출을 가능한 단순화하고 이자율이 높고 잔액이 적은 대출부터 상환해야 합니다.
						</p>
						</div>
					</div>
						
				<hr>
				
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">16</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[신용관리] </span> 다음 중 신용등급에 관한 설명으로 올바른 것은 무엇인가?   
							</div>
							 <c:choose>
								<c:when test="${test16 eq '4'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
										<ul class="ul_radio">
											<c:if test="${test16 eq '1'}">
			                            	<li><input type="radio" name="testA016" id="testA016_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA016_1">신용카드를 많이 발급받으면 신용등급에 악영향을 미친다.</label></li>
			                        	</c:if>
							<c:if test="${test16 ne '1'}">
			                            	<li><input type="radio" name="testA016" id="testA016_2" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA016_2">신용카드를 많이 발급받으면 신용등급에 악영향을 미친다.</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test16 eq '2'}">
			                           		 <li><input type="radio" name="testA016" id="testA016_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA016_3">개인소득이 높은 경우 신용등급에 좋은 영향을 미친다. .</label></li>
			                            </c:if>
			                            <c:if test="${test16 ne '2'}">
			                            	 <li><input type="radio" name="testA016" id="testA016_4" radio="1" disabled="disabled" value=""> <label for="testA016_4">개인소득이 높은 경우 신용등급에 좋은 영향을 미친다. </label></li>
			                            </c:if>
			                            
			                            <c:if test="${test16 eq '3'}">
			                            	<li><input type="radio" name="testA016" id="testA016_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA016_5">연체를 상환하는 즉시 신용등급이 회복된다.</label></li>
			                            </c:if>
			                            <c:if test="${test16 ne '3'}">
			                            	<li><input type="radio" name="testA016" id="testA016_6" radio="1" disabled="disabled" value=""><label for="testA016_6">연체를 상환하는 즉시 신용등급이 회복된다.</label></li>
			                            </c:if>	

							 <c:if test="${test16 eq '4'}">
			                            	<li><input type="radio" name="testA016" id="testA016_7" radio="1" disabled="disabled" checked="checked" value=""><label for="testA016_7">통신요금, 공공요금(전기,수도 등)을 성실히 납부하면 신용등급 향상에 도움이 된다.</label></li>
			                            </c:if>
			                            <c:if test="${test16 ne '4'}">
			                            	<li><input type="radio" name="testA016" id="testA016_8" radio="1" disabled="disabled" value=""><label for="testA016_8">통신요금, 공공요금(전기,수도 등)을 성실히 납부하면 신용등급 향상에 도움이 된다.</label></li>
			                            </c:if> 
										</ul>
									</div>
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 통신요금, 공공요금(전기,수도 등)을 성실히 납부하면 신용등급 향상에 도움이 된다. <br>
							<span class="po_C2 pad_r5">해설</span> 6개월 이상의 통신비, 공공요금 등의 납부 실적을 신용평가사에 증빙을 제출하면 신용평점과 등급 상승에 도움이 됩니다.
						</p>
						</div>
					</div>
				
				<hr>
						
				
				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">17</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[신용관리]</span>  신용은 단기간에 나빠지기는 쉬우나, 단기간에 좋아지는 것은 어렵다. 
                        </div>
                        	<c:choose>
								<c:when test="${test17 eq '1'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
								<div class="testA">
			                        <ul class="ul_radio">
			                       		<c:if test="${test17 eq '1'}">	
												<li>
													<input type="radio" name="choice_o17" checked="checked" disabled="disabled" id="choice_o17_1" radio="2" value="2번_O" title="답변 o">
													<label for="choice_o"> O<span class="hidden">O</span></label>
											    </li>
											</c:if>
											<c:if test="${test17 ne '1'}">	
												<li>
													<input type="radio" name="choice_o17" disabled="disabled" id="choice_o17_2" radio="2" value="2번_O" title="답변 o">
													<label for="choice_o"> O<span class="hidden">O</span></label>
											    </li>
											</c:if>
											
											<c:if test="${test17 eq '2'}">
												<li>
													<input type="radio" name="choice_x17" disabled="disabled" checked="checked" id="choice_x17_3" radio="2" value="2번_X" title="답변 x">
													<label for="choice_x"> X <span class="hidden">X</span></label>
												</li>
										    </c:if>
										    <c:if test="${test17 ne '2'}">
												<li>
													<input type="radio" name="choice_x17" disabled="disabled"  id="choice_x17_4" radio="2" value="2번_X" title="답변 x">
													<label for="choice_x"> X <span class="hidden">X</span></label>
												</li>
										    </c:if>
			                        </ul>
			                    </div>
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> O <br>
							<span class="po_C2 pad_r5">해설</span> 연체 등은 신용하락에 직접적으로 영향을 미치지만, 상환하더라도 여러 건의 금융거래실적을 반영하여 서서히 회복되는 특징이 있습니다. 따라서 평소에 나빠지지 않도록 관리가 필요합니다.
						</p>
					</div>
                    
                </div>
				
				<hr>		
				
				<div class="borBox">
                    
                    <div class="textQ">
                        <div class="test_num bold">18</div>
                        <div class="txt_Q">
                        	<p class="bold fnt16"><span class="po_C4">[신용관리]</span> 신용카드 이용금액의 일부만 결제하고 나머지 금액은 다음달로 이월시키는 리볼빙결제는 부득이한 경우에만 단기간 이용하는 것이 좋다.  
                        </div>
                        	<c:choose>
								<c:when test="${test18 eq '1'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
                    </div>
								<div class="testA">
			                        <ul class="ul_radio">
			                        	<c:if test="${test18 eq '1'}">	
												<li>
													<input type="radio" name="choice_o18" checked="checked" disabled="disabled" id="choice_o18_1" radio="2" value="2번_O" title="답변 o">
													<label for="choice_o"> O<span class="hidden">O</span></label>
											    </li>
											</c:if>
											<c:if test="${test18 ne '1'}">	
												<li>
													<input type="radio" name="choice_o18" disabled="disabled" id="choice_o18_2" radio="2" value="2번_O" title="답변 o">
													<label for="choice_o"> O<span class="hidden">O</span></label>
											    </li>
											</c:if>
											
											<c:if test="${test18 eq '2'}">
												<li>
													<input type="radio" name="choice_x18" disabled="disabled" checked="checked" id="choice_x18_3" radio="2" value="2번_X" title="답변 x">
													<label for="choice_x"> X <span class="hidden">X</span></label>
												</li>
										    </c:if>
										    <c:if test="${test18 ne '2'}">
												<li>
													<input type="radio" name="choice_x18" disabled="disabled"  id="choice_x18_4" radio="2" value="2번_X" title="답변 x">
													<label for="choice_x"> X <span class="hidden">X</span></label>
												</li>
										    </c:if>
			                        </ul>
			                    </div>
                    <div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> O <br>
							<span class="po_C2 pad_r5">해설</span> 리볼빙결제는 매우 높은 이자를 부담해야할 뿐 아니라, 지출관리에 어려움을 겪을 수 있으므로 부득이한 경우가 아니라면 이용을 지양하는 것이 좋습니다. 
						</p>
					</div>
                    
                </div>
				
				<hr>
						
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">19</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[금융사기 예방] </span> 다음 중 전형적인 대출사기의 유형이 아닌 것은 무엇인가? 

							</div>
							 <c:choose>
								<c:when test="${test19 eq '4'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
										<ul class="ul_radio">
											<c:if test="${test19 eq '1'}">
			                            	<li><input type="radio" name="testA019" id="testA019_1" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA019_1">기존의 대출을 저금리 대출로 전환해준다며 중개수수료를 요구하는 경우</label></li>
			                        	</c:if>
							<c:if test="${test19 ne '1'}">
			                            	<li><input type="radio" name="testA019" id="testA019_2" checked="checked" radio="1" disabled="disabled" value=""> <label for="testA019_2">기존의 대출을 저금리 대출로 전환해준다며 중개수수료를 요구하는 경우</label></li>
			                        	</c:if>
			                        	
			                        	<c:if test="${test19 eq '2'}">
			                           		 <li><input type="radio" name="testA019" id="testA019_3" radio="1" checked="checked" disabled="disabled" value=""> <label for="testA019_3">대출 부적격자에게 신용등급을 조정해주겠다며 선이자를 요구하는 경우</label></li>
			                            </c:if>
			                            <c:if test="${test19 ne '2'}">
			                            	 <li><input type="radio" name="testA019" id="testA019_4" radio="1" disabled="disabled" value=""> <label for="testA019_4">대출 부적격자에게 신용등급을 조정해주겠다며 선이자를 요구하는 경우</label></li>
			                            </c:if>
			                            
			                            <c:if test="${test19 eq '3'}">
			                            	<li><input type="radio" name="testA019" id="testA019_5" radio="1" disabled="disabled" checked="checked" value=""><label for="testA019_5">대출시 채무불이행에 대비한 부대비용을 요구하는 경우</label></li>
			                            </c:if>
			                            <c:if test="${test19 ne '3'}">
			                            	<li><input type="radio" name="testA019" id="testA019_6" radio="1" disabled="disabled" value=""><label for="testA019_6">대출시 채무불이행에 대비한 부대비용을 요구하는 경우</label></li>
			                            </c:if>	

							 <c:if test="${test19 eq '4'}">
			                            	<li><input type="radio" name="testA019" id="testA019_7" radio="1" disabled="disabled" checked="checked" value=""><label for="testA019_7">금융기관에서 대출에 필요한 각종 서류를 요구하는 경우</label></li>
			                            </c:if>
			                            <c:if test="${test19 ne '4'}">
			                            	<li><input type="radio" name="testA019" id="testA019_8" radio="1" disabled="disabled" value=""><label for="testA019_8">금융기관에서 대출에 필요한 각종 서류를 요구하는 경우</label></li>
			                            </c:if> 
										</ul>
									</div>
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> 금융기관에서 대출에 필요한 각종 서류를 요구하는 경우<br>
							<span class="po_C2 pad_r5">해설</span> 금융기관에서는 이용자에게 대출조건을 판별하기 위하여 필요한 서류를 요청할 수 있습니다. 다만, 전화 등으로 대출알선을 미끼로 개인정보 확인서류(특히 카드, 통장, 신분증 등 대포통장 개설이 가능한 자료들)를 요청하는 경우에는 의심해보아야 합니다.
						</p>
						</div>
					</div>
				
				<hr>		
				
                	<div class="borBox">
					 	<div class="textQ">
							<div class="test_num bold">20</div>
							<div class="txt_Q">
								<p class="bold fnt16"><span class="po_C4">[금융사기 예방] </span> 채권자가 채무자에게 동의를 받지 않은 채권추심은 불법이다.  
							</div>
							 <c:choose>
								<c:when test="${test20 eq '2'}">
									<c:set var="result" value="${result +1}" />
									<div class="qresult bgright">
										<span class="sr-only">맞음</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="qresult bgwrong">
										<span class="sr-only">틀림</span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
									<div class="testA">
										<ul class="ul_radio">
															<c:if test="${test20 eq '1'}">	
												<li>
													<input type="radio" name="choice_o20" checked="checked" disabled="disabled" id="choice_o20_1" radio="2" value="2번_O" title="답변 o">
													<label for="choice_o"> O<span class="hidden">O</span></label>
											    </li>
											</c:if>
											<c:if test="${test20 ne '1'}">	
												<li>
													<input type="radio" name="choice_o20" disabled="disabled" id="choice_o20_2" radio="2" value="2번_O" title="답변 o">
													<label for="choice_o"> O<span class="hidden">O</span></label>
											    </li>
											</c:if>
											
											<c:if test="${test20 eq '2'}">
												<li>
													<input type="radio" name="choice_x20" disabled="disabled" checked="checked" id="choice_x20_3" radio="2" value="2번_X" title="답변 x">
													<label for="choice_x"> X <span class="hidden">X</span></label>
												</li>
										    </c:if>
										    <c:if test="${test20 ne '2'}">
												<li>
													<input type="radio" name="choice_x20" disabled="disabled"  id="choice_x20_4" radio="2" value="2번_X" title="답변 x">
													<label for="choice_x"> X <span class="hidden">X</span></label>
												</li>
										    </c:if>
										</ul>
									</div>
						<div class="rAnswer">
						<p class="bold fnt15 po_C7">
							<span class="po_C2 pad_r5">정답</span> X <br>
							<span class="po_C2 pad_r5">해설</span> 채권추심행위 자체는 불법이 아니나, 채무상환 독촉과정에서 불법행위가 발생하는 것을 불법채권추심이라고 합니다. 

						</p>
						</div>
					</div>
				 
				<hr>
						
                <div class="bigRbar">
                    <p class="msg">총 20문제 중 <span class="po_C10">${result} 문제</span>를 맞히셨습니다.</p>
                    <input type="hidden" name="totScore" id="totScore" value="${result}">
                </div>
                <hr>
                <div class="btnAreaC">
                    <button type="button" name="button" onclick="fnSave();return false" class="btn btn-lg btn-blue w130" style="padding: 6px 6px;" title="다시 테스트 해보기">다시 테스트 해보기</button>
                </div>
                
            </section>
           
            	</div>
        </div>
    </article>
</div>
<script>
$(function (){
	var totScore = $('#totScore').val();
	$('#report').html('<p class="msg">총 20문제 중 <span class="po_C10">'+totScore+'문제</span>를 맞히셨습니다.</p>');
});
</script>
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->