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
    <link rel="stylesheet" type="text/css" href="resources/assets/css/animate.css">
    
    <!-- Owl-Carousel -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/owl.carousel.css" >
    <link rel="stylesheet" type="text/css" href="resources/assets/css/owl.theme.css" >
    <link rel="stylesheet" type="text/css" href="resources/assets/css/owl.transitions.css" >

    <!-- Materialize CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/material.css">   
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/assets/css/responsive.css">
    
    <!-- Colors CSS -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/color/blue.css" title="blue">
    
    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        
    <!-- Modernizer js -->
    <script src="resources/assets/js/modernizr.custom.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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

    <!-- Contact Form JavaScript -->
    <script src="resources/assets/js/jqBootstrapValidation.js"></script>

    <!-- Materialize js -->
    <script src="resources/assets/js/material.js"></script>
    <script src="resources/assets/js/waypoints.min.js"></script>

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
		
		$('#dailyCard').click(function(){
			$.ajax({
				url : "/showmethecard/chart/dayCard.action",
				method : "get",
				dataType : "json",
				success : function(data, status, xhr) {
					$('.d').remove();
					for (var i = 0; i < data.length; i++) {
						$('<tr><th>'+data[i].cName+'</th><th>'+data[i].siteUrl+'</th><th>'+data[i].discover+'</th><th>'+data[i].cPoint+'</th></tr>').appendTo('#monthlyTable').attr('class','d');
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
						$('<tr><th>'+data[i].cName+'</th><th>'+data[i].siteUrl+'</th><th>'+data[i].discover+'</th><th>'+data[i].cPoint+'</th></tr>').appendTo('#monthlyTable').attr('class','d');
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
						$('<tr><th>'+data[i].cName+'</th><th>'+data[i].siteUrl+'</th><th>'+data[i].discover+'</th><th>'+data[i].cPoint+'</th></tr>').appendTo('#monthlyTable').attr('class','d');
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
    	<c:import url="/WEB-INF/views/include/navigator.jsp" />  <!-- 삭제하기 -->
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
            				<a href="/showmethecard/member/pointList.action">My Point</a>
            				<a href="/showmethecard/member/qnaList.action">My Q&A</a>
            			</div>	
                	</div>          		
                </div>
        	</div>
    	</section>
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
                   			<form name="sentMessage" action="/showmethecard/account/login.action" method="post" id="contactForm">
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
       		    	                    	<p class="help-block text-danger"></p>
       		    	                    	<button style="height: 30;" id="confirmId" type="button" class="btn btn-primary waves-effect col-md-12 wow fadeInLeft">아이디 중복 확인</button>
	       		    	                    <br/><br/>
  		        	                        <input style="height: 40;" type="password" class="form-control" placeholder="Password * (영문+숫자 6~15자 이내)" id="password" name="password" />
                               		        <p class="help-block text-danger"></p>
                               		        <input style="height: 40;" type="password" class="form-control" placeholder="Confirm Password *" id="passwordConfirm" />
                                    		<p class="help-block text-danger"></p>
                                    		<input style="height: 40;" type="text" class="form-control" placeholder="Name *" id="mName" name="mName" />
                                    		<p class="help-block text-danger"></p>
                                  			<input style="height: 40;" type="tel" class="form-control" placeholder="Phone *" id="phone" name="phone" />
                                  			<p class="help-block text-danger"></p>
                                  			<input style="height: 40;" type="email" class="form-control" placeholder="Email *" id="email" name="email"/>
                                    		<p class="help-block text-danger"></p>
                                		</div>
                            		</div>
                            		<div class="clearfix"></div>
                            		<div class="modal-footer"> 
                            			<div class="col-lg-12 text-center">
                               				<div id="success"></div>
                               		 		<button type="button" id="join" class="btn btn-primary waves-effect">&nbsp;&nbsp;&nbsp;JOIN&nbsp;&nbsp;&nbsp;</button>
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
    <div class="about-us-section-2">
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
    									<!-- <th>레벨</th> -->
    									<th style="width: 300">사이트 이름</th>
    									<th style="width: 300">URL</th>
    									<th style="width: 200">등록자</th>
    									<th style="width: 200">총점</th>
    								</tr>
    							</thead>
    							<tbody>
    								<c:forEach var="totalCard" items="${ totalCard }">
    									<tr>
    										<!-- <th>레벨</th> -->
    										<th>${ totalCard.cName }</th>
    										<th>${ totalCard.siteUrl }</th>
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
    									<!-- <th>레벨</th> -->
    									<th style="width: 250">사이트 이름</th>
    									<th style="width: 300">URL</th>
    									<th style="width: 200">등록자</th>
    									<th style="width: 200">총점</th>
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
    									<!-- <th>레벨</th> -->
    									<th style="width: 250">사이트 이름</th>
    									<th style="width: 300">URL</th>
    									<th style="width: 200">등록자</th>
    									<th style="width: 200">총점</th>
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
    									<!-- <th>레벨</th> -->
    									<th style="width: 250">사이트 이름</th>
    									<th style="width: 300">URL</th>
    									<th style="width: 200">등록자</th>
    									<th style="width: 200">총점</th>
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
    									<!-- <th>레벨</th> -->
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">총점</th>
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
    									<!-- <th>레벨</th> -->
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
    
    
    
    
    
    
    
    
    
    <!-- Start About Us Section -->
    <section id="about-us" class="about-us-section-1">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="section-title text-center">
                            <h2>About Us</h2>
                            <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                        </div>
                </div>
            </div>
            <div class="row">
                
                <div class="col-md-4 col-sm-4">
                    <div class="welcome-section text-center waves-effect">
                        <img src="resources/assets/images/photo-2.jpg" class="img-responsive" alt="..">
                        <h4>Office Philosophy</h4>
                        <div class="border"></div>
                        <p>Duis aute irure dolor in reprehen derit in voluptate velit essecillum dolore eu fugiat nulla pariatur. Lorem reprehenderit</p>
                    </div>
                </div>
                
                <div class="col-md-4 col-sm-4">
                    <div class="welcome-section text-center waves-effect">
                        <img src="resources/assets/images/photo-1.jpg" class="img-responsive" alt="..">
                        <h4>Our Mission & Vission</h4>
                        <div class="border"></div>
                        <p>Duis aute irure dolor in reprehen derit in voluptate velit essecillum dolore eu fugiat nulla pariatur. Lorem reprehenderit</p>
                    </div>
                </div>
                
                <div class="col-md-4 col-sm-4">
                    <div class="welcome-section text-center waves-effect">
                        <img src="resources/assets/images/photo-3.jpg" class="img-responsive" alt="..">
                        <h4>Office Value & Rules</h4>
                        <div class="border"></div>
                        <p>Duis aute irure dolor in reprehen derit in voluptate velit essecillum dolore eu fugiat nulla pariatur. Lorem reprehenderit</p>
                    </div>
                </div>
                
            </div><!-- /.row -->            
            
        </div><!-- /.container -->
    </section>
    <!-- End About Us Section -->
        
    <!-- Start About Us Section 2 -->
    <div class="about-us-section-2">
        <div class="container">
            <div class="row">
                
                <div class="col-md-8">
                    <ul id="skill-section" class="clearfix skill-graph waves-effect">

                        <!-- single skill -->
                        <li>
                            <div class="after-li">
                                <div class="singel-hr">
                                    <div class="singel-hr-inner waves-effect" data-height="90%"></div>
                                    <div class="skill-visiable">
                                        <span class="skill-count">90%</span>
                                    </div>
                                    <span class="skill-title">January Feabruary</span>
                                </div>
                            </div>
                        </li>
                        <!-- /single skill-->

                        <!-- single skill -->
                        <li>
                            <div class="after-li">
                                <div class="singel-hr">
                                    <div class="singel-hr-inner waves-effect" data-height="100%"></div>
                                    <div class="skill-visiable">
                                        <span class="skill-count">100%</span>
                                    </div>
                                    <span class="skill-title">March April</span>
                                </div>
                            </div>
                        </li>
                        <!-- /single skill-->

                        <!-- single skill -->
                        <li>
                            <div class="after-li">
                                <div class="singel-hr">
                                    <div class="singel-hr-inner waves-effect" data-height="80%"></div>
                                    <div class="skill-visiable">
                                        <span class="skill-count">80%</span>
                                    </div>
                                    <span class="skill-title">May & June</span>
                                </div>
                            </div>
                        </li>
                        <!-- /single skill-->

                        <!-- single skill -->
                        <li>
                            <div class="after-li">
                                <div class="singel-hr">
                                    <div class="singel-hr-inner waves-effect" data-height="60%"></div>
                                    <div class="skill-visiable">
                                        <span class="skill-count">60%</span>
                                    </div>
                                    <span class="skill-title">July August</span>
                                </div>
                            </div>
                        </li>
                        <!-- /single skill-->

                        <!-- single skill -->
                        <li>
                            <div class="after-li">
                                <div class="singel-hr">
                                    <div class="singel-hr-inner waves-effect" data-height="85%"></div>
                                    <div class="skill-visiable">
                                        <span class="skill-count">85%</span>
                                    </div>
                                    <span class="skill-title">September October</span>
                                </div>
                            </div>
                        </li>
                        <!-- /single skill-->

                        <!-- single skill -->
                        <li>
                            <div class="after-li">
                                <div class="singel-hr">
                                    <div class="singel-hr-inner waves-effect" data-height="80%"></div>
                                    <div class="skill-visiable">
                                        <span class="skill-count">80%</span>
                                    </div>
                                    <span class="skill-title">November December</span>
                                </div>
                            </div>
                        </li>
                        <!-- /single skill-->

                        <!-- single skill -->
                        <li>
                            <div class="after-li">
                                <div class="singel-hr">
                                    <div class="singel-hr-inner waves-effect" data-height="90%"></div>
                                    <div class="skill-visiable">
                                        <span class="skill-count">90%</span>
                                    </div>
                                    <span class="skill-title">See Full Year</span>
                                </div>
                            </div>
                        </li>
                        <!-- /single skill-->

                    </ul>
                </div>
                
                <div class="col-md-4">
                    <div class="custom-accordion waves-effect">
                        <!-- Start Accordion Section -->
                    <div class="panel-group" id="accordion">

                        <!-- Start Accordion 1 -->
                        <div class="panel panel-default">
                            <div class="panel-heading waves-effect">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-1">
                                        <i class="fa fa-angle-left control-icon"></i> Who We are
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-1" class="panel-collapse collapse in">
                                <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis metus vitae ligula elementum ut luctus lorem facilisis. Sed non leo nisl, ac euismod nisi. Aenean augue dolor, facilisis id fringilla ut, tempus vitae nibh.</div>                               </div>
                        </div>
                        <!-- End Accordion 1 -->

                        <!-- Start Accordion 2 -->
                        <div class="panel panel-default">
                            <div class="panel-heading waves-effect">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-2" class="collapsed">
                                        <i class="fa fa-angle-left control-icon"></i> What we do
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-2" class="panel-collapse collapse">
                                <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis metus vitae ligula elementum ut luctus lorem facilisis. Sed non leo nisl, ac euismod nisi. Aenean augue dolor, facilisis id fringilla ut, tempus vitae nibh.</div>                               </div>
                        </div>
                        <!-- End Accordion 2 -->

                        <!-- Start Accordion 3 -->
                        <div class="panel panel-default">
                            <div class="panel-heading waves-effect">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-3" class="collapsed">
                                        <i class="fa fa-angle-left control-icon"></i> Why Choose Us ?
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-3" class="panel-collapse collapse">
                                <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis metus vitae ligula elementum ut luctus lorem facilisis. Sed non leo nisl, ac euismod nisi. Aenean augue dolor, facilisis id fringilla ut, tempus vitae nibh.</div>
                            </div>
                        </div>
                        <!-- End Accordion 3 -->

                        <!-- Start Accordion 4 -->
                        <div class="panel panel-default">
                            <div class="panel-heading waves-effect">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse-4" class="collapsed">
                                        <i class="fa fa-angle-left control-icon"></i> Our Great Support
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-4" class="panel-collapse collapse">
                                <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis metus vitae ligula elementum ut luctus lorem facilisis. Sed non leo nisl, ac euismod nisi. Aenean augue dolor, facilisis id fringilla ut, tempus vitae nibh.</div>
                            </div>
                        </div>
                        <!-- End Accordion 4 -->

                    </div>
                    <!-- End Accordion section -->
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- Start About Us Section 2 -->
    
    
    
    
    <!-- Start Portfolio Section -->
    <section id="portfolio" class="portfolio-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h2>Our Portfolio</h2>
                        <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                    </div>                        
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    
                    <!-- Start Portfolio items -->
                    <ul id="portfolio-list">
                        <li>
                            <div class="portfolio-item">
                                <img src="resources/assets/images/portfolio/port-5.jpg" class="img-responsive" alt="" />
                                <div class="portfolio-caption">
                                    <h4>Portfolio Title</h4>
                                    <a href="#portfolio-modal" data-toggle="modal" class="link-1"><i class="fa fa-magic"></i></a>
                                    <a href="#" class="link-2"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="portfolio-item">
                                <img src="resources/assets/images/portfolio/port-2.jpg" class="img-responsive" alt="" />
                                <div class="portfolio-caption">
                                    <h4>Portfolio Title</h4>
                                    <a href="#portfolio-modal" data-toggle="modal" class="link-1"><i class="fa fa-magic"></i></a>
                                    <a href="#" class="link-2"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="portfolio-item">
                                <img src="resources/assets/images/portfolio/port-3.jpg" class="img-responsive" alt="" />
                                <div class="portfolio-caption">
                                    <h4>Portfolio Title</h4>
                                    <a href="#portfolio-modal" data-toggle="modal" class="link-1"><i class="fa fa-magic"></i></a>
                                    <a href="#" class="link-2"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="portfolio-item">
                                <img src="resources/assets/images/portfolio/port-4.jpg" class="img-responsive" alt="" />
                                <div class="portfolio-caption">
                                    <h4>Portfolio Title</h4>
                                    <a href="#portfolio-modal" data-toggle="modal" class="link-1"><i class="fa fa-magic"></i></a>
                                    <a href="#" class="link-2"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="portfolio-item">
                                <img src="resources/assets/images/portfolio/port-6.jpg" class="img-responsive" alt="" />
                                <div class="portfolio-caption">
                                    <h4>Portfolio Title</h4>
                                    <a href="#portfolio-modal" data-toggle="modal" class="link-1"><i class="fa fa-magic"></i></a>
                                    <a href="#" class="link-2"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="portfolio-item">
                                <img src="resources/assets/images/portfolio/port-1.jpg" class="img-responsive" alt="" />
                                <div class="portfolio-caption">
                                    <h4>Portfolio Title</h4>
                                    <a href="#portfolio-modal" data-toggle="modal" class="link-1"><i class="fa fa-magic"></i></a>
                                    <a href="#" class="link-2"><i class="fa fa-link"></i></a>
                                </div>
                            </div>
                        </li>
                        
                            
                    </ul>
                    <!-- End Portfolio items -->
                </div>
            </div>
        </div>
    </section>
    <!-- End Portfolio Section -->
    
    <!-- Start Portfolio Modal Section -->
    <div class="section-modal modal fade" id="portfolio-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            
            <div class="container">
                <div class="row">
                    <div class="section-title text-center">
                        <h2>Portfolio Details</h2>
                        <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                    </div>
                </div>
                <div class="row">
                    
                    <div class="col-md-6">
                        <img src="resources/assets/images/portfolio/port-1.jpg" class="img-responsive" alt="..">
                    </div>
                    <div class="col-md-6">
                        <img src="resources/assets/images/portfolio/port-2.jpg" class="img-responsive" alt="..">
                    </div>
                    
                </div><!-- /.row -->
            </div>                
        </div>
    </div>
    <!-- End Portfolio Modal Section -->
    
    
    
    <!-- Start Service Section -->
    <section id="service" class="services-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h2>Our Services</h2>
                        <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service waves-effect">
                        <i class="fa fa-magic"></i>
                        <div class="border"></div>
                        <div class="service-content">
                            <h4>Web Design</h4>
                            <p>Duis aute irure dolor inreprehen derit voluptate velit esse cillum dolore fugiat nulla pariatur reprehenderit</p>
                        </div>
                    </div>
                </div><!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service waves-effect">
                        <i class="fa fa-gift"></i>
                        <div class="border"></div>
                        <div class="service-content">
                            <h4>Graphics Design</h4>
                            <p>Duis aute irure dolor inreprehen derit voluptate velit esse cillum dolore fugiat nulla pariatur reprehenderit</p>
                        </div>
                    </div>
                </div><!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service waves-effect">
                        <i class="fa fa-wordpress"></i>
                        <div class="border"></div>
                        <div class="service-content">
                            <h4>WordPress Theme</h4>
                            <p>Duis aute irure dolor inreprehen derit voluptate velit esse cillum dolore fugiat nulla pariatur reprehenderit</p>
                        </div>
                    </div>
                </div><!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service waves-effect">
                        <i class="fa fa-plug"></i>
                        <div class="border"></div>
                        <div class="service-content">
                            <h4>WordPress Plugin</h4>
                            <p>Duis aute irure dolor inreprehen derit voluptate velit esse cillum dolore fugiat nulla pariatur reprehenderit</p>
                        </div>
                    </div>
                </div><!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service waves-effect">
                        <i class="fa fa-joomla"></i>
                        <div class="border"></div>
                        <div class="service-content">
                            <h4>Joomla Template</h4>
                            <p>Duis aute irure dolor inreprehen derit voluptate velit esse cillum dolore fugiat nulla pariatur reprehenderit</p>
                        </div>
                    </div>
                </div><!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service waves-effect">
                        <i class="fa fa-cube"></i>
                        <div class="border"></div>
                        <div class="service-content">
                            <h4>Joomla Extension</h4>
                            <p>Duis aute irure dolor inreprehen derit voluptate velit esse cillum dolore fugiat nulla pariatur reprehenderit</p>
                        </div>
                    </div>
                </div><!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service waves-effect">
                        <i class="fa fa-css3"></i>
                        <div class="border"></div>
                        <div class="service-content">
                            <h4>Bootstrap Template</h4>
                            <p>Duis aute irure dolor inreprehen derit voluptate velit esse cillum dolore fugiat nulla pariatur reprehenderit</p>
                        </div>
                    </div>
                </div><!-- /.col-md-3 -->
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service waves-effect">
                        <i class="fa fa-umbrella"></i>
                        <div class="border"></div>
                        <div class="service-content">
                            <h4>24/7 Support</h4>
                            <p>Duis aute irure dolor inreprehen derit voluptate velit esse cillum dolore fugiat nulla pariatur reprehenderit</p>
                        </div>
                    </div>
                </div><!-- /.col-md-3 -->
            </div>
        </div>
    </section>
    <!-- End Service Section -->
    
    
    
    <!-- Start Fun Facts Section -->
    <section class="fun-facts">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="counter-item waves-effect">
                        <i class="fa fa-cloud-upload"></i>
                        <div class="timer" id="item1" data-to="991" data-speed="5000"></div>
                        <h5>Files uploaded</h5>                               
                      </div>
                    </div>  
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="counter-item waves-effect">
                        <i class="fa fa-check"></i>
                        <div class="timer" id="item2" data-to="7394" data-speed="5000"></div>
                        <h5>Projects completed</h5>                               
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="counter-item waves-effect">
                        <i class="fa fa-code"></i>
                        <div class="timer" id="item3" data-to="18745" data-speed="5000"></div>
                        <h5>Lines of code written</h5>                               
                      </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
                      <div class="counter-item waves-effect">
                        <i class="fa fa-male"></i>
                        <div class="timer" id="item4" data-to="8423" data-speed="5000"></div>
                        <h5>Happy clients</h5>                               
                      </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- End Fun Facts Section -->
    
    
    
    <!-- Start Team Member Section -->
    <section id="team" class="team-member-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="section-title text-center">
                            <h2>Our Team</h2>
                            <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                        </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="team-member">
                        <img src="resources/assets/images/team/face_1.png" class="img-responsive" alt="">
                        <div class="team-details">
                            <h4>John Doe</h4>
                            <div class="designation">Founder & Director</div>
                            <p class="description">Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta.</p>
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="team-member">
                        <img src="resources/assets/images/team/face_2.png" class="img-responsive" alt="">
                        <div class="team-details">
                            <h4>John Doe</h4>
                            <div class="designation">Founder & Director</div>
                            <p class="description">Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta.</p>
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="team-member">
                        <img src="resources/assets/images/team/face_3.png" class="img-responsive" alt="">
                        <div class="team-details">
                            <h4>John Doe</h4>
                            <div class="designation">Founder & Director</div>
                            <p class="description">Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta.</p>
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="team-member">
                        <img src="resources/assets/images/team/face_4.png" class="img-responsive" alt="">
                        <div class="team-details">
                            <h4>John Doe</h4>
                            <div class="designation">Founder & Director</div>
                            <p class="description">Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta.</p>
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
                
        </div>
    </section>
    <!-- End Team Member Section -->
    
    
    
    <!-- Start Call to Action Section -->
    <section class="call-to-action">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Awesome <strong>Navigator</strong> Template is ready for <br> Business, Agency, Landing or Creative Portfolio</h1>
                    <button type="submit" class="btn btn-primary waves-effect">Buy This Template</button>
                </div>
            </div>
        </div>
    </section>
    <!-- End Call to Action Section -->
    
    
    
    <!-- Start Latest News Section -->
    <section id="latest-news" class="latest-news-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h2>Latest News</h2>
                        <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="latest-news">
                    <div class="col-md-4 col-sm-4">
                        <div class="latest-post waves-effect">
                            <img src="resources/assets/images/post-1.jpg" class="img-responsive" alt="">
                            <h4><a href="#">Standard Post with Image</a></h4>
                            
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                            <a class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div class="latest-post waves-effect">
                            <img src="resources/assets/images/post-2.jpg" class="img-responsive" alt="">
                            <h4><a href="#">Standard Post with Image</a></h4>
                            
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                            <a class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div class="latest-post waves-effect">
                            <img src="resources/assets/images/post-3.jpg" class="img-responsive" alt="">
                            <h4><a href="#">Standard Post with Image</a></h4>
                            
                            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                            <a class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- End Latest News Section -->
    
    
    
    <!-- Start Client Section -->
    <section id="client" class="client-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
                        <h2>Our Clients</h2>
                        <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                    </div>
                </div>
            </div>
            <div class="row">
                 
                <div class="col-md-12">
                    <div class="testimonial-section">
                        <div class="testimonial">
                            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
                            <div class="testimonial-people pull-right">
                                <img src="resources/assets/images/clients/client_1.png" class="img-responsive" alt="Testimonial People">
                            </div>
                        </div>
                        <div class="testimonial">
                            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
                            <div class="testimonial-people pull-right">
                                <img src="resources/assets/images/clients/client_2.png" class="img-responsive" alt="Testimonial People">
                            </div>
                        </div>
                        <div class="testimonial">
                            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
                            <div class="testimonial-people pull-right">
                                <img src="resources/assets/images/clients/client_3.png" class="img-responsive" alt="Testimonial People">
                            </div>
                        </div>
                        <div class="testimonial">
                            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
                            <div class="testimonial-people pull-right">
                                <img src="resources/assets/images/clients/client_4.png" class="img-responsive" alt="Testimonial People">
                            </div>
                        </div>
                        <div class="testimonial">
                            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
                            <div class="testimonial-people pull-right">
                                <img src="resources/assets/images/clients/client_5.png" class="img-responsive" alt="Testimonial People">
                            </div>
                        </div>
                        <div class="testimonial">
                            <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.</p>
                            <div class="testimonial-people pull-right">
                                <img src="resources/assets/images/clients/client_6.png" class="img-responsive" alt="Testimonial People">
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section>
    <!-- End Client Section -->
    
    
    
    
    <!-- Start Contact Us Section -->
    <section id="contact" class="contact contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
                        <h2>Contact With Us</h2>
                        <p>Duis aute irure dolor in reprehenderit in voluptate</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row">
                            <div class="col-md-6 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                                <div class="form-group waves-effect">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="name" required data-validation-required-message="Please enter your name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group waves-effect">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" required data-validation-required-message="Please enter your email address.">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group waves-effect">
                                    <input type="tel" class="form-control" placeholder="Your Phone *" id="phone" required data-validation-required-message="Please enter your phone number.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="submit" class="btn btn-primary waves-effect">Send Message</button>
                                <button type="submit" class="btn btn-primary waves-effect">Send Message</button>
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
    <script src="resources/assets/js/script.js"></script>
    <!-- modal -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>
