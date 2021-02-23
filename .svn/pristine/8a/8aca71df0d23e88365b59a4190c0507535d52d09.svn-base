<%--
    Description : 상상스토리 > 오시는길
     
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

<div class="container" id="Subcontent">
	<article class="subArea">
		<div class="subCntWrap">
			 <%@ include file="/WEB-INF/jsp/academy/cmmn/inc/lnb_offline.jsp"%>
			<div class="path">
				<ul>
					<li><span class="home text-hide">홈</span></li>
					<li>집합 교육</li>
					<li class="active">찾아오시는 길</li>
				</ul>
			</div>
			<div class="subConts" id="sub-content">
				
				<section class="bgTop_cate02"><!--   카테고리별 이미지 추가  -->
            		<div class="contTop">
            			<h2 class="h2_tit">찾아오시는 길</h2>
            		</div>           	
	            </section>

				<section>
					<!-- <div id="mapWrap" style="width:740px;height:290px;"></div> -->
					<div class="mapWrap">
						<div id="map" style="width: 100%;height: 290px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c1753e30d0686e37b39c28814738493"></script>
						<script>
							var container = document.getElementById('map');
							var options = {
								center: new daum.maps.LatLng(37.566785, 126.977445),
								level: 4
							};
							//지도 생성
							var map = new daum.maps.Map(container, options);
							
							//지도에 마커 생성
							var marker = new daum.maps.Marker({
								position: new daum.maps.LatLng(37.566785, 126.977445),
								map: map
							})
						</script>
					</div> 
				</section>

				<section class="mrg_t20">
					<div class="tblWrap">
						<table class="writeForm">
							<caption>오시는길 안내(주소,전화번호,버스,지하철안내)</caption>
							<colgroup>
								<col style="width: 20%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">주소</th>
									<td>서울특별시 중구 세종대로 124 상상스토리(프레스센터) 11층 교육장 (우편번호 :
										04520)</td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td>02-2128-8325</td>
								</tr>
								<tr>
									<th scope="row">대중교통</th>
									<td>
										<div class="rboxtit mrg_t5">버스</div>
										<div>
											<ul class="wayto">
												<li class="li_dot">서울신문사 하차 (간선) 101, 150, 402, 405,
													501, 506, N40, (지선) 1711, 7016 (순환) 91S투어</li>
												<li class="li_dot">광화문빌딩 하차 (간선) 700, 707 (광역) 9703,
													9714, M7106, M7111, M7119</li>
											</ul>
										</div>
										<div class="rboxtit dkblue mrg_t10">지하철</div>
										<div>
											<ul class="wayto">
												<li class="li_dot">1호선 시청역 4번 출구에서 프레스센터 방향</li>
												<li class="li_dot">2호선 시청역 12번 출구에서 프레스센터 방향</li>
												<li class="li_dot">2호선 을지로 입구역 1-1번 출구에서 프레스센터 방향</li>
												<li class="li_dot">5호선 광화문역 5번 출구에서 프레스센터 방향 300M</li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>

			</div>
		</div>
	</article>
</div>

<!-- 풋터 영역 -->
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/footer_inc.jsp"%>
<!-- // 풋터 영역 -->