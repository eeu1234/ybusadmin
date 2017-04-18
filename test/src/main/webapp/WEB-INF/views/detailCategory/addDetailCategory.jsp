<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css">
<style>
html, body {
   width: 100%;
   height: 100%;
   margin: 0 auto;
   padding: 0;
}
#addTable{
	margin-top: 30px;
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



</style>

<script>

$().ready(function(){
	
});

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1 class="menuTitle">중분류(노선종류) 추가 페이지</h1>
	
	<form method="POST" action="/spring/detailCategory/addDetailCategoryOK.action">
		<table id="addTable" class="table table-striped">
			<tr>
				<th>구분</th>
				<th>내용</th>
			</tr>
			<tr>
				<td>버스분류</td>
				<td>
					<select id="categorySel" name="categorySel" class="form-control">
						<option value="-1">버스분류를 선택해 주세요</option>
						<c:forEach items="${categoryList}" var="dto">
							<option value="${dto.busStopCategorySeq}">${dto.busStopCategory}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>상세분류 명</td>
				<td>
					<input type="text" class="form-control" id="detailCategoryName" name="detailCategoryName" placeholder="상세분류명을 입력해주세요">
				</td>
			</tr>
			<!-- <tr>
				<td>인터벌 타임</td>
				<td>
					<input type="number" class="form-control"  id="interverTime" name="interverTime" min="0" max="300000">
				</td>
			</tr>
			<tr>
				<td>인터벌 거리</td>
				<td>
					<input type="number" class="form-control"  id="interverDistance" name="interverDistance" min="0" max="1000">
				</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>
					<select id="stat" name="stat" class="form-control">
						<option value="-1">상태를 선택해주세요</option>
						<option value="show">show</option>
						<option value="hide">hide</option>
					</select>
				</td>
			</tr> -->
		</table>
		<input type="submit" class="btn btn-primary" value="추가하기" style="float: right;"> 
		<input type="button" class="btn btn-default" value="돌아가기" onclick="history.back();" style="float: right;margin-right: 10px;">
	</form>
</body>
</html>