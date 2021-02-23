<%--
    Description : 지식터 > 세계선언
     
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
	function fnTab(url , tabNo){
		$("#tabNo").val(tabNo);
		$("#frm").attr("action" , "/academy/eduinfo/"+url+".do").submit();
	}
</script>

	<div class="contents-wrap">

		<div class="sub-wrap">
				
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_eduinfo.jsp"%>

			<div class="sub-contents">
				<ul class="sub-navi">
					<li><span>HOME</span></li>
					<li><span>지식터</span></li>
					<li class="location"><span>세계선언</span></li>
				</ul>

				<div class="sub-tit">
					<h3>세계선언</h3>
					<p>1948년 12월 10일 유엔총회에서 제정되어 다양한 문제의 기준이 되고 있는 세계선언의 전문을 제공합니다.</p>
				</div>
				
				<!-- <div class="contents" id="sContents">
					<img src="/academy/images/ing.png" alt="준비중입니다.">
				</div> -->
				
				<div class="contents" id="sContents">
					<form id="frm" name="frm" method="post" action="">
						<input type="hidden" id="tabNo" name="tabNo" value="">
					</form>
						<div class="tabArea">
							<ul class="tabMenu hmredu_d">
								<li <c:if test="${REQUEST_DATA.tabNo == 0}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 0}"> class="off"</c:if>><a href="#tab-con01" onclick="fnTab('worldHnrtList' , '0'); return false" title="세계 선언문"><span>세계선언문</span></a></li>       
								<li <c:if test="${REQUEST_DATA.tabNo == 1}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 1}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldHistoryList' , '1'); return false" title="역사와 조항별 의미"><span>역사와 조항별 의미</span></a></li>    
								<li <c:if test="${REQUEST_DATA.tabNo == 2}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 2}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldAniList' , '2'); return false" title="만화로 보기"><span>만화로 보기</span></a></li>                
								<li <c:if test="${REQUEST_DATA.tabNo == 3}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 3}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldListenList' , '3'); return false" title="음성낭독"><span>음성낭독</span></a></li>                 
								<li <c:if test="${REQUEST_DATA.tabNo == 4}"> class="on"</c:if> <c:if test="${REQUEST_DATA.tabNo != 4}"> class="off"</c:if>><a href="#none" onclick="fnTab('worldFileDown' , '4'); return false" title="번역문"><span>번역문</span></a></li>                     
							</ul>

							<div class="tabCon" id="tab-con01" style="display: block;">
								<div class="tab-con-wrap">
									<div class="tab-con scroll-y">
										<div class="declare-box">
											<div class="declare-txt">
												<h4 class="declare-h">세계선언(1948년 12월 10일 유엔총회 제정)-전문</h4>
												<p>
													인류가족 모두의 존엄성과 양도할 수 없는 권리를 인정하는 것이 세계의 자유, 정의, 평화의 기초다. 을 무시하고 경멸하는 만행이 과연 어떤 결과를 초래했던가를 기억해보라. 인류의 양심을 분노케 했던 야만적인 일들이 일어나지 않았던가?
												</p>
												<p>
													그러므로 오늘날 보통사람들이 바라는 지고지순의 염원은 ‘이제 제발 모든 인간이 언론의 자유, 신념의 자유, 공포와 결핍으로 부터의 자유를 누릴 수 있는 세상이 왔으면 좋겠다’는 것이리라.
												</p>
												<p>
													유엔헌장은 이미 기본적 , 인간의 존엄과 가치, 남녀의 동등한 권리에 대한 신념을 재확인했고, 보다 폭넓은 자유 속에서 사회진보를 촉진하고 생활수준을 향상시키자고 다짐했었다. 그런데 이러한 약속을 제대로 실천하려면 도대체 이 무엇이고 자유가 무엇인지에 대해 모든 사람이 이해할 수 있도록 하는 것이 가장 중요하지 않겠는가?
												</p>
												<p>
													유엔총회는 이제 모든 개인과 조직이 이 선언을 항상 마음속 깊이 간직하면서, 지속적인 국내적 국제적 조치를 통해 회원국 국민들의 보편적 자유와 권리신장을 위해 노력하도록, 모든 인류가 ‘다 함께 달성해야 할 하나의 공통기준’으로서 ‘세계선언’을 선포한다.
												</p>
											</div>
											<dl class="declare">
												<dt>제1조</dt>
												<dd>
													모든 사람은 태어날 때부터 자유롭고, 존엄하며, 평등하다. 모든 사람은 이성과 양심을 가지고 있으므로 서로에게 형제애의 정신으로 대해야 한다.
												</dd>
											</dl>
											<dl class="declare">
												<dt>제2조</dt>
												<dd>
													모든 사람은 인종, 피부색, 성, 언어, 종교 등 어떤 이유로도 차별받지 않으며, 이 선언에 나와 있는 모든 권리와 자유를 누릴 자격이 있다.
												</dd>
											</dl>
											<dl class="declare">
												<dt>제3조</dt>
												<dd>모든 사람은 자기 생명을 지킬 권리, 자유를 누릴 권리, 그리고 자신의 안전을 지킬 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제4조</dt>
												<dd>어느 누구도 노예가 되거나 타인에게 예속된 상태에 놓여서는 안된다. 노예제도와 노예매매는 어떤 형태로든 일절 금지한다.</dd>
											</dl>
											<dl class="declare">
												<dt>제5조</dt>
												<dd>어느 누구도 고문이나 잔인하고 비인도적인 모욕, 형벌을 받아서는 안 된다.</dd>
											</dl>
											<dl class="declare">
												<dt>제6조</dt>
												<dd>모든 사람은 법 앞에서 ‘ 한 사람의 인간’으로 인정받을 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제7조</dt>
												<dd>모든 사람은 법 앞에 평등하며, 차별 없이 법의 보호를 받을 수 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제8조</dt>
												<dd>모든 사람은 헌법과 법률이 보장하는 기본권을 침해당했을 때, 해당 국가 법원에 의해 효과적으로 구제받을 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제9조</dt>
												<dd>어느 누구도 자의적으로 체포, 구금, 추방을 당하지 않는다.</dd>
											</dl>
											<dl class="declare">
												<dt>제10조</dt>
												<dd>모든 사람은 자신의 행위가 범죄인지 아닌지를 판별받을 때, 독립적이고 공평한 법정에서 공평하고 공개적인 심문을 받을 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제11조</dt>
												<dd>범죄의 소추를 받은 사람은 자신을 변호하는 데 필요한 모든 것을 보장받아야 하고, 누구든지 공개재판을 통해 유죄가 입증될 때까지 무죄로 추정될 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제12조</dt>
												<dd>개인의 프라이버시, 가족, 주택, 통신에 대해 타인이 함부로 간섭해서는 안 되며, 어느 누구의 명예와 평판에 대해서도 타인이 침해해서는 안 된다.</dd>
											</dl>
											<dl class="declare">
												<dt>제13조</dt>
												<dd>모든 사람은 자기 나라 영토 안에서 어디든 갈 수 있고, 어디서든 살 수 있다. 또한 그 나라를 떠날 권리가 있고, 다시 돌아올 권리도 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제14조</dt>
												<dd>모든 사람은 박해를 피해, 타국에 피난처를 구하고 그곳에 망명할 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제15조</dt>
												<dd>누구나 국적을 가질 권리가 있다. 누구든지 정당한 근거 없이 국적을 빼앗기지 않으며, 자기 국적을 바꾸거나 다른 국적을 취득할 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제16조</dt>
												<dd>성년이 된 남녀는 인종, 국적, 종교의 제한을 받지 않고 결혼할 수 있으며, 가정을 이룰 권리가 있다. 결혼에 관한 모든 문제에 있어서 남녀는 똑같은 권리를 갖는다.</dd>
											</dl>
											<dl class="declare">
												<dt>제17조</dt>
												<dd>성년이 된 남녀는 인종, 국적, 종교의 제한을 받지 않고 결혼할 수 있으며, 가정을 이룰 권리가 있다. 결혼에 관한 모든 문제에 있어서 남녀는 똑같은 권리를 갖는다.</dd>
											</dl>
											<dl class="declare">
												<dt>제18조</dt>
												<dd>모든 사람은 사상, 양심, 종교의 자유를 누릴 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제19조</dt>
												<dd>모든 사람은 의사표현의 자유를 누릴 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제20조</dt>
												<dd>모든 사람은 평화적인 집회 및 결사의 자유를 누릴 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제21조</dt>
												<dd>모든 사람은 직접 또는 자유롭게 선출된 대표자를 통해, 자국의 정치에 참여할 권리가 있다. 모든 사람은 자기 나라의 공직을 맡을 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제22조</dt>
												<dd>모든 사람은 사회의 일원으로서 사회보장을 받을 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제23조</dt>
												<dd>
													모든 사람은 일할 권리, 자유롭게 직업을 선택할 권리, 공정하고 유리한 조건으로 일할 권리, 실업상태에서 보호받을 권리가 있다. 모든 사람은 차별 없이 동일한 노동에 대해 동일한 보수를 받을 권리가 있다.
												</dd>
											</dl>
											<dl class="declare">
												<dt>제24조</dt>
												<dd>모든 사람은 노동시간의 합리적인 제한과 정기적 유급휴가를 포함하여, 휴식할 권리와 여가를 즐길 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제25조</dt>
												<dd>모든 사람은 먹을거리, 입을 옷, 주택, 의료, 사회서비스 등을 포함해 가족의 건강과 행복에 적합한 생활수준을 누릴 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제26조</dt>
												<dd>
													모든 사람은 교육받을 권리가 있다. 초등교육과 기초교육은 무상이어야 하며, 특히 초등교육은 의무적으로 실시해야 한다. 부모는 자기 자녀가 어떤 교육을 받을지 ‘우선적으로 선택할 권리’가 있다.
												</dd>
											</dl>
											<dl class="declare">
												<dt>제27조</dt>
												<dd>모든 사람은 자기가 속한 사회의 문화생활에 자유롭게 참여하고, 예술을 즐기며, 학문적 진보와 혜택을 공유할 권리가 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제28조</dt>
												<dd>모든 사람은 이 선언의 권리와 자유가 온전히 실현될 수 있는 체제에서 살아갈 자격이 있다.</dd>
											</dl>
											<dl class="declare">
												<dt>제29조</dt>
												<dd>모든 사람은 자신이 속한 공동체에 대해 한 인간으로서 의무를 진다.</dd>
											</dl>
											<dl class="declare">
												<dt>제30조</dt>
												<dd>이 선언에서 말한 어떤 권리와 자유도 다른 사람의 권리와 자유를 짓밟기 위해 사용될 수 없다. 어느 누구에게도 남의 권리를 파괴할 목적으로 자기 권리를 사용할 권리는 없다.</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
						</div>

						<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


					</div>
				
			</div><!-- //contents-->

		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->
	
	
	
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->
