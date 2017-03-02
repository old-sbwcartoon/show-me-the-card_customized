<?xml version="1.0" encoding="utf-8" ?>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    // 줄바꿈 
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Show Me The Cards</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
	<!-- Bootstrap Core CSS -->
<link rel="stylesheet" type="text/css"
	href="../resources/assets/bootstrap/css/bootstrap.min.css">

	<!-- Font Awesome CSS -->
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/font-awesome.min.css">

	<!-- Animate CSS -->
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/animate.css">

	<!-- Owl-Carousel -->
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/owl.theme.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/owl.transitions.css">

	<!-- Materialize CSS -->
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/material.css">

	<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/responsive.css">

	<!-- Colors CSS -->
<link rel="stylesheet" type="text/css"
	href="../resources/assets/css/color/blue.css" title="blue">

	<!-- Custom Fonts -->
<link href='http://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>

	<!-- Modernizer js -->
<script src="../resources/assets/js/modernizr.custom.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery Version 2.1.3 -->
<script src="../resources/assets/js/jquery-2.1.3.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../resources/assets/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="../resources/assets/js/jquery.easing.1.3.js"></script>
<script src="../resources/assets/js/classie.js"></script>
<script src="../resources/assets/js/count-to.js"></script>
<script src="../resources/assets/js/jquery.appear.js"></script>
<script src="../resources/assets/js/owl.carousel.min.js"></script>
<script src="../resources/assets/js/jquery.fitvids.js"></script>

<!-- Contact Form JavaScript -->
<script src="../resources/assets/js/jqBootstrapValidation.js"></script>

<!-- Materialize js -->
<script src="../resources/assets/js/material.js"></script>
<script src="../resources/assets/js/waypoints.min.js"></script>

<script type="text/javascript">
	function doDelete(qNo) {

		var ok = confirm(qNo + '번 글을 삭제할까요?');
		if (ok) {
			location.href = 'deleteqna.action?qNo=' + qNo;
		}
	}
</script>
<style>
</style>

<title>Q & A</title>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!-- Start Contact Us Section -->
	<section id="contact" class="contact contact-section">
		<div id="preloader">
			<div id="status">&nbsp;</div>
		</div>

		<br /> <br /> <br /> <br /> <br />
		<div class="container">
			<div style="padding-top: 25px;">
				<div id="inputcontent">
					<div id="inputmain">
						<div id="inputsubtitle" class="table-responsive" style="text-align: center">
							<H1>Q&A 글 내용</H1>
						</div>
						<br />


						<table class="table">
							<tr>
								<th>No</th>
								<td>${ qna.qNo }</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>${ qna.title }</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${ qna.mId }</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td><fmt:formatDate value="${qna.regDate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
							<c:set var="br" value="							
" />
	

							<tr>
								<th>내용</th>
								<td style="height: 200px; vertical-align: top">
								<br/>
								${ fn:replace(qna.content, cn, "<br/>")}
								</td>
							</tr>
						</table>


						<div class="buttons" style="text-align: center">
							<c:if
								test="${ loginuser.userType eq '1' || qna.mId eq loginuser.mId }">
								<a href="/showmethecard/qna/qnaList.action">목록</a>
								<a href="update.action?qNo=${qna.qNo}">수정</a>
								<a href='javascript:doDelete(${qna.qNo})'>삭제</a>
							</c:if>
							<c:if
								test="${ loginuser.userType eq '1' }">
								<a href="reply.action?qNo=${qna.qNo}">답변달기</a>
							</c:if>
						</div>
					</div>
				</div>

				<br /> <br />

			</div>
		</div>
	</section>
</body>

<!-- Custom JavaScript -->
<script src="../resources/assets/js/script.js"></script>
</html>
