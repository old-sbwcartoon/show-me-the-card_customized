
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<title>공지사항 작성</title>
<meta charset="utf-8" />
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

<style type="text/css">
#maintitle {
	font-size: 60px;
	color: #333333;
	text-align: center;
	font-weight: bold;
}

#hqnoticeform {
	margin-left: 250px;
	width: 1000px;
}

#fontstyle {
	float: right;
}

#contenttext {
	width: 1000px;
	height: 300px;
	resize: none;
}

#buttongroup {
	margin-top: 50px;
	text-align: center;
	margin-bottom: 100px;
}
</style>
<script type="text/javascript" src="/example-web/script/jquery-3.1.1.js"></script>

<script type="text/javascript">
	window.addEventListener('load', function(event) {
		var link = document.querySelector('#submit-link');
		link.addEventListener('click', function(event) {
			var form = document.querySelector('#form233');
			form.submit();//<form 을 서버로 전송하는 명령
		});
	});
</script>
</head>
<body>

	<!-- Start Contact Us Section -->
	<section id="contact" class="contact contact-section">
		<div id="pageContainer">
			<c:import url="/WEB-INF/views/include/navigator.jsp" />
			<!-- 삭제하기 -->
			<div class="jumbotron">
				<h1 id="maintitle">공지사항 작성</h1>

			</div>

			<form:form id="form233" action="insertNotice.action" method="post"
				modelAttribute="notice">

				<table id=hqnoticeform>
					<tr>
						<th></th>
						<td>
							<div class="form-group">
								<label for="title">제목:</label> <input type="text"
									class="form-control" name="title" id="title">
							</div>
						</td>
					</tr>

					<tr>
						<th></th>
						<td>
							<div id="title">
								<label for="inputdefault">작성자:</label> <input
									class="form-control" name="mId" id="writer" type="text"
									value="${ loginuser.mId }" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<td>
							<div class="form-group">
								<label for="content">내용:</label>

								<textarea id="contenttext" name="content" class="form-control"
									rows="5"></textarea>
							</div>
						</td>
					</tr>



				</table>
			</form:form>
			<div id=buttongroup>
				<button id="submit-link" class="btn btn-default">작성완료</button>
				&nbsp;&nbsp;&nbsp; <a href="noticeList.action" type="button"
					id="cancel" class="btn btn-default">취소</a>
			</div>
		</div>
	</section>

	<!-- Start Footer Section -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<!-- End Footer Section -->
</body>

<!-- Custom JavaScript -->
<script src="../resources/assets/js/script.js"></script>
</html>