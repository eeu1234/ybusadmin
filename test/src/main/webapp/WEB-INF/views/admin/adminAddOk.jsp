<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>


<script>
	$(document).ready(function(){
		<c:if test="${result == 1}">
			alert("계정 생성 완료");
			location.href="/spring/admin/adminManage.action";
		</c:if>
		<c:if test="${result == 0}">
			alert("계정 생성 실패");
			history.back();
		</c:if>
	});
	
	
</script>

</head>
<body>
	
	
</body>
</html>