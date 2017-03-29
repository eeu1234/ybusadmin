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


</head>
<body>
	<h1>관리자 로그인</h1>
	
	<form method="POST" action="/spring/admin/adminloginok.action">
	
		id :<input type="text" name = "id" required><br>
		pw : <input type="password" name ="pw" required><br>
		
		<input type="submit" value = "로그인" class="btn btn-primary">

	</form>
	
	${adminID} ${adminLevel} ${universitySeq}
	
</body>
</html>