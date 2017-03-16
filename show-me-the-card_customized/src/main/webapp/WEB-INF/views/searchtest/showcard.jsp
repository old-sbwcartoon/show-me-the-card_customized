<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

	<style type="text/css">
		.box {
			background-color: rgb(220,220,220);
			border-radius: 4px;
			border: solid 2.5pt darkgray;
			margin: 30px 20px;
			padding: 5px 5px;
		}
		.backface {
			width: 300px;
			height: 500px;
			background: url('/showmethecard/resources/images/bg-repeat.png') repeat;
		}
		.gradient {
			filter: alpha(opacity=8);
			opacity: 0.8;
			background: red; /* For browsers that do not support gradients */
			background: -webkit-linear-gradient(left top, red, yellow); /* For Safari 5.1 to 6.0 */
			background: -o-linear-gradient(bottom right, red, yellow); /* For Opera 11.1 to 12.0 */
			background: -moz-linear-gradient(bottom right, red, yellow); /* For Firefox 3.6 to 15 */
			background: linear-gradient(to bottom right, red, yellow); /* Standard syntax */
		}
		.textbox {
			height: 80px; 
			width: 260px;
		}
		.title {
			font-size: 24px;
			font-weight: bold;
			font-style: italic;
			word-break: keep-all;
			overflow: hidden;
			text-overflow: ellipsis;
			border-bottom: dotted 2.5pt darkgray;
			padding-bottom: 5px;
		}
		.desc {
			font-size: 15px;
			letter-spacing: -0.023em;
			height: 64px;
			margin-top: 16px;
		}
	</style>
	
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
</head>
<body>

	<div class="box" style="width:300px; height:500px;">
		<div id="imgdiv" style="height:290px; width:294px; text-align:center; overflow:hidden; border:ridge rgb(245,245,245);">
			<a id="thumbnaillink" href="${url}">
				<img id="thumbnail" src="${img}"/>
			</a>
		</div>
		<div style="height:168px; width:260px; margin:5px 0px; padding:16px 20px; background-color:rgb(245,245,245);">
			<div class="textbox title">${title}</div>
			<div class="textbox desc">${desc}</div>
		</div>
	</div>
	
	<div class="box backface"></div>
	<div class="box backface gradient"></div>
</body>
</html>