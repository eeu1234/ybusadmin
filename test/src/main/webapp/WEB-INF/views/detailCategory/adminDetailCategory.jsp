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
#searchForm select {
   margin-top: 10px;
}

 #buscategory {
   float: left;
   width: 35%;
   height: 80px;
}

</style>

<script>

$().ready(function(){
	
		
});

//카테로리 추가 함수
function addDetailCategory(){
	location.href = "/spring/admin/detailCategory/addDetailCategory.action";
}

//카테고리 수정 함수
function updateDetailCategory(seq){
	location.href = "/spring/admin/detailCategory/updateDetailCategory.action?seq="+seq;
}

//카테고리 삭제 함수
function deleteDetailCategory(seq){
	if(confirm("삭제하시겠습니까?")){
		location.href = "/spring/admin/detailCategory/deleteDetailCategory.action?seq="+seq;
	}
}
</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1>${adto.universityName} 정류장 세부 카테고리 관리</h1>
	
	<h2>활성화된 카테고리</h2>
	<table id="showTable" class="table table-striped">
		<tr>
			<th>번호</th>
			<th>버스분류</th>
			<th>카테고리 명</th>
			<th>인터벌 시간</th>
			<th>인터벌 거리</th>
			<th>상태</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${showDetailCategoryList}" var="dto">
			<tr>
				<td>${dto.busStopDetailCategorySeq}</td>
				<td>${dto.busStopCategory}</td>
				<td>${dto.busStopDetailCategoryName}</td>
				<td>${dto.busStopDetailCategoryInterval}</td>
				<td>${dto.busStopDetailCategoryIntervalDistance}</td>
				<td>${dto.busStopDetailCategoryStat}</td>
				<td>
					<input type="button" class="btn btn-primary" value="수정" onclick="updateDetailCategory(${dto.busStopDetailCategorySeq});">
					<input type="button" class="btn btn-danger" value="삭제" onclick="deleteDetailCategory(${dto.busStopDetailCategorySeq});">
				</td>
			</tr>
		</c:forEach>
	</table>
	<h2>비활성화된 카테고리</h2>
	<table id="hideTable" class="table table-striped">
		<tr>
			<th>번호</th>
			<th>버스분류</th>
			<th>카테고리 명</th>
			<th>인터벌 시간</th>
			<th>인터벌 거리</th>
			<th>상태</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${hideDetailCategoryList}" var="dto">
			<tr>
				<td>${dto.busStopDetailCategorySeq}</td>
				<td>${dto.busStopCategory}</td>
				<td>${dto.busStopDetailCategoryName}</td>
				<td>${dto.busStopDetailCategoryInterval}</td>
				<td>${dto.busStopDetailCategoryIntervalDistance}</td>
				<td>${dto.busStopDetailCategoryStat}</td>
				<td>
					<input type="button" class="btn btn-primary" value="수정" onclick="updateDetailCategory(${dto.busStopDetailCategorySeq});">
					<input type="button" class="btn btn-danger" value="삭제" onclick="deleteDetailCategory(${dto.busStopDetailCategorySeq});">
				</td>
			</tr>
		</c:forEach>
	</table>
	<input type="submit" class="btn btn-primary" value="확인"> 
	<input type="button" class="btn btn-primary" value="정류장 세부 카테고리 추가" onclick="addDetailCategory();">
</body>
</html>