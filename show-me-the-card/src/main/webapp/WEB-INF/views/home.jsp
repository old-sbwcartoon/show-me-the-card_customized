<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<meta charset="utf-8" />
	<title>Show Me The Cards</title>    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/font-awesome.min.css">
    
    <!-- Animate CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/animate.css"> <!-- home header -->
    
	<!-- Owl-Carousel 
    <link rel="stylesheet" type="text/css" href="resources/assets/css/owl.carousel.css" >
    <link rel="stylesheet" type="text/css" href="resources/assets/css/owl.theme.css" >
    <link rel="stylesheet" type="text/css" href="resources/assets/css/owl.transitions.css" >     -->

    <!-- Materialize CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/material.css">   
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/responsive.css">
    
    <!-- Colors CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/color/blue.css" title="blue"> <!-- navigator css -->
    
    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'> <!--  폰트 -->
        
   <!--  Modernizer js
    <script src="resources/assets/js/modernizr.custom.js"></script> -->

    <!-- jQuery Version 2.1.3 -->
    <script src="resources/assets/js/jquery-2.1.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/assets/js/jquery.easing.1.3.js"></script>
    <script src="resources/assets/js/classie.js"></script>
    <script src="resources/assets/js/count-to.js"></script>
    <script src="resources/assets/js/jquery.appear.js"></script>
    <script src="resources/assets/js/owl.carousel.min.js"></script>
    <script src="resources/assets/js/jquery.fitvids.js"></script>
    

	<style type="text/css">
	li {
		float: left;
	}

	div a, .dropbtn {
    	display: inline-block;
    	color: white;
    	text-align: center;
    	padding: 14px 16px;
    	text-decoration: none;
	}
	
	div.dropdown {
    	display: inline-block;
	}

	.dropdown-content {
    	display: none;
	    position: absolute;
   		background-color: #f9f9f9;
    	min-width: 160px;
    	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    	z-index: 1;
	}

	.dropdown-content a {
    	color: black;
	    padding: 12px 16px;
    	text-decoration: none;
    	display: block;
    	text-align: left;
	}

	.dropdown-content a:hover {background-color: #f1f1f1}

	.dropdown:hover .dropdown-content {
    	display: block;
	}
	</style>
    <script>
	$(document).ready(function(){
		$("#loginbtn").click(function(){
   	    	$("#loginModal").modal();
    	});

   		$("#registerbtn").click(function(){
   			$("#registerModal").modal();
   		});
   		
  		var confirm = false;
		$("#join").click(function(){	
			//회원가입시 중복확인을 안한 경우
			if (!confirm) {
				alert("아이디 중복 확인을 해주세요.");
			} else if ($("#password").val() != $("#passwordConfirm").val()) {
				$("#password").val("");
				$("#passwordConfirm").val("");
				alert("비밀번호가 일치하지 않습니다.");
			} else if ( !id || !passwd || !email || !phone) {
				alert("형식에 맞게 입력해주세요.")
			} else if ($('#mId').val() == "" || $('#password').val() == "" || $('#email').val() == "" || $('#phone').val() == "" || $('#mName').val() == "") {
				alert("빠집없이 기입해주세요");
			} else {
				$("#registerForm").submit();
				confirm = false;
			}
		});
   		
		//id 중복 확인
   		$("#confirmId").click(function(){
   			if ( $("#mId").val() =="") {
   				alert("아이디를 입력해주세요!");
   			} else {
   				$.ajax({
   					url : "/showmethecard/member/confirmId.action",
   					data : { mId : $("#mId").val() },
   					method : "post",
   					dataType : "text",
   					success : function(data, status, xhr) {
   						if (data == "fail") {
   							alert("중복된 아이디입니다.");
   							$("#mId").val("");
   						} else {
   							alert("사용 가능한 아이디입니다.");
   							confirm = true;
   						}
   					}
   				});
   			}	
   		});
		
		$("#logoutbtn").click(function(){
			location.href="/showmethecard/account/logout.action";
		});
		
		$("#mypagebtn").click(function() {
			$("#mypage").modal();
		});
		
		$("#registerModal").on('hidden.bs.modal', function() {
			$("#registerForm").each(function() {
				this.reset();
			});
			$('p').text("");
		});
		
		$("#loginModal").on('hidden.bs.modal', function() {
			$("#loginForm").each(function() {
				this.reset();
			});
		});

		$('#daily').click(function() {
			$.ajax({
				url : "/showmethecard/chart/dayChart.action",
				method : "get",
				dataType : "json",
				success : function(data, status, xhr) {
					$('.d').remove();
					for (var i = 0; i < data.length; i++) { 												
						$('<tr><th><img style="height: 35; width: 35;" src="resources/level/'+data[i].mLevel+'.PNG"></th><th><a href="/showmethecard/mypage/mypage.action?goId='+data[i].mId+'"">'+data[i].mId+'</a></th><th>'+data[i].mPoint+'</th></tr>').appendTo('#dailyTable').attr('class','d');
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
						$('<tr><th><img style="height: 35; width: 35;" src="resources/level/'+data[i].mLevel+'.PNG"></th><th><a href="/showmethecard/mypage/mypage.action?goId='+data[i].mId+'"">'+data[i].mId+'</a></th><th>'+data[i].mPoint+'</th></tr>').appendTo('#weeklyTable').attr('class','d');
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
						$('<tr><th><img style="height: 35; width: 35;" src="resources/level/'+data[i].mLevel+'.PNG"></th><th><a href="/showmethecard/mypage/mypage.action?goId='+data[i].mId+'"">'+data[i].mId+'</a></th><th>'+data[i].mPoint+'</th></tr>').appendTo('#monthlyTable').attr('class','d');
					}
				},
				error : function(data) {
					alert("실패");
				}
			});
		});

		$('#dailyCard').click(function(){
			$.ajax({
				url : "/showmethecard/chart/dayCard.action",
				method : "get",
				dataType : "json",
				success : function(data, status, xhr) {
					$('.d').remove();
					for (var i = 0; i < data.length; i++) {
						$('<tr><th><img style="width:130; height:80px;" alt="'+data[i].siteUrl+'" src="'+data[i].imgSrc+'"></th><th><a href="/showmethecard/evaluation/evaluationmain.action?cardNo='+data[i].cardNo+'">'+data[i].cName+'</a></th><th>'+data[i].discover+'</th><th>'+data[i].cPoint+'점</th></tr>').appendTo('#monthlyTable').attr('class','d');
					}
				},
				error : function(data) {
					alert("실패");
				}
			});
		});
		
		$('#weeklyCard').click(function(){
			$.ajax({
				url : "/showmethecard/chart/weekCard.action",
				method : "get",
				dataType : "json",
				success : function(data, status, xhr) {
					$('.d').remove();
					for (var i = 0; i < data.length; i++) {
						$('<tr><th><img style="width:130; height:80px;" alt="'+data[i].siteUrl+'" src="'+data[i].imgSrc+'"></th><th><a href="/showmethecard/evaluation/evaluationmain.action?cardNo='+data[i].cardNo+'">'+data[i].cName+'</a></th><th>'+data[i].discover+'</th><th>'+data[i].cPoint+'점</th></tr>').appendTo('#monthlyTable').attr('class','d');
					}
				},
				error : function(data) {
					alert("실패");
				}
			});			
		});
		
		$('#monthlyCard').click(function(){
			$.ajax({
				url : "/showmethecard/chart/monthCard.action",
				method : "get",
				dataType : "json",
				success : function(data, status, xhr) {
					$('.d').remove();
					for (var i = 0; i < data.length; i++) {
						$('<tr><th><img style="width:130; height:80px;" alt="'+data[i].siteUrl+'" src="'+data[i].imgSrc+'"></th><th><a href="/showmethecard/evaluation/evaluationmain.action?cardNo='+data[i].cardNo+'">'+data[i].cName+'</a></th><th>'+data[i].discover+'</th><th>'+data[i].cPoint+'점</th></tr>').appendTo('#monthlyTable').attr('class','d');
					}
				},
				error : function(data) {
					alert("실패");
				}
			});	
		});
		
		// 정규식 검사
		//아이디 - 영+숫 6~15
		var id = false;
		$('#mId').keyup(function() {
			var regExp = /(?=.*\d)(?=.*[a-z]).{6,15}/;
			if ( !regExp.test($('#mId').val())) {
				$('#idReg').text("아이디 형식이 맞지 않습니다. (영문+숫자 6~15자 이내)");
			} else {
				$('#idReg').text("");
				id = true;
			}
		});
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
		var phone = false;
		$('#phone').keyup(function() {
			var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
			if ( !regExp.test($('#phone').val())) {
				$('#phoneReg').text("번호 형식이 맞지 않습니다.");
			} else {
				phone = true;
				$('#phoneReg').text("");
			}
		});
		//이메일
		var email = false;
		$('#email').keyup(function() {
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if ( !regExp.test($('#email').val())) {
				$('#emailReg').text('이메일 형식이 맞지 않습니다.');
			} else {
				$('#emailReg').text("");
				email = true;
			}
		});
	});
	</script>
</head>
<body class="index">
<c:choose>
 	<c:when test="${ empty sessionScope.loginuser }">
    	<!-- Start Header Section -->
	    <section class="header" id="home">
        	<div class="container">
           		<div class="intro-text">
                	<h1>Show Me the <span>Cards</span></h1>
                	<button type="button" id="loginbtn" class="page-scroll waves-effect btn btn-primary">&nbsp;&nbsp;&nbsp; LOGIN &nbsp;&nbsp;</button>
                	<button type="button" id="registerbtn" class="page-scroll waves-effect btn btn-primary">&nbsp; JOIN US &nbsp;&nbsp;</button>
            	</div>
        	</div>
    	</section>
   	</c:when>  
   	<c:otherwise>
   		<c:import url="/WEB-INF/views/include/navigator.jsp" />
   		<!-- Start Header Section -->
   		<c:choose>
   			<c:when test="${ loginuser.userType eq '1' }">
   				<section class="header" id="home">
        		<div class="container">
           		<div class="intro-text">
                	<h1>Show Me the <span>Cards</span></h1>
                	<button type="button"  id="logoutbtn" class="page-scroll waves-effect btn btn-primary"> &nbsp;&nbsp;&nbsp; LOGOUT &nbsp;&nbsp;</button>
                	<div class="dropdown">
                		<button type="button" class="dropbtn page-scroll waves-effect btn btn-primary">&nbsp; MY MENU &nbsp;&nbsp;</button>
                		<div class="dropdown-content">
            				<a id="mypagebtn" href="#">My Page</a>
            				<a href="/showmethecard/member/list.action">Admin Page</a>
            			</div>	
                	</div>          		
                </div>
        	</div>
    	</section>
   			</c:when>
   			<c:otherwise>
   				<section class="header" id="home">
        		<div class="container">
           		<div class="intro-text">
                	<h1>Show Me the <span>Cards</span></h1>
                	<button type="button"  id="logoutbtn" class="page-scroll waves-effect btn btn-primary"> &nbsp;&nbsp;&nbsp; LOGOUT &nbsp;&nbsp;</button>
                	<div class="dropdown">
                		<button type="button" class="dropbtn page-scroll waves-effect btn btn-primary">&nbsp; MY MENU &nbsp;&nbsp;</button>
                		<div class="dropdown-content">
            				<a id="mypagebtn" href="#">My Page</a>
            				<a href="/showmethecard/member/pointList.action">My Point</a>
        		   			<a href="/showmethecard/member/qnaList.action">My Q&A</a>
						</div>	
                	</div>          		
                </div>
        	</div>
    	</section>
   			</c:otherwise>
   		</c:choose>
   	</c:otherwise>
</c:choose>
        
	<!-- Login Modal -->
	<div class="container">
		<div class="modal fade" id="loginModal" role="dialog">
		    <div class="modal-dialog">
    	    <!-- Modal content-->
      		<div class="modal-content">
      			<div class="modal-header">
      			<button type="button" class="close" data-dismiss="modal">&times;</button>
      				<div class="row">
	                <div class="col-lg-12">
    	                <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
        	                <h2>LOGIN</h2>
                	    </div>
                	</div>
      				</div>
      			</div>
      			<div class="modal-body">
      				<div class="row">
            		    <div class="col-lg-12">
                   			<form name="sentMessage" action="/showmethecard/account/login.action" method="post" id="loginForm">
                        		<div class="row">
                            		<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                                		<div class="col-md-12 form-group waves-effect">
                                    		<input type="text" class="form-control" placeholder="Your Id *" id="id" name="mId">
                                    		<p class="help-block text-danger"></p>
                                		</div>
                                		<div class="col-md-12 form-group waves-effect">
                                    		<input type="password" class="form-control" placeholder="Your Password *" id="loginpassword" name="password">
                                    		<p class="help-block text-danger"></p>
                                		</div>
                            		</div>
                            		<div class="clearfix"></div>
                            		<div class="modal-footer"> 
                            			<div class="col-lg-12 text-center">
                                			<div id="success"></div>
                                			<button type="submit" id="login" class="btn btn-primary waves-effect">&nbsp;&nbsp;LOGIN&nbsp;&nbsp;</button>
                                			<button type="button" class="btn btn-primary waves-effect" data-dismiss="modal">CANCEL</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     			       	</div>
        			               </div>
        			               </div>
                    		</form>
                		</div>
            		</div>
      			</div>
      		</div>
    		</div>
		</div>
	</div>
	
	<!-- Register Modal -->
	<div class="container">
		<div class="modal fade" id="registerModal" role="dialog">
		    <div class="modal-dialog">
    	    <!-- Modal content-->
      		<div class="modal-content">
      			<div class="modal-header">
      			<button type="button" class="close" data-dismiss="modal">&times;</button>
      				<div class="row">
	                <div class="col-lg-12">
    	                <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
        	                <h2>JOIN US</h2>
                	    </div>
                	</div>
      				</div>
      			</div>
      			<div class="modal-body">
      				<div class="row">
		                <div class="col-lg-12">
        		            <form name="sentMessage" action="/showmethecard/member/register.action" method="post" id="registerForm">
                       		    <div class="row">
                       		    	<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                       		      		<div class="form-group">
                   		      				<input style="height: 40;" type="text" class="form-control" placeholder="Id * (영문+숫자 6~15자 이내)" id="mId" name="mId" />
       		    	                    	<p class="help-block text-danger" id="idReg"></p>
       		    	                    	<button style="height: 30;" id="confirmId" type="button" class="btn btn-primary waves-effect col-md-12 wow fadeInLeft">아이디 중복 확인</button>
	       		    	                    <br/><br/>
  		        	                        <input style="height: 40;" type="password" class="form-control" placeholder="Password * (영문+숫자 6~15자 이내)" id="password" name="password" />
                               		        <p class="help-block text-danger" id="passwordReg"></p>
                               		        <input style="height: 40;" type="password" class="form-control" placeholder="Confirm Password *" id="passwordConfirm" />
                                    		<p class="help-block text-danger"></p>
                                    		<input style="height: 40;" type="text" class="form-control" placeholder="Name *" id="mName" name="mName" />
                                    		<p class="help-block text-danger" id="nameReg"></p>
                                  			<input style="height: 40;" type="" class="form-control" placeholder="Phone * (000-0000-0000)" id="phone" name="phone" />
                                  			<p class="help-block text-danger" id="phoneReg"></p>
                                  			<input style="height: 40;" type="email" class="form-control" placeholder="Email *" id="email" name="email"/>
                                    		<p class="help-block text-danger" id="emailReg"></p>
                                		</div>
                            		</div>
                            		<div class="clearfix"></div>
                            		<div class="modal-footer"> 
                            			<div class="col-lg-12 text-center">
                               				<div id="success"></div>
                               		 		<button type="button" id="join" class="btn btn-primary waves-effect">&nbsp;&nbsp;&nbsp;JOIN&nbsp;&nbsp;&nbsp;</button>
                                			<button type="button" id="joinCancel" class="btn btn-primary waves-effect" data-dismiss="modal">CANCEL</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            			</div>
                            		</div>
                           		</div>                        	   
                    		</form>
                		</div>
            		</div>
      			</div>
      		</div>
    	    </div>
		</div>
	</div>
	
	<!-- Mypage Modal -->
	<div class="container">
		<div class="modal fade" id="mypage" role="dialog">
		    <div class="modal-dialog">
    	    <!-- Modal content-->
      		<div class="modal-content">
      			<div class="modal-header">
      			<button type="button" class="close" data-dismiss="modal">&times;</button>
      				<div class="row">
	                <div class="col-lg-12">
    	                <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
        	                <h2>Password Confirm</h2>
                	    </div>
                	</div>
      				</div>
      			</div>
      			<div class="modal-body">
      				<div class="row">
            		    <div class="col-lg-12">
                   			<form name="sentMessage" action="/showmethecard/member/mypage.action" method="post" id="contactForm">
                        		<div class="row">
                            		<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                                		<div class="col-md-12 form-group waves-effect">
                                    		<input type="password" class="form-control" placeholder="Your Password *" id="mypagePassword" name="password">
                                    		<p class="help-block text-danger"></p>
                                		</div>
                            		</div>
                            		<div class="clearfix"></div>
                            		<div class="modal-footer"> 
                            			<div class="col-lg-12 text-center">
                                			<div id="success"></div>
                                			<button type="submit" id="mypageConfirm" class="btn btn-primary waves-effect">&nbsp;&nbsp;Confirm&nbsp;&nbsp;</button>
                                			<button type="button" class="btn btn-primary waves-effect" data-dismiss="modal">CANCEL</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     			       	</div>
        			               </div>
        			               </div>
                    		</form>
                		</div>
            		</div>
      			</div>
      		</div>
    		</div>
		</div>
	</div>
    
    <!-- End Header Section -->    
    
    <!-- Strat Chart Section -->
    <div class="fun-facts">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-6">
    				<h2>Card Chart</h2>
    				    <ul class="nav nav-tabs" style="font-size: 23">
    					<li class="active"><a data-toggle="tab" href="#cardTotal">Total</a></li>
			    		<li><a data-toggle="tab" id="dailyCard" href="#cardDaily">Daily</a></li>
    					<li><a data-toggle="tab" id="weeklyCard" href="#cardWeekly">Weekly</a></li>
 				   		<li><a data-toggle="tab" id="monthlyCard" href="#cardMonthly">Monthly</a></li>
    				</ul>
    				<div class="tab-content">
    					<div id="cardTotal" class="tab-pane fade in active">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: white;">
    									<th>사이트</th>
    									<th style="width: 200">Title</th>
    									<th style="width: 100">등록자</th>
    									<th style="width: 100">총점</th>
    								</tr>
    							</thead>
    							<tbody>
    								<c:forEach var="totalCard" items="${ totalCard }">
    									<tr>
    										<th><img style="width: 130px; height: 80px;" alt="${ totalCard.siteUrl }" src=" ${ totalCard.imgSrc }"></th>
    										<th><a href="/showmethecard/evaluation/evaluationmain.action?cardNo=${ totalCard.cardNo }">${ totalCard.cName }</a></th>
    										<th>${ totalCard.discover }</th>
    										<th>${ totalCard.cPoint } 점</th>
    									</tr>
		    						</c:forEach>
    							</tbody>					
    						</table>
    					</div>
    					<div id="cardDaily" class="tab-pane fade">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: white;">
										<th>사이트</th>
    									<th style="width: 200">Title</th>
    									<th style="width: 100">등록자</th>
    									<th style="width: 100">총점</th>
    								</tr>
    							</thead>
    							<tbody id="dailyCard">
		    					</tbody>					
    						</table>
    					</div>
    					<div id="cardWeekly" class="tab-pane fade">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: white;">
										<th>사이트</th>
    									<th style="width: 200">Title</th>
    									<th style="width: 100">등록자</th>
    									<th style="width: 100">총점</th>
    								</tr>
    							</thead>
    							<tbody id="weeklyCard">
    							</tbody>					
    						</table>
    					</div>
    					<div id="cardMonthly" class="tab-pane fade">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: white;">
										<th>사이트</th>
    									<th style="width: 200">Title</th>
    									<th style="width: 100">등록자</th>
    									<th style="width: 100">총점</th>
    								</tr>
    							</thead>
    							<tbody id="monthlyCard">
    							</tbody>					
    						</table>
    					</div>    					
    				</div>
    			</div>
    			<div class="col-md-6">
    				<h2>User Chart</h2>
    				<ul class="nav nav-tabs"  style="font-size: 23">
    					<li class="active"><a data-toggle="tab" href="#userTotal">Total</a></li>
			    		<li><a data-toggle="tab" id="daily" href="#userDaily">Daily</a></li>
    					<li><a data-toggle="tab" id="weekly" href="#userWeekly">Weekly</a></li>
 				   		<li><a data-toggle="tab" id="monthly" href="#userMonthly">Monthly</a></li>
    				</ul>
    				<div class="tab-content">
    					<div id="userTotal" class="tab-pane fade in active">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: white;">
    									<th>레벨</th>
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">총점</th>
    								</tr>
    							</thead>
    							<tbody>
    								<c:forEach var="total" items="${ total }">
    									<tr>
    										<th><img style="height: 35; width: 35;" src="resources/level/${ total.mLevel }.PNG"></th>
    										<th onclick="location.href='/showmethecard/mypage/mypage.action?goId=${ total.mId }'"><a>${ total.mId }</a></th>
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
    									<th>레벨</th>
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">총점</th>
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
    									<th>레벨</th>
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
    									<th>레벨</th>
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
        
</body>
	<!-- Custom JavaScript -->
    <script src="resources/assets/js/script.js"></script>
    <!-- modal -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>
