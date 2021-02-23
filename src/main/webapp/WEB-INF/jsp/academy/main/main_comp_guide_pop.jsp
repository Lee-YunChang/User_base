<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

 <%
/****************************************
	subject	: 사용자 마이페이지 수료증 출력 안내
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>

<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_header.jsp"%>
	<img src="/academy/images/capture/cer_print_info.png" alt="수료증 출력 안내"/>
	<div style="font-size:0;text-indent:-19;position:absolute;top:-2000px">
		<ul>
			<li>1.수료증 최상단 빈 공간에서 마우스 오른쪽 클릭  &gt; 인쇄미리보기 선택</li>
			<li>2.페이지설정 버튼 클릭 하여 아래와 동일하게 설정 		
				<ul>
					<li>*용지옵션
						<ul>
							<li>1) 가로</li>
							<li>2) 배경색 및 이미지 인쇄(C) 체크</li>
							<li>3) 크기에 맞게 축소사용(S) 체크</li>
						</ul>
					</li>
					<li>*여백(밀리미터)
						<ul>
							<li>>1)왼쪽,오른쪽,위쪽,아래쪽 모두 0으로 설정</li>
						</ul>
					</li>
					<li>* 머리글/바닥글
						<ul>
							<li>1)모두-비어있음-선택</li>
						</ul>
					</li>				
				</ul>
			</li>
			
			<li>3.상단의 인쇄버튼을 눌러 인쇄
				<ul>
					<li>1) 왼쪽, 오른쪽, 위쪽, 아래쪽 모두 0으로 설정</li>
				</ul>
			</li>
		</ul>
		
	
	
	
	
	
	 
	
	*머리글/바닥글
	1)모두 -비어있음- 선택
	적용 후 확인
	
	</div>
	

<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/popup_footer.jsp"%>