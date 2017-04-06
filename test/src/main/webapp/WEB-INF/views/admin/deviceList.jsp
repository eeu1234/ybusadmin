<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">

<title>CAMBUS::기기 할당</title>
<link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<script>
	$().ready(function(){

		


	});

	function add(seq) {
		if(confirm("등록하시겠습니까?")){
			location.href="/spring/admin/deviceAddUniv.action?seq="+seq +"&universityName="+$("#universityName").val();
		}

	}


</script>
<style>

#tbl1 {
	width: 100%;
	margin: 30px auto;
	line-height:50px;
}

#tbl1 th, #tbl1 td {
	text-align: center;
}

#tbl1 th {
	width: 20%;
}

#tbl1 td {
	width: 20%;
}
</style>
</head>
<body>

	<%@include file="/inc/top.jsp"%>
	<h1 class="menuTitle">빈 디바이스 리스트</h1>
	<table id="tbl1" class="table-striped">
	<c:forEach items="${dlist}" var ="ddto">
	<tr>
		<th>기기번호</th>
		<th>기기명</th>
		<th>전화번호</th>
		<th>학교명</th>
		<th>선 택</th>
	</tr>
	<tr>
		<td>${ddto.deviceSeq}</td>
		<td>${ddto.deviceModel}</td>
		<td>${ddto.deviceTel}</td>
		<td><select id="universityName" name="universityName" class="form-control">
			<c:forEach items="${ulist}" var="udto">
			<option>${udto.universityName}</option><br>
			</c:forEach>
		</select></td>
		<td>	
				<input type="button" class="btn btn-primary" id="sel" value="적용" onclick="add(${ddto.deviceSeq});" >
		</td>
	</tr>
	
		
		
		
	
	</c:forEach>
	</table>
</body>
</html>