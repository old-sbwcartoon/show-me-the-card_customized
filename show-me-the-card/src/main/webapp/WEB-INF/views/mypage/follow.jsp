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
	href="/showmethecard/resources/assets/bootstrap/css/bootstrap.min.css">

<!-- Font Awesome CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/font-awesome.min.css">

<!-- Animate CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/animate.css">

<!-- Owl-Carousel -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/owl.theme.css">
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/owl.transitions.css">

<!-- Materialize CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/material.css">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/responsive.css">

<!-- Colors CSS -->
<link rel="stylesheet" type="text/css"
	href="/showmethecard/resources/assets/css/color/blue.css" title="blue">

<!-- Custom Fonts -->
<link href='http://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>

<!-- Modernizer js -->
<script src="/showmethecard/resources/assets/js/modernizr.custom.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery Version 2.1.3 -->
<script src="/showmethecard/resources/assets/js/jquery-2.1.3.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script
	src="/showmethecard/resources/assets/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="/showmethecard/resources/assets/js/jquery.easing.1.3.js"></script>
<script src="/showmethecard/resources/assets/js/classie.js"></script>
<script src="/showmethecard/resources/assets/js/count-to.js"></script>
<script src="/showmethecard/resources/assets/js/jquery.appear.js"></script>
<script src="/showmethecard/resources/assets/js/owl.carousel.min.js"></script>
<script src="/showmethecard/resources/assets/js/jquery.fitvids.js"></script>

<!-- Contact Form JavaScript -->
<script
	src="/showmethecard/resources/assets/js/jqBootstrapValidation.js"></script>

<!-- Materialize js -->
<script src="/showmethecard/resources/assets/js/material.js"></script>
<script src="/showmethecard/resources/assets/js/waypoints.min.js"></script>



<script type="text/javascript">
	
$(document).ready(function(){
	
	
	$('#daily').click(function() {
		$.ajax({
			url : "/showmethecard/chart/dayChart.action",
			method : "get",
			dataType : "json",
			success : function(data, status, xhr) {
				$('.d').remove();
				for (var i = 0; i < data.length; i++) {
					$('<tr><th>'+data[i].mId+'</th><th>'+data[i].mPoint+'</th></tr>').appendTo('#dailyTable').attr('class','d');
				}
			},
			error : function(data) {
				alert("실패");
			}
		});
	});
	
	$('#weekly').click(function() {
		$.ajax({
			url : "/showmethecard/chart/weekChart.action",
			method : "get",
			dataType : "json",
			success : function(data, status, xhr) {
				$('.d').remove();
				for (var i = 0; i < data.length; i++) {
					$('<tr><th>'+data[i].mId+'</th><th>'+data[i].mPoint+'</th></tr>').appendTo('#weeklyTable').attr('class','d');
				}
			},
			error : function(data) {
				alert("실패");
			}
		});
	});
	
	$('#monthly').click(function() {
		$.ajax({
			url : "/showmethecard/chart/monthChart.action",
			method : "get",
			dataType : "json",
			success : function(data, status, xhr) {
				$('.d').remove();
				for (var i = 0; i < data.length; i++) {
					$('<tr><th>'+data[i].mId+'</th><th>'+data[i].mPoint+'</th></tr>').appendTo('#monthlyTable').attr('class','d');
				}
			},
			error : function(data) {
				alert("실패");
			}
		});
	});
});
	
</script>




</head>
<body class="index">

	<c:choose>
		<c:when test="${ empty sessionScope.loginuser }">
			<c:import url="/WEB-INF/views/include/navigator.jsp" />
			
			
			<!-- Start Header Section -->
			<section class="header" id="home">
				<div class="container">
					<div class="intro-text">
						<h1>
							Show Me the <span>Cards</span>
						</h1>
						<button type="button" id="loginbtn"
							class="page-scroll waves-effect btn btn-primary">&nbsp;&nbsp;&nbsp;
							LOGIN &nbsp;&nbsp;</button>
						<button type="button" id="registerbtn"
							class="page-scroll waves-effect btn btn-primary">&nbsp;
							JOIN US &nbsp;&nbsp;</button>
					</div>
				</div>
			</section>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/views/include/navigator.jsp" />
			<!-- Start Header Section -->
			<section class="header" id="home">
				<div class="container">
					<div class="intro-text">
						<h1>
							Show Me the <span>Cards</span>
						</h1>
						<button type="button" id="#"
							class="page-scroll waves-effect btn btn-primary">&nbsp;&nbsp;&nbsp;
							LOGOUT &nbsp;&nbsp;</button>
						<button type="button" id="#"
							class="page-scroll waves-effect btn btn-primary">&nbsp;
							MY PAGE &nbsp;&nbsp;</button>
					</div>
				</div>
			</section>
		</c:otherwise>
	</c:choose>





    <!-- Strat Chart Section -->
    <div class="about-us-section-2">
    	<div class="container">
    		<div class="row">
    			
    			<div class="col-md-6">
    				<h2>User Chart</h2>
    				<ul class="nav nav-tabs"  style="font-size: 23">
    					<li class="active"><a data-toggle="tab" href="#userTotal" >친구목록()</a></li>
			    		<li><a data-toggle="tab" id="daily" href="#userDaily" >친구검색</a></li>
    					
    				</ul>
    				<div class="tab-content">
    					<div id="userTotal" class="tab-pane fade in active">
    						<table class="table">
    							<thead>    								
    								<tr style="font-size: 18; color: white;">
    									<!-- <th>레벨</th> -->    									
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">삭제버튼</th>
    								</tr>
    								
    							</thead>
    							<tbody>
    								<c:forEach var="total" items="${ total }">
    									<tr>
    										<!-- <th>레벨</th> -->
    										<th>${ total.mId }</th>
    										<th>${ total.mPoint } 점</th>
    									</tr>
		    						</c:forEach>
    							</tbody>					
    						</table>
    					</div>
    					<div id="userDaily" class="tab-pane fade">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: white;">
    									<th style="width: 250">검색</th>
    								</tr>
    								<tr style="font-size: 18; color: white;">
    									<!-- <th>레벨</th> -->    									
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">추가버튼</th>
    								</tr>
    							</thead>
    							<tbody id="dailyTable">
		    					</tbody>					
    						</table>
    					</div>
    					<div id="userWeekly" class="tab-pane fade">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: white;">
    									<!-- <th>레벨</th> -->
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">총점</th>
    								</tr>
    							</thead>
    							<tbody id="weeklyTable">
    							</tbody>					
    						</table>
    					</div>
    					<div id="userMonthly" class="tab-pane fade">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: white;">
    									<!-- <th>레벨</th> -->
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">총점</th>
    								</tr>
    							</thead>
    							<tbody id="monthlyTable">
    							</tbody>					
    						</table>
    					</div>    					
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    <!-- End Chart Section --> 












	<!-- Start Footer Section -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<!-- End Footer Section -->

</body>
<!-- Custom JavaScript -->
<script src="/showmethecard/resources/assets/js/script.js"></script>
<!-- modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>