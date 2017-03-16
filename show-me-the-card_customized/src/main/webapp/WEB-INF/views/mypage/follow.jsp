<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	
	
	$('#searchid').on('keyup', function() {
		$.ajax({
			url : "searchfollow.action",
			type : "post",
			data : {
				frId : $('#searchid').val()
			},
			dataType : "json",
			success : function(data) {
				$('.d').remove();
				for (var i = 0; i < data.length; i++) {
					$('<tr><th><img style="height: 35; width: 35;" src="/showmethecard/resources/level/'+data[i].mLevel+'.PNG">'+data[i].mId+'</th><th><button id="button_'+ data[i].mId+'">추가</button></th></tr>').appendTo('#addbutton').attr('class','d');
				}
			},
			error : function(data) {
				alert("실패");
			}
		});
	});	
	
	
	//addbutton 추가버튼 클릭시 버튼날아가고 db저장
	$('#addbutton').on('click', 'button[id^=button_]',
			function(event) { 
				
				var b_id = event.currentTarget.id;
				var fr_id = b_id.split("_")[1];
				
				$.ajax({
					url : "registerfollow.action",
					type : "post",
					data : {
						frId : fr_id
					},
					dataType : "text",
					success : function(data) {
						$('#'+b_id).remove();
						alert("성공");
						
					},
					error : function(data) {
						alert("실패");
					}
				});
				
			
			});
	
	
	$('#frienddiv').on('click', 'button[id^=delete_]',
			function(event) { 
				
				var b_id = event.currentTarget.id;
				var fr_id = b_id.split("_")[1];
				
				$.ajax({
					url : "deletefollow.action",
					type : "post",
					data : {
						frId : fr_id
					},
					dataType : "text",
					success : function(data) {
						alert("성공");
						location.reload()					
					},
					error : function(data) {
						alert("실패");
					}
				});
				
			
			});
	
	$('#userTotal').click(function(event) {
		reload()
	});
	
});
	
</script>




</head>
<body class="index">


<c:import url="/WEB-INF/views/include/header.jsp" />

    <!-- Strat Chart Section -->
    <div class="about-us-section-2">
    	<div class="container">
    		<div class="row">
    			
    			<div class="col-md-8" style = "margin-left: 190px;">
    				<h1>Follow</h1>
    				<br/>
    				<br/>
    				<ul class="nav nav-tabs"  style="font-size: 23">
    					<li id = "refreshlist" class="active"><a href="myfollow.action" >친구목록(${fn:length(friends)})</a></li>
			    		<li><a data-toggle="tab" class = "sendidbutton" id="daily" href="#userDaily" >친구검색</a></li>
    					
    				</ul>
    				<div class="tab-content">
    					<div id="userTotal" class="tab-pane fade in active">
    						<table class="table">
    							<thead>    								
    								<tr style="font-size: 18; color: black;">
    									<!-- <th>레벨</th> -->    									
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">삭제버튼</th>
    								</tr>
    								
    							</thead>
    							<tbody id="frienddiv">
    								<c:forEach var="friend" items="${ friends }">
    									<tr class="del">
    										<!-- <th>레벨</th> -->
    										
    										<th style ="cursor:hand;" onclick="location.href='/showmethecard/mypage/mypage.action?goId=${ friend.mId }'"><img style="height: 35; width: 35;"
    										 src='/showmethecard/resources/level/${ friend.mLevel}.PNG' >${ friend.mId }</th>
    										<th><button id="delete_${ friend.mId }">삭제</button></th>
    									</tr>
		    						</c:forEach>
    							</tbody>					
    						</table>
    					</div>
    					<div id="userDaily" class="tab-pane fade">
    						<table class="table">
    							<thead>
    								<tr style="font-size: 18; color: black;">
    									
    									<th><input type="text"
													class="form-control" placeholder="친구아이디" id="searchid"
													name="searchid" required
													data-validation-required-message="Please enter your id.">
													</th>
													<th style="width: 250"><button>검색</button></th>
    								</tr>
    								<tr style="font-size: 18; color: black;">
    									<!-- <th>레벨</th> -->    									
    									<th style="width: 250">아이디</th>
    									<th style="width: 200">추가버튼</th>
    								</tr>
    							</thead>
    							<tbody id="addbutton">
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

 <script src="../resources/assets/js/script.js"></script>

</html>
