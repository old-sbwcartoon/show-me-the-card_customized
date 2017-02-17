<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>EvaluationMain</title>
<!-- Bootstrap Core CSS -->
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/bootstrap/css/bootstrap.min.css">
    
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/font-awesome.min.css">
    
    <!-- Animate CSS -->
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/animate.css">
    
    <!-- Owl-Carousel -->
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/owl.carousel.css" >
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/owl.theme.css" >
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/owl.transitions.css" >

    
    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    
    <!-- Materialize CSS -->
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/material.css">   
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/responsive.css">
    
    <!-- Colors CSS -->
    <link rel="stylesheet" type="text/css" href="/showmethecard/resources/assets/css/color/blue.css" title="blue">
    
    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        
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
    <script src="/showmethecard/resources/assets/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/showmethecard/resources/assets/js/jquery.easing.1.3.js"></script>
    <script src="/showmethecard/resources/assets/js/classie.js"></script>
    <script src="/showmethecard/resources/assets/js/count-to.js"></script>
    <script src="/showmethecard/resources/assets/js/jquery.appear.js"></script>
    <script src="/showmethecard/resources/assets/js/owl.carousel.min.js"></script>
    <script src="/showmethecard/resources/assets/js/jquery.fitvids.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="/showmethecard/resources/assets/js/jqBootstrapValidation.js"></script>

    <!-- Materialize js -->
    <script src="/showmethecard/resources/assets/js/material.js"></script>
    <script src="/showmethecard/resources/assets/js/waypoints.min.js"></script>

    
	<style type="text/css">
	#columns{ column-width:300px; }
    
	    #columns figure{
	      display: inline-block;
	      column-width:360.66px;
	      padding:10px;
	    }
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
	h2 { font-style: italic; }
	
	textarea.autosize { height: 20px; }
		
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
		    $('#register').click(function() {
		        $.ajax({
		            url:'register.action',
		            type : 'post',
		            /* data : '('form').serialize()',		             */
		            data: { mId : $('#mId').val(),
		            		fName : $('#fName').val()
		            	  },	            
		            success:function(data){		                
		            	$('#folder').clone().appendTo($('#fName').val()).before($('#addFolder'))
		            	
		            }
		        });
		    });
		    /* mId : $('#eval-writer').text() */
		    /* 좋아요 누르면 실행 */
		    $('.eval-item').each(function() {
		    	$(this).click(function() {
		    		alert($(this).children().find($('.writer-id')).text());
		    		$.ajax({
		    			url  : '/showmethecard/evaluation/addevalratingliked.action',
			    		type : 'GET',
			    		data : {
			    			cardNo : 2,
			    			mId : $(this).children().find($('.writer-id')).text()
			    		},
			    		success : function(data) {
			    			alert(1);
			    			$(this).children().find($('.liked-sum')).text(data);
			    		}
			    	});
		    	})
		    		
		    });
		    
		    /* textarea auto resize */
		    $("textarea.autosize").on('keydown keyup', function () {
	    		$(this).height(1).height( $(this).prop('scrollHeight')+12 );
	    	});
		    
		    $("#div-comment-submit").click(function() {
		    	$('#eval-comment-form').submit();
		    });
		    
		    
		});
	</script>
	</head>
<body>
<c:choose>
 	<c:when test="${ empty sessionScope.loginuser }">
    	<c:import url="/WEB-INF/views/include/navigator.jsp" />  <!-- 삭제하기 -->
    	<!-- Start Header Section -->
	    <section class="header" id="home">
        	<div class="container">
           		<div class="intro-text">
                	<h1>Show Me the <span>Cards</span></h1>
                	<button type="button" id="loginbtn" class="page-scroll waves-effect btn btn-primary">&nbsp;&nbsp;&nbsp; LOGIN &nbsp;&nbsp;</button>
                	<button type="button" id="registerbtn" class="page-scroll waves-effect btn btn-primary">&nbsp; JOIN US &nbsp;&nbsp;</button>
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
                	<h1>Show Me the <span>Cards</span></h1>
                	<button type="button"  id="logoutbtn" class="page-scroll waves-effect btn btn-primary"> &nbsp;&nbsp;&nbsp; LOGOUT &nbsp;&nbsp;</button>
                	<div class="dropdown">
                		<button type="button" class="dropbtn page-scroll waves-effect btn btn-primary">&nbsp; MY MENU &nbsp;&nbsp;</button>
                		<div class="dropdown-content">
            				<a id="mypagebtn" href="#">My Page</a>
            				<a href="/showmethecard/member/list.action">Admin Page</a>
            				<a href="/showmethecard/member/pointList.action">My Point</a>
            				<a href="#">My Q&A</a>
            			</div>	
                	</div>          		
                </div>
        	</div>
    	</section>
   	</c:otherwise>
</c:choose>
	<section id="client" class="client-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
                        <h2>${title}</h2><br>
                        <h4 style="color: gold;">#해쉬태그 #해쉬태그 #해쉬태그</h4>
                        <h2>..</h2>
                        <p>${desc}</p>
                    </div>                    
                    <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="10ms">
                    	<h2 style="color: gold;">
	                		<c:if test="${ requestScope.eRatingAvg lt 1.000 }">
	 								☆
	                    	</c:if>
	                    	<c:if test="${ requestScope.eRatingAvg lt 2.000 and requestScope.eRatingAvg ge 1.000 }">
	 								★
	                    	</c:if>
	                    	<c:if test="${ requestScope.eRatingAvg lt 3.000 and requestScope.eRatingAvg ge 2.000 }">
	 								★★
	                    	</c:if>
	                    	<c:if test="${ requestScope.eRatingAvg lt 4.000 and requestScope.eRatingAvg ge 3.000 }">
	 								★★★
	                    	</c:if>
	                    	<c:if test="${ requestScope.eRatingAvg lt 5.000 and requestScope.eRatingAvg ge 4.000 }">
	 								★★★★
	                    	</c:if>
	                    	<c:if test="${ requestScope.eRatingAvg eq 5.000 }">
	 								★★★★★
	                    	</c:if>
                    		${ requestScope.eRatingAvg }
                    	</h2>
                    </div>
                    <br><br><br>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-12">
            		<div class="counter-item" id="imgdiv">
						<a id="thumbnaillink" href="${url}">
							<img id="thumbnail" src="${img}"/>
						</a>
					</div>
					
            	</div>
            </div>
            
            <div class="row">                 
                <div class="col-md-12">
                    
                    <c:forEach var="ratinglist" items="${ requestScope.evalRatingList }">
                        <div class="eval-item counter-item service waves-effect text-center" style="height:230px; padding:25px 35px;">
	                        <div id="erating" style="float:left; width:100%; border-bottom: dotted 2.5pt darkgray;">
		                        <h2>
		                        	<c:if test="${ ratinglist.eRating eq 0 }">
			                        	☆
		                        	</c:if>
			                        <c:if test="${ ratinglist.eRating eq 1 }">
			                        	★
		                        	</c:if>
		                        	<c:if test="${ ratinglist.eRating eq 2 }">
			                        	★★
		                        	</c:if>
		                        	<c:if test="${ ratinglist.eRating eq 3 }">
			                        	★★★
		                        	</c:if>
		                        	<c:if test="${ ratinglist.eRating eq 4 }">
			                        	★★★★
		                        	</c:if>
		                        	<c:if test="${ ratinglist.eRating eq 5 }">
			                        	★★★★★
		                        	</c:if>
	                        	</h2>
	                        </div>
	                        <div>
	                        	<div style="float:left;">
			                        <div class="eval-writer" style="float:left; margin-right:20px;">
				                        <h2><span class="writer-id">${ ratinglist.mId }</span> 님 : </h2>
									</div>
									<div style="float:left; margin-left:20px;">
			                            <h2>${ ratinglist.content }</h2>
									</div>
									<%-- <div style="position:relative; bottom:0px">
										<p>
											등록일: ${ ratinglist.regDate }<br>
										</p>
									</div> --%>
								</div>
								<div class="text-right" style="position:relative; top:35px;">
									<i style="border-radius:2px; padding:10px;">좋아요 !! <span class="liked-sum">${ratinglist.eLikedSum}</span></i>
								</div>
	                        </div>
                        	
                        </div>
					</c:forEach>
                        
                </div>
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section>
    <!-- End Client Section -->
    <section id="about-us" class="about-us-section-1">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="section-title text-center">
                        <h2>Say Comments</h2>
                        <p>hello, little ones !!!</p>
                    </div>
                    <div id="columns" class="row">
	                	<figure class="dummy-figure"><div style="margin:10px 0px;"></div></figure>	                
	                    <figure class="dummy-figure"><div style="margin:10px 0px;"></div></figure>		                
		                <figure>
		                    <div class="welcome-section text-center" style="height: 170px; margin:10px 0px;">
		                    	<form id="eval-comment-form" action="/showmethecard/evaluation/addevalcomment.action" method="GET">
			               			<p>
			               				<textarea id="comment-textarea" name="content" class="autosize" rows="3" maxlength="1100" style="size:20pt; width:100%; overflow: hidden; border:none; resize: none;" placeholder="새 댓글..?" >
			               				</textarea>
			               			</p>
			               		</form>
			               	</div>
							<div id="div-comment-submit" class="counter-item waves-effect">
								<i class="fa fa-check">
								</i>
		                	</div>
	                    </figure>
	                </div>
                </div>
            </div>
            
            <div id="columns" class="row">
				<c:forEach var="commentlist" items="${ requestScope.evalCommentList }">
	                <figure>
	                    <div class="welcome-section text-center" style="margin:10px 0px;">
	                        <h4>${ commentlist.mId }</h4>
	                        <p>${ commentlist.content }</p>
		                </div>
	                </figure>
	            </c:forEach>
            </div><!-- /.row -->
            
        </div><!-- /.container -->
    </section>
    
</body>
</html>