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
					<h3>역사와 조항별 의미</h3>
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
							<div class="tabCon" id="tab-con02" style="display: block;">
								<div class="history-mean">
									<h3 class="con-tit">세계선언의 의의</h3>
									<div class="txt-box bg1">
										<p>
											62년 전, 유엔 총회는 억압과 차별에 대응하는 방벽으로서 세계선언문을 채택하였다. 인간의 역사상 가장 야만적인 범죄들로 황폐한 세계 대전 당시, 세계선언문은 처음으로 개인의 권리와 자유를 상세하게 밝혔다. 선언문은 또한 세계 최초로 과 기본적 자유가 개개인 모두에게 어디에서든 적용되는 것임을 알렸다.
										</p>
										<p>
											이러한 의미에서, 선언문은 세계 역사상 현저하게 두드러진 성취였다. 이로써, 오늘날 사람들의 생활과 법률 제정에 영향을 미치고  운동을 고취시키게 되었다.
										</p>
										<p>
											이러한 노력은 실질적으로 세계 전 지역이 선언문을 수락한 데에서도 알 수 있다. 오늘날, 선언문은 350개에 달하는 국가적·지역적 언어로 번역되었으며, 가장 널리 알려져 인용되는 세계적인  문서이다. 국제 법의 뿌리로, 선언문은 각종국제 조약과 선언의 모범이며 많은 나라의 법과 헌법에 수용되어 있는 바이다.
										</p>
									</div>
								</div>
								<div class="history-mean">
									<h3 class="con-tit">세계선언의 역사</h3>
									<div class="txt-box bg2">
										
									</div>
								</div>
								<div class="history-mean">
									<h3 class="con-tit">세계선언의 구조와 조항별 의의</h3>
									<div class="txt-box bg3">
										<p>
											세계선언은 30개의 명확하고 간결한 조항을 통해 넓은 범위의 을 포괄한다.첫 두 개의 조항은 세계적 의 토대를 이룬다. 모든 사람은 인간이라는 존엄성을 공유하기 때문에 동등함을 의미한다. 또한 이 모든 사람이 태어날 때 받는 권리이며, 선택된 자만이 받을 수 있는 특권도 아니고, 주어지는 혹은 거절되는 특권이 아니라고 명시한다.
										</p>
										<p>
											제1조에서는“모든 사람들은 존엄성과 권리를 가지고 동등하게 태어난다. 인간은 이성과 양심을 부여 받았으며 서로에게 동료애를 가지고 행동해야 한다.”라고 명시하고 있다. 제2조에서는 차별로부터 자유로운 생명의 전 세계적인 존엄성에 대해 명시한다. “모든 사람들은 세계선언에 나온 모든 권리와 자유를, 인종. 피부색. 성. 언어. 종교. 정치적 혹은 다른 견해. 국가적 혹은 사회적 출신. 재산. 태생 혹은 다른 지위와는 상관없이 부여 받는다. 제3조부터 제21조까지는 모두가 누릴 자격이 있는 공민권과 정치적 권리에 관하여 설명한다. 제3조에서 인정된 생명의 권리, 자유의 권리, 개인 안전의 권리는 정치적 권리와 노예, 고문과 임의 구속으로부터의 해방, 공평한 재판, 자유 발언과 자유 행동, 사생활 보호를 포함한 시민적 자유에 바탕을 둔다.
										</p>
										<p>
											제22조부터 제27조까지는 모든 인간들이 누릴 자격이 있는 경제적·사회적 그리고 문화적 권리를 설명한다. 이 권리들의 기초는 제22항으로, 모두가 사회의 한 일원으로서 사회 안전의 권리를 부여 받음을 인정함으로써 그들의 존엄과 자유롭고 완벽한 자아 계발을 위해 “긴요한” 경제적, 사회적, 문화적 권리를 갖출 자격이 있음을 설명한다. 이 조항들은 일, 공평한 보수, 그리고 여가에 관련된 경제적 권리를 포함한 사회 보장의 기본적인 권리, 보건, 복지, 교육에 관하여 적합한 생활수준에 대한 사회적 권리, 그리고 커뮤니티의 문화 생활에 참여할 수 있는 권리를 누리기 위해 필요한 권리들에 대해 상세하게 설명한다.
										</p>
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
