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
#container1 {
	margin: 20%;
}

#selbox {
	
}

</style>

<script>

	$(document).ready(function(){
		
		$("#menuLocation").change(function(){
			$("#location").submit();
		});
		// http://localhost:7070/spring/admin/spring/admin/adminFoodList.action?menuLocation=%EC%9D%B8%EC%84%B1%EA%B4%80
	})

	function move(){

		var loc = $(this).val();
		location.href="/spring/admin/adminFoodList.action=menuLocation"+loc;

	}
	
</script>
</head>

<body>

	<%@include file="/inc/top.jsp"%>
	
	<h1 class="menuTitle"> 학식 정보 관리 </h1>
	
	
	
	<div id="container1">
		<form id="location" action="/spring/admin/adminFoodList.action" method="GET">
			<select name="menuLocation" id="menuLocation" class="form-control">
				<option value="9999">식당을 선택해주세요</option>
	 			<option value="인성관" onclik="move();">인성관</option>
	 			<option value="환과대">환과대</option>
	 			<option value="생활관">생활관</option>
			</select>
		</form>
		
		
		<!-- <button style="float:right; margin-top:10px"> 선택 </button> -->
	
	</div>
	

</body>
</html>