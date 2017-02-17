<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- <%@ page import="com.rnh.showmethecard.model.dto.CardBasicInfo"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
	<script type="text/javascript">		
		$(document).ready(function() {
			var imgDiv = $('#imgdiv');
			var img = $('#thumbnail');
			var imgWidth = img.width(); // 초기 값
			var imgHeight = img.height(); // 초기 값
			
		    var divisor = 2;
		    var ratio = 0.75;
			
		    /* 이미지 크기 결정 */
		    if (img.width() > img.height()) { // 사진의 가로가 세로보다 크면
		    	if (img.width() < imgDiv.width() / divisor) { // 그런데 div를 어떤 숫자로 나눈 값보다 작으면
		    		img.css("width", imgDiv.width() * ratio);
		    	} else { // 그런데 div를 어떤 숫자로 나눈 값보다 크거나 같으면
			    	img.css("width", imgDiv.width()); // 사진의 가로를 div에 맞추고 세로는 auto
		    	}
		    	img.css("height", 'auto');
	    		addDummyDiv();
	    		
		    } else {
		    	if (img.height() < imgDiv.height() / divisor) {
		    		img.css("height", imgDiv.height() * ratio);
		    	} else {
			    	img.css("height", imgDiv.height()); // 사진의 세로를 div에 맞추고 가로는 auto
		    	}
		    	img.css("width", 'auto');
	    		addDummyDiv();
	    		
		    }
		    
		    
		    
		    /* 이미지를 가운데 정렬하기 위해 더미 div 생성 */
		    function addDummyDiv() {
	    		imgDiv.prepend($('<div>', {
			    	id  : "dummybeforethumbnail",
			    	css : {
			    		height  : (imgDiv.height() - img.height()) / 2
			    		, width : imgDiv.width()
			    	}
		    	}));
		    }
		    
		});
	</script>
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
					<div id="imgdiv" style="height:290px; width:294px; text-align:center; overflow:hidden;">
						<img src="${img}" class="img-responsive thumbnail" alt="">
					</div>
					<div class="team-details">
						<h4 id="title">${title}</h4>
						<div class="designation">Founder & Director</div>
						<p class="description">${desc}</p>
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i>스크랩</a></li>
							<li><a href="#"><i class="fa fa-twitter"></i>이동</a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i>품평</a></li>
							<!-- <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li> -->
						</ul>
						<input id="resultUrlCheck" type="hidden" value="${resultCheck}"/>
						<input id="cardNoCheck" type="hidden" value="${cardNo}"/>
					</div>
				</div>
			</div>
		</div>

	</div>
	
	</section>
</body>
</html>