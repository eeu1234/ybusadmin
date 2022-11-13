<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>YBUS :: 학식메뉴</title>
 <link rel="stylesheet" type="text/css" href="/spring/css/bacisTheme.css" />
<style>
#universitySearch{
	width:50%;
	margin:0 auto;
	margin-top:10%;	
}
#universitySel{
	float:left;
	width:70%;
}
</style>

</head>

<body>

	<%@include file="/inc/top.jsp"%>
	
	<h1 class="menuTitle">학식 정보 관리</h1>
	<select id="category" class="form-control" style="float:right;width:200px; height:50px; margin:15px;">인성관</select>	
	<table id="tbl1" class="table table-striped">
		
		<tr>
			<th>글번호</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>최종 수정일</th>
			<th>수정자</th>
	</table>
	
	
	<!-- content 몸통부분 -->
	
</body>
</html>