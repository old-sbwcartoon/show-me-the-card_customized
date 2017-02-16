<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>EvaluationMain</title>

	<style type="text/css">
		.box {
			background-color: rgb(220,220,220);
			border-radius: 4px;
			border: solid 2.5pt darkgray;
			margin: 30px 20px;
			padding: 5px 5px;
			float: left;
		}
		.textbox {
			height: 180px; 
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
		    
		    /* 
		    // 별점
		    var starArr = {"★","★","★","★","★"};
		    
		    function show(imagenr) 
		    {
		        if (locked) return;
		        var i;
		        var image;
		        var el;

		        for (i=1; i<=imagenr; i++) {
		            image = 'image' + i;
		            el = document.getElementById(image);
		            el.src="star1.gif";
		        }
		    }


		    function noshow(imagenr)
		    {
		        if (locked) return;
		        var i;
		        var image;
		        var el;

		        for (i=1; i<=imagenr; i++) {
		            image = 'image' + i;
		            el = document.getElementById(image);
		            el.src="star0.gif";
		        }
		    }

		    function lock(imagenr)
		    {
		        show(imagenr);
		        locked = 1;
		    }

		    function mark(imagenr)
		    {
		        //show(imagenr);
		        //locked = 1;
		        lock(imagenr);

		        var e = document.getElementById('ratetext');
		        e.innerHTML = "You rated: ";

		        //store rating on server
		        var xmlhttp;
		        try {
		            xmlhttp = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP");
		        } catch (e) {
		            // todo
		        }
		        var qs = '/test2.html?rate=' + imagenr;
		        xmlhttp.open("GET", qs);
		        xmlhttp.send(null);
		    } */
		});
	</script>
</head>
<body>

	<div class="box" style="height:800px; width:300px;">
		<div id="imgdiv" style="height:290px; width:294px; text-align:center; overflow:hidden; border:ridge rgb(245,245,245);">
			<a id="thumbnaillink" href="${url}">
				<img id="thumbnail" src="${img}"/>
			</a>
		</div>
		<div style="height:368px; width:260px; margin:5px 0px; padding:16px 20px; background-color:rgb(245,245,245);">
			<div class="textbox title">${title}</div>
			<div class="textbox desc">${desc}</div>
		</div>
	</div>

	<div id="evaluation" class="box" style="height:400px; width:800px;">평점<p>
		<form name="evaluationform" method="GET" action="/showmethecard/evaluation/evaluationsend.action">
			<input name="rating" type="text" style="weight:700px;" value="rating"/>
			<input name="comment" type="text" style="weight:700px;" value="comment"/>
			<input id="evalcommentsubmit" type="submit" value="평가"/>
		</form>
		<form name="evaluationlikedform" method="GET" action="/showmethecard/evaluation/evaluationaddliked.action">
			<input id="evallikedsubmit" name="" type="submit" value="좋아요"/>
		</form>
	</div>
	<div class="box" style="height:400px; width:800px;">
		
	</div>
	<div class="box" style="height:400px; width:800px;">
		
	</div>
	
</body>
</html>