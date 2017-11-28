<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<script>

	$(document).ready(function(){
		<c:if test="${result == 0}">
			alert("삭제 실패");
			history.back();
		</c:if>
		<c:if test="${result == 1}">
			alert("삭제 완료");
			$("#addok").submit();
		</c:if>
	});
	
</script>


</head>
<body>
	<form id="addok" action="/spring/admin/adminBusTimeManage.action" method="GET">
		<input type="hidden" name="busStopCategorySeq" value="${Search.busStopCategorySeq}"/>
		<input type="hidden" name="busStopDetailCategorySeq" value="${Search.busStopDetailCategorySeq}"/>
		<input type="hidden" name="weekDays" value="${Search.weekDays}"/>
	</form>
</body>
</html>