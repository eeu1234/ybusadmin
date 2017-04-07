<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>


<script>

	$(function(){
		$(".content").hide();
		$("#loginLayout").hide();
		$(".content").fadeIn("slow");
 		
		setTimeout(function(){
			$("#loginLayout").fadeIn("slow");
			
		}, 500);
		
		
					
			 		$("#up").animate({
					
						left: '+=25%',
						}, 500, function() { // Animation complete.
					}); 
			 		
			 		$("#down").animate({
					
			 			left: '-=25%',
						}, 500, function() { // Animation complete.
					}); 
			 	
			 		$("#up").animate({
						
						top: '+=25%',
						}, 300, function() { // Animation complete.
					}); 
			 		
			 		$("#down").animate({
					
			 			top: '-=25%',
						}, 300, function() { // Animation complete.
					}); 
	})
		
		

 
	
		
		
		
		
	
</script>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	padding: 0;
	max-width: 1440px;
}

#container {
	position: relative;
	width: 100%;
	height: 80%;
	margin: 0 auto;
}

#loginLayout{
	position:relative;
	width:40%;
	height:100%;
	margin:0 auto;
	padding-top:15%;
	text-align:center;
	
}
#frm{
	width:100%;
	margin: 0 auto;
	text-align: center;
}

#up, #down {
	width: 40%;
	height: auto;
	 transition-timing-function: ease-in;
	 z-index:3;
}

#up {
	position: absolute;
	bottom: 25%;
	right: 25%; 
	/* 	transform: rotate(20deg);
		transition-property:transform;
		transition-duration: 2s; */
}

#down {
	position: absolute;
	top: 25%;
	left: 25%;
}

.door {
	width: 100%;
	height: auto;
}
</style>
</head>
<body>
	
	<div id="container">
	<div id="up" class="content">
			<img src="/spring/images/loginPage/icon2.png" class="door" />
		</div>
		<div id="down" class="content">
			<img src="/spring/images/loginPage/icon1.png" class="door" />
		</div>
		
	<div id="loginLayout">
		<img src="/spring/images/loginPage/loginLogo.png" style="width:70%;height:auto;margin-bottom:5%;" />
		<form method="POST" action="/spring/admin/adminLoginOk.action" id="frm">
	
			<input type="text" name="id" required class="form form-control" placeholder="ID">
			<br> <input type="password" name="pw" class="form form-control" required placeholder="PASSWORD">
			<br> <input	type="submit" value="로그인" class="btn btn-primary" style="width:100%;">
	
		</form>
	</div>
	</div>
</body>
</html>