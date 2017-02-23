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
		}); 
</script>


<section id="team" class="team-member-section" style="background-color : hsr(50,50,50);">
<c:set var="incNum" value="${0}" />
<c:forEach var="MyCardList" items="${ mycardListList }">

	<div class="col-md-3 col-sm-6">
	
		<div style="border: 5px solid hsl(0, 100%, 50%); height: 500px; margin-bottom:10px; border-radius: 25px;">
		
			<div class="team-member" style="margin: 10px;">
				<div id="imgdiv"
					style="height: 290px; text-align: center; overflow: hidden;">
					<img id="imgSrc" src="${MyCardList.imgSrc}"
						class="img-responsive thumbnail" alt="">
				</div>
				<div class="team-details">
					<h4 id="titleM">${MyCardList.title}</h4>

					<p id="contentM" class="description">${MyCardList.mycComment}</p>

					<ul>
						<li><a href="#"><i class="fa fa-facebook"></i>스크랩</a></li>
						<li><a href="${MyCardList.url}" target="_blank"><i
								class="fa fa-twitter"></i>이동</a></li>
						<li><a href='/showmethecard/evaluation/evaluationmain.action?cardNo=${ MyCardList.cardNo }'><i class="fa fa-linkedin"></i>품평</a></li>
						
					</ul>
					<br>

					<div>
						<p>test</p>
					</div>

					<input id="cardNoCheckM" type="hidden" value="${MyCardList.cardNo}" />
					<input id='toUrl' +${incNum} type="hidden"
						value="${MyCardList.url}" /> <input id='incNum' type="hidden"
						value="${incNum}" />
				</div>
			</div>
			
			<div>
					<h3>${MyCardList.mycComment}</h3>
			</div>
		</div>
		
	</div>
</c:forEach>
</section>