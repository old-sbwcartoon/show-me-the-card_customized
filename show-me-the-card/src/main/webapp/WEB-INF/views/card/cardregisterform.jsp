<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(document).ready(function() {
	
	alert($('#getFNo').val());
	$('#mycardlist').load("showmycardlist.action");
	var cardNum, check;
	var a = 0;
	var title = "";
	var mycContent = "";
	$('#siteUrl').blur(function() {
		siteUrl = $('#siteUrl').val();
		$.ajax ({
	       	url : "checkurl.action",
	       	method : 'get',
	       	data : "url=" + siteUrl,
	       	dataType : 'html',
	       	//contentType:"application/text; charset=UTF-8",
	       	success : function (data) {
	       		$("#resulttarget").html(data);
	       		title=$('#title').text();
	       		$("#cName").attr("disabled",true).val(title);
	       		a = 1;
	       	},
	       	error : function(xhr, status, err) {
	       		alert("실패");
	       		$("#cName").attr("disabled",false).val("").attr('placeholder',"사이트 혹은 페이지의 이름입니다.");
	       		a = 0;
	       		$("#resulttarget").html("<p align='center' style='color: red;'>주소가 올바르지 않습니다.</P><br>")
			}
	      });
	});

	$("#sendcard").click(function(){
		if(a==1){
			a=0;
			cardNum = $('#cardNoCheck').val();
			check = $('#check').val();
			mycContent = $('#mycContent').val();
			
			var frontJson = {
					siteUrl : siteUrl,
					cName : title,
					cardNo : cardNum,
					mycComment : mycContent,
					tagArray : tagArray
			};
			
			var stringJson = JSON.stringify(frontJson);
			
			$.ajax({
				url : 'cardregisterfin.action',
				method : 'post',
				data : stringJson,
				dataType : 'text',
				contentType:"application/text; charset=UTF-8",
				success : function(data, status, xhr) {
					location.reload();
				},
				error : function(xhr, status, err) {
					alert("실패");
				}
			});
			
		}else{
		alert("주소를 확인하세요");
		}
	});
	
	var tagArray  = new Array;
	var tagCount  = 0;
	var userInput = "";
	var tf = true;
	$('#mycContent').bind('keypress', function(e) {
        if (e.which == 32){//space bar or tab bar
        	if(tagCount < 10){
	        	tf = true;
	       		tagArray = $('#mycContent').val().split(' ');
	       		
	       		for(var i = 0 ; i < tagCount; i++){
	       			if( tagArray[i] == tagArray[tagCount]){
		       			$('#mycContent').empty();
		       			$('#mycContent').val(userInput);
		       			//alert(userInput);
		       			tf =false;
		       			alert("중복입니다.");
	       			}
	       			
	       		}
	       		if(tf){
		       		userInput = $('#mycContent').val();
		       		$("#resultTag").append("<span class='label label-success allTags' id='tag"+tagCount+"'>"+ tagArray[tagCount] +"</span> ");
		       		tagCount++;
		       		
	       		}
        	}else if(tagCount >= 10){
            	
            	alert("TAG는 총 10개까지만 입력이 가능합니다.");
            	
            	$('#mycContent').empty();
       			$('#mycContent').val(userInput);
            } 
//        	else if(e.which == 13){
//        		alert("너는 지금 엔터를 눌렀어");
//        	} 
        	
//        	else { alert("다른건 누르지 말란 말이다!");
//	        	$('#mycContent').empty();
//	   			$('#mycContent').val(userInput);
//        	}
        }else if(e.which == 13){
        	alert("너는 지금 엔터를 눌렀어");
        }else if(e.which == 8){
        	alert("너는 지금 백스페이스를 눌렀어");
        }
       
        
	});
	
	$('#resultTag').on("click", "span[id^=tag]",function(){
		alert($(this).text());
	});
	
	$('#modalbutton').click(function(){
			$('#registercard').modal('show');
	});
	
});
</script>

	<!-- 모달 시작 -->
	<div class="modal fade" id="registercard" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div class="row">
						<div class="col-sm-12">
							<div class="section-title text-center wow fadeInDown" data-wow-duration="2s" data-wow-delay="50ms">
								<h2>ADD MY CARD</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<div class="row">
								<div class="col-md-12 wow fadeInLeft" data-wow-duration="2s"
									data-wow-delay="600ms">
									<div class="col-md-12 form-group waves-effect">
										<p>URL</p><br>
										<input type="text" class="form-control" placeholder="이곳에 사이트 혹은 페이지 URL을 입력하세요 *" id="siteUrl" />
										<p class="help-block text-danger"></p>
									</div>
									
									<div id="resulttarget">
									</div>
									
									<div class="col-md-12 form-group waves-effect">
										<p>Title</p><br>
										<input type="text" class="form-control" placeholder="사이트 혹은 페이지의 이름입니다." id="cName" />
										<p class="help-block text-danger"></p>
									</div>
									<div><h2 id="resultTag"></h2></div><br>
									<div class="col-md-12 form-group waves-effect">
										<p>Tag & 내용</p>
										
										<input type="text" class="form-control" placeholder="선택하신 사이트 혹은 페이지의 내용을 입력하세요 *" id="mycContent" />
										<p class="help-block text-danger"></p>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="modal-footer">
									<div class="col-lg-12 text-center">
										<button type="button" class="btn btn-primary waves-effect" data-dismiss="modal">취소</button>
										<button type="button" id="sendcard" class="btn btn-primary waves-effect">완료</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 끝 -->
	
	<!-- Start Contact Us Section -->
	<section id="contact" class="contact contact-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title text-center wow fadeInDown"
						data-wow-duration="2s" data-wow-delay="50ms">
						<h2>My Card 등록</h2>
						<p>Show Me The Card</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="row">
		<div class="col-lg-12" >
<!-- 			<div><button id="modalbutton" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#registercard">+</button></div> -->
			<div><button id="modalbutton" type="button" class="btn btn-info btn-lg" >+</button></div>
			<div><div id="mycardlist"></div></div>
		</div>
	</div>
	<input id="getFNo" type="hidden" value="${getFNO}"/>
	<div id="test"></div>
