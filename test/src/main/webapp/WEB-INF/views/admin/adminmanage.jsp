<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp" %>
<style>

	#tbl1 { width: 650px; margin: 30px auto;}
	#tbl1 th, #tbl1 td { text-align: center; }
	
	#tbl1 td:nth-child(2) { text-align: left; }
	
	#tbl1 th:nth-child(1) { width: 120px;}
	#tbl1 th:nth-child(2) { width: 80px; }
	#tbl1 th:nth-child(3) { width: 150px; }
	#tbl1 th:nth-child(4) { width: 50px; }
	#tbl1 th:nth-child(5) { width: 150px; }
	#tbl1 th:nth-child(6) { width: 100px; }
	
</style>
<script>

	function update(adminID){
		location.href="/spring/admin/adminupdate?adminID="+adminID;
	}

</script>

</head>
<body>
	<h1>관리자 관리</h1>
	<table id="tbl1" class="table table-striped">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>부서</th>
			<th>직급</th>
			<th>소속대학</th>
			<th>관리</th>
		</tr>
		<c:if test="${empty alist || alist.size() == 0}">
			<tr>
				<td colspan="5">게시물이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${alist }" var="dto">
		<tr>
			<td>${dto.adminID}</td>
			<td>${dto.adminName}</td>
			<td>${dto.adminDepartment}</td>
			<td>${dto.adminLevel}</td>
			<td>${dto.universityName}</td>
			<td><input type="button" value="수정" onclick="update(${dto.adminID})"/></td>
		</tr>
		</c:forEach>
	</table>
	<div id="pagebar" style="text-align: center;">
		${pagebar}
	</div>
	
	
</body>
</html>