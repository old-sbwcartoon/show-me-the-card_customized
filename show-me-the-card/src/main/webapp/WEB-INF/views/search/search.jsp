<?xml version="1.0" encoding="utf-8" ?>

<%@page import="org.springframework.web.bind.annotation.RequestBody"%>
<%@page import="com.rnh.showmethecard.model.dto.Member"%>
<%@page import="com.rnh.showmethecard.model.dto.Card"%>
<%@page import="com.rnh.showmethecard.model.dto.Folder"%>
<%@page import="com.rnh.showmethecard.ui.ThePager"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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

<style type="text/css">
.green_window {
	display: inline-block;
	width: 366px;
	height: 34px;
	border: 3px solid #2db400;
	background: white;
}

.input_text {
	width: 348px;
	height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}

.sch_smit {
	width: 54px;
	height: 40px;
	margin: 0;
	border: 0;
	vertical-align: top;
	background: #22B600;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}

.sch_smit:hover {
	background: #56C82C;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	   
   	$('#searchbtn').on("click",function(event){
   		$.ajax({
			url : "/showmethecard/search/searchMember.action",
			method : "get",
			data : {fName : $('#search').val() } ,
			dataType : "json",
			success : function(data, status, xhr) {
				alert(data[0].mId);
				alert(data[0].mLevel);				
			},
			error : function(data) {
				alert("실패");
			}
		});
		/* $.ajax({
			url : "/showmethecard/search/search.action",
			method : "get",
			dataType : "json",
			success : function(data, status, xhr) {
				$('.d').remove();
				for (var i = 0; i < data.length; i++) {
					$('<tr><th><img src="resources/level/'+data[i].mLevel+'.PNG"></th><th>'+data[i].mId+'</th><th>'+data[i].mPoint+'</th></tr>').appendTo('#dailyTable').attr('class','d');
				}
			},
			error : function(data) {
				alert("실패");
			}
		}); */
		
	  
   }); 	
});
</script>
</head>

<body>

	<span class='green_window'> <input type='text' class='input_text' id='search'>
	</span>		
	<button type='button' class='sch_smit' id="searchbtn">검색</button>
	
	
	<div class="table-responsive">
	      <table class="table">
	          <thead>
	            <tr style="font-size: 18; color: white;">
				</tr>
	          </thead>
	          <tbody class="tbody">
						<tr>
							<th></th>
							<th></th>
						</tr>
	          </tbody>
	      </table>
       </div>
</body>
</html>


