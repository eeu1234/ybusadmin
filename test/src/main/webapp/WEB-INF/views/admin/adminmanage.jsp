<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />
<script>
</script>


</head>
<body>
	<h1>관리자 관리</h1>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>부서</th>
			<th>직급</th>
			<th>소속대학</th>
		</tr>
		<c:forEach items="${alist }" var="dto">
		<tr>
			<td>${dto.adminID}</td>
			<td>${dto.adminName}</td>
			<td>${dto.adminDepartment}</td>
			<td>${dto.adminLevel}</td>
			<td>${dto.universityName}</td>
		</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>