<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/bootstrap-theme.css">

</head>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var siteUrl = "";
		var division = "";
		$('#sendcard').click(function(){
			var division = $('#resultUrlCheck').val();
			var cardNum = $('cardNoCheck').val();
			var frontJson = {
					siteUrl :  division,
					cardNo : cardNum
			};
			var stringJson = JSON.stringify(frontJson);
			$.ajax({
				url : 'cardregisterfin.action',
				method : 'post',
				data : stringJson,
				dataType : 'text',
				contentType:"application/text; charset=UTF-8",
				success : function(data, status, xhr) {
					alert(division);
				},
				error : function(xhr, status, err) {
					
				}
			});
			alert(division);
		});
		
		$('#siteUrl').blur(function() {
			siteUrl = $('#siteUrl').val();
			alert(siteUrl);
			/* $("#resulttarget").load("card.action"); */
			$.ajax ({
		       	url : "checkurl.action",
		       	method : 'get',
		       	data : "url=" + siteUrl,
		       	dataType : 'html',
		       	//contentType:"application/text; charset=UTF-8",
		       	success : function (data) {
		       		alert(data);
		       		$("#resulttarget").html(data);
		       		$("#cName").val("아주 잘했어");
		       	},
		       	error : function(xhr, status, err) {
		       		alert("실패");
		       		$("#resulttarget").html("주소가 올바르지 않습니다.")
				}
		      });
		});
	});
</script>

<style>
#div1 {
	float: left;
	width: 80%;
}
</style>
<body class="index">

	<c:import url="/WEB-INF/views/include/navigator.jsp" />

	<!-- Start Contact Us Section -->
	<section id="contact" class="contact contact-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title text-center wow fadeInDown"
						data-wow-duration="2s" data-wow-delay="50ms">
						<h2>My Card 등록</h2>
						<p>Show Me The Card</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="row">
		<div class="col-lg-12">
			<button id="modalbutton" type="button" class="btn btn-info btn-lg"
				data-toggle="modal" data-target="#registercard">+</button>
		</div>
	</div>
	<div id="test"></div>





	<!-- 모달 시작 -->
	<div class="modal fade" id="registercard" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div class="row">
						<div class="col-lg-12">
							<div class="section-title text-center wow fadeInDown"
								data-wow-duration="2s" data-wow-delay="50ms">
								<h2>ADD MY CARD</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s"
									data-wow-delay="600ms">
									<div class="col-md-12 form-group waves-effect">
										<input type="text" class="form-control"
											placeholder="이곳에 사이트 혹은 페이지 URL을 입력하세요" id="siteUrl" />
										<p class="help-block text-danger"></p>
									</div>
									<div id="resulttarget"></div>
									<div class="col-md-12 form-group waves-effect">
										<input type="text" class="form-control" placeholder="이름"
											id="cName" />
										<p class="help-block text-danger"></p>
									</div>
									<div class="col-md-12 form-group waves-effect">
										<input type="text" class="form-control" placeholder="내용"
											id="content" />
										<p class="help-block text-danger"></p>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="modal-footer">
									<div class="col-lg-12 text-center">
										<button type="button" class="btn btn-primary waves-effect"
											data-dismiss="modal">취소</button>
										<button type="button" id="sendcard"
											class="btn btn-primary waves-effect" data-dismiss="modal">완료</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->

	<!-- Start Footer Section -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<!-- End Footer Section -->

</body>
<!-- Custom JavaScript -->
<script src="../resources/assets/js/script.js"></script>
</html>
