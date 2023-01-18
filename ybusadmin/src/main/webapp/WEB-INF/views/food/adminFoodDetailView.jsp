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
#col{
	float: left; 
	height: 100%; 
	text-align:center;
	border: 1px solid;
}

#row{
	margin: 0 auto;
	height: 24%;
	border: 1px solid;
	display: flex;
	justify-content: center;
	align-items: center;
	
}


</style>

</head>

<body>

	<%@include file="/inc/top.jsp"%>
	<% 
	String date = request.getParameter("date");
	String location = request.getParameter("menuLocation");
	String[] dayOfWeek = {"월", "화", "수", "목", "금"};
	%>
	
	<h1 class="menuTitle">학식 정보 관리</h1>
	<h1 id="category" style="float:right; width:200px; height:50px; margin:15px; text-align:center;"><%= location %></h1>	
	
	<c:if test="${empty foodInfo[0] || foodInfo[0].size() == 0}">
		
		<h1>게시물이 존재하지 않습니다.</h1>
		<form method="GET" action="/spring/admin/adminFoodInsert.action">
							<td>
							<input type="hidden" value="<%= location %>" name="menuLocation">
							<input type="hidden" value="<%= date%>" name="date">
							<input style="float:right; width:120px; height:50px; margin:10px; font-size:30px; font-weight: 500;" type="submit" value="추가">
							</td>
						</form>
						<button style="float:right; width:120px; height:50px; margin:10px;"><h2 style="margin:5px;" onclick="location.href='/spring/admin/adminFoodList.action?menuLocation=<%= location %>';">목록</h2></button>
	
	 	</c:if>
	
		    
	<c:if test="${foodInfo[0].size() != 0}">
		<div style="float: left; width: 99%; margin: 5px;">
			<div id="col" style="width: 10%;">
				
				<h3 id="row" style="height:4%">코너/날짜</h3>
					<div id="row" style="background-color: #5580A2;">
						<h3 style="color: #EFEFEF">코너A</h3>
					</div>
					<div id="row" style="background-color: #5580A2;">
						<h3 style="color: #EFEFEF">코너B</h1>
					</div>
					<div id="row" style="background-color: #5580A2;">
						<h3 style="color: #EFEFEF">코너C</h1>
					</div>
					<div id="row" style="background-color: #5580A2;">
						<h3 style="color: #EFEFEF">코너D</h1>
					</div>
					
			</div>
			
			<c:forEach items="${foodInfo}" var="dto" varStatus="var">
			<div id="col" style="width:18%;">
				<h3 id="row" style="height:4%;">${dto[0].date}
				<c:if test="${dto[0].dayOfWeek eq '2'}">(월)</c:if>
				<c:if test="${dto[0].dayOfWeek eq '3'}">(화)</c:if>
				<c:if test="${dto[0].dayOfWeek eq '4'}">(수)</c:if>
				<c:if test="${dto[0].dayOfWeek eq '5'}">(목)</c:if>
				<c:if test="${dto[0].dayOfWeek eq '6'}">(금)</c:if>
				</h3>
					
						<c:forEach items="${dto}" var="food" varStatus="var">
						<div id="row" style="flex-direction: column;">
							<h4>${food.menu1}</h4>
							<h4>${food.menu2}</h4>
							<h4>${food.menu3}</h4>
							<h4>${food.menu4}</h4>
							<h4>${food.menu5}</h4>
						</div>
						</c:forEach>
					
			</div>
			</c:forEach>
		</div>
		<form method="GET" action="/spring/admin/adminFoodUpdate.action">
							<td>
							<input type="hidden" value="<%= location %>" name="menuLocation">
							<input type="hidden" value="<%= date%>" name="date">
							<input style="float:right; width:120px; height:50px; margin:10px; font-size:30px; font-weight: 500;" type="submit" value="수정">
							</td>
		</form>
		<button style="float:right; width:120px; height:50px; margin:10px;"><h2 style="margin:5px;" onclick="location.href='/spring/admin/adminFoodList.action?menuLocation=<%= location %>';">목록</h2></button>
		</c:if>
		
	
	
	
	
	
	
			
	
	
	<!-- content 몸통부분 -->

<script>
function back(){
	history.back()
}
</script>
</body>
</html>