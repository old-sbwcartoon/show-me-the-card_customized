<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">
$(document).ready(function(){
	$("#loginbtn").click(function(){
	    	$("#loginModal").modal();
	});

		$("#registerbtn").click(function(){
			$("#registerModal").modal();
		});
		
		var confirm = false;
	$("#join").click(function(){	
		//회원가입시 중복확인을 안한 경우
		if (!confirm) {
			alert("아이디 중복 확인을 해주세요.");
		} else if ($("#password").val() != $("#passwordConfirm").val()) {
			$("#password").val("");
			$("#passwordConfirm").val("");
			alert("비밀번호가 일치하지 않습니다.");
		} else {
			$("#registerForm").submit();
			confirm = false;
		}
	});
		
	//id 중복 확인
		$("#confirmId").click(function(){
			if ( $("#mId").val() =="") {
				alert("아이디를 입력해주세요!");
			} else {
				$.ajax({
					url : "/showmethecard/member/confirmId.action",
					data : { mId : $("#mId").val() },
					method : "post",
					dataType : "text",
					success : function(data, status, xhr) {
						if (data == "fail") {
							alert("중복된 아이디입니다.");
							$("#mId").val("");
						} else {
							alert("사용 가능한 아이디입니다.");
							confirm = true;
						}
					}
				});
			}	
		});
	
	$("#logoutbtn").click(function(){
		location.href="/showmethecard/account/logout.action";
	});
	
	$("#mypagebtn").click(function() {
		$("#mypage").modal();
	});		
	
});
</script>

	<style type="text/css">
	.header1 li {
		padding: 4px;
		float: left;
	}

	.header1 div a, .dropbtn {
    	display: inline-block;
    	color: white;
    	text-align: center;
    	/* padding: 20px 16px; */
    	text-decoration: none;
	}
	
	.header1 div.dropdown {
    	display: inline-block;
	}

	.header1 .dropdown-content {
    	display: none;
	    position: absolute;
   		background-color: #f9f9f9;
    	min-width: 160px;
    	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    	z-index: 1;
	}

	.header1 .dropdown-content a {
    	color: black;
	    padding: 12px 16px;
    	text-decoration: none;
    	display: block;
    	text-align: left;
	}

	.header1 .dropdown-content a:hover {background-color: #f1f1f1}

	.dropdown:hover .dropdown-content {
    	display: block;
	}
	</style>
<header style="background-color: #333333">
<c:import url="/WEB-INF/views/include/navigator.jsp" />
	<div class="container header1">
		<div class="row">
			<ul class=" navbar-nav">
				<li><a href="/showmethecard/home.action"><img alt="logo" src="/showmethecard/resources/images/logo.PNG"></a></li>
			</ul>
			<c:choose>
				<c:when test="${ empty sessionScope.loginuser }">
					<ul  class="nav navbar-nav navbar-right">
						<li><button style="height: 60; margin:10px 5px;" type="button" id="loginbtn" class="page-scroll waves-effect btn btn-primary">&nbsp;&nbsp;&nbsp; LOGIN &nbsp;&nbsp;</button></li>
	        			<li><button style="height: 60; margin:10px 5px;" type="button" id="registerbtn" class="page-scroll waves-effect btn btn-primary">&nbsp; JOIN US &nbsp;&nbsp;</button></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li><button style="height: 60; margin:10px 5px;" type="button"  id="logoutbtn" class="page-scroll waves-effect btn btn-primary"> &nbsp;&nbsp;&nbsp; LOGOUT &nbsp;&nbsp;</button></li>
						<c:choose>
							<c:when test="${ loginuser.userType eq '1' }">
								<li><div class="dropdown">
                					<button style="height: 60; margin:10px 5px;" type="button" class="dropbtn page-scroll waves-effect btn btn-primary">&nbsp; MY MENU &nbsp;&nbsp;</button>
              			  			<div class="dropdown-content">
     		       						<a id="mypagebtn" href="#">My Page</a>
            							<a href="/showmethecard/member/list.action">Admin Page</a>
									</div>	
                				</div></li>
							</c:when>
							<c:otherwise>
								<li><div class="dropdown">
                					<button style="height: 60; margin:10px 5px;" type="button" class="dropbtn page-scroll waves-effect btn btn-primary">&nbsp; MY MENU &nbsp;&nbsp;</button>
                					<div class="dropdown-content">
     		       						<a id="mypagebtn" href="#">My Page</a>
     		       						<a href="/showmethecard/member/pointList.action">My Point</a>
        				   				<a href="/showmethecard/member/qnaList.action">My Q&A</a>
									</div>	
                				</div></li>
							</c:otherwise>
						</c:choose>
					</ul>		
				</c:otherwise>
			</c:choose>
        </div>   	
	</div>
	
	<!-- Mypage Modal -->
	<div class="container">
		<div class="modal fade" id="mypage" role="dialog">
		    <div class="modal-dialog">
    	    <!-- Modal content-->
      		<div class="modal-content">
      			<div class="modal-header">
      			<button type="button" class="close" data-dismiss="modal">&times;</button>
      				<div class="row">
	                <div class="col-lg-12">
    	                <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
        	                <h2>Password Confirm</h2>
                	    </div>
                	</div>
      				</div>
      			</div>
      			<div class="modal-body">
      				<div class="row">
            		    <div class="col-lg-12">
                   			<form name="sentMessage" action="/showmethecard/member/mypage.action" method="post" id="contactForm">
                        		<div class="row">
                            		<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                                		<div class="col-md-12 form-group waves-effect">
                                    		<input type="password" class="form-control" placeholder="Your Password *" id="mypagePassword" name="password">
                                    		<p class="help-block text-danger"></p>
                                		</div>
                            		</div>
                            		<div class="clearfix"></div>
                            		<div class="modal-footer"> 
                            			<div class="col-lg-12 text-center">
                                			<div id="success"></div>
                                			<button type="submit" id="mypageConfirm" class="btn btn-primary waves-effect">&nbsp;&nbsp;Confirm&nbsp;&nbsp;</button>
                                			<button type="button" class="btn btn-primary waves-effect" data-dismiss="modal">CANCEL</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    
	
</header>
