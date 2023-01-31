<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>


	
</style>
<script>
<% 
String date = request.getParameter("date");
String location = request.getParameter("menuLocation");
String[] dayOfWeek = {"월", "화", "수", "목", "금"};
%>

$(document).ready(function(){
	<c:if test="${result == 1}">
		alert("수정 완료");
		location.href='/spring/admin/adminFoodDetail.action?menuLocation=<%=location%>&date=<%=date%>';
	</c:if>
	<c:if test="${result == 0}">
		alert("수정 실패");
		history.back();
	</c:if>
});

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<!-- content 몸통부분 -->
	<div id="container">
		<h1 class="menuTitle">공지사항-글쓰기</h1>
	</div>

</body>
</html>