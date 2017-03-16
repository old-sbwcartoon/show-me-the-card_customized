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
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/animate.css"> <!-- home header -->
    
	<!-- Owl-Carousel 
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.carousel.css" >
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.theme.css" >
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/owl.transitions.css" >     -->

    <!-- Materialize CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/material.css">   
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/responsive.css">
    
    <!-- Colors CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/assets/css/color/blue.css" title="blue"> <!-- navigator css -->
    
    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'> <!--  폰트 -->
        
   <!--  Modernizer js
    <script src="../resources/assets/js/modernizr.custom.js"></script> -->

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

	<script type="text/javascript">
	$(document).ready(function() {
		$("#updateMember").click(function() {
			if ($("#password").val() != $("#passwordConfirm").val()) {
				$("#password").val("");
				$("#passwordConfirm").val("");
				alert("비밀번호가 일치하지 않습니다.");
			} else if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요!");
			} else if (!passwd || !email || !phone) {
				alert("형식에 맞게 입력해주세요!")
			} else{
				//정보수정
				$("#updateForm").submit();
			}
		});
		
		
		$("#outMember").click(function(){
			//메시지 확인하고 controller 보내기
			var r = confirm("정말 탈퇴하시겠습니까?");
		    if (r == true) {
		    	location.href="/showmethecard/member/deleteMember.action";
		    } 
		});		
		
	//정규식
	//비밀번호  - 영+숫 6~15
	var passwd = false;
	$('#password').keyup(function() {
		var regExp = /(?=.*\d)(?=.*[a-z]).{6,15}/;
		if ( !regExp.test($('#password').val())) {
			$('#passwordReg').text("비밀번호 형식이 맞지 않습니다. (영문+숫자 6~15자 이내)");
		} else {
			$('#passwordReg').text("");
			passwd = true;
		}
	});
	//전화번호
	var phone = true;
	$('#phone').keyup(function() {
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		if ( !regExp.test($('#phone').val())) {
			$('#phoneReg').text("번호 형식이 맞지 않습니다.");
			phone = false;
		} else {
			phone = true;
			$('#phoneReg').text("");
		}
	});
	//이메일
	var email = true;
	$('#email').keyup(function() {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if ( !regExp.test($('#email').val())) {
			$('#emailReg').text('이메일 형식이 맞지 않습니다.');
			email = false;
		} else {
			$('#emailReg').text("");
			email = true;
		}
	});
});
	</script>
</head>

<body class="index">
    
    <c:import url="/WEB-INF/views/include/header.jsp" />

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
                    <form name="sentMessage" id="updateForm" action="/showmethecard/member/updateMember.action" method="post">
                        <div class="row">
                            <div class="col-md-12 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                                <div class="form-group waves-effect">
	                                <h3 class="help-block text-danger">ID</h3>
                                    <input type="text" readonly="readonly" class="form-control" placeholder="Your Id *" name="mId" value="${ loginuser.mId }">
                                </div>
                                <div class="form-group waves-effect">
	                                <h3 class="help-block text-danger">PASSWORD</h3>
                                    <input type="password" class="form-control" placeholder="Your Password *" name="password" id="password">
                                    <p class="help-block text-danger" id="passwordReg"></p>
                                </div>
                                <div class="form-group waves-effect">
	                                <h3 class="help-block text-danger">PASSWORD CONFIRM</h3>
                                    <input type="password" class="form-control" placeholder="Your Password *" id="passwordConfirm">
                                	<p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group waves-effect">
	                                <h3 class="help-block text-danger">NAME</h3>
                                    <input type="text" class="form-control" placeholder="Your Name *" id="mName" name="mName" value="${ loginuser.mName }">
                                	<p class="help-block text-danger" id="nameReg"></p>
                                </div>
                                <div class="form-group waves-effect">
                                	<h3 class="help-block text-danger">PHONE</h3>
                                	<input type="tel" class="form-control" placeholder="Your Phone *" id="phone" name="phone" value="${ loginuser.phone }">
                                	<p class="help-block text-danger" id="phoneReg"></p>
                                </div>
                                <div class="form-group waves-effect">
                                	<h3 class="help-block text-danger">EMAIL</h3>
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" name="email" value="${ loginuser.email }">
                                	<p class="help-block text-danger" id="emailReg"></p>
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
     
</body>
 <!-- Custom JavaScript -->
    <script src="../resources/assets/js/script.js"></script>
</html>
