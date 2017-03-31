<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />

<script>
	$(document).ready(function(){
		<c:if test="${result == 1}">
			alert("수정 완료");
			location.href="/spring/admin/adminmanage.action";
		</c:if>
		<c:if test="${result == 0}">
			alert("수정 실패");
			history.back();
		</c:if>
	});
	
	
</script>

</head>
<body>
	
	
</body>
</html>