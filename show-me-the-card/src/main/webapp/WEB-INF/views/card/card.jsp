<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- <%@ page import="com.rnh.showmethecard.model.dto.CardBasicInfo"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<section id="team" class="team-member-section">
	
	<div class="container">
	
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="section-title">
					<h5>선택하신 주소는</h5>
					<p>최초 등록 입니다.</p>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="team-member">
					<img src="${img}" class="img-responsive" alt="">
					<div class="team-details">
						<h4>${title}</h4>
						<div class="designation">Founder & Director</div>
						<p class="description">${desc}</p>
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i>스크랩</a></li>
							<li><a href="#"><i class="fa fa-twitter"></i>이동</a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i>품평</a></li>
							<!-- <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	</section>
</body>
</html>