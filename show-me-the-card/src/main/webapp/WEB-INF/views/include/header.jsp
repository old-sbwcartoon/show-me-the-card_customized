<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
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
        		   			<a href="/showmethecard/member/qnaList.action">My Q&A</a>
						</div>	
                	</div>          		
                </div>
        	</div>
    	</section>
   	</c:otherwise>
</c:choose>
        
	<!-- Login Modal -->
	<div class="container">
		<div class="modal fade" id="loginModal" role="dialog">
		    <div class="modal-dialog">
    	    <!-- Modal content-->
      		<div class="modal-content">
      			<div class="modal-header">
      			<button type="button" class="close" data-dismiss="modal">&times;</button>
      				<div class="row">
	                <div class="col-lg-12">
    	                <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
        	                <h2>LOGIN</h2>
                	    </div>
                	</div>
      				</div>
      			</div>
      			<div class="modal-body">
      				<div class="row">
            		    <div class="col-lg-12">
                   			<form name="sentMessage" action="/showmethecard/account/login.action" method="post" id="contactForm">
                        		<div class="row">
                            		<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                                		<div class="col-md-12 form-group waves-effect">
                                    		<input type="text" class="form-control" placeholder="Your Id *" id="id" name="mId">
                                    		<p class="help-block text-danger"></p>
                                		</div>
                                		<div class="col-md-12 form-group waves-effect">
                                    		<input type="password" class="form-control" placeholder="Your Password *" id="loginpassword" name="password">
                                    		<p class="help-block text-danger"></p>
                                		</div>
                            		</div>
                            		<div class="clearfix"></div>
                            		<div class="modal-footer"> 
                            			<div class="col-lg-12 text-center">
                                			<div id="success"></div>
                                			<button type="submit" id="login" class="btn btn-primary waves-effect">&nbsp;&nbsp;LOGIN&nbsp;&nbsp;</button>
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
	
	<!-- Register Modal -->
	<div class="container">
		<div class="modal fade" id="registerModal" role="dialog">
		    <div class="modal-dialog">
    	    <!-- Modal content-->
      		<div class="modal-content">
      			<div class="modal-header">
      			<button type="button" class="close" data-dismiss="modal">&times;</button>
      				<div class="row">
	                <div class="col-lg-12">
    	                <div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
        	                <h2>JOIN US</h2>
                	    </div>
                	</div>
      				</div>
      			</div>
      			<div class="modal-body">
      				<div class="row">
		                <div class="col-lg-12">
        		            <form name="sentMessage" action="/showmethecard/member/register.action" method="post" id="registerForm">
                       		    <div class="row">
                       		    	<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">
                       		      		<div class="form-group">
                   		      				<input style="height: 40;" type="text" class="form-control" placeholder="Id * (영문+숫자 6~15자 이내)" id="mId" name="mId" />
       		    	                    	<p class="help-block text-danger"></p>
       		    	                    	<button style="height: 30;" id="confirmId" type="button" class="btn btn-primary waves-effect col-md-12 wow fadeInLeft">아이디 중복 확인</button>
	       		    	                    <br/><br/>
  		        	                        <input style="height: 40;" type="password" class="form-control" placeholder="Password * (영문+숫자 6~15자 이내)" id="password" name="password" />
                               		        <p class="help-block text-danger"></p>
                               		        <input style="height: 40;" type="password" class="form-control" placeholder="Confirm Password *" id="passwordConfirm" />
                                    		<p class="help-block text-danger"></p>
                                    		<input style="height: 40;" type="text" class="form-control" placeholder="Name *" id="mName" name="mName" />
                                    		<p class="help-block text-danger"></p>
                                  			<input style="height: 40;" type="tel" class="form-control" placeholder="Phone *" id="phone" name="phone" />
                                  			<p class="help-block text-danger"></p>
                                  			<input style="height: 40;" type="email" class="form-control" placeholder="Email *" id="email" name="email"/>
                                    		<p class="help-block text-danger"></p>
                                		</div>
                            		</div>
                            		<div class="clearfix"></div>
                            		<div class="modal-footer"> 
                            			<div class="col-lg-12 text-center">
                               				<div id="success"></div>
                               		 		<button type="button" id="join" class="btn btn-primary waves-effect">&nbsp;&nbsp;&nbsp;JOIN&nbsp;&nbsp;&nbsp;</button>
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
    <!-- End Header Section -->    