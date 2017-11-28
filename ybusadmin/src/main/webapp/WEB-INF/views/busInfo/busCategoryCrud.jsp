<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>대분류(버스 정류장 목록)</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
#tblBusInfo{

	margin-top: 30px;
}
</style>
<script>


	function badd(){

		location.href="/spring/busInfo/busInfoAdd.action";
	}


	function busEdit(seq){
		location.href="/spring/busInfo/busInfoEdit.action?seq="+seq;
	}

	function busDelete(seq){
		location.href="/spring/busInfo/busInfoDeleteOk.action?seq="+seq;
	}

</script>

</head>
<body>
	<%@include file="/inc/top.jsp" %>

	<form method="POST" action="/spring/admin/busStopCategoryMatchOk.action">
	<h1 class = "menuTitle">활성화된 버스 정보 관리</h1>
	<table id = "tblShowBusInfo" class="table table-striped">
		<tr>
			<th>버스 번호</th>
			<th>버스 이름</th>
			<th>이전 분류</th>
			<th>버스 상태</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${blist}" var="bdto">
			<c:if test="${bdto.busInfoStat=='show'}">
			
			<tr>
				<input type="hidden" value="${bdto.busInfoSeq}" id="busInfoSeq${bdto.busInfoSeq}" name="busInfoSeq">
				<td>${bdto.busInfoNum}</td>
				<td>${bdto.busInfoName}</td>
				<td>${bdto.busStopCategory}</td>
				<td>${bdto.busInfoStat}</td>
				
				<td>
				<input type="button" class="btn btn-warning" value="수정" onclick="busEdit(${bdto.busInfoSeq});">
				<input type="button" class="btn btn-danger" value="삭제" onclick="busDelete(${bdto.busInfoSeq});">
				
				</td>
			</tr>
			</c:if>
		</c:forEach>
		
	</table>
	<h1 class = "menuTitle">비활성화된 버스 정보 관리</h1>
	<table id = "tblHideBusInfo" class="table table-striped">
		<tr>
			<th>버스 번호</th>
			<th>버스 이름</th>
			<th>이전 분류</th>
			<th>버스 상태</th>
			<th>관리</th>
		</tr>
		<c:forEach items="${blist}" var="bdto">
			<c:if test="${bdto.busInfoStat=='hide'}">
			
			<tr>
				<input type="hidden" value="${bdto.busInfoSeq}" id="busInfoSeq${bdto.busInfoSeq}" name="busInfoSeq">
				<td>${bdto.busInfoNum}</td>
				<td>${bdto.busInfoName}</td>
				<td>${bdto.busStopCategory}</td>
				<td>${bdto.busInfoStat}</td>
				
				<td>
				<input type="button" class="btn btn-warning" value="수정" onclick="busEdit(${bdto.busInfoSeq});">
				<input type="button" class="btn btn-danger" value="삭제" onclick="busDelete(${bdto.busInfoSeq});">
				
				</td>
			</tr>
			</c:if>
		</c:forEach>
		
	</table>
	
	<div class="btnForm">
	<input type="button" class="btn btn-primary" value="버스 추가" onclick="badd();">
	</div>
	</form>
</body>
</html>