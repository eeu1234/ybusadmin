<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css">

<style>
#universityName{
	width : 300px;
}
</style>
<script>
	$().ready(function(){

		


	});

	function add(seq) {
		if(confirm("등록하시겠습니까?")){
			location.href="/spring/device/deviceAddUniv.action?seq="+seq +"&universityName="+$("#universityName").val();
		}

	}


</script>

</head>
<body>

	<%@include file="/inc/top.jsp"%>
	<div class = "mainTitle"><h1>배치가능한 디바이스 리스트</h1></div>
	<table id = "tblNullDevice" class="table table-striped">
		<tr>
			<th>기기번호</th>
			<th>기기명</th>
			<th>전화번호</th>
			<th>학교명</th>
			<th>관리</th>
		</tr>
	<c:forEach items="${dlist}" var ="ddto">
		<tr>
			<td>${ddto.deviceSeq}</td>
			<td>${ddto.deviceModel}</td>
			<td>${ddto.deviceTel}</td>
			<td>
			<select id="universityName" name="universityName" class="form-control">
				<c:forEach items="${ulist}" var="udto">
				<option>${udto.universityName}</option><br>
				</c:forEach>
				
			</select>
			</td>
			<td>
			<div id="btnForm"><input type="button" id="sel" value="적용" onclick="add(${ddto.deviceSeq});" class="btn btn-primary" ></div>
			</td>
		</tr>
		
	</c:forEach>
	</table>
</body>
</html>