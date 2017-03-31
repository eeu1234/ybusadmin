<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp" %>
</head>
<body>
	<!-- content 몸통부분 -->
	<div id="content">
		<form action="/spring/admin/adminupdateok.action" method="POST">
			<h1>계정 수정</h1>
			<table>
				<tr>
					<th>아이디</th>
					<td>${dto.adminID}
						<input type="hidden" value="${dto.adminID}" name="adminID"/>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" value="${dto.adminPassword}" id="pw1"/></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" value="${dto.adminPassword}" id="pw2" name="adminPassword"/></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" value="${dto.adminName}" name="adminName"/></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" value="${dto.adminDepartment}" name="adminDepartment"/></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" value="${dto.adminLevel}" name="adminLevel"/></td>
				</tr>
				<tr>
					<td rowspan="2">
						<input type="submit" value="수정하기"/>
						<input type="button" value="되돌아가기" onclick="history.back();"/>
					</td>
				</tr>
			</table>
		</form>
	</div><!-- content -->
	
</body>
</html>