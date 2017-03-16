<?xml version="1.0" encoding="utf-8" ?>

<%@page import="org.springframework.web.bind.annotation.RequestBody"%>
<%@page import="com.rnh.showmethecard.model.dto.Qna"%>
<%@page import="com.rnh.showmethecard.ui.ThePager"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8" />
<title>Show Me The Cards</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<!-- Start Contact Us Section -->
	<section id="contact" class="contact contact-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title text-center wow fadeInDown"
					data-wow-duration="2s" data-wow-delay="50ms">
					<h2>Q & A</h2>
					<p>Show Me The Card</p>
				</div>
			</div>
		</div>
		<div>
			<a href="insertQna.action">글쓰기</a>
			<table class="table">
				<thead class="text-danger">
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qna" items="${ requestScope.qnas }" >
						<tr>
							<td>
							<c:forEach var="i" begin="1" end="${ qna.depth }" step="1">
							&nbsp;&nbsp;
							</c:forEach>
							<a href='detail.action?qNo=${ qna.qNo }'>${ qna.title }</a></td>							
							<td>${ qna.mId }</td>
							<td><fmt:formatDate value="${ qna.regDate }"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 아래는 페이지 번호 출력 구문 -->
			<div style="margin: 0 auto; text-align: center;">
				<ul class="pagination">${ pager }</ul>
			</div>
			
		</div>
		
	</div>
	</section>
</body>
<!-- Custom JavaScript -->
<script src="../resources/assets/js/script.js"></script>
</html>
