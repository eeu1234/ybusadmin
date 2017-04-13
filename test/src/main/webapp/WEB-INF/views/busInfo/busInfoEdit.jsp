<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
html, body {
   width: 100%;
   height: 100%;
   margin: 0 auto;
   padding: 0;
}
#searchForm {
   border: 0px solid gray;
   width: 90%;
   height: auto;
   margin: 0 auto;
}
#searchForm select {
   margin-top: 10px;
}

 #buscategory {
   float: left;
   width: 35%;
   height: 80px;
}
#tbl{
	margin-top: 30px;
}
</style>
<script>
	
	$().ready(function(){
	
		
	});
	


</script>


</head>
<body>
	<%@include file="/inc/top.jsp" %>
	<
	<h1 class = "menuTitle">버스 정보 수정 페이지</h1>
	
	<form method="POST" action="/spring/busInfo/busInfoEditOk.action">
		<table id="tbl" class="table table-striped">
			<tr>
				<th>구분</th>
				<th>내용</th>
			</tr>
			<tr>
				<td>번호</td>
				<td>${bdto.busInfoSeq}</td>
			</tr>
			<tr>
				<td>버스 번호</td>
				<td><input type="text" name= "busInfoNum" value="${bdto.busInfoNum}" class="form-control"></td>
			</tr>
			<tr>
				<td>버스 이름</td>
				<td><input type="text" name="busInfoName" value="${bdto.busInfoName}" class="form-control"></td>
			</tr>
			<tr>
				<td>버스 상태</td>
				<td>
					<select id="busInfoStat" name="busInfoStat" class="form-control">
					<c:if test="${bdto.busInfoStat=='show'}">
						<option value = "show">show</option>
					</c:if>
					<c:if test="${bdto.busInfoStat=='hide'}">
						<option value = "hide">hide</option>
					</c:if>
					</select>
				</td>
			</tr>
		</table>
					
		<input type= "hidden" name="busInfoSeq" value = "${bdto.busInfoSeq}">
		<br>
		<input type="submit" value="수정" class="btn btn-primary">
		<input type="button" value="돌아가기" class="btn btn-primary" onclick="history.back();">
	</form>
	
</body>
</html>