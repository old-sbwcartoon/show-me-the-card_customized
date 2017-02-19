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
	$(document).ready(
			function() {
				// 클릭이벤트
				$("#addFolder").click(function() {
					var f_modal = $("#loginModal")
					$('#fName').attr('value', '');
					f_modal.find('h2').text("폴더 추가");
					f_modal.modal('show');

				});

				// 폴더 register ajax
				$('#register').click(
						function() {
							if ($('#fName').val() != "") {
								$.ajax({
									url : 'register.action',
									type : 'post',								
									data : {
										mId : $('#mId').val(),
										fName : $('#fName').val()
									},
									dataType : 'json',
									success : function(data) {
										/* var li = $('#folderbasic').clone(true);
										li.find('#folderbasicimg').attr('src', "/showmethecard/resources/images/cardpack.png")
										li.css('display' , 'inline')
										li.attr("id", "folder_"+ data.fNo)
										li.find('#fNo').attr("value", data.fNo)
										li.text(data.fName)  */
										
										$('#folderpage').append(
												/* li) */
												
										  $('<button type="button" id="folder_' + data.fNo + '" class="folderbasic" style="border: 0px; margin: 0px; padding: 0px; width: 75px; height: 100px; margin-bottom: 20px"><img id="folderbasicimg" style="height: 100px" class="btn-img"	src="/showmethecard/resources/images/cardpack.png"><input type="hidden" id="fNo" name="fNo" value="' + data.fNo+ '">'+ data.fName + '</button>')
										) 

									}

								});
							} else {
								alert("폴더 명을 입력하세요.");
								return false;
							}
						});
	
	
	
	
	
	
				
				$('#delete').click(
						function() {
							if ($('#fName').val() != "") {
								$.ajax({
									url : 'register.action',
									type : 'post',								
									data : {
										mId : $('#mId').val(),
										fName : $('#fName').val()
									},
									dataType : 'json',
									success : function(data) {
										/* var li = $('#folderbasic').clone(true);
										li.find('#folderbasicimg').attr('src', "/showmethecard/resources/images/cardpack.png")
										li.css('display' , 'inline')
										li.attr("id", "folder_"+ data.fNo)
										li.find('#fNo').attr("value", data.fNo)
										li.text(data.fName)  */
										
										$('#folderpage').append(
												/* li) */
												
										  $('<button type="button" id="folder_' + data.fNo + '" class="folderbasic" style="border: 0px; margin: 0px; padding: 0px; width: 75px; height: 100px; margin-bottom: 20px"><img id="folderbasicimg" style="height: 100px" class="btn-img"	src="/showmethecard/resources/images/cardpack.png"><input type="hidden" id="fNo" name="fNo" value="' + data.fNo+ '">'+ data.fName + '</button>')
										) 

									}

								});
							} else {
								alert("폴더 명을 입력하세요.");
								return false;
							}
						});

				
						
				   
				
				$('#folderpage').on("click", "button[id^=folder_]",
						function(event) {

							var f_id = event.currentTarget.id;
							var fNo = f_id.split("_")[1];

							$('#fName').attr('value',
									event.currentTarget.childNodes[2].data);
														
							
							$('#delete').remove();	
							
							
							
							var f_modal = $("#loginModal");
							
							//if ($('#register').length = ""){
							 if (!(!!$("#register").length)) {
								var b_reg = $("#update")	
							} else {
								var b_reg = $("#register")	
							}
							
							
							var b_delete = b_reg.clone(true);
							
							b_reg.attr('id','update');
							b_delete.attr('id','delete');
							
							b_reg.text("수정")
							b_delete.text("삭제")
							
							
							$('#buttondiv').append(b_delete);
							f_modal.find('h2').text("폴더 수정");
							
							f_modal.modal('show');
							
							
						});

			});
</script>





</head>
<body class="index">

	<c:choose>
		<c:when test="${ empty sessionScope.loginuser }">
			<c:import url="/WEB-INF/views/include/navigator.jsp" />
			<!-- 삭제하기 -->
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




			<%-- <button type="button" id="folderbasic" class="folderbasic"
				style="display : none; border: 0px; margin: 0px; padding: 0px; width: 75px; height: 100px; margin-bottom: 20px"><img id="folderbasicimg" style="height: 100px" class="btn-img"
					src="/showmethecard/resources/images/cardpack.png"><input type="hidden" id="fNo" name="fNo" value=${ folder.fNo }>${ folder.fName }</button> --%>


<span id = 'folderpage' > 
	<c:forEach var="folder" items="${ folders }">

		
			<button type="button" id="folder_${ folder.fNo }" class="folderbasic"
				style="border: 0px; margin: 0px; padding: 0px; width: 75px; height: 100px; margin-bottom: 20px"><img id="folderbasicimg" style="height: 100px" class="btn-img"
					src="/showmethecard/resources/images/cardpack.png"><input type="hidden" id="fNo" name="fNo" value=${ folder.fNo }>${ folder.fName }</button>
		
	</c:forEach>


</span>

	<button type="button" id="addFolder"
		style="border: 0px; margin: 0px; margin-bottom: 20px; padding: 0px; width: 75px; height: 100px">
		<img style="height: 100px" class="btn-img"
			src="/showmethecard/resources/images/cardpackplus.png">

	</button>







	<!-- Start Modal Section -->

	<div class="container">
		<div class="modal fade" id="loginModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<div class="row">
							<div class="col-lg-12">
								<div class="section-title text-center wow fadeInDown"
									data-wow-duration="2s" data-wow-delay="50ms">
									<h2>폴더 추가</h2>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-lg-12">
								<form name="sentFolder" id="contactForm" novalidate>
									<div class="row">
										<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s"
											data-wow-delay="600ms">
											<div class="col-md-12 form-group waves-effect">
												<input type="hidden" id="mId" name="mId"
													value="${ loginuser.mId }"> <input type="text"
													class="form-control" placeholder="폴더이름" id="fName"
													name="fName" required
													data-validation-required-message="Please enter your id.">
												<p class="help-block text-danger"></p>
											</div>
											<!-- <div>
												<div class="col-md-12 form-group waves-effect"
													style="float: left; width: 33%">
													<input type="text" class="form-control" placeholder="#TAG1"
														id="password" name="ft_name1" required
														data-validation-required-message="Please enter your password.">
													<p class="help-block text-danger"></p>
												</div>
												<div class="col-md-12 form-group waves-effect"
													style="float: left; width: 33%">
													<input type="text" class="form-control" placeholder="#TAG2"
														id="password" name="ft_name2" required
														data-validation-required-message="Please enter your password.">
													<p class="help-block text-danger"></p>
												</div>
												<div class="col-md-12 form-group waves-effect"
													style="float: left; width: 33%">
													<input type="text" class="form-control" placeholder="#TAG3"
														id="password" name="ft_name3" required
														data-validation-required-message="Please enter your password.">
													<p class="help-block text-danger"></p>
												</div>
											</div> -->
										</div>
										<div class="clearfix"></div>
										<div class="modal-footer">
											<div id="buttondiv" class="col-lg-12 text-center">
												<div id="success"></div>
												<button type="button" id="register"
													class="btn btn-primary waves-effect" data-dismiss="modal">&nbsp;&nbsp;등록&nbsp;&nbsp;</button>
												<button type="button" id="cancel" class="btn btn-primary waves-effect"
													data-dismiss="modal">&nbsp;&nbsp;취소&nbsp;&nbsp;</button>

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
	<!-- End Modal Section -->















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
