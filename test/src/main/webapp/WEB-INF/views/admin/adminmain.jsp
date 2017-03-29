<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />

<script>

	function universitycrud(){
		location.href = "/spring/admin/universitycrud.action"
	}

</script>
</head>
<body>

	<h1>관리자 메인 화면</h1>
	
	<a href="/spring/admin/universitycrud.action">대학 관리</a><br>
	<a href="/spring/admin/adminmanage.action">계정 관리</a><br>
	<a href="/spring/admin/buscategory.action">버스 분류 관리</a><br>
	
	<a href="/spring/admin/adminlogout.action">로그아웃</a><br>
	
</body>
</html>