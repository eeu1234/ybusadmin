<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script>


	function badd(){

		location.href="/spring/admin/busInfoAdd.action";
	}

	function cadd(){

		location.href="/spring/admin/busStopCategoryAdd.action";
	}

</script>

</head>
<body>
	<%@include file="/inc/top.jsp" %>

	<h1>버스 카테고리 관리</h1>
	<form method="POST" action="/spring/admin/busStopCategoryMatchOk.action">
	<table class="table table-striped">
		<tr>
			<th>버스 번호</th>
			<th>버스 이름</th>
			<th>이전 분류</th>
			<th>변경할 분류</th>
		</tr>
		<c:forEach items="${blist}" var="bdto">
		<tr>
			<input type="hidden" value="${bdto.busInfoSeq}" id="busInfoSeq${bdto.busInfoSeq}" name="busInfoSeq">
			<td>${bdto.busInfoNum}</td>
			<td>${bdto.busInfoName}</td>
			<td>${bdto.busStopCategory}</td>
			<td>
			<select id="busStopCategory${bdto.busInfoSeq}" name="busStopCategory" class="busStopCategory">
				<option value="-1">카테고리 선택</option>
				<c:forEach items="${clist}" var="cdto">
					<option value="${cdto.busStopCategorySeq}">${cdto.busStopCategory}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		</c:forEach>
	
	</table>
	<input type="submit" class="btn btn-primary" value="확인">
	<input type="button" class="btn btn-primary" value="버스 추가" onclick="badd();">
	<input type="button" class="btn btn-warning" value="카테고리 추가" onclick="cadd();">
	</form>
</body>
</html>