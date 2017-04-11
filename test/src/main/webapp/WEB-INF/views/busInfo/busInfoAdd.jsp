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

	$().ready(function(){
		var n = 2;

		$("#addBus").click(function (){
			tmphtml='<tr><td><input type="text" id="busInfoNum'+n+'" name ="busInfoNum"></td><td><input type="text" id="busInfoName'+n+'" name ="busInfoName"></td><td><select id="busStopCategory'+n+'" name="busStopCategory" class="busStopCategory"><option value="-1">카테고리 선택</option><c:forEach items="${clist}" var="cdto"><option value="${cdto.busStopCategorySeq}">${cdto.busStopCategory}</option></c:forEach></select></td></tr>';
			$("#tblBus").append(tmphtml);
			n++;
		});
			
		
	});



</script>


</head>
<body>
	<%@include file="/inc/top.jsp" %>
	<h1>버스 추가</h1>
	
	<form method = "POST" action="/spring/busInfo/busInfoAddOk.action">
		<table id="tblBus" class="table table-striped">
			
			<tr>
				<th>버스 번호</th>
				<th>버스 이름</th>
				<th>버스 카테고리</th>
			<tr>
			
			<tr>
				<td><input type="text" id="busInfoNum1" name ="busInfoNum"></td>
				<td><input type="text" id="busInfoName1" name ="busInfoName"></td>
				<td>
					<select id="busStopCategory1" name="busStopCategory" class="busStopCategory">
					<option value="-1">카테고리 선택</option>
					<c:forEach items="${clist}" var="cdto">
						<option value="${cdto.busStopCategorySeq}">${cdto.busStopCategory}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
				
			
		</table>
	<input type="submit" value="확인" class="btn btn-primary">
	<input type="button" value="추가" class="btn btn-primary" id = "addBus">
	</form>
	
</body>
</html>