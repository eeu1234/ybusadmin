<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/inc/asset.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>


<script>
	$().ready(function(){
		
		$("#univList").click(function(){

			location.href="/spring/university/universityList.action";

		});



		$("#univAdd").click(function(){

			location.href="/spring/university/universityAdd.action";
			
		});


		$("#back").click(function(){

			location.href="/spring/admin/adminMain.action";
			
		});

	});

</script>


</head>
<body>
	<%@include file="/inc/top.jsp"%>
	<h1>대학 관리</h1>
	
	
	<input type="button" id="univList" value="대학목록" class="btn btn-primary">
	<input type="button" id="univAdd" value="대학추가" class="btn btn-primary">
	<input type="button" id="back" value="뒤로가기" class="btn btn-default">
		
	
	
</body>
</html>