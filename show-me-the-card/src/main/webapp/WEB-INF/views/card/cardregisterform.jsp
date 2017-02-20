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
<!-- jQuery Version 2.1.3 -->
<script src="../resources/assets/js/jquery-2.1.3.min.js"></script>
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
<script src="../resources/assets/js/waypoints.min.js"></script><!-- 

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->

<!-- </head>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
	alert("새로운페이지");
	var cardNum, check;
	var a = 0;
	var title = "";
	var mycContent = "";
	$('#siteUrl').blur(function() {
		siteUrl = $('#siteUrl').val();
		$.ajax ({
	       	url : "checkurl.action",
	       	method : 'get',
	       	data : "url=" + siteUrl,
	       	dataType : 'html',
	       	//contentType:"application/text; charset=UTF-8",
	       	success : function (data) {
	       		$("#resulttarget").html(data);
	       		title=$('#title').text();
	       		$("#cName").attr("disabled",true).val(title);
	       		a = 1;
	       	},
	       	error : function(xhr, status, err) {
	       		alert("실패");
	       		$("#cName").attr("disabled",false).val("").attr('placeholder',"사이트 혹은 페이지의 이름입니다.");
	       		a = 0;
	       		$("#resulttarget").html("<p align='center' style='color: red;'>주소가 올바르지 않습니다.</P><br>")
			}
	      });
	});

	$("#sendcard").click(function(){
		if(a==1){
			a=0;
			cardNum = $('#cardNoCheck').val();
			check = $('#check').val();
			mycContent = $('#mycContent').val();
			
			var frontJson = {
					siteUrl : siteUrl,
					cName : title,
					cardNo : cardNum,
					mycComment : mycContent
					
			};
			
			var stringJson = JSON.stringify(frontJson);
			
			$.ajax({
				url : 'cardregisterfin.action',
				method : 'post',
				data : stringJson,
				dataType : 'text',
				contentType:"application/text; charset=UTF-8",
				success : function(data, status, xhr) {
					location.reload();
				},
				error : function(xhr, status, err) {
					alert("실패");
				}
			});
			
		}else{
		alert("주소를 확인하세요");
		}
	});
	
	var tagArray = new Array;
	var tagCount = 0;
	$('#mycContent').bind('keypress', function(e) {
        if (e.which == 32 || e.which == 13){//space bar or tab bar
        	
        	var userInput = $('#mycContent').val();
        	
        if(userInput != null || userInput != " "){
        		tagArray = $('#mycContent').val().split(' ');
        		var tmpString = "";
        		$("#resultTag").append("<span class='label label-success'>"+ tagArray[tagCount] +"</span> ");
        		tagCount++;
        		for(var i = 0; i <= tagCount; i++){
        			if(tagArray[i] == tagArray[tagCount] && tagCount != 0){
        				//$("#resultTag > span").last().remove();
        			}
        		}
        		
        		
        	}
        	
        	
        }
        
	});
});
</script>
</head>
<style type="text/css">
#div1 {
	float: left;
	width: 80%;
}
.section-title p {
    padding-bottom: 0px;
}
.team-member-section {
    padding-top: 0px;
    padding-bottom: 0px;
}
.label label-success{
	margin-top: 10px;
}
/* .img-responsive{
    max-width: 300px;
} */
</style>
<body class="index">
	
	<c:import url="/WEB-INF/views/include/navigator.jsp" />
	
	<!-- 모달 시작 -->
	<div class="modal fade" id="registercard" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div class="row">
						<div class="col-sm-12">
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
										<p>URL</p><br>
										<input type="text" class="form-control" placeholder="이곳에 사이트 혹은 페이지 URL을 입력하세요 *" id="siteUrl" />
										<p class="help-block text-danger"></p>
									</div>
									
									<div id="resulttarget">
									</div>
									
									<div class="col-md-12 form-group waves-effect">
										<p>Title</p><br>
										<input type="text" class="form-control" placeholder="사이트 혹은 페이지의 이름입니다." id="cName" />
										<p class="help-block text-danger"></p>
									</div>
									<div class="col-md-12 form-group waves-effect">
										<p>Tag & 내용</p>
										<div><h2 id="resultTag"></h2></div><br>
										<input type="text" class="form-control" placeholder="선택하신 사이트 혹은 페이지의 내용을 입력하세요 *" id="mycContent" />
										<p class="help-block text-danger"></p>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="modal-footer">
									<div class="col-lg-12 text-center">
										<button type="button" class="btn btn-primary waves-effect" data-dismiss="modal">취소</button>
										<button type="button" id="sendcard" class="btn btn-primary waves-effect">완료</button>
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
	    <div class="col-md-3 col-sm-6">.col-sm-4</div>
	    <div class="col-md-3 col-sm-6"></div>
    </div>
	<div class="row">
		<div class="col-lg-12">
			<button id="modalbutton" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#registercard">+</button>
		</div>
	</div>
	<div id="test"></div>





	
	<!-- Start Footer Section -->
	<c:import url="/WEB-INF/views/include/footer.jsp" />
	<!-- End Footer Section -->

</body>
<!-- Custom JavaScript -->
<script src="../resources/assets/js/script.js">
$(function(){
	
});
</script>
</html>
