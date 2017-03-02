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

<script type="text/javascript">		
	$(document).ready(function() {
		/* $('#resultTag').on("click", "span[id^=tag]",function(){
			alert($(this).text());
			
			
		}); */
	 		/* $("#scrapUrl").on("click", "li[id^=scrap]", function(){
	 			alert($(this).text());
	 			debugger;
	 			var ssss = $("#hiddenInput > input[id^=myc]").val();
	 			alert(ssss);
	 			
	 			
	 			
				//alert(asdf);
	 		}); */
	}); 	
</script>

</head>

<section id="team" class="team-member-section" style="background-color : hsl(0, 100%, 100%);">
<%-- <c:set var="incNum" value="${0}" /> --%>
<c:forEach var="MyCardList" items="${ mycardListList }">
<%--<c:set var="증감변수명" value="${incNum + 1}"/> --%>

	
	<div class="col-md-3 col-sm-6">
	
		<div style="border: 10px solid hsl(200, 75%, 50%); height: 500px; margin-bottom:10px; border-radius: 25px; background-color:hsl(200, 50%, 80%);">
			<div style="border: 5px solid hsl(200, 0%, 30%); height: 460px; margin:10px;">
				<div class="team-member" style="margin: 10px;">
					<div id="imgdiv"
						style="height: 290px; text-align: center; overflow: hidden;">
						<img id="imgSrc" src="${MyCardList.imgSrc}"
							class="img-responsive thumbnail" alt="">
					</div>

					<div class="team-details">
						<h4 id="titleM" style="height:65px; overflow:hidden; padding-top: 2%;">${MyCardList.cName}</h4>
						<p id="contentM" class="description" style="height:100px; overflow:hidden;">${MyCardList.urlDesc}</p>
						<ul id="scrapUrl">
							<li><a href="/showmethecard/mypage/scrap.action?mycNo=${ MyCardList.mycNo }&pageOwner=${pageOwner}"><i class="fa fa-facebook"></i>스크랩</a></li>
							<li><a href="${ MyCardList.url }" target="_blank"><i class="fa fa-twitter"></i>이동</a></li>
							<li><a href='/showmethecard/evaluation/evaluationmain.action?cardNo=${ MyCardList.cardNo }'><i class="fa fa-linkedin"></i>품평</a></li>
						</ul>
						<br>
	
						<div>
							<p>최초발견자 : ${MyCardList.discoverer}</p>
						</div>
						<div id="hiddenInput">
						<input id="cardNoCheckM" type="hidden" value="${MyCardList.cardNo}" />
						<input id='toUrl' type="hidden" value="${MyCardList.url}" />
						<input id='mycNo' type="hidden" value="${MyCardList.mycNo}" />
						</div>
						<%-- <input id='incNum' type="hidden" value="${incNum}" /> --%>
					</div>
				</div>
				
				<div style="text-align: center;">
						<h3>${MyCardList.mycComment}</h3>
				</div>
				<c:if test="${ pageOwner == mId }">
				<h3><a  href="/showmethecard/mypage/delmycard.action?mycNo=${ MyCardList.mycNo }&pageOwner=${pageOwner}" style="float:right;margin-top:10px;margin-right:10px;"><i class='glyphicon glyphicon-remove-circle'></i>삭제</a></h3>
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>
</section>
