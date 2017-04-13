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
#showTable{
	margin-top: 30px;
}
</style>

<script>

$().ready(function(){
	
		
});

//버스 seq를 넘겨받아 해당 정보 수정
function updateBusCategoryManage(seq){

	location.href = "/spring/busCategoryManage/updateBusCategoryManage.action?seq="+seq;
	
}

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1>장치와 연결된 버스 리스트</h2>
	<table id="showTable" class="table table-striped">
		<tr>
			<th>번호</th>
			<th>버스번호</th>
			<th>버스명</th>
			<th>대분류(버스종류)</th>
			<th>중분류(노선종류)</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${busInfo}" var="dto">
			<tr>
				<td>${dto.busInfoSeq}</td>
				<td>${dto.busInfoNum}</td>
				<td>${dto.busInfoName}</td>
				<td>${dto.busStopCategory}</td>
				<td>${dto.busStopDetailCategoryName}</td>
				<td>
					<input type="button" class="btn btn-primary" value="수정" onclick="updateBusCategoryManage(${dto.busInfoSeq});">
					<%-- <input type="button" class="btn btn-danger" value="삭제" onclick="deleteBusCategoryManage(${dto.busInfoSeq});"> --%>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>