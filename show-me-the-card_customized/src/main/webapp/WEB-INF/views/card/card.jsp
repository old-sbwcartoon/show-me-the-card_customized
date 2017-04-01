<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <%@ page import="com.rnh.showmethecard.model.dto.CardBasicInfo"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<!-- <script src="http://code.jquery.com/jquery-3.1.1.js"></script> -->
<script type="text/javascript">		
		$(document).ready(function() {
			var desc = $('#hidden-content').val();
			
			$('#content').text(subStr(desc, 100));
			
			$('#moveToSite').click(function(){
				window.open($("#toUrl").val());
			});
			
			
			function subStr(str, length) {
		    	if (str.length > length) {
		    		str = str.substring(0, length) + "..";
			    }
		    	return str;
		    }
		});
</script>



<body>
	<section id="team" class="team-member-section" style="background-color : white;">
	
	<div class="container">
	
		<div class="row">
			<div class="col-sm-12">
				<div class="section-title">
					<h4>선택하신 주소는</h4>
					<c:if test="${cardNo == 0 }">
					<p>최초 등록 입니다.</p>
					</c:if>
				</div>
			</div>
		</div>
		<!-- width:294px;  -->
		<div class="row">
			<div class="col-md-3 col-sm-6">
			
				<div class="team-member">
					<div id="imgdiv" style="height:290px; text-align:center; overflow:hidden;">
						<img id="imgSrc" src="${img}" class="img-responsive thumbnail" alt="">
					</div>
					<div class="team-details">
						<h4 id="title">${title}</h4>
						
						<input id="hidden-content" type="hidden" value="${desc}" />
						<p id="content" class="description"></p>
						
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i>스크랩</a></li>
							<li id="moveToSite"><a href="#"><i class="fa fa-twitter"></i>이동</a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i>품평</a></li>
						</ul>
						<br>
												
						<input id="cardNoCheck" type="hidden" value="${cardNo}"/>
						<input id="check" type="hidden" value="${check}"/>
						<input id="toUrl" type="hidden" value="${url}"/>
					</div>
				</div>
				
			</div><!-- <div class="col-md-3 col-sm-6">  -->
		</div>
		
	</div>
	
	</section>
	<br>
		<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12" style="">
			<div class="col-lg-2 col-md-4 col-sm-4 col-xs-4" style="background-color:red;"></div>
			<!-- <p class="col-lg-2 col-md-4 col-sm-4 col-xs-4">test</p> -->
			<!-- <div class="col-lg-2 col-md-4 col-sm-4 col-xs-4" style="background-color:red;"></div> -->
		</div>
</body>
</html>
