<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/academy/cmmn/inc/top_inc.jsp"%>

<%
/****************************************
	subject	: 사용자 마이페이지 수료증 (집합교육)
	summary	: 
	author	: 김학규
	date	: 2015-06-04
****************************************/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>수료증 | 상상스토리 - 상상스토리</title>
<meta name="title" content="상상스토리 - 상상스토리">
<meta name="keywords" content="상상스토리, 상상스토리">
<meta name="description" content="상상스토리에 오신것을 환영합니다.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="../common/css/common.css">
<link rel="stylesheet" href="../common/css/main.css">
<link rel="stylesheet" href="../common/css/sub.css">
<link rel="stylesheet" href="../common/css/mobile.css"> -->

<style>
	*{margin:0;padding:0; list-style:none;font-style: normal;text-align:left}
	.compleat-wrap *{font-family:Gungseo,궁서;letter-spacing:-1px}
	.compleat-wrap { margin:20px auto; width:900px;height:1200px}
	.compleat {height:1200px;background:url('../images/bg_clt.png') no-repeat; color:#000;
	 -webkit-box-sizing:border-box; -moz-box-sizing:border-box; box-sizing:border-box;}

	.compleat {position: relative;}
	.compleat_txt {font-size:27px; font-weight:bold;position: absolute;left:110px;top:100px}
	.compleat h2 {font-size:66px; text-align:center; text-indent:-9999px; overflow:hidden;}
	.floatwrap {position: absolute;left:110px;top:444px}
	.compleat_list span {font-size:25px; font-weight:bold; display:inline-block; width:154px;  text-indent:-9999px}
	.compleat_list em {font-size:25px; display:inline-block;}
	.compleat_tit {font-size:32px; line-height:49px;text-align:center;position: absolute;top:690px;left:110px;right:110px;height:200px;font-weight: bold;letter-spacing:-2px}

	.compleat_list.fr li em {margin-left:0;}
	.compleat_list.al {text-align:left;}
	.compleat_list li {margin-top:17px;}
	.compleat_list li:first-child {margin-top:0;}
	.compleat_list li.last span {display:inline-block; width:160px;}
	.compleat_data {text-align:center; font-size:25px;position: absolute;bottom:235px;width:100%}

	.compleat h3 {font-size:44px; letter-spacing:-0.5px; margin-top:30px; font-weight:bold;}
	.compleat h3 span {font-size:16px; vertical-align:text-top; font-weight:normal;}
	.compleat_list span.indent_name {display:inline-block; text-indent: 0;font-weight:normal;}
</style>
</head>
<body> 

	<div class="wrap">
			<div class="compleat-wrap">
				<div class="compleat">
					<p class="compleat_txt"><c:out value="${certData.COMPCODE}"/></p>
					<h2>수료증</h2>


					<div class="floatwrap">
						<ul class="compleat_list al">
							<li><span>과정 :</span><em><c:out value="${certData.SEQ_TITLE}"/></em></li>
							<li><span>성명 :</span><em><span class="indent_name"><c:out value="${certData.USERNAME}"/></span></em></li>
							<li><span>생년월일 :</span><em><c:out value="${certData.YYYY}"/><c:out value="${certData.MM}"/><c:out value="${certData.DD}"/></em></li>
							<li><span>기간 :</span><em><c:out value="${certData.STUDY_SDATE}"/> ~ <c:out value="${certData.STUDY_EDATE}"/>(<c:out value="${certData.STUDYTIME}"/>분)</em></li>
						</ul>
					</div>

					<p class="compleat_tit">
						위 사람은 상상스토리에서 시행하는<br>
						『<c:out value="${certData.SEQ_TITLE}"/>』교육을<br>
						성실히 이수하였기에 이 증서를 수여합니다.
					</p>
					<p class="compleat_data"><c:out value="${fn:substring(certData.STUDY_EDATE, 0, 4)}"/>년 <c:out value="${fn:substring(certData.STUDY_EDATE, 5, 7)}"/>월 <c:out value="${fn:substring(certData.STUDY_EDATE, 8, 10)}"/>일</p>

				</div>
			</div>
	</div><!-- / wrap-->
	
	<script type="text/javascript">
 		window.print();
 	</script>

</body>
</html>  