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
	
		
	});
	


</script>


</head>
<body>
	<%@include file="/inc/top.jsp" %>
	<h1>디바이스 리스트</h1>
	<form method="POST" action="/spring/admin/busStopCategoryEditOk.action">
		학교 번호 : ${bscdto.busStopCategorySeq}<br>
		학교 이름 : ${bscdto.universityName}<br>
		노선 이름 : <input type="text" name="busStopCategory" value="${bscdto.busStopCategory}"><br>

		노선 상태 : <input type="radio" name = "busStopCategoryStat" value = "show" <c:if test="${bscdto.busStopCategoryStat=='show'}">checked</c:if>>
					<input type="radio" name = "busStopCategoryStat" value = "hide" <c:if test="${bscdto.busStopCategoryStat=='hide'}">checked</c:if>>
					
		<input type= "hidden" name="busStopCategorySeq" value = "${bscdto.busStopCategorySeq }">
		<br>
		<input type="submit" value="작성 완료" class="btn btn-primary">
	</form>
	
</body>
</html>