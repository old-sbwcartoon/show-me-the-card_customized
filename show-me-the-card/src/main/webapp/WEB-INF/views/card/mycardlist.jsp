<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="com.rnh.showmethecard.model.dto.MyCardList"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page import="com.rnh.showmethecard.model.dto.CardBasicInfo"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">		
	 	$(document).ready(function() {
			$('#moveToSite').click(function(){
				window.open($("#toUrl").val());
			});
		}); 
</script>


<section id="team" class="team-member-section" style="background-color : hsr(50,50,50);">
<c:forEach var="MyCardList" items="${ mycardListList }">

		<!-- width:294px;  -->
		<!-- <div class="row" > -->
		<!-- <div class="col-lg-6 col-md-3"style="float:left;" > -->
			<div class="col-md-3 col-sm-6">
			
				<div class="team-member">
					<div id="imgdiv" style="height:290px; text-align:center; overflow:hidden;">
						<img id="imgSrc" src="${MyCardList.img}" class="img-responsive thumbnail" alt="">
					</div>
					<div class="team-details">
						<h4 id="titleM">${MyCardList.title}</h4>
						
						<p id="contentM" class="description">${MyCardList.desc}</p>
						
						<ul>
							<li><a href="#"><i class="fa fa-facebook"></i>스크랩</a></li>
							<li id="moveToSiteM"><a href="#"><i class="fa fa-twitter"></i>이동</a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i>품평</a></li>
						</ul>
						<br>
						
						<div><p>test</p></div>
						
						<input id="cardNoCheckM" type="hidden" value="${MyCardList.cardNo}"/>
						<input id="toUrlM" type="hidden" value="${MyCardList.url}"/>
					</div>
				</div>
				
			</div><!-- <div class="col-md-3 col-sm-6">  -->
		<!-- </div> -->

</c:forEach>
</section>