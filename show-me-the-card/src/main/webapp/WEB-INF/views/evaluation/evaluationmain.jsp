<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>EvaluationMain</title>
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


<!-- Custom Fonts -->
<link href='http://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>

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


<style type="text/css">
#columns {
	column-width: 300px;
}

#columns figure {
	display: inline-block;
	column-width: 360.66px;
	padding: 10px;
}

textarea.autosize {
	height: 20px;
}

.box {
	background-color: rgb(220, 220, 220);
	border-radius: 4px;
	border: solid 2.5pt darkgray;
	margin: 30px 20px;
	padding: 5px 5px;
	float: left;
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

#div-card {
	margin-bottom: 80px;
}

#div-title {
	padding: 20px;
}

#div-thumbnail {
	height: 400px;
	width: 260px;
	border-radius: 2px;
}

#div-thumbnail-img {
	height: 260px;
	width: 260px;
	cursor: pointer;
	background-color: white;
}

#div-thumbnail-text {
	height: ;
	background-color: white;
	text-align: right;
	padding: 20px;
}

#link-thumbnail {
	/* height: 300px;
	width: 260px; */
	display: block;
}

.eval-item {
	height: 230px;
	padding: 25px 35px;
} 

#myeval {
	background-color: gold;
} 

.desc {
	font-size: 15px;
	letter-spacing: -0.023em;
	height: 64px;
	margin-top: 16px;
}

.div-line {
	height: 40px;
	width: 100%;
}

.border-bottom-dotted {
	 border-bottom: dotted 2.5pt darkgray;
}
.border-top-dotted {
	 border-top: dotted 2.5pt darkgray;
}

.div-eval {
	position: relative;
	top: 35px;
}

.div-eval-text {
	width: 70%;
	float: left;
}

#div-eval-submit {
	margin-top: 50px;
	width: 10%;
	float: right;
}

#div-eval-del {
	position: relative;
	top: -55px
}
#div-eval-del img {
	height: 40px; width: auto;
}

.img-evaluation-del {
	position: absolute;
	right: 0px;
}

.div-text {
	float: left;
}

.div-btn {
	float: right;
}

h2 {
	font-style: italic;
	margin-top: -5px;
}

#div-eval-write .star {
	cursor: pointer;
}

#div-write-erating {
	cursor: pointer;
}

.fnc-icon {
	cursor: pointer;
}
</style>

<script type="text/javascript">
		$(document).ready(function() {
			var loginId = $('#loginusermId').val();
			var cardNo = $('#cardNo').val();
			var ratingAvg = $('#hidden-star-avg').val();
			
			
		    /* 이미지 크기 결정 */
			var imgDiv = $('#div-thumbnail-img');
			var img = $('#img-thumbnail');
			var imgWidth = img.width(); // 초기 값
			var imgHeight = img.height(); // 초기 값
			
		    var divisor = 3;
		    var bigRatio = 0.75;
		    var smallRatio = 0.20;
			
		    if (img.width() > img.height()) { // 사진의 가로가 세로보다 크면
		    	if (img.width() < imgDiv.width() / divisor) { // 그런데 div를 어떤 숫자로 나눈 값보다 작으면
		    		img.css("width", imgDiv.width() * smallRatio);
		    	} else { // 그런데 div를 어떤 숫자로 나눈 값보다 크거나 같으면
			    	img.css("width", imgDiv.width() * bigRatio); // 사진의 가로를 div에 맞추고 세로는 auto
		    	}
		    	img.css("height", 'auto');
	    		addDummyDiv();
	    		
		    } else {
		    	if (img.height() < imgDiv.height() / divisor) {
		    		img.css("height", imgDiv.height() * smallRatio);
		    	} else {
			    	img.css("height", imgDiv.height() * bigRatio); // 사진의 세로를 div에 맞추고 가로는 auto
		    	}
		    	img.css("width", 'auto');
	    		addDummyDiv();
	    		
		    }
		    
		    /* 이미지를 가운데 정렬하기 위해 더미 div 생성 */
		    function addDummyDiv() {
	    		imgDiv.prepend($('<div>', {
			    	id  : "div-dummy-thumbnail",
			    	css : {
			    		height  : (imgDiv.height() - img.height()) / 2
			    		, width : imgDiv.width()
			    	}
		    	}));	    			    		
		    }
		    		    
		    /* show writebox or my eval */
		    if ($('.hidden-rating-isevalrating').val() === 'true') {
		    	showEvalWriteOrMine("mine");
		    } else {
		    	showEvalWriteOrMine("write");
		    }
		    
		    /* setting star average */
		    setStar($('#div-title .star'), ratingAvg);
		    
		    $('.div-star').each(function() {
		    	setStar( $(this).find('.star'), $(this).find('.hidden-star-no').val() );
		    });
		    
		    //// custom functions ////////////////////////////////////////////////////////////////////////////////////////
		    
		    /* show div by having liked */
		    function showDivLikedYet(target) {
		    	target.find($('.liked-yet')).css('display', '');
		    	target.find($('.liked-already')).css('display', 'none');
		    }
		    
		    function showDivLikedAlready(target) {
		    	target.find($('.liked-yet')).css('display', 'none');
		    	target.find($('.liked-already')).css('display', '');
		    }
		    
		    /* show eval write or mine */
		    function showEvalWriteOrMine(keyWord) {
		    	if (keyWord == "write") {
		    		$('#div-eval-write').css('display', '');
			    	$('#div-eval-mine').css('display', 'none');
		    	} else if (keyWord == "mine") {
		    		$('#div-eval-mine').css('display', '');
			    	$('#div-eval-write').css('display', 'none');
		    	}
		    }
		    		    
		    /* set rating star */
		    function setStar(targetTag, decimalStarNo) {
		    	var star = "";
		    	var starNo = Math.round(decimalStarNo);

		    	if (starNo == -1) {
		    		star = "평가가 더 필요해요!";
		    	}
	    		if (starNo == 0) {
	    			star = '☆';
	    		} else {
	    			for (var i = 0; i < starNo; i++) {
			    		star += '★';
			    	}
	    		}
		    	targetTag.text(star);
		    }

			/* delete with animation */
			function delWithAnimation(target) {
				target.animate({
					opacity : '0'
				},
				function() {
					target.remove();
				});
			}			
			
			/* confirm with animation */
			function confirmWithAnimation(target, message) {
				target.animate({
					opacity : '0.5' 
				}, "fast",
				function() {
					if (confirm(message)) {
						isConfirm = true;
					} else {
						target.animate({
							opacity : '1.0'
						});
						isConfirm = false;
					}
				});
				return isConfirm;
			}
			
		    //// event listener /////////////////////////////////////////////////////////////////////////////////////////
		    
		    
		    /* 별품평 제어 */
		    var arr = $('#div-write-erating').find('.star');
		    var starArr = [];
		    
		    $('#div-write-erating').on("click", function() {
		    	$('#hidden-set-star-no').val($(this).attr('title'));
		    	arr.text('☆');
		    });
	    	for(i = 0; i < arr.length; i++) {
	    		starArr[i] = arr.eq(i);
	    		starArr[i].on("mouseover", function(event) {
	    			event.stopPropagation();
	    			$(this).text('★').prevAll().text('★');
	    		});
	    		starArr[i].on("mouseout", function(event) {
	    			event.stopPropagation();
	    			$(this).text('☆').prevAll().text('☆');
	    		});
	    		starArr[i].on("click", function(event) {
	    			event.stopPropagation();
	    			$(this).off("mouseover").off("mouseout").prevAll().off("mouseover").off("mouseout");
	    			$(this).nextAll().off("mouseover").off("mouseout");
	    			$(this).text('★').prevAll().text('★');
	    			$(this).nextAll().text('☆');

	    			$('#hidden-set-star-no').val($(this).attr('title'));
	    		});
	    	}

	    	var pageNoHidden = $('#hidden-pageno-eval');
			$('#go-prev').on("click", function() {
				if (pageNoHidden.val() > 1) {
					pageNoHidden.val(pageNoHidden.val() - 1);
				}
			});
			var pageNoMax = $('#hidden-pagenomax-eval').val();
			$('#go-next').on("click", function() {
				if (pageNoHidden.val() > pageNoMax) {
					pageNoHidden.val(pageNoHidden.val() + 1);
				}
			});
		    
		    /* 좋아요 누르면 실행 */
		    $('.div-display-liked').each(function() {
		    	var divLiked = $(this).parent().parent();
		    	var writerId = divLiked.find($('.hidden-rating-writer')).val();
		    	var isLiked  = divLiked.find($('.hidden-rating-isliked')).val();
		    	
		    	if ( (isLiked === 'true') || (loginId == writerId) ) {
		    		showDivLikedAlready($(this));
			    } else {
			    	showDivLikedYet($(this));
			    }
		    });
			
		    
	    	$(document).on("click", '.i-liked-sum',
	    		function(event) {
		    			var divLiked = $(event.target).parent().parent().parent();
				    	var writerId = divLiked.find($('.hidden-rating-writer')).val();
				    	var isLikedHidden  = divLiked.find($('.hidden-rating-isliked'));
    	
			    		if ( (loginId != writerId) && //로그인한 유저와 글쓴이 아이디가 다르고
			    				(isLikedHidden.val() === 'false') && //좋아요!! 를 아직 누르지 않았고
			    				(confirm("좋아요?")) ) { //확인을 눌렀다면
			    			
				    		$.ajax({
				    			url  : '/showmethecard/evaluation/addevalratingliked.action',
					    		type : 'POST',
					    		data : {
					    			eRatingNo : divLiked.find($('.hidden-rating-no')).val(),
					    			mId       : writerId
					    		},
					    		success : function() {
					    			var hiddenData = $(event.target).parent().find('.hidden-liked-sum');
					    			var likedSum = parseInt(hiddenData.val());
					    			$(event.target).parent().find('.liked-sum').text(likedSum + 1);
					    			showDivLikedAlready(divLiked);
					    		}
					    	});
		    		}
    		});
		    
	    	
	    	

	    	/* submit evaluation */
		    $("#div-eval-submit").click(function() {
		    	var spaceTrimedContent = $.trim($('#eval-textarea').val());

		    	if (spaceTrimedContent &&// spaceTrimedContent가 not !(null || "" || NaN || 0) 
		    			confirm("등록하시겠습니까?")) {
		    		
		    		$.ajax({
		    			url  : '/showmethecard/evaluation/addevalrating.action',
		    			type : 'POST',
		    			data : {
		    				cardNo  : cardNo,
		    				eRating : $('#hidden-set-star-no').val(),
		    				content : spaceTrimedContent
		    			},
		    			dataType : 'json',
		    			success : function(data) {
							var newEvalDiv = $("#div-eval-submit").parent().parent().parent();

							newEvalDiv.find('.hidden-rating-no').val(data.eRatingNo);
							newEvalDiv.find('.hidden-rating-writer').val(data.mId);
							newEvalDiv.find('.hidden-rating-isliked').val(data.mLiked);
							newEvalDiv.find('.hidden-rating-writer').val(data.mId);
							newEvalDiv.find('.hidden-star-no').val(data.eRating);
							setStar(newEvalDiv.find('#div-eval-mine .star'), data.eRating);
							
							newEvalDiv.find('.eval-writer-id').text("내 품평 : ");
							newEvalDiv.find('.div-eval-text-content').find('h2').text(data.content);
							newEvalDiv.find('.hidden-liked-sum').val(data.eLikedSum);
							newEvalDiv.find('.liked-sum').text(data.eLikedSum);
							
							showEvalWriteOrMine("mine");
		    			}
		    		});
		    	}
		    });
	    	
	    	
	    	/* submit comment */
		    $('#div-comment-submit').on("click", function() {
		    	var spaceTrimedContent = $.trim($('#comment-textarea').val());
		    	
		    	if (spaceTrimedContent) { // spaceTrimedContent가 not !(null || "" || NaN || 0) 
		    		
		    		$.ajax({
		    			url  : '/showmethecard/evaluation/addevalcomment.action',
		    			type : 'POST',
		    			data : {
		    				cardNo  : cardNo,
		    				content : spaceTrimedContent
		    			},
		    			dataType : 'json',
		    			success : function(data) {
							$('#comment-textarea').val("");
							
							var newDiv = $('#div-comment-first').clone(true);
							newDiv.css('display', '');
		    				newDiv.find('.commentno').val(data.eCommentNo);
		    				newDiv.find('#hidden-comment-isfirst').val(false);
		    				newDiv.find('.comment-writer-id').text(loginId);
		    				newDiv.find('p').text(spaceTrimedContent);
		    				
		    				newDiv.hide().prependTo($('.div-comment-list')).fadeIn(1000);
		    			}
		    		});
		    	}
		    });

	    	
	    	
	    	
	    	
	    	
	    	
	    	/* delete evaluation */
			 $('#div-neweval').on("click", '.img-evaluation-del',
				 function(event) {
					var evaluationDiv = $(event.target).parent().parent();
					var writermId = evaluationDiv.find($('.hidden-rating-writer')).val();
					var evaluationNo = evaluationDiv.find($('.hidden-rating-no')).val();
	
					if ( (loginId == writermId) && 
						(confirm("삭제하시겠습니까?")) ) {
						
						$.ajax({
							url  : '/showmethecard/evaluation/delevalrating.action',
							type : 'POST',
							data : {
								eRatingNo : evaluationNo
							},
							success :
								function() {
									$('#eval-textarea').val("");
									showEvalWriteOrMine("write");
								}
						});
					}
			});
	    	
	    	/* delete comment */
			$('.div-comment-list').on("click", '.img-comment-del',
					function(event) {
						var commentDiv = $(event.target).parent().parent().parent();
						var commentNo = commentDiv.find('.commentno').val();
						var writermId = commentDiv.find('.comment-writer-id').text();
						
							if ( (loginId == writermId) && 
								(confirm("삭제하시겠습니까?")) ) {
								
								$.ajax({
									url : '/showmethecard/evaluation/delevalcomment.action',
									type : 'POST',
									data : {
										cardNo : cardNo,
										eCommentNo : commentNo
									},
									success : function() {
										if (commentDiv.find('#hidden-comment-isfirst').val() === 'true') {
											commentDiv.animate({
												opacity : '0'
											},
											function() {
												commentDiv.css('display', 'none');
											});
										} else {
											delWithAnimation(commentDiv);
										}
									}
								});
					}
				
			});

			
		});
	</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<input id="loginusermId" type="hidden" value="${ loginuser.mId }" />
	<input id="cardNo" type="hidden" value="${ requestScope.card.cardNo }" />
	
	<section id="eval-rating" class="client-section">
	<div id="div-card" class="container">
		<div class="row">
			<div class="col-md-12" class="counter-item">
				<div id="div-thumbnail" style="float:left;">
					<div id="div-thumbnail-img" class="text-center" onclick="window.open('${requestScope.htmlParser.url}')">
						<img id="img-thumbnail" src="${requestScope.htmlParser.img}" />
					</div>
					<div id="div-thumbnail-text">
						<span class="label label-danger" style="font-size: 12pt;">${ requestScope.card.cPoint }</span>
						<h5>DISCOVERER : ${ requestScope.card.discover } 님</h5>
						<input id="hidden-card-regdate" type="hidden" value="${ requestScope.card.regDate }" />
						<h5>등록일 : <fmt:formatDate value="${ requestScope.card.regDate }" pattern="yyyy/MM/dd kk:mm:ss" /></h5>
					</div>
				</div>
				<div id="div-title">
					<div class="section-title text-center wow">
						<h2 style="margin-bottom: 20px;">${requestScope.htmlParser.title}</h2>
						<!-- <br> -->
						<h4 style="color: gold;">
						<c:forEach var="bestTag" items="${ requestScope.bestTagList }">
								#${ bestTag.bestTagName }&nbsp;&nbsp;&nbsp;
						</c:forEach>
						</h4>
						<br>
						<!-- <h2>..</h2> -->
						<p>${requestScope.htmlParser.desc}</p>
						
					</div>
					<div class="section-title text-center">
						<input id="hidden-star-avg" type="hidden" value="${ requestScope.eRatingAvg }" />
						<h2 style="color: gold;">
							<span class="star"></span>
							<c:if test="${ requestScope.eRatingAvg ne -1 }">
								${ requestScope.eRatingAvg }
							</c:if>
						</h2>
					</div>
					<br>
					<br>
					<br>
				</div>
				
				
			</div>
			
		</div><!-- row end -->		
	</div><!-- container end -->



	<div class="container">
		<div class="row">
			<div class="col-md-12">			
				<input class="hidden-rating-isevalrating" type="hidden" value="${ requestScope.isEvalRating }" />
				
				<div id="div-neweval">
				<!-- write new eval -->
					<div id="div-eval-write" class="eval-item counter-item text-center" style="display: none;">
						<div id="div-write-erating" class="border-bottom-dotted" style="position: relative; float: left; width: 100%;" title="0">
							<input id="hidden-set-star-no" type="hidden" value="0" />
							<h2>
								<span class="star" title="1">☆</span>
								<span class="star" title="2">☆</span>
								<span class="star" title="3">☆</span>
								<span class="star" title="4">☆</span>
								<span class="star" title="5">☆</span>
							</h2>
						</div>
						<div class="div-eval">
							<div class="div-eval-text">
								<h2>
									<textarea id="eval-textarea" name="content" rows="3"
										maxlength="50"
										style="height: 100%; width: 100%; overflow: hidden; border: none; resize: none;"
										placeholder="새 품평..! 한 카드에 한 번만 작성할 수 있습니다. (50글자까지)"></textarea>
								</h2>
							</div>
							<div id="div-eval-submit" class="div-btn waves-effect">
								<img class="fnc-icon"
									src="/showmethecard/resources/images/comment-send.png" />
							</div>
						</div>
					</div><!-- new eval end -->
				
					
					
				<!-- my eval -->
					<div id="div-eval-mine" class="eval-item counter-item text-center" style="display: none;">
						<input class="hidden-rating-no" type="hidden" value="${ requestScope.myRating.eRatingNo }" />
						<input class="hidden-rating-writer" type="hidden" value="${ requestScope.myRating.mId }" />
						<input class="hidden-rating-isliked" type="hidden" value="${ requestScope.myRating.mLiked }" />
						
						<div class="div-star border-bottom-dotted" style="width: 100%;">
							<input class="hidden-star-no" type="hidden" value="${ requestScope.myRating.eRating }" />
							<h2><span class="star"></span></h2>
						</div>
						
						<div id="div-eval-del">
								<img class="fnc-icon img-evaluation-del"
									src="/showmethecard/resources/images/comment-del.png" />
						</div>
						<div class="div-eval">
							<div class="div-eval-text">
								<div class="eval-writer"
									style="float: left; margin-right: 20px;">
									<h2>
										<span class="eval-writer-id">내 품평 : </span>
									</h2>
								</div>
								<div class="div-eval-text-content" style="float: left; margin-left: 20px;">
									<h2>${ requestScope.myRating.content }</h2>
								</div>
								<%-- <div style="position:relative; bottom:0px">
										<p>
											등록일: ${ requestScope.myRating.regDate }<br>
										</p>
									</div> --%>
							</div>
							<div class="div-display-liked text-right">
								<i class="i-liked-sum service waves-effect liked-already"
									style="border: none; border-radius: 2px; padding: 10px 20px; background-color: #26a8e1; color: white;">
										<input class="hidden-liked-sum" type="hidden" value="${ requestScope.myRating.eLikedSum }" />
										<span class="liked-sum">${ requestScope.myRating.eLikedSum }</span>&nbsp;
										<img class="img-liked" src="/showmethecard/resources/images/liked-inversed.png" style="width: 30px;" />
								</i>
							</div>
						</div>
					</div><!-- my eval end -->
					
					
				</div><!-- new eval end -->
		
		
		<div class="div-line border-top-dotted"></div>
		
		
				<div id="div-eval-list">
						<c:forEach var="ratinglist" items="${ requestScope.evalRatingList }">
							<div class="eval-item counter-item text-center" style="height: 230px; padding: 25px 35px;">
								<input class="hidden-rating-no" type="hidden" value="${ ratinglist.eRatingNo }" />
								<input class="hidden-rating-writer" type="hidden" value="${ ratinglist.mId }" />
								<input class="hidden-rating-isliked" type="hidden" value="${ ratinglist.mLiked }" />
								
								<div class="div-star border-bottom-dotted" style="width: 100%;">
									<input class="hidden-star-no" type="hidden" value="${ ratinglist.eRating }" />
									<h2><span class="star"></span></h2>
								</div>
								
								<div class="div-eval">
									<div class="div-eval-text">
										<div class="eval-writer"
											style="float: left; margin-right: 20px;">
											<h2>
												<span class="eval-writer-id">${ ratinglist.mId }</span> 님 :
											</h2>
										</div>
										<div class="div-eval-text-content" style="float: left; margin-left: 20px;">
											<h2>${ ratinglist.content }</h2>
										</div>
										<%-- <div style="position:relative; bottom:0px">
												<p>
													등록일: ${ ratinglist.regDate }<br>
												</p>
											</div> --%>
									</div>
									<div class="div-display-liked text-right">
		
										<i class="i-liked-sum service waves-effect liked-yet"
											style="border: none; border-radius: 2px; padding: 10px 20px; display: none">
												<input class="hidden-liked-sum" type="hidden" value="${ ratinglist.eLikedSum }" />
												<span class="liked-sum">${ ratinglist.eLikedSum }</span>&nbsp;
												<img class="img-liked" src="/showmethecard/resources/images/liked.png" style="width: 30px;" />
										</i>
										<i class="i-liked-sum service waves-effect liked-already"
											style="border: none; border-radius: 2px; padding: 10px 20px; background-color: #26a8e1; color: white; display: none">
												<input class="hidden-liked-sum" type="hidden" value="${ ratinglist.eLikedSum }" />
												<span class="liked-sum">${ ratinglist.eLikedSum }</span>&nbsp;
												<img class="img-liked" src="/showmethecard/resources/images/liked-inversed.png" style="width: 30px;" />
										</i>
		
									</div>
		
								</div>
							</div>
						</c:forEach>
		
					</div><!-- eval-list end -->
				<div class="text-center" >
					<input id="hidden-pageno-eval" type="hidden" value="1" />
					<%-- <input id="hidden-pagenomax-eval" type="hidden" value="${ requestScope.evalPageNoMax }" />
					<h1><span id="go-prev">&lt;</span>&nbsp;&nbsp;&nbsp;&nbsp;<span id="go-next">></span></h1> --%>
				</div>
			</div><!-- col-md-12 -->
		</div><!-- /.row -->
	</div><!-- /.container -->
	</section>
	<!-- end eval-rating section -->
	<section id="eval-comment" class="services-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="section-title text-center">
					<h2>Say Comments</h2>
					<p>hello, little ones !!!</p>
				</div>

				
	<!-- write new comment -->
				<div id="columns" class="row">
					<figure class="dummy-figure">
						<div style="margin: 10px 0px;"></div>
					</figure>
					<figure class="dummy-figure">
						<div style="margin: 10px 0px;"></div>
					</figure>
					<figure>
						<div id="div-comment-write" class="service text-center"
							style="height: 220px; margin: 10px 0px;">
							<p style="padding: 0px;">
								<textarea id="comment-textarea" name="content" class="autosize"
									rows="5" maxlength="300"
									style="height: 100%; width: 100%; overflow: hidden; border: none; resize: none;"
									style='IME-MODE:active;' placeholder="새 댓글..! (300글자까지)"></textarea>
							</p>
							<div id="div-comment-submit" class="waves-effect">
								<img class="fnc-icon"
									src="/showmethecard/resources/images/comment-send.png" />
							</div>
						</div>
					</figure>
				</div>
	<!-- end write -->
	
			</div>
		</div>

		<div id="columns" class="row div-comment-list">
			<div id="div-comment-first" class="div-comment" style="display: none;">
				<input class="commentno" type="hidden" value="" />
				<input id="hidden-comment-isfirst" type="hidden" value="true" />
				<figure>
					<div class="service text-center" style="margin: 10px 0px;">
						<h4 class="comment-writer-id"></h4>
						<p></p>
						<img class="fnc-icon img-comment-del"
							src="/showmethecard/resources/images/comment-del.png"
							style="margin-top: 10px; height: 26px; width: auto;" />
					</div>
				</figure>
			</div>
			<c:forEach var="commentlist" items="${ requestScope.evalCommentList }">
				<div class="div-comment">
					<input class="commentno" type="hidden" value="${ commentlist.eCommentNo }" />
					<figure>
						<div class="service text-center" style="margin: 10px 0px;">
							<h4 class="comment-writer-id">${ commentlist.mId }</h4>
							<p>${ commentlist.content }</p>
							<c:if test="${ loginuser.mId eq commentlist.mId }">
								<img class="fnc-icon img-comment-del"
									src="/showmethecard/resources/images/comment-del.png"
									style="margin-top: 10px; height: 26px; width: auto;" />
							</c:if>
						</div>
					</figure>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container --> </section>

</body>
	<!-- Custom JavaScript -->
    <script src="../resources/assets/js/script.js"></script>
</html>