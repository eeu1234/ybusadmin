<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
	
		$("#deviceList").click(function(){
			location.href="/spring/admin/deviceNullList.action";

		});

		$("#deviceBack").click(function(){
			location.href="/spring/admin/adminMain.action";
		});

		
	});

</script>
</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1>기기 관리</h1>
	
	<input type="button" id="deviceList" value="빈 기기 목록" class="btn btn-primary">
	<input type="button" id="deviceBUs" value="디바이스-버스 매칭" class="btn btn-primary">
	<input type="button" id="deviceBack" value="뒤로 가기" class="btn btn-default">
</body>
</html>