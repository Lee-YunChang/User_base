<%
/****************************************************
	system	: 일반 > 교육소개
	title	: 일반과정 신청 및 수강안내 목록
	summary	:	
	wdate	: 2013-09-10
	writer	: kim min gyu 
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/header_inc.jsp"%>
<c:set var="courseURL" value="/academy/course/public/main.do?mtCtypeCode=${REQUEST_DATA.mtCtypeCode}&form=E100"/>

<script type="text/javascript">
	function moveTab(tabNo){
		var frm = document.frm;
		frm.tabNo.value = tabNo;
		$("#frm").attr("action" , "/academy/course/courseInfo.do").submit();
		
	}

</script>

<div class="contents-wrap c101">

	<div class="sub-wrap">
			<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_course.jsp"%>

		<div class="sub-contents">
			<ul class="sub-navi">
				<li><span>HOME</span></li>
				<li><span>일반교육</span></li>
				<li class="location"><span>교육소개</span></li>
			</ul>

			<div class="sub-tit">
				<h3>교육소개</h3>
				<!-- <p>
					상상스토리는 세계교육에 명시된 권리와 자유에 대한 교육을 또하나의 권리로 누구든지 향유할 수 있도록  하고자 합니다. 
				</p> -->
			</div>

			<div class="contents" id="sContents">
				<form id="frm" name="frm" method="post" action="">
					<input type="hidden" id="tabNo" name="tabNo" value="">
				</form>
				<div class="tabArea">
					<ul class="tabMenu process">
						<li class="<c:if test="${REQUEST_DATA.tabNo == 0 }"> on </c:if><c:if test="${REQUEST_DATA.tabNo != 0 }"> off </c:if>"><a href="#none" onclick="moveTab('0'); return false" title="온라인교육 안내" class="icon1">온라인교육 안내</a></li>
						<li class="<c:if test="${REQUEST_DATA.tabNo == 1 }"> on </c:if><c:if test="${REQUEST_DATA.tabNo != 1 }"> off </c:if>"><a href="#none" onclick="moveTab('1'); return false" title="집합교육 안내" class="icon2">집합교육 안내</a></li>
						<li class="<c:if test="${REQUEST_DATA.tabNo == 2 }"> on </c:if><c:if test="${REQUEST_DATA.tabNo != 2 }"> off </c:if>"><a href="#none" onclick="moveTab('2'); return false" title="의무교육 안내" class="icon3">의무교육 안내</a></li>
						<li class="<c:if test="${REQUEST_DATA.tabNo == 3 }"> on </c:if><c:if test="${REQUEST_DATA.tabNo != 3 }"> off </c:if>"><a href="#none" onclick="moveTab('3'); return false" title="특강교육 안내" class="icon4">특강교육 안내</a></li>
					</ul>
					<%-- <c:if test="${REQUEST_DATA.tabNo == 0}">
						<div class="tabCon" id="tab-con01" style="display: block;">
	
							<div class="process-1">
								<div class="bg-radius">
									<h3 class="con-tit">공직자 대상 사이버 교육</h3>
									<p>
										상상스토리 공직자 사이버교육은 공직자의 의식 향상과 문화 확산을 위한 과정으로, 공무원 상시학습이 인정되는 무료 교육 과정입니다.
										<span class="d-block">단, 인정 시간은 소속기관의 교육훈련지침에 근거한 사이버 학습 인정시간이 우선 될 수 있습니다. </span>
									</p>
									<dl class="dt-symbol">
										<dt>교육대상</dt>
										<dd>공무원(중앙부처, 지방자치단체, 교육행정직공무원)</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>신청방법</dt>
										<dd>상상스토리 공직자 사이버상상스토리(http://humanrights.nhi.go.kr)를 통한 온라인 신청</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육문의</dt>
										<dd>
											<span class="d-block">02) 2125-9895 / edu@nhrc.go.kr</span>
										</dd>
										<dd class="txt_red">※ 기타 과정 운영관련일정 등 세부사항은 안내터를 통해 안내되는 공지사항을 참조하시기 바랍니다.</dd>
									</dl>
									<p class="ac"><a href="http://humanrights.nhi.go.kr" target="_blank" alt="새 창(http://humanrights.nhi.go.kr)열림" class="btn bd"><span class="txt_skyblue">공직자 사이버상상스토리</span> 바로가기</a></p>
								</div>
	
								<div class="bg-radius">
									<h3 class="con-tit">교원 대상 사이버 교육</h3>
									<p>
										상상스토리 교원 사이버교육은 교육 현장에서의 의식 향상과 문화 확산을 위한 과정으로, 교원 직무연수가 인정되는 무료 교육 과정입니다.
									</p>
									<dl class="dt-symbol">
										<dt>교육대상</dt>
										<dd>교원(전국 유, 초, 중, 고등 교원 및 교원전문직)</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>신청방법</dt>
										<dd>상상스토리 교원 사이버교육 위탁 기관인 중앙교육연수원(http://www.neti.go.kr/)을 통한 온라인 신청</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육문의</dt>
										<dd>
											<span class="d-block">02) 2125-9895 / edu@nhrc.go.kr</span>
										</dd>
										<dd class="txt_red">※ 기타 과정 운영관련일정 등 세부사항은 안내터를 통해 안내되는 공지사항을 참조하시기 바랍니다.</dd>
									</dl>
									<p class="ac"><a href="http://www.neti.go.kr/" target="_blank" alt="새창(http://www.neti.go.kr/) 열림" class="btn bd"><span class="txt_skyblue">교원 사이버상상스토리</span> 바로가기</a></p>
								</div>
	
								<div class="bg-radius">
									<h3 class="con-tit">시민 대상 사이버 교육</h3>
									<p>
										상상스토리 일반시민 사이버교육은 일반시민의 의식 향상과 문화 확산을 위한 과정으로, 사이버 교육과정 이수 인증이 되는 정기 강좌와 언제나 수강 가능한 열린 강좌로 구성된 무료 교육 과정입니다
									</p>
									<dl class="dt-symbol">
										<dt>교육대상</dt>
										<dd>일반시민( 및 시민단체 활동가, 학생 등)</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>신청방법</dt>
										<dd>현 홈페이지의 수강신청을 통한 온라인 신청 및 수강</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육문의</dt>
										<dd>
											<span class="d-block">02) 2125-9895 / edu@nhrc.go.kr</span>
										</dd>
										<dd class="txt_red">※ 기타 과정 운영관련일정 등 세부사항은 안내터를 통해 안내되는 공지사항을 참조하시기 바랍니다.</dd>
									</dl>
								</div>
							</div>
						</div><!-- // tab1 -->
					</c:if>	
					<c:if test="${REQUEST_DATA.tabNo == 1}">
						<div class="tabCon" id="tab-con02" style="display: block;">
							<div class="process-2">
								<div class="bg-radius">
									<h3 class="con-tit">집합교육</h3>
									<p>
										집합교육을 통해 지식 습득뿐만 아니라 사회의 구성원으로서 갖추어야 할 기본적 의식을 함양하고 교육생 상호간 사례 공유,정책사례 발굴 등을 통해 역량을 강화 및 인식전환의 계기 마련하며, 상호간 유대관계 및 협력체계의 강화를 통해 교육효과를 증대하기위한 교육입니다.
									</p>
								</div>

								<div class="bg-radius">
									<h3 class="con-tit">상상스토리 방문프로그램</h3>
									<p>
										상상스토리 방문프로그램은 업무소개·홍보와 동시에 학교·시민·공공문야의 대상에 따른 감수성 증진 프로그램을 구성하여 에 대한 이해와 친화력 및 감수성을 향상할 수 있도록 함으로써 친근한 체험기관으로서의 역할을 수행하기 위한 교육입니다.
									</p>
									<p class="indent txt_red">
										※ 상상스토리 방문프로그램 교육은 교육 신청 후 일주일 이내에 담당자에게서 연락이 진행되며, 담당자와의 협의 후 교육이 진행됩니다.
									</p>
									<dl class="dt-symbol">
										<dt>교육과정명</dt>
										<dd>방문 교육 프로그램</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>운영횟수</dt>
										<dd>연중 실시</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>기당인원</dt>
										<dd>20~40명</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육일수/교육시간</dt>
										<dd>프로그램운영/2시간</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육일정</dt>
										<dd>담당자와 협의 후 진행</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육대상</dt>
										<dd>공직자, 일반시민, 학생 등</dd>
									</dl>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${REQUEST_DATA.tabNo == 2}">
						<div class="tabCon" id="tab-con03" style="display: block;">
							<div class="process-3">
								<div class="bg-radius">
									<h3 class="con-tit">정신보건분야</h3>
									<dl class="dt-symbol">
										<dt>교육대상</dt>
										<dd>정신의료기관, 정신요양시설, 정신재활시설 종사자 및 설치운영자</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>신청방법</dt>
										<dd>
											상상스토리로 와서 교육받을 때: 배움터 > 의무교육 > 정신보건 소집교육 상세보기<br/>
											상상스토리 강사를 초빙하여 교육받을 때: 배움터 > 의무교육 > 정신보건 방문교육 상세보기
										</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육문의</dt>
										<dd>
											<span class="d-block">
											서울 경기 강원: 02) 2125-9893<br/>
											광주 전라 제주: 062) 710-9711<br/>
											부산 경남: 051) 710-9710<br/>
											대구 경북: 053) 212-7005<br/>
											대전 충청: 042) 472-9040
											</span>
										</dd>
										<br/>
										<dd class="txt_red">
										※ 문의 전 메인화면 공지사항 및 교육안내를 확인하세요. 상상스토리에서 실시하는 교육에 한하여 답변 가능합니다.<br/>
										※ 교육대상 여부 등 일반사항은 한국보건복지인력개발원(043-710-9194)으로 문의하세요.
										</dd>
									</dl>
								</div>

								<div class="bg-radius">
									<h3 class="con-tit">노숙인분야</h3>
									<p>
										상상스토리는 노숙인 등의 보호와 증진을 위하여 노숙인 등의 복지 및 자립지원에 관한 법률 제20조에 따른 노숙인시설 종사자 대상 교육을 실시합니다. 노숙인시설 종사자는 이 법에 따라 연 1회 교육을 상상스토리이 시행하는 집합교육으로 이수해야합니다.
									</p>
									<dl class="dt-symbol">
										<dt>교육대상</dt>
										<dd>노숙인 복지시설 종사자</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>신청방법</dt>
										<dd>
											상상스토리로 와서 교육받을 때: 배움터 > 의무교육 > 노숙인 분야 상세보기<br/>
											상상스토리 강사를 초빙하여 교육받을 때: 배움터 > 의무교육 > 노숙인 분야 상세보기
										</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육문의</dt>
										<dd>
											<span class="d-block">
											서울 경기 강원: 02) 2125-9892<br/>
											광주 전라 제주: 062) 170-9711<br/>
											부산 경남: 051) 710-9710<br/>
											대구 경북: 053) 212-7005<br/>
											대전 충청: 042) 472-9040
											</span>
										</dd>
										<br/>
										<dd class="txt_red">※ 기타 과정 운영관련일정 등 세부사항은 안내터를 통해 안내되는 공지사항을 참조하시기 바랍니다.</dd>
									</dl>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${REQUEST_DATA.tabNo == 3}">
						<div class="tabCon" id="tab-con04" style="display: block;">
							<div class="process-4">
								<div class="bg-radius">
									<h3 class="con-tit">특강</h3>
									<dl class="dt-symbol">
										<dt>교육대상</dt>
										<dd>일반시민( 및 시민단체 활동가, 학생 등)</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>신청방법</dt>
										<dd>현 홈페이지의 수강신청을 통한 온라인 신청 및 수강</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육문의</dt>
										<dd>
											<span class="d-block">02) 2125-9894</span>
										</dd>
										<dd class="txt_red">※ 기타 과정 운영관련일정 등 세부사항은 안내터를 통해 안내되는 공지사항을 참조하시기 바랍니다.</dd>
									</dl>
								</div>

								<div class="bg-radius">
									<h3 class="con-tit">찾아가는 학교특강</h3>
									<dl class="dt-symbol">
										<dt>교육대상</dt>
										<dd>일반시민( 및 시민단체 활동가, 학생 등)</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>신청방법</dt>
										<dd>현 홈페이지의 수강신청을 통한 온라인 신청 및 수강</dd>
									</dl>
									<dl class="dt-symbol">
										<dt>교육문의</dt>
										<dd>
											<span class="d-block">02) 2125-9893</span>
										</dd>
										<dd class="txt_red">※ 기타 과정 운영관련일정 등 세부사항은 안내터를 통해 안내되는 공지사항을 참조하시기 바랍니다.</dd>
									</dl>
								</div>
							</div>
						</div>
					</c:if> --%>

				</div>

				<p class="ar"><a href="#header" class="btn-top" title="TOP">TOP</a></p>


			</div><!-- //contents-->



		</div><!-- //sub-contents -->

	</div><!-- //sub-wrap -->

</div><!-- //contents-wrap -->
	
<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->