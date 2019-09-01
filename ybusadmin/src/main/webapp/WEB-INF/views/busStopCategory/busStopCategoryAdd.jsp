<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
#busStopCategory {
	width: 300px;
	display: inline;
}

#tblCategory {
	margin-top: 30px;
}
</style>

<script>
	$().ready(function(){

		
		
	});

	function cEdit(seq){

		location.href="/spring/busStopCategory/busStopCategoryEdit.action?seq=" +seq;
	}
	
	function cDelete(seq){
		if(confirm("삭제하겠습니까?")){
			location.href = "/spring/busStopCategory/busStopCategoryDeleteOk.action?seq="+seq;
		}
	}
</script>


</head>
<body>
	<%@include file="/inc/top.jsp"%>

	<h1 class="menuTitle">대분류(버스종류) 관리</h1>

	<table id="tblCategory" name="tblCategory" class="table table-striped">
		<tr>
			<th>노선 번호</th>
			<th>노선 이름</th>
			<th>노선 상태</th>
			<th>소속 학교</th>
			<th class="groupkey">그룹키</th>
			<th class="editdie"></th>

		</tr>
		<c:forEach items="${clist}" var="cdto">
			<tr>
				<td>${cdto.busStopCategorySeq}</td>
				<input type="hidden" value="${cdto.busStopCategorySeq}"
					name="busStopCategorySeq"
					id="busStopCategorySeq${cdto.busStopCategorySeq}">
				<td>${cdto.busStopCategory}</td>
				<td>${cdto.busStopCategoryStat}</td>
				<td>${cdto.universityName}</td>
				<td>${cdto.groupbusHashkey}</td>
				<td><input type="button"
					id="categoryEdit${cdto.busStopCategorySeq}" value="수정"
					class="btn btn-warning"
					onclick="cEdit(${cdto.busStopCategorySeq});"> <input
					type="button" id="categoryDelete${cdto.busStopCategorySeq}"
					value="삭제" class="btn btn-danger"
					onclick="cDelete(${cdto.busStopCategorySeq});"></td>
			</tr>
		</c:forEach>
	</table>
	<div style="float: right">
		<form method="POST"
			action="/spring/busStopCategory/busStopCategoryAddOk.action">
			<input type="text" id="busStopCategory" name="busStopCategory"
				class="form-control" placeholder="추가할 대분류명을 입력하세요" required> <input
				type="submit" id="addCategory" value="카테고리 추가"
				class="btn btn-primary">
		</form>
	</div>

</body>
</html>