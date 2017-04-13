<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<%@include file="/inc/asset.jsp"%>
<style>
#content{
	position:relative;
	width:100%;
	max-width: 600px;
	margin:0 auto;
	text-align:center;
	margin-top:10%;
}
#tbl1 {
	width: 100%;
	margin: 30px auto;
}

#tbl1 th, #tbl1 td {
	text-align: center;
}

#tbl1 th {
	width: 50%;
}

#tbl1 td {
	width: 50%;
}

#submitBtn{
	width:100%;
	text-align:center;
}
</style>
</style>
</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<div id="content">
		<form action="/spring/admin/adminUpdateOk.action" method="POST">
			<h1>회원정보</h1>
			<table id="tbl1" class="table table-striped">
				<tr>
					<th>아이디</th>
					<td>${dto.adminID}
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.adminName}</td>
				</tr>
				<tr>
					<th>부서</th>
					<td>${dto.adminDepartment}</td>
				</tr>
			</table>
			<div id="submitBtn">
				<input type="button" value="되돌아가기" onclick="history.back();" class="btn btn-default"/>
				<input type="button" value="수정하기" class="btn btn-warning"
					onclick="location.href='/spring/admin/adminUpdate.action?adminID=${adto.adminID}&my=my'" />
			</div>
		</form>
	</div>
	<!-- content -->

</body>
</html>