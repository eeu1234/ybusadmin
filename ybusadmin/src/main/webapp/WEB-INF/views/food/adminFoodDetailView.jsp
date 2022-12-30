<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>CAMBUS :: 대학선택</title>
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
table tr th{
	text-align: center;
}

</style>

</head>

<body>

	<%@include file="/inc/top.jsp"%>
	
	<h1 class="menuTitle">학식 정보 관리</h1>
	<h1 id="category" style="float:left; width:200px; height:50px; margin:15px;">인성관</h1>	
	<table id="tbl1" class="table table-striped" style="text-align:center;">
		<tr>
			<th class="centerd">코너</th>
			<th>A</th>
			<th>B</th>
			<th>C</th>
			<th>D</th>
		</tr>
		
		<tr>
			<th style="vertical-align: middle;">${dto.date}</th>
			<c:forEach items="${foodInfo}" var="dto" varStatus="stat">
			
			<th>
				<div>
				
					<a>${dto.menu1}</a><br>
					<a>${dto.menu2}</a><br>
					<a>${dto.menu3}</a><br>
					<a>${dto.menu4}</a><br>
					<a>${dto.menu5}</a>
				
				</div>
			</th>
			</c:forEach>
		</tr>
		
			
		</tr>
	</table>
	
	<button style="float:right; width:200px; height:50px; margin:10px;"><h1 style="margin:0px;" onclick="hisory.back()">목록</h1></button>
	<button style="float:right; width:200px; height:50px; margin:10px;"><h1 style="margin:0px;">수정</h1></button>
			
	
	
	<!-- content 몸통부분 -->
	
</body>
</html>