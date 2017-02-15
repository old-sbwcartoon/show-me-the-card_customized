<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="utf-8" />
	<title>Show Me The Cards</title>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/bootstrap/css/bootstrap.min.css">
    
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/font-awesome.min.css">
    
    
    <!-- Animate CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/animate.css">
    
    <!-- Owl-Carousel -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.carousel.css" >
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.theme.css" >
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.transitions.css" >

    <!-- Materialize CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/material.css">
    
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/responsive.css">
    
    <!-- Colors CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/color/blue.css" title="blue">
    
    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        
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
	$(document).ready(function() {
		$("#updateMember").click(function() {
			if ($("#password").val() != $("#passwordConfirm").val()) {
				$("#password").val("");
				$("#passwordConfirm").val("");
				alert("비밀번호가 일치하지 않습니다.");
			} else {
				//정보수정
				$("#updateForm").submit();
			}
		});
		$("#outMember").click(function(){
			
		});		
	});
	
	/*
	  <button type="button" class="btn btn-primary waves-effect" id="updateMember">수정</button>
                                <button type="button" class="btn btn-primary waves-effect" id="outMember">탈퇴</button>
	$("#join").click(function(){	
		//회원가입시 중복확인을 안한 경우
		if (!confirm) {
			alert("아이디 중복 확인을 해주세요.");
		} else if ($("#password").val() != $("#passwordConfirm").val()) {
			alert("비밀번호가 일치하지 않습니다.");
		} else {
			$("#registerForm").submit();
			confirm = false;
		}
	}); */
	</script>
</head>

<body class="index">
    
    <c:import url="/WEB-INF/views/include/navigator.jsp" />

    <!-- Start Contact Us Section -->
    <section id="contact" class="contact contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
                        <h2>개인 정보 수정</h2>
                        <p>Show Me The Card</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="updateForm" action="showmethecard/member/updateMember.action" method="post">
                        <div class="row">
                            <div class="col-md-12 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                                <div class="form-group waves-effect">
	                                <h3 class="help-block text-danger">ID</h3>
                                    <input type="text" readonly="readonly" class="form-control" placeholder="Your Id *" id="mId" value="${ loginuser.mId }">
                                </div>
                                <div class="form-group waves-effect">
	                                <h3 class="help-block text-danger">PASSWORD</h3>
                                    <input type="password" class="form-control" placeholder="Your Password *" id="password">
                                </div>
                                <div class="form-group waves-effect">
	                                <h3 class="help-block text-danger">PASSWORD CONFIRM</h3>
                                    <input type="password" class="form-control" placeholder="Your Password *" id="passwordConfirm">
                                </div>
                                <div class="form-group waves-effect">
	                                <h3 class="help-block text-danger">NAME</h3>
                                    <input type="text" class="form-control" placeholder="Your Name *" id="mName" value="${ loginuser.mName }">
                                </div>
                                <div class="form-group waves-effect">
                                	<h3 class="help-block text-danger">PHONE</h3>
                                	<input type="tel" class="form-control" placeholder="Your Phone *" id="phone" value="${ loginuser.phone }">
                                </div>
                                <div class="form-group waves-effect">
                                	<h3 class="help-block text-danger">EMAIL</h3>
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" value="${ loginuser.email }">
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="button" class="btn btn-primary waves-effect" id="updateMember">수정</button>
                                <button type="button" class="btn btn-primary waves-effect" id="outMember">탈퇴</button>
                                <button type="button" class="btn btn-primary waves-effect" onclick="location.href='../home.action'">취소</button>
                            </div>
                        </div>
                    </form>
                </div>
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
