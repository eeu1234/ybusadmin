<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>


<script>
	
</script>

<style>
body {
	width: 100%;
	height: auto;
	max-width: 1440px;
	
}
#container{
	position:relative;
	width:100%;
	height:100%;
	margin:0 auto;
	background-image: url("/spring/images/loginbackground.png");
	background-repeat: no-repeat;
	margin-top:5%;
}

#loginLayout{
	position:relative;
	width:40%;
	height:100%;
	margin:0 auto;
	padding-top:10%;
	text-align:center;
	
}
#frm{
	width:100%;
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	
	<div id="container">
		<div id="loginLayout">
			<img src="/spring/images/loginLogo.png" style="width:70%;height:auto;margin-bottom:5%;" />
			<form method="POST" action="/spring/admin/adminloginok.action" id="frm">
		
				<input type="text" name="id" required class="form form-control" placeholder="ID">
				<br> <input type="password" name="pw" class="form form-control" required placeholder="PASSWORD">
				<br> <input	type="submit" value="로그인" class="btn btn-primary" style="width:100%;">
		
			</form>
		</div>
	</div>
	
</body>
</html>