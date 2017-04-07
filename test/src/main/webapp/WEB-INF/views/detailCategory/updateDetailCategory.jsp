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



</style>

<script>

$().ready(function(){
	$("#frm").submit(function(){
		if($("#categorySel").val() == -1){
			alert("버스카테고리를 선택해주세요");
			$("#categorySel").focus();
			return false;
		}
		if($("#detailCategoryName").val() == ""){
			alert("카테고리명을 입력해주세요");
			$("#detailCategoryName").focus();
			return false;
		}
		if($("#interverTime").val() == ""){
			alert("인터벌타임을 입력해주세요(0 ~ 300000사이값)");
			$("#interverTime").focus();
			return false;
		}
		if($("#interverDistance").val() == ""){
			alert("인터벌거리를 입력해주세요");
			$("#interverDistance").focus();
			return false;
		}
		if($("#stat").val() == -1){
			alert("상태를 입력해주세요");
			$("#stat").focus();
			return false;
		}
		
	});
});

</script>

</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1>${adto.universityName} 정류장 세부 카테고리 수정 페이지</h1>
	
	<form id="frm" method="POST" action="/spring/admin/detailCategory/updateDetailCategoryOK.action">
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
					<input type="text" class="form-control" id="detailCategoryName" name="detailCategoryName" placeholder="상세분류명을 입력해주세요" value="${getDetailCategory.busStopDetailCategoryName }">
				</td>
			</tr>
			<tr>
				<td>인터벌 타임(1000 = 1초)</td>
				<td>
					<input type="number" class="form-control"  id="interverTime" name="interverTime" min="0" max="300000" value="${getDetailCategory.busStopDetailCategoryInterval }">
				</td>
			</tr>
			<tr>
				<td>인터벌 거리(1 = 1미터)</td>
				<td>
					<input type="number" class="form-control"  id="interverDistance" name="interverDistance" min="0" max="1000" value="${getDetailCategory.busStopDetailCategoryIntervalDistance }">
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
			</tr>
		</table>
		<input type="submit" class="btn btn-primary" value="수정하기"> 
		<input type="button" class="btn btn-primary" value="돌아가기" onclick="history.back();">
		<input type="hidden" name="seq" value="${getDetailCategory.busStopDetailCategorySeq}">
	</form>
</body>
</html>