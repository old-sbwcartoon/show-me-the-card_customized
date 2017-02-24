<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <!-- Start Off=Canvas Navigation Section -->
	<div class="menu-wrap">
		<nav class="menu">
			<div class="icon-list">
			<a href="/showmethecard/home.action" class="logo page-scroll waves-effect">Site Cards</a>
				<a href="/showmethecard/member/register.action" class="page-scroll waves-effect"><i class="fa fa-fw fa-user"></i><span>JOIN US</span></a>
				<a href="/showmethecard/account/login.action" class="page-scroll waves-effect"><i class="fa fa-fw fa-bell-o"></i><span>LOGIN</span></a>
				<a href="#service" class="page-scroll waves-effect"><i class="fa fa-fw fa-bar-chart-o"></i><span>Services</span></a>
				<a href="#team" class="page-scroll waves-effect"><i class="fa fa-fw fa-users"></i><span>Our Team</span></a>
				<a href="#latest-news" class="page-scroll waves-effect"><i class="fa fa-fw fa-mortar-board"></i><span>Latest News</span></a>
				<a href="#client" class="page-scroll waves-effect"><i class="fa fa-fw fa-comment-o"></i><span>Testimonial</span></a>
				<a href="#contact" class="page-scroll waves-effect"><i class="fa fa-fw fa-envelope-o"></i><span>Contact</span></a>
				<a href="/showmethecard/qna/qnaList.action" class="page-scroll waves-effect"><i class="fa fa-fw fa-comment-o"></i><span> Q&A </span></a>
				<a href="/showmethecard/mypage/cardregister.action" class="page-scroll waves-effect"><i class="fa fa-fw fa-envelope-o"></i><span> CardSearch&Register</span></a>
				<a href="/showmethecard/notice/noticeList.action" class="page-scroll waves-effect"><i class="fa fa-fw fa-bell-o"></i><span> Notice </span></a>
				<a href="/showmethecard/evaluation/evaluationmain.action?cardNo=2" class="page-scroll waves-effect"><i class="fa fa-fw fa-envelope-o"></i><span>Evaluation</span></a>
				<a href="/showmethecard/search/search.action" class="page-scroll waves-effect"><i class="fa fa-fw fa-mortar-board"></i><span>Search</span></a>
			</div>
		</nav>
		<button class="close-button" id="close-button">Close Menu</button>
	</div>
	<button class="menu-button waves-effect" id="open-button">Open Menu</button>
    <!-- End Off-Canvas Navigation Section -->
	
</header>
