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
	<h1>버스 정보 수정</h1>
	<form method="POST" action="/spring/busInfo/busInfoEditOk.action">
		번호 : ${bdto.busInfoSeq}<br>
		
		버스 번호 : <input type="text" name= "busInfoNum" value="${bdto.busInfoNum}"><br>
		버스 이름 : <input type="text" name="busInfoName" value="${bdto.busInfoName}"><br>

		버스 상태 : <input type="radio" name = "busInfoStat" value = "show" <c:if test="${bdto.busInfoStat=='show'}">checked</c:if>>
					<input type="radio" name = "busInfoStat" value = "hide" <c:if test="${bdto.busInfoStat=='hide'}">checked</c:if>>
					
		<input type= "hidden" name="busInfoSeq" value = "${bdto.busInfoSeq}">
		<br>
		<input type="submit" value="작성 완료" class="btn btn-primary">
	</form>
	
</body>
</html>